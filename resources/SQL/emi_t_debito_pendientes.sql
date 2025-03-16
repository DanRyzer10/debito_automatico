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