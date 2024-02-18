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
-- Table structure for table `brigada`
--

DROP TABLE IF EXISTS `brigada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brigada` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `brigadir` int DEFAULT NULL,
  `master` int DEFAULT NULL,
  `garage` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brigadir_UNIQUE` (`brigadir`),
  KEY `fk2_commander_idx` (`brigadir`),
  KEY `fk2_master_idx` (`master`),
  KEY `fk2_director_idx` (`garage`),
  CONSTRAINT `fk2_commander` FOREIGN KEY (`brigadir`) REFERENCES `staff` (`id`),
  CONSTRAINT `fk2_garage` FOREIGN KEY (`garage`) REFERENCES `garage` (`id`),
  CONSTRAINT `fk2_master` FOREIGN KEY (`master`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brigada`
--

LOCK TABLES `brigada` WRITE;
/*!40000 ALTER TABLE `brigada` DISABLE KEYS */;
INSERT INTO `brigada` VALUES (1,'Б1',2,11,1),(2,'Б2',1,10,2),(3,'Б3',5,18,3),(4,'Б4',3,4,4),(5,'Б5',7,13,5),(6,'Б6',6,8,6);
/*!40000 ALTER TABLE `brigada` ENABLE KEYS */;
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
