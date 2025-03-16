INSERT INTO emi_maestro_cartera_diaria (
    i_num_cuenta, i_id_fec_proceso, i_id_fec_cor_act, i_empresa, 
    m_sald_ant_rot, m_sald_act_rot, m_sald_act_dif, m_por_confirmar, 
    m_pago_min, i_num_pagos_vcdos, m_deuda_vcda, m_pago_min_top, 
    m_cuotas_dif, m_sald_disponible, m_pago_contado, m_sobregiro, 
    m_sald_a_favor, m_int_rot_mes, m_int_mora_mes, m_int_dif_mes, 
    m_cupo_utilizado, i_cod_oficina, i_id_calif_bb, m_capital_castigado, 
    m_capital_ngi, m_capital_rotativo, m_capital_vcdo, m_capital_x_vcer, 
    d_fec_top_pag, i_fec_top_pag, s_indi_tip_deb_autor, s_rep_r21_demand, 
    s_ind_cdr_garante, s_afinidad, s_cta_autori_deb, m_a_pend_dif, 
    s_mot_canc, m_monto_ult_pag, m_monto_ult_cons, i_id_fec_ult_cons, 
    i_ejec_cta, d_fec_ult_pag, m_pag_mes, m_cred_mes, m_dev_mes
) VALUES
(510764879071, 12980, 12965, 1, 
 -277.00, -277.00, 0.00, 0.00, 
 100.00, 0, 0.00, 0.00, 
 0.00, 777.00, 400.00, 0.00, 
 277.00, 0.00, 0.00, 0.00, 
 -277.00, 9, 15646, 0.00, 
 0.00, 0.00, 0.00, 0.00, 
 '2025-03-15 00:00:00', 12981, '0', 'N', 
 'N', '0', NULL, NULL, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, NULL, NULL, NULL),

(709683620545, 12980, 12965, 1, 
 -2000.00, -2000.00, 0.00, 0.00, 
 500.00, 0, 0.00, 0.00, 
 0.00, 2500.00, 2000.00, 0.00, 
 2000.00, 0.00, 0.00, 0.00, 
 -2000.00, 9, 15646, 0.00, 
 0.00, 0.00, 0.00, 0.00, 
 '2025-03-14 00:00:00', 12981, '0', 'N', 
 'N', '0', '520081', NULL, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, NULL, NULL, NULL),

(579103684604, 12980, 12965, 1, 
 0.00, 0.00, 0.00, 0.00, 
 800.00, 0, 0.00, 0.00, 
 0.00, 300.00, 400.00, 0.00, 
 0.00, 0.00, 0.00, 0.00, 
 0.00, 9, 15646, 0.00, 
 0.00, 0.00, 0.00, 0.00, 
 '2025-03-14 00:00:00', 12981, '0', 'N', 
 'N', '0', NULL, NULL, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, NULL, NULL, NULL),

(579103684111, 12980, 12965, 1, 
 -0.14, -0.14, 0.00, 0.00, 
 2000.00, 0, 0.00, 0.00, 
 0.00, 1000.14, 9000.14, 0.00, 
 0.14, 0.00, 0.00, 0.00, 
 -0.14, 9, 15646, 0.00, 
 0.00, 0.00, 0.00, 0.00, 
'2025-03-14 00:00:00', 12981, '0', 'N', 
 'N', '0', NULL, NULL, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, NULL, NULL, NULL),

(709146979789, 12980, 12965, 1, 
 0.00, 0.00, 0.00, 0.00, 
 0.00, 0, 0.00, 0.00, 
 0.00, 500.00, 0.00, 0.00, 
 0.00, 0.00, 0.00, 0.00, 
 0.00, 9, 15646, 0.00, 
 0.00, 0.00, 0.00, 0.00, 
 '2025-03-14 00:00:00', 12981, '0', 'N', 
 'N', '0', NULL, NULL, 
 NULL, NULL, NULL, NULL, 
 NULL, NULL, NULL, NULL, NULL);




 INSERT INTO datos_personas_fisica_p2(
    p2_id, p2_codent, p2_identcli, p2_tiporeg, p2_nombre, p2_apelli1, 
    p2_apelli2, p2_codpaisnct, p2_nompaisnct, p2_codpaisnac, 
    p2_nompaisnac, p2_codpaisres, p2_nompaisres, p2_sexper, 
    p2_indestciv, p2_regecon, p2_indtracor, p2_fecnac, 
    p2_codprof, p2_fecfelicita, p2_tipfelicita, p2_fecalta, 
    p2_fecbaja, p2_processdate
) VALUES 
(1, '0001', '44445555', 'P2', 'Juan', 'Pérez', 'Gómez', 
 484, 'México', 484, 'México', 484, 'México', 
 'M', 'S', 'E', '01', '1985-05-12', 'ENG', '0512', 'B', 
 '2023-01-01', '9999-12-31', 20241004),

(2, '0001', '45429131', 'P2', 'María', 'López', 'Martínez', 
 840, 'Estados Unidos', 484, 'México', 484, 'México', 
 'F', 'C', 'E', '02', '1990-11-20', 'DOC', '1120', 'A', 
 '2023-02-15', '9999-12-31', 20241004),

(3, '0001', '00004003', 'P2', 'Carlos', 'Hernández', 'Ramírez', 
 124, 'Canadá', 124, 'Canadá', 484, 'México', 
 'M', 'D', 'R', '03', '1978-03-05', 'TEC', '0305', 'C', 
 '2023-03-10', '9999-12-31', 20240914),

(4, '0001', '37479745', 'P2', 'Ana', 'García', 'Sánchez', 
 76, 'Francia', 76, 'Francia', 484, 'México', 
 'F', 'V', 'E', '04', '1995-07-18', 'ART', '0718', 'B', 
 '2023-04-25', '9999-12-31', 20241004);


 INSERT INTO datos_comunes_personas_p1 (
    p1_id, p1_codent, p1_identcli, p1_tiporeg, p1_tipdoc, p1_numdoc, 
    p1_tipper, p1_estper, p1_fecest, p1_tipclien, p1_subtipcli, 
    p1_codidioma, p1_bloqueo, p1_indrepos, p1_nivseg, p1_publicidad, 
    p1_indvip, p1_fecalta, p1_fecbaja, p1_cnae, p1_codcirbe, 
    p1_claveacc, p1_sitclave, p1_codcontrib, p1_processdate
) VALUES 
(1, '0001', '44445555', 'P1', 'R', '010002163', 
 'J', 'A', '2020-07-21', '01', '01', 
 'ES', 'N', 'S', 0, 'N', 
 'N', '2020-07-21', '0001-01-01', NULL, NULL, 
 NULL, NULL, NULL, 20241004),

(2, '0001', '45429131', 'P1', 'R', '0100033703001', 
 'J', 'A', '2021-09-30', '01', '01', 
 'ES', 'N', 'S', 0, 'N', 
 'N', '2021-09-30', '0001-01-01', NULL, NULL, 
 NULL, NULL, NULL, 20241004),

(3, '0001', '00004003', 'P1', 'R', '0100050376001', 
 'J', 'A', '2020-06-04', '01', '01', 
 'ES', 'N', 'S', 0, 'N', 
 'N', '2020-06-04', '0001-01-01', NULL, NULL, 
 NULL, NULL, NULL, 20240813),

(4, '0001', '37479745', 'P1', 'R', '0100058601001', 
 'J', 'A', '2022-07-04', '01', '01', 
 'ES', 'N', 'S', 0, 'N', 
 'N', '2022-07-04', '0001-01-01', NULL, NULL, 
 NULL, NULL, NULL, 20241004),

(5, '0001', '00004005', 'P1', 'R', '0100070622001', 
 'J', 'A', '2022-02-22', '01', '01', 
 'ES', 'N', 'S', 0, 'N', 
 'N', '2022-02-22', '0001-01-01', NULL, NULL, 
 NULL, NULL, NULL, 20240813);



 INSERT INTO medio_pago_tarjeta_mp(mp_cuenta, mp_identcli, mp_calpart,mp_pan, mp_status, mp_indsittar) VALUES
('510764879071', '44445555', 'TI', '6705571433573626','A', 17),
('709683620545', '45429131', 'TI', '1122571433573618', 'A',20),
('579103684604', '37479745', 'TI', '1122571433573257', 'A',20),
('639146979789', '00004003', 'BE', '6705571433430234', 'I', 17);




INSERT INTO cuenta_medio_pago_cu (
    cu_id, cu_codent, cu_centalta, cu_cuenta, cu_tiporeg, cu_numorden, 
    cu_fecultcar, cu_producto, cu_subprodu, cu_tipocto, cu_fecproven, 
    cu_fecultven, cu_fecresol, cu_identcli, cu_codblq, cu_indblqope, 
    cu_codestcta, cu_clasifcont, cu_fecultestcta, cu_codconven, cu_indctaemp, 
    cu_codbus, cu_codelemento, cu_tiprolcuenta, cu_inddomcarcre, cu_forpago, 
    cu_indsitcta, cu_ofigestora, cu_conprod, cu_fecbaja, cu_fecalta, 
    cu_indtipocto, cu_intgenmora, cu_porpagoa, cu_imppago, cu_numextpen, 
    cu_numultext, cu_grupoliq, cu_fecultfac, cu_fecantfac, cu_saldacre, 
    cu_saldorev, cu_motbaja, cu_tipbon, cu_codformato, cu_codcam, cu_fecultblq, 
    cu_salkact, cu_porriesg, cu_provriesact, cu_feccalriesact, cu_impdemandado, 
    cu_impdemant, cu_codcat, cu_fecaltacat, cu_fecmodcat, cu_fecbajacat, 
    cu_impdotgen, cu_numdiasact, cu_indcrefi, cu_fecrefi, cu_codestbcact, 
    cu_codestbcant, cu_fecultestbc, cu_processdate
) VALUES 
(1, '0001', '0178', '510764879071', 'CU', 38572827, 
 '2024-10-04', '08', '0828', 'PREPAGO', '2024-11-04', 
 '2023-10-04', '2024-10-01', '44445555', 0, 'N', 
 0, 'N', '2024-10-04', '0008', 0, 
 828, 8, 'U', 0, 03, 
 0, '0828', '082', '2024-10-04', '2024-10-04', 
 0, 82861109.0531, 82.8611, 8286110.90, 25, 
 26, 11, '2024-10-04', '2024-10-04', 155.55, 
 155.55, 1, 'PREMIO', 'AARÓNICAS', '999', '2024-10-04', 
 15000.05, 12.5225, 55555555.55, '2024-10-04', 1560055555258.91, 
 1560005555258.91, 'A', '2024-10-04', '2024-10-04', '2024-10-04', 
 1111111111111.11, 60, 'NV', '2024-10-04', 'B2', 
 'B2', '2024-10-04', 20241004),

(2, '0001', '0920', '709683620545', 'CU', 38305076, 
 '2024-10-04', '45', '4542', 'DEBITO', '2024-11-04', 
 '2023-10-04', '2024-10-01', '45429131', 4, 'S', 
 1, 'D', '2024-10-04', '0045', 1, 
 4542, 45, 'U', 4, 03, 
 2, '4542', '454', '2024-10-04', '2024-10-04', 
 4, 454291319.9381, 454.2913, 45429131.99, 25, 
 26, 11, '2024-10-04', '2024-10-04', 155.55, 
 155.55, 1, 'PREMIO', 'AARÓNICAS', '999', '2024-10-04', 
 15000.05, 12.5225, 55555555.55, '2024-10-04', 1560055555258.91, 
 1560005555258.91, 'A', '2024-10-04', '2024-10-04', '2024-10-04', 
 1111111111111.11, 60, 'NV', '2024-10-04', 'AAA-', 
 'AAA-', '2024-10-04', 20241004),
 
 (3, '0001', '0920', '579103684604', 'CU', 38305076, 
 '2024-10-04', '45', '4542', 'DEBITO', '2024-11-04', 
 '2023-10-04', '2024-10-01', '45429131', 4, 'S', 
 1, 'D', '2024-10-04', '0045', 1, 
 4542, 45, 'U', 4, 04, 
 2, '4542', '454', '2024-10-04', '2024-10-04', 
 4, 454291319.9381, 454.2913, 45429131.99, 25, 
 26, 11, '2024-10-04', '2024-10-04', 155.55, 
 155.55, 1, 'PREMIO', 'AARÓNICAS', '999', '2024-10-04', 
 15000.05, 12.5225, 55555555.55, '2024-10-04', 1560055555258.91, 
 1560005555258.91, 'A', '2024-10-04', '2024-10-04', '2024-10-04', 
 1111111111111.11, 60, 'NV', '2024-10-04', 'AAA-', 
 'AAA-', '2024-10-04', 20241004);



-- Insertar datos de prueba en `Lc`
INSERT INTO limite_cuenta_lc(lc_cuenta,lc_clamon1, lc_ctargo1, lc_clamon2, lc_ctargo2) VALUES
('510764879071',355, 'MTULH3MILIVV7JN10PICLI2C7BOB63',355, 'MTULH3MILIVV7JN10PICLI2C7BOB63'),
('709683620545',562, 'TXI7H6I2FXP3IOCE2XCCP4B699BJQ2',365, 'TXI7H6I2FXP3IOCE2XCCP4B699BJQ2'),
('639146979789',355, 'MTULH3MILIVV7JN10PICLI2C7BOB63',355, 'MTULH3MILIVV7JN10PICLI2C7BOB63'),
('579103684604',355, 'MTULH3MILIVV7JN10PICLI2C7BOB63',355, 'MTULH3MILIVV7JN10PICLI2C7BOB63');


-- Insertar datos de prueba en `ic`
INSERT INTO contrato_impagado_ic(ic_cuenta, ic_impago, ic_impapl,ic_numrecimp) VALUES
('510764879071', 692.38, 692.38,20),
('709683620545', 692.38, 692.38,20),
('639146979789', 562.38, 66.38,20),
('579103684604', 692.38, 92.38,20);



INSERT INTO recibido_impagado_ri(
    ri_id, ri_codent, ri_centalta, ri_cuenta, ri_tiporeg, ri_numorden, 
    ri_clamon, ri_numsecimp, ri_numsecrec, ri_fecalta, ri_fecemimov, 
    ri_fecvenmov, ri_imprec, ri_impago, ri_impapl, ri_fecultapl, 
    ri_fecenvcob, ri_processdate
) VALUES 
(1, '0001', '0782', '510764879071', 'RI', 42981166, 
 285, 285775209468592, 285775209468592, '2024-10-04', '2024-10-04', 
 '2024-10-04', 285775209468592.49, 285775209468592.49, 285775209468592.49, 
 '2024-10-04', '2024-10-04', 20241004),

(2, '0001', '0174', '709683620545', 'RI', 43378940, 
 285, 285775209468592, 285775209468592, '2024-10-04', '2024-10-04', 
 '2024-10-04', 285775209468592.49, 285775209468592.49, 285775209468592.49, 
 '2024-10-04', '2024-10-04', 20241004),
 
 (3, '0001', '0174', '639146979789', 'RI', 43378940, 
 285, 285775209468592, 285775209468592, '2024-10-04', '2024-10-04', 
 '2024-10-04', 285775209468592.49, 285775209468592.49, 285775209468592.49, 
 '2024-10-04', '2024-10-04', 20241004),
 
(4, '0001', '0174', '579103684604', 'RI', 43378940, 
 285, 285775209468592, 285775209468592, '2024-10-04', '2024-10-04', 
 '2024-10-04', 285775209468592.49, 285775209468592.49, 285775209468592.49, 
 '2024-10-04', '2024-10-04', 20241004);



 INSERT INTO venta_cartera_castigada (pan, cuenta, estado, fecha_venta, monto, descripcion)
VALUES 
('6705571433573626', '510764879071', '020', '2023-10-01', 1500.75, 'Cartera castigada por mora'),
('1122571433573618', '709683620545', '021', '2023-10-02', 2000.00, 'Cartera activa'),
('1122571433573257', '639146979789', '021', '2023-10-02', 2000.00, 'Cartera activa'),
('6705571433430234', '009876543210', '021', '2023-10-02', 2000.00, 'Cartera activa');



INSERT INTO emi_t_ext_cred_ex (
    ex_codent, ex_centalta, ex_cuenta, ex_pan, ex_tiporeg, ex_numorden, 
    ex_registro, ex_tokennegocio, ex_numextcta, ex_clamon, ex_indrep, 
    ex_desindrep, ex_forpago, ex_sigimptotpag, ex_imptotpag, 
    ex_sigimpmin, ex_impmin, ex_sigimpcargo, ex_impcargo, 
    ex_fecext, ex_fecliq, ex_fecliqant, ex_feccar, 
    ex_fecvalcar, ex_porint, ex_porpagoa, ex_sigimpexclim, 
    ex_impexclim, ex_sigimsalaplprx, ex_imsalaplprx, 
    ex_sigimpcargoant, ex_impcargoant, ex_numsecrec, 
    ex_inpfijoapl, ex_fecvenult, ex_fecvenpro, ex_processdate
) VALUES 
-- Registro 1
('001', '1001', '510764879071', '123456789012345', 'EX', 1, 
 'ABCDEFGHIJ', 'TOKEN00123456789012345678901234567', 1001, 84, 0, 
 'NORMAL', 1, '+', 5000.00, 
 '+', 3000.00, '+', 500.00, 
 '2025-03-30', '2025-03-30', '2025-3-12', '2025-01-01', 
 '2025-01-02', 15.0000, 10.0000, '+', 
 200.00, '+', 100.00, 
 '+', 50.00, 5001, 
 100.00, '2024-12-31', '2025-01-15', 20250225),

-- Registro 2
('001', '1002', '709683620545', '234567890123456', 'EX', 2, 
 'KLMNOPQRST', 'TOKEN00223456789012345678901234567', 1002, 84, 2, 
 'RELIQUIDADO', 2, '+', 8000.00, 
 '+', 5000.00, '+', 800.00, 
 '2025-03-30', '2025-03-30', '2025-03-12', '2025-01-02', 
 '2025-01-03', 12.5000, 8.5000, '+', 
 300.00, '+', 200.00, 
 '+', 100.00, 5002, 
 200.00, '2024-12-30', '2025-01-16', 20250225),

-- Registro 3
('001', '1003', '639146979789', '345678901234567', 'EX', 3, 
 'UVWXYZABCD', 'TOKEN00334567890123456789012345678', 1003, 84, 0, 
 'NORMAL', 0, '+', 10000.00, 
 '+', 7000.00, '+', 1200.00, 
 '2025-03-30', '2025-03-30', '2025-03-12', '2025-01-03', 
 '2025-01-04', 10.0000, 5.0000, '+', 
 400.00, '+', 300.00, 
 '+', 200.00, 5003, 
 300.00, '2024-12-29', '2025-01-17', 20250225),

-- Registro 4
('001', '1004', '579103684604', '456789012345678', 'EX', 4, 
 'EFGHIJKLMN', 'TOKEN00445678901234567890123456789', 1004, 84, 2, 
 'RELIQUIDADO', 1, '+', 20000.00, 
 '+', 15000.00, '+', 1800.00, 
 '2025-03-30', '2025-03-30', '205-03-12', '2025-01-04', 
 '2025-01-05', 7.5000, 4.5000, '+', 
 500.00, '+', 400.00, 
 '+', 300.00, 5004, 
 400.00, '2024-12-28', '2025-01-18', 20250225),

-- Registro 5
('001', '1005', '3344556677', '567890123456789', 'EX', 5, 
 'OPQRSTUVWX', 'TOKEN00556789012345678901234567890', 1005, 84, 0, 
 'NORMAL', 0, '+', 30000.00, 
 '+', 20000.00, '+', 2500.00, 
 '2025-03-30', '2025-03-30', '2025-03-12', '2025-01-05', 
 '2025-01-06', 5.0000, 2.5000, '+', 
 600.00, '+', 500.00, 
 '+', 400.00, 5005, 
 500.00, '2024-12-27', '2025-01-19', 20250225);



INSERT INTO `desgloce_por_linea_ultimo_recibido_dr` (`dr_cuenta`, `dr_fecvenmov`)
VALUES 
    ('510764879071', '2025-03-13'),
    ('709683620545', '2025-03-13'),
    ('579103684604', '2025-03-13'),
    ('639146979789', '2025-03-13');



INSERT INTO batch_procesos (batch_id, total_registros)
VALUES ('550e8400-e29b-41d4-a716-446655440000', 1000);




    