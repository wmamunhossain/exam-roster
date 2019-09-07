CREATE DATABASE  IF NOT EXISTS `examroster1.2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `examroster1.2`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: examroster1.2
-- ------------------------------------------------------
-- Server version	5.6.20-log

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_committee_id` int(11) NOT NULL,
  `session` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `course_code` varchar(50) NOT NULL,
  `course_title` varchar(50) NOT NULL,
  `credit` double NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `index3` (`course_code`,`session`),
  KEY `exam_committee_id` (`exam_committee_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`exam_committee_id`) REFERENCES `exam_committee` (`exam_committee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,2,2011,7,'CSE305','Database theory',3),(2,2,2011,7,'CSE306','Database Lab',3),(3,2,2011,7,'CSE312','Data Communication',3),(4,2,2011,7,'CSE313','Data Communication Lab',1.5),(5,1,2012,5,'CSE221','Data Structure',3),(6,1,2012,5,'CSE222','Data Structure Lab',1.5),(7,1,2012,5,'CSE204','Microprocessor',3),(8,1,2012,5,'CSE205','Microprocessor Lab',1.5);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_registration`
--

DROP TABLE IF EXISTS `course_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_registration` (
  `id_course_reg` int(11) NOT NULL AUTO_INCREMENT,
  `id_student` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `is_approved` tinyint(1) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_course_reg`),
  KEY `id_student` (`id_student`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `course_registration_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `course_registration_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_registration`
--

LOCK TABLES `course_registration` WRITE;
/*!40000 ALTER TABLE `course_registration` DISABLE KEYS */;
INSERT INTO `course_registration` VALUES (1,1,1,1,NULL),(2,2,1,1,NULL),(3,3,1,1,NULL),(4,4,1,1,NULL),(5,5,1,1,NULL),(6,6,1,1,NULL),(7,1,2,1,NULL),(8,2,2,1,NULL),(9,3,2,1,NULL),(10,4,2,1,NULL),(11,5,2,1,NULL),(12,6,2,1,NULL),(13,1,3,1,NULL),(14,2,3,1,NULL),(15,3,3,1,NULL),(16,4,3,1,NULL),(17,5,3,1,NULL),(18,6,3,1,NULL),(19,1,4,1,NULL),(20,2,4,1,NULL),(21,3,4,1,NULL),(22,4,4,1,NULL),(23,5,4,1,NULL),(24,6,4,1,NULL),(25,7,5,1,NULL),(26,8,5,1,NULL),(27,9,5,1,NULL),(28,10,5,1,NULL),(29,11,5,1,NULL),(30,12,5,1,NULL),(31,13,5,1,NULL),(32,7,6,1,NULL),(33,8,6,1,NULL),(34,9,6,1,NULL),(35,10,6,1,NULL),(36,11,6,1,NULL),(37,12,6,1,NULL),(38,13,6,1,NULL),(39,7,7,1,NULL),(40,8,7,1,NULL),(41,9,7,1,NULL),(42,10,7,1,NULL),(43,11,7,1,NULL),(44,12,7,1,NULL),(45,13,7,1,NULL),(46,7,8,1,NULL),(47,8,8,1,NULL),(48,9,8,1,NULL),(49,10,8,1,NULL),(50,11,8,1,NULL),(51,12,8,1,NULL),(52,13,8,1,NULL);
/*!40000 ALTER TABLE `course_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designation` (
  `id_desig` int(11) NOT NULL AUTO_INCREMENT,
  `desig_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id_desig`),
  UNIQUE KEY `index2` (`desig_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation`
--

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` VALUES (3,'Assistant Professor'),(2,'Associate Professor'),(4,'Lecturer'),(1,'Professor');
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_committee`
--

DROP TABLE IF EXISTS `exam_committee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_committee` (
  `exam_committee_id` int(11) NOT NULL AUTO_INCREMENT,
  `semester` int(11) NOT NULL,
  `session` int(11) NOT NULL,
  `chairman_id` int(11) NOT NULL,
  PRIMARY KEY (`exam_committee_id`),
  KEY `chairman_id` (`chairman_id`),
  CONSTRAINT `exam_committee_ibfk_1` FOREIGN KEY (`chairman_id`) REFERENCES `instructor` (`id_instructor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_committee`
--

LOCK TABLES `exam_committee` WRITE;
/*!40000 ALTER TABLE `exam_committee` DISABLE KEYS */;
INSERT INTO `exam_committee` VALUES (1,5,2012,3),(2,7,2011,4);
/*!40000 ALTER TABLE `exam_committee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_hall`
--

DROP TABLE IF EXISTS `exam_hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_hall` (
  `exam_hall_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_name` varchar(20) NOT NULL,
  `room_no` int(11) NOT NULL,
  PRIMARY KEY (`exam_hall_id`),
  UNIQUE KEY `index2` (`building_name`,`room_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_hall`
--

LOCK TABLES `exam_hall` WRITE;
/*!40000 ALTER TABLE `exam_hall` DISABLE KEYS */;
INSERT INTO `exam_hall` VALUES (3,'A',113),(2,'A',309),(1,'A',310),(5,'C',110),(4,'C',113),(6,'D',104),(7,'D',113);
/*!40000 ALTER TABLE `exam_hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_routine`
--

DROP TABLE IF EXISTS `exam_routine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_routine` (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `exam_hall_id` int(11) NOT NULL,
  `exam_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`exam_id`),
  KEY `course_id` (`course_id`),
  KEY `exam_hall_id` (`exam_hall_id`),
  CONSTRAINT `exam_routine_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_routine_ibfk_2` FOREIGN KEY (`exam_hall_id`) REFERENCES `exam_hall` (`exam_hall_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_routine`
--

LOCK TABLES `exam_routine` WRITE;
/*!40000 ALTER TABLE `exam_routine` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_routine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `id_instructor` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `employee_code` varchar(3) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `id_desig` int(11) NOT NULL,
  PRIMARY KEY (`id_instructor`),
  UNIQUE KEY `index3` (`employee_code`,`department`),
  KEY `id_desig` (`id_desig`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`id_desig`) REFERENCES `designation` (`id_desig`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'Dr Muhammed Zafar Iqbal ','MZI','CSE',1),(2,'Dr Mohammad Reza Selim','MRS','CSE',2),(3,'Mr Md Masum','MM','CSE',3),(4,'Mr Md Khairullah','MK','CSE',3),(5,'Mr Abu Naser','AN','CSE',4);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invigilator`
--

DROP TABLE IF EXISTS `invigilator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invigilator` (
  `invigilator_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_instructor` int(11) NOT NULL,
  `total_duty` int(11) DEFAULT NULL,
  `total_credit` double DEFAULT NULL,
  `duty_given` int(11) DEFAULT NULL,
  PRIMARY KEY (`invigilator_id`),
  KEY `id_instructor` (`id_instructor`),
  CONSTRAINT `invigilator_ibfk_1` FOREIGN KEY (`id_instructor`) REFERENCES `instructor` (`id_instructor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invigilator`
--

LOCK TABLES `invigilator` WRITE;
/*!40000 ALTER TABLE `invigilator` DISABLE KEYS */;
INSERT INTO `invigilator` VALUES (1,1,4,0,0),(2,2,5,0,0),(3,3,6,0,0),(4,4,6,0,0),(5,5,8,0,0);
/*!40000 ALTER TABLE `invigilator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id_student` int(11) NOT NULL AUTO_INCREMENT,
  `registration_no` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `session` int(11) NOT NULL,
  PRIMARY KEY (`id_student`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,2011331051,'Enam',2011),(2,2011331063,'Gaurab',2011),(3,2011331034,'Rumman',2011),(4,2011331071,'Mamun',2011),(5,2011331058,'Mansur',2011),(6,2011331027,'Masud',2011),(7,2012331012,'Dipu',2012),(8,2012331021,'Olee',2012),(9,2012331034,'Nayem',2012),(10,2012331051,'Karim',2012),(11,2012331023,'Rahim',2012),(12,2012331045,'Shamim',2012),(13,2012331050,'Kazi',2012);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_assign`
--

DROP TABLE IF EXISTS `teacher_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_assign` (
  `ta_id` int(11) NOT NULL AUTO_INCREMENT,
  `invigilator_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ta_id`),
  KEY `invigilator_id` (`invigilator_id`),
  KEY `exam_id` (`exam_id`),
  CONSTRAINT `teacher_assign_ibfk_1` FOREIGN KEY (`invigilator_id`) REFERENCES `invigilator` (`invigilator_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_assign_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exam_routine` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_assign`
--

LOCK TABLES `teacher_assign` WRITE;
/*!40000 ALTER TABLE `teacher_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teaches` (
  `id_teaches` int(11) NOT NULL AUTO_INCREMENT,
  `id_instructor` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id_teaches`),
  KEY `id_instructor` (`id_instructor`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`id_instructor`) REFERENCES `instructor` (`id_instructor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
INSERT INTO `teaches` VALUES (1,4,1),(2,4,2),(3,1,3),(4,1,4),(5,5,5),(6,5,6),(7,3,7),(8,3,8);
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-02 19:11:42
