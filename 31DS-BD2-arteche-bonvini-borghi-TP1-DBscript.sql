CREATE DATABASE  IF NOT EXISTS `31bd2artechebonviniborghitp1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `31bd2artechebonviniborghitp1`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: 31bd2artechebonviniborghitp1
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `dni` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `calle` varchar(30) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `altura` int DEFAULT NULL,
  PRIMARY KEY (`dni`),
  KEY `calle` (`calle`,`ciudad`,`altura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (10111213,'Luis','Navarro','1101112131','luis@gmail.com',49,'AlmaFuerte','Rosario',1556),(12345678,'Lucía','Martínez','1112345678','lucia@gmail.com',21,'Santa Fe','Rosario',2859),(20252525,'Federico','Luna','1111222333','federico.luna@gmail.com',31,'Avellaneda','Rosario',1565),(22334455,'Juan','Gómez','1122334455','juan@hotmail.com',22,'Rodriguez','Rosario',1155),(33445566,'Ana','López','1133445566','ana@gmail.com',33,'San Lorenzo','Rosario',1552),(44556677,'Pedro','Fernández','1144556677','pedro@yahoo.com',23,'San Rodriguez','Rosario',1999),(55667788,'Marta','Pérez','1155667788','marta@gmail.com',24,'San Juan','Rosario',1553),(66778899,'Sofía','Torres','1166778899','sofia@gmail.com',35,'Oroño','Rosario',1554),(77889900,'Carlos','García','1177889900','carlos@gmail.com',26,'Balcarce','Rosario',1545),(88990011,'Diego','Romero','1188990011','diego@gmail.com',27,'Viamonte','Rosario',1655),(99001122,'Laura','Mendoza','1199001122','laura@gmail.com',38,'Avellaneda','Rosario',1565);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `legajo` varchar(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `numero_rol` int DEFAULT NULL,
  `turno` enum('mañana','tarde') DEFAULT NULL,
  PRIMARY KEY (`legajo`),
  KEY `numero_rol` (`numero_rol`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`numero_rol`) REFERENCES `rol` (`numero_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('1329458','lucas','343433','martinez',NULL,NULL,1,NULL),('132945833','lucas','343433','martinez','juanpe@hotmail.com',25,1,'mañana'),('1329458332','lucas','343433','martinez','juanpe@hotmail.com',25,1,'mañana'),('4116695','lucas','martinez','34343','juanpe@hotmail.com',25,NULL,'mañana'),('411669583','lucas','343433','martinez','juanpe@hotmail.com',25,NULL,'mañana'),('515315','lucas','becerra',NULL,NULL,NULL,1,NULL),('A-543','Juan','Pérez','1234567890','juan.perez@gmail.com',28,1,'mañana'),('A-5432','Carlos','López','1234567892','carlos.lopez@gmail.com',25,3,'mañana'),('A-5521','María','Gómez','1234567891','maria.gomez@gmail.com',32,2,'tarde'),('A-5598','Laura','Fernández','1234567895','laura.fernandez@gmail.com',27,6,'tarde'),('A-9833','Martín','Ramírez','1234567898','martin.ramirez@gmail.com',33,9,'mañana'),('B-3302','Diego','Sánchez','1234567896','diego.sanchez@gmail.com',29,7,'mañana'),('B-7733','Valeria','Ruiz','1234567899','valeria.ruiz@gmail.com',26,10,'tarde'),('B-7837','Ana','Martínez','1234567893','ana.martinez@gmail.com',30,4,'tarde'),('B-8232','Sofía','Torres','1234567897','sofia.torres@gmail.com',31,8,'tarde'),('B-9383','Luis','Rodríguez','1234567894','luis.rodriguez@gmail.com',35,5,'mañana');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `rol_por_defecto` BEFORE INSERT ON `empleado` FOR EACH ROW BEGIN
    IF NEW.numero_rol IS NULL THEN
        SET NEW.numero_rol = 1;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `numero_estado` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`numero_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Recibida'),(2,'Etiquetada'),(3,'Clasificada'),(4,'En lavado'),(5,'Enjuagada'),(6,'En secado'),(7,'Planchado'),(8,'Control de calidad'),(9,'Empaquetada'),(10,'Lista para entrega');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `numero_orden` int NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `total_abonado` int DEFAULT NULL,
  `fecha_estimada` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `dni_cliente` int DEFAULT NULL,
  `legajo_empleado` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`numero_orden`),
  KEY `dni_cliente` (`dni_cliente`),
  KEY `legajo_empleado` (`legajo_empleado`),
  CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`dni_cliente`) REFERENCES `cliente` (`dni`),
  CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`legajo_empleado`) REFERENCES `empleado` (`legajo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (1,'2025-05-01',1000,'2025-05-05','2025-05-04',12345678,'A-543'),(3,'2025-05-04',1500,'2025-05-08',NULL,44556677,'B-7837'),(4,'2025-05-05',1000,'2025-05-09','2025-09-16',55667788,'B-9383'),(5,'2025-05-06',800,'2025-05-10',NULL,66778899,'A-5598'),(6,'2025-05-07',2000,'2025-05-11',NULL,77889900,'B-3302'),(7,'2025-05-08',1000,'2025-05-12','2025-05-11',88990011,'B-8232'),(8,'2025-05-09',600,'2025-05-13',NULL,99001122,'A-9833'),(9,'2025-05-10',2300,'2025-05-14','2025-05-14',10111213,'B-7733');
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_servicio`
--

DROP TABLE IF EXISTS `orden_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_servicio` (
  `numero_orden` int NOT NULL,
  `nombre_servicio` varchar(30) NOT NULL,
  `cantidad` int DEFAULT '1',
  `precio_unitario` int DEFAULT NULL,
  PRIMARY KEY (`numero_orden`,`nombre_servicio`),
  KEY `nombre_servicio` (`nombre_servicio`),
  CONSTRAINT `orden_servicio_ibfk_1` FOREIGN KEY (`numero_orden`) REFERENCES `orden` (`numero_orden`),
  CONSTRAINT `orden_servicio_ibfk_2` FOREIGN KEY (`nombre_servicio`) REFERENCES `servicio` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_servicio`
--

LOCK TABLES `orden_servicio` WRITE;
/*!40000 ALTER TABLE `orden_servicio` DISABLE KEYS */;
INSERT INTO `orden_servicio` VALUES (1,'Lavado',1,1000),(3,'Lavado Especial',1,1500),(4,'Lavado',1,1000),(5,'Planchado',1,800),(6,'Reparación',1,2000),(7,'Lavado',1,1000),(8,'Secado',1,600),(9,'Lavado Especial',1,1500),(10,'Planchado',1,800);
/*!40000 ALTER TABLE `orden_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `numero_rol` int NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`numero_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Recepcionista de prendas'),(2,'Clasificador de ropa'),(3,'Lavador'),(4,'Secador'),(5,'Planchador'),(6,'Inspector de calidad'),(7,'Costurero'),(8,'Empaquetador'),(9,'Encargado de entregas'),(10,'Supervisor de turno');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `nombre` varchar(30) NOT NULL,
  `precio` int DEFAULT NULL,
  `descripcion` text,
  `numero_estado` int DEFAULT NULL,
  `tipo_prenda` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nombre`),
  KEY `numero_estado` (`numero_estado`),
  CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`numero_estado`) REFERENCES `estado` (`numero_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES ('Desmanchado',1200,'Tratamiento para remover manchas difíciles',5,'camisa'),('Impermeabilización',1800,'Aplicación de impermeabilizante para prendas de abrigo',8,'campera'),('Lavado',1000,'Lavado estándar de prendas comunes',10,'camisa'),('Lavado a mano',1400,'Lavado manual para tejidos finos',4,'pulover'),('Lavado Especial',1500,'Lavado especial para prendas delicadas',4,'blusa'),('Planchado',800,'Planchado profesional para prendas de vestir',10,'pantalon'),('Planchado Deluxe',1100,'Planchado a vapor para ropa de lujo',7,'blusa'),('Reparación',2000,'Costura, parches y arreglos menores',7,'jean'),('Secado',600,'Secado controlado según tipo de tela',6,'remera'),('Tintura',1300,'Tintura para ropa de algodón y lino',3,'falda');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database '31bd2artechebonviniborghitp1'
--

--
-- Dumping routines for database '31bd2artechebonviniborghitp1'
--
/*!50003 DROP FUNCTION IF EXISTS `calculo_dias_entrega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `calculo_dias_entrega`(p_numero_orden INT) RETURNS int
    DETERMINISTIC
BEGIN
     DECLARE diferencia INT;
      SELECT DATEDIFF(fecha_estimada, fecha_inicio)
  INTO diferencia
      FROM orden
  WHERE numero_orden = p_numero_orden;
      RETURN diferencia;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_estado_orden` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `actualizar_estado_orden`(
    IN p_numero_orden INT,
    IN p_numero_estado INT
)
BEGIN
    DECLARE servicio_nombre_actualizar VARCHAR(50);

        IF EXISTS (SELECT 1 FROM orden WHERE numero_orden = p_numero_orden) THEN
			SELECT s.nombre INTO servicio_nombre_actualizar FROM orden o
			JOIN orden_servicio os ON os.numero_orden = o.numero_orden
			JOIN servicio s ON s.nombre = os.nombre_servicio
            WHERE o.numero_orden = p_numero_orden;
            
			IF servicio_nombre_actualizar IS NULL THEN
				SIGNAL SQLSTATE '45000'
					SET MESSAGE_TEXT = 'El estado ingresado no existe en la tabla estado';
			ELSE
				UPDATE servicio
				SET numero_estado = p_numero_estado
				WHERE nombre = servicio_nombre_actualizar;
			END IF;
        ELSE
			SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'La orden no existe';
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-16  1:02:04
