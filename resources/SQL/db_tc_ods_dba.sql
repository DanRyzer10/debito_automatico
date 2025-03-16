create database DB_TC_ODS;

use DB_TC_ODS;
CREATE TABLE emi_maestro_cartera_diaria (
    i_num_cuenta Varchar(12) NOT NULL,
    i_id_fec_proceso INT NOT NULL,
    i_id_fec_cor_act INT NOT NULL,
    i_empresa INT NOT NULL,
    m_sald_ant_rot DECIMAL(19,4) NOT NULL,
    m_sald_act_rot DECIMAL(19,4) NOT NULL,
    m_sald_act_dif DECIMAL(19,4) NOT NULL,
    m_por_confirmar DECIMAL(19,4) NULL,
    m_pago_min DECIMAL(19,4) NOT NULL, -- 9
    i_num_pagos_vcdos INT NULL,
    m_deuda_vcda DECIMAL(19,4) NULL,
    m_pago_min_top DECIMAL(19,4) NULL,
    m_cuotas_dif DECIMAL(19,4) NULL,
    m_sald_disponible DECIMAL(19,4) NOT NULL,
    m_pago_contado DECIMAL(19,4) NOT NULL, -- 15
    m_sobregiro DECIMAL(19,4) NULL,
    m_sald_a_favor DECIMAL(19,4) NULL,
    m_int_rot_mes DECIMAL(19,4) NULL,
    m_int_mora_mes DECIMAL(19,4) NULL,
    m_int_dif_mes DECIMAL(19,4) NULL,
    m_cupo_utilizado DECIMAL(19,4) NULL,
    i_cod_oficina INT NULL,
    i_id_calif_bb INT NULL,
    m_capital_castigado DECIMAL(19,4) NULL,
    m_capital_ngi DECIMAL(19,4) NULL,
    m_capital_rotativo DECIMAL(19,4) NULL,
    m_capital_vcdo DECIMAL(19,4) NULL,
    m_capital_x_vcer DECIMAL(19,4) NULL,
    d_fec_top_pag DATETIME NULL, -- 28
    i_fec_top_pag INT NULL,
    s_indi_tip_deb_autor VARCHAR(8) NULL,
    s_rep_r21_demand VARCHAR(8) NULL,
    s_ind_cdr_garante CHAR(1) NULL,
    s_afinidad VARCHAR(8) NULL,
    s_cta_autori_deb VARCHAR(30) NULL,
    m_a_pend_dif DECIMAL(19,4) NULL,
    s_mot_canc INT NULL,
    m_monto_ult_pag DECIMAL(19,4) NULL,
    m_monto_ult_cons DECIMAL(19,4) NULL,
    i_id_fec_ult_cons INT NULL,
    i_ejec_cta INT NULL,
    d_fec_ult_pag DATETIME NULL,
    m_pag_mes DECIMAL(19,4) NULL,
    m_cred_mes DECIMAL(19,4) NULL,
    m_dev_mes DECIMAL(19,4) NULL
);

CREATE TABLE datos_personas_fisica_p2 (
    p2_id INT AUTO_INCREMENT PRIMARY KEY,
    p2_codent CHAR(4) NOT NULL,
    p2_identcli VARCHAR(15) NOT NULL,
    p2_tiporeg CHAR(2) NOT NULL,
    p2_nombre VARCHAR(50) NOT NULL,
    p2_apelli1 VARCHAR(50) NOT NULL,
    p2_apelli2 VARCHAR(50) NOT NULL,
    p2_codpaisnct INT NOT NULL,
    p2_nompaisnct VARCHAR(50) NOT NULL,
    p2_codpaisnac INT NOT NULL,
    p2_nompaisnac VARCHAR(50) NOT NULL,
    p2_codpaisres INT NOT NULL,
    p2_nompaisres VARCHAR(50) NOT NULL,
    p2_sexper CHAR(1) NOT NULL,
    p2_indestciv CHAR(1) NOT NULL,
    p2_regecon CHAR(1) NOT NULL,
    p2_indtracor CHAR(2) NOT NULL,
    p2_fecnac DATE NOT NULL,
    p2_codprof VARCHAR(10) NOT NULL,
    p2_fecfelicita VARCHAR(4) NOT NULL,
    p2_tipfelicita CHAR(1) NOT NULL,
    p2_fecalta DATE NOT NULL,
    p2_fecbaja DATE NOT NULL,
    p2_processdate INT NOT NULL
);

CREATE TABLE datos_comunes_personas_p1 (
    p1_id INT AUTO_INCREMENT PRIMARY KEY,
    p1_codent CHAR(4) NOT NULL,
    p1_identcli VARCHAR(15) NOT NULL,
    p1_tiporeg CHAR(2) NOT NULL,
    p1_tipdoc CHAR(1) NOT NULL,
    p1_numdoc VARCHAR(20) NOT NULL,
    p1_tipper CHAR(1) NOT NULL,
    p1_estper CHAR(1) NOT NULL,
    p1_fecest DATE NOT NULL,
    p1_tipclien VARCHAR(2) NOT NULL,
    p1_subtipcli VARCHAR(2) NOT NULL,
    p1_codidioma CHAR(2) NOT NULL,
    p1_bloqueo CHAR(1) NOT NULL,
    p1_indrepos CHAR(1) NOT NULL,
    p1_nivseg INT NOT NULL,
    p1_publicidad CHAR(1) NOT NULL,
    p1_indvip CHAR(1) NOT NULL,
    p1_fecalta DATE NOT NULL,
    p1_fecbaja DATE NOT NULL,
    p1_cnae VARCHAR(20),
    p1_codcirbe VARCHAR(20),
    p1_claveacc VARCHAR(20),
    p1_sitclave VARCHAR(20),
    p1_codcontrib VARCHAR(20),
    p1_processdate INT NOT NULL
);
CREATE TABLE cuenta_medio_pago_cu (
    cu_id INT AUTO_INCREMENT PRIMARY KEY,
    cu_codent CHAR(4) NOT NULL,
    cu_centalta CHAR(4) NOT NULL,
    cu_cuenta VARCHAR(20) NOT NULL,
    cu_tiporeg CHAR(2) NOT NULL,
    cu_numorden INT NOT NULL,
    cu_fecultcar DATE NOT NULL,
    cu_producto VARCHAR(10) NOT NULL,
    cu_subprodu VARCHAR(10) NOT NULL,
    cu_tipocto VARCHAR(10) NOT NULL,
    cu_fecproven DATE NOT NULL,
    cu_fecultven DATE NOT NULL,
    cu_fecresol DATE NOT NULL,
    cu_identcli VARCHAR(15) NOT NULL,
    cu_codblq INT NOT NULL,
    cu_indblqope CHAR(1) NOT NULL,
    cu_codestcta INT NOT NULL,
    cu_clasifcont CHAR(1) NOT NULL,
    cu_fecultestcta DATE NOT NULL,
    cu_codconven VARCHAR(10) NOT NULL,
    cu_indctaemp INT NOT NULL,
    cu_codbus INT NOT NULL,
    cu_codelemento INT NOT NULL,
    cu_tiprolcuenta CHAR(1) NOT NULL,
    cu_inddomcarcre INT NOT NULL,
    cu_forpago INT NOT NULL, -- 03 (pago aplazado) -> pago min   04 (Pago fijo con operación financiada) -> pago contado
    cu_indsitcta INT NOT NULL,
    cu_ofigestora VARCHAR(10) NOT NULL,
    cu_conprod VARCHAR(10) NOT NULL,
    cu_fecbaja DATE NOT NULL,
    cu_fecalta DATE NOT NULL,
    cu_indtipocto INT NOT NULL,
    cu_intgenmora DECIMAL(20,4) NOT NULL,
    cu_porpagoa DECIMAL(10,4) NOT NULL,
    cu_imppago DECIMAL(20,4) NOT NULL,
    cu_numextpen INT NOT NULL,
    cu_numultext INT NOT NULL,
    cu_grupoliq INT NOT NULL,
    cu_fecultfac DATE NOT NULL,
    cu_fecantfac DATE NOT NULL,
    cu_saldacre DECIMAL(15,2) NOT NULL,
    cu_saldorev DECIMAL(15,2) NOT NULL,
    cu_motbaja INT NOT NULL,
    cu_tipbon VARCHAR(20) NOT NULL,
    cu_codformato VARCHAR(20) NOT NULL,
    cu_codcam VARCHAR(10) NOT NULL,
    cu_fecultblq DATE NOT NULL,
    cu_salkact DECIMAL(15,2) NOT NULL,
    cu_porriesg DECIMAL(10,4) NOT NULL,
    cu_provriesact DECIMAL(20,4) NOT NULL,
    cu_feccalriesact DATE NOT NULL,
    cu_impdemandado DECIMAL(20,4) NOT NULL,
    cu_impdemant DECIMAL(20,4) NOT NULL,
    cu_codcat CHAR(1) NOT NULL,
    cu_fecaltacat DATE NOT NULL,
    cu_fecmodcat DATE NOT NULL,
    cu_fecbajacat DATE NOT NULL,
    cu_impdotgen DECIMAL(20,4) NOT NULL,
    cu_numdiasact INT NOT NULL,
    cu_indcrefi CHAR(2) NOT NULL,
    cu_fecrefi DATE NOT NULL,
    cu_codestbcact VARCHAR(10) NOT NULL,
    cu_codestbcant VARCHAR(10) NOT NULL,
    cu_fecultestbc DATE NOT NULL,
    cu_processdate INT NOT NULL
);

CREATE TABLE limite_cuenta_lc (
    lc_id INT AUTO_INCREMENT PRIMARY KEY,
    lc_cuenta VARCHAR(12) NOT NULL,
    lc_clamon1 INT NOT NULL,
    lc_ctargo1 VARCHAR(30),
    lc_clamon2 INT NOT NULL,
    lc_ctargo2 VARCHAR(30)
);

INSERT INTO limite_cuenta_lc (
    lc_cuenta,
    lc_clamon1,
    lc_ctargo1,
    lc_clamon2,
    lc_ctargo2
) VALUES
(
    '123456789012', 1, 'TARJETA_CREDITO', 2, 'PRESTAMO_PERSONAL'
),
(
    '987654321098', 1, 'TARJETA_CREDITO', 3, 'HIPOTECA'
),
(
    '456789123456', 2, 'CUENTA_CORRIENTE', 1, 'TARJETA_DEBITO'
);

CREATE TABLE contrato_impagado_ic (
    ic_id INT AUTO_INCREMENT PRIMARY KEY,
    ic_cuenta VARCHAR(12) NOT NULL,
    ic_impago DECIMAL(10,2) NOT NULL,
    ic_impapl decimal (10,2) not null,
    ic_numrecimp INT NOT NULL
);

INSERT INTO contrato_impagado_ic (
    ic_cuenta,
    ic_impago,
    ic_impapl,
    ic_numrecimp
) VALUES
(
    '123456789012', 250.00, 200.00, 2
),
(
    '987654321098', 500.00, 450.00, 3
),
(
    '456789123456', 150.00, 120.00, 1
);


CREATE TABLE recibido_impagado_ri(
    ri_id INT AUTO_INCREMENT PRIMARY KEY,
    ri_codent CHAR(4) NOT NULL,
    ri_centalta CHAR(4) NOT NULL,
    ri_cuenta VARCHAR(20) NOT NULL,
    ri_tiporeg CHAR(2) NOT NULL,
    ri_numorden INT NOT NULL,
    ri_clamon INT NOT NULL,
    ri_numsecimp BIGINT NOT NULL,
    ri_numsecrec BIGINT NOT NULL,
    ri_fecalta DATE NOT NULL,
    ri_fecemimov DATE NOT NULL,
    ri_fecvenmov DATE NOT NULL,
    ri_imprec DECIMAL(20,2) NOT NULL,
    ri_impago DECIMAL(20,2) NOT NULL,
    ri_impapl DECIMAL(20,2) NOT NULL,
    ri_fecultapl DATE NOT NULL,
    ri_fecenvcob DATE NOT NULL,
    ri_processdate INT NOT NULL
);

INSERT INTO recibido_impagado_ri (
    ri_codent,
    ri_centalta,
    ri_cuenta,
    ri_tiporeg,
    ri_numorden,
    ri_clamon,
    ri_numsecimp,
    ri_numsecrec,
    ri_fecalta,
    ri_fecemimov,
    ri_fecvenmov,
    ri_imprec,
    ri_impago,
    ri_impapl,
    ri_fecultapl,
    ri_fecenvcob,
    ri_processdate
) VALUES
(
    '0001', '1001', '123456789012', '01', 1, 1, 10000001, 20000001,
    '2024-03-01', '2024-02-15', '2024-02-28', 300.00, 250.00, 200.00,
    '2024-03-05', '2024-03-10', 20240315
),
(
    '0002', '1002', '987654321098', '02', 2, 2, 10000002, 20000002,
    '2024-03-02', '2024-02-10', '2024-02-25', 600.00, 500.00, 450.00,
    '2024-03-06', '2024-03-12', 20240315
),
(
    '0003', '1003', '456789123456', '01', 3, 1, 10000003, 20000003,
    '2024-03-03', '2024-02-20', '2024-02-28', 200.00, 150.00, 120.00,
    '2024-03-07', '2024-03-15', 20240315
);

CREATE TABLE emi_t_ext_cred_ex (
    ex_id BIGINT AUTO_INCREMENT,
    ex_codent CHAR(4) NOT NULL,
    ex_centalta CHAR(4) NOT NULL,
    ex_cuenta VARCHAR(12) NOT NULL,
    ex_pan VARCHAR(22) NOT NULL,
    ex_tiporeg CHAR(2) NOT NULL,
    ex_numorden BIGINT NOT NULL,
    ex_registro VARCHAR(457) NOT NULL,
    ex_tokennegocio VARCHAR(37) NOT NULL,
    ex_numextcta INT NOT NULL,
    ex_clamon INT NOT NULL,
    ex_indrep INT NOT NULL,
    ex_desindrep VARCHAR(30) NOT NULL,
    ex_forpago INT NOT NULL,
    ex_sigimptotpag CHAR(1) NOT NULL,
    ex_imptotpag DECIMAL(17,2) NOT NULL,
    ex_sigimpmin CHAR(1) NOT NULL,
    ex_impmin DECIMAL(17,2) NOT NULL,
    ex_sigimpcargo CHAR(1) NOT NULL,
    ex_impcargo DECIMAL(17,2) NOT NULL,
    ex_fecext DATE NOT NULL, -- 21
    ex_fecliq DATE NOT NULL,
    ex_fecliqant DATE NOT NULL,
    ex_feccar DATE NOT NULL,
    ex_fecvalcar DATE NOT NULL,
    ex_porint DECIMAL(7,4) NOT NULL,
    ex_porpagoa DECIMAL(7,4) NOT NULL,
    ex_sigimpexclim CHAR(1) NOT NULL,
    ex_impexclim DECIMAL(17,2) NOT NULL,
    ex_sigimsalaplprx CHAR(1) NOT NULL,
    ex_imsalaplprx DECIMAL(17,2) NOT NULL,
    ex_sigimpcargoant CHAR(1) NOT NULL,
    ex_impcargoant DECIMAL(17,2) NOT NULL,
    ex_numsecrec BIGINT NOT NULL,
    ex_inpfijoapl DECIMAL(15,2) NOT NULL,
    ex_fecvenult DATE NOT NULL,
    ex_fecvenpro DATE NOT NULL,
    ex_processdate INT NOT NULL,
    CONSTRAINT pk_ex_id PRIMARY KEY (ex_id)
);

INSERT INTO emi_t_ext_cred_ex (
    ex_codent,
    ex_centalta,
    ex_cuenta,
    ex_pan,
    ex_tiporeg,
    ex_numorden,
    ex_registro,
    ex_tokennegocio,
    ex_numextcta,
    ex_clamon,
    ex_indrep,
    ex_desindrep,
    ex_forpago,
    ex_sigimptotpag,
    ex_imptotpag,
    ex_sigimpmin,
    ex_impmin,
    ex_sigimpcargo,
    ex_impcargo,
    ex_fecext,
    ex_fecliq,
    ex_fecliqant,
    ex_feccar,
    ex_fecvalcar,
    ex_porint,
    ex_porpagoa,
    ex_sigimpexclim,
    ex_impexclim,
    ex_sigimsalaplprx,
    ex_imsalaplprx,
    ex_sigimpcargoant,
    ex_impcargoant,
    ex_numsecrec,
    ex_inpfijoapl,
    ex_fecvenult,
    ex_fecvenpro,
    ex_processdate
) VALUES
(
    '0001', '1001', '123456789012', '4111111111111111111', '01', 10000001,
    'REGISTRO-123456789012', 'TOKEN-12345-67890-ABCDE', 1, 1, 0,
    'NORMAL', 03, '+', 500.00, '+', 100.00, '+', 50.00,
    '2024-03-01', '2024-03-10', '2024-02-28', '2024-02-25', '2024-02-28',
    12.5000, 5.7500, '-', 200.00, '+', 100.00, '+', 50.00,
    20000001, 150.00, '2024-02-28', '2024-03-25', 20240315
),
(
    '0002', '1002', '987654321098', '5500000000000000000', '02', 10000002,
    'REGISTRO-987654321098', 'TOKEN-98765-43210-ABCDE', 2, 2, 1,
    'REPROGRAMADO', 04, '+', 750.00, '+', 200.00, '+', 100.00,
    '2024-03-02', '2024-03-11', '2024-02-26', '2024-02-22', '2024-02-27',
    10.2500, 6.5000, '-', 300.00, '+', 150.00, '+', 75.00,
    20000002, 200.00, '2024-02-26', '2024-03-20', 20240315
),
(
    '0003', '1003', '456789123456', '340000000000000000', '01', 10000003,
    'REGISTRO-456789123456', 'TOKEN-45678-91234-ABCDE', 3, 1, 0,
    'NORMAL', 03, '+', 300.00, '+', 75.00, '+', 40.00,
    '2024-03-03', '2024-03-12', '2024-02-25', '2024-02-20', '2024-02-25',
    11.0000, 4.7500, '-', 250.00, '+', 120.00, '+', 60.00,
    20000003, 180.00, '2024-02-25', '2024-03-22', 20240315
);


CREATE TABLE `desgloce_por_linea_ultimo_recibido_dr` (
    `dr_id` BIGINT NOT NULL AUTO_INCREMENT,  -- Identificador único (opcional)
    `dr_cuenta` VARCHAR(20) NOT NULL,        -- Número de cuenta
    `dr_fecvenmov` DATE NOT NULL,            -- Fecha de vencimiento del movimiento
    PRIMARY KEY (`dr_id`)                    -- Clave primaria
);

INSERT INTO desgloce_por_linea_ultimo_recibido_dr (
    dr_cuenta,
    dr_fecvenmov
) VALUES
(
    '123456789012', '2024-02-28'
),
(
    '987654321098', '2024-02-25'
),
(
    '456789123456', '2024-02-28'
);


CREATE TABLE venta_cartera_castigada (
    id INT AUTO_INCREMENT PRIMARY KEY,          -- Identificador único
    pan VARCHAR(16) NOT NULL,                  -- Número de tarjeta (PAN)
    cuenta VARCHAR(20) NOT NULL,               -- Número de cuenta
    estado CHAR(3) NOT NULL,                   -- Estado (020 o 021)
    fecha_venta DATE NOT NULL,                 -- Fecha de venta
    monto DECIMAL(15, 2) NOT NULL,             -- Monto de la cartera
    descripcion TEXT,                          -- Descripción adicional (opcional)
    CHECK (estado IN ('020', '021'))           -- Restricción para el campo estado
);

INSERT INTO venta_cartera_castigada (
    pan,
    cuenta,
    estado,
    fecha_venta,
    monto,
    descripcion
) VALUES
(
    '4111111111111111', '123456789012', '020', '2024-03-10', 1500.00, 'Venta de cartera por impago prolongado.'
),
(
    '5500000000000000', '987654321098', '021', '2024-03-12', 2500.00, 'Reestructuración de deuda mediante venta de cartera.'
),
(
    '340000000000000', '456789123456', '020', '2024-03-15', 1800.00, 'Venta de cartera castigada a entidad de cobro.'
);







CREATE TABLE medio_pago_tarjeta_mp(
    mp_id INT AUTO_INCREMENT PRIMARY KEY,
    mp_cuenta VARCHAR(12) NOT NULL,
    mp_identcli VARCHAR(8) NOT NULL,
    mp_calpart CHAR(2) NOT NULL,
    mp_pan VARCHAR(22) NOT NULL,
    mp_status char(1) NOT NULL, -- campo nuevo
    mp_indsittar INT NOT NULL
);

INSERT INTO cuenta_medio_pago_cu (
    cu_codent,
    cu_centalta,
    cu_cuenta,
    cu_tiporeg,
    cu_numorden,
    cu_fecultcar,
    cu_producto,
    cu_subprodu,
    cu_tipocto,
    cu_fecproven,
    cu_fecultven,
    cu_fecresol,
    cu_identcli,
    cu_codblq,
    cu_indblqope,
    cu_codestcta,
    cu_clasifcont,
    cu_fecultestcta,
    cu_codconven,
    cu_indctaemp,
    cu_codbus,
    cu_codelemento,
    cu_tiprolcuenta,
    cu_inddomcarcre,
    cu_forpago,
    cu_indsitcta,
    cu_ofigestora,
    cu_conprod,
    cu_fecbaja,
    cu_fecalta,
    cu_indtipocto,
    cu_intgenmora,
    cu_porpagoa,
    cu_imppago,
    cu_numextpen,
    cu_numultext,
    cu_grupoliq,
    cu_fecultfac,
    cu_fecantfac,
    cu_saldacre,
    cu_saldorev,
    cu_motbaja,
    cu_tipbon,
    cu_codformato,
    cu_codcam,
    cu_fecultblq,
    cu_salkact,
    cu_porriesg,
    cu_provriesact,
    cu_feccalriesact,
    cu_impdemandado,
    cu_impdemant,
    cu_codcat,
    cu_fecaltacat,
    cu_fecmodcat,
    cu_fecbajacat,
    cu_impdotgen,
    cu_numdiasact,
    cu_indcrefi,
    cu_fecrefi,
    cu_codestbcact,
    cu_codestbcant,
    cu_fecultestbc,
    cu_processdate
) VALUES
(
    '0001', '1001', '123456789012', '01', 1, '2024-03-10', 'PROD001', 'SUBPROD01', 'TIPO001',
    '2022-01-10', '2025-01-10', '2024-12-31', '123456789012345', 0, 'N', 1, 'A',
    '2024-02-10', 'CONV001', 0, 101, 201, 'P', 0, 03, 1, 'OFI001', 'CP001', '9999-12-31',
    '2020-03-15', 1, 10.5000, 5.0000, 250.00, 2, 1, 3, '2024-02-05', '2024-01-05',
    1500.00, 100.00, 0, 'BON001', 'FORM001', 'CAM001', '2024-01-15', 500.00, 2.5000,
    750.0000, '2024-03-01', 100.0000, 50.0000, 'X', '2023-06-10', '2024-02-10', '9999-12-31',
    200.0000, 30, 'CR', '2024-02-10', 'EST001', 'EST002', '2024-03-10', 20240315
),
(
    '0002', '1002', '987654321098', '02', 2, '2024-03-05', 'PROD002', 'SUBPROD02', 'TIPO002',
    '2023-02-20', '2026-02-20', '2025-12-31', '987654321098765', 1, 'Y', 2, 'B',
    '2024-01-20', 'CONV002', 1, 202, 202, 'T', 1, 04, 2, 'OFI002', 'CP002', '9999-12-31',
    '2021-07-05', 2, 15.7500, 6.5000, 350.00, 3, 2, 5, '2024-01-10', '2023-12-10',
    2000.00, 200.00, 1, 'BON002', 'FORM002', 'CAM002', '2023-12-20', 600.00, 3.0000,
    850.0000, '2024-03-05', 150.0000, 75.0000, 'Y', '2023-07-15', '2024-01-15', '9999-12-31',
    250.0000, 40, 'CF', '2024-01-20', 'EST003', 'EST004', '2024-03-05', 20240315
),
(
    '0003', '1003', '456789123456', '01', 3, '2024-03-01', 'PROD003', 'SUBPROD03', 'TIPO003',
    '2021-05-30', '2024-05-30', '2023-12-31', '567890123456789', 0, 'N', 3, 'C',
    '2024-03-01', 'CONV003', 0, 303, 303, 'P', 0, 03, 3, 'OFI003', 'CP003', '9999-12-31',
    '2018-11-25', 3, 12.2500, 4.7500, 275.00, 1, 3, 7, '2024-02-28', '2024-01-28',
    1750.00, 150.00, 2, 'BON003', 'FORM003', 'CAM003', '2024-02-10', 550.00, 2.7500,
    800.0000, '2024-03-01', 125.0000, 60.0000, 'Z', '2023-08-20', '2024-02-20', '9999-12-31',
    225.0000, 35, 'CI', '2024-03-01', 'EST005', 'EST006', '2024-03-01', 20240315
);





INSERT INTO emi_maestro_cartera_diaria (
    i_num_cuenta,
    i_id_fec_proceso,
    i_id_fec_cor_act,
    i_empresa,
    m_sald_ant_rot,
    m_sald_act_rot,
    m_sald_act_dif,
    m_por_confirmar,
    m_pago_min,
    i_num_pagos_vcdos,
    m_deuda_vcda,
    m_pago_min_top,
    m_cuotas_dif,
    m_sald_disponible,
    m_pago_contado,
    m_sobregiro,
    m_sald_a_favor,
    m_int_rot_mes,
    m_int_mora_mes,
    m_int_dif_mes,
    m_cupo_utilizado,
    i_cod_oficina,
    i_id_calif_bb,
    m_capital_castigado,
    m_capital_ngi,
    m_capital_rotativo,
    m_capital_vcdo,
    m_capital_x_vcer,
    d_fec_top_pag,
    i_fec_top_pag,
    s_indi_tip_deb_autor,
    s_rep_r21_demand,
    s_ind_cdr_garante,
    s_afinidad,
    s_cta_autori_deb,
    m_a_pend_dif,
    s_mot_canc,
    m_monto_ult_pag,
    m_monto_ult_cons,
    i_id_fec_ult_cons,
    i_ejec_cta,
    d_fec_ult_pag,
    m_pag_mes,
    m_cred_mes,
    m_dev_mes
) VALUES
(
    '123456789012', 20240315, 20240314, 1001, 1500.00, 1200.00, -300.00, 200.00, 100.00,
    2, 50.00, 80.00, 30.00, 1000.00, 500.00, NULL, 50.00, 20.00, 10.00, 5.00, 700.00,
    101, 2, NULL, 300.00, 500.00, 200.00, NULL, '2025-03-10 10:00:00', 20250310,
    'AUTO', 'N', 'Y', 'AFIN001', '98765432109876543210', NULL, NULL, 120.00, 250.00,
    20240310, NULL, '2025-03-12 12:30:00', 150.00, 400.00, 50.00
),
(
    '987654321098', 20240315, 20240314, 1002, 5000.00, 4500.00, -500.00, NULL, 300.00,
    NULL, NULL, NULL, NULL, 4000.00, 1000.00, 200.00, NULL, 40.00, 25.00, 15.00, 3500.00,
    202, 3, 600.00, NULL, 2500.00, 800.00, 400.00, NULL, NULL, 'MANUAL', 'Y', 'N',
    NULL, '12345678901234567890', 100.00, NULL, 200.00, NULL, NULL, 1, NULL, 300.00,
    700.00, 100.00
),
(
    '456789123456', 20240315, 20240314, 1003, 7500.00, 7300.00, -200.00, 500.00, 250.00,
    1, 100.00, 150.00, 50.00, 7000.00, 1500.00, NULL, NULL, 30.00, 20.00, 10.00, 5000.00,
    303, 4, NULL, 400.00, 3500.00, 1000.00, 600.00, '2025-03-08 09:00:00', 20250308,
    'AUTO', 'N', 'Y', 'AFIN002', '56789012345678901234', NULL, 5, 500.00, 800.00,
    20240308, NULL, '2025-03-10 15:00:00', 450.00, 900.00, 150.00
);

INSERT INTO medio_pago_tarjeta_mp (
    mp_cuenta,
    mp_identcli,
    mp_calpart,
    mp_pan,
    mp_status,
    mp_indsittar
) VALUES
(
    '123456789012', '12345678', '01', '4111111111111111111', 'A', 1
),
(
    '987654321098', '98765432', '02', '5500000000000000000', 'B', 2
),
(
    '456789123456', '56789012', '01', '340000000000000000', 'A', 3
);


INSERT INTO datos_comunes_personas_p1 (
    p1_codent,
    p1_identcli,
    p1_tiporeg,
    p1_tipdoc,
    p1_numdoc,
    p1_tipper,
    p1_estper,
    p1_fecest,
    p1_tipclien,
    p1_subtipcli,
    p1_codidioma,
    p1_bloqueo,
    p1_indrepos,
    p1_nivseg,
    p1_publicidad,
    p1_indvip,
    p1_fecalta,
    p1_fecbaja,
    p1_cnae,
    p1_codcirbe,
    p1_claveacc,
    p1_sitclave,
    p1_codcontrib,
    p1_processdate
) VALUES
(
    '0001', '123456789012345', '01', 'D', '12345678A', 'P', 'A',
    '2022-05-10', '01', '02', 'ES', 'N', 'N', 3, 'S', 'N',
    '2020-03-10', '9999-12-31', '6201', 'CIRBE123', 'ACC123', 'SIT123', 'CONTRIB123', 20240315
),
(
    '0002', '987654321098765', '02', 'P', 'X1234567B', 'P', 'I',
    '2023-01-15', '02', '03', 'ES', 'Y', 'N', 2, 'N', 'Y',
    '2021-07-05', '9999-12-31', '7112', 'CIRBE456', 'ACC456', 'SIT456', 'CONTRIB456', 20240315
),
(
    '0003', '567890123456789', '01', 'D', '87654321C', 'P', 'A',
    '2019-09-30', '03', '01', 'EN', 'N', 'Y', 5, 'S', 'N',
    '2018-11-25', '9999-12-31', '8411', 'CIRBE789', 'ACC789', 'SIT789', 'CONTRIB789', 20240315
);


INSERT INTO datos_personas_fisica_p2 (
    p2_codent,
    p2_identcli,
    p2_tiporeg,
    p2_nombre,
    p2_apelli1,
    p2_apelli2,
    p2_codpaisnct,
    p2_nompaisnct,
    p2_codpaisnac,
    p2_nompaisnac,
    p2_codpaisres,
    p2_nompaisres,
    p2_sexper,
    p2_indestciv,
    p2_regecon,
    p2_indtracor,
    p2_fecnac,
    p2_codprof,
    p2_fecfelicita,
    p2_tipfelicita,
    p2_fecalta,
    p2_fecbaja,
    p2_processdate
) VALUES
(
    '0001', '123456789012345', '01', 'Carlos', 'Pérez', 'Gómez',
    170, 'Colombia', 170, 'Colombia', 170, 'Colombia',
    'M', 'S', 'N', '01', '1985-06-15', 'ENG123', '0615', 'A',
    '2020-03-10', '9999-12-31', 20240315
),
(
    '0002', '987654321098765', '02', 'María', 'López', 'Fernández',
    724, 'España', 724, 'España', 724, 'España',
    'F', 'C', 'S', '02', '1992-09-20', 'DOC456', '0920', 'B',
    '2021-07-05', '9999-12-31', 20240315
),
(
    '0003', '567890123456789', '01', 'Juan', 'García', 'Rodríguez',
    840, 'Estados Unidos', 840, 'Estados Unidos', 840, 'Estados Unidos',
    'M', 'D', 'N', '03', '1978-12-02', 'LAW789', '1202', 'C',
    '2018-11-25', '9999-12-31', 20240315
);

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

INSERT INTO batch_procesos (
    batch_id,
    estado,
    fecha_inicio,
    fecha_fin,
    total_registros,
    registros_procesados,
    registros_fallidos,
    mensaje_error
) VALUES
(
    '550e8400-e29b-41d4-a716-446655440001', 'EN PROCESO', '2024-03-15 08:00:00', NULL,
    1000, 500, 0, NULL
),
(
    '550e8400-e29b-41d4-a716-446655440002', 'COMPLETADO', '2024-03-14 14:30:00', '2024-03-14 16:00:00',
    750, 750, 0, NULL
),
(
    '550e8400-e29b-41d4-a716-446655440003', 'FALLIDO', '2024-03-13 10:45:00', '2024-03-13 11:10:00',
    500, 400, 100, 'Error en validación de datos en algunos registros'
);

CREATE TABLE `emi_t_debito_pendientes` (
  `db_id` bigint NOT NULL AUTO_INCREMENT,
  `db_pan` varchar(255) ,
  `db_cuenta` varchar(255),
  `db_identcli` varchar(255),
  `db_numdoc` varchar(255),
  `db_status` varchar(255),
  `db_ctargo1` varchar(30) DEFAULT NULL,
  `db_clamon1` int DEFAULT NULL,
  `db_ctargo2` varchar(30) DEFAULT NULL,
  `db_clamon2` int DEFAULT NULL,
  `db_pago_min` double ,
  `db_pago_contado` double,
  `db_d_fec_top_pag` datetime(6) ,
  `db_cu_forpago` int ,
  `db_fecext` date,
  `db_impmin` double ,
  `db_ic_impago` double ,
  `db_ic_numrecimp` double ,
  `db_dr_fecvenmov` date,
  `db_tip_deb` varchar(225) ,
  `db_processdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `db_estado_actual` ENUM('pendiente', 'procesado', 'error', 'reintento') DEFAULT 'pendiente',
  `db_batch_id` varchar(36) NOT NULL,
   PRIMARY KEY (`db_id`),
   CONSTRAINT `fk_batch`
	FOREIGN KEY (`db_batch_id`)
    REFERENCES `batch_procesos`(`batch_id`)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE emi_tc_m_parametro (
    pa_id INT PRIMARY KEY,
    pa_parent VARCHAR(50),
    pa_nombre VARCHAR(50),
    pa_valor TEXT,
    pa_descripcion TEXT,
    pa_fecha_creacion DATETIME,
    pa_fecha_actualizacion DATETIME,
    pa_estado CHAR(1)
);


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
    db_pendiente_restante DECIMAL(18,2) DEFAULT 0.00,
    db_fecha_procesado TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);





