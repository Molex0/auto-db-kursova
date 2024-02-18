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
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `speciality` varchar(45) DEFAULT NULL,
  `brigada` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_brigada_idx` (`brigada`),
  CONSTRAINT `fk_brigada11` FOREIGN KEY (`brigada`) REFERENCES `brigada` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Грицевський В.П.','Слюсар',2,'2023-05-23'),(2,'Коваленко О.П.','Зварник',1,NULL),(3,'Сидоренко В.М.','Слюсар',4,'2023-05-23'),(4,'Василенко М.О.','Складальник',4,NULL),(5,'Петрова Г.І.','Технік',3,'2023-05-23'),(6,'Ковалева Л.П.','Зварник',6,NULL),(7,'Сидорова В.М.','Слюсар',5,'2023-05-23'),(8,'Васильчук О.О.','Складальник',6,NULL),(9,'Іванов І.І.','Технік',4,'2023-05-23'),(10,'Петренко О.В.','Зварник',2,NULL),(11,'Коваленко В.П.','Слюсар',1,'2023-05-23'),(12,'Сидоренко В.О.','Складальник',1,NULL),(13,'Василенко О.М.','Технік',5,'2023-05-23'),(14,'Петрова Л.І.','Зварник',4,NULL),(15,'Ковалева В.М.','Слюсар',6,'2023-05-23'),(16,'Сидорова О.О.','Складальник',4,NULL),(17,'Іванов М.І.','Технік',1,'2023-05-23'),(18,'Петренко І.В.','Зварник',3,NULL),(19,'Коваленко О.П.','Слюсар',3,'2023-05-23'),(20,'Сидоренко В.М.','Складальник',5,NULL),(21,'Василенко М.О.','Технік',2,'2023-05-23'),(22,'Петрова Г.І.','Зварник',6,NULL),(23,'Ковалева Л.П.','Слюсар',1,'2023-05-23'),(24,'Сидорова В.М.','Складальник',4,NULL),(25,'Васильчук О.О.','Технік',5,'2023-05-23'),(26,'Іванов І.І.','Зварник',5,NULL),(27,'Петренко О.В.','Слюсар',6,'2023-05-23'),(28,'Коваленко В.П.','Складальник',2,NULL),(29,'Сидоренко В.О.','Технік',4,'2023-05-23'),(30,'Василенко О.М.','Зварник',6,NULL),(31,'Петрова Л.І.','Слюсар',5,'2023-05-23'),(32,'Ковалева В.М.','Складальник',2,NULL),(33,'Сидорова О.О.','Технік',5,'2023-05-23'),(34,'Іванов М.І.','Зварник',5,NULL),(35,'Петренко І.В.','Слюсар',1,'2023-05-23'),(36,'Коваленко О.П.','Складальник',6,NULL),(37,'Сидоренко В.М.','Технік',2,'2023-05-23'),(38,'Василенко О.О.','Зварник',2,NULL),(39,'Петрова Г.І.','Слюсар',4,'2023-05-23'),(40,'Ковалева Л.П.','Складальник',4,NULL),(41,'Морозов М.В.','Директор',NULL,NULL),(42,'Романенко Д.О.','Директор',NULL,NULL),(43,'Григоренко В.Д','Директор',NULL,NULL),(44,'Ткаченко М.Є','Директор',NULL,NULL),(45,'Павленко Є.М.','Директор',NULL,NULL),(46,'Сидоренко А.В.','Директор',NULL,NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
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
