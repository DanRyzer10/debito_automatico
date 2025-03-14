-- SP debitos pendientes domiciliado y vencidos
DELIMITER $$

CREATE PROCEDURE pa_mdp_i_debitos_pendientes(
	IN batch_id VARCHAR(36), -- nuevo campo uuid
    OUT codigo INT,         -- Código de error/éxito
    OUT mensaje VARCHAR(255) -- Mensaje descriptivo
)
BEGIN
    -- Manejo de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        SET codigo = 1;
        SET mensaje = 'Error al insertar datos en emi_t_debito_pendientes';
    END;
    
    -- Insertar registros en emi_t_debito_pendientes combinando domiciliados y vencidos
    INSERT INTO emi_t_debito_pendientes (
        db_pan, 
        db_cuenta, 
        db_identcli, 
        db_numdoc, 
        db_status,
		db_ctargo1,
		db_clamon1, 
		db_ctargo2, 
		db_clamon2,
        db_pago_min, 
        db_pago_contado, 
        db_d_fec_top_pag, 
        db_cu_forpago, 
        db_fecext, 
        db_impmin, 
        db_ic_impago, 
        db_ic_numrecimp,
        db_dr_fecvenmov, 
        db_tip_deb, 
        db_processdate, 
        db_estado_actual, 
        db_batch_id
    )
    SELECT 
        a.mp_pan, a.mp_cuenta, a.mp_identcli, b.p1_numdoc, a.mp_status,
		d.lc_ctargo1, d.lc_clamon1, d.lc_ctargo2, d.lc_clamon2, 
        e.m_pago_min, e.m_pago_contado, e.d_fec_top_pag, f.cu_forpago,
        g.ex_fecext, g.ex_impmin, NULL, NULL,
        NULL, 'Domiciliado', NOW(), 'pendiente', batch_id
    FROM 
        medio_pago_tarjeta_mp a
        INNER JOIN datos_comunes_personas_p1 b ON a.mp_identcli = b.p1_identcli
        INNER JOIN limite_cuenta_lc d ON a.mp_cuenta = d.lc_cuenta
        INNER JOIN emi_maestro_cartera_diaria e ON a.mp_cuenta = e.i_num_cuenta
        INNER JOIN cuenta_medio_pago_cu f ON a.mp_cuenta = f.cu_cuenta
        INNER JOIN emi_t_ext_cred_ex g ON a.mp_cuenta = g.ex_cuenta
    WHERE 
        a.mp_calpart = 'TI' -- sea titular
        AND b.p1_indrepos = 'S' -- sea domiciliado
        AND a.mp_status = 'A' -- un campo que se agrego (para saber si la tarjeta esta Activa o Inactiva)
        AND e.d_fec_top_pag = DATE(NOW()) -- validar que la fecha de tope sea igual a la fecha del proceso
        AND g.ex_impmin = 0 -- validar por cada dédito  que el campo IMPMIN no haya realizado el pago ya que si el valor es igual a 0 no se debe realizar el debito.
        AND (
            (f.cu_forpago = '03' AND e.m_pago_min > 0) --  validar si el cliente tiene el valor 03 en FORPAGO se debe considerar que el saldo campo pago minimo sea mayor a cero
            OR
            (f.cu_forpago = '04' AND e.m_pago_contado > 0) -- - validar si el cliente tiene el valor 04 en FORPAGO considerar que el saldo del campos m_pago_contado sea mayor 0
        )
        AND DATE(NOW()) <= DATE(g.ex_fecext) -- El proceso se debe realizar hasta la fecha de cierre del siguiente ciclo de facturación(FECHA DE CORTE-> FECEXT)
    UNION ALL
    SELECT 
        a.mp_pan, a.mp_cuenta, a.mp_identcli, b.p1_numdoc, a.mp_status,
        d.lc_ctargo1, d.lc_clamon1, d.lc_ctargo2, d.lc_clamon2, 
        e.m_pago_min, e.m_pago_contado, e.d_fec_top_pag, f.cu_forpago,
        g.ex_fecext, g.ex_impmin, l.ic_impago, l.ic_numrecimp,
        m.dr_fecvenmov, 'Vencida', NOW(), 'pendiente', batch_id
    FROM 
        medio_pago_tarjeta_mp a
        INNER JOIN datos_comunes_personas_p1 b ON a.mp_identcli = b.p1_identcli
        INNER JOIN limite_cuenta_lc d ON a.mp_cuenta = d.lc_cuenta
        INNER JOIN emi_maestro_cartera_diaria e ON a.mp_cuenta = e.i_num_cuenta
        INNER JOIN cuenta_medio_pago_cu f ON a.mp_cuenta = f.cu_cuenta
        INNER JOIN emi_t_ext_cred_ex g ON a.mp_cuenta = g.ex_cuenta
        INNER JOIN venta_cartera_castigada k ON a.mp_cuenta = k.cuenta
        INNER JOIN contrato_impagado_ic l ON a.mp_cuenta = l.ic_cuenta 
        INNER JOIN desgloce_por_linea_ultimo_recibido_dr m ON a.mp_cuenta = m.dr_cuenta
    WHERE
		a.mp_calpart = 'TI' -- sea titular
        AND b.p1_indrepos = 'S' -- sea domiciliado
        AND a.mp_status = 'A' -- un campo que se agrego (para saber si la tarjeta esta Activa o Inactiva)
        AND l.ic_numrecimp >= 1 -- Pago vencido (al menos un recibo impago) NÚMERO DE RECIBOS IMPAGADOS
        AND g.ex_fecext > e.d_fec_top_pag -- Fecha de ciclo de facturación posterior a la fecha tope de pago
        AND (d.lc_ctargo1 IS NOT NULL AND d.lc_ctargo1 != '') -- Validar que lc_ctargo1 y lc_ctargo2 no estén vacíos y la cadena este vacia son la cuenta a debitar
        AND (d.lc_ctargo2 IS NOT NULL AND d.lc_ctargo2 != '') -- Validar que lc_ctargo1 y lc_ctargo2 no estén vacíos y la cadena este vacia son la cuentas a debitar
        AND k.estado = '021'  -- Excluir tarjetas con estado "VENTA de CARTERA CASTIGADA" (020)
        AND l.ic_impago > 0  -- Regla 2: Solo clientes con IMPAGO > 0 
        AND (
            (e.m_deuda_vcda > 0 AND NOW() < e.d_fec_top_pag) -- Condición A: Saldo de deuda vencida mayor a 0 y la fecha de proceso menor a la fecha de tope de pago
            OR (e.m_pago_min > 0 AND NOW() > e.d_fec_top_pag) -- Condición B: Pago mínimo mayor a 0 y la fecha de proceso es mayor a la fecha tope de pago
            OR (l.ic_numrecimp = 0 AND e.m_pago_min > 0 AND NOW() >= g.ex_fecext) -- Condición C: Pago mínimo mayor a 0, sin pagos vencidos, y la fecha de proceso es mayor o igual a la fecha de inicio del ciclo de facturación
            OR (e.m_deuda_vcda <= e.m_pago_min ) -- Validación D: Deuda vencida menor o igual a pago mínimo y fecha de proceso dentro del rango
            
        )
        AND e.m_deuda_vcda < g.ex_impmin; -- Si el cliente tiene saldo menor al monto de débito, permitir débito parcial

    
    -- Validar si se insertaron registros
    IF ROW_COUNT() > 0 THEN
        SET codigo = 0;
        SET mensaje = CONCAT('Se insertaron ', ROW_COUNT(), ' registros correctamente.');
    ELSE
        SET codigo = 2;
        SET mensaje = 'No se insertaron registros.';
    END IF;
    
END $$

DELIMITER ;



CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_batch_proceso`(OUT p_batch_id VARCHAR(36))
BEGIN
    DECLARE exit HANDLER FOR SQLEXCEPTION
    BEGIN
        -- En caso de error, establecer el UUID en NULL y generar un error controlado
        SET p_batch_id = NULL;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al insertar el batch_proceso';
    END;
    
    -- Generar un UUID
    SET p_batch_id = UUID();
    
    -- Insertar el registro con valores por defecto
    INSERT INTO batch_procesos (batch_id) VALUES (p_batch_id);
    
    -- Confirmar la inserción
    IF ROW_COUNT() = 0 THEN
        SET p_batch_id = NULL;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo insertar el registro en batch_procesos';
    END IF;
END



CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ObtenerParametro`(IN p_pa_id INT, OUT p_pa_valor TEXT)
BEGIN
    DECLARE v_pa_valor TEXT;

    -- Obtener el valor de pa_valor
    SELECT pa_valor INTO v_pa_valor
    FROM emi_tc_m_parametro
    WHERE pa_id = p_pa_id;

    -- Asignar el valor al parámetro de salida
    SET p_pa_valor = v_pa_valor;
END




