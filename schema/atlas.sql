-- MySQL dump 10.16  Distrib 10.2.14-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: atlas
-- ------------------------------------------------------
-- Server version	10.2.14-MariaDB

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
-- Table structure for table `company_infos`
--

DROP TABLE IF EXISTS `company_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_code` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_name_la` varchar(255) NOT NULL,
  `established_date` date DEFAULT curdate(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_infos_id_uindex` (`id`),
  UNIQUE KEY `company_infos_company_name_uindex` (`company_name`),
  UNIQUE KEY `company_infos_company_name_la_uindex` (`company_name_la`),
  UNIQUE KEY `company_infos_company_code_uindex` (`company_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_infos`
--

LOCK TABLES `company_infos` WRITE;
INSERT INTO `company_infos` (`id`, `company_code`, `company_name`, `company_name_la`, `established_date`) VALUES (1,'LETTER-P','LETTER-P RESTAURANT ','LETTER-P RESTAURANT ','2018-10-22');
UNLOCK TABLES;

--
-- Table structure for table `currency_code`
--

DROP TABLE IF EXISTS `currency_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curr_code` varchar(3) NOT NULL,
  `curr_name` varchar(20) NOT NULL,
  `sign` char(1) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `curr_name_la` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_code_id_uindex` (`id`),
  UNIQUE KEY `currency_code_curr_name_uindex` (`curr_name`),
  UNIQUE KEY `currency_code_curr_code_uindex` (`curr_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_code`
--

LOCK TABLES `currency_code` WRITE;
INSERT INTO `currency_code` (`id`, `curr_code`, `curr_name`, `sign`, `country`, `curr_name_la`) VALUES (1,'418','LAK','₭','Laos','ກິບ'),(2,'840','USD','$','USA','ໂດລາ'),(4,'764','THB','฿','Thailand','ບາດ');
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_code` varchar(32) DEFAULT ucase(md5(uuid())),
  `id_card_no` varchar(16) DEFAULT NULL,
  `gender` char(1) NOT NULL COMMENT 'M as male, F as Female',
  `fullname` varchar(255) NOT NULL COMMENT 'format as "Name Surname"',
  `DateofBirth` date NOT NULL,
  `current_address` varchar(2000) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `photo` varchar(2000) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `enabled` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_id_uindex` (`id`),
  UNIQUE KEY `customers_fullname_uindex` (`fullname`),
  UNIQUE KEY `customers_mobile_uindex` (`mobile`),
  UNIQUE KEY `customers_id_card_no_uindex` (`id_card_no`),
  UNIQUE KEY `customers_customer_code_uindex` (`customer_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
INSERT INTO `customers` (`id`, `customer_code`, `id_card_no`, `gender`, `fullname`, `DateofBirth`, `current_address`, `mobile`, `photo`, `created_at`, `updated_at`, `enabled`) VALUES (7,'C25C6212D0A1B5E256185A68F4C21C2B','1234567890','M','Soulisack SAYYALINH','2018-11-19','Dongdok','020 55588857',NULL,'2018-11-20 01:35:29','2018-11-20 01:35:29',1),(8,'EE5F5345702587FD696F1A6AB8C34A72','1234567891','F','Guest female','2018-11-19','Dongdok','020 00000000',NULL,'2018-11-20 01:36:45','2018-11-20 01:36:45',1),(9,'FFE0428DCF456EFD9970A2925E6E02D3','1234567892','M','Guest male','2018-11-19','Dongdok','020 00000001',NULL,'2018-11-20 01:36:45','2018-11-20 01:36:45',1);
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_id` int(11) NOT NULL,
  `discount_percentage` float NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `discounts_id_uindex` (`id`),
  UNIQUE KEY `discounts_food_id_uindex` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
INSERT INTO `discounts` (`id`, `food_id`, `discount_percentage`, `created_at`, `updated_at`) VALUES (1,6,0.2,'2018-10-16 15:14:49','2018-10-16 15:14:49');
UNLOCK TABLES;

--
-- Table structure for table `food_categories`
--

DROP TABLE IF EXISTS `food_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_type_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `food_type_code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `food_categories_id_uindex` (`id`),
  UNIQUE KEY `food_categories_food_type_code_uindex` (`food_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_categories`
--

LOCK TABLES `food_categories` WRITE;
INSERT INTO `food_categories` (`id`, `food_type_name`, `created_at`, `updated_at`, `food_type_code`) VALUES (1,'food','2018-10-07 02:03:52','2018-10-07 02:03:52','food'),(2,'drink','2018-10-07 02:04:04','2018-10-07 02:04:04','drink');
UNLOCK TABLES;

--
-- Table structure for table `food_subtypes`
--

DROP TABLE IF EXISTS `food_subtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_subtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subtype_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `food_subtypes_id_uindex` (`id`),
  UNIQUE KEY `food_subtypes_subtype_name_uindex` (`subtype_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_subtypes`
--

LOCK TABLES `food_subtypes` WRITE;
INSERT INTO `food_subtypes` (`id`, `subtype_name`, `created_at`, `updated_at`) VALUES (5,'ທະເລ','2018-12-18 16:12:56','2018-12-18 16:12:56'),(6,'ໄກ່','2018-12-18 16:13:48','2018-12-18 16:13:48'),(7,'ງົວ','2018-12-18 16:14:21','2018-12-18 16:14:21'),(8,'ໝູ','2018-12-18 16:16:49','2018-12-18 16:16:49'),(9,'ແບ້','2018-12-18 16:24:46','2018-12-18 16:24:46');
UNLOCK TABLES;

--
-- Table structure for table `food_types`
--

DROP TABLE IF EXISTS `food_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_type` varchar(4) NOT NULL,
  `food_type_desc` varchar(255) NOT NULL,
  `food_type_desc_la` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `food_types_id_uindex` (`id`),
  UNIQUE KEY `food_types_food_type_uindex` (`food_type`),
  UNIQUE KEY `food_types_food_type_desc_uindex` (`food_type_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_types`
--

LOCK TABLES `food_types` WRITE;
INSERT INTO `food_types` (`id`, `food_type`, `food_type_desc`, `food_type_desc_la`) VALUES (1,'FOOD','Food','ອາຫານ'),(2,'DRNK','DRINK','ເຄື່ອງດື່ມ'),(3,'DSRT','Desert','ຂອງຫວານ'),(4,'SNCK','Snack','ອາຫານກິນຫຼິ້ນ'),(5,'SLD','Slard','ຕຳ');
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) NOT NULL,
  `photo` varchar(2000) DEFAULT NULL,
  `food_type_id` int(11) NOT NULL,
  `cost` double NOT NULL,
  `price` double NOT NULL,
  `currcode` varchar(3) NOT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(255) NOT NULL,
  `kid` int(11) NOT NULL,
  `food_subtype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `foods_id_uindex` (`id`),
  UNIQUE KEY `foods_food_name_uindex` (`food_name`),
  KEY `fk_food_type_id` (`food_type_id`),
  KEY `kid` (`kid`),
  KEY `foods_food_subtype_fk` (`food_subtype_id`),
  CONSTRAINT `fk_food_type_id` FOREIGN KEY (`food_type_id`) REFERENCES `food_types` (`id`),
  CONSTRAINT `foods_food_subtype_fk` FOREIGN KEY (`food_subtype_id`) REFERENCES `food_subtypes` (`id`),
  CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`kid`) REFERENCES `kitchens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2902 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
INSERT INTO `foods` (`id`, `food_name`, `photo`, `food_type_id`, `cost`, `price`, `currcode`, `enabled`, `created_at`, `updated_at`, `created_by`, `kid`, `food_subtype_id`) VALUES (2850,'ໄກ່ທອດ','index.jpg',4,7000,10000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2851,'ປີກໄກ່ທອດ ທາລິຍາກິ','index.jpg',4,18000,25000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2852,'ປີກໄກ່ທອດ ນ້ຳປາ','index.jpg',4,13000,20000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2853,'ປີກໄກ່ ບາບີຄິວ','index.jpg',4,18000,25000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2854,'ນັດເກັດໄກ່','index.jpg',4,10000,15000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2855,'ໄກ່ຈໍ້','index.jpg',4,10000,15000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2856,'ໄກ່ສະຕິກ','index.jpg',4,10000,15000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2857,'ຟິສສະຕິກ','index.jpg',4,10000,15000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2858,'ທອດເອັນໄກ່','index.jpg',4,18000,25000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2859,'ກຸ້ງຊຸບແປ້ງທອດ','index.jpg',4,20000,28000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2860,'ປາດອນລີ້ຊຸບແປ້ງທອດ','index.jpg',4,13000,20000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2861,'ລູກຊີ້ນ ຮັອດດ໋ອກທອດ','index.jpg',4,7000,12000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2862,'ເຟຮນຟາຍ','index.jpg',4,5000,9000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2863,'ຕຳໝາກຮຸ່ງ','index.jpg',5,8000,12000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2864,'ຕຳເຂົ້າປຸ້ນ','index.jpg',5,8000,12000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2865,'ຕຳຫອຍແຄງ','index.jpg',5,20000,28000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2866,'ຕຳປູ','index.jpg',5,20000,28000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2867,'ຕຳທະເລ','index.jpg',5,20000,28000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2868,'ຕຳຕ່ອນ','index.jpg',5,10000,15000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2869,'ຕຳມົ້ວ','index.jpg',5,8000,15000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2870,'ຕຳຫມີ່ໄວໄວ','index.jpg',5,8000,15000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2871,'ຍຳປາມຶກ','index.jpg',5,20000,28000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2872,'ຍຳລວມມິດທະເລ','index.jpg',5,20000,28000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2873,'ຍຳເສັ້ນລ້ອນ','index.jpg',5,15000,22000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2874,'ຍຳໄວໄວ','index.jpg',5,10000,18000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2875,'ເຂົ້າອົບຫມໍ້ດິນ 7 ຈັກກະພັດ','index.jpg',1,70000,95000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2876,'ເຂົ້າອົບຫມໍ້ດິນ ຮ່ອງເຕ້','index.jpg',1,20000,32000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2877,'ເຂົ້າອົບຫມໍ້ດິນ ຊົງເຄື່ອງ','index.jpg',1,10000,16000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2878,'ເຂົ້າອົບຫມໍ້ດິນ ໃສ້ກອກຫວານ','index.jpg',1,10000,16000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2879,'ເຂົ້າມັນໄກ່ທອດ','index.jpg',1,10000,16000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2880,'ເຂົ້າມັນໄກ່ຕົ້ມ','19722.jpg',1,10000,16000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2881,'ເຂົ້າຫມູກະທຽມ','index.jpg',1,10000,16000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2882,'ເຂົ້າ ຜັກບົ້ງໄຟແດງ','index.jpg',1,8000,16000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2883,'ເຂົ້າ ແກງຈືດເຕົ້າຮູ້ຫມູສັບ','index.jpg',1,13000,18000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2884,'ເຂົ້າໄຂ່ຈຽວ ຫມູສັບ','index.jpg',1,10000,16000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2885,'ເຂົ້າຫມູພິກໄທດຳ','index.jpg',1,10000,16000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2886,'ເຂົ້າກະເພົາ - ໄກ່,ຫມູ,ຫມູກອບ','index.jpg',1,10000,16000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2887,'ເຂົ້າກະເພົາກອບ - ໄກ່,ຫມູ,ຫມູກອບ','index.jpg',1,10000,16000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2888,'ເຂົ້າຜັກກາດນາ - ໄກ່,ຫມູ,ຫມູກອບ','index.jpg',1,10000,16000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2889,'ເຂົ້າຖົ່ວລັນເຕົາຜັດ - ໄກ່,ຫມູ,ຫມູກອບ','index.jpg',1,10000,16000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2890,'ເຂົ້າຜັດ - ໄກ່,ຫມູ,ຫມູກອບ','index.jpg',1,10000,16000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2891,'ເຂົ້າ ຜັດຂີ້ເມົາ - ໄກ່,ຫມູ,ຫມູກອບ','index.jpg',1,10000,16000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2892,'ເຂົ້າ ຜັດຊ່າ - ໄກ່,ຫມູ,ຫມູກອບ','index.jpg',1,10000,16000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2893,'ເຂົ້າ ຕົ້ມຍຳ - ໄກ່,ຫມູ,ຫມູກອບ','index.jpg',1,10000,16000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2894,'ເຂົ້າກະເພົາ - ງົວ,ທະເລ','index.jpg',1,13000,18000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2895,'ເຂົ້າກະເພົາກອບ - ງົວ,ທະເລ','index.jpg',1,13000,18000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2896,'ເຂົ້າຜັກກາດນາ - ງົວ,ທະເລ','index.jpg',1,13000,18000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2897,'ເຂົ້າຖົ່ວລັນເຕົາຜັດ - ງົວ,ທະເລ','index.jpg',1,13000,18000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2898,'ເຂົ້າຜັດ - ງົວ,ທະເລ','index.jpg',1,13000,18000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2899,'ເຂົ້າ ຜັດຂີ້ເມົາ - ງົວ,ທະເລ','index.jpg',1,13000,18000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2900,'ເຂົ້າ ຜັດຊ່າ - ງົວ,ທະເລ','index.jpg',1,13000,18000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL),(2901,'ເຂົ້າ ຕົ້ມຍຳ - ງົວ,ທະເລ','index.jpg',1,13000,18000,'418',1,'2018-12-14 15:23:35','2018-12-14 15:23:35','admin',3,NULL);
UNLOCK TABLES;

--
-- Table structure for table `kitchens`
--

DROP TABLE IF EXISTS `kitchens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kitchens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kitchen_code` varchar(20) NOT NULL,
  `kitchen_name` varchar(255) NOT NULL,
  `responsibility_user` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kitchens_id_uindex` (`id`),
  UNIQUE KEY `kitchens_kitchen_code_uindex` (`kitchen_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitchens`
--

LOCK TABLES `kitchens` WRITE;
INSERT INTO `kitchens` (`id`, `kitchen_code`, `kitchen_name`, `responsibility_user`) VALUES (3,'kitchen001','Out Side kitchen','Chef-01'),(4,'kitchen002','Inside Kitchen','Chef-02');
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) NOT NULL,
  `menu_link` varchar(255) NOT NULL,
  `menu_icon` varchar(255) NOT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_id_uindex` (`id`),
  UNIQUE KEY `menus_menu_name_uindex` (`menu_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
INSERT INTO `menus` (`id`, `menu_name`, `menu_link`, `menu_icon`, `enabled`) VALUES (1,'Home','/','home',1),(2,'Sales','sale','shopping_cart',1),(3,'Terminals','terminal','dns',1),(4,'POS','pos','credit_card',1),(5,'Food','food','fastfood',1),(6,'Reports','report','report',1),(7,'Administator','administrator','settings',1),(8,'Order Tracking','tracking','done',1),(9,'Users management','users','verified_user',1),(10,'Kitchen monitor','kitchenmon','kitchen',1),(11,'foods','foods','fastfood',1);
UNLOCK TABLES;

--
-- Table structure for table `order_cash_records`
--

DROP TABLE IF EXISTS `order_cash_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_cash_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) NOT NULL,
  `total` double NOT NULL,
  `recieved` double NOT NULL,
  `changeAmt` double DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_cash_records_id_uindex` (`id`),
  UNIQUE KEY `order_cash_records_order_id_uindex` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_cash_records`
--

LOCK TABLES `order_cash_records` WRITE;
INSERT INTO `order_cash_records` (`id`, `order_id`, `total`, `recieved`, `changeAmt`, `created_at`) VALUES (32,'00CE02C7B7FC4CC56A168D78D5EBDCF5',15000,20000,5000,'2018-12-12 10:01:18'),(33,'EAF18D973F7BCE95949C5B40D921B08E',15000,20000,5000,'2018-12-12 11:41:41'),(34,'6C0DCEBCEF9393242EEB1903204F9FAF',15000,20000,5000,'2018-12-13 09:54:08'),(35,'48019B4FCBFB016798F54C32408D4078',15000,20000,5000,'2018-12-13 10:53:40'),(36,'94E5EC76B7D62E49C752D8440D5AFC90',79000,0,0,'2018-12-14 19:26:41'),(37,'2495DD4B09CAF7489E7C442AF9A47E7D',16000,20000,4000,'2018-12-18 12:35:52'),(38,'3FBE8B61C7B9CF0D2E81E58E5AE89958',16000,20000,4000,'2018-12-18 14:11:37'),(39,'1F83DD456488FD099964AFE51F21BEE8',16000,20000,4000,'2018-12-18 14:22:14');
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) DEFAULT NULL,
  `food_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_details_id_uindex` (`id`),
  KEY `order_id___fk` (`order_id`),
  CONSTRAINT `order_id___fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
INSERT INTO `order_details` (`id`, `order_id`, `food_id`, `quantity`, `total`, `note`, `created_at`) VALUES (210,'00CE02C7B7FC4CC56A168D78D5EBDCF5',92,1,15000,'ບໍ່ຫວານ','2018-12-12 10:01:18'),(211,'EAF18D973F7BCE95949C5B40D921B08E',92,1,15000,'undefined','2018-12-12 11:41:41'),(212,'6C0DCEBCEF9393242EEB1903204F9FAF',92,1,15000,'ບໍ່ຫວານ','2018-12-13 09:54:08'),(213,'48019B4FCBFB016798F54C32408D4078',92,1,15000,'ບໍ່ຫວານ','2018-12-13 10:53:40'),(214,'94E5EC76B7D62E49C752D8440D5AFC90',2878,1,16000,'undefined','2018-12-14 19:26:41'),(215,'94E5EC76B7D62E49C752D8440D5AFC90',2883,1,18000,'undefined','2018-12-14 19:26:41'),(216,'94E5EC76B7D62E49C752D8440D5AFC90',2858,1,25000,'undefined','2018-12-14 19:26:41'),(217,'94E5EC76B7D62E49C752D8440D5AFC90',2852,1,20000,'undefined','2018-12-14 19:26:41'),(218,'2495DD4B09CAF7489E7C442AF9A47E7D',2880,1,16000,'undefined','2018-12-18 12:35:52'),(219,'3FBE8B61C7B9CF0D2E81E58E5AE89958',2880,1,16000,'undefined','2018-12-18 14:11:37'),(220,'1F83DD456488FD099964AFE51F21BEE8',2877,1,16000,'undefined','2018-12-18 14:22:14');
UNLOCK TABLES;

--
-- Table structure for table `order_trackings`
--

DROP TABLE IF EXISTS `order_trackings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_trackings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) NOT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  `position` varchar(255) NOT NULL,
  `starttime` timestamp NOT NULL DEFAULT current_timestamp(),
  `finishtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `done` tinyint(1) NOT NULL DEFAULT 0,
  `emp_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_trackings_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_trackings`
--

LOCK TABLES `order_trackings` WRITE;
INSERT INTO `order_trackings` (`id`, `order_id`, `order_status`, `position`, `starttime`, `finishtime`, `done`, `emp_id`) VALUES (40,'00CE02C7B7FC4CC56A168D78D5EBDCF5','DELIVERED','FRONT COUNTER','2018-12-12 03:01:18','2018-12-13 02:43:11',1,'EA0E7B97B280848A97125C896DEBFD9E'),(41,'EAF18D973F7BCE95949C5B40D921B08E','DELIVERED','FRONT COUNTER','2018-12-12 04:41:41','2018-12-12 07:26:41',1,'E4F43B3284BF3F9065CC5EB6A46F2514'),(42,'6C0DCEBCEF9393242EEB1903204F9FAF','DELIVERED','FRONT COUNTER','2018-12-13 02:54:08','2018-12-13 03:51:07',1,'E4F43B3284BF3F9065CC5EB6A46F2514'),(43,'48019B4FCBFB016798F54C32408D4078','CANCELLED','FRONT COUNTER','2018-12-13 03:53:40','2018-12-18 05:33:45',2,'E4F43B3284BF3F9065CC5EB6A46F2514'),(44,'94E5EC76B7D62E49C752D8440D5AFC90','DELIVERED','FRONT COUNTER','2018-12-14 12:26:41','2018-12-18 07:38:03',1,'E4F43B3284BF3F9065CC5EB6A46F2514'),(45,'2495DD4B09CAF7489E7C442AF9A47E7D','IN PROGRESS','IN KITCHEN','2018-12-18 05:35:52','0000-00-00 00:00:00',0,'E4F43B3284BF3F9065CC5EB6A46F2514'),(46,'3FBE8B61C7B9CF0D2E81E58E5AE89958','DELIVERED','FRONT COUNTER','2018-12-18 07:11:37','2018-12-18 07:38:07',1,'E4F43B3284BF3F9065CC5EB6A46F2514'),(47,'1F83DD456488FD099964AFE51F21BEE8','DELIVERED','FRONT COUNTER','2018-12-18 07:22:14','2018-12-18 07:38:06',1,'E4F43B3284BF3F9065CC5EB6A46F2514');
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) NOT NULL,
  `transaction_id` varchar(32) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `customer_code` varchar(32) NOT NULL,
  `total` double NOT NULL,
  `discount` double NOT NULL,
  `tax` double NOT NULL,
  `grandtotal` double NOT NULL,
  `recipt_printed` tinyint(1) NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `qtag` int(11) NOT NULL,
  `user_code` varchar(32) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `terminal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_id_uindex` (`id`),
  UNIQUE KEY `orders_order_id_uindex` (`order_id`),
  UNIQUE KEY `orders_transaction_id_uindex` (`transaction_id`),
  KEY `customer_code__fk` (`customer_code`),
  KEY `orders_terminal_fk` (`terminal_id`),
  CONSTRAINT `customer_code__fk` FOREIGN KEY (`customer_code`) REFERENCES `customers` (`customer_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_terminal_fk` FOREIGN KEY (`terminal_id`) REFERENCES `terminals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
INSERT INTO `orders` (`id`, `order_id`, `transaction_id`, `order_date`, `customer_code`, `total`, `discount`, `tax`, `grandtotal`, `recipt_printed`, `paid`, `qtag`, `user_code`, `created_at`, `terminal_id`) VALUES (156,'00CE02C7B7FC4CC56A168D78D5EBDCF5','E5EF50C24B615F45F289C6E7791BBD0C','2018-12-12 10:01:18','EE5F5345702587FD696F1A6AB8C34A72',15000,0,0,15000,1,1,1,'E4F43B3284BF3F9065CC5EB6A46F2514','2018-12-12 10:01:18',1),(157,'EAF18D973F7BCE95949C5B40D921B08E','2FEB8962C526922C59C150068DB5C031','2018-12-12 11:41:41','EE5F5345702587FD696F1A6AB8C34A72',15000,0,0,15000,1,1,2,'E4F43B3284BF3F9065CC5EB6A46F2514','2018-12-12 11:41:41',1),(158,'6C0DCEBCEF9393242EEB1903204F9FAF','D48175AF524AFB61ADBC2564401C4195','2018-12-13 09:54:08','FFE0428DCF456EFD9970A2925E6E02D3',15000,0,0,15000,1,1,1,'E4F43B3284BF3F9065CC5EB6A46F2514','2018-12-13 09:54:08',1),(159,'48019B4FCBFB016798F54C32408D4078','4EC8085C76F4372967A86222741E9672','2018-12-13 10:53:40','FFE0428DCF456EFD9970A2925E6E02D3',15000,0,0,15000,1,1,6,'E4F43B3284BF3F9065CC5EB6A46F2514','2018-12-13 10:53:40',1),(160,'94E5EC76B7D62E49C752D8440D5AFC90','29D6B37EA5315C4742C142920A80001B','2018-12-14 19:26:41','FFE0428DCF456EFD9970A2925E6E02D3',79000,0,0,79000,1,1,1,'E4F43B3284BF3F9065CC5EB6A46F2514','2018-12-14 19:26:41',1),(161,'2495DD4B09CAF7489E7C442AF9A47E7D','36E7DBCDB0386F82C3536EF4C01B1A96','2018-12-18 12:35:52','EE5F5345702587FD696F1A6AB8C34A72',16000,0,0,16000,1,1,5,'E4F43B3284BF3F9065CC5EB6A46F2514','2018-12-18 12:35:52',1),(162,'3FBE8B61C7B9CF0D2E81E58E5AE89958','47492864C2DB6B757FDF90E6DCB5B0B5','2018-12-18 14:11:37','FFE0428DCF456EFD9970A2925E6E02D3',16000,0,0,16000,1,1,8,'E4F43B3284BF3F9065CC5EB6A46F2514','2018-12-18 14:11:37',1),(163,'1F83DD456488FD099964AFE51F21BEE8','C815147AC44C3EED9E9669E6B664836C','2018-12-18 14:22:14','FFE0428DCF456EFD9970A2925E6E02D3',16000,0,0,16000,1,1,3,'E4F43B3284BF3F9065CC5EB6A46F2514','2018-12-18 14:22:14',1);
UNLOCK TABLES;

--
-- Table structure for table `qtags`
--

DROP TABLE IF EXISTS `qtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qtags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qtags_id_uindex` (`id`),
  UNIQUE KEY `qtags_tag_uindex` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qtags`
--

LOCK TABLES `qtags` WRITE;
INSERT INTO `qtags` (`id`, `tag`, `status`) VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,0),(6,6,1),(19,7,1),(20,8,1),(21,9,1),(22,10,1),(23,11,1),(24,12,1),(25,13,1),(26,14,1),(27,15,1),(28,16,1),(29,17,1),(30,18,1),(31,19,1),(32,20,1);
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(20) NOT NULL,
  `role_name` varchar(20) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_id_uindex` (`id`),
  UNIQUE KEY `roles_role_code_uindex` (`role_code`),
  UNIQUE KEY `roles_role_name_uindex` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
INSERT INTO `roles` (`id`, `role_code`, `role_name`, `enabled`, `created_at`, `updated_at`) VALUES (1,'ADMIN','ADMINISTRATOR',1,'2018-10-07 01:37:02','2018-10-07 01:37:02'),(2,'GUEST','GUEST',1,'2018-10-07 01:37:13','2018-10-07 01:37:13'),(3,'CHEF','Chef',1,'2018-10-07 01:38:06','2018-10-07 01:38:06'),(5,'STAFF','STAFF',1,'2018-10-07 01:38:44','2018-10-07 01:38:44'),(6,'POS','POS',1,'2018-11-25 23:21:19','2018-11-25 23:21:19');
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_date` datetime DEFAULT current_timestamp(),
  `food_id` int(11) NOT NULL,
  `transaction_id` varchar(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `total` double GENERATED ALWAYS AS (`quantity` * `price`) VIRTUAL,
  `discount_percentage` float NOT NULL DEFAULT 0,
  `discount` float GENERATED ALWAYS AS (`total` * `discount_percentage`) VIRTUAL,
  `grand_total` double GENERATED ALWAYS AS (`total` - `discount`) VIRTUAL,
  `user_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_id_uindex` (`id`),
  UNIQUE KEY `sales_transaction_id_uindex` (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `terminals`
--

DROP TABLE IF EXISTS `terminals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terminals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `terminal_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `terminals_id_uindex` (`id`),
  UNIQUE KEY `terminals_terminal_name_uindex` (`terminal_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminals`
--

LOCK TABLES `terminals` WRITE;
INSERT INTO `terminals` (`id`, `terminal_name`, `created_at`) VALUES (1,'Front POS No1','2018-12-04 13:31:10');
UNLOCK TABLES;

--
-- Table structure for table `tranx_role_menu`
--

DROP TABLE IF EXISTS `tranx_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tranx_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(20) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tranx_role_menu_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tranx_role_menu`
--

LOCK TABLES `tranx_role_menu` WRITE;
INSERT INTO `tranx_role_menu` (`id`, `role_code`, `menu_id`) VALUES (1,'ADMIN',1),(4,'ADMIN',2),(5,'ADMIN',3),(6,'ADMIN',4),(7,'ADMIN',5),(8,'ADMIN',6),(9,'ADMIN',7),(10,'ADMIN',8),(12,'ADMIN',9),(13,'ADMIN',10),(14,'STAFF',4),(15,'STAFF',8),(16,'CHEF',8),(17,'CHEF',10);
UNLOCK TABLES;

--
-- Table structure for table `user_audits`
--

DROP TABLE IF EXISTS `user_audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_audits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(32) NOT NULL,
  `activities` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_audits_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_audits`
--

LOCK TABLES `user_audits` WRITE;
INSERT INTO `user_audits` (`id`, `emp_id`, `activities`, `created_at`) VALUES (2,'E4F43B3284BF3F9065CC5EB6A46F2514','delete food id85','2018-12-09 03:00:21'),(3,'E4F43B3284BF3F9065CC5EB6A46F2514','delete food id : 86','2018-12-09 03:00:51'),(5,'E4F43B3284BF3F9065CC5EB6A46F2514','delete food id : 87','2018-12-09 03:04:07'),(7,'E4F43B3284BF3F9065CC5EB6A46F2514','delete food id : 88','2018-12-09 03:06:48'),(8,'E4F43B3284BF3F9065CC5EB6A46F2514','Add new food : Choco milk','2018-12-09 03:07:15'),(9,'62157474EA8557254F6DF73352282698','First time login and change password ','2018-12-10 00:58:04'),(10,'62157474EA8557254F6DF73352282698','Make Order order raw : [object Object]','2018-12-10 01:10:40'),(11,'62157474EA8557254F6DF73352282698','Make Order order on POS module','2018-12-10 01:15:21'),(12,'62157474EA8557254F6DF73352282698','Update Order Cancelled order id : AF22D679719D994601BC458D24F8CFE9','2018-12-10 01:23:16'),(13,'62157474EA8557254F6DF73352282698','Update Order Cancelled order id : DD2902F999503ECA73458E3106E41946','2018-12-10 01:23:19'),(14,'62157474EA8557254F6DF73352282698','Update Order completed and send to customer order id : 9D05A8FE082715E23DB3627330AF8D56','2018-12-10 01:23:23'),(15,'62157474EA8557254F6DF73352282698','Update Order completed and send to customer order id : 1F4C330C0FA14C7733A68378D56C34A3','2018-12-10 01:23:24'),(16,'aliasosx','User login fail attempt','2018-12-10 01:28:52'),(17,'aliasosx','User login fail attempt','2018-12-10 01:29:09'),(18,'aliasosx','User login fail attempt','2018-12-10 01:33:19'),(19,'E4F43B3284BF3F9065CC5EB6A46F2514','User logout','2018-12-10 01:49:11'),(20,'E4F43B3284BF3F9065CC5EB6A46F2514','User logout','2018-12-10 01:53:46'),(21,'E4F43B3284BF3F9065CC5EB6A46F2514','User logout','2018-12-10 01:54:59'),(22,'E4F43B3284BF3F9065CC5EB6A46F2514','User logout','2018-12-10 02:04:07'),(23,'E4F43B3284BF3F9065CC5EB6A46F2514','User logout','2018-12-10 02:12:52'),(24,'E4F43B3284BF3F9065CC5EB6A46F2514','User logout','2018-12-10 02:15:23'),(25,'27B24F36B77049351B34F741435B6ABF','User logout','2018-12-10 11:01:55'),(26,'E4F43B3284BF3F9065CC5EB6A46F2514','User logout','2018-12-10 11:04:18'),(27,'E4F43B3284BF3F9065CC5EB6A46F2514','User logout','2018-12-10 11:05:02'),(28,'E4F43B3284BF3F9065CC5EB6A46F2514','Make Order order on POS module','2018-12-10 11:23:24'),(29,'E4F43B3284BF3F9065CC5EB6A46F2514','Update Order Cancelled order id : 326C02841DDE80DF606D64A89D4295A2','2018-12-10 11:26:51'),(30,'E4F43B3284BF3F9065CC5EB6A46F2514','Add new food : ນໍ້າໝາກມ່ວງ','2018-12-10 13:16:39'),(31,'E4F43B3284BF3F9065CC5EB6A46F2514','User logout','2018-12-10 13:39:30'),(32,'E4F43B3284BF3F9065CC5EB6A46F2514','Make Order order on POS module','2018-12-10 22:38:02'),(33,'E4F43B3284BF3F9065CC5EB6A46F2514','Add new food : ໄກ່ທອດ','2018-12-10 23:08:27'),(34,'E4F43B3284BF3F9065CC5EB6A46F2514','Update Order completed and send to customer order id : 764C558B4CABE2F1563A8C476F86A3A5','2018-12-11 01:16:10'),(35,'E4F43B3284BF3F9065CC5EB6A46F2514','Make Order order on POS module','2018-12-11 01:23:33'),(36,'E4F43B3284BF3F9065CC5EB6A46F2514','Make Order order on POS module','2018-12-11 01:28:14'),(37,'E4F43B3284BF3F9065CC5EB6A46F2514','Make Order order on POS module','2018-12-11 15:32:04'),(38,'E4F43B3284BF3F9065CC5EB6A46F2514','Add new food : ນຳ້ໝາກມ່ວງ','2018-12-12 09:57:25'),(39,'E4F43B3284BF3F9065CC5EB6A46F2514','Make Order order on POS module','2018-12-12 09:58:31'),(40,'E4F43B3284BF3F9065CC5EB6A46F2514','Make Order order on POS module','2018-12-12 10:01:13'),(41,'E4F43B3284BF3F9065CC5EB6A46F2514','Make Order order on POS module','2018-12-12 10:01:18'),(42,'E4F43B3284BF3F9065CC5EB6A46F2514','Make Order order on POS module','2018-12-12 11:41:41'),(43,'E4F43B3284BF3F9065CC5EB6A46F2514','User logout','2018-12-12 13:40:46'),(44,'E4F43B3284BF3F9065CC5EB6A46F2514','Update Order completed and send to customer order id : EAF18D973F7BCE95949C5B40D921B08E','2018-12-12 14:26:42'),(45,'E4F43B3284BF3F9065CC5EB6A46F2514','User logout','2018-12-13 09:33:17'),(46,'EA0E7B97B280848A97125C896DEBFD9E','First time login and change password ','2018-12-13 09:33:37'),(47,'EA0E7B97B280848A97125C896DEBFD9E','User logout','2018-12-13 09:33:41'),(48,'EA0E7B97B280848A97125C896DEBFD9E','Update Order completed and send to customer order id : 00CE02C7B7FC4CC56A168D78D5EBDCF5','2018-12-13 09:43:11'),(49,'EA0E7B97B280848A97125C896DEBFD9E','User logout','2018-12-13 09:53:29'),(50,'E4F43B3284BF3F9065CC5EB6A46F2514','Make Order order on POS module','2018-12-13 09:54:08'),(51,'E4F43B3284BF3F9065CC5EB6A46F2514','Update Order completed and send to customer order id : 6C0DCEBCEF9393242EEB1903204F9FAF','2018-12-13 10:51:08'),(52,'E4F43B3284BF3F9065CC5EB6A46F2514','Make Order order on POS module','2018-12-13 10:53:40'),(53,'E4F43B3284BF3F9065CC5EB6A46F2514','Make Order order on POS module','2018-12-14 19:26:41'),(54,'E4F43B3284BF3F9065CC5EB6A46F2514','Update Order Cancelled order id : 48019B4FCBFB016798F54C32408D4078','2018-12-18 12:33:45'),(55,'E4F43B3284BF3F9065CC5EB6A46F2514','Make Order order on POS module','2018-12-18 12:35:52'),(56,'E4F43B3284BF3F9065CC5EB6A46F2514','Make Order order on POS module','2018-12-18 14:11:37'),(57,'E4F43B3284BF3F9065CC5EB6A46F2514','Make Order order on POS module','2018-12-18 14:22:14'),(58,'E4F43B3284BF3F9065CC5EB6A46F2514','Update Order completed and send to customer order id : 94E5EC76B7D62E49C752D8440D5AFC90','2018-12-18 14:38:03'),(59,'E4F43B3284BF3F9065CC5EB6A46F2514','Update Order completed and send to customer order id : 1F83DD456488FD099964AFE51F21BEE8','2018-12-18 14:38:06'),(60,'E4F43B3284BF3F9065CC5EB6A46F2514','Update Order completed and send to customer order id : 3FBE8B61C7B9CF0D2E81E58E5AE89958','2018-12-18 14:38:07');
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `fullname` varchar(500) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT 'http://localhost:5000/images/uploads/users/21104.svg',
  `dateofbirth` date DEFAULT NULL,
  `current_address` varchar(500) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `password` varchar(70) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `role_code` varchar(20) NOT NULL,
  `emp_id` varchar(32) NOT NULL DEFAULT ucase(md5(uuid())),
  `first_login` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_id_uindex` (`id`),
  UNIQUE KEY `users_username_uindex` (`username`),
  UNIQUE KEY `users_email_uindex` (`email`),
  UNIQUE KEY `users_emp_id_uindex` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
INSERT INTO `users` (`id`, `username`, `gender`, `fullname`, `email`, `photo`, `dateofbirth`, `current_address`, `mobile`, `password`, `enabled`, `created_at`, `updated_at`, `role_code`, `emp_id`, `first_login`) VALUES (64,'admin','M','Soulisack SAYYALINH','sayyalinh@gmail.com','21104.svg','2018-11-05','dongdok','02055588857','$2b$10$AYlGbhNUtNZk7Q1Ygp.FBu6li3s5N/xpb53Lq04tSDYRgnbCwC5IG',1,'2018-10-07 00:10:38','2018-10-07 00:10:38','ADMIN','E4F43B3284BF3F9065CC5EB6A46F2514',0),(68,'pathana','F','Pathana THIENKHUN','pathana@gmail.com','21104.svg','2018-11-06','dongdok','02056789333','$2b$10$AYlGbhNUtNZk7Q1Ygp.FBu6li3s5N/xpb53Lq04tSDYRgnbCwC5IG',1,'2018-11-27 23:17:03','2018-11-27 23:17:03','ADMIN','27B24F36B77049351B34F741435B6ABF',0),(83,'oung','F','oung','oung@gmail.com','user-female-circle-filled.png','2018-12-11','dongdok road','+856205600772','$2b$10$ZUN7yI0bTw5S.FEfv7aMi.8qTJ7EwVQtNwV.81/3aCRznulx8sNi6',1,'2018-12-13 09:33:14','2018-12-13 09:33:14','CHEF','EA0E7B97B280848A97125C896DEBFD9E',0);
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-18 16:55:06
