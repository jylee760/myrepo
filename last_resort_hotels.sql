-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: last_resort_hotels
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `billId` int NOT NULL AUTO_INCREMENT,
  `customerId` int DEFAULT NULL,
  `reservationNumber` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  PRIMARY KEY (`billId`),
  UNIQUE KEY `reservationNumber` (`reservationNumber`),
  KEY `customerId` (`customerId`,`reservationNumber`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`customerId`, `reservationNumber`) REFERENCES `guest` (`customerId`, `reservationNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,1,1,400),(2,1,2,400),(3,1,3,450),(4,2,4,300),(5,2,5,300),(6,2,6,200),(7,3,7,300),(8,3,8,1100),(9,3,9,NULL),(10,4,10,1200),(11,4,11,1500),(12,4,12,1200),(13,5,13,200),(14,5,14,1000),(15,5,15,NULL),(16,6,16,700),(17,6,17,400),(18,6,18,750),(19,7,19,200),(20,7,20,600),(21,7,21,2600),(22,8,22,300),(23,8,23,600),(24,8,24,1000),(25,9,25,300),(26,9,26,1000),(27,9,27,400),(28,10,28,400),(29,10,29,400),(30,10,30,300),(31,11,31,100),(32,11,32,300),(33,12,33,600),(34,12,34,300),(35,13,35,300),(36,13,36,400),(37,14,37,300),(38,14,38,300),(39,15,39,600),(40,15,40,500),(41,16,41,100),(42,16,42,300),(43,17,43,200),(44,17,44,200),(45,18,45,200),(46,18,46,400),(47,19,47,450),(48,19,48,300),(49,20,49,500),(50,20,50,500),(51,21,51,200),(52,21,52,100),(53,22,53,200),(54,22,54,400),(55,23,55,800),(56,23,56,800),(57,24,57,300),(58,24,58,100),(59,25,59,400),(60,25,60,150),(61,26,61,200),(62,26,62,450),(63,27,63,200),(64,27,64,300),(65,28,65,300),(66,28,66,300),(67,29,67,100),(68,29,68,100),(69,30,69,300),(70,30,70,450),(71,31,71,300),(72,31,72,300),(73,32,73,600),(74,32,74,200),(75,33,75,450),(76,33,76,200),(77,34,77,200),(78,34,78,300),(79,35,79,100),(80,35,80,200),(81,36,81,300),(82,36,82,1000),(83,37,83,300),(84,37,84,450),(85,38,85,200),(86,38,86,200),(87,39,87,400),(88,39,88,300),(89,40,89,800),(90,40,90,1000),(91,41,91,NULL),(92,42,92,NULL),(93,43,93,NULL),(94,44,94,NULL),(95,45,95,NULL),(96,46,96,NULL),(97,47,97,NULL),(98,48,98,NULL),(99,49,99,NULL),(100,50,100,3000);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `buildingId` char(3) NOT NULL,
  `complexId` char(2) NOT NULL,
  `buildingName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`buildingId`),
  KEY `complexId` (`complexId`),
  CONSTRAINT `building_ibfk_1` FOREIGN KEY (`complexId`) REFERENCES `hotel_complex` (`complexId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES ('NYA','NY','The Last Resort');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `pinNum` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `reservationNumber` int NOT NULL,
  `currentLocation` varchar(40) DEFAULT NULL,
  `confidentialFlag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`pinNum`,`customerId`,`reservationNumber`),
  KEY `customerId` (`customerId`,`reservationNumber`),
  CONSTRAINT `card_ibfk_1` FOREIGN KEY (`customerId`, `reservationNumber`) REFERENCES `guest` (`customerId`, `reservationNumber`),
  CONSTRAINT `card_ibfk_2` FOREIGN KEY (`pinNum`) REFERENCES `pincard` (`pinNum`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,1,1,'Front Desk',_binary '\0'),(1,1,2,'Front Desk',_binary '\0'),(1,1,3,'Front Desk',_binary '\0'),(1,2,4,'Front Desk',_binary '\0'),(1,2,5,'Front Desk',_binary '\0'),(1,2,6,'Front Desk',_binary '\0'),(1,3,7,'Front Desk',_binary '\0'),(1,3,8,'Front Desk',_binary '\0'),(1,4,10,'Front Desk',_binary '\0'),(1,4,11,'Front Desk',_binary '\0'),(1,4,12,'Front Desk',_binary '\0'),(1,5,13,'Front Desk',_binary '\0'),(1,5,14,'Front Desk',_binary '\0'),(1,6,16,NULL,_binary ''),(1,6,17,NULL,_binary ''),(1,6,18,NULL,_binary ''),(1,7,19,'Front Desk',_binary '\0'),(1,7,20,'Front Desk',_binary '\0'),(1,7,21,NULL,_binary ''),(1,8,22,NULL,_binary ''),(1,8,23,NULL,_binary ''),(1,8,24,NULL,_binary ''),(1,9,25,'Front Desk',_binary '\0'),(1,9,26,'Front Desk',_binary '\0'),(1,9,27,'Front Desk',_binary '\0'),(1,10,28,NULL,_binary ''),(1,10,29,NULL,_binary ''),(1,10,30,NULL,_binary ''),(1,11,31,'Front Desk',_binary '\0'),(1,11,32,NULL,_binary ''),(1,12,33,'Front Desk',_binary '\0'),(1,12,34,NULL,_binary ''),(1,13,35,NULL,_binary ''),(1,13,36,NULL,_binary ''),(1,14,37,NULL,_binary ''),(1,15,39,NULL,_binary ''),(1,15,40,NULL,_binary ''),(1,16,41,'Front Desk',_binary '\0'),(1,16,42,NULL,_binary ''),(1,17,43,NULL,_binary ''),(1,17,44,NULL,_binary ''),(1,18,45,NULL,_binary ''),(1,18,46,NULL,_binary ''),(1,19,47,NULL,_binary ''),(1,19,48,'Front Desk',_binary '\0'),(1,20,49,NULL,_binary ''),(1,20,50,'Front Desk',_binary '\0'),(1,21,51,NULL,_binary ''),(1,21,52,NULL,_binary ''),(1,22,53,NULL,_binary ''),(1,22,54,NULL,_binary ''),(1,23,55,'Front Desk',_binary '\0'),(1,23,56,NULL,_binary ''),(1,24,57,'Front Desk',_binary '\0'),(1,24,58,NULL,_binary ''),(1,25,59,NULL,_binary ''),(1,25,60,'Front Desk',_binary '\0'),(1,26,61,NULL,_binary ''),(1,27,63,NULL,_binary ''),(1,27,64,'Front Desk',_binary '\0'),(1,28,65,NULL,_binary ''),(1,28,66,NULL,_binary ''),(1,29,67,'Front Desk',_binary '\0'),(1,29,68,'Front Desk',_binary '\0'),(1,30,69,NULL,_binary ''),(1,31,71,NULL,_binary ''),(1,31,72,NULL,_binary ''),(1,32,73,NULL,_binary ''),(1,32,74,NULL,_binary ''),(1,33,75,'Front Desk',_binary '\0'),(1,33,76,NULL,_binary ''),(1,34,77,'Front Desk',_binary '\0'),(1,34,78,NULL,_binary ''),(1,35,79,NULL,_binary ''),(1,35,80,'Front Desk',_binary '\0'),(1,36,81,NULL,_binary ''),(1,36,82,NULL,_binary ''),(1,37,83,NULL,_binary ''),(1,37,84,NULL,_binary ''),(1,38,85,NULL,_binary ''),(1,38,86,NULL,_binary ''),(1,39,87,'Front Desk',_binary '\0'),(1,39,88,NULL,_binary ''),(1,40,89,NULL,_binary ''),(1,40,90,NULL,_binary ''),(1,50,100,'Meeting Room NYAA102',_binary '\0'),(2,51,1,'Front Desk',_binary '\0'),(2,51,2,'Front Desk',_binary '\0'),(2,51,3,'Front Desk',_binary '\0'),(2,54,4,'Front Desk',_binary '\0'),(2,54,5,'Front Desk',_binary '\0'),(2,54,6,'Front Desk',_binary '\0'),(2,56,8,'Front Desk',_binary '\0'),(2,58,10,'Front Desk',_binary '\0'),(2,58,12,'Front Desk',_binary '\0'),(2,61,13,'Front Desk',_binary '\0'),(2,61,14,'Front Desk',_binary '\0'),(2,64,16,NULL,_binary ''),(2,64,17,NULL,_binary ''),(2,64,18,NULL,_binary ''),(2,67,20,'Front Desk',_binary '\0'),(2,67,21,NULL,_binary ''),(2,70,22,NULL,_binary ''),(2,70,23,NULL,_binary ''),(2,73,25,'Front Desk',_binary '\0'),(2,73,26,NULL,_binary ''),(2,73,27,'Front Desk',_binary '\0'),(2,76,28,NULL,_binary ''),(2,76,29,NULL,_binary ''),(2,76,30,NULL,_binary ''),(2,79,32,NULL,_binary ''),(2,80,33,NULL,_binary ''),(2,80,34,NULL,_binary ''),(2,83,35,NULL,_binary ''),(2,84,37,NULL,_binary ''),(2,86,39,NULL,_binary ''),(2,88,40,NULL,_binary ''),(2,89,42,NULL,_binary ''),(2,90,43,NULL,_binary ''),(2,90,44,NULL,_binary ''),(2,91,46,NULL,_binary ''),(2,94,47,'Front Desk',_binary '\0'),(2,95,48,'Front Desk',_binary '\0'),(2,96,51,NULL,_binary ''),(2,97,53,NULL,_binary ''),(2,98,55,'Front Desk',_binary '\0'),(2,98,56,NULL,_binary ''),(2,101,59,NULL,_binary ''),(2,101,60,NULL,_binary ''),(2,105,64,NULL,_binary ''),(2,107,66,NULL,_binary ''),(2,108,69,NULL,_binary ''),(2,110,72,NULL,_binary ''),(2,111,73,NULL,_binary ''),(2,113,74,NULL,_binary ''),(2,114,75,'Front Desk',_binary '\0'),(2,115,76,NULL,_binary ''),(2,116,78,NULL,_binary ''),(2,118,80,'Front Desk',_binary '\0'),(2,119,81,NULL,_binary ''),(2,119,82,'Front Desk',_binary '\0'),(2,122,83,'Front Desk',_binary '\0'),(2,122,84,'Front Desk',_binary '\0'),(2,124,87,'Front Desk',_binary '\0'),(2,124,88,NULL,_binary ''),(2,127,89,NULL,_binary ''),(2,127,90,NULL,_binary ''),(3,30,70,'Front Desk',_binary '\0'),(3,52,1,'Front Desk',_binary '\0'),(3,52,2,'Front Desk',_binary '\0'),(3,52,3,'Front Desk',_binary '\0'),(3,55,5,'Front Desk',_binary '\0'),(3,59,10,'Front Desk',_binary '\0'),(3,59,12,'Front Desk',_binary '\0'),(3,62,14,'Front Desk',_binary '\0'),(3,65,17,NULL,_binary ''),(3,65,18,NULL,_binary ''),(3,68,20,'Front Desk',_binary '\0'),(3,68,21,NULL,_binary ''),(3,71,23,NULL,_binary ''),(3,74,26,NULL,_binary ''),(3,74,27,'Front Desk',_binary '\0'),(3,77,28,NULL,_binary ''),(3,77,29,NULL,_binary ''),(3,77,30,NULL,_binary ''),(3,81,33,NULL,_binary ''),(3,81,34,NULL,_binary ''),(3,85,37,NULL,_binary ''),(3,87,39,NULL,_binary ''),(3,92,46,NULL,_binary ''),(3,95,47,NULL,_binary ''),(3,99,55,NULL,_binary ''),(3,99,56,NULL,_binary ''),(3,102,60,NULL,_binary ''),(3,106,64,NULL,_binary ''),(3,109,69,NULL,_binary ''),(3,112,73,NULL,_binary ''),(3,115,75,'Front Desk',_binary '\0'),(3,117,78,NULL,_binary ''),(3,120,81,NULL,_binary ''),(3,120,82,NULL,_binary ''),(3,123,83,'Front Desk',_binary '\0'),(3,123,84,NULL,_binary ''),(3,125,87,'Front Desk',_binary '\0'),(3,125,88,NULL,_binary ''),(3,128,89,NULL,_binary ''),(3,128,90,NULL,_binary ''),(4,14,38,NULL,_binary ''),(4,53,1,'Front Desk',_binary '\0'),(4,53,2,'Front Desk',_binary '\0'),(4,60,10,'Front Desk',_binary '\0'),(4,60,12,'Front Desk',_binary '\0'),(4,66,17,NULL,_binary ''),(4,69,20,'Front Desk',_binary '\0'),(4,69,21,NULL,_binary ''),(4,72,23,NULL,_binary ''),(4,75,27,NULL,_binary ''),(4,78,28,NULL,_binary ''),(4,78,29,NULL,_binary ''),(4,82,33,'Front Desk',_binary '\0'),(4,88,39,NULL,_binary ''),(4,93,46,NULL,_binary ''),(4,100,55,NULL,_binary ''),(4,100,56,NULL,_binary ''),(4,108,70,'Front Desk',_binary '\0'),(4,113,73,NULL,_binary ''),(4,121,82,NULL,_binary ''),(4,126,87,'Front Desk',_binary '\0'),(4,129,89,NULL,_binary ''),(4,129,90,NULL,_binary ''),(5,26,62,NULL,_binary ''),(5,109,70,'Front Desk',_binary '\0'),(6,103,62,NULL,_binary ''),(7,104,62,NULL,_binary '');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge`
--

DROP TABLE IF EXISTS `charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge` (
  `chargeTime` date NOT NULL,
  `customerId` int NOT NULL,
  `reservationNumber` int NOT NULL,
  `serviceId` int DEFAULT NULL,
  `billId` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `chargeDetail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`chargeTime`,`customerId`,`reservationNumber`),
  KEY `customerId` (`customerId`,`reservationNumber`),
  KEY `serviceId` (`serviceId`),
  KEY `billId` (`billId`),
  CONSTRAINT `charge_ibfk_1` FOREIGN KEY (`customerId`, `reservationNumber`) REFERENCES `guest` (`customerId`, `reservationNumber`),
  CONSTRAINT `charge_ibfk_2` FOREIGN KEY (`serviceId`) REFERENCES `service` (`serviceId`),
  CONSTRAINT `charge_ibfk_3` FOREIGN KEY (`billId`) REFERENCES `bill` (`billId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge`
--

LOCK TABLES `charge` WRITE;
/*!40000 ALTER TABLE `charge` DISABLE KEYS */;
INSERT INTO `charge` VALUES ('2015-01-05',40,89,NULL,89,800,'room'),('2015-04-18',25,59,NULL,59,400,'room'),('2016-02-16',17,43,NULL,43,200,'room'),('2016-03-05',38,85,NULL,85,200,'room'),('2016-03-06',16,41,NULL,41,100,'room'),('2016-04-05',19,47,NULL,47,450,'room'),('2016-04-23',24,57,NULL,57,300,'room'),('2016-05-10',16,42,NULL,42,300,'room'),('2016-05-11',31,71,NULL,71,300,'room'),('2016-05-17',19,48,NULL,48,300,'room'),('2016-06-08',18,45,NULL,45,200,'room'),('2016-06-11',30,69,NULL,69,300,'room'),('2016-06-20',39,87,NULL,87,400,'room'),('2016-07-05',25,60,NULL,60,150,'room'),('2016-07-11',21,51,NULL,51,200,'room'),('2016-07-12',30,70,NULL,70,450,'room'),('2016-08-13',21,52,NULL,52,100,'room'),('2016-08-20',23,55,NULL,55,800,'room'),('2016-09-02',26,61,NULL,61,200,'room'),('2016-09-05',33,75,NULL,75,450,'room'),('2016-10-27',35,80,NULL,80,200,'room'),('2016-11-15',15,39,NULL,39,600,'room'),('2016-11-15',26,62,NULL,62,450,'room'),('2016-11-24',37,83,NULL,83,300,'room'),('2017-02-10',18,46,NULL,46,400,'room'),('2017-02-16',17,44,NULL,44,200,'room'),('2017-02-22',40,90,1,90,200,'massage'),('2017-02-23',40,90,NULL,90,800,'room'),('2017-03-06',38,86,NULL,86,200,'room'),('2017-04-05',28,65,NULL,65,300,'room'),('2017-04-21',24,58,NULL,58,100,'room'),('2017-05-07',39,88,NULL,88,300,'room'),('2017-05-26',14,37,NULL,37,300,'room'),('2017-08-03',35,79,NULL,79,100,'room'),('2017-08-15',33,76,NULL,76,200,'room'),('2017-08-20',23,56,NULL,56,800,'room'),('2017-09-25',22,53,NULL,53,200,'room'),('2017-10-16',29,67,NULL,67,100,'room'),('2017-10-31',29,68,NULL,68,100,'room'),('2017-11-01',20,49,NULL,49,500,'room'),('2017-11-05',36,81,NULL,81,300,'room'),('2017-11-14',32,73,NULL,73,600,'room'),('2017-12-03',27,63,NULL,63,200,'room'),('2017-12-30',15,40,NULL,40,500,'room'),('2018-01-03',27,64,NULL,64,300,'room'),('2018-02-13',32,74,NULL,74,200,'room'),('2018-06-03',28,66,NULL,66,300,'room'),('2018-10-05',22,54,NULL,54,400,'room'),('2018-11-01',20,50,NULL,50,500,'room'),('2018-12-10',36,82,NULL,82,1000,'room'),('2019-01-04',12,33,NULL,33,600,'room'),('2019-03-15',12,34,NULL,34,300,'room'),('2019-03-17',14,38,NULL,38,300,'room'),('2020-01-03',10,28,NULL,28,400,'room'),('2020-01-19',10,29,NULL,29,400,'room'),('2020-02-11',10,30,NULL,30,300,'room'),('2020-04-15',8,24,NULL,24,1000,'room'),('2020-06-20',9,25,NULL,25,300,'room'),('2020-09-15',9,26,NULL,26,1000,'room'),('2021-01-03',9,27,NULL,27,400,'room'),('2021-03-20',8,22,NULL,22,300,'room'),('2021-04-18',8,23,NULL,23,600,'room'),('2021-05-11',31,72,NULL,72,300,'room'),('2021-09-12',34,77,NULL,77,200,'room'),('2021-09-17',34,78,NULL,78,300,'room'),('2021-11-25',37,84,NULL,84,450,'room'),('2022-02-18',7,21,NULL,21,2600,'room'),('2022-06-03',13,35,NULL,35,300,'room'),('2022-08-16',11,31,NULL,31,100,'room'),('2022-11-17',6,16,NULL,16,700,'room'),('2022-12-10',5,14,NULL,14,1000,'room'),('2022-12-15',6,18,NULL,18,750,'room'),('2023-01-04',7,19,NULL,19,200,'room'),('2023-01-25',13,36,NULL,36,400,'room'),('2023-02-04',2,4,NULL,4,300,'room'),('2023-02-19',6,17,NULL,17,400,'room'),('2023-05-14',1,1,NULL,1,400,'room'),('2023-06-27',1,2,NULL,2,400,'room'),('2023-07-10',5,13,NULL,13,200,'room'),('2023-09-10',7,20,NULL,20,600,'room'),('2023-10-17',4,10,NULL,10,1200,'room'),('2023-11-15',4,11,NULL,11,1500,'room'),('2023-12-18',3,7,NULL,7,300,'room'),('2024-01-15',1,3,NULL,3,450,'room'),('2024-02-18',3,8,NULL,8,1100,'room'),('2024-03-19',2,5,NULL,5,300,'room'),('2024-04-18',4,12,NULL,12,1200,'room'),('2024-05-07',2,6,NULL,6,200,'room'),('2024-05-11',50,100,NULL,100,3000,'meeting room'),('2024-05-15',11,32,NULL,32,300,'room');
/*!40000 ALTER TABLE `charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuration` (
  `configId` int NOT NULL AUTO_INCREMENT,
  `configDescription` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`configId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (1,'Queen + Queen'),(2,'Queen'),(3,'Queen+Twin'),(4,'King+Queen');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `organizationName` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `phoneNumber` char(11) DEFAULT NULL,
  `creditCard` char(12) DEFAULT NULL,
  `qualityAssessmentScore` int DEFAULT NULL,
  PRIMARY KEY (`customerId`),
  CONSTRAINT `customer_chk_1` CHECK (((`qualityAssessmentScore` >= 0) and (`qualityAssessmentScore` <= 100)))
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Hiroshi','Sato',NULL,'Japan','234567890','234567890123',85),(2,'Maria','Silva',NULL,'Portugal','2345678901','345678901234',75),(3,'Alejandro','Gonzalez',NULL,'United States','3456789012','456789012345',80),(4,'Sofia','Andersson',NULL,'Sweden','4567890123','567890123456',65),(5,'Jayson','Levi',NULL,'United States','5678901234','678901234567',70),(6,'Léa','Dubois',NULL,'France','6789012345','789012345678',55),(7,'Ravi','Patel',NULL,'India','7890123456','901234567890',75),(8,'Emilia','Kovalenko',NULL,'Russia','8901234567','012345678901',85),(9,'Seung','Kim',NULL,'South Korea','9012345678','123456789012',60),(10,'Chiara','Rossi',NULL,'Italy','0123456789','234567890123',70),(11,'Jorge','Lopez',NULL,'Argentina','1234567890','345678901234',80),(12,'Anastasia','Ivanova',NULL,'Russia','2345678901','456789012345',75),(13,'Takumi','Suzuki',NULL,'Japan','3456789012','567890123456',65),(14,'Elena','Fernández',NULL,'Spain','4567890123','678901234567',55),(15,'Liam','O\'Connor',NULL,'United States','5678901234','789012345678',70),(16,'Lina','Jansen',NULL,'Sweden','6789012345','901234567890',75),(17,'Vladimir','Petrov',NULL,'Russia','7890123456','123456789012',65),(18,'Nina','Kuznetsova',NULL,'Russia','8901234567','234567890123',75),(19,'Carlos','Garcia',NULL,'Spain','3456789012','567890123456',80),(20,'Anna','Müller',NULL,'Germany','4567890123','789012345678',65),(21,'Yusuke','Tanaka',NULL,'Japan','5678901234','901234567890',70),(22,'Isabella','Ferreira',NULL,'Portugal','6789012345','123456789012',55),(23,'Jake','Rothbard',NULL,'United States','7890123456','345678901234',75),(24,'Matteo','Romano',NULL,'Italy','9012345678','678901234567',85),(25,'Eva','Andersson',NULL,'Sweden','0123456789','901234567890',60),(26,'Kaito','Yamamoto',NULL,'Japan','2345678901','234567890123',70),(27,'Sophie','Lefèvre',NULL,'France','3456789012','456789012345',80),(28,'Rajesh','Kumar',NULL,'India','4567890123','567890123456',75),(29,'Federico','Ricci',NULL,'Italy','5678901234','678901234567',65),(30,'Amira','Ali',NULL,'Egypt','6789012345','789012345678',70),(31,'Olga','Sokolova',NULL,'Russia','7890123456','890123456789',75),(32,'Miguel','Fernández',NULL,'Spain','9012345678','901234567890',55),(33,'Lin','Chen',NULL,'China','0123456789','123456789012',85),(34,'Emilija','Janković',NULL,'Serbia','2345678901','234567890123',60),(35,'Thiago','Santos',NULL,'Brazil','3456789012','345678901234',70),(36,'Lotte','Jansen',NULL,'Netherlands','4567890123','456789012345',80),(37,'Antonio','Rossi',NULL,'Italy','5678901234','567890123456',75),(38,'James','Staeger','Seagate','China','7852373478','390434682389',67),(39,'Cynthia','Li','Yobe','United States','8932348960','394028019468',78),(40,'Ice','Spice','Universal Music Group','United States','6931393892','389247933812',82),(41,'Executive','Person','Organization','United Kingdom','8402379168','675423749823',NULL),(42,'Mister','Mango','Red Mango','United States','8362349571','785423473798',NULL),(43,'John','Lee',NULL,'United States','8624445528','232409837489',NULL),(44,'Amanda','Struig',NULL,'United States','9176747384','387423470983',NULL),(45,'Brandon','Larp',NULL,'United States','9173459849','342507586384',NULL),(46,'Camden','Safari',NULL,'United States','7624352849','867537499127',NULL),(47,'Yardick','Staff',NULL,'Norway','7653892845','836457841924',NULL),(48,'Yammies','Card',NULL,'United States','3743759583','834567582694',NULL),(49,'Cesar','Perez',NULL,'Mexico','3848592956','846723453895',NULL),(50,'Albert','Tang',NULL,'United States','3845692904','380257933950',NULL),(51,'Joan','Lam',NULL,'United States','7568023794','189240379257',NULL),(52,'Manda','Cam',NULL,'France','8930346927','490284683026',NULL),(53,'Alex','Caruso',NULL,'United States','6493681027','380628491537',NULL),(54,'Anna','Choi',NULL,'South Korea','3895381046','956739024692',NULL),(55,'Steven','Harding',NULL,'United States','3489235792','389068473956',NULL),(56,'Marcus','Cham',NULL,'China','3784850234','475806823435',NULL),(57,'Eric','Chen',NULL,'United States','3489040673','756274856793',NULL),(58,'Max','Tanger',NULL,'Canada','4850358492','347923491034',NULL),(59,'Tate','Sparks',NULL,'United States','3349563840','756948026382',NULL),(60,'Alex','Nigam',NULL,'India','3849260958','374534980912',NULL),(61,'Sarah','Collins',NULL,'United States','3489464829','128337852738',NULL),(62,'Mia','Morreale',NULL,'United States','3492123897','123894683023',NULL),(63,'Maya','Stanford',NULL,'United Kingdom','3745672937','374947328123',NULL),(64,'James','Aiyuk',NULL,'United States','3489236482','475923441532',NULL),(65,'Ram','Yarden',NULL,'Turkey','3748523465','574337494673',NULL),(66,'Arden','Bakatov',NULL,'Russia','3849249834','478583941234',NULL),(67,'Abigail','Gates',NULL,'United States','3481325849','859505943948',NULL),(68,'Claudia','Brody',NULL,'United States','8594832384','128937481265',NULL),(69,'Maximilian','Bamm',NULL,'United States','5869456523','862444552934',NULL),(70,'Michael','Lee',NULL,'United States','8622284332','384956792364',NULL),(71,'Aryan','Dugar',NULL,'United States','4589430235','111111111111',NULL),(72,'Larden','Waaa',NULL,'Australia','3845849278','222222222222',NULL),(73,'Waya','Ai',NULL,'China','3849572947','333333333333',NULL),(74,'Lambas','Kar',NULL,'United States','4758379273','444444444444',NULL),(75,'Yasi','Caron',NULL,'Argentina','3849270284','555555555555',NULL),(76,'Kwasi','Appiah',NULL,'Cameroon','6896748394','666666666666',NULL),(77,'Bata','Bruh',NULL,'United States','4895039898','777777777777',NULL),(78,'Kaya','Bao',NULL,'China','8694857878','888888888888',NULL),(79,'Staria','Clem',NULL,'United States','6784858383','999999999999',NULL),(80,'Rasta','Hilton',NULL,'Canada','7474749797','121212121212',NULL),(81,'Maria','Hilton',NULL,'Canada','4858485858','131313131313',NULL),(82,'Dolce','Stupp',NULL,'United Kingdom','3470483838','141414141414',NULL),(83,'Marden','Alu',NULL,'Latvia','3584858484','151515151515',NULL),(84,'Aroce','Cars',NULL,'Canada','5755555555','161616161616',NULL),(85,'Roca','Acor',NULL,'United States','6666666666','171717171717',NULL),(86,'Mars','Bar',NULL,'United States','7897897891','181818181818',NULL),(87,'Snickers','Doodle',NULL,'United States','4385788888','191919191919',NULL),(88,'Ai','Karuki',NULL,'Japan','238958787','202020202020',NULL),(89,'Cammi','Carson',NULL,'United States','3434342424','212121212121',NULL),(90,'Larden','Morad',NULL,'Italy','3333333333','222233334444',NULL),(91,'Yamerton','Suppy',NULL,'United States','3423231234','878787878787',NULL),(92,'Madrid','Champion',NULL,'Spain','3437778989','989898989898',NULL),(93,'David','Charleston',NULL,'United Kingdom','5889898787','777877787778',NULL),(94,'Glucot','Carden',NULL,'Belgium','4859488888','676767676767',NULL),(95,'Arlight','Cars',NULL,'United States','4578887873','878787878787',NULL),(96,'Sammy','Kresh',NULL,'United States','3646466666','565656565656',NULL),(97,'Sarab','Singh',NULL,'India','4759690986','777744443333',NULL),(98,'Andrew','Minocha',NULL,'United States','4559908989','458079675489',NULL),(99,'Andrew','Shelhoff',NULL,'Russia','6784940093','576857685768',NULL),(100,'Armaan','Ta',NULL,'United States','8957838923','797987878787',NULL),(101,'Stamin','Caned',NULL,'Canada','7564783859','565676763636',NULL),(102,'Lara','Crawford',NULL,'United States','6567839283','567567567888',NULL),(103,'Lindsey','Star',NULL,'United States','4579862387','686868683636',NULL),(104,'Cara','Larn',NULL,'Spain','4580909898','666655554444',NULL),(105,'Stan','Vester',NULL,'United States','4759583049','555588882222',NULL),(106,'Carl','Cornelius',NULL,'Italy','6895783294','777733332222',NULL),(107,'Starla','Boarden',NULL,'United States','7689437584','666677773333',NULL),(108,'Stai','Charol',NULL,'India','6849385784','379744673764',NULL),(109,'Marney','Arroz',NULL,'United States','6088785858','333322229999',NULL),(110,'Avery','Gonz',NULL,'Canada','6859878787','777744449999',NULL),(111,'Carlisle','Hall',NULL,'United States','4579690923','111122224444',NULL),(112,'Mia','Dalton',NULL,'United States','8624335454','666677772222',NULL),(113,'Marley','Coval',NULL,'United States','7658932394','444488883333',NULL),(114,'Mandy','Scoot',NULL,'United States','9574657382','333344444444',NULL),(115,'Arwen','Carson',NULL,'United States','7654783434','444477772222',NULL),(116,'Realin','Cammerson',NULL,'Canada','5753984857','777777776666',NULL),(117,'Starma','Marty',NULL,'United States','5768457938','333322225555',NULL),(118,'Arnada','Cane',NULL,'United Kingdom','4759687878','222475668357',NULL),(119,'Liam','Pilarski',NULL,'United States','7893748282','457574782933',NULL),(120,'Raise','Bruh',NULL,'United States','6894857384','676767676762',NULL),(121,'Riam','Cara',NULL,'United Kingdom','45798787838','777727271717',NULL),(122,'Ronaldo','Pablo',NULL,'Mexico','7865894757','555577678888',NULL),(123,'Aryet','Calum',NULL,'United States','7778885353','454587876767',NULL),(124,'Arnav','Parden',NULL,'United States','9678749375','767646565656',NULL),(125,'Carly','Damerson',NULL,'Canada','6785948585','969696969696',NULL),(126,'Carley','Morey',NULL,'United States','5769348578','457598345734',NULL),(127,'Morrison','Barnes',NULL,'United States','5749998989','221322222222',NULL),(128,'Morriet','Corset',NULL,'United States','3457854855','333233332222',NULL),(129,'Amanda','Laney',NULL,'Canada','3448989456','123412341234',NULL),(130,'Stella','Arellit',NULL,'United States','5768980909','000000001111',NULL),(131,'Arget','Carn',NULL,'Spain','6739837402','000011113333',NULL),(132,'Barley','Wheat',NULL,'United States','8983728172','437589782348',NULL),(133,'Lastern','Pliss',NULL,'United States','7773432838','986656478263',NULL),(134,'Carnot','Period',NULL,'Canada','6666663333','232384843434',NULL),(135,'Carliet','Durant',NULL,'United States','5847342323','111122223332',NULL),(136,'Dilce','Paroz',NULL,'Mexico','2384983747','587937489234',NULL),(137,'Lambda','Wha',NULL,'United States','5647928383','568092839403',NULL),(138,'Allie','Border',NULL,'Canada','4589387878','123456781212',NULL),(139,'Mario','Brother',NULL,'Italy','4583902929','343498982737',NULL),(140,'Luigi','Brother',NULL,'Italy','7779991221','678023212321',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_`
--

DROP TABLE IF EXISTS `event_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_` (
  `eventId` int NOT NULL AUTO_INCREMENT,
  `duration` int DEFAULT NULL,
  `estimatedAttendance` int DEFAULT NULL,
  `estimatedGuests` int DEFAULT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_`
--

LOCK TABLES `event_` WRITE;
/*!40000 ALTER TABLE `event_` DISABLE KEYS */;
INSERT INTO `event_` VALUES (1,95,100,1);
/*!40000 ALTER TABLE `event_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floor_designation`
--

DROP TABLE IF EXISTS `floor_designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `floor_designation` (
  `wingId` char(4) NOT NULL,
  `floorNumber` int NOT NULL,
  `smokingFlag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`wingId`,`floorNumber`),
  CONSTRAINT `floor_designation_ibfk_1` FOREIGN KEY (`wingId`) REFERENCES `wing` (`wingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floor_designation`
--

LOCK TABLES `floor_designation` WRITE;
/*!40000 ALTER TABLE `floor_designation` DISABLE KEYS */;
INSERT INTO `floor_designation` VALUES ('NYAA',1,_binary ''),('NYAA',2,_binary '\0'),('NYAB',1,_binary '\0');
/*!40000 ALTER TABLE `floor_designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `customerId` int NOT NULL,
  `reservationNumber` int NOT NULL,
  `eventId` int DEFAULT NULL,
  PRIMARY KEY (`customerId`,`reservationNumber`),
  KEY `eventId` (`eventId`),
  KEY `guest_ibfk_2_idx` (`reservationNumber`),
  CONSTRAINT `guest_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `guest_ibfk_3` FOREIGN KEY (`eventId`) REFERENCES `event_` (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (1,1,NULL),(1,2,NULL),(1,3,NULL),(2,4,NULL),(2,5,NULL),(2,6,NULL),(3,7,NULL),(3,8,NULL),(3,9,NULL),(4,10,NULL),(4,11,NULL),(4,12,NULL),(5,13,NULL),(5,14,NULL),(5,15,NULL),(6,16,NULL),(6,17,NULL),(6,18,NULL),(7,19,NULL),(7,20,NULL),(7,21,NULL),(8,22,NULL),(8,23,NULL),(8,24,NULL),(9,25,NULL),(9,26,NULL),(9,27,NULL),(10,28,NULL),(10,29,NULL),(10,30,NULL),(11,31,NULL),(11,32,NULL),(12,33,NULL),(12,34,NULL),(13,35,NULL),(13,36,NULL),(14,37,NULL),(14,38,NULL),(15,39,NULL),(15,40,NULL),(16,41,NULL),(16,42,NULL),(17,43,NULL),(17,44,NULL),(18,45,NULL),(18,46,NULL),(19,47,NULL),(19,48,NULL),(20,49,NULL),(20,50,NULL),(21,51,NULL),(21,52,NULL),(22,53,NULL),(22,54,NULL),(23,55,NULL),(23,56,NULL),(24,57,NULL),(24,58,NULL),(25,59,NULL),(25,60,NULL),(26,61,NULL),(26,62,NULL),(27,63,NULL),(27,64,NULL),(28,65,NULL),(28,66,NULL),(29,67,NULL),(29,68,NULL),(30,69,NULL),(30,70,NULL),(31,71,NULL),(31,72,NULL),(32,73,NULL),(32,74,NULL),(33,75,NULL),(33,76,NULL),(34,77,NULL),(34,78,NULL),(35,79,NULL),(35,80,NULL),(36,81,NULL),(36,82,NULL),(37,83,NULL),(37,84,NULL),(38,85,NULL),(38,86,NULL),(39,87,NULL),(39,88,NULL),(40,89,NULL),(40,90,NULL),(41,91,NULL),(42,92,NULL),(43,93,NULL),(44,94,NULL),(45,95,NULL),(46,96,NULL),(47,97,NULL),(48,98,NULL),(49,99,NULL),(51,1,NULL),(51,2,NULL),(51,3,NULL),(52,1,NULL),(52,2,NULL),(52,3,NULL),(53,1,NULL),(53,2,NULL),(54,4,NULL),(54,5,NULL),(54,6,NULL),(55,5,NULL),(56,8,NULL),(56,9,NULL),(57,9,NULL),(58,10,NULL),(58,12,NULL),(59,10,NULL),(59,12,NULL),(60,10,NULL),(60,12,NULL),(61,13,NULL),(61,14,NULL),(61,15,NULL),(62,14,NULL),(62,15,NULL),(63,15,NULL),(64,16,NULL),(64,17,NULL),(64,18,NULL),(65,17,NULL),(65,18,NULL),(66,17,NULL),(67,20,NULL),(67,21,NULL),(68,20,NULL),(68,21,NULL),(69,20,NULL),(69,21,NULL),(70,22,NULL),(70,23,NULL),(71,23,NULL),(72,23,NULL),(73,25,NULL),(73,26,NULL),(73,27,NULL),(74,26,NULL),(74,27,NULL),(75,27,NULL),(76,28,NULL),(76,29,NULL),(76,30,NULL),(77,28,NULL),(77,29,NULL),(77,30,NULL),(78,28,NULL),(78,29,NULL),(79,32,NULL),(80,33,NULL),(80,34,NULL),(81,33,NULL),(81,34,NULL),(82,33,NULL),(83,35,NULL),(84,37,NULL),(85,37,NULL),(86,39,NULL),(87,39,NULL),(88,39,NULL),(88,40,NULL),(89,42,NULL),(90,43,NULL),(90,44,NULL),(91,46,NULL),(92,46,NULL),(93,46,NULL),(94,47,NULL),(95,47,NULL),(95,48,NULL),(96,51,NULL),(97,53,NULL),(98,55,NULL),(98,56,NULL),(99,55,NULL),(99,56,NULL),(100,55,NULL),(100,56,NULL),(101,59,NULL),(101,60,NULL),(102,60,NULL),(103,62,NULL),(104,62,NULL),(105,64,NULL),(106,64,NULL),(107,66,NULL),(108,69,NULL),(108,70,NULL),(109,69,NULL),(109,70,NULL),(110,72,NULL),(111,73,NULL),(112,73,NULL),(113,73,NULL),(113,74,NULL),(114,75,NULL),(115,75,NULL),(115,76,NULL),(116,78,NULL),(117,78,NULL),(118,80,NULL),(119,81,NULL),(119,82,NULL),(120,81,NULL),(120,82,NULL),(121,82,NULL),(122,83,NULL),(122,84,NULL),(123,83,NULL),(123,84,NULL),(124,87,NULL),(124,88,NULL),(125,87,NULL),(125,88,NULL),(126,87,NULL),(127,89,NULL),(127,90,NULL),(128,89,NULL),(128,90,NULL),(129,89,NULL),(129,90,NULL),(130,91,NULL),(131,91,NULL),(132,92,NULL),(133,92,NULL),(134,92,NULL),(135,93,NULL),(136,95,NULL),(137,95,NULL),(138,96,NULL),(139,97,NULL),(140,98,NULL),(50,100,1);
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_complex`
--

DROP TABLE IF EXISTS `hotel_complex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_complex` (
  `complexId` char(2) NOT NULL,
  `phoneNumber` char(10) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`complexId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_complex`
--

LOCK TABLES `hotel_complex` WRITE;
/*!40000 ALTER TABLE `hotel_complex` DISABLE KEYS */;
INSERT INTO `hotel_complex` VALUES ('NY','7183950388','15 Washington Pl, New York, United States');
/*!40000 ALTER TABLE `hotel_complex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_reservation`
--

DROP TABLE IF EXISTS `meeting_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_reservation` (
  `reservationNumber` int NOT NULL,
  `eventId` int NOT NULL,
  `reservationDate` date DEFAULT NULL,
  `usageTime` varchar(20) DEFAULT NULL,
  `rateAlteration` int DEFAULT NULL,
  PRIMARY KEY (`reservationNumber`),
  KEY `eventId` (`eventId`),
  CONSTRAINT `meeting_reservation_ibfk_1` FOREIGN KEY (`reservationNumber`) REFERENCES `reservation` (`reservationNumber`),
  CONSTRAINT `meeting_reservation_ibfk_2` FOREIGN KEY (`eventId`) REFERENCES `event_` (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_reservation`
--

LOCK TABLES `meeting_reservation` WRITE;
/*!40000 ALTER TABLE `meeting_reservation` DISABLE KEYS */;
INSERT INTO `meeting_reservation` VALUES (100,1,'2024-07-02','lunch',NULL);
/*!40000 ALTER TABLE `meeting_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_room`
--

DROP TABLE IF EXISTS `meeting_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_room` (
  `roomKey` char(7) NOT NULL,
  `toiletFlag` bit(1) DEFAULT NULL,
  `outdoorsFlag` bit(1) DEFAULT NULL,
  `sleepingRoomFlag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`roomKey`),
  CONSTRAINT `meeting_room_ibfk_1` FOREIGN KEY (`roomKey`) REFERENCES `room` (`roomKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_room`
--

LOCK TABLES `meeting_room` WRITE;
/*!40000 ALTER TABLE `meeting_room` DISABLE KEYS */;
INSERT INTO `meeting_room` VALUES ('NYAA102',_binary '',_binary '\0',_binary '');
/*!40000 ALTER TABLE `meeting_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pincard`
--

DROP TABLE IF EXISTS `pincard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pincard` (
  `pinNum` int NOT NULL AUTO_INCREMENT,
  `usable` bit(1) DEFAULT NULL,
  PRIMARY KEY (`pinNum`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pincard`
--

LOCK TABLES `pincard` WRITE;
/*!40000 ALTER TABLE `pincard` DISABLE KEYS */;
INSERT INTO `pincard` VALUES (1,_binary ''),(2,_binary ''),(3,_binary ''),(4,_binary ''),(5,_binary ''),(6,_binary ''),(7,_binary ''),(8,_binary ''),(9,_binary ''),(10,_binary ''),(11,_binary ''),(12,_binary ''),(13,_binary ''),(14,_binary ''),(15,_binary ''),(16,_binary ''),(17,_binary ''),(18,_binary ''),(19,_binary ''),(20,_binary ''),(21,_binary ''),(22,_binary ''),(23,_binary '');
/*!40000 ALTER TABLE `pincard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservationNumber` int NOT NULL AUTO_INCREMENT,
  `roomKey` char(7) DEFAULT NULL,
  `customerId` int NOT NULL,
  PRIMARY KEY (`reservationNumber`),
  KEY `roomKey` (`roomKey`),
  KEY `customerId` (`customerId`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`roomKey`) REFERENCES `room` (`roomKey`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'NYAB101',1),(2,'NYAB101',1),(3,'NYAA201',1),(4,'NYAA202',2),(5,'NYAA201',2),(6,'NYAA202',2),(7,'NYAA103',3),(8,'NYAA103',3),(9,NULL,3),(10,'NYAB101',4),(11,'NYAB102',4),(12,'NYAB101',4),(13,'NYAA202',5),(14,'NYAA101',5),(15,NULL,5),(16,'NYAA202',6),(17,'NYAB101',6),(18,'NYAA201',6),(19,'NYAA202',7),(20,'NYAB101',7),(21,'NYAB101',7),(22,'NYAA202',8),(23,'NYAB101',8),(24,'NYAA202',8),(25,'NYAA202',9),(26,'NYAA101',9),(27,'NYAB101',9),(28,'NYAB101',10),(29,'NYAB101',10),(30,'NYAA201',10),(31,'NYAA103',11),(32,'NYAA202',11),(33,'NYAB101',12),(34,'NYAA201',12),(35,'NYAA202',13),(36,'NYAA202',13),(37,'NYAA201',14),(38,'NYAA103',14),(39,'NYAB101',15),(40,'NYAA202',15),(41,'NYAA202',16),(42,'NYAA202',16),(43,'NYAA202',17),(44,'NYAA202',17),(45,'NYAA202',18),(46,'NYAB101',18),(47,'NYAA201',19),(48,'NYAA202',19),(49,'NYAB102',20),(50,'NYAB102',20),(51,'NYAA202',21),(52,'NYAA202',21),(53,'NYAA202',22),(54,'NYAA202',22),(55,'NYAB101',23),(56,'NYAB101',23),(57,'NYAA103',24),(58,'NYAA103',24),(59,'NYAA202',25),(60,'NYAA201',25),(61,'NYAA202',26),(62,'NYAA201',26),(63,'NYAA202',27),(64,'NYAA201',27),(65,'NYAA202',28),(66,'NYAA202',28),(67,'NYAA202',29),(68,'NYAA202',29),(69,'NYAA201',30),(70,'NYAA201',30),(71,'NYAA202',31),(72,'NYAA202',31),(73,'NYAB101',32),(74,'NYAA202',32),(75,'NYAA201',33),(76,'NYAA202',33),(77,'NYAA202',34),(78,'NYAA201',34),(79,'NYAA202',35),(80,'NYAA202',35),(81,'NYAA201',36),(82,'NYAB101',36),(83,'NYAA201',37),(84,'NYAA201',37),(85,'NYAA202',38),(86,'NYAA202',38),(87,'NYAB101',39),(88,'NYAA201',39),(89,'NYAB101',40),(90,'NYAB101',40),(91,NULL,41),(92,NULL,42),(93,NULL,43),(94,NULL,44),(95,NULL,45),(96,NULL,46),(97,NULL,47),(98,NULL,48),(99,NULL,49),(100,'NYAA102',50);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `roomKey` char(7) NOT NULL,
  `roomNumber` char(4) DEFAULT NULL,
  `wingId` char(4) NOT NULL,
  `rentalRate` int DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `sqft` int DEFAULT NULL,
  `roomStatus` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`roomKey`),
  KEY `wingId` (`wingId`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`wingId`) REFERENCES `wing` (`wingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('NYAA101','A101','NYAA',200,4,400,'available'),('NYAA102','A102','NYAA',3000,200,5000,'available'),('NYAA103','A103','NYAA',100,2,125,'available'),('NYAA201','A201','NYAA',150,3,300,'available'),('NYAA202','A202','NYAA',100,2,125,'not available'),('NYAB101','B101','NYAB',200,4,400,'available'),('NYAB102','B102','NYAB',500,8,700,'available');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_adjacency`
--

DROP TABLE IF EXISTS `room_adjacency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_adjacency` (
  `firstRoomKey` char(7) NOT NULL,
  `secondRoomKey` char(7) NOT NULL,
  PRIMARY KEY (`firstRoomKey`,`secondRoomKey`),
  KEY `secondRoomKey` (`secondRoomKey`),
  CONSTRAINT `room_adjacency_ibfk_1` FOREIGN KEY (`firstRoomKey`) REFERENCES `room` (`roomKey`),
  CONSTRAINT `room_adjacency_ibfk_2` FOREIGN KEY (`secondRoomKey`) REFERENCES `room` (`roomKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_adjacency`
--

LOCK TABLES `room_adjacency` WRITE;
/*!40000 ALTER TABLE `room_adjacency` DISABLE KEYS */;
INSERT INTO `room_adjacency` VALUES ('NYAA101','NYAA102'),('NYAA102','NYAA103'),('NYAA201','NYAA202'),('NYAB101','NYAB102');
/*!40000 ALTER TABLE `room_adjacency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_join`
--

DROP TABLE IF EXISTS `room_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_join` (
  `primaryRoomKey` char(7) NOT NULL,
  `secondaryRoomKey` char(7) NOT NULL,
  PRIMARY KEY (`primaryRoomKey`,`secondaryRoomKey`),
  KEY `secondaryRoomKey` (`secondaryRoomKey`),
  CONSTRAINT `room_join_ibfk_1` FOREIGN KEY (`primaryRoomKey`) REFERENCES `room` (`roomKey`),
  CONSTRAINT `room_join_ibfk_2` FOREIGN KEY (`secondaryRoomKey`) REFERENCES `room` (`roomKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_join`
--

LOCK TABLES `room_join` WRITE;
/*!40000 ALTER TABLE `room_join` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_join` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `serviceId` int NOT NULL AUTO_INCREMENT,
  `serviceDescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`serviceId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Massage'),(2,'Phone Usage'),(3,'Meal');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sleeping_reservation`
--

DROP TABLE IF EXISTS `sleeping_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sleeping_reservation` (
  `reservationNumber` int NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `extensionEarly` int DEFAULT NULL,
  `extensionLate` int DEFAULT NULL,
  `surchargeDays` int DEFAULT NULL,
  `numGuests` int DEFAULT NULL,
  `bedPref` varchar(40) DEFAULT NULL,
  `sizePref` varchar(40) DEFAULT NULL,
  `locationPref` varchar(40) DEFAULT NULL,
  `smokingFlag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`reservationNumber`),
  CONSTRAINT `sleeping_reservation_ibfk_1` FOREIGN KEY (`reservationNumber`) REFERENCES `reservation` (`reservationNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sleeping_reservation`
--

LOCK TABLES `sleeping_reservation` WRITE;
/*!40000 ALTER TABLE `sleeping_reservation` DISABLE KEYS */;
INSERT INTO `sleeping_reservation` VALUES (1,'2023-05-12','2023-05-14',0,0,0,4,'two queens','medium','closer to pool',_binary '\0'),(2,'2023-06-25','2023-06-27',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(3,'2024-01-12','2024-01-15',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(4,'2023-02-01','2023-02-04',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(5,'2024-03-17','2024-03-19',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(6,'2024-05-05','2024-05-07',0,0,0,2,NULL,NULL,NULL,_binary ''),(7,'2023-12-15','2023-12-18',0,0,0,1,NULL,NULL,NULL,_binary ''),(8,'2024-02-07','2024-02-18',0,0,0,2,NULL,NULL,NULL,_binary ''),(9,'2024-06-01','2024-06-10',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(10,'2023-10-11','2023-10-17',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(11,'2023-11-12','2023-11-15',0,0,0,1,'king','large',NULL,_binary '\0'),(12,'2024-04-12','2024-04-18',0,0,0,4,'two queens','medium',NULL,_binary '\0'),(13,'2023-07-08','2023-07-10',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(14,'2022-12-05','2022-12-10',0,0,0,3,NULL,NULL,NULL,_binary ''),(15,'2024-06-02','2024-06-04',0,0,0,4,NULL,NULL,NULL,_binary ''),(16,'2022-11-10','2022-11-17',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(17,'2023-02-17','2023-02-19',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(18,'2022-12-10','2022-12-15',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(19,'2023-01-02','2023-01-04',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(20,'2023-09-07','2023-09-10',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(21,'2022-02-05','2022-02-18',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(22,'2021-03-17','2021-03-20',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(23,'2021-04-15','2021-04-18',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(24,'2020-04-05','2020-04-15',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(25,'2020-06-17','2020-06-20',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(26,'2020-09-10','2020-09-15',0,0,0,3,NULL,NULL,NULL,_binary ''),(27,'2021-01-01','2021-01-03',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(28,'2020-01-01','2020-01-03',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(29,'2020-01-17','2020-01-19',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(30,'2020-02-09','2020-02-11',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(31,'2022-08-15','2022-08-16',0,0,0,1,NULL,'small',NULL,_binary ''),(32,'2024-05-12','2024-05-15',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(33,'2019-01-01','2019-01-04',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(34,'2019-03-13','2019-03-15',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(35,'2022-05-31','2022-06-03',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(36,'2023-01-21','2023-01-25',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(37,'2017-05-24','2017-05-26',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(38,'2019-03-14','2019-03-17',0,0,0,1,'king',NULL,NULL,_binary ''),(39,'2016-11-12','2016-11-15',0,0,0,4,'queen',NULL,NULL,_binary '\0'),(40,'2017-12-25','2017-12-30',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(41,'2016-03-05','2016-03-06',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(42,'2016-05-02','2016-05-05',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(43,'2016-02-14','2016-02-16',0,0,0,2,'king',NULL,'poolside',_binary '\0'),(44,'2017-02-14','2017-02-16',0,0,0,2,'king',NULL,'poolside',_binary '\0'),(45,'2016-06-06','2016-06-08',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(46,'2017-02-08','2017-02-10',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(47,'2016-04-02','2016-04-05',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(48,'2016-05-14','2016-05-17',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(49,'2017-10-31','2017-11-01',0,0,0,1,'queen','large',NULL,_binary '\0'),(50,'2018-10-31','2018-11-01',0,0,0,1,'queen','large',NULL,_binary '\0'),(51,'2016-07-09','2016-07-11',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(52,'2016-08-12','2016-08-13',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(53,'2017-09-23','2017-09-25',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(54,'2018-10-01','2018-10-05',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(55,'2016-08-16','2016-08-20',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(56,'2017-08-16','2017-08-20',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(57,'2016-04-20','2016-04-23',0,0,0,1,NULL,NULL,NULL,_binary ''),(58,'2017-04-20','2017-04-21',0,0,0,1,NULL,NULL,NULL,_binary ''),(59,'2015-04-14','2015-04-18',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(60,'2016-07-04','2016-07-05',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(61,'2016-08-31','2016-09-02',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(62,'2016-11-12','2016-11-15',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(63,'2017-12-01','2017-12-03',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(64,'2018-01-01','2018-01-03',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(65,'2017-04-02','2017-04-05',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(66,'2018-05-31','2018-06-03',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(67,'2017-10-15','2017-10-16',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(68,'2017-10-30','2017-10-31',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(69,'2016-06-09','2016-06-11',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(70,'2016-07-09','2016-07-12',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(71,'2016-05-08','2016-05-11',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(72,'2021-05-08','2021-05-11',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(73,'2017-11-11','2017-11-14',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(74,'2018-02-11','2018-02-13',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(75,'2016-09-02','2016-09-05',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(76,'2017-08-13','2017-08-15',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(77,'2021-09-10','2021-09-12',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(78,'2021-09-15','2021-09-17',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(79,'2017-08-02','2017-08-03',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(80,'2016-10-25','2016-10-27',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(81,'2017-11-03','2017-11-05',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(82,'2018-12-05','2018-12-10',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(83,'2016-11-22','2016-11-24',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(84,'2021-11-22','2021-11-25',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(85,'2016-03-03','2016-03-05',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(86,'2017-03-04','2017-03-06',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(87,'2016-06-18','2016-06-20',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(88,'2017-05-05','2017-05-07',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(89,'2015-01-01','2015-01-05',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(90,'2017-02-19','2017-02-23',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(91,'2024-11-12','2024-11-15',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(92,'2024-12-23','2024-12-25',0,0,0,4,NULL,NULL,NULL,_binary '\0'),(93,'2024-07-03','2024-07-07',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(94,'2024-08-11','2024-08-14',0,0,0,1,NULL,NULL,NULL,_binary '\0'),(95,'2025-01-05','2025-01-08',0,0,0,3,NULL,NULL,NULL,_binary '\0'),(96,'2024-09-10','2024-09-12',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(97,'2024-10-10','2024-10-13',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(98,'2024-12-17','2024-12-19',0,0,0,2,NULL,NULL,NULL,_binary '\0'),(99,'2024-12-25','2024-12-28',0,0,0,1,NULL,NULL,NULL,_binary '\0');
/*!40000 ALTER TABLE `sleeping_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sleeping_room`
--

DROP TABLE IF EXISTS `sleeping_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sleeping_room` (
  `roomKey` char(7) NOT NULL,
  `configId` int DEFAULT NULL,
  `smokingFlag` bit(1) DEFAULT NULL,
  `suiteFlag` bit(1) DEFAULT NULL,
  `foldingBedFlag` bit(1) DEFAULT NULL,
  `meetingRoomFlag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`roomKey`),
  KEY `configId` (`configId`),
  CONSTRAINT `sleeping_room_ibfk_1` FOREIGN KEY (`roomKey`) REFERENCES `room` (`roomKey`),
  CONSTRAINT `sleeping_room_ibfk_2` FOREIGN KEY (`configId`) REFERENCES `configuration` (`configId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sleeping_room`
--

LOCK TABLES `sleeping_room` WRITE;
/*!40000 ALTER TABLE `sleeping_room` DISABLE KEYS */;
INSERT INTO `sleeping_room` VALUES ('NYAA101',1,_binary '',_binary '\0',_binary '',_binary ''),('NYAA103',2,_binary '',_binary '\0',_binary '\0',_binary '\0'),('NYAA201',3,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),('NYAA202',2,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),('NYAB101',1,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),('NYAB102',4,_binary '\0',_binary '',_binary '',_binary '');
/*!40000 ALTER TABLE `sleeping_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wing`
--

DROP TABLE IF EXISTS `wing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wing` (
  `wingId` char(4) NOT NULL,
  `buildingId` char(3) NOT NULL,
  `numFloors` int DEFAULT NULL,
  `proximityToPool` int DEFAULT NULL,
  `proximityToGarage` int DEFAULT NULL,
  `accessibility` bit(1) DEFAULT NULL,
  `wingName` char(1) DEFAULT NULL,
  PRIMARY KEY (`wingId`),
  KEY `buildingId` (`buildingId`),
  CONSTRAINT `wing_ibfk_1` FOREIGN KEY (`buildingId`) REFERENCES `building` (`buildingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wing`
--

LOCK TABLES `wing` WRITE;
/*!40000 ALTER TABLE `wing` DISABLE KEYS */;
INSERT INTO `wing` VALUES ('NYAA','NYA',2,100,50,_binary '','a'),('NYAB','NYA',1,200,100,_binary '\0','b');
/*!40000 ALTER TABLE `wing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-11 21:40:30
