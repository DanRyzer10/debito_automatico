CREATE TABLE emi_h_dba_historial (
    id_historial         BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_debito            BIGINT NOT NULL,
    fecha_proceso        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_cliente           BIGINT NOT NULL,
    monto               DECIMAL(18,2) NOT NULL,
    moneda              VARCHAR(3) NOT NULL,
    estado_proceso      VARCHAR(20) NOT NULL,
    metodo_pago         VARCHAR(50) NOT NULL,
    referencia_externa  VARCHAR(100),
    usuario_proceso     VARCHAR(50) NOT NULL,
    detalle_respuesta   TEXT,
    secuencial         VARCHAR(50),
    numero_comprobante VARCHAR(50),
    pendiente_restante DECIMAL(18,2) DEFAULT 0.00, -- Versión corregida
    fecha_registro      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_debito FOREIGN KEY (id_debito) REFERENCES emi_t_debito_pendientes(db_id)
);