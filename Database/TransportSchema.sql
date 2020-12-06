CREATE DATABASE  IF NOT EXISTS `transport` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `transport`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: transport
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `line`
--

DROP TABLE IF EXISTS `line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line` (
  `line_id` int NOT NULL AUTO_INCREMENT,
  `direction` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`line_id`,`direction`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line`
--

LOCK TABLES `line` WRITE;
/*!40000 ALTER TABLE `line` DISABLE KEYS */;
INSERT INTO `line` VALUES (1,1,'Vaughan-Finch'),(2,2,'Vaughan-Finch'),(3,3,'Bloor'),(4,4,'Bloor'),(5,3,'Sheppard-Don Mills'),(6,4,'Sheppard-Don Mills'),(7,3,'Scarborough'),(8,4,'Scarborough');
/*!40000 ALTER TABLE `line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `station_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `line` int DEFAULT NULL,
  `direction` int DEFAULT NULL,
  `station_order` int DEFAULT NULL,
  PRIMARY KEY (`station_id`),
  KEY `linedirection_idx` (`line`,`direction`),
  CONSTRAINT `linedirection` FOREIGN KEY (`line`, `direction`) REFERENCES `line` (`line_id`, `direction`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,'Vaughan',1,1,1),(2,'407',1,1,2),(3,'STGeorge',1,1,3),(4,'Union',1,1,4),(5,'Yonge',1,1,5),(6,'Finch',1,1,6),(7,'Vaughan',2,2,6),(8,'407',2,2,5),(9,'STGeorge',2,2,4),(10,'Union',2,2,3),(11,'Yonge',2,2,2),(12,'Finch',2,2,1),(13,'Islington',3,3,1),(14,'HighPark',3,3,2),(15,'STGeorge',3,3,3),(16,'Bay',3,3,4),(17,'Yonge',3,3,5),(18,'Broadview',3,3,6),(19,'Kennedy',3,3,7),(20,'Islington',4,4,7),(21,'HighPark',4,4,6),(22,'STGeorge',4,4,5),(23,'Bay',4,4,4),(24,'Yonge',4,4,3),(25,'Broadview',4,4,2),(26,'Kennedy',4,4,1),(27,'Sheppard',5,3,1),(28,'Bayview',5,3,2),(29,'Leslie',5,3,3),(30,'Don Mills',5,3,4),(31,'Sheppard',6,4,4),(32,'Bayview',6,4,3),(33,'Leslie',6,4,2),(34,'Don Mills',6,4,1),(35,'Kennedy',7,3,1),(36,'Ellesmere',7,3,2),(37,'Midland',7,3,3),(38,'McCowan',7,3,4),(39,'Kennedy',8,4,4),(40,'Ellesmere',8,4,3),(41,'Midland',8,4,2),(42,'McCowan',8,4,1);
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station_time`
--

DROP TABLE IF EXISTS `station_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station_time` (
  `station_id` int NOT NULL,
  `arrivaltime` time NOT NULL,
  PRIMARY KEY (`station_id`,`arrivaltime`),
  CONSTRAINT `station` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station_time`
--

LOCK TABLES `station_time` WRITE;
/*!40000 ALTER TABLE `station_time` DISABLE KEYS */;
INSERT INTO `station_time` VALUES (1,'08:45:00'),(1,'10:45:00'),(1,'14:45:00'),(2,'08:52:00'),(2,'10:52:00'),(2,'14:52:00'),(3,'08:57:00'),(3,'10:57:00'),(3,'14:57:00'),(4,'09:05:00'),(4,'11:05:00'),(4,'15:05:00'),(5,'09:25:00'),(5,'11:25:00'),(5,'15:25:00'),(6,'09:30:00'),(6,'11:30:00'),(6,'15:30:00'),(7,'08:10:00'),(7,'10:10:00'),(7,'14:10:00'),(8,'08:25:00'),(8,'10:25:00'),(8,'14:25:00'),(9,'08:45:00'),(9,'10:45:00'),(9,'14:45:00'),(10,'08:50:00'),(10,'10:50:00'),(10,'14:50:00'),(11,'08:55:00'),(11,'10:55:00'),(11,'14:55:00'),(12,'09:05:00'),(12,'11:05:00'),(12,'15:05:00'),(13,'08:46:00'),(13,'10:46:00'),(13,'14:46:00'),(14,'08:52:00'),(14,'10:52:00'),(14,'14:52:00'),(15,'08:57:00'),(15,'10:57:00'),(15,'14:57:00'),(16,'09:06:00'),(16,'11:06:00'),(16,'15:06:00'),(17,'09:26:00'),(17,'11:26:00'),(17,'15:26:00'),(18,'09:30:00'),(18,'11:30:00'),(18,'15:30:00'),(19,'08:10:00'),(19,'10:10:00'),(19,'14:10:00'),(20,'08:47:00'),(20,'10:47:00'),(20,'14:47:00'),(21,'08:52:00'),(21,'10:52:00'),(21,'14:52:00'),(22,'08:57:00'),(22,'10:57:00'),(22,'14:57:00'),(23,'09:07:00'),(23,'11:07:00'),(23,'15:07:00'),(24,'09:27:00'),(24,'11:27:00'),(24,'15:27:00'),(25,'09:30:01'),(25,'11:30:01'),(25,'15:30:01'),(26,'08:10:01'),(26,'10:10:01'),(26,'14:10:01'),(27,'08:47:00'),(27,'10:47:00'),(27,'14:47:00'),(28,'08:52:00'),(28,'10:52:00'),(28,'14:52:00'),(29,'08:57:00'),(29,'10:57:00'),(29,'14:57:00'),(30,'09:07:00'),(30,'11:07:00'),(30,'15:07:00'),(31,'08:48:00'),(31,'10:48:00'),(31,'14:48:00'),(32,'08:53:00'),(32,'10:53:00'),(32,'14:53:00'),(33,'08:58:00'),(33,'10:58:00'),(33,'14:58:00'),(34,'09:08:00'),(34,'11:08:00'),(34,'15:08:00'),(35,'08:48:00'),(35,'10:48:00'),(35,'14:48:00'),(36,'08:53:00'),(36,'10:53:00'),(36,'14:53:00'),(37,'08:58:00'),(37,'10:58:00'),(37,'14:58:00'),(38,'09:08:00'),(38,'11:08:00'),(38,'15:08:00'),(39,'08:49:00'),(39,'10:49:00'),(39,'14:49:00'),(40,'08:54:00'),(40,'10:54:00'),(40,'14:54:00'),(41,'08:59:00'),(41,'10:59:00'),(41,'14:59:00'),(42,'09:09:00'),(42,'11:09:00'),(42,'15:09:00');
/*!40000 ALTER TABLE `station_time` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-05 21:36:16
