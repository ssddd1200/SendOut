-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: waimai
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `code` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'品牌商家'),(2,'快餐便当'),(3,'特色菜系'),(4,'异国料理'),(5,'小吃夜宵'),(6,'甜品饮料'),(7,'果蔬生鲜'),(8,'鲜花蛋糕'),(9,'商品超市');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumer`
--

DROP TABLE IF EXISTS `consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `telphone` varchar(11) NOT NULL,
  `sign_time` datetime NOT NULL,
  `last_login_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumer`
--

LOCK TABLES `consumer` WRITE;
/*!40000 ALTER TABLE `consumer` DISABLE KEYS */;
INSERT INTO `consumer` VALUES (1,'逗比','12346567987','2016-03-06 00:00:00','2016-09-01 00:00:00'),(2,'苏打水','12345678912','2016-06-09 00:00:00','2016-09-01 00:00:00');
/*!40000 ALTER TABLE `consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_address`
--

DROP TABLE IF EXISTS `cus_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_address` (
  `id` int(11) NOT NULL,
  `address` varchar(45) NOT NULL,
  `consumer_id` int(11) NOT NULL,
  `static_add` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `fk_cus_address_consumer1_idx` (`consumer_id`),
  CONSTRAINT `fk_cus_address_consumer1` FOREIGN KEY (`consumer_id`) REFERENCES `consumer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_address`
--

LOCK TABLES `cus_address` WRITE;
/*!40000 ALTER TABLE `cus_address` DISABLE KEYS */;
INSERT INTO `cus_address` VALUES (1,'大中国大浙江',1,'Y'),(2,'湿哒哒多',2,'Y');
/*!40000 ALTER TABLE `cus_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_load`
--

DROP TABLE IF EXISTS `e_load`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_load` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_load`
--

LOCK TABLES `e_load` WRITE;
/*!40000 ALTER TABLE `e_load` DISABLE KEYS */;
INSERT INTO `e_load` VALUES ('123456','123456',1),('002','123456',2),('003','123456',3);
/*!40000 ALTER TABLE `e_load` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `telphone` varchar(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `employee_limit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_employee_limit_idx` (`employee_limit_id`),
  CONSTRAINT `fk_employee_employee_limit` FOREIGN KEY (`employee_limit_id`) REFERENCES `employee_limit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'张三','1213812138','QK123@qingke.com',1),(2,'赵超','13811012138','QK@163.com',2);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_limit`
--

DROP TABLE IF EXISTS `employee_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_limit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_limit`
--

LOCK TABLES `employee_limit` WRITE;
/*!40000 ALTER TABLE `employee_limit` DISABLE KEYS */;
INSERT INTO `employee_limit` VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E');
/*!40000 ALTER TABLE `employee_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `describe` varchar(45) DEFAULT NULL,
  `img_url` longblob,
  `merchants_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_goods_merchants1_idx` (`merchants_id`),
  CONSTRAINT `fk_goods_merchants1` FOREIGN KEY (`merchants_id`) REFERENCES `merchants` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'红烧肉',19.5,NULL,NULL,1),(2,'糖醋里脊',20,NULL,NULL,1);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_has_order`
--

DROP TABLE IF EXISTS `goods_has_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_has_order` (
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`goods_id`,`order_id`),
  KEY `fk_goods_has_order_order1_idx` (`order_id`),
  KEY `fk_goods_has_order_goods1_idx` (`goods_id`),
  CONSTRAINT `fk_goods_has_order_goods1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_goods_has_order_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_has_order`
--

LOCK TABLES `goods_has_order` WRITE;
/*!40000 ALTER TABLE `goods_has_order` DISABLE KEYS */;
INSERT INTO `goods_has_order` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `goods_has_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k_status`
--

DROP TABLE IF EXISTS `k_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `k_status` (
  `id` int(11) NOT NULL,
  `code` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k_status`
--

LOCK TABLES `k_status` WRITE;
/*!40000 ALTER TABLE `k_status` DISABLE KEYS */;
INSERT INTO `k_status` VALUES (1,'已通过'),(2,'未通过'),(3,'已审核'),(4,'未审核');
/*!40000 ALTER TABLE `k_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knight`
--

DROP TABLE IF EXISTS `knight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `knight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `telphone` varchar(45) NOT NULL,
  `create_time` datetime NOT NULL,
  `k_states_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_knight_k_states1_idx` (`k_states_id`),
  CONSTRAINT `fk_knight_k_states1` FOREIGN KEY (`k_states_id`) REFERENCES `k_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knight`
--

LOCK TABLES `knight` WRITE;
/*!40000 ALTER TABLE `knight` DISABLE KEYS */;
INSERT INTO `knight` VALUES (1,'老王','123456789123','2016-03-16 00:00:00',2);
/*!40000 ALTER TABLE `knight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loading`
--

DROP TABLE IF EXISTS `loading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loading` (
  `username` varchar(10) NOT NULL,
  `password` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `fk_loading_user1_idx` (`user_id`),
  CONSTRAINT `fk_loading_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loading`
--

LOCK TABLES `loading` WRITE;
/*!40000 ALTER TABLE `loading` DISABLE KEYS */;
INSERT INTO `loading` VALUES ('123456','123456',1);
/*!40000 ALTER TABLE `loading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_status`
--

DROP TABLE IF EXISTS `m_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_status` (
  `id` int(11) NOT NULL,
  `code` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_status`
--

LOCK TABLES `m_status` WRITE;
/*!40000 ALTER TABLE `m_status` DISABLE KEYS */;
INSERT INTO `m_status` VALUES (1,'已通过'),(2,'未通过'),(3,'已审核'),(4,'未审核');
/*!40000 ALTER TABLE `m_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchants`
--

DROP TABLE IF EXISTS `merchants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `telphone` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `create_time` datetime NOT NULL,
  `m_states_id` int(11) NOT NULL,
  `min_send_price` int(11) NOT NULL,
  `send_price` int(11) NOT NULL,
  `img_url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_UNIQUE` (`address`),
  KEY `fk_merchants_m_states1_idx` (`m_states_id`),
  CONSTRAINT `fk_merchants_m_states1` FOREIGN KEY (`m_states_id`) REFERENCES `m_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchants`
--

LOCK TABLES `merchants` WRITE;
/*!40000 ALTER TABLE `merchants` DISABLE KEYS */;
INSERT INTO `merchants` VALUES (1,'逗比欢乐多','12354656465','阿道夫街99号','2016-03-06 00:00:00',1,4,20,NULL),(2,'大','1231241241','大大','2016-03-09 00:00:00',2,3,20,NULL),(3,'我','额','人','2016-05-16 00:00:00',2,1,20,'-');
/*!40000 ALTER TABLE `merchants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchants_has_class`
--

DROP TABLE IF EXISTS `merchants_has_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchants_has_class` (
  `merchants_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`merchants_id`,`class_id`),
  KEY `fk_merchants_has_class_class1_idx` (`class_id`),
  KEY `fk_merchants_has_class_merchants1_idx` (`merchants_id`),
  CONSTRAINT `fk_merchants_has_class_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_merchants_has_class_merchants1` FOREIGN KEY (`merchants_id`) REFERENCES `merchants` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchants_has_class`
--

LOCK TABLES `merchants_has_class` WRITE;
/*!40000 ALTER TABLE `merchants_has_class` DISABLE KEYS */;
INSERT INTO `merchants_has_class` VALUES (1,1);
/*!40000 ALTER TABLE `merchants_has_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_status`
--

DROP TABLE IF EXISTS `o_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_status` (
  `id` int(11) NOT NULL,
  `code` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_status`
--

LOCK TABLES `o_status` WRITE;
/*!40000 ALTER TABLE `o_status` DISABLE KEYS */;
INSERT INTO `o_status` VALUES (1,'已下单'),(2,'配送中'),(3,'已送达'),(4,'中止');
/*!40000 ALTER TABLE `o_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creat_time` datetime NOT NULL,
  `number` int(11) NOT NULL DEFAULT '1',
  `o_states_id` int(11) NOT NULL,
  `knight_id` int(11) NOT NULL,
  `consumer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_o_states1_idx` (`o_states_id`),
  KEY `fk_order_knight1_idx` (`knight_id`),
  KEY `fk_order_consumer1_idx` (`consumer_id`),
  CONSTRAINT `fk_order_consumer1` FOREIGN KEY (`consumer_id`) REFERENCES `consumer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_knight1` FOREIGN KEY (`knight_id`) REFERENCES `knight` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_o_states1` FOREIGN KEY (`o_states_id`) REFERENCES `o_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2016-11-23 00:00:00',2,4,1,1),(2,'2013-02-01 00:00:00',2,4,1,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `telphone` varchar(11) NOT NULL,
  `address` varchar(45) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_user_type1_idx` (`user_type_id`),
  CONSTRAINT `fk_user_user_type1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'管理员','123456789','阿道夫',1,'2013-03-06 00:00:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,'商家'),(2,'客户'),(3,'骑士');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-04 13:32:09
