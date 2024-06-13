-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: moodleuser
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `contentbank`
--

DROP TABLE IF EXISTS `contentbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentbank` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `contenttype` varchar(100) DEFAULT NULL,
  `contextid` int DEFAULT NULL,
  `visibility` tinyint(1) DEFAULT NULL,
  `instanceid` int DEFAULT NULL,
  `configdata` text,
  `usercreated` int DEFAULT NULL,
  `usermodified` int DEFAULT NULL,
  `timecreated` int DEFAULT NULL,
  `timemodified` int DEFAULT NULL,
  `postid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usercreated` (`usercreated`),
  KEY `usermodified` (`usermodified`),
  KEY `postid` (`postid`),
  CONSTRAINT `contentbank_ibfk_1` FOREIGN KEY (`usercreated`) REFERENCES `user` (`id`),
  CONSTRAINT `contentbank_ibfk_2` FOREIGN KEY (`usermodified`) REFERENCES `user` (`id`),
  CONSTRAINT `contentbank_ibfk_3` FOREIGN KEY (`postid`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentbank`
--

LOCK TABLES `contentbank` WRITE;
/*!40000 ALTER TABLE `contentbank` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id` int NOT NULL,
  `category` bigint DEFAULT NULL,
  `sortorder` bigint DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `idnumber` varchar(100) DEFAULT NULL,
  `summary` longtext,
  `summaryformat` int DEFAULT NULL,
  `format` varchar(50) DEFAULT NULL,
  `showgrades` smallint DEFAULT NULL,
  `newsitems` int DEFAULT NULL,
  `startdate` bigint DEFAULT NULL,
  `enddate` bigint DEFAULT NULL,
  `relativedatesmode` tinyint(1) DEFAULT NULL,
  `marker` bigint DEFAULT NULL,
  `maxbytes` bigint DEFAULT NULL,
  `legacyfiles` smallint DEFAULT NULL,
  `showreports` smallint DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `visibleold` tinyint(1) DEFAULT NULL,
  `groupmode` smallint DEFAULT NULL,
  `groupmodeforce` smallint DEFAULT NULL,
  `defaultgroupingid` bigint DEFAULT NULL,
  `lang` varchar(30) DEFAULT NULL,
  `calendartype` varchar(30) DEFAULT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `timecreated` bigint DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL,
  `requested` tinyint(1) DEFAULT NULL,
  `enablecompletion` tinyint(1) DEFAULT NULL,
  `completionnotify` tinyint(1) DEFAULT NULL,
  `cacherev` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_enroll`
--

DROP TABLE IF EXISTS `course_enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_enroll` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `course_enroll_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `course_enroll_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_enroll`
--

LOCK TABLES `course_enroll` WRITE;
/*!40000 ALTER TABLE `course_enroll` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_enroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_discussions`
--

DROP TABLE IF EXISTS `forum_discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_discussions` (
  `id` int NOT NULL,
  `course` int NOT NULL,
  `forum` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `firstpost` int NOT NULL,
  `userid` int NOT NULL,
  `groupid` int DEFAULT NULL,
  `assessed` int DEFAULT NULL,
  `timemodified` int DEFAULT NULL,
  `usermodified` int DEFAULT NULL,
  `timestart` int DEFAULT NULL,
  `timeend` int DEFAULT NULL,
  `pinned` tinyint(1) DEFAULT '0',
  `timelocked` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `firstpost` (`firstpost`),
  CONSTRAINT `forum_discussions_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  CONSTRAINT `forum_discussions_ibfk_2` FOREIGN KEY (`firstpost`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_discussions`
--

LOCK TABLES `forum_discussions` WRITE;
/*!40000 ALTER TABLE `forum_discussions` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `id` int NOT NULL,
  `itemid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) DEFAULT NULL,
  `rawgrademin` decimal(10,5) DEFAULT NULL,
  `rawscaleid` bigint DEFAULT NULL,
  `usermodified` bigint DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint DEFAULT NULL,
  `locked` bigint DEFAULT NULL,
  `locktime` bigint DEFAULT NULL,
  `exported` bigint DEFAULT NULL,
  `overridden` bigint DEFAULT NULL,
  `excluded` bigint DEFAULT NULL,
  `feedback` longtext,
  `feedbackformat` bigint DEFAULT NULL,
  `information` longtext,
  `informationformat` bigint DEFAULT NULL,
  `timecreated` bigint DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL,
  `aggregationstatus` varchar(10) DEFAULT NULL,
  `aggregationweight` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `module` varchar(20) DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `courseid` int DEFAULT NULL,
  `groupid` int DEFAULT NULL,
  `moduleid` int DEFAULT NULL,
  `coursemoduleid` int DEFAULT NULL,
  `subject` varchar(128) DEFAULT NULL,
  `summary` longtext,
  `content` longtext,
  `uniquehash` varchar(255) DEFAULT NULL,
  `rating` bigint DEFAULT NULL,
  `format` bigint DEFAULT NULL,
  `summaryformat` int DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `publishstate` varchar(20) DEFAULT NULL,
  `lastmodified` bigint DEFAULT NULL,
  `created` bigint DEFAULT NULL,
  `usermodified` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `courseid` (`courseid`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`courseid`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz` (
  `id` int NOT NULL,
  `course` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `intro` longtext,
  `introformat` int DEFAULT NULL,
  `timeopen` bigint DEFAULT NULL,
  `timelimit` bigint DEFAULT NULL,
  `overduehandling` varchar(16) DEFAULT NULL,
  `graceperiod` bigint DEFAULT NULL,
  `preferredbehaviour` varchar(32) DEFAULT NULL,
  `canredoquestions` smallint DEFAULT NULL,
  `attempts` int DEFAULT NULL,
  `attemptonlast` smallint DEFAULT NULL,
  `grademethod` smallint DEFAULT NULL,
  `decimalpoints` smallint DEFAULT NULL,
  `questiondecimalpoints` smallint DEFAULT NULL,
  `reviewattempt` mediumint DEFAULT NULL,
  `reviewcorrectness` mediumint DEFAULT NULL,
  `reviewmarks` mediumint DEFAULT NULL,
  `reviewspecificfeedback` mediumint DEFAULT NULL,
  `reviewgeneralfeedback` mediumint DEFAULT NULL,
  `reviewrightanswer` mediumint DEFAULT NULL,
  `reviewoverallfeedback` mediumint DEFAULT NULL,
  `questionsperpage` bigint DEFAULT NULL,
  `navmethod` varchar(16) DEFAULT NULL,
  `shuffleanswers` smallint DEFAULT NULL,
  `sumgrades` decimal(10,5) DEFAULT NULL,
  `grade` decimal(10,5) DEFAULT NULL,
  `timecreated` bigint DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `subnet` varchar(255) DEFAULT NULL,
  `browsersecurity` varchar(32) DEFAULT NULL,
  `delay1` bigint DEFAULT NULL,
  `delay2` bigint DEFAULT NULL,
  `showuserpicture` smallint DEFAULT NULL,
  `showblocks` smallint DEFAULT NULL,
  `completionattemptsexhausted` bit(1) DEFAULT NULL,
  `completionpass` bit(1) DEFAULT NULL,
  `allowofflineattempts` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_attempts`
--

DROP TABLE IF EXISTS `quiz_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_attempts` (
  `id` int NOT NULL,
  `quiz` int NOT NULL,
  `userid` int NOT NULL,
  `attempt` int NOT NULL,
  `uniqueid` int NOT NULL,
  `layout` longtext,
  `currentpage` int NOT NULL,
  `preview` smallint DEFAULT NULL,
  `state` varchar(16) NOT NULL,
  `timestart` int DEFAULT NULL,
  `timefinish` int DEFAULT NULL,
  `timemodified` int DEFAULT NULL,
  `timemodifiedoffline` int DEFAULT NULL,
  `timecheckstate` int DEFAULT NULL,
  `sumgrades` decimal(10,5) DEFAULT NULL,
  `gradednotificationsenttime` int DEFAULT NULL,
  `quiz_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `fk_quiz_id` (`quiz_id`),
  CONSTRAINT `fk_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`),
  CONSTRAINT `quiz_attempts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_attempts`
--

LOCK TABLES `quiz_attempts` WRITE;
/*!40000 ALTER TABLE `quiz_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_assignments`
--

DROP TABLE IF EXISTS `role_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_assignments` (
  `id` int NOT NULL,
  `roleid` int NOT NULL,
  `contextid` int NOT NULL,
  `userid` int NOT NULL,
  `timemodified` int DEFAULT NULL,
  `modifierid` int DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `itemid` int DEFAULT NULL,
  `sortorder` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `role_assignments_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_assignments`
--

LOCK TABLES `role_assignments` WRITE;
/*!40000 ALTER TABLE `role_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `auth` varchar(20) NOT NULL,
  `confirmed` tinyint(1) DEFAULT '0',
  `policyagreed` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `suspended` tinyint(1) DEFAULT '0',
  `mnethostid` int DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `idnumber` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `emailstop` tinyint(1) DEFAULT '0',
  `phone1` varchar(20) DEFAULT NULL,
  `phone2` varchar(20) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `lang` varchar(30) DEFAULT NULL,
  `calendartype` varchar(30) DEFAULT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `timezone` varchar(100) DEFAULT NULL,
  `firstaccess` bigint DEFAULT NULL,
  `lastaccess` bigint DEFAULT NULL,
  `lastlogin` bigint DEFAULT NULL,
  `currentlogin` bigint DEFAULT NULL,
  `lastip` varchar(45) DEFAULT NULL,
  `secret` varchar(15) DEFAULT NULL,
  `picture` bigint DEFAULT '0',
  `description` longtext,
  `descriptionformat` tinyint DEFAULT '1',
  `mailform` tinyint(1) DEFAULT '0',
  `maildigest` tinyint(1) DEFAULT '0',
  `maildisplay` tinyint(1) DEFAULT '2',
  `autosubscribe` tinyint(1) DEFAULT '1',
  `trackforums` tinyint(1) DEFAULT '0',
  `timecreated` bigint DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL,
  `trustbitmask` bigint DEFAULT '0',
  `imagereal` varchar(255) DEFAULT NULL,
  `lastnamephonetic` varchar(255) DEFAULT NULL,
  `firstnamephonetic` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `alternatename` varchar(255) DEFAULT NULL,
  `moodlenetprofile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_enrollments`
--

DROP TABLE IF EXISTS `user_enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_enrollments` (
  `id` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `enrolid` int NOT NULL,
  `userid` int NOT NULL,
  `timestart` int DEFAULT NULL,
  `timeend` int DEFAULT NULL,
  `modifierid` int DEFAULT NULL,
  `timecreated` int DEFAULT NULL,
  `timemodified` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_enrollments_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_enrollments`
--

LOCK TABLES `user_enrollments` WRITE;
/*!40000 ALTER TABLE `user_enrollments` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_enrollments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-11 18:16:17
