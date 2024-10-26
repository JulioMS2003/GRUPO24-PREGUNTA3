CREATE DATABASE  IF NOT EXISTS `bdbiblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdbiblioteca`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: bdbiblioteca
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `bibliotecario`
--

DROP TABLE IF EXISTS `bibliotecario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bibliotecario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `idcategoria` int NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idcategoria` (`idcategoria`),
  CONSTRAINT `bibliotecario_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bibliotecario`
--

LOCK TABLES `bibliotecario` WRITE;
/*!40000 ALTER TABLE `bibliotecario` DISABLE KEYS */;
INSERT INTO `bibliotecario` VALUES (1,'Carlos Jiménez',1,'987654321','cjimenez@biblioteca.com'),(2,'Laura Morales',2,'912345678','lmorales@biblioteca.com'),(3,'David Torres',3,'934567890','dtorres@biblioteca.com'),(4,'Ana Gutiérrez',4,'923456789','agutierrez@biblioteca.com'),(5,'Rosa López',5,'911223344','rlopez@biblioteca.com'),(6,'Miguel Romero',6,'922233344','mromero@biblioteca.com'),(7,'Miguel Osorio',7,'985675132','jaijsha@biblioteca.com'),(8,'Julio Manchay',8,'924866739','julimanchay4862@gmail.com');
/*!40000 ALTER TABLE `bibliotecario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Referencia','Se especializa en ayudar a los usuarios a encontrar información y recursos específicos'),(2,'Catalogación','Encargado de organizar y catalogar los materiales de la biblioteca'),(3,'Desarrollo de Colecciones','Se ocupa de seleccionar, adquirir y evaluar los materiales de la biblioteca'),(4,' Servicios para Niños','Especializado en la atención a los usuarios más jóvenes'),(5,'Servicios para Jóvenes','Bibliotecario enfocado en adolescentes.'),(6,'Tecnología de la Información','Se especializa en la implementación y el mantenimiento de tecnologías'),(7,'Académico','Trabaja en bibliotecas universitarias o académicas'),(8,'Archivos y Manuscritos','Gestión de colecciones especiales');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleprestamo`
--

DROP TABLE IF EXISTS `detalleprestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleprestamo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idprestamo` int NOT NULL,
  `idlibro` int NOT NULL,
  `instrucciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idprestamo` (`idprestamo`),
  KEY `idlibro` (`idlibro`),
  CONSTRAINT `detalleprestamo_ibfk_1` FOREIGN KEY (`idprestamo`) REFERENCES `prestamo` (`id`),
  CONSTRAINT `detalleprestamo_ibfk_2` FOREIGN KEY (`idlibro`) REFERENCES `libro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleprestamo`
--

LOCK TABLES `detalleprestamo` WRITE;
/*!40000 ALTER TABLE `detalleprestamo` DISABLE KEYS */;
INSERT INTO `detalleprestamo` VALUES (1,1,1,'Leer durante 1 mes'),(2,2,2,'Devolver en buen estado'),(3,3,3,'Mantener el libro seco'),(4,4,4,'No marcar las páginas'),(5,5,5,'Consultar con el bibliotecario si hay dudas'),(6,6,6,'Leer en un plazo de 2 semanas'),(7,7,7,'Consultar con el bibliotecario si hay dudas'),(8,8,8,'Mantener el libro seco');
/*!40000 ALTER TABLE `detalleprestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'Cien años de soledad','Gabriel García Márquez',30.00),(2,'El amor en los tiempos del cólera','Gabriel García Márquez',25.00),(3,'Don Quijote de la Mancha','Miguel de Cervantes',35.00),(4,'La casa de los espíritus','Isabel Allende',28.00),(5,'1984','George Orwell',22.00),(6,'Ficciones','Jorge Luis Borges',20.00),(7,'El túnel','Ernesto Sabato',18.00),(8,'Crónica de una muerte anunciada','Gabriel García Márquez',24.00);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembro`
--

DROP TABLE IF EXISTS `miembro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembro`
--

LOCK TABLES `miembro` WRITE;
/*!40000 ALTER TABLE `miembro` DISABLE KEYS */;
INSERT INTO `miembro` VALUES (1,'Juan Pérez','Av. Literatura 123','987654321','1985-07-15'),(2,'María García','Calle Libros 456','912345678','1990-10-22'),(3,'Luis Mendoza','Jr. Novelas 789','921234567','1978-03-09'),(4,'Ana Romero','Av. Autores 101','934567890','1982-12-05'),(5,'Carlos Ruiz','Jr. Lectura 202','923456789','1995-01-15'),(6,'Rosa Flores','Av. Páginas 303','911223344','1988-06-30'),(7,'Jorge Valdez','Jr. Biblioteca 404','922233344','1979-11-20'),(8,'Patricia Ríos','Av. Historias 505','931234567','1993-05-25');
/*!40000 ALTER TABLE `miembro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idmiembro` int NOT NULL,
  `idlibro` int NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idmiembro` (`idmiembro`),
  KEY `idlibro` (`idlibro`),
  CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`idmiembro`) REFERENCES `miembro` (`id`),
  CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`idlibro`) REFERENCES `libro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
INSERT INTO `prestamo` VALUES (1,1,1,'2024-10-01',NULL,'Lectura personal'),(2,2,2,'2024-10-02','2024-10-10','Lectura en grupo'),(3,3,3,'2024-10-03',NULL,'Investigación'),(4,4,4,'2024-10-04','2024-10-12','Lectura de placer'),(5,5,5,'2024-10-05',NULL,'Preparación para examen'),(6,6,6,'2024-10-06','2024-10-14','Recomendación'),(7,7,7,'2023-10-06',NULL,'Recomendación'),(8,8,8,'2023-04-06','2023-05-14','Preparación para examen');
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-23  6:46:14
