-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: auto
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `repair`
--

DROP TABLE IF EXISTS `repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair` (
  `id` int NOT NULL,
  `auto` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `price` int DEFAULT NULL,
  `detail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_auto4_idx` (`auto`),
  CONSTRAINT `fk_auto4` FOREIGN KEY (`auto`) REFERENCES `transport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair`
--

LOCK TABLES `repair` WRITE;
/*!40000 ALTER TABLE `repair` DISABLE KEYS */;
INSERT INTO `repair` VALUES (1,5,'2022-01-15',800,'Двигун'),(2,12,'2022-02-05',1200,'Генератор'),(3,20,'2022-03-10',600,'Тормоза'),(4,7,'2022-04-20',400,'Акумулятор'),(5,30,'2022-05-05',900,'Трансміссія'),(6,14,'2022-06-12',500,'Двигун'),(7,28,'2022-07-18',700,'Генератор'),(8,3,'2022-08-25',300,'Тормоза'),(9,9,'2022-09-30',600,'Акумулятор'),(10,25,'2022-10-10',800,'Трансміссія'),(11,1,'2022-11-15',1000,'Двигун'),(12,10,'2022-12-20',400,'Генератор'),(13,17,'2023-01-05',600,'Тормоза'),(14,33,'2023-02-10',1200,'Акумулятор'),(15,22,'2023-03-15',700,'Трансміссія'),(16,8,'2023-04-20',400,'Двигун'),(17,35,'2023-05-01',900,'Генератор'),(18,16,'2023-05-10',500,'Тормоза'),(19,29,'2023-05-15',800,'Акумулятор'),(20,4,'2023-05-20',300,'Трансміссія'),(21,11,'2023-05-22',600,'Двигун'),(22,21,'2023-05-23',800,'Генератор'),(23,2,'2023-05-23',400,'Тормоза'),(24,13,'2023-05-23',500,'Акумулятор'),(25,6,'2022-01-16',700,'Трансміссія'),(26,15,'2022-02-06',1000,'Двигун'),(27,23,'2022-03-11',500,'Генератор'),(28,8,'2022-04-21',300,'Тормоза'),(29,31,'2022-05-06',800,'Акумулятор'),(30,3,'2022-06-13',400,'Трансміссія'),(31,18,'2022-07-19',600,'Двигун'),(32,30,'2022-08-26',300,'Генератор'),(33,5,'2022-09-30',500,'Тормоза'),(34,12,'2022-10-11',700,'Акумулятор'),(35,20,'2022-11-16',1000,'Трансміссія'),(36,7,'2022-12-21',400,'Двигун'),(37,29,'2023-01-06',500,'Генератор'),(38,16,'2023-02-11',700,'Тормоза'),(39,35,'2023-03-16',300,'Акумулятор'),(40,4,'2023-04-21',800,'Трансміссія'),(41,11,'2023-05-22',400,'Двигун'),(42,21,'2023-05-23',600,'Генератор'),(43,2,'2023-05-23',300,'Тормоза'),(44,13,'2023-05-23',500,'Акумулятор'),(45,6,'2022-01-16',700,'Трансміссія'),(46,15,'2022-02-06',1000,'Двигун'),(47,23,'2022-03-11',500,'Генератор'),(48,8,'2022-04-21',300,'Тормоза'),(49,31,'2022-05-06',800,'Акумулятор'),(50,3,'2022-06-13',400,'Трансміссія'),(51,18,'2022-07-19',600,'Двигун'),(52,30,'2022-08-26',300,'Генератор'),(53,5,'2022-09-30',500,'Тормоза'),(54,12,'2022-10-11',700,'Акумулятор'),(55,20,'2022-11-16',1000,'Трансміссія'),(56,7,'2022-12-21',400,'Двигун'),(57,29,'2023-01-06',500,'Генератор'),(58,16,'2023-02-11',700,'Тормоза'),(59,35,'2023-03-16',300,'Акумулятор'),(60,4,'2023-04-21',800,'Трансміссія'),(61,11,'2023-05-22',400,'Двигун'),(62,21,'2023-05-23',600,'Генератор'),(63,2,'2023-05-23',300,'Тормоза'),(64,13,'2023-05-23',500,'Акумулятор'),(65,6,'2022-01-16',700,'Трансміссія'),(66,15,'2022-02-06',1000,'Двигун'),(67,23,'2022-03-11',500,'Генератор'),(68,8,'2022-04-21',300,'Тормоза'),(69,31,'2022-05-06',800,'Акумулятор'),(70,3,'2022-06-13',400,'Трансміссія'),(71,18,'2022-07-19',600,'Двигун'),(72,30,'2022-08-26',300,'Генератор'),(73,5,'2022-09-30',500,'Тормоза'),(74,12,'2022-10-11',700,'Акумулятор'),(75,20,'2022-11-16',1000,'Трансміссія'),(76,7,'2022-12-21',400,'Двигун'),(77,29,'2023-01-06',500,'Генератор'),(78,16,'2023-02-11',700,'Тормоза'),(79,35,'2023-03-16',300,'Акумулятор'),(80,4,'2023-04-21',800,'Трансміссія');
/*!40000 ALTER TABLE `repair` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-26 15:16:09
