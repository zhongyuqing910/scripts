-- MySQL dump 10.13  Distrib 5.5.49, for Win64 (x86)
--
-- Host: localhost    Database: oms
-- ------------------------------------------------------
-- Server version	5.5.49

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
-- Table structure for table `asset_hostlist`
--

DROP TABLE IF EXISTS `asset_hostlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_hostlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `hostname` varchar(30) NOT NULL,
  `product` varchar(20) NOT NULL,
  `application` varchar(20) NOT NULL,
  `idc_jg` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `remark` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_hostlist`
--

LOCK TABLES `asset_hostlist` WRITE;
/*!40000 ALTER TABLE `asset_hostlist` DISABLE KEYS */;
INSERT INTO `asset_hostlist` VALUES (1,'22.22.34.45','11','11','11','11','11','44444'),(2,'3','1113','2','44','55','66','2233344'),(3,'11.11.11.11','1114','2','44','55','66','3344'),(4,'5','1115','2','44','55','66','77'),(5,'6','1116','2','44','55','66','77'),(6,'7','1117','2','44','55','66','77'),(7,'8','1118','2','44','55','66','77'),(8,'9','1119','2','44','55','66','77'),(9,'10','1120','2','44','55','66','77'),(10,'11','1121','2','44','55','6666777889','11'),(11,'12','1122','2','44','55','66','77'),(12,'43','1123','2','44','55','66','77'),(13,'14','1124','2','44','55','66','77'),(14,'15','1125','2','44','55','66','77'),(15,'16','1126','2','44','55','66','77'),(16,'2','1112','2','44','55','66','77'),(17,'3','1113','2','44','55','66','77'),(18,'4','1114','2','44','55','66','77'),(19,'5','1115','2','44','55','66','77'),(20,'6','1116','2','44','55','66','77'),(21,'33','1117','2','44','55','66','77'),(22,'8','1118','2','44','55','66','77'),(23,'9','1119','2','44','55','66','77'),(24,'10','1120','2','44','55','66','77'),(25,'11','1121','2','44','55','66','77'),(26,'12','1122','2','44','55','66','77'),(27,'13','1123','2','44','55','66','77'),(28,'14','1124','2','44','55','66','77'),(29,'15','1125','2','44','55','66','77'),(30,'16','1126','2','44','55','66','77'),(31,'11','11','11','11','11','11','4321');
/*!40000 ALTER TABLE `asset_hostlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_idcasset`
--

DROP TABLE IF EXISTS `asset_idcasset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_idcasset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idc_name` varchar(20) NOT NULL,
  `idc_type` varchar(20) NOT NULL,
  `idc_location` varchar(30) NOT NULL,
  `contract_date` varchar(30) NOT NULL,
  `idc_contacts` varchar(30) NOT NULL,
  `remark` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_idcasset`
--

LOCK TABLES `asset_idcasset` WRITE;
/*!40000 ALTER TABLE `asset_idcasset` DISABLE KEYS */;
INSERT INTO `asset_idcasset` VALUES (1,'11','11','11','11','11','11');
/*!40000 ALTER TABLE `asset_idcasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_networkasset`
--

DROP TABLE IF EXISTS `asset_networkasset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_networkasset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `hostname` varchar(30) NOT NULL,
  `manufacturer` varchar(20) NOT NULL,
  `productname` varchar(20) NOT NULL,
  `idc_jg` varchar(10) NOT NULL,
  `service_tag` varchar(30) NOT NULL,
  `remark` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_tag` (`service_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_networkasset`
--

LOCK TABLES `asset_networkasset` WRITE;
/*!40000 ALTER TABLE `asset_networkasset` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_networkasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_serverasset`
--

DROP TABLE IF EXISTS `asset_serverasset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_serverasset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(20) NOT NULL,
  `productname` varchar(30) NOT NULL,
  `service_tag` varchar(80) NOT NULL,
  `cpu_model` varchar(50) NOT NULL,
  `cpu_nums` smallint(5) unsigned NOT NULL,
  `cpu_groups` smallint(5) unsigned NOT NULL,
  `mem` varchar(5) NOT NULL,
  `disk` varchar(5) NOT NULL,
  `raid` varchar(5) NOT NULL,
  `hostname` varchar(30) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `macaddress` varchar(40) NOT NULL,
  `os` varchar(20) NOT NULL,
  `virtual` varchar(20) NOT NULL,
  `idc_name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_tag` (`service_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_serverasset`
--

LOCK TABLES `asset_serverasset` WRITE;
/*!40000 ALTER TABLE `asset_serverasset` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_serverasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 用户信息管理',7,'add_users'),(20,'Can change 用户信息管理',7,'change_users'),(21,'Can delete 用户信息管理',7,'delete_users'),(22,'Can add 审计信息管理',8,'add_message'),(23,'Can change 审计信息管理',8,'change_message'),(24,'Can delete 审计信息管理',8,'delete_message'),(25,'Can add 主机列表管理',9,'add_hostlist'),(26,'Can change 主机列表管理',9,'change_hostlist'),(27,'Can delete 主机列表管理',9,'delete_hostlist'),(28,'Can add 主机资产信息',10,'add_serverasset'),(29,'Can change 主机资产信息',10,'change_serverasset'),(30,'Can delete 主机资产信息',10,'delete_serverasset'),(31,'Can add 网络设备资产信息',11,'add_networkasset'),(32,'Can change 网络设备资产信息',11,'change_networkasset'),(33,'Can delete 网络设备资产信息',11,'delete_networkasset'),(34,'Can add IDC资产信息',12,'add_idcasset'),(35,'Can change IDC资产信息',12,'change_idcasset'),(36,'Can delete IDC资产信息',12,'delete_idcasset'),(37,'Can add 装机列表',13,'add_systeminstall'),(38,'Can change 装机列表',13,'change_systeminstall'),(39,'Can delete 装机列表',13,'delete_systeminstall'),(40,'Can add 装机记录管理',14,'add_installrecord'),(41,'Can change 装机记录管理',14,'change_installrecord'),(42,'Can delete 装机记录管理',14,'delete_installrecord');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$4IuhUlSXLQvq$gEin5h+II8yo/iZM8Ii3DXykmIxZ17HW2GdVSqWgbBQ=','2016-12-05 07:51:30',1,'5050@qq.com','','','5050@qq.com',1,1,'2016-09-13 08:25:49');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(9,'asset','hostlist'),(12,'asset','idcasset'),(11,'asset','networkasset'),(10,'asset','serverasset'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(14,'installed','installrecord'),(13,'installed','systeminstall'),(8,'oms','message'),(7,'oms','users'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-07-13 18:19:22'),(2,'auth','0001_initial','2016-07-13 18:19:23'),(3,'admin','0001_initial','2016-07-13 18:19:24'),(4,'contenttypes','0002_remove_content_type_name','2016-07-13 18:19:24'),(5,'auth','0002_alter_permission_name_max_length','2016-07-13 18:19:24'),(6,'auth','0003_alter_user_email_max_length','2016-07-13 18:19:24'),(7,'auth','0004_alter_user_username_opts','2016-07-13 18:19:25'),(8,'auth','0005_alter_user_last_login_null','2016-07-13 18:19:25'),(9,'auth','0006_require_contenttypes_0002','2016-07-13 18:19:25'),(10,'sessions','0001_initial','2016-07-13 18:19:25');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('54kxyudp7g8gliqojfmp6e2h0lwe14fv','ZjFjMzA2YjE1MDM1MzQxMmRmYTU0ZTc5MTUyMTJiNzhkMDY4NjEzMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFlZDViNjVhOWU0MTEwZGE4M2Q2YTA3OTMxZWZjYzE3MDlhYTNjYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-27 08:25:59'),('6deja7ghegpnpeb9nbqhnxwuytiyasn3','ZjFjMzA2YjE1MDM1MzQxMmRmYTU0ZTc5MTUyMTJiNzhkMDY4NjEzMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFlZDViNjVhOWU0MTEwZGE4M2Q2YTA3OTMxZWZjYzE3MDlhYTNjYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-10-02 07:56:14'),('9lv6zjvbtdpdkz32a2eh2rruo8c26ha5','ZjFjMzA2YjE1MDM1MzQxMmRmYTU0ZTc5MTUyMTJiNzhkMDY4NjEzMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFlZDViNjVhOWU0MTEwZGE4M2Q2YTA3OTMxZWZjYzE3MDlhYTNjYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-12-19 07:51:30'),('np3zsc7md4i6swul8knaww6z6adskfbi','ZjFjMzA2YjE1MDM1MzQxMmRmYTU0ZTc5MTUyMTJiNzhkMDY4NjEzMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFlZDViNjVhOWU0MTEwZGE4M2Q2YTA3OTMxZWZjYzE3MDlhYTNjYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-12-06 08:14:37'),('qkkue6x1nomu4zlb0lcte8hd2hx0ulmt','ZjFjMzA2YjE1MDM1MzQxMmRmYTU0ZTc5MTUyMTJiNzhkMDY4NjEzMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFlZDViNjVhOWU0MTEwZGE4M2Q2YTA3OTMxZWZjYzE3MDlhYTNjYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-12-15 08:06:16'),('uuurtuo1d0mctvqy7mfxfkz6llr5yj8g','ZjFjMzA2YjE1MDM1MzQxMmRmYTU0ZTc5MTUyMTJiNzhkMDY4NjEzMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFlZDViNjVhOWU0MTEwZGE4M2Q2YTA3OTMxZWZjYzE3MDlhYTNjYWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-11-28 08:02:46');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installed_installrecord`
--

DROP TABLE IF EXISTS `installed_installrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `installed_installrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `install_date` varchar(20) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `system_version` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installed_installrecord`
--

LOCK TABLES `installed_installrecord` WRITE;
/*!40000 ALTER TABLE `installed_installrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `installed_installrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installed_systeminstall`
--

DROP TABLE IF EXISTS `installed_systeminstall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `installed_systeminstall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `hostname` varchar(30) NOT NULL,
  `macaddress` varchar(50) NOT NULL,
  `system_version` varchar(20) NOT NULL,
  `install_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installed_systeminstall`
--

LOCK TABLES `installed_systeminstall` WRITE;
/*!40000 ALTER TABLE `installed_systeminstall` DISABLE KEYS */;
/*!40000 ALTER TABLE `installed_systeminstall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_message`
--

DROP TABLE IF EXISTS `oms_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oms_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audit_time` datetime NOT NULL,
  `type` varchar(10) NOT NULL,
  `action` varchar(10) NOT NULL,
  `action_ip` varchar(15) NOT NULL,
  `content` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_message`
--

LOCK TABLES `oms_message` WRITE;
/*!40000 ALTER TABLE `oms_message` DISABLE KEYS */;
INSERT INTO `oms_message` VALUES (1,'2016-11-23 08:13:09','host','manage','[OperationalErr','主机信息更新'),(2,'2016-11-23 08:13:22','host','manage','[OperationalErr','主机信息更新'),(3,'2016-11-23 08:14:52','host','manage','[OperationalErr','主机信息更新'),(4,'2016-12-01 08:20:22','host','manage','[OperationalErr','主机信息更新'),(5,'2016-12-06 09:43:56','server','manage','扫描','录入[OperationalError(2003, \"Can\'t connect to MySQL '),(6,'2016-12-06 09:43:56','server','manage','扫描','录入[OperationalError(2003, \"Can\'t connect to MySQL ');
/*!40000 ALTER TABLE `oms_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_users`
--

DROP TABLE IF EXISTS `oms_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oms_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_users`
--

LOCK TABLES `oms_users` WRITE;
/*!40000 ALTER TABLE `oms_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `oms_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` char(255) NOT NULL,
  `salt` char(255) DEFAULT NULL,
  `pwd` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1111','2','1112'),('1111','3','1113'),('1111','4','1114'),('1111','5','1115'),('1111','6','1116'),('1111','7','1117'),('1111','8','1118'),('1111','9','1119'),('1111','10','1120'),('1111','11','1121'),('1111','12','1122'),('1111','13','1123'),('1111','14','1124'),('1111','15','1125'),('1111','16','1126');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user001`
--

DROP TABLE IF EXISTS `user001`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user001` (
  `username` char(255) NOT NULL,
  `salt` char(255) DEFAULT NULL,
  `pwd` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user001`
--

LOCK TABLES `user001` WRITE;
/*!40000 ALTER TABLE `user001` DISABLE KEYS */;
/*!40000 ALTER TABLE `user001` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-09 18:05:21
