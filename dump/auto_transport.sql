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
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `garage` int DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `carry` varchar(45) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `passed` varchar(45) DEFAULT NULL,
  `finish_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_garage_idx` (`garage`),
  CONSTRAINT `fk_garage` FOREIGN KEY (`garage`) REFERENCES `garage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,'Mercedes',2003,'Легковий',1,NULL,NULL,'2023-05-23','активний',NULL),(2,'Ford Focus',2019,'Легкові',2,NULL,NULL,'2023-05-23','активний',NULL),(3,'Mercedes-Benz Sprinter',2020,'Вантажні',3,NULL,'2000','2023-05-23','активний',NULL),(4,'Volkswagen Transporter',2017,'Вантажні',4,NULL,'1500','2023-05-23','активний',NULL),(5,'Hyundai Sonata',2016,'Таксі',5,NULL,NULL,'2023-05-23','активний',NULL),(6,'Renault Trafic',2021,'Вантажні',6,NULL,'1200','2023-05-23','активний',NULL),(7,'Skoda Octavia',2018,'Легкові',1,NULL,NULL,'2023-05-23','активний',NULL),(8,'Volvo XC90',2020,'Маршрутне таксі',2,7,NULL,'2023-05-23','активний',NULL),(9,'Mercedes-Benz Actros',2019,'Вантажні',3,NULL,'2500','2023-05-23','списаний','2023-05-23'),(10,'BMW X5',2017,'Легкові',4,NULL,NULL,'2023-05-23','активний',NULL),(11,'Opel Vivaro',2018,'Вантажні',5,NULL,'1100','2023-05-23','активний',NULL),(12,'Honda Accord',2022,'Таксі',6,NULL,NULL,'2023-05-23','списаний','2023-05-23'),(13,'Toyota Hilux',2019,'Вантажні',1,NULL,'1800','2023-05-23','активний',NULL),(14,'Nissan Qashqai',2020,'Маршрутне таксі',2,5,NULL,'2023-05-23','списаний','2023-05-23'),(15,'Ford Transit',2018,'Вантажні',3,NULL,'2000','2023-05-23','активний',NULL),(16,'Volkswagen Golf',2017,'Таксі',4,NULL,NULL,'2023-05-23','активний',NULL),(17,'Peugeot Boxer',2021,'Вантажні',5,NULL,'1600','2023-05-23','активний',NULL),(18,'Chevrolet Cruze',2016,'Легкові',6,NULL,NULL,'2023-05-23','активний',NULL),(19,'Mercedes-Benz Vito',2019,'Вантажні',1,NULL,'1300','2023-05-23','списаний','2023-05-23'),(20,'Audi A4',2020,'Легкові',2,NULL,NULL,'2023-05-23','активний',NULL),(21,'Renault Master',2018,'Вантажні',3,NULL,'2200','2023-05-23','активний',NULL),(22,'Hyundai Tucson',2017,'Таксі',4,NULL,NULL,'2023-05-23','активний',NULL),(23,'Volkswagen Caddy',2021,'Вантажні',5,NULL,'1000','2023-05-23','активний',NULL),(24,'Toyota Corolla',2018,'Легкові',6,NULL,NULL,'2023-05-23','списаний','2023-05-23'),(25,'Ford Ranger',2020,'Вантажні',1,NULL,'1700','2023-05-23','активний',NULL),(26,'BMW 3 Series',2019,'Таксі',2,NULL,NULL,'2023-05-23','активний',NULL),(27,'Mercedes-Benz Sprinter',2017,'Вантажні',3,NULL,'2500','2023-05-23','активний',NULL),(28,'Opel Astra',2016,'Маршрутне таксі',4,5,NULL,'2023-05-23','активний',NULL),(29,'Renault Kangoo',2021,'Вантажні',5,NULL,'1100','2023-05-23','активний',NULL),(30,'Honda Civic',2018,'Маршрутне таксі',6,5,NULL,'2023-05-23','списаний','2023-05-23'),(31,'Mercedes-Benz Citaro',2015,'Автобус',1,50,NULL,'2023-05-23','списаний','2023-05-23'),(32,'MAN Lions City',2018,'Автобус',2,40,NULL,'2023-05-23','активний',NULL),(33,'Volvo 9700',2017,'Автобус',3,55,NULL,'2023-05-23','активний',NULL),(34,'Scania Interlink',2016,'Автобус',4,45,NULL,'2023-05-23','активний',NULL),(35,'Iveco Crossway',2019,'Автобус',5,35,NULL,'2023-05-23','активний',NULL);
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
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
