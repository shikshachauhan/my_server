-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: AS_Database
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pin` int(11) NOT NULL,
  `gcmid` varchar(255) DEFAULT NULL,
  `logged_in` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `gcmid` (`gcmid`),
  CONSTRAINT `fk_rails_378b9734e4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (23,555913,NULL,0,'2015-09-12 18:09:37','2015-09-12 12:39:37',23),(24,540238,NULL,0,'2015-09-12 18:11:27','2015-09-12 12:41:27',24),(25,333997,NULL,0,'2015-09-12 18:15:56','2015-09-12 12:45:56',25),(26,157485,NULL,0,'2015-09-12 18:16:55','2015-09-12 12:46:55',26),(27,363328,NULL,0,'2015-09-30 09:38:57','2015-09-30 04:08:57',27),(28,625175,NULL,0,'2015-10-24 17:12:10','2015-10-24 11:42:10',28),(29,578536,NULL,0,'2015-12-30 04:51:56','2015-12-29 23:21:56',29),(30,701010,NULL,0,'2015-12-30 04:56:16','2015-12-29 23:26:16',30),(31,721470,NULL,0,'2015-12-30 05:21:59','2015-12-29 23:51:59',31),(32,233654,NULL,0,'2015-12-30 05:32:25','2015-12-30 00:02:25',32),(33,802020,NULL,0,'2015-12-30 05:39:25','2015-12-30 00:09:25',33),(34,414890,NULL,0,'2015-12-30 05:41:36','2015-12-30 00:11:36',34),(35,883034,NULL,0,'2015-12-30 06:12:29','2015-12-30 00:42:29',35),(36,573788,NULL,0,'2015-12-30 06:33:49','2015-12-30 01:03:49',36),(37,239644,'APA91bGig_drtrWCI1NEoBD9MeoNvhNsiGbljWAuc6gFbpuJ5BNAA1BIVg1azYxOqnzklN0pUQwGXIw15td-AGANotWAOsH93tS0KRga98L_oIyCkljHhFA',1,'2015-12-30 12:11:58','2016-05-19 06:22:24',37),(41,982545,'APA91bHMTEYxYckLf5WhgzSbxZ8dG6KgXxtgUWXn05x_IwDHgIN41fXfURvr_cT7szUVpe6r6txUsfY95nD5T7HpItmLS0Aj1_RSsO2Wnt5uxMWA4Dm8h9Y',1,'2015-12-30 13:03:06','2016-05-19 12:02:02',41),(43,571653,NULL,0,'2016-01-05 12:01:40','2016-01-05 06:31:40',45),(44,356069,NULL,0,'2016-01-06 11:05:43','2016-01-06 05:35:43',46),(45,815150,NULL,0,'2016-01-06 11:25:32','2016-01-06 05:55:32',47),(46,767083,NULL,0,'2016-03-08 09:53:59','2016-03-08 04:23:59',49);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MemberId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Number` varchar(255) NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `Clist_ids` varchar(255) NOT NULL,
  `Resource_uri` varchar(255) NOT NULL,
  `Age` int(11) NOT NULL,
  `District` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  `Block` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `GVID` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,41,'Akki','1234567890','F','172','/vapp/api/v1/location_location/4/',23,'District','State','Block','Pending',1,'2016-05-28 00:00:00','2016-04-30 19:34:28');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts` (
  `DistrictId` int(2) NOT NULL AUTO_INCREMENT,
  `DistrictName` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  PRIMARY KEY (`DistrictId`),
  UNIQUE KEY `DistrictId` (`DistrictId`),
  UNIQUE KEY `DistrictName` (`DistrictName`),
  KEY `DistrictId_2` (`DistrictId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'khurja','up');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CheckOnInsertDistrictInfo` BEFORE INSERT ON `districts`
 FOR EACH ROW begin
    declare msg varchar(255);
    if CHAR_LENGTH(new.DistrictName) > 20 then
		set msg = concat('MyTriggerError: Trying to insert an inappropriate value in table RecInfo ');
        signal sqlstate '45000' set message_text = msg;
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CheckOnUpdateDistrictInfo` BEFORE UPDATE ON `districts`
 FOR EACH ROW begin
    declare msg varchar(255);
    if CHAR_LENGTH(new.DistrictName) > 20 then
		set msg = concat('MyTriggerError: Trying to insert an inappropriate value in table RecInfo ');
        signal sqlstate '45000' set message_text = msg;
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MemberId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `GVID` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `MemberId` int(2) NOT NULL,
  `TextId` int(10) NOT NULL AUTO_INCREMENT,
  `Template_id` int(11) NOT NULL,
  `Message_params` text NOT NULL,
  `Contacts` text,
  `Groups` text,
  `Status` varchar(10) NOT NULL,
  `GVID` int(10) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TextId`),
  UNIQUE KEY `TextId` (`TextId`),
  UNIQUE KEY `GVID` (`GVID`),
  KEY `MemberId` (`MemberId`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (41,1,24,'{\"club\": \"Hello all\", \"date\": \"15.07.2015\", \"callback_calls\": 20 , \"club_contribs\": 40}',NULL,NULL,'Completed',NULL,'0000-00-00 00:00:00','2016-04-21 07:07:18'),(41,2,24,'{\"club\": \"Hello all\", \"date\": \"15.07.2015\", \"callback_calls\": 20 , \"club_contribs\": 40}',NULL,NULL,'Completed',NULL,'0000-00-00 00:00:00','2016-04-21 07:07:29'),(41,3,24,'{\"club\": \"Hello all\", \"date\": \"15.07.2015\", \"callback_calls\": 20 , \"club_contribs\": 40}',NULL,NULL,'Completed',NULL,'0000-00-00 00:00:00','2016-04-21 07:07:32'),(41,4,24,'{\"club\": \"Hello all\", \"date\": \"15.07.2015\", \"callback_calls\": 20 , \"club_contribs\": 40}',NULL,NULL,'Completed',NULL,'0000-00-00 00:00:00','2016-04-21 07:07:22'),(41,5,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'0000-00-00 00:00:00','2016-04-21 07:07:38'),(41,6,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'0000-00-00 00:00:00','2016-04-21 07:07:26'),(41,7,24,'{\"club\": \"Hello all\", \"date\": \"15.07.2015\", \"callback_calls\": 20 , \"club_contribs\": 40}',NULL,NULL,'Completed',NULL,'0000-00-00 00:00:00','2016-04-21 07:07:41'),(41,8,24,'{\"club\": \"Hello all\", \"date\": \"15.07.2015\", \"callback_calls\": 20 , \"club_contribs\": 40}',NULL,NULL,'Completed',NULL,'0000-00-00 00:00:00','2016-04-21 07:07:44'),(41,9,24,'{\"club\": \"Hello all\", \"date\": \"15.07.2015\", \"callback_calls\": 20 , \"club_contribs\": 40}',NULL,NULL,'Completed',NULL,'2016-04-30 11:01:41','2016-04-30 05:31:41'),(41,10,24,'{\"club\": \"Hello all\", \"date\": \"15.07.2015\", \"callback_calls\": 20 , \"club_contribs\": 40}',NULL,NULL,'Completed',NULL,'2016-04-30 11:08:46','2016-04-30 05:38:46'),(41,11,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-02 07:25:44','2016-05-02 01:55:44'),(41,12,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-02 08:58:47','2016-05-02 03:28:47'),(41,13,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-02 09:25:11','2016-05-02 03:55:11'),(41,14,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-02 10:01:42','2016-05-02 04:31:42'),(41,15,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-02 10:03:09','2016-05-02 04:33:09'),(41,16,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-02 10:10:07','2016-05-02 04:40:07'),(41,17,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-02 11:33:56','2016-05-02 06:03:56'),(41,18,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-02 11:55:29','2016-05-02 06:25:29'),(41,19,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-02 12:57:30','2016-05-02 07:27:30'),(41,20,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-02 12:59:32','2016-05-02 07:29:32'),(41,21,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-02 13:00:24','2016-05-02 07:30:24'),(41,22,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-02 13:00:41','2016-05-02 07:30:41'),(41,23,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-02 13:02:31','2016-05-02 07:32:31'),(41,24,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-02 13:04:10','2016-05-02 07:34:10'),(41,25,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-03 08:30:09','2016-05-03 03:00:09'),(41,26,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-03 08:32:41','2016-05-03 03:02:41'),(41,27,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-03 09:59:11','2016-05-03 04:29:11'),(41,28,24,'{\"club\":\"Hello all\",\"date\":\"15.07.2015\",\"callback_calls\":20,\"club_contribs\":40}',NULL,NULL,'Completed',NULL,'2016-05-03 09:59:17','2016-05-03 04:29:17'),(41,29,40,'{\"survey_date\":\"12 \\/ 5 \\/ 2016\"}','+918860271189','','Completed',NULL,'2016-05-11 10:19:00','2016-05-11 04:49:00'),(41,30,40,'{\"survey_date\":\"12 \\/ 5 \\/ 2016\"}','','229','Completed',NULL,'2016-05-11 10:19:06','2016-05-11 04:49:06'),(41,31,40,'{\"survey_date\":\"10 \\/ 5 \\/ 2016\"}','+918860271189','','Completed',NULL,'2016-05-11 10:24:44','2016-05-11 04:54:44'),(41,32,40,'{\"survey_date\":\"10 \\/ 5 \\/ 2016\"}','','229','Completed',NULL,'2016-05-11 10:24:49','2016-05-11 04:54:49'),(41,33,40,'{\"survey_date\":\"27 \\/ 5 \\/ 2016\"}','097 66 946418','','Completed',NULL,'2016-05-12 14:52:13','2016-05-12 09:22:13'),(41,34,40,'{\"survey_date\":\"27 \\/ 5 \\/ 2016\"}','','233','Completed',NULL,'2016-05-12 14:52:52','2016-05-12 09:22:52'),(41,35,40,'{\"survey_date\":\"27 \\/ 5 \\/ 2016\"}','','229,227','Completed',NULL,'2016-05-12 14:53:37','2016-05-12 09:23:37'),(41,36,40,'{\"survey_date\":\"27 \\/ 5 \\/ 2016\"}','','','Rejected',NULL,'2016-05-12 14:54:28','2016-05-12 09:24:28'),(41,37,40,'{\"survey_date\":\"27 \\/ 5 \\/ 2016\"}','','','Rejected',NULL,'2016-05-12 14:54:29','2016-05-12 09:24:29'),(41,38,41,'{\"camp_name\":\"Government Campaign\",\"start_date\":\"12-5-2016 \",\"end_date\":\"28-5-2016 \",\"location\":\"Chennai\"}','09971820556','','Completed',NULL,'2016-05-12 14:56:53','2016-05-12 09:26:53'),(41,39,41,'{\"camp_name\":\"Government Campaign\",\"start_date\":\"12-5-2016 \",\"end_date\":\"28-5-2016 \",\"location\":\"Chennai\"}','','','Rejected',NULL,'2016-05-12 14:57:15','2016-05-12 09:27:15'),(41,40,41,'{\"camp_name\":\"Government Campaign\",\"start_date\":\"12-5-2016 \",\"end_date\":\"28-5-2016 \",\"location\":\"Chennai\"}','','','Rejected',NULL,'2016-05-12 14:57:16','2016-05-12 09:27:16'),(41,41,40,'{\"survey_date\":\"28 \\/ 5 \\/ 2016\"}','','','Rejected',NULL,'2016-05-14 08:20:33','2016-05-14 02:50:33'),(41,42,40,'{\"survey_date\":\"28 \\/ 5 \\/ 2016\"}','','','Rejected',NULL,'2016-05-14 08:20:33','2016-05-14 02:50:33'),(41,43,40,'{\"survey_date\":\"27 \\/ 5 \\/ 2016\"}','','','Rejected',NULL,'2016-05-14 10:00:15','2016-05-14 04:30:15'),(41,44,40,'{\"survey_date\":\"27 \\/ 5 \\/ 2016\"}','','','Rejected',NULL,'2016-05-14 10:00:16','2016-05-14 04:30:16'),(41,45,40,'{\"survey_date\":\"27 \\/ 5 \\/ 2016\"}','','','Completed',NULL,'2016-05-14 10:08:03','2016-05-14 04:38:03'),(41,46,40,'{\"survey_date\":\"13 \\/ 5 \\/ 2016\"}','011 2530 2728','','Completed',NULL,'2016-05-14 10:17:53','2016-05-14 04:47:53'),(37,47,40,'{\"survey_date\":\"17 \\/ 5 \\/ 2016\"}','+919999605582','','Completed',NULL,'2016-05-17 18:31:44','2016-05-17 13:01:44'),(37,48,40,'{\"survey_date\":\"1 \\/ 1 \\/ 2016\"}','','','Completed',NULL,'2016-05-17 18:32:54','2016-05-17 13:02:54'),(37,49,40,'{\"survey_date\":\"23 \\/ 5 \\/ 2016\"}','','227,232','Completed',NULL,'2016-05-18 05:54:16','2016-05-18 00:24:16'),(37,50,40,'{\"survey_date\":\"23 \\/ 5 \\/ 2016\"}','','232,231','Completed',NULL,'2016-05-18 06:08:30','2016-05-18 00:38:30'),(41,51,40,'{\"survey_date\":\"20 \\/ 5 \\/ 2016\"}','09891887854','','Completed',NULL,'2016-05-18 06:45:16','2016-05-18 01:15:16'),(41,52,40,'{\"survey_date\":\"20 \\/ 5 \\/ 2016\"}','09891887854','','Completed',NULL,'2016-05-18 06:45:19','2016-05-18 01:15:19'),(41,53,40,'{\"survey_date\":\"20 \\/ 5 \\/ 2016\"}','09891887854','','Completed',NULL,'2016-05-18 06:45:19','2016-05-18 01:15:19'),(41,54,40,'{\"survey_date\":\"20 \\/ 5 \\/ 2016\"}','','229','Completed',NULL,'2016-05-18 06:45:27','2016-05-18 01:15:27'),(41,55,40,'{\"survey_date\":\"12 \\/ 5 \\/ 2016\"}','','229','Completed',NULL,'2016-05-18 06:56:49','2016-05-18 01:26:49'),(41,56,40,'{\"survey_date\":\"12 \\/ 5 \\/ 2016\"}','','229','Completed',NULL,'2016-05-18 06:56:50','2016-05-18 01:26:50'),(41,57,40,'{\"survey_date\":\"12 \\/ 5 \\/ 2016\"}','09891887854','','Completed',NULL,'2016-05-18 06:56:57','2016-05-18 01:26:57'),(41,58,40,'{\"survey_date\":\"12 \\/ 5 \\/ 2016\"}','09891887854','','Completed',NULL,'2016-05-18 06:57:04','2016-05-18 01:27:04'),(41,59,40,'{\"survey_date\":\"12 \\/ 5 \\/ 2016\"}','09891887854','','Completed',NULL,'2016-05-18 06:57:28','2016-05-18 01:27:28'),(41,60,40,'{\"survey_date\":\"12 \\/ 5 \\/ 2016\"}','09891887854','','Completed',NULL,'2016-05-18 06:57:36','2016-05-18 01:27:36'),(37,61,40,'{\"survey_date\":\"24 \\/ 5 \\/ 2016\"}','','227,232','Completed',NULL,'2016-05-19 11:54:15','2016-05-19 06:24:15'),(37,62,40,'{\"survey_date\":\"24 \\/ 5 \\/ 2016\"}','','227,232','Completed',NULL,'2016-05-19 11:54:17','2016-05-19 06:24:17'),(37,63,40,'{\"survey_date\":\"24 \\/ 5 \\/ 2016\"}','','227,232','Completed',NULL,'2016-05-19 11:54:19','2016-05-19 06:24:19'),(37,64,40,'{\"survey_date\":\"23 \\/ 5 \\/ 2016\"}','','227,232','Completed',NULL,'2016-05-19 11:55:25','2016-05-19 06:25:25'),(37,65,40,'{\"survey_date\":\"24 \\/ 5 \\/ 2016\"}','','','Completed',NULL,'2016-05-19 12:00:17','2016-05-19 06:30:17'),(37,66,40,'{\"survey_date\":\"24 \\/ 5 \\/ 2016\"}','','','Completed',NULL,'2016-05-19 12:00:19','2016-05-19 06:30:19'),(37,67,40,'{\"survey_date\":\"24 \\/ 5 \\/ 2016\"}','','227,232','Completed',NULL,'2016-05-19 12:02:26','2016-05-19 06:32:26'),(41,68,40,'{\"survey_date\":\"19 \\/ 5 \\/ 2016\"}','','229','Completed',NULL,'2016-05-19 13:08:17','2016-05-19 07:38:17'),(41,69,40,'{\"survey_date\":\"19 \\/ 5 \\/ 2016\"}','','229','Completed',NULL,'2016-05-19 13:08:19','2016-05-19 07:38:19');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ngo_users`
--

DROP TABLE IF EXISTS `ngo_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ngo_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ngoname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authenticated` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ngo_users`
--

LOCK TABLES `ngo_users` WRITE;
/*!40000 ALTER TABLE `ngo_users` DISABLE KEYS */;
INSERT INTO `ngo_users` VALUES (5,'preeti','preeti','1234567',NULL,23,8826533273,'delhi3','abc.com','preetirani07@gmail.com','education',1,'2015-07-28 08:48:30','2016-04-19 18:55:01'),(6,'pree','pree','1234567',NULL,23,4545454545,'delhi','abo.com','preeti07@gmail.com','education',0,'2015-07-28 08:50:32','2015-07-28 03:20:32'),(7,'sc','cscs','dvdvsc',NULL,0,3453453454,'dcscs','dsvsv','dv@gmail.com','dvvd',0,'2015-08-04 01:30:33','2015-08-03 20:00:33'),(8,'fvd','fdv','grgrgrgr',NULL,34,1231231231,'gre','erg','rg@f.com','gr',0,'2015-08-11 11:17:46','2015-08-11 05:47:46'),(9,'hheh','rthh','hthgegrr',NULL,0,1232343451,'hht','thrhtr','thrt@g.b','thht',0,'2015-08-11 11:25:03','2015-08-11 05:55:03'),(10,'hhehd','rthhd','hthgegrr',NULL,0,1232343403,'hht','thrhtr3','thrt3@g.b','thht',0,'2015-08-11 11:26:20','2015-08-11 05:56:20'),(11,'wer','wer','1234567',NULL,23,2323232323,'sd','sd','sd@n.m','ww',0,'2015-08-17 09:18:06','2015-08-17 03:48:06'),(13,'Rani','rani','1234567',NULL,23,2323232303,'gre','as','mcs142131@iitd.ac.in','ww',0,'2015-08-17 09:23:15','2015-08-17 03:53:15'),(14,'sucheta','su','abcabc',NULL,34,9889988998,'delhi','abc','abc@abc.com','abc',0,'2015-10-24 17:10:52','2015-10-24 11:40:52');
/*!40000 ALTER TABLE `ngo_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordings`
--

DROP TABLE IF EXISTS `recordings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recordings` (
  `MemberId` int(2) NOT NULL,
  `RecId` int(10) NOT NULL AUTO_INCREMENT,
  `RecFileName` varchar(50) NOT NULL,
  `Contacts` text,
  `Groups` text,
  `Status` varchar(20) NOT NULL,
  `GVID` int(10) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`RecId`),
  UNIQUE KEY `RecId` (`RecId`),
  KEY `MemberId` (`MemberId`),
  KEY `MemberId_2` (`MemberId`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordings`
--

LOCK TABLES `recordings` WRITE;
/*!40000 ALTER TABLE `recordings` DISABLE KEYS */;
INSERT INTO `recordings` VALUES (1,7,'hello.mp3',NULL,NULL,'CreatePending',NULL,'0000-00-00 00:00:00','2015-06-01 16:21:27'),(19,10,'s1.mp3',NULL,NULL,'Pending',503997,'0000-00-00 00:00:00','2015-09-12 11:35:45'),(19,11,'s2.mp3',NULL,NULL,'Pending',503997,'0000-00-00 00:00:00','2015-09-12 12:09:33'),(41,123,'abc.mp3',NULL,NULL,'Created',122,'0000-00-00 00:00:00','2016-04-04 19:14:27'),(41,124,'gulaabo.mp3',NULL,NULL,'Created',122,'0000-00-00 00:00:00','2016-04-04 19:16:20'),(41,125,'s1.mp3',NULL,NULL,'Created',122,'0000-00-00 00:00:00','2016-04-04 19:17:28'),(41,126,'s2.mp3',NULL,NULL,'Created',122,'0000-00-00 00:00:00','2016-04-04 19:19:40'),(41,128,'s3.mp3',NULL,NULL,'Created',122,'0000-00-00 00:00:00','2016-04-04 19:52:42'),(41,129,'s4.mp3',NULL,NULL,'Created',122,'0000-00-00 00:00:00','2016-04-04 19:53:25'),(41,130,'s6.mp3',NULL,NULL,'Created',122,'0000-00-00 00:00:00','2016-04-05 07:04:14'),(41,131,'s1.mp3',NULL,NULL,'Created',122,'0000-00-00 00:00:00','2016-04-05 07:36:13'),(41,132,'s7.mp3',NULL,NULL,'Created',122,'0000-00-00 00:00:00','2016-04-05 08:06:57'),(41,133,'s8.mp3',NULL,NULL,'Created',122,'0000-00-00 00:00:00','2016-04-05 08:09:08'),(41,134,'s9.mp3',NULL,NULL,'Created',122,'0000-00-00 00:00:00','2016-04-05 08:09:56'),(41,135,'yaar mod do.mp3',NULL,NULL,'Created',122,'0000-00-00 00:00:00','2016-04-05 09:45:35'),(41,136,'yaar mod do.mp3',NULL,NULL,'Created',122,'0000-00-00 00:00:00','2016-04-05 09:52:42'),(41,137,'audio.mp3',NULL,NULL,'Created',122,'0000-00-00 00:00:00','2016-04-05 10:15:02'),(41,138,'audio.mp3',NULL,NULL,'Created',122,'0000-00-00 00:00:00','2016-04-05 10:33:17'),(41,139,'audio.mp3',NULL,NULL,'Created',122,'0000-00-00 00:00:00','2016-04-05 10:47:50'),(41,140,'audio.mp3',NULL,NULL,'Created',122,'0000-00-00 00:00:00','2016-04-18 09:28:03'),(41,141,'s6.mp3',NULL,NULL,'Completed',129,'2016-05-02 10:00:23','2016-05-02 04:30:23'),(41,142,'s6.mp3',NULL,NULL,'Completed',129,'2016-05-02 10:02:55','2016-05-02 04:32:55'),(41,143,'s5.mp3',NULL,NULL,'Completed',129,'2016-05-02 10:06:21','2016-05-02 04:36:21'),(41,144,'s5.mp3',NULL,NULL,'Completed',129,'2016-05-02 10:06:56','2016-05-02 04:36:56'),(41,145,'s5.mp3',NULL,NULL,'Completed',129,'2016-05-02 10:08:02','2016-05-02 04:38:02'),(41,146,'s5.mp3',NULL,NULL,'Completed',129,'2016-05-02 10:08:39','2016-05-02 04:38:39'),(41,147,'s6',NULL,NULL,'Completed',129,'2016-05-03 10:06:59','2016-05-03 04:36:59'),(41,148,'s6',NULL,NULL,'Completed',129,'2016-05-03 10:10:29','2016-05-03 04:40:29'),(41,149,'s6',NULL,NULL,'Completed',129,'2016-05-03 10:14:32','2016-05-03 04:44:32'),(41,150,'s6',NULL,NULL,'Completed',129,'2016-05-03 10:21:11','2016-05-03 04:51:11'),(41,151,'standard.mp3',NULL,NULL,'Completed',129,'2016-05-03 10:21:53','2016-05-03 04:51:53'),(41,152,'s1.mp3',NULL,NULL,'Completed',129,'2016-05-03 10:25:32','2016-05-03 04:55:32'),(41,153,'s2.mp3',NULL,NULL,'Completed',129,'2016-05-03 10:50:48','2016-05-03 05:20:48'),(41,154,'s3.mp3',NULL,NULL,'Completed',129,'2016-05-03 10:53:42','2016-05-03 05:23:42');
/*!40000 ALTER TABLE `recordings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rpush_apps`
--

DROP TABLE IF EXISTS `rpush_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpush_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `certificate` text,
  `password` varchar(255) DEFAULT NULL,
  `connections` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `auth_key` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `access_token_expiration` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rpush_apps`
--

LOCK TABLES `rpush_apps` WRITE;
/*!40000 ALTER TABLE `rpush_apps` DISABLE KEYS */;
INSERT INTO `rpush_apps` VALUES (3,'GCMFinal',NULL,NULL,NULL,1,'2015-12-30 04:08:27','2015-12-30 04:08:27','Rpush::Client::ActiveRecord::Gcm::App','AIzaSyA3tW0YJM_rvddPQQhfCc-mN3sKZInKITI',NULL,NULL,NULL,NULL),(4,'Sample1',NULL,NULL,NULL,1,'2016-02-29 05:31:42','2016-02-29 05:31:42','Rpush::Client::ActiveRecord::Gcm::App','AIzaSyA3tW0YJM_rvddPQQhfCc-mN3sKZInKITI',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rpush_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rpush_feedback`
--

DROP TABLE IF EXISTS `rpush_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpush_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_token` varchar(64) NOT NULL,
  `failed_at` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `app_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rpush_feedback_on_device_token` (`device_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rpush_feedback`
--

LOCK TABLES `rpush_feedback` WRITE;
/*!40000 ALTER TABLE `rpush_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `rpush_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rpush_notifications`
--

DROP TABLE IF EXISTS `rpush_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpush_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badge` int(11) DEFAULT NULL,
  `device_token` varchar(64) DEFAULT NULL,
  `sound` varchar(255) DEFAULT 'default',
  `alert` varchar(255) DEFAULT NULL,
  `data` text,
  `expiry` int(11) DEFAULT '86400',
  `delivered` tinyint(1) NOT NULL DEFAULT '0',
  `delivered_at` datetime DEFAULT NULL,
  `failed` tinyint(1) NOT NULL DEFAULT '0',
  `failed_at` datetime DEFAULT NULL,
  `error_code` int(11) DEFAULT NULL,
  `error_description` text,
  `deliver_after` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `alert_is_json` tinyint(1) DEFAULT '0',
  `type` varchar(255) NOT NULL,
  `collapse_key` varchar(255) DEFAULT NULL,
  `delay_while_idle` tinyint(1) NOT NULL DEFAULT '0',
  `registration_ids` mediumtext,
  `app_id` int(11) NOT NULL,
  `retries` int(11) DEFAULT '0',
  `uri` varchar(255) DEFAULT NULL,
  `fail_after` datetime DEFAULT NULL,
  `processing` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int(11) DEFAULT NULL,
  `url_args` text,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rapns_notifications_multi` (`app_id`,`delivered`,`failed`,`deliver_after`),
  KEY `index_rpush_notifications_multi` (`delivered`,`failed`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rpush_notifications`
--

LOCK TABLES `rpush_notifications` WRITE;
/*!40000 ALTER TABLE `rpush_notifications` DISABLE KEYS */;
INSERT INTO `rpush_notifications` VALUES (1,NULL,NULL,'default',NULL,'{\"message\":\"456surbhi\"}',86400,0,NULL,1,'2015-12-20 11:44:01',NULL,'Unable to deliver notification 1, received error (Failed to deliver to all recipients. Errors: InvalidRegistration.)',NULL,'2015-12-19 19:52:45','2015-12-19 19:52:45',0,'Rpush::Client::ActiveRecord::Gcm::Notification',NULL,0,'---\n- APA91bF6cmpo8PA5UhJbmJagKJgHbga_UWVyVk4SCjU6ckJRVXfGtGFGyQzh-IQ536MCAnhdhpShd7-EEOlymbc9M1L9OrGVkfovS7ZuDKHPLNTz9DnuPWLZuWisPf0-KXdbfnQ_MkRw\n',1,0,NULL,NULL,0,NULL,NULL,NULL),(2,NULL,NULL,'default',NULL,'{\"message\":\"hi surbhi! preeti here\"}',86400,0,NULL,1,'2015-12-29 13:15:01',401,'Unable to deliver notification 2, received error 401 (Unauthorized, check your App auth_key.)',NULL,'2015-12-29 13:13:00','2015-12-29 13:13:00',0,'Rpush::Client::ActiveRecord::Gcm::Notification',NULL,0,'---\n- APA91bF6cmpo8PA5UhJbmJagKJgHbga_UWVyVk4SCjU6ckJRVXfGtGFGyQzh-IQ536MCAnhdhpShd7-EEOlymbc9M1L9OrGVkfovS7ZuDKHPLNTz9DnuPWLZuWisPf0-KXdbfnQ_MkRw\n',2,0,NULL,NULL,0,NULL,NULL,NULL),(3,NULL,NULL,'default',NULL,'{\"message\":\"hi mom!\"}',86400,1,'2015-12-30 04:10:55',0,NULL,NULL,NULL,NULL,'2015-12-30 04:09:54','2015-12-30 04:09:54',0,'Rpush::Client::ActiveRecord::Gcm::Notification',NULL,0,'---\n- APA91bHxc1rZ1D49lcTL41YVktuDhSoO9aJCQpAZIMF2szo3irH4ln1g03CwTvLhh0uEQLWiGNwpk4e1jn7K-qvZQOf5tisFlFjJzG1p67JKoSEIA4rY-f2Jmsfbx07DbAOmbQCvOwi2\n',3,0,NULL,NULL,0,NULL,NULL,NULL),(4,NULL,NULL,'default',NULL,'{\"message\":\"hi mom!\"}',86400,0,NULL,0,NULL,NULL,NULL,NULL,'2016-02-29 05:34:49','2016-02-29 05:34:49',0,'Rpush::Client::ActiveRecord::Gcm::Notification',NULL,0,'---\n- APA91bGvXgEfg64RKT8YsP7I9f4MUAqQN3G2v2Dv_H3F0cfG8xhh4ZZ-kaU9H5jh_Dqf1RsGfLnRfmS-ObfAXP2CAbBp0pRAddfN5tPqPO2N7UUCXKUgs_smndDJhlB8SVbYq3VFDK3h\n',4,0,NULL,NULL,0,0,NULL,NULL);
/*!40000 ALTER TABLE `rpush_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150718102409'),('20150718110224'),('20150718110759'),('20150718112201'),('20150718112325'),('20150718112459'),('20150718114823'),('20150719071327'),('20150724125344'),('20150727185802'),('20150727191019'),('20150727192155'),('20150804062502'),('20150804062552'),('20150817091616'),('20150908132329'),('20150908135102'),('20150908135453'),('20150912165405'),('20150912165811'),('20150912171534'),('20151219194152'),('20151219194153'),('20151219194154'),('20160102182733'),('20160430185633'),('20160430194506');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveys`
--

DROP TABLE IF EXISTS `surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveys` (
  `MemberId` int(2) NOT NULL,
  `SurveyId` int(10) NOT NULL AUTO_INCREMENT,
  `SurveyName` varchar(50) NOT NULL,
  `Contacts` text,
  `Groups` text,
  `Status` varchar(10) NOT NULL,
  `GVID` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`SurveyId`),
  UNIQUE KEY `GVID` (`GVID`),
  UNIQUE KEY `SurveyId` (`SurveyId`),
  KEY `MemberId` (`MemberId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveys`
--

LOCK TABLES `surveys` WRITE;
/*!40000 ALTER TABLE `surveys` DISABLE KEYS */;
INSERT INTO `surveys` VALUES (41,1,'S1',NULL,NULL,'Completed',129,'2016-05-03 11:39:59','2016-05-03 06:09:59');
/*!40000 ALTER TABLE `surveys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `TaskId` int(10) NOT NULL AUTO_INCREMENT,
  `ItemId` int(10) NOT NULL,
  `TaskName` varchar(50) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `MemberId` int(11) NOT NULL,
  `GVID` int(11) DEFAULT NULL,
  `Type` text NOT NULL,
  `Contacts` text,
  `Groups` text,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TaskId`),
  UNIQUE KEY `TaskId` (`TaskId`),
  KEY `ItemId` (`ItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (14,11,'Launch','Completed','2016-03-10 23:04:02',23,NULL,'message','8826533273',NULL,'2016-04-30 04:52:44'),(15,11,'Launch','Completed','2016-03-11 01:26:04',23,NULL,'Message','8826533273',NULL,'2016-04-30 04:52:44'),(16,11,'Launch','Completed','2016-03-11 01:30:23',23,NULL,'Message','8826533273,9718658816',NULL,'2016-04-30 04:52:44'),(17,1,'LaunchMessage','Completed','2016-03-19 12:10:57',41,NULL,'Message','9718658816,9891127941',NULL,'2016-04-30 10:35:38'),(18,2,'LaunchMessage','Completed','2016-03-19 12:13:48',41,NULL,'Message','9718658816,9891127941',NULL,'2016-04-30 10:35:46'),(19,3,'LaunchMessage','Completed','2016-03-19 12:22:44',41,NULL,'Message','9718658816,9891127941',NULL,'2016-04-30 10:35:53'),(23,123,'CreateRecording','Completed','2016-04-05 00:44:27',41,NULL,'Recording','8826533273,9718658816',NULL,'2016-04-30 04:52:44'),(44,130,'CreateRecording','Completed','2016-04-05 12:34:14',41,NULL,'Recording','8826533273,9718658816',NULL,'2016-04-30 04:52:44'),(65,136,'CreateRecording','Completed','2016-04-05 15:22:42',41,122,'Recording','9718658816,8826533273',NULL,'2016-04-30 04:52:44'),(67,137,'CreateRecording','Completed','2016-04-05 15:45:03',41,122,'Recording','9718658816,8826533273',NULL,'2016-04-30 04:52:44'),(68,138,'CreateRecording','Completed','2016-04-05 16:03:17',41,122,'Recording','9718658816,8826533273',NULL,'2016-04-30 04:52:44'),(69,138,'DialoutRecording','Completed','2016-04-05 16:03:17',41,122,'Recording','9718658816,8826533273',NULL,'2016-04-30 04:52:44'),(70,7,'LaunchMessage','Completed','2016-04-05 16:16:39',41,NULL,'Message','9718658816,9891127941',NULL,'2016-04-30 10:35:58'),(71,139,'CreateRecording','Completed','2016-04-05 16:17:50',41,122,'Recording','9718658816,8826533273',NULL,'2016-04-30 04:52:44'),(72,139,'DialoutRecording','Completed','2016-04-05 16:17:50',41,122,'Recording','9718658816,8826533273',NULL,'2016-04-30 04:52:44'),(74,140,'CreateRecording','Completed','2016-04-18 14:58:03',41,122,'Recording','9718658816,8826533273',NULL,'2016-04-30 04:52:44'),(76,54,'CreateContact','Completed','2016-04-22 11:33:58',41,NULL,'Contact','1212121212',NULL,'2016-04-22 06:03:58'),(77,55,'CreateContact','Completed','2016-04-22 11:35:13',41,NULL,'Contact','1212121212',NULL,'2016-04-22 06:05:13'),(78,9,'LaunchMessage','Completed','2016-04-30 11:01:42',41,NULL,'Message','9718658816,9891127941',NULL,'2016-04-30 05:31:42'),(79,10,'LaunchMessage','Completed','2016-04-30 11:08:46',41,NULL,'Message','9718658816,9891127941',NULL,'2016-04-30 05:38:46'),(80,0,'CreateContact','Rejected','2016-04-30 18:07:38',41,NULL,'Contact','1212121212',NULL,'2016-04-30 12:37:38'),(81,56,'CreateContact','Completed','2016-04-30 18:08:07',41,NULL,'Contact','1212121212',NULL,'2016-04-30 12:38:07'),(82,1,'CreateContact','Pending','2016-05-27 00:00:00',41,NULL,'Contact',NULL,NULL,'2016-04-30 18:43:40'),(83,100,'CreateContactList','Completed','2016-05-02 06:41:22',41,NULL,'ContactList','','Farmers','2016-05-02 01:11:22'),(84,100,'CreateContactList','Completed','2016-05-02 06:43:26',41,NULL,'ContactList','','Farmers','2016-05-02 01:13:26'),(85,100,'CreateContactList','Completed','2016-05-02 06:43:42',41,NULL,'ContactList','','Delhi','2016-05-02 01:13:42'),(86,0,'CreateContact','Rejected','2016-05-02 06:45:53',41,NULL,'Contact','9718658816','','2016-05-02 01:15:53'),(87,0,'CreateContact','Rejected','2016-05-02 06:45:53',41,NULL,'Contact','9718658816','','2016-05-02 01:15:53'),(88,100,'CreateContactList','Completed','2016-05-02 07:16:22',41,NULL,'ContactList','','women','2016-05-02 01:46:22'),(89,0,'CreateContact','Rejected','2016-05-02 07:21:58',41,NULL,'Contact','9876543210','','2016-05-02 01:51:58'),(90,0,'CreateContact','Rejected','2016-05-02 07:21:59',41,NULL,'Contact','9876543210','','2016-05-02 01:51:59'),(91,11,'LaunchMessage','Completed','2016-05-02 07:25:44',41,NULL,'Message','9990417465,+91 99100 12946','','2016-05-02 01:55:44'),(92,57,'CreateContact','Completed','2016-05-02 08:40:15',41,NULL,'Contact','9718658816','','2016-05-02 03:10:15'),(93,58,'CreateContact','Completed','2016-05-02 08:40:58',41,NULL,'Contact','9718658816','','2016-05-02 03:10:58'),(94,59,'CreateContact','Completed','2016-05-02 08:49:42',41,NULL,'Contact','9718658816','','2016-05-02 03:19:42'),(95,12,'LaunchMessage','Completed','2016-05-02 08:58:47',41,NULL,'Message','011 2530 2728,9990417465','','2016-05-02 03:28:47'),(96,13,'LaunchMessage','Completed','2016-05-02 09:25:11',41,NULL,'Message','011 2530 2728,9990417465','','2016-05-02 03:55:11'),(97,141,'LaunchRecording','Completed','2016-05-02 10:00:23',41,129,'Recording','8826533273,9887766554',NULL,'2016-05-02 04:30:23'),(98,14,'LaunchMessage','Completed','2016-05-02 10:01:42',41,NULL,'Message','9990417465','','2016-05-02 04:31:42'),(99,142,'LaunchRecording','Completed','2016-05-02 10:02:55',41,129,'Recording','8826533273,9887766554',NULL,'2016-05-02 04:32:55'),(100,15,'LaunchMessage','Completed','2016-05-02 10:03:09',41,NULL,'Message','9990417465','','2016-05-02 04:33:09'),(101,143,'LaunchRecording','Completed','2016-05-02 10:06:21',41,129,'Recording','8826533273,9887766554',NULL,'2016-05-02 04:36:21'),(102,144,'LaunchRecording','Completed','2016-05-02 10:06:56',41,129,'Recording','8826533273,9887766554',NULL,'2016-05-02 04:36:56'),(103,145,'LaunchRecording','Completed','2016-05-02 10:08:02',41,129,'Recording','8826533273,9887766554',NULL,'2016-05-02 04:38:02'),(104,146,'LaunchRecording','Completed','2016-05-02 10:08:39',41,129,'Recording','8826533273,9887766554',NULL,'2016-05-02 04:38:39'),(105,16,'LaunchMessage','Completed','2016-05-02 10:10:07',41,NULL,'Message','9990417465,9990417465','','2016-05-02 04:40:07'),(106,17,'LaunchMessage','Completed','2016-05-02 11:33:57',41,NULL,'Message','9990417465,9990417465','','2016-05-02 06:03:57'),(107,18,'LaunchMessage','Completed','2016-05-02 11:55:30',41,NULL,'Message','09971820556','','2016-05-02 06:25:30'),(108,100,'CreateContactList','Completed','2016-05-02 12:43:38',41,NULL,'ContactList','','Children','2016-05-02 07:13:38'),(109,60,'CreateContact','Completed','2016-05-02 12:44:34',41,NULL,'Contact','9718688816','','2016-05-02 07:14:34'),(110,19,'LaunchMessage','Completed','2016-05-02 12:57:30',41,NULL,'Message','+919210075376','','2016-05-02 07:27:30'),(111,20,'LaunchMessage','Completed','2016-05-02 12:59:33',41,NULL,'Message','9990417465','','2016-05-02 07:29:33'),(112,21,'LaunchMessage','Completed','2016-05-02 13:00:24',41,NULL,'Message','9990417465','','2016-05-02 07:30:24'),(113,22,'LaunchMessage','Completed','2016-05-02 13:00:41',41,NULL,'Message','9990417465','','2016-05-02 07:30:41'),(114,23,'LaunchMessage','Completed','2016-05-02 13:02:31',41,NULL,'Message','+919968963221','','2016-05-02 07:32:31'),(115,24,'LaunchMessage','Completed','2016-05-02 13:04:10',41,NULL,'Message','+919968963221','','2016-05-02 07:34:10'),(116,25,'LaunchMessage','Completed','2016-05-03 08:30:09',41,NULL,'Message','+919654971661','','2016-05-03 03:00:09'),(117,26,'LaunchMessage','Completed','2016-05-03 08:32:41',41,NULL,'Message','08586830010','','2016-05-03 03:02:41'),(118,61,'CreateContact','Completed','2016-05-03 09:35:31',41,NULL,'Contact','9891127941','','2016-05-03 04:05:31'),(119,62,'CreateContact','Completed','2016-05-03 09:35:32',41,NULL,'Contact','9891127941','','2016-05-03 04:05:32'),(120,27,'LaunchMessage','Completed','2016-05-03 09:59:11',41,NULL,'Message','011 2530 2728','','2016-05-03 04:29:11'),(121,28,'LaunchMessage','Completed','2016-05-03 09:59:17',41,NULL,'Message','229','','2016-05-03 04:29:17'),(122,100,'CreateContactList','Completed','2016-05-03 09:59:55',41,NULL,'ContactList','','Teachers','2016-05-03 04:29:55'),(123,147,'LaunchRecording','Completed','2016-05-03 10:06:59',41,129,'Recording','8826533273,9887766554',NULL,'2016-05-03 04:36:59'),(124,148,'LaunchRecording','Completed','2016-05-03 10:10:29',41,129,'Recording','8826533273,9887766554','','2016-05-03 04:40:29'),(125,149,'LaunchRecording','Completed','2016-05-03 10:14:33',41,129,'Recording',NULL,'172','2016-05-03 04:44:33'),(126,150,'LaunchRecording','Completed','2016-05-03 10:21:11',41,129,'Recording',NULL,'172','2016-05-03 04:51:11'),(127,151,'LaunchRecording','Completed','2016-05-03 10:21:53',41,129,'Recording',NULL,'172','2016-05-03 04:51:53'),(128,152,'LaunchRecording','Completed','2016-05-03 10:25:32',41,129,'Recording',NULL,'172','2016-05-03 04:55:32'),(129,153,'LaunchRecording','Completed','2016-05-03 10:50:48',41,129,'Recording','8826533273',NULL,'2016-05-03 05:20:48'),(130,154,'LaunchRecording','Completed','2016-05-03 10:53:42',41,129,'Recording',NULL,'172','2016-05-03 05:23:42'),(131,1,'LaunchSurvey','Completed','2016-05-03 11:39:59',41,129,'Survey',NULL,'172','2016-05-03 06:09:59'),(132,100,'CreateContactList','Rejected','2016-05-10 20:22:53',41,NULL,'ContactList','','Demo','2016-05-10 14:52:53'),(133,100,'CreateContactList','Rejected','2016-05-10 20:22:54',41,NULL,'ContactList','','Demo','2016-05-10 14:52:54'),(134,100,'CreateContactList','Rejected','2016-05-10 20:24:09',41,NULL,'ContactList','','Entrepreneurs','2016-05-10 14:54:09'),(135,100,'CreateContactList','Rejected','2016-05-10 20:24:09',41,NULL,'ContactList','','Entrepreneurs','2016-05-10 14:54:09'),(136,100,'CreateContactList','Completed','2016-05-11 10:18:37',41,NULL,'ContactList','','Entrepreneurs','2016-05-11 04:48:37'),(137,29,'LaunchMessage','Completed','2016-05-11 10:19:00',41,NULL,'Message','+918860271189','','2016-05-11 04:49:00'),(138,30,'LaunchMessage','Completed','2016-05-11 10:19:07',41,NULL,'Message','','229','2016-05-11 04:49:07'),(139,31,'LaunchMessage','Completed','2016-05-11 10:24:44',41,NULL,'Message','+918860271189','','2016-05-11 04:54:44'),(140,32,'LaunchMessage','Completed','2016-05-11 10:24:49',41,NULL,'Message','','229','2016-05-11 04:54:49'),(141,100,'CreateContactList','Completed','2016-05-11 12:18:41',41,NULL,'ContactList','','Delhites','2016-05-11 06:48:41'),(142,100,'CreateContactList','Completed','2016-05-12 12:27:33',41,NULL,'ContactList','','Retailers','2016-05-12 06:57:33'),(143,100,'CreateContactList','Completed','2016-05-12 14:47:35',41,NULL,'ContactList','','Shopkeepers','2016-05-12 09:17:35'),(144,33,'LaunchMessage','Completed','2016-05-12 14:52:13',41,NULL,'Message','097 66 946418','','2016-05-12 09:22:13'),(145,34,'LaunchMessage','Completed','2016-05-12 14:52:52',41,NULL,'Message','','233','2016-05-12 09:22:52'),(146,35,'LaunchMessage','Completed','2016-05-12 14:53:37',41,NULL,'Message','','229,227','2016-05-12 09:23:37'),(147,36,'LaunchMessage','Rejected','2016-05-12 14:54:29',41,NULL,'Message','','','2016-05-12 09:24:29'),(148,37,'LaunchMessage','Rejected','2016-05-12 14:54:29',41,NULL,'Message','','','2016-05-12 09:24:29'),(149,38,'LaunchMessage','Completed','2016-05-12 14:56:53',41,NULL,'Message','09971820556','','2016-05-12 09:26:53'),(150,39,'LaunchMessage','Rejected','2016-05-12 14:57:15',41,NULL,'Message','','','2016-05-12 09:27:15'),(151,40,'LaunchMessage','Rejected','2016-05-12 14:57:16',41,NULL,'Message','','','2016-05-12 09:27:16'),(152,41,'LaunchMessage','Rejected','2016-05-14 08:20:33',41,NULL,'Message','','','2016-05-14 02:50:33'),(153,42,'LaunchMessage','Rejected','2016-05-14 08:20:33',41,NULL,'Message','','','2016-05-14 02:50:33'),(154,43,'LaunchMessage','Rejected','2016-05-14 10:00:15',41,NULL,'Message','','','2016-05-14 04:30:15'),(155,44,'LaunchMessage','Rejected','2016-05-14 10:00:16',41,NULL,'Message','','','2016-05-14 04:30:16'),(156,45,'LaunchMessage','Completed','2016-05-14 10:08:03',41,NULL,'Message','','','2016-05-14 04:38:03'),(157,63,'CreateContact','Completed','2016-05-14 10:16:05',41,NULL,'Contact','9638527715','','2016-05-14 04:46:05'),(158,46,'LaunchMessage','Completed','2016-05-14 10:17:53',41,NULL,'Message','011 2530 2728','','2016-05-14 04:47:53'),(159,100,'CreateContactList','Completed','2016-05-17 11:39:00',41,NULL,'ContactList','','Zamindars','2016-05-17 06:09:00'),(160,47,'LaunchMessage','Completed','2016-05-17 18:31:44',37,NULL,'Message','+919999605582','','2016-05-17 13:01:44'),(161,48,'LaunchMessage','Completed','2016-05-17 18:32:54',37,NULL,'Message','','','2016-05-17 13:02:54'),(162,100,'CreateContactList','Completed','2016-05-17 18:34:03',37,NULL,'ContactList','','Middle Man','2016-05-17 13:04:03'),(163,49,'LaunchMessage','Completed','2016-05-18 05:54:16',37,NULL,'Message','','227,232','2016-05-18 00:24:16'),(164,50,'LaunchMessage','Completed','2016-05-18 06:08:30',37,NULL,'Message','','232,231','2016-05-18 00:38:30'),(165,100,'CreateContactList','Completed','2016-05-18 06:17:10',41,NULL,'ContactList','','Officials','2016-05-18 00:47:10'),(166,51,'LaunchMessage','Completed','2016-05-18 06:45:17',41,NULL,'Message','09891887854','','2016-05-18 01:15:17'),(167,52,'LaunchMessage','Completed','2016-05-18 06:45:19',41,NULL,'Message','09891887854','','2016-05-18 01:15:19'),(168,53,'LaunchMessage','Completed','2016-05-18 06:45:19',41,NULL,'Message','09891887854','','2016-05-18 01:15:19'),(169,54,'LaunchMessage','Completed','2016-05-18 06:45:27',41,NULL,'Message','','229','2016-05-18 01:15:27'),(170,55,'LaunchMessage','Completed','2016-05-18 06:56:49',41,NULL,'Message','','229','2016-05-18 01:26:49'),(171,56,'LaunchMessage','Completed','2016-05-18 06:56:51',41,NULL,'Message','','229','2016-05-18 01:26:51'),(172,57,'LaunchMessage','Completed','2016-05-18 06:56:57',41,NULL,'Message','09891887854','','2016-05-18 01:26:57'),(173,58,'LaunchMessage','Completed','2016-05-18 06:57:04',41,NULL,'Message','09891887854','','2016-05-18 01:27:04'),(174,59,'LaunchMessage','Completed','2016-05-18 06:57:28',41,NULL,'Message','09891887854','','2016-05-18 01:27:28'),(175,60,'LaunchMessage','Completed','2016-05-18 06:57:36',41,NULL,'Message','09891887854','','2016-05-18 01:27:36'),(176,61,'LaunchMessage','Completed','2016-05-19 11:54:15',37,NULL,'Message','','227,232','2016-05-19 06:24:15'),(177,62,'LaunchMessage','Completed','2016-05-19 11:54:17',37,NULL,'Message','','227,232','2016-05-19 06:24:17'),(178,63,'LaunchMessage','Completed','2016-05-19 11:54:19',37,NULL,'Message','','227,232','2016-05-19 06:24:19'),(179,64,'LaunchMessage','Completed','2016-05-19 11:55:25',37,NULL,'Message','','227,232','2016-05-19 06:25:25'),(180,65,'LaunchMessage','Completed','2016-05-19 12:00:17',37,NULL,'Message','','','2016-05-19 06:30:17'),(181,66,'LaunchMessage','Completed','2016-05-19 12:00:19',37,NULL,'Message','','','2016-05-19 06:30:19'),(182,67,'LaunchMessage','Completed','2016-05-19 12:02:26',37,NULL,'Message','','227,232','2016-05-19 06:32:26'),(183,64,'CreateContact','Completed','2016-05-19 12:05:29',37,NULL,'Contact','1236547898','','2016-05-19 06:35:29'),(184,100,'CreateContactList','Completed','2016-05-19 12:05:48',37,NULL,'ContactList','','teachers','2016-05-19 06:35:48'),(185,100,'CreateContactList','Completed','2016-05-19 12:07:12',37,NULL,'ContactList','','Clients','2016-05-19 06:37:12'),(186,65,'CreateContact','Completed','2016-05-19 12:07:12',41,NULL,'Contact','9638527412','','2016-05-19 06:37:12'),(187,68,'LaunchMessage','Completed','2016-05-19 13:08:18',41,NULL,'Message','','229','2016-05-19 07:38:18'),(188,69,'LaunchMessage','Completed','2016-05-19 13:08:19',41,NULL,'Message','','229','2016-05-19 07:38:19');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `block` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `district` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (17,'Abhishek','8787878787','M',25,'Delhi','Delhi','a','2015-09-16 07:17:19','2016-04-22 10:11:31','Delhi'),(18,'Kapil','9090909090','M',23,'Delhi','Delhi','a','2015-09-08 13:42:14','2016-04-22 10:11:36','East'),(19,'Reshma','9090909887','F',34,'delhi','delhi','a','2015-09-08 14:01:59','2016-04-22 10:11:39','delhi'),(20,'Vikas','2323232323','M',32,'delhi','delhi','a','2015-09-12 17:08:38','2016-04-22 10:11:44','delhi'),(21,'Vikas2','2323232223','M',32,'delhi','delhi','a','2015-09-12 17:12:09','2016-04-22 04:44:16','delhi'),(22,'Akku','9013164900','M',32,'delhi','delhi','a','2015-09-12 17:18:28','2016-04-22 04:44:16','delhi'),(23,'reshma','8787878787','g',65,'fef','hf','a','2015-09-12 18:09:37','2016-04-22 04:44:16','dc'),(24,'reshma','8787878787','g',65,'fef','hf','a','2015-09-12 18:11:26','2016-04-22 04:44:16','dc'),(25,'reshma','8787878787','g',65,'fef','hf','a','2015-09-12 18:15:56','2016-04-22 04:44:16','dc'),(26,'reshma','8787878787','g',65,'fef','hf','a','2015-09-12 18:16:55','2016-04-22 04:44:16','dc'),(27,'kapil','783816816','m',23,'bihar','bihar','a','2015-09-30 09:38:57','2016-04-22 04:44:16','djlkcfl'),(28,'arti','9098909890','s',32,'bihar','bihar','a','2015-10-24 17:12:10','2016-04-22 04:44:16','djlkcfl'),(29,'vikas','9717235139','M',23,'delhi','delhi','a','2015-12-30 04:51:56','2016-04-22 04:44:16',''),(30,'vikas','9717235138','M',23,'delhi','delhi','a','2015-12-30 04:56:16','2016-04-22 04:44:16','sd'),(31,'vikas','9717235138','d',22,'delhi','hf','a','2015-12-30 05:21:59','2016-04-22 04:44:17','sd'),(32,'vikas','9717235139','dsc',32,'fef','bihar','a','2015-12-30 05:32:25','2016-04-22 04:44:17','sd'),(33,'vikas1','9717235138','M',65,'delhi','delhi','a','2015-12-30 05:39:25','2016-04-22 04:44:17','sd'),(34,'reshma','9098909890','s',0,'d','delhi','a','2015-12-30 05:41:36','2016-04-22 04:44:17','d'),(35,'vikas1','9717235139','g',3,'bihar','css','a','2015-12-30 06:12:29','2016-04-22 04:44:17','dc'),(36,'vikas','9717235139','f',0,'delhi','delhi','a','2015-12-30 06:33:49','2016-04-22 04:44:17','css'),(37,'Preeti Rani','8826533273','s',54,'dellji','dd','a','2015-12-30 12:11:57','2016-05-11 10:39:14','sd'),(41,'Surbhi','9718658816','F',23,'ccd','Delhi','a','2015-12-30 13:03:06','2016-04-22 04:44:17','sd'),(43,'A','9889096756','M',45,'B','C','a','2016-01-02 18:36:28','2016-04-22 04:44:17','D'),(44,'vikas','9718658816','F',22,'delhi','Delhi','a','2016-01-05 12:00:56','2016-04-22 04:44:17','Delhi'),(45,'garima','9098644567','F',22,'delhi','Delhi','a','2016-01-05 12:01:40','2016-04-22 04:44:17','Delhi'),(46,'Kiara','1234432112','F',25,'Delhi','Delhi','a','2016-01-06 11:05:43','2016-04-22 04:44:17','Delhi'),(47,'Kiara2','8130031619','F',24,'delhi','delhi','a','2016-01-06 11:25:32','2016-04-22 04:44:17','Delhi'),(48,'radha','7838907634','F',23,'delhi','delhi','a',NULL,'2016-04-22 04:44:17','East'),(49,'Surbhi Jain','9718658816','F',23,'Delhi','Delhi','a','2016-03-08 09:53:59','2016-04-22 04:44:17','North East Delhi'),(50,'Prerei','8778877887','F',23,'delhi','Delhi','a','2016-03-10 19:54:31','2016-04-22 04:44:17','East'),(51,'NEw','1212121212','F',22,'city','STAte','block','2016-04-22 11:24:13','2016-04-22 05:54:13','district'),(52,'NEw','1212121212','F',22,'city','STAte','block','2016-04-22 11:29:34','2016-04-22 05:59:34','district'),(53,'NEw','1212121212','F',22,'city','STAte','block','2016-04-22 11:29:39','2016-04-22 05:59:39','district'),(54,'NEw','1212121212','F',22,'city','STAte','block','2016-04-22 11:33:58','2016-04-22 06:03:58','district'),(55,'NEw','1212121212','F',22,'city','STAte','block','2016-04-22 11:35:13','2016-04-22 06:05:13','district'),(56,'akku2','1212121212','F',22,'city','STAte','block','2016-04-30 18:08:05','2016-04-30 12:38:05','district'),(57,'Preeti','9718658816','F',12,NULL,'JH ',' Bermo','2016-05-02 08:40:15','2016-05-02 03:10:15',' Bokaro '),(58,'Rajesh','9718658816','F',12,NULL,'JH ',' Gomia','2016-05-02 08:40:58','2016-05-02 03:10:58',' Bokaro '),(59,'Suresh','9718658816','F',13,'','JH ',' Petrawar','2016-05-02 08:49:42','2016-05-02 03:19:42',' Bokaro '),(60,'Deepika','9718688816','F',45,'','JH ',' Birni','2016-05-02 12:44:34','2016-05-02 07:14:34',' Giridih '),(61,'Diksha','9891127941','F',45,'','JH ',' Gandey','2016-05-03 09:35:31','2016-05-03 04:05:31',' Giridih '),(62,'Diksha','9891127941','F',45,'','JH ',' Gandey','2016-05-03 09:35:32','2016-05-03 04:05:32',' Giridih '),(63,'Sumitra','9638527715','F',56,'','JH ',' Nawadih','2016-05-14 10:16:05','2016-05-14 04:46:05',' Bokaro '),(64,'hina','1236547898','F',23,'','JH ',' Giridih','2016-05-19 12:05:29','2016-05-19 06:35:29',' Giridih '),(65,'Surender','9638527412','F',12,'','JH ',' Chandankiyari','2016-05-19 12:07:12','2016-05-19 06:37:12',' Bokaro ');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-21  0:48:53
