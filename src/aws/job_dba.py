import json
import pymysql as mysql
from datetime import datetime
from dotenv import load_dotenv
import pytz
import os

def cargar_configuracion():
    """Carga la configuración de las variables de entorno"""
    load_dotenv()
    return {
        "host": os.environ.get("DB_HOST"),
        "user": os.environ.get("DB_USER"),
        "password": os.environ.get("DB_PASSWORD"),
        "database": os.environ.get("DB_DATABASE"),
    }

def crear_conexion(config):
    """Crea una conexión a la base de datos"""
    return mysql.connect(
        host=config["host"],
        user=config["user"],
        password=config["password"],
        database=config["database"],
        autocommit=False,
        cursorclass=mysql.cursors.DictCursor
    )

def obtener_parametro(cursor, parameter_id):
    """Obtiene un parámetro desde la base de datos"""
    try:
        cursor.execute("SET @valor_salida = NULL")
        cursor.execute(f"CALL sp_ObtenerParametro({parameter_id}, @valor_salida)")
        cursor.execute("SELECT @valor_salida")
        resultado = cursor.fetchone()
        return resultado['@valor_salida'] if resultado else None
    except mysql.Error as err:
        print(f"Error al obtener parámetro {parameter_id}: {err}")
        return None

def obtener_fecha_actual():
    """Obtiene la fecha y hora actual en la zona horaria de Guayaquil"""
    return datetime.now(tz=pytz.timezone("America/Guayaquil"))

def parsear_horarios_ejecucion(json_parametro):
    """Convierte el JSON de parámetro en estructura de datos Python"""
    try:
        data_param = json.loads(json_parametro)
        return data_param["proceso"]["horarios"]
    except (json.JSONDecodeError, KeyError) as e:
        print(f"Error al parsear JSON de horarios: {e}")
        return None

def evaluar_horario(horario, hora_actual, dia_actual, dia_mes_actual):
    """Evalúa si un horario debe ejecutarse en este momento"""
    
    # Extraer datos del horario
    hora_ejecucion = horario.get("hora", "")
    frecuencia = horario.get("frecuencia", "")
    parametros = horario.get("parametros", {})
    dia_semana = parametros.get("dia_semana", "").lower() if parametros.get("dia_semana") else ""
    dia_mes = parametros.get("dia_mes", None)
    
    # Convertir dia_mes a entero si existe
    if dia_mes is not None:
        try:
            dia_mes = int(dia_mes)
        except (ValueError, TypeError):
            print(f"Error: valor de día del mes inválido: {dia_mes}")
            return False, None
    
    # Evaluar condiciones según frecuencia
    match_encontrado = False
    
    if frecuencia == "diaria" and hora_actual == hora_ejecucion:
        match_encontrado = True
        print(f"Coincidencia en horario diario: {hora_ejecucion}")
        
    elif frecuencia == "semanal" and dia_semana and dia_semana == dia_actual and hora_actual == hora_ejecucion:
        match_encontrado = True
        print(f"Coincidencia en horario semanal: {dia_semana} a las {hora_ejecucion}")
        
    elif frecuencia == "mensual" and dia_mes and dia_mes == dia_mes_actual and hora_actual == hora_ejecucion:
        match_encontrado = True
        print(f"Coincidencia en horario mensual: día {dia_mes} a las {hora_ejecucion}")
    
    # Si encontramos coincidencia, devolver detalles
    if match_encontrado:
        horario_seleccionado = {
            "frecuencia": frecuencia,
            "hora": hora_ejecucion,
            "dia_semana": dia_semana if frecuencia == "semanal" else None,
            "dia_mes": dia_mes if frecuencia == "mensual" else None
        }
        return True, horario_seleccionado
    
    return False, None

def ejecutar_proceso(cursor, horario_seleccionado, hora_actual):
    """Ejecuta el proceso principal según el horario seleccionado"""
    print(f"Ejecutando proceso de débitos a las {hora_actual} ({horario_seleccionado['frecuencia']})")
    cursor.execute("SET @batch_id = NULL")
    cursor.execute("CALL sp_insertar_batch_proceso(@batch_id);")
    cursor.execute("SELECT @batch_id")
    batch_id = cursor.fetchone()['@batch_id']
    print(f"Batch ID: {batch_id}")
    
    if not batch_id:
        print("Error al crear el batch de proceso.")
        return
    
    #llamada al procedimiento principal
    cursor.execute("SET @codigo=NULL")
    cursor.execute("SET @mensaje=NULL")
    cursor.execute(f"CALL pa_mdp_i_debitos_pendientes('{batch_id}', @codigo, @mensaje)")
    cursor.execute("SELECT @codigo,@mensaje")
    resultado = cursor.fetchone()
    codigo = resultado['@codigo']
    mensaje = resultado['@mensaje']
    print(f"Resultado del proceso: {codigo} - {mensaje}")
    
    # Aquí implementarías la lógica del proceso
    # ...
    pass

def proceso_principal():
    """Función principal que coordina el flujo del programa"""
    config = cargar_configuracion()
    conexion = None
    cursor = None
    
    try:
        conexion = crear_conexion(config)
        cursor = conexion.cursor()
        
        # Obtener datos necesarios
        fecha_proceso = obtener_fecha_actual()
        parameter_id = 141
        valor_parametro = obtener_parametro(cursor, parameter_id)
        
        if not valor_parametro:
            print(f"Error: no se encontró el parámetro con ID {parameter_id}.")
            return
            
        print(f"Valor del parámetro obtenido: {valor_parametro}")
        
        # Parsear los horarios
        horarios_ejecucion = parsear_horarios_ejecucion(valor_parametro)
        if not horarios_ejecucion:
            print("No se pudieron obtener los horarios de ejecución.")
            return
            
        # Preparar datos de fecha y hora
        hora_actual = fecha_proceso.strftime("%H:%M")
        dia_actual = fecha_proceso.strftime("%A").lower()
        dia_mes_actual = fecha_proceso.day
        
        print(f"Evaluando horarios de ejecución - Hora actual: {hora_actual}, Día: {dia_actual}, Día del mes: {dia_mes_actual}")
        
        # Evaluar cada horario
        for horario in horarios_ejecucion:
            debe_ejecutar, horario_seleccionado = evaluar_horario(horario, hora_actual, dia_actual, dia_mes_actual)
            
            if debe_ejecutar:
                ejecutar_proceso(cursor, horario_seleccionado, hora_actual)
                break
        else:
        
            print("No es momento de ejecutar el proceso según los horarios configurados.")
                
    except mysql.Error as err:
        print(f"Error en la base de datos: {err}")
        if conexion:
            conexion.rollback()
    except KeyError as e:
        print(f"Error en la estructura del JSON de parámetros: {e}")
    except json.JSONDecodeError:
        print("Error al decodificar el JSON de parámetros")
    except Exception as e:
        print(f"Error inesperado: {e}")
        if conexion:
            conexion.rollback()
    finally:
        if cursor:
            cursor.close()
        if conexion:
            conexion.close()
        print("Conexión a la base de datos cerrada.")

# Punto de entrada
if __name__ == "__main__":
    proceso_principal()