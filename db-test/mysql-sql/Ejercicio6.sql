CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `idAUTOR` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `LIBRO_idLIBRO` int NOT NULL,
  PRIMARY KEY (`idAUTOR`),
  KEY `fk_AUTOR_LIBRO1_idx` (`LIBRO_idLIBRO`),
  CONSTRAINT `fk_AUTOR_LIBRO1` FOREIGN KEY (`LIBRO_idLIBRO`) REFERENCES `libro` (`idLIBRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Gabriel','García Márquez',1),(2,'Umberto','Eco',2),(3,'Miguel','de Cervantes',3),(4,'George','Orwell',4),(5,'J.K.','Rowling',5),(6,'Dan','Brown',6),(7,'J.R.R.','Tolkien',7),(8,'Jane','Austen',8),(9,'Fyodor','Dostoevsky',9),(10,'Antoine','de Saint-Exupéry',10),(11,'Aldous','Huxley',11),(12,'Carlos','Ruiz Zafón',12),(13,'Paulo','Coelho',13),(14,'Yuval Noah','Harari',14),(15,'Isabel','Allende',15),(16,'Ernesto','Sábato',16),(17,'Julio','Cortázar',17),(18,'Franz','Kafka',18),(19,'Oscar','Wilde',19),(20,'Ray','Bradbury',20);
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejemplar`
--

DROP TABLE IF EXISTS `ejemplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejemplar` (
  `idEJEMPLAR` int NOT NULL,
  `idLIBRO` int DEFAULT NULL,
  `codigo_inventario` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `ubicacion` varchar(45) DEFAULT NULL,
  `PRESTAMO_idPRESTAMO` int NOT NULL,
  PRIMARY KEY (`idEJEMPLAR`),
  KEY `fk_EJEMPLAR_PRESTAMO1_idx` (`PRESTAMO_idPRESTAMO`),
  CONSTRAINT `fk_EJEMPLAR_PRESTAMO1` FOREIGN KEY (`PRESTAMO_idPRESTAMO`) REFERENCES `prestamo` (`idPRESTAMO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejemplar`
--

LOCK TABLES `ejemplar` WRITE;
/*!40000 ALTER TABLE `ejemplar` DISABLE KEYS */;
INSERT INTO `ejemplar` VALUES (1,1,'INV-2024-001','Disponible','Estante A1',1),(2,2,'INV-2024-002','Disponible','Estante A2',2),(3,3,'INV-2024-003','Disponible','Estante A3',3),(4,4,'INV-2024-004','Disponible','Estante B1',4),(5,5,'INV-2024-005','Disponible','Estante B2',5),(6,6,'INV-2024-006','Perdido','Estante B3',6),(7,7,'INV-2024-007','Disponible','Estante C1',7),(8,8,'INV-2024-008','Disponible','Estante C2',8),(9,9,'INV-2024-009','Deteriorado','Estante C3',9),(10,10,'INV-2024-010','Disponible','Estante D1',10),(11,11,'INV-2024-011','Disponible','Estante D2',11),(12,12,'INV-2024-012','Prestado','Estante D3',12),(13,13,'INV-2024-013','Disponible','Estante E1',13),(14,14,'INV-2024-014','Disponible','Estante E2',14),(15,15,'INV-2024-015','Disponible','Estante E3',15),(16,16,'INV-2024-016','Disponible','Estante F1',16),(17,17,'INV-2024-017','Disponible','Estante F2',17),(18,18,'INV-2024-018','Deteriorado','Estante F3',18),(19,19,'INV-2024-019','Disponible','Estante G1',19),(20,20,'INV-2024-020','Prestado','Estante G2',20);
/*!40000 ALTER TABLE `ejemplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `codigo` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `contrasena` varchar(45) DEFAULT NULL,
  `rol` varchar(45) DEFAULT NULL,
  `USUARIO_idUSUARIO` int NOT NULL,
  KEY `fk_EMPLEADO_USUARIO1_idx` (`USUARIO_idUSUARIO`),
  CONSTRAINT `fk_EMPLEADO_USUARIO1` FOREIGN KEY (`USUARIO_idUSUARIO`) REFERENCES `usuario` (`idUSUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('EMP001','roberto.o','empPass1','Bibliotecario',17),('EMP002','marta.m','empPass2','Auxiliar',18),('EMP003','javier.h','empPass3','Bibliotecario',19),('EMP004','rosa.r','empPass4','Administrador',20),('EMP005','carlos.g','empPass5','Auxiliar',1),('EMP006','maria.f','empPass6','Auxiliar',2),('EMP007','juan.m','empPass7','Bibliotecario',3),('EMP008','ana.s','empPass8','Auxiliar',4),('EMP009','luis.r','empPass9','Bibliotecario',5),('EMP010','laura.g','empPassA','Auxiliar',6),('EMP011','pedro.l','empPassB','Bibliotecario',7),('EMP012','elena.d','empPassC','Auxiliar',8),('EMP013','miguel.m','empPassD','Supervisor',9),('EMP014','sofia.j','empPassE','Auxiliar',10),('EMP015','andres.r','empPassF','Bibliotecario',11),('EMP016','carmen.t','empPassG','Auxiliar',12),('EMP017','fran.c','empPassH','Bibliotecario',13),('EMP018','isabel.v','empPassI','Auxiliar',14),('EMP019','david.b','empPassJ','Supervisor',15),('EMP020','patricia.n','empPassK','Auxiliar',16);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `idLIBRO` int NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `isbn` varchar(45) DEFAULT NULL,
  `anio_publicacion` int DEFAULT NULL,
  `editorial` varchar(45) DEFAULT NULL,
  `idAUTOR` varchar(45) DEFAULT NULL,
  `EJEMPLAR_idEJEMPLAR` int NOT NULL,
  PRIMARY KEY (`idLIBRO`,`EJEMPLAR_idEJEMPLAR`),
  KEY `fk_LIBRO_EJEMPLAR1_idx` (`EJEMPLAR_idEJEMPLAR`),
  CONSTRAINT `fk_LIBRO_EJEMPLAR1` FOREIGN KEY (`EJEMPLAR_idEJEMPLAR`) REFERENCES `ejemplar` (`idEJEMPLAR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'Cien años de soledad','978-84-376-0494-7',1967,'Sudamericana','1',1),(2,'El nombre de la rosa','978-84-350-0008-4',1980,'Lumen','2',2),(3,'Don Quijote de la Mancha','978-84-206-3492-4',1605,'Alfaguara','3',3),(4,'1984','978-84-233-0977-0',1949,'Destino','4',4),(5,'Harry Potter y la piedra filosofal','978-84-978-5325-1',1997,'Salamandra','5',5),(6,'El código Da Vinci','978-84-017-1124-1',2003,'Umbriel','6',6),(7,'El señor de los anillos','978-84-450-7179-3',1954,'Minotauro','7',7),(8,'Orgullo y prejuicio','978-84-376-0272-1',1813,'Alianza Editorial','8',8),(9,'Crimen y castigo','978-84-206-7358-9',1866,'Alianza Editorial','9',9),(10,'El principito','978-84-261-2815-4',1943,'Salamandra','10',10),(11,'Brave New World','978-84-233-3419-2',1932,'Plaza & Janés','11',11),(12,'La sombra del viento','978-84-08-04366-7',2001,'Planeta','12',12),(13,'El alquimista','978-84-08-04123-6',1988,'Planeta','13',13),(14,'Sapiens: de animales a dioses','978-84-9942-292-0',2011,'Debate','14',14),(15,'La casa de los espíritus','978-84-672-1430-2',1982,'Plaza & Janés','15',15),(16,'El túnel','978-84-233-0614-4',1948,'Seix Barral','16',16),(17,'Rayuela','978-84-350-0011-4',1963,'Sudamericana','17',17),(18,'La metamorfosis','978-84-206-0214-5',1915,'Alianza Editorial','18',18),(19,'El retrato de Dorian Gray','978-84-206-1462-9',1890,'Valdemar','19',19),(20,'Fahrenheit 451','978-84-233-3397-3',1953,'Minotauro','20',20);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso` (
  `idPERMISO` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPERMISO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (1,'VER_CATALOGO','Ver el catálogo de libros'),(2,'REALIZAR_PRESTAMO','Crear nuevos préstamos'),(3,'DEVOLVER_EJEMPLAR','Registrar devoluciones'),(4,'GESTIONAR_SOCIOS','Alta, baja y modificación de socios'),(5,'GESTIONAR_LIBROS','Alta, baja y modificación de libros'),(6,'GESTIONAR_EMPLEADOS','Alta, baja y modificación de empleados'),(7,'APLICAR_SANCION','Crear y modificar sanciones'),(8,'CONSULTAR_HISTORIAL','Ver historial de préstamos'),(9,'GENERAR_INFORMES','Generar informes y estadísticas'),(10,'CONFIGURAR_SISTEMA','Configuración general del sistema'),(11,'RENOVAR_PRESTAMO','Renovar préstamos activos'),(12,'RESERVAR_EJEMPLAR','Reservar ejemplares disponibles'),(13,'VER_SANCIONES','Consultar sanciones propias'),(14,'BUSCAR_SOCIOS','Buscar y consultar información de socios'),(15,'EDITAR_CATALOGO','Editar información bibliográfica'),(16,'ELIMINAR_REGISTROS','Eliminar registros del sistema'),(17,'GESTIONAR_ROLES','Asignar y modificar roles de usuario'),(18,'GESTIONAR_PERMISOS','Asignar y revocar permisos'),(19,'VER_LOGS','Consultar registros de actividad'),(20,'ENVIAR_NOTIFICACIONES','Enviar avisos a socios');
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `idPRESTAMO` int NOT NULL,
  `idSOCIO` int DEFAULT NULL,
  `idEJEMPLAR` int DEFAULT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_devolucion_prevista` date DEFAULT NULL,
  `fecha_devolucion_real` date DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `SANCION_idSANCION` int NOT NULL,
  PRIMARY KEY (`idPRESTAMO`),
  KEY `fk_PRESTAMO_SANCION1_idx` (`SANCION_idSANCION`),
  CONSTRAINT `fk_PRESTAMO_SANCION1` FOREIGN KEY (`SANCION_idSANCION`) REFERENCES `sancion` (`idSANCION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
INSERT INTO `prestamo` VALUES (1,1,1,'2024-01-05','2024-01-19','2024-01-22','Devuelto',1),(2,2,2,'2024-01-10','2024-01-24','2024-01-26','Devuelto',2),(3,3,3,'2024-01-15','2024-01-29','2024-01-29','Devuelto',3),(4,4,4,'2024-01-20','2024-02-03','2024-02-10','Devuelto',4),(5,5,5,'2024-02-01','2024-02-15','2024-02-18','Devuelto',5),(6,6,6,'2024-02-05','2024-02-19',NULL,'Perdido',6),(7,7,7,'2024-02-10','2024-02-24','2024-02-24','Devuelto',7),(8,8,8,'2024-02-15','2024-03-01','2024-03-04','Devuelto',8),(9,9,9,'2024-02-20','2024-03-05','2024-03-08','Devuelto',9),(10,10,10,'2024-03-01','2024-03-15','2024-03-15','Devuelto',10),(11,11,11,'2024-03-05','2024-03-19','2024-03-22','Devuelto',11),(12,12,12,'2024-03-10','2024-03-24',NULL,'Activo',12),(13,13,13,'2024-03-15','2024-03-29','2024-03-29','Devuelto',13),(14,14,14,'2024-03-20','2024-04-03','2024-04-06','Devuelto',14),(15,15,15,'2024-04-01','2024-04-15','2024-04-18','Devuelto',15),(16,16,16,'2024-04-05','2024-04-19','2024-04-19','Devuelto',16),(17,17,17,'2024-04-10','2024-04-24','2024-04-27','Devuelto',17),(18,18,18,'2024-04-15','2024-04-29','2024-05-02','Devuelto',18),(19,19,19,'2024-04-20','2024-05-04','2024-05-04','Devuelto',19),(20,20,20,'2024-05-01','2024-05-15',NULL,'Activo',20);
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idROL` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `USUARIO_idUSUARIO` int NOT NULL,
  PRIMARY KEY (`idROL`),
  KEY `fk_ROL_USUARIO_idx` (`USUARIO_idUSUARIO`),
  CONSTRAINT `fk_ROL_USUARIO` FOREIGN KEY (`USUARIO_idUSUARIO`) REFERENCES `usuario` (`idUSUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador','Acceso total al sistema',20),(2,'Bibliotecario','Gestión de préstamos y catálogo',19),(3,'Auxiliar','Apoyo en tareas administrativas',18),(4,'Socio','Usuario con carnet de biblioteca',1),(5,'Socio','Usuario con carnet de biblioteca',2),(6,'Socio','Usuario con carnet de biblioteca',3),(7,'Socio','Usuario con carnet de biblioteca',4),(8,'Socio','Usuario con carnet de biblioteca',5),(9,'Socio','Usuario con carnet de biblioteca',6),(10,'Socio','Usuario con carnet de biblioteca',7),(11,'Socio','Usuario con carnet de biblioteca',8),(12,'Socio','Usuario con carnet de biblioteca',9),(13,'Socio','Usuario con carnet de biblioteca',10),(14,'Socio','Usuario con carnet de biblioteca',11),(15,'Socio','Usuario con carnet de biblioteca',12),(16,'Socio','Usuario con carnet de biblioteca',13),(17,'Socio','Usuario con carnet de biblioteca',14),(18,'Socio','Usuario con carnet de biblioteca',15),(19,'Supervisor','Supervisión del personal',17),(20,'Socio','Usuario con carnet de biblioteca',16);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_has_permiso`
--

DROP TABLE IF EXISTS `rol_has_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_has_permiso` (
  `ROL_idROL` int NOT NULL,
  `PERMISO_idPERMISO` int NOT NULL,
  PRIMARY KEY (`ROL_idROL`,`PERMISO_idPERMISO`),
  KEY `fk_ROL_has_PERMISO_PERMISO1_idx` (`PERMISO_idPERMISO`),
  KEY `fk_ROL_has_PERMISO_ROL1_idx` (`ROL_idROL`),
  CONSTRAINT `fk_ROL_has_PERMISO_PERMISO1` FOREIGN KEY (`PERMISO_idPERMISO`) REFERENCES `permiso` (`idPERMISO`),
  CONSTRAINT `fk_ROL_has_PERMISO_ROL1` FOREIGN KEY (`ROL_idROL`) REFERENCES `rol` (`idROL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_has_permiso`
--

LOCK TABLES `rol_has_permiso` WRITE;
/*!40000 ALTER TABLE `rol_has_permiso` DISABLE KEYS */;
INSERT INTO `rol_has_permiso` VALUES (1,1),(2,1),(3,1),(4,1),(1,2),(2,2),(3,2),(1,3),(2,3),(3,3),(1,4),(1,5),(1,6),(2,7),(2,8),(19,9),(1,10),(4,11),(4,12),(4,13);
/*!40000 ALTER TABLE `rol_has_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sancion`
--

DROP TABLE IF EXISTS `sancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sancion` (
  `idSANCION` int NOT NULL,
  `idPRESTAMO` int DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `motivo` varchar(45) DEFAULT NULL,
  `SANCIONcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSANCION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sancion`
--

LOCK TABLES `sancion` WRITE;
/*!40000 ALTER TABLE `sancion` DISABLE KEYS */;
INSERT INTO `sancion` VALUES (1,1,5,'Devolución tardía','Leve'),(2,2,10,'Libro con daños menores','Moderada'),(3,3,0,'Sin sanción','Ninguna'),(4,4,15,'Devolución tardía','Grave'),(5,5,5,'Devolución tardía','Leve'),(6,6,20,'Libro perdido','Grave'),(7,7,0,'Sin sanción','Ninguna'),(8,8,5,'Devolución tardía','Leve'),(9,9,10,'Libro con daños menores','Moderada'),(10,10,0,'Sin sanción','Ninguna'),(11,11,5,'Devolución tardía','Leve'),(12,12,25,'Libro destruido','Grave'),(13,13,0,'Sin sanción','Ninguna'),(14,14,5,'Devolución tardía','Leve'),(15,15,10,'Libro con manchas','Moderada'),(16,16,0,'Sin sanción','Ninguna'),(17,17,5,'Devolución tardía','Leve'),(18,18,15,'Páginas rasgadas','Moderada'),(19,19,0,'Sin sanción','Ninguna'),(20,20,5,'Devolución tardía','Leve');
/*!40000 ALTER TABLE `sancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socio`
--

DROP TABLE IF EXISTS `socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socio` (
  `idSOCIO` int NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `contador_sanciones` int DEFAULT NULL,
  `PRESTAMO_idPRESTAMO` int NOT NULL,
  PRIMARY KEY (`idSOCIO`),
  KEY `fk_SOCIO_PRESTAMO1_idx` (`PRESTAMO_idPRESTAMO`),
  CONSTRAINT `fk_SOCIO_PRESTAMO1` FOREIGN KEY (`PRESTAMO_idPRESTAMO`) REFERENCES `prestamo` (`idPRESTAMO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
INSERT INTO `socio` VALUES (1,'612345678',1,1),(2,'623456789',1,2),(3,'634567890',0,3),(4,'645678901',1,4),(5,'656789012',1,5),(6,'667890123',2,6),(7,'678901234',0,7),(8,'689012345',1,8),(9,'690123456',1,9),(10,'601234567',0,10),(11,'611223344',1,11),(12,'622334455',2,12),(13,'633445566',0,13),(14,'644556677',1,14),(15,'655667788',1,15),(16,'666778899',0,16),(17,'677889900',1,17),(18,'688990011',1,18),(19,'699001122',0,19),(20,'600112233',1,20);
/*!40000 ALTER TABLE `socio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUSUARIO` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `SOCIO_idSOCIO` int NOT NULL,
  PRIMARY KEY (`idUSUARIO`),
  KEY `fk_USUARIO_SOCIO1_idx` (`SOCIO_idSOCIO`),
  CONSTRAINT `fk_USUARIO_SOCIO1` FOREIGN KEY (`SOCIO_idSOCIO`) REFERENCES `socio` (`idSOCIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Carlos','García López','carlos.garcia@email.com','pass1234','2023-01-10','Socio',1),(2,'María','Fernández Ruiz','maria.fernandez@email.com','pass2345','2023-02-15','Socio',2),(3,'Juan','Martínez Díaz','juan.martinez@email.com','pass3456','2023-03-20','Socio',3),(4,'Ana','Sánchez Moreno','ana.sanchez@email.com','pass4567','2023-04-05','Socio',4),(5,'Luis','Rodríguez Jiménez','luis.rodriguez@email.com','pass5678','2023-05-12','Socio',5),(6,'Laura','González Pérez','laura.gonzalez@email.com','pass6789','2023-06-18','Socio',6),(7,'Pedro','López Torres','pedro.lopez@email.com','pass7890','2023-07-22','Socio',7),(8,'Elena','Díaz Castro','elena.diaz@email.com','pass8901','2023-08-30','Socio',8),(9,'Miguel','Moreno Vega','miguel.moreno@email.com','pass9012','2023-09-14','Socio',9),(10,'Sofía','Jiménez Reyes','sofia.jimenez@email.com','pass0123','2023-10-08','Socio',10),(11,'Andrés','Ruiz Blanco','andres.ruiz@email.com','passABCD','2023-11-02','Socio',11),(12,'Carmen','Torres Navarro','carmen.torres@email.com','passEFGH','2023-12-15','Socio',12),(13,'Francisco','Castro Ortega','fran.castro@email.com','passIJKL','2024-01-20','Socio',13),(14,'Isabel','Vega Molina','isabel.vega@email.com','passMNOP','2024-02-10','Socio',14),(15,'David','Blanco Herrera','david.blanco@email.com','passQRST','2024-03-05','Socio',15),(16,'Patricia','Navarro Ramos','patricia.navarro@email.com','passUVWX','2024-03-25','Socio',16),(17,'Roberto','Ortega Serrano','roberto.ortega@email.com','passYZ12','2024-04-15','Empleado',17),(18,'Marta','Molina Delgado','marta.molina@email.com','pass3456','2024-04-20','Empleado',18),(19,'Javier','Herrera Gil','javier.herrera@email.com','pass7890','2024-05-01','Empleado',19),(20,'Rosa','Ramos Santos','rosa.ramos@email.com','passADMIN','2024-05-10','Admin',20);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18  8:47:51
