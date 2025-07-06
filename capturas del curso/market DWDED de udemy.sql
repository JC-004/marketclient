CREATE DATABASE  IF NOT EXISTS `market` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `market`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: market
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'alimentación','comida rápida, carnes y pescados'),(2,'deportes','ropa y material deportivo'),(3,'bricolage','tareas de hogar y automovil'),(4,'electrónica','televisiones, ordenadores y pequeño electrodoméstico');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `usuario` varchar(40) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('prueba','prueba','prueba','dir prueba','prueba@gmail.com'),('qqqq','qqqqq','qqqq','qqqqq','qqqqq'),('user1','user1','usuario1','direccion1','usuario1@gmail.com'),('user2','user2','usuario2','direccion2','usuario2@gmail.com'),('user3','user3','usuario 3','el usuario 3','usuario3@gmail.com'),('yos','yos','yo','fff','rrr');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementospedido`
--

DROP TABLE IF EXISTS `elementospedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementospedido` (
  `idElementosPedido` int NOT NULL AUTO_INCREMENT,
  `idPedidoFk` int DEFAULT NULL,
  `idProductoFk` int DEFAULT NULL,
  `unidades` int DEFAULT NULL,
  PRIMARY KEY (`idElementosPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Describe el contenido de cada pedido';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementospedido`
--

LOCK TABLES `elementospedido` WRITE;
/*!40000 ALTER TABLE `elementospedido` DISABLE KEYS */;
INSERT INTO `elementospedido` VALUES (11,7,5,3),(12,7,4,2),(13,8,5,1),(14,8,4,1),(15,9,3,2),(16,9,6,1),(17,10,3,2),(18,10,6,1),(19,11,7,2),(20,11,6,1),(21,12,3,5),(22,13,7,2),(23,13,8,1),(24,13,11,2),(25,14,5,2),(26,15,12,2),(27,16,2,1),(35,23,7,2),(36,24,5,2),(37,24,2,1),(38,25,5,2),(39,26,7,2),(40,27,12,1),(41,27,13,2);
/*!40000 ALTER TABLE `elementospedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='El estado de un pedido puede ser "pendiente" o "entregado"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (7,'user1','2022-12-11 16:10:30','pendiente'),(8,'user1','2022-12-11 18:19:27','pendiente'),(9,'user1','2022-12-11 19:00:43','pendiente'),(10,'user1','2022-12-11 19:02:47','pendiente'),(11,'user2','2022-12-20 18:07:57','pendiente'),(12,'user1','2023-02-14 21:40:21','pendiente'),(13,'user1','2023-02-14 21:41:24','pendiente'),(14,'user1','2023-02-18 15:27:55','pendiente'),(15,'user1','2023-02-19 08:37:58','pendiente'),(16,'user1','2023-02-19 17:48:46','pendiente'),(23,'user1','2023-02-23 17:54:00','pendiente'),(24,'user1','2023-02-23 17:56:59','pendiente'),(25,'user1','2023-03-03 08:46:07','pendiente'),(26,'user2','2023-03-03 08:51:15','pendiente'),(27,'prueba','2023-03-15 16:42:36','pendiente');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `precioUnitario` double DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `idCategoria` int DEFAULT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'tv oled 50\'\'',560,3,4),(2,'freidora sin aceite',110,3,4),(3,'macarrones 1kg',1.9,3,1),(4,'mantequilla',2.3,5,1),(5,'pack yogures',2.5,14,1),(6,'pan de molde 500gr',1.8,10,1),(7,'pelota tenis',2.3,17,2),(8,'camiseta deporte',14.6,7,2),(9,'bicicleta 4G',169,3,2),(10,'guantes de boxeo',29,4,2),(11,'martillo',12.6,4,3),(12,'bombilla frenos',7.9,7,3),(13,'destornillador multiusos',17,2,3);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-15 16:58:19
