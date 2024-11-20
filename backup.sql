-- MySQL dump 10.13  Distrib 9.1.0, for Linux (x86_64)
--
-- Host: localhost    Database: policlinic_db
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_direction`
--

DROP TABLE IF EXISTS `app_direction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_direction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name_direction` varchar(255) NOT NULL,
  `until_time` date NOT NULL,
  `user_id` bigint NOT NULL,
  `institution_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `institution_id` (`institution_id`),
  KEY `app_direction_user_id_a4e1cf3f_fk_app_user_id` (`user_id`),
  CONSTRAINT `app_direction_institution_id_eb388b19_fk_app_institution_id` FOREIGN KEY (`institution_id`) REFERENCES `app_institution` (`id`),
  CONSTRAINT `app_direction_user_id_a4e1cf3f_fk_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_direction`
--

LOCK TABLES `app_direction` WRITE;
/*!40000 ALTER TABLE `app_direction` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_direction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_doctors`
--

DROP TABLE IF EXISTS `app_doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_doctors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `specialization_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `app_doctors_specialization_id_80f51f4d_fk_app_specialization_id` (`specialization_id`),
  CONSTRAINT `app_doctors_specialization_id_80f51f4d_fk_app_specialization_id` FOREIGN KEY (`specialization_id`) REFERENCES `app_specialization` (`id`),
  CONSTRAINT `app_doctors_user_id_3dcb976c_fk_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_doctors`
--

LOCK TABLES `app_doctors` WRITE;
/*!40000 ALTER TABLE `app_doctors` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_doctorsreviews`
--

DROP TABLE IF EXISTS `app_doctorsreviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_doctorsreviews` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `description` longtext NOT NULL,
  `raiting` int NOT NULL,
  `doctor_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_doctorsreviews_doctor_id_14a38458_fk_app_doctors_id` (`doctor_id`),
  KEY `app_doctorsreviews_user_id_8ca27fc7_fk_app_user_id` (`user_id`),
  CONSTRAINT `app_doctorsreviews_doctor_id_14a38458_fk_app_doctors_id` FOREIGN KEY (`doctor_id`) REFERENCES `app_doctors` (`id`),
  CONSTRAINT `app_doctorsreviews_user_id_8ca27fc7_fk_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_doctorsreviews`
--

LOCK TABLES `app_doctorsreviews` WRITE;
/*!40000 ALTER TABLE `app_doctorsreviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_doctorsreviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_filepdf`
--

DROP TABLE IF EXISTS `app_filepdf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_filepdf` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name_file` varchar(255) NOT NULL,
  `file_path` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_filepdf`
--

LOCK TABLES `app_filepdf` WRITE;
/*!40000 ALTER TABLE `app_filepdf` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_filepdf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_institution`
--

DROP TABLE IF EXISTS `app_institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_institution` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name_institution` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_institution`
--

LOCK TABLES `app_institution` WRITE;
/*!40000 ALTER TABLE `app_institution` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_policy`
--

DROP TABLE IF EXISTS `app_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_policy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `policy_number` int NOT NULL,
  `date_receipt` date NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_policy`
--

LOCK TABLES `app_policy` WRITE;
/*!40000 ALTER TABLE `app_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_records`
--

DROP TABLE IF EXISTS `app_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_records` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `date_create` datetime(6) NOT NULL,
  `date_record` date NOT NULL,
  `name_records` varchar(100) NOT NULL,
  `date_time` time(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_records_doctor_id_d3731faa_fk_app_doctors_id` (`doctor_id`),
  KEY `app_records_user_id_a3a447cc_fk_app_user_id` (`user_id`),
  CONSTRAINT `app_records_doctor_id_d3731faa_fk_app_doctors_id` FOREIGN KEY (`doctor_id`) REFERENCES `app_doctors` (`id`),
  CONSTRAINT `app_records_user_id_a3a447cc_fk_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_records`
--

LOCK TABLES `app_records` WRITE;
/*!40000 ALTER TABLE `app_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_researchresults`
--

DROP TABLE IF EXISTS `app_researchresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_researchresults` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name_research` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `file_path_id` bigint NOT NULL,
  `institution_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_path_id` (`file_path_id`),
  UNIQUE KEY `institution_id` (`institution_id`),
  KEY `app_researchresults_user_id_71cfafa6_fk_app_user_id` (`user_id`),
  CONSTRAINT `app_researchresults_file_path_id_757edf7a_fk_app_filepdf_id` FOREIGN KEY (`file_path_id`) REFERENCES `app_filepdf` (`id`),
  CONSTRAINT `app_researchresults_institution_id_d47197f9_fk_app_insti` FOREIGN KEY (`institution_id`) REFERENCES `app_institution` (`id`),
  CONSTRAINT `app_researchresults_user_id_71cfafa6_fk_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_researchresults`
--

LOCK TABLES `app_researchresults` WRITE;
/*!40000 ALTER TABLE `app_researchresults` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_researchresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_specialization`
--

DROP TABLE IF EXISTS `app_specialization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_specialization` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `specialization` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_specialization_specialization_8611ef2d_uniq` (`specialization`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_specialization`
--

LOCK TABLES `app_specialization` WRITE;
/*!40000 ALTER TABLE `app_specialization` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_specialization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `policy_id` bigint DEFAULT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `policy_id` (`policy_id`),
  CONSTRAINT `app_user_policy_id_4684f51e_fk_app_policy_id` FOREIGN KEY (`policy_id`) REFERENCES `app_policy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (1,'pbkdf2_sha256$870000$iO63dWXpofnwaFdibVTxdA$0h4M6EXEDVKj/BYkLgrinlZatuogNxC3GLZC4h6jbFA=',NULL,1,'admiin','','','qosimov-admin@gmail.com',1,1,'2024-11-20 12:33:26.099609',NULL,NULL);
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user_groups`
--

DROP TABLE IF EXISTS `app_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_user_groups_user_id_group_id_73b8e940_uniq` (`user_id`,`group_id`),
  KEY `app_user_groups_group_id_e774d92c_fk_auth_group_id` (`group_id`),
  CONSTRAINT `app_user_groups_group_id_e774d92c_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `app_user_groups_user_id_e6f878f6_fk_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user_groups`
--

LOCK TABLES `app_user_groups` WRITE;
/*!40000 ALTER TABLE `app_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user_user_permissions`
--

DROP TABLE IF EXISTS `app_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_user_user_permissions_user_id_permission_id_7c8316ce_uniq` (`user_id`,`permission_id`),
  KEY `app_user_user_permis_permission_id_4ef8e133_fk_auth_perm` (`permission_id`),
  CONSTRAINT `app_user_user_permis_permission_id_4ef8e133_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `app_user_user_permissions_user_id_24780b52_fk_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user_user_permissions`
--

LOCK TABLES `app_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `app_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add Файл PDF',7,'add_filepdf'),(26,'Can change Файл PDF',7,'change_filepdf'),(27,'Can delete Файл PDF',7,'delete_filepdf'),(28,'Can view Файл PDF',7,'view_filepdf'),(29,'Can add Институт',8,'add_institution'),(30,'Can change Институт',8,'change_institution'),(31,'Can delete Институт',8,'delete_institution'),(32,'Can view Институт',8,'view_institution'),(33,'Can add Полис',9,'add_policy'),(34,'Can change Полис',9,'change_policy'),(35,'Can delete Полис',9,'delete_policy'),(36,'Can view Полис',9,'view_policy'),(37,'Can add Название специализации',10,'add_specialization'),(38,'Can change Название специализации',10,'change_specialization'),(39,'Can delete Название специализации',10,'delete_specialization'),(40,'Can view Название специализации',10,'view_specialization'),(41,'Can add Доктор',11,'add_doctors'),(42,'Can change Доктор',11,'change_doctors'),(43,'Can delete Доктор',11,'delete_doctors'),(44,'Can view Доктор',11,'view_doctors'),(45,'Can add Отзыв на врача',12,'add_doctorsreviews'),(46,'Can change Отзыв на врача',12,'change_doctorsreviews'),(47,'Can delete Отзыв на врача',12,'delete_doctorsreviews'),(48,'Can view Отзыв на врача',12,'view_doctorsreviews'),(49,'Can add Направление',13,'add_direction'),(50,'Can change Направление',13,'change_direction'),(51,'Can delete Направление',13,'delete_direction'),(52,'Can view Направление',13,'view_direction'),(53,'Can add Запись',14,'add_records'),(54,'Can change Запись',14,'change_records'),(55,'Can delete Запись',14,'delete_records'),(56,'Can view Запись',14,'view_records'),(57,'Can add Результаты исследования',15,'add_researchresults'),(58,'Can change Результаты исследования',15,'change_researchresults'),(59,'Can delete Результаты исследования',15,'delete_researchresults'),(60,'Can view Результаты исследования',15,'view_researchresults');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_app_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(13,'app','direction'),(11,'app','doctors'),(12,'app','doctorsreviews'),(7,'app','filepdf'),(8,'app','institution'),(9,'app','policy'),(14,'app','records'),(15,'app','researchresults'),(10,'app','specialization'),(6,'app','user'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-11-20 12:32:06.998402'),(2,'contenttypes','0002_remove_content_type_name','2024-11-20 12:32:07.026206'),(3,'auth','0001_initial','2024-11-20 12:32:07.141054'),(4,'auth','0002_alter_permission_name_max_length','2024-11-20 12:32:07.170783'),(5,'auth','0003_alter_user_email_max_length','2024-11-20 12:32:07.174728'),(6,'auth','0004_alter_user_username_opts','2024-11-20 12:32:07.178545'),(7,'auth','0005_alter_user_last_login_null','2024-11-20 12:32:07.181966'),(8,'auth','0006_require_contenttypes_0002','2024-11-20 12:32:07.183513'),(9,'auth','0007_alter_validators_add_error_messages','2024-11-20 12:32:07.186910'),(10,'auth','0008_alter_user_username_max_length','2024-11-20 12:32:07.190799'),(11,'auth','0009_alter_user_last_name_max_length','2024-11-20 12:32:07.194351'),(12,'auth','0010_alter_group_name_max_length','2024-11-20 12:32:07.201644'),(13,'auth','0011_update_proxy_permissions','2024-11-20 12:32:07.205766'),(14,'auth','0012_alter_user_first_name_max_length','2024-11-20 12:32:07.209606'),(15,'app','0001_initial','2024-11-20 12:32:07.348292'),(16,'admin','0001_initial','2024-11-20 12:32:07.418220'),(17,'admin','0002_logentry_remove_auto_add','2024-11-20 12:32:07.423236'),(18,'admin','0003_logentry_add_action_flag_choices','2024-11-20 12:32:07.428228'),(19,'app','0002_filepdf_institution_policy_specialization_and_more','2024-11-20 12:32:07.854753'),(20,'app','0003_user_middle_name','2024-11-20 12:32:07.883940'),(21,'app','0004_alter_doctors_options_alter_researchresults_options_and_more','2024-11-20 12:32:07.958982'),(22,'app','0005_alter_policy_options_alter_specialization_options_and_more','2024-11-20 12:32:08.022561'),(23,'app','0006_records_date_record','2024-11-20 12:32:08.052564'),(24,'app','0007_rename_date_records_create_date_and_more','2024-11-20 12:32:08.080047'),(25,'app','0008_rename_create_date_records_date_create_and_more','2024-11-20 12:32:08.106823'),(26,'app','0009_records_name_records','2024-11-20 12:32:08.120949'),(27,'app','0010_alter_records_name_records','2024-11-20 12:32:08.128666'),(28,'app','0011_alter_records_date_create_alter_records_date_record_and_more','2024-11-20 12:32:08.161818'),(29,'app','0012_alter_records_name_records','2024-11-20 12:32:08.174832'),(30,'app','0013_remove_records_name_records','2024-11-20 12:32:08.189389'),(31,'app','0014_records_name_records','2024-11-20 12:32:08.206614'),(32,'app','0015_alter_direction_options_alter_doctorsreviews_options_and_more','2024-11-20 12:32:08.304572'),(33,'app','0016_alter_institution_address','2024-11-20 12:32:08.308331'),(34,'app','0017_alter_institution_address','2024-11-20 12:32:08.333361'),(35,'app','0018_alter_institution_address','2024-11-20 12:32:08.355276'),(36,'app','0019_user_confirmed','2024-11-20 12:32:08.388442'),(37,'app','0020_remove_user_confirmed_policy_confirmed','2024-11-20 12:32:08.432177'),(38,'app','0021_alter_specialization_specialization','2024-11-20 12:32:08.435056'),(39,'app','0022_alter_specialization_specialization','2024-11-20 12:32:08.445912'),(40,'app','0023_alter_specialization_specialization','2024-11-20 12:32:08.460892'),(41,'app','0024_alter_specialization_specialization','2024-11-20 12:32:08.470390'),(42,'app','0025_records_date_time','2024-11-20 12:32:08.483834'),(43,'app','0026_alter_filepdf_file_path','2024-11-20 12:32:08.486956'),(44,'app','0027_alter_filepdf_file_path','2024-11-20 12:32:08.489838'),(45,'app','0028_alter_records_date_record_alter_user_middle_name','2024-11-20 12:32:08.531925'),(46,'sessions','0001_initial','2024-11-20 12:32:08.550061');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-20 13:19:15
