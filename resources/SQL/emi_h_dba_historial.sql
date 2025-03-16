CREATE TABLE emi_h_dba_historial (
    db_id_historial         BIGINT AUTO_INCREMENT PRIMARY KEY,
    db_id_debito            BIGINT NOT NULL,
    db_fecha_proceso        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    db_id_cliente           BIGINT NOT NULL,
    db_monto               DECIMAL(18,2) NOT NULL,
    db_moneda              VARCHAR(3) NOT NULL,
    db_estado_proceso      VARCHAR(20) NOT NULL,
    db_metodo_pago         VARCHAR(50) NOT NULL,
    db_referencia_externa  VARCHAR(100),
    db_usuario_proceso     VARCHAR(50) NOT NULL,
    db_detalle_respuesta   TEXT,
    db_secuencial         VARCHAR(50),
    db_numero_comprobante VARCHAR(50),
    db_pendiente_restante DECIMAL(18,2) DEFAULT 0.00
    db_fecha_registro      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_debito FOREIGN KEY (id_debito) REFERENCES emi_t_debito_pendientes(db_id)
);