CREATE DATABASE  IF NOT EXISTS `logfarm` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `logfarm`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: logfarm
-- ------------------------------------------------------
-- Server version	5.6.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `conf`
--

DROP TABLE IF EXISTS `conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conf` (
  `REFRESH_RATE` int(11) NOT NULL DEFAULT '60',
  `DESTINATION` varchar(128) NOT NULL,
  `DESTINATION_TYPE` varchar(45) NOT NULL,
  `SOURCE_DIR` varchar(128) NOT NULL,
  `COMPRESSION` int(1) NOT NULL DEFAULT '1',
  `FORMAT` varchar(45) NOT NULL DEFAULT 'gzip',
  `DEFAULT_RETENTION_DAYS` varchar(45) NOT NULL DEFAULT '2555',
  `TIME_DATE_STAMP_FMT` varchar(45) NOT NULL DEFAULT 'yyyy-mm-dd',
  `S3_URL` varchar(128) DEFAULT NULL,
  `S3_KEY` blob,
  `ATMOS_URL` varchar(128) DEFAULT NULL,
  `ATMOS_KEY` blob,
  `SSH_URL` varchar(128) DEFAULT NULL,
  `SSH_KEY` blob,
  `CIFS_URL` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf`
--

LOCK TABLES `conf` WRITE;
/*!40000 ALTER TABLE `conf` DISABLE KEYS */;
/*!40000 ALTER TABLE `conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `SCHEDULE_ID` int(11) NOT NULL,
  `TIME` varchar(45) NOT NULL,
  `JOB` varchar(45) NOT NULL,
  `TASK` varchar(45) NOT NULL,
  `COMMENT` varchar(45) NOT NULL,
  PRIMARY KEY (`SCHEDULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse` (
  `TRANSACTION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SOURCE_FILE_NAME` varchar(128) NOT NULL,
  `DESTINATION` varchar(128) NOT NULL,
  `TIME_DATE_STAMP` date NOT NULL DEFAULT '9999-12-31',
  `LOGFILE_UUID` varchar(128) NOT NULL,
  `DAYS_TO_LIVE` varchar(45) NOT NULL DEFAULT '2555',
  PRIMARY KEY (`TRANSACTION_ID`,`LOGFILE_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'logfarm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-06 15:05:56
