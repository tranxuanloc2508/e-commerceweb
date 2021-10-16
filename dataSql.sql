-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlidb
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameCategory` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'THỊT - THỦY HẢI SẢN - TRỨNG',NULL),(2,'RAU - CỦ - TRÁI CÂY',NULL),(3,'ĐỒ UỐNG - GIẢI KHÁT',NULL),(4,'SỮA UỐNG CÁC LOẠI',NULL),(5,'ĐỒ MÁT - ĐÔNG LẠNH',NULL),(6,'HÓA PHẨM - GIẤY',NULL),(7,'BÁNH KẸO - ĐỒ ĂN VẶT',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user_idx` (`user_id`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,20000,'2021-10-03 22:21:38',6),(2,210000,'2021-10-03 22:37:53',6),(3,80000,'2021-10-05 14:58:16',6),(4,45000,'2021-10-05 15:12:57',5),(5,666666,'2021-10-05 15:14:25',5),(6,333333,'2021-10-08 22:33:08',7),(7,105000,'2021-10-09 13:23:19',2);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_price` decimal(10,0) DEFAULT NULL,
  `num` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderdetail_order_idx` (`order_id`),
  KEY `fk_orderdetail_product_idx` (`product_id`),
  CONSTRAINT `fk_orderdetail_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `fk_orderdetail_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,1,4,20000,'1'),(2,2,5,45000,'2'),(3,2,7,60000,'2'),(4,3,4,20000,'1'),(5,3,7,60000,'1'),(6,4,5,45000,'1'),(7,5,9,333333,'1'),(8,5,10,333333,'1'),(9,6,9,333333,'1'),(10,7,5,45000,'1'),(11,7,7,60000,'1');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT '0',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category_idx` (`category_id`),
  KEY `fk_product_saler_idx` (`user_id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_product_saler` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (4,'Cà rốt Đà Lạt','1 kg',20000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1631328110/ow2fwj8ylyqf8swsl2fu.jpg','2021-08-25 00:00:00',2,6),(5,'Bắp cải trắng Bắp cải trắng','THÔNG TIN SẢN PHẨM',45000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1631261715/yyvkhofdqxisxlz68e2r.jpg','2021-08-31 00:00:00',2,6),(6,'Bí đỏ','500 gram',10000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1631293718/hhckjt4nht60jffynw0v.jpg','2021-09-01 00:00:00',2,2),(7,'Đầu cá hồi','500 gram',60000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1631120957/t0iuavwx69jioewl270c.png','2021-09-01 00:00:00',1,2),(9,'nguyen','123',333333,'https://res.cloudinary.com/djtemroku/image/upload/v1632929941/vjgtwskxzxyoh5ldtusg.jpg',NULL,1,3),(10,'nguyenqwqw','12345',333333,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1633420595/pugwjnudvdi1chzecbtj.jpg',NULL,4,2),(11,'test1','MÔ TẢ',20002,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634394005/jkatif1l69osn9hjvle3.jpg',NULL,4,6),(12,'test 2','123',333333,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634397175/i8ejhdvmmmeinimx0lvi.jpg',NULL,7,6);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `user_role` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'1','do',NULL,'124365','12e','344',_binary '',''),(2,'2','11','1851010110quyen@ou.edu.vn','1','1','$2a$10$6RYkYnc6JuTnmvckjJprlO.VqOIiJaB/yWNhK9qstKqhVRRWhnNNa',_binary '\0','ROLE_ADMIN'),(3,'3','q','bichquyenpy@gmail.com','(+84) 703324351','saler','$2a$10$fjaQUWAU3PMuXj1IdHrKJu6pvVT7NTdH32utyvgWDRVHtiD2NVGMG',_binary '\0','ROLE_USER'),(4,'4','3','1851010110quyen@ou.edu.vn','0777436051','user3','$2a$10$F.ZIunXB9eOe7xYT.l2I/uHOraVHWVRlWwEyjOoOfmMQFds824JQm',_binary '\0','ROLE_USER'),(5,'5','4','1851010110quyen@ou.edu.vn','0777436051','user4','$2a$10$Y6d4z1h7Zd4L9hGGfyNv2eo5N.YU5rgIOmH9Mli9uagzYIl9Yr94q',_binary '\0','ROLE_USER'),(6,'6','1','1851010110quyen@ou.edu.vn','(+84) 703324351','user1','$2a$10$9P8KvS8G35X6XTVgo/4t.uVnoUZx0JXypTZWztoAtZZ8I2Dxvf4qm',_binary '\0','ROLE_USER'),(7,'7','2','1851010110quyen@ou.edu.vn','(+84) 703324351','user2','$2a$10$gQ55tkUS6R/5ZWOWuJmaVe/KLME8ET95ucV8xjOn5HThf0Y8E42Zu',_binary '\0','ROLE_USER'),(8,'8','1','1851010110quyen@ou.edu.vn','(+84) 703324351','user','$2a$10$x5BfI9lPC.p8hW3i0mbQTu1kWSsmOLlWCS2Cn9aNArjnXBewM2tq6',_binary '\0','ROLE_USER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-16 22:52:09
