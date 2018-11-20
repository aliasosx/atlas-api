-- MySQL dump 10.16  Distrib 10.3.10-MariaDB, for osx10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: atlas
-- ------------------------------------------------------
-- Server version	10.3.10-MariaDB

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
/*!40000 ALTER TABLE `company_infos` DISABLE KEYS */;
INSERT INTO `company_infos` VALUES (1,'LETTER-P','LETTER-P RESTAURANT ','LETTER-P RESTAURANT ','2018-10-22');
/*!40000 ALTER TABLE `company_infos` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `currency_code` DISABLE KEYS */;
INSERT INTO `currency_code` VALUES (1,'418','LAK','₭','Laos','ກິບ'),(2,'840','USD','$','USA','ໂດລາ'),(4,'764','THB','฿','Thailand','ບາດ');
/*!40000 ALTER TABLE `currency_code` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (7,'C25C6212D0A1B5E256185A68F4C21C2B','1234567890','M','Soulisack SAYYALINH','2018-11-19','Dongdok','020 55588857',NULL,'2018-11-20 01:35:29','2018-11-20 01:35:29',1),(8,'EE5F5345702587FD696F1A6AB8C34A72','1234567891','F','Guest female','2018-11-19','Dongdok','020 00000000',NULL,'2018-11-20 01:36:45','2018-11-20 01:36:45',1),(9,'FFE0428DCF456EFD9970A2925E6E02D3','1234567892','M','Guest male','2018-11-19','Dongdok','020 00000001',NULL,'2018-11-20 01:36:45','2018-11-20 01:36:45',1);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,6,0.2,'2018-10-16 15:14:49','2018-10-16 15:14:49');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `food_categories` DISABLE KEYS */;
INSERT INTO `food_categories` VALUES (1,'food','2018-10-07 02:03:52','2018-10-07 02:03:52','food'),(2,'drink','2018-10-07 02:04:04','2018-10-07 02:04:04','drink');
/*!40000 ALTER TABLE `food_categories` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_types`
--

LOCK TABLES `food_types` WRITE;
/*!40000 ALTER TABLE `food_types` DISABLE KEYS */;
INSERT INTO `food_types` VALUES (1,'FOOD','Food','ອາຫານ'),(2,'DRNK','DRINK','ເຄື່ອງດື່ມ'),(3,'DSRT','Desert','ຂອງຫວານ');
/*!40000 ALTER TABLE `food_types` ENABLE KEYS */;
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
  `photo` varchar(2000) NOT NULL,
  `food_type_id` int(11) NOT NULL,
  `cost` double NOT NULL,
  `price` double NOT NULL,
  `currcode` varchar(3) NOT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(255) NOT NULL,
  `kid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `foods_id_uindex` (`id`),
  UNIQUE KEY `foods_food_name_uindex` (`food_name`),
  KEY `fk_food_type_id` (`food_type_id`),
  KEY `kid` (`kid`),
  CONSTRAINT `fk_food_type_id` FOREIGN KEY (`food_type_id`) REFERENCES `food_types` (`id`),
  CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`kid`) REFERENCES `kitchens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (52,'ໄກ່ທອດ','http://localhost:5000/images/uploads/foods/0146481.jpg',1,10000,15000,'418',1,'2018-11-08 16:24:48','2018-11-08 16:24:48','ADMIN',3),(62,'ຊາໄຂ່ມຸກ','http://localhost:5000/images/uploads/foods/26239959_728048127384692_7141641406092480732_o.jpg',2,8000,10000,'418',1,'2018-11-09 00:08:45','2018-11-09 00:08:45','ADMIN',4),(63,'ກຸ້ງທອດກອບ','http://localhost:5000/images/uploads/foods/fried-shrimp-png.png',1,10000,15000,'418',1,'2018-11-17 00:56:50','2018-11-17 00:56:50','ADMIN',3),(64,'ບິງຊູ','http://localhost:5000/images/uploads/foods/kisspng-kakigri-sulbing-harajuku-sorbic-sendai-strawberr-5b180e60944319.2537494815283032006073.png',3,30000,40000,'418',1,'2018-11-17 22:20:12','2018-11-17 22:20:12','ADMIN',4),(66,'ນຳ້ສົ້ມ','http://localhost:5000/images/uploads/foods/pngtree-hand-painted-cartoon-vector-orange-juice-orange-juice-png-clipart_2736099.jpg',2,10000,15000,'418',1,'2018-11-18 19:32:39','2018-11-18 19:32:39','ADMIN',4),(67,'ມັນທອດ','http://localhost:5000/images/uploads/foods/rsz_potato.jpg',1,8000,10000,'418',1,'2018-11-20 09:48:49','2018-11-20 09:48:49','ADMIN',3);
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `kitchens` DISABLE KEYS */;
INSERT INTO `kitchens` VALUES (3,'kitchen001','Out Side kitchen','Chef-01'),(4,'kitchen002','Inside Kitchen','Chef-02');
/*!40000 ALTER TABLE `kitchens` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Home','/','home',1),(2,'Sales','/sale','shopping_cart',1),(3,'Terminals','/terminal','dns',1),(4,'POS','pos','credit_card',1),(5,'Food','food','fastfood',1),(6,'Reports','report','report',1),(7,'Administator','administrator','settings',1);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_cash_records`
--

LOCK TABLES `order_cash_records` WRITE;
/*!40000 ALTER TABLE `order_cash_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_cash_records` ENABLE KEYS */;
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
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_details_id_uindex` (`id`),
  KEY `order_id___fk` (`order_id`),
  CONSTRAINT `order_id___fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_trackings_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_trackings`
--

LOCK TABLES `order_trackings` WRITE;
/*!40000 ALTER TABLE `order_trackings` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_trackings` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_id_uindex` (`id`),
  UNIQUE KEY `orders_order_id_uindex` (`order_id`),
  UNIQUE KEY `orders_transaction_id_uindex` (`transaction_id`),
  KEY `customer_code__fk` (`customer_code`),
  CONSTRAINT `customer_code__fk` FOREIGN KEY (`customer_code`) REFERENCES `customers` (`customer_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `qtags` DISABLE KEYS */;
INSERT INTO `qtags` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(19,7,1),(20,8,1),(21,9,1),(22,10,1),(23,11,1),(24,12,1),(25,13,1),(26,14,1),(27,15,1),(28,16,1),(29,17,1),(30,18,1),(31,19,1),(32,20,1);
/*!40000 ALTER TABLE `qtags` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN','ADMINISTRATOR',1,'2018-10-07 01:37:02','2018-10-07 01:37:02'),(2,'GUEST','GUEST',1,'2018-10-07 01:37:13','2018-10-07 01:37:13'),(3,'CHEF','Chef',1,'2018-10-07 01:38:06','2018-10-07 01:38:06'),(5,'STAFF','STAFF',1,'2018-10-07 01:38:44','2018-10-07 01:38:44');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tranx_role_menu`
--

LOCK TABLES `tranx_role_menu` WRITE;
/*!40000 ALTER TABLE `tranx_role_menu` DISABLE KEYS */;
INSERT INTO `tranx_role_menu` VALUES (1,'ADMIN',1),(4,'ADMIN',2),(5,'ADMIN',3),(6,'ADMIN',4),(7,'ADMIN',5),(8,'ADMIN',6),(9,'ADMIN',7);
/*!40000 ALTER TABLE `tranx_role_menu` ENABLE KEYS */;
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
  `email` varchar(255) NOT NULL,
  `password` varchar(70) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `role_code` varchar(20) NOT NULL,
  `emp_id` varchar(32) NOT NULL DEFAULT ucase(md5(uuid())),
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_id_uindex` (`id`),
  UNIQUE KEY `users_username_uindex` (`username`),
  UNIQUE KEY `users_email_uindex` (`email`),
  UNIQUE KEY `users_password_uindex` (`password`),
  UNIQUE KEY `users_emp_id_uindex` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (64,'admin','sayyalinh@gmail.com','$2b$10$AYlGbhNUtNZk7Q1Ygp.FBu6li3s5N/xpb53Lq04tSDYRgnbCwC5IG',0,'2018-10-07 00:10:38','2018-10-07 00:10:38','ADMIN','E4F43B3284BF3F9065CC5EB6A46F2514');
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

-- Dump completed on 2018-11-21  1:58:22
