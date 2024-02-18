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
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `auto` int DEFAULT NULL,
  `brigada` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_brigada_idx` (`brigada`),
  KEY `fk_auto1_idx` (`auto`),
  CONSTRAINT `fk_auto1` FOREIGN KEY (`auto`) REFERENCES `transport` (`id`),
  CONSTRAINT `fk_brigada` FOREIGN KEY (`brigada`) REFERENCES `brigada` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'Іванов О.П.',1,1),(2,'Петров І.М.',2,2),(3,'Сидоренко А.В.',3,3),(4,'Коваленко М.В.',4,4),(5,'Мельник О.І.',5,5),(6,'Шевченко М.О.',6,6),(7,'Ковальова С.М.',7,1),(8,'Бойко А.С.',8,2),(9,'Ковальчук В.О.',9,3),(10,'Павленко Є.М.',10,4),(11,'Григоренко В.Д.',11,5),(12,'Ткаченко М.Є.',12,6),(13,'Кравченко Ю.В.',13,1),(14,'Білоус А.А.',14,2),(15,'Олійник О.Є.',15,3),(16,'Романенко Д.О.',16,4),(17,'Захарчук К.А.',17,5),(18,'Марченко А.С.',18,6),(19,'Клименко А.Є.',19,1),(20,'Морозов М.В.',20,2),(21,'Іванова О.П.',21,3),(22,'Петрова І.М.',22,4),(23,'Сидоренко А.В.',23,5),(24,'Коваленко М.О.',24,6),(25,'Мельник І.І.',25,1),(26,'Шевченко М.О.',26,2),(27,'Ковальова С.М.',27,3),(28,'Бойко А.С.',28,4),(29,'Ковальчук В.О.',29,5),(30,'Павленко Є.М.',30,6),(31,'Григоренко В.Д.',31,1),(32,'Ткаченко М.Є.',32,2),(33,'Кравченко Ю.В.',33,3),(34,'Білоус А.А.',34,4),(35,'Олійник О.Є.',35,5),(36,'Романенко Д.О.',1,6),(37,'Захарчук К.А.',2,1),(38,'Марченко А.С.',3,2),(39,'Клименко А.Є.',4,3),(40,'Морозов М.В.',5,4),(41,'Іванова О.П.',6,5),(42,'Петрова І.М.',7,6),(43,'Сидоренко А.В.',8,1),(44,'Коваленко М.О.',9,2),(45,'Мельник І.І.',10,3),(46,'Шевченко М.О.',11,4),(47,'Ковальова С.М.',12,5),(48,'Бойко А.С.',13,6),(49,'Ковальчук В.О.',14,1),(50,'Павленко Є.М.',15,2);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-26 15:16:08
