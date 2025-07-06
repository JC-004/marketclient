-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: market
-- ------------------------------------------------------
-- Server version	8.0.41

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
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'alimentacion','productos alimenticios '),(2,'deportes','equipo deportivo'),(3,'consolas','estaciones de juego'),(4,'televisores','electrodomestico inteligente'),(5,'ropa','marca H&Ml'),(6,'Electrónica','Dispositivos electrónicos y accesorios'),(7,'Hogar y Jardín','Artículos para el hogar y jardinería'),(8,'Libros y Material Educativo','Libros y materiales para educación'),(9,'Juguetes y Juegos','Juguetes y juegos para todas las edades'),(10,'Salud y Belleza','Productos para el cuidado personal y belleza');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `usuario` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('jcardenas','NOMEacuerdo2020_','NOMEacuerdo2020_','villa el salvador LIMA-PERU','yqeuni@gmail.com'),('jose',',Jose','Jose Perez','san juan de lurigancho','josePerez@gmail.com'),('plopez','NOMEacuerdo2020_','plopez','Universidad Nacional de Ingenieria','plopez@gmail.com');
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
  `idPedidoFk` int NOT NULL,
  `idProductoFk` int NOT NULL,
  `unidades` int DEFAULT NULL,
  PRIMARY KEY (`idElementosPedido`),
  KEY `idPedidoFk` (`idPedidoFk`),
  KEY `idProductoFk` (`idProductoFk`),
  CONSTRAINT `elementospedido_ibfk_1` FOREIGN KEY (`idPedidoFk`) REFERENCES `pedidos` (`idPedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `elementospedido_ibfk_2` FOREIGN KEY (`idProductoFk`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementospedido`
--

LOCK TABLES `elementospedido` WRITE;
/*!40000 ALTER TABLE `elementospedido` DISABLE KEYS */;
INSERT INTO `elementospedido` VALUES (1,1,4,1),(2,1,107,1),(3,1,29,1),(4,1,83,1),(5,1,23,1),(6,2,5,20),(7,3,43,5),(8,4,43,5),(9,5,4,1);
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
  `usuario` varchar(45) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `estado` varchar(15) DEFAULT 'COMPLETADO',
  PRIMARY KEY (`idPedido`),
  KEY `usuario` (`usuario`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `clientes` (`usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'jose','2025-03-20 01:25:32','COMPLETADO'),(2,'jcardenas','2025-05-07 01:19:49','COMPLETADO'),(3,'jcardenas','2025-05-07 01:23:44','COMPLETADO'),(4,'jcardenas','2025-05-07 01:23:44','COMPLETADO'),(5,'plopez','2025-05-16 15:26:22','COMPLETADO');
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
  `idCategoria` int NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idCategoria` (`idCategoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'pan bimbo',1.5,998,1),(2,'leche',3.9,999,1),(3,'nicke',40.9,986,2),(4,'PS5',1999.9,993,3),(5,'LG',1500.99,929,4),(6,'Pantalon talla \'M\'',109.8,997,5),(7,'adidas',30.9,996,2),(8,'xbox',1000.99,983,3),(9,'sony',500.99,988,4),(10,'polo rojo',14.9,997,5),(11,'jamonada de pollo',5.7,999,1),(12,'guantes',40.99,997,2),(13,'polystation',99.99,992,3),(14,'samsung',699.99,979,4),(15,'pack 7 medias',29.99,997,5),(16,'Arroz extra',2.99,500,1),(17,'Aceite vegetal',6.49,300,1),(18,'Atún enlatado',2.5,399,1),(19,'Azúcar blanca',3.25,598,1),(20,'Galletas de chocolate',1.8,697,1),(21,'Cereal de avena',4.5,350,1),(22,'Café instantáneo',7.99,250,1),(23,'Yogur griego',5.6,199,1),(24,'Balón de fútbol',25.99,149,2),(25,'Raqueta de tenis',79.5,78,2),(26,'Mancuernas 10kg',39.99,117,2),(27,'Bicicleta de montaña',350,46,2),(28,'Casco de ciclismo',45,90,2),(29,'Zapatos deportivos Puma',49.99,199,2),(30,'Cuerda para saltar',12.99,300,2),(31,'Pantalón deportivo Adidas',35.99,250,2),(32,'Nintendo Switch',299.99,194,3),(33,'Xbox Series X',499.99,150,3),(34,'Control de PS5',69.99,300,3),(35,'Control de Xbox',59.99,350,3),(36,'Teclado mecánico gamer',89.99,200,3),(37,'Monitor 144Hz',279.99,179,3),(38,'Mouse inalámbrico gamer',45.99,400,3),(39,'Samsung 55\" 4K',749.99,81,4),(40,'Sony Bravia 65\"',1199.99,80,4),(41,'LG OLED 48\"',899.99,120,4),(42,'TCL 50\" Smart TV',529.99,90,4),(43,'Hisense 58\"',649.99,100,4),(44,'Zapatillas deportivas Nike',74.99,300,5),(45,'Casaca de invierno',129.99,150,5),(46,'Jeans Levi\'s 501',89.99,200,5),(47,'Polera oversize',39.99,250,5),(48,'Sudadera con capucha',55.99,180,5),(49,'Bolso de cuero',79.99,100,5),(50,'Bufanda de lana',19.99,250,5),(51,'Pack 5 calcetines',15.99,350,5),(52,'Audífonos cancelación de ruido',180,15,6),(53,'Cargador inalámbrico',45,30,6),(54,'Microondas inteligente',250,10,6),(55,'Cámara de seguridad WiFi',120,25,6),(56,'SSD 1TB NVMe',130,20,6),(57,'Cable HDMI 4K',15,40,6),(58,'Smart TV 50\"',600,12,6),(59,'Batería externa 20,000mAh',50,35,6),(60,'Estabilizador para cámara',200,8,6),(61,'Teclado retroiluminado',75,20,6),(62,'Control para videojuegos',55,18,6),(63,'Hub USB-C con múltiples puertos',90,15,6),(64,'Lámpara LED RGB inteligente',40,20,6),(65,'Drone con cámara HD',250,10,6),(66,'Gimbal para smartphone',120,12,6),(67,'Extractor de jugos',85,20,7),(68,'Tostadora de pan',45,25,7),(69,'Cafetera automática',120,18,7),(70,'Cama King Size',750,5,7),(71,'Sartén de cerámica',35,40,7),(72,'Set de sábanas de algodón',60,15,7),(73,'Aspiradora robot',220,10,7),(74,'Sillón reclinable',350,7,7),(75,'Jarrón decorativo',30,25,7),(76,'Cortadora de césped',280,10,7),(77,'Humidificador ultrasónico',50,15,7),(78,'Reloj de pared moderno',40,20,7),(79,'Candelabro de cristal',100,8,7),(80,'Set de toallas de baño',55,18,7),(81,'Estantería de madera',150,12,7),(82,'Libro: Inteligencia Artificial',30,40,8),(83,'Manual de programación avanzada',50,29,8),(84,'Libro de desarrollo personal',25,35,8),(85,'Diccionario de sinónimos y antónimos',28,20,8),(86,'Cuaderno de notas premium',12,50,8),(87,'Estuche organizador de lápices',15,40,8),(88,'Regla geométrica profesional',8,60,8),(89,'Libro de economía global',38,15,8),(90,'Curso de caligrafía',22,25,8),(91,'Compendio de física teórica',45,10,8),(92,'Tablero de ajedrez educativo',35,20,8),(93,'Libro de astronomía moderna',40,18,8),(94,'Set de hojas para acuarela',20,25,8),(95,'Cuaderno de escritura creativa',18,35,8),(96,'Globo terráqueo interactivo',70,10,8),(97,'Nerf Blaster',40,25,9),(98,'Set de bloques magnéticos',35,30,9),(99,'Juego de construcción mecánica',50,20,9),(100,'Set de marionetas de dedo',18,40,9),(101,'Circuito de carreras de autos',70,12,9),(102,'Robot programable para niños',120,10,9),(103,'Muñeco coleccionable edición especial',55,15,9),(104,'Juego de cocina infantil',38,22,9),(105,'Dinosaurios de juguete',28,30,9),(106,'Bicicleta para niños',150,10,9),(107,'Pizarra mágica infantil',25,39,9),(108,'Set de figuras de acción',50,20,9),(109,'Juego de pesca magnética',22,35,9),(110,'Pelota de baloncesto mini',18,45,9),(111,'Juego de memoria didáctico',30,25,9),(112,'Kit de aromaterapia',45,20,10),(113,'Masajeador de cuello',60,15,10),(114,'Set de spa en casa',55,18,10),(115,'Piedras calientes para masajes',40,12,10),(116,'Gel de aloe vera',20,30,10),(117,'Set de aceites esenciales',50,25,10),(118,'Cepillo facial ultrasónico',35,15,10),(119,'Gorro térmico para cabello',25,20,10),(120,'Mascarilla exfoliante',18,35,10),(121,'Pack de parches para ojos',22,30,10),(122,'Guantes hidratantes para manos',28,25,10),(123,'Protector solar SPF 50+',30,40,10),(124,'Crema antiestrías',38,18,10),(125,'Roller facial de jade',25,30,10),(126,'Shampoo en seco',20,35,10);
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

-- Dump completed on 2025-07-06 13:47:11
