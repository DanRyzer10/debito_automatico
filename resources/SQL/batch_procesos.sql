CREATE TABLE batch_procesos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    batch_id VARCHAR(36) NOT NULL UNIQUE,  -- UUID único para identificar cada batch
    estado ENUM('EN PROCESO', 'COMPLETADO', 'FALLIDO') NOT NULL DEFAULT 'EN PROCESO',
    fecha_inicio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- Inicio del procesamiento
    fecha_fin DATETIME NULL,  -- Se llena cuando el batch se completa o falla
    total_registros INT DEFAULT 0,  -- Cantidad de registros en el batch
    registros_procesados INT DEFAULT 0,  -- Registros efectivamente procesados
    registros_fallidos INT DEFAULT 0,  -- Registros con error
    mensaje_error TEXT NULL  -- En caso de fallos, se guarda el error
);