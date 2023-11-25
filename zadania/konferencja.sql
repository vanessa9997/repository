-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: conference
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `conference`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `conference` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci */;

USE `conference`;

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fees` (
  `fee_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` float NOT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`fee_id`),
  KEY `part_id` (`part_id`),
  CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`part_id`) REFERENCES `participants` (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
INSERT INTO `fees` VALUES (1,85.9,1,1),(2,85.9,0,4),(3,105.9,1,3),(4,85.9,0,2);
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papers`
--

DROP TABLE IF EXISTS `papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `papers` (
  `paper_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `day` varchar(10) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`paper_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `papers_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `participants` (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papers`
--

LOCK TABLES `papers` WRITE;
/*!40000 ALTER TABLE `papers` DISABLE KEYS */;
INSERT INTO `papers` VALUES (1,'Elektrownie wodne','czwartek',1),(2,'Budownictwo w Nowym Jorku','wtorek',6),(3,'Fauna Ameryki Poludniowej','piatek',3),(4,'Historia Afryki','poniedzial',5),(5,'Ewolucja','sroda',2);
/*!40000 ALTER TABLE `papers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_rooms`
--

DROP TABLE IF EXISTS `part_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_rooms` (
  `part_room_id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(15) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`part_room_id`),
  KEY `room_id` (`room_id`),
  KEY `part_id` (`part_id`),
  CONSTRAINT `part_rooms_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`),
  CONSTRAINT `part_rooms_ibfk_2` FOREIGN KEY (`part_id`) REFERENCES `participants` (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_rooms`
--

LOCK TABLES `part_rooms` WRITE;
/*!40000 ALTER TABLE `part_rooms` DISABLE KEYS */;
INSERT INTO `part_rooms` VALUES (1,'poniedzialek',1,6),(2,'sroda',5,3),(3,'sroda',5,4),(4,'czwartek',3,2),(5,'wtorek',4,1);
/*!40000 ALTER TABLE `part_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participants` (
  `part_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `degree` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `NIP` bigint(10) NOT NULL,
  `banquet` tinyint(1) DEFAULT NULL,
  `trip` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES (1,'Adam','Kowalski','doktor','kowalski@gmail.com',1234567892,0,NULL),(2,'John','Smith','profesor','smith@gmail.com',1298375628,NULL,1),(3,'James','Miller','magister','miller@gmail.com',2139873287,1,1),(4,'Anna','Kowalska','profesor','kowalska@gmail.com',1289326532,NULL,NULL),(5,'Sarah','Davis','doktor','davis@gmail.com',2349856743,1,NULL),(6,'Tomas','Jones','profesor','jones@gmail.com',1982395739,0,1);
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `single_double` char(1) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,22,'S'),(2,5,'D'),(3,19,'S'),(4,34,'D'),(5,15,'D');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universities`
--

DROP TABLE IF EXISTS `universities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `universities` (
  `uni_id` int(11) NOT NULL AUTO_INCREMENT,
  `uni_name` varchar(40) NOT NULL,
  `city` varchar(30) NOT NULL,
  `post_code` bigint(6) NOT NULL,
  `country` varchar(30) NOT NULL,
  `uni_part_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`uni_id`),
  KEY `uni_part_id` (`uni_part_id`),
  CONSTRAINT `universities_ibfk_1` FOREIGN KEY (`uni_part_id`) REFERENCES `participants` (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universities`
--

LOCK TABLES `universities` WRITE;
/*!40000 ALTER TABLE `universities` DISABLE KEYS */;
INSERT INTO `universities` VALUES (1,'Politechnika Gdanska','Gdansk',80244,'Polska',NULL),(2,'Uniwersytet Nowojorski','Nowy Jork',56734,'USA',3),(3,'Uniwersytet w Madrycie','Madryt',76854,'Hiszpania',NULL),(4,'Uniwersytet Stanforda','Stanford',56456,'USA',3),(5,'Uniwersytet Gdanski','Gdansk',80244,'Polska',1),(6,'Politechnika Warszawska','Warszawa',1475,'Polska',4),(7,'Uniwersytet Edynburski','Edynburg',34598,'Wielka Brytania',2),(8,'Uniwersytet Yale','New Haven',89648,'USA',5),(9,'Uniwersytet Columbia','Nowy Jork',56734,'USA',6);
/*!40000 ALTER TABLE `universities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-01 17:09:28
