-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: codeweb1
-- ------------------------------------------------------
-- Server version	8.0.20

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
  `id` int NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_product_idx` (`product_id`),
  KEY `fk_comment_user_idx` (`user_id`),
  CONSTRAINT `fk_comment_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user_idx` (`user_id`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (10,31000,'2021-10-22 15:32:10',14);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `unit_price` decimal(10,0) DEFAULT NULL,
  `num` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderdetail_order_idx` (`order_id`),
  KEY `fk_orderdetail_product_idx` (`product_id`),
  CONSTRAINT `fk_orderdetail_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `fk_orderdetail_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (14,10,55,31000,'1');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `price` decimal(10,0) DEFAULT '0',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `category_id` int NOT NULL,
  `user_id` int NOT NULL,
  `factory` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Milliliter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category_idx` (`category_id`),
  KEY `fk_product_saler_idx` (`user_id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_product_saler` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (17,'Khóm (Dứa)','Khóm là một loài trái cây vùng nhiệt đới, có tên khoa học là Ananas comosus. Quả có đặc điểm quả nhiều mắt, thịt màu vàng, vị chua ngọt, dùng để nấu ăn như một loại rau nêm hoặc ăn tươi như một loại trái cây thông thường.',10000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634869488/zfuk5ptx5remyyj1vofm.jpg',NULL,2,10,NULL,NULL),(18,'Cam vàng túi 1kg','Cam vàng trái tròn căng bóng, mọng nước và cực kỳ thơm ngon, đây là loại trái cây nhập khẩu từ Úc an toàn vệ sinh. Thích hợp để vắt uống bởi chứa nhiều vitamin C và vị chua dịu hợp khẩu vị.',65000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634869595/taj6md6a95qpwaa14dhk.jpg',NULL,2,10,NULL,NULL),(19,'Ba rọi heo khay 500g','Ba rọi heo của thương hiệu CP đạt các tiêu chuẩn về an toàn toàn thực phẩm, đảm bảo chất lượng, độ tươi ngon. Thịt heo mềm, vân nạc, mỡ rõ ràng nên rất phù hợp làm nguyên liệu để nấu thịt kho hột vịt, thịt nướng BBQ. ',96000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634869772/rroiclopgooylknzf9gq.jpg',NULL,1,11,NULL,NULL),(20,'Cốt lết heo có xương G khay 300g','Cốt lết heo có xương G được đóng gói và bảo quản đạt các tiêu chuẩn về an toàn toàn thực phẩm. Bản thịt to, vân mỡ mỏng tạo độ béo nhẹ cho miếng thịt nên thường dùng để nướng, ram, chiên áp chảo.',50000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634869837/nrnybivchuyq9dljori4.jpg',NULL,1,11,NULL,NULL),(21,'Sườn vai heo nhập khẩu đông lạnh túi 500g','Sườn vai heo nhập khẩu với phần thịt sườn săn chắc, thơm nên thường dùng để hầm nấu canh hoặc sườn ram mặn. Sườn vai heo nhập khẩu đông lạnh với phương pháp cấp đông hiện đại, giúp lưu giữ hương vị tự nhiên, mang đến những món ăn ngon cho gia đình.',34500,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634870910/dz0uh5vbuo4ce05yl7m7.jpg',NULL,1,11,NULL,NULL),(24,'Thịt bò Úc cắt khối lúc lắc khay 250g','Đây phần thịt mềm, ở trên cùng có một lớp mỡ dày, chắc nhưng không gây ngậy, không nồng khi chế biến thích hợp với món bò hầm hoặc ò lúc lắc. ',102000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634871265/oaotkjytnwlmtfxf2ge4.jpg',NULL,1,11,NULL,NULL),(25,'Cánh gà nhập khẩu đông lạnh túi 500g','Cánh gà tươi nhập khẩu là một trong những bộ phận ngon nhất của thịt gà, thích hợp dùng cho các món chiên, xào, kho,... và rất nhiều nhiều người yêu thích. Cánh gà không chỉ có phần thịt mềm mà còn có lớp da dai dai, phù hợp với khẩu vị của nhiều người. Cánh gà nhập khẩu đông lạnh từ Mỹ với phương pháp làm đông lạnh cấp tốc từ thịt gà tươi trong thời gian nhanh nhất, giúp các dinh dưỡng thất thoát sẽ ít hơn, chất lượng thịt không kém xa thịt gà',41500,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634872258/c23clmytfngomcprbp21.jpg',NULL,1,11,NULL,NULL),(30,'Đùi gà góc tư khay 500g','Đùi gà góc tư CP đạt các tiêu chuẩn về an toàn thực phẩm, đảm bảo về chất lượng, độ tươi và ngon, xuất xứ rõ ràng. Là một một nguyên liệu thích hợp để nấu món gà rán, cơm đùi gà quay tiêu hay gà chiên nước mắm,... Có thể dùng điện thoại quét code QR trên sản phẩm để kiểm tra nguồn góc.',37000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634872652/hynvmh9j3pjjnfcm3zzx.jpg',NULL,1,11,NULL,NULL),(31,'Mề gà tươi khay 500g','Mề gà CP đạt các tiêu chuẩn về an toàn thực phẩm, đảm bảo về chất lượng, độ tươi và ngon, xuất xứ rõ ràng... Mể gà thích hợp để nấu món mề gà sốt gừng, mể gà sốt lạc, mề gà trộn chua cay, mề gà xào,\r\nMề gà CP là một trong những bộ phận nội tạng của con gà, có độ dai giòn sần sật nên bộ phận này được nhiều người yêu thích hơn các phần thịt gà khác. Mề gà tươi CP được lấy và sơ chế thông qua quá trình kiểm soát chặt chẽ theo nguyên tắc chuỗi khép kín “Thức ăn chăn nuôi - Trang trại chăn nuôi – Nhà máy chế biến thực phẩm” của CP. ',44500,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634872755/wsmcdook1epoqcg15npk.jpg',NULL,1,11,NULL,NULL),(32,'Hộp 4 trứng vịt bắc thảo T.Food 4 trứng','Hộp 4 trứng vịt bắc thảo T.Food được đóng gói và bảo quản theo những tiêu chuẩn nghiêm ngặt về vệ sinh và an toàn thực phẩm, đảm bảo về chất lượng của thực phẩm. Trứng vịt to tròn, đều. Có thể luộc chín hoặc chế biến thành các món ăn khác như: cháo trứng bắc thảo, chả cá trứng bắc thảo,...',26000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634872839/bwpwa6u92vvmfvafj7ij.jpg',NULL,1,11,NULL,NULL),(33,'Hộp 4 trứng vịt muối T.Food 4 trứng','Hộp 4 trứng vịt muối của V.Food được đóng gói và bảo quản theo những tiêu chuẩn nghiêm ngặt về vệ sinh và an toàn thực phẩm, đảm bảo về chất lượng của thực phẩm, xuất xứ rõ ràng. Trứng vịt to tròn, đều. Đây là sản phẩm cỏ thể ăn liền, có thể ăn với cơm hoặc ăn không,..',21500,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634872867/asqzgrin3nj0xwyzohof.jpg',NULL,1,11,NULL,NULL),(34,'Đầu cá hồi tươi đông lạnh túi 500g','Đầu cá hồi có xương mềm, béo có thể nấu canh chua, nấu lẩu,... đầu cá mua về có thể dùng muối và chanh để khử mùi tanh. Đầu cá hồi tươi đông lạnh có thể kéo dài thời gian bảo quản, thích hợp cho nhu cầu gia đình trong việc chế biến và mang đến những món ăn bổ dưỡng\r\nCá hồi là loại cá có chứa Omega-3 giàu EPA và DHA, protein cùng nhiều dưỡng chất thiết yếu khác như vitamin B, kali và selen,... đều là những dưỡng chất cần thiết cho cơ thể. Bên cạnh thịt cá, lườn cá hồi thì đầu cá hồi cũng là một bộ phận không thể bỏ qua vì hàm lượng chất dinh dưỡng cao, dễ dàng chế biến. Đầu cá hồi tươi đông lạnh được lấy từ phần đầu của những con cá hồi tươi ngon, với phương pháp làm lạnh nhanh và trữ đông ở -18 độ C, điều này giúp cho thịt cá vẫn giữ nguyên độ tươi ngay khi rã đông sử dụng',24500,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634872937/gfd5jaslkosjlpr8kgnd.jpg',NULL,1,11,NULL,NULL),(35,'Cá bơn nhập khẩu đông lạnh túi 400g','Cá bơn là một trong những loại thực phẩm tốt, có giá trị dinh dưỡng cao, đem đến nguồn vitamin và khoáng chất thiết yếu cho sức khoẻ. Cá bơn nhập khẩu đông lạnh vẫn giữ được độ săn chắc của cá biển, giúp bảo quản lâu hơn, mang đến vị đậm đà cho món ăn\r\nCá bơn (hay còn gọi là cá thờn bơn) có phần thịt cá trắng muốt, luôn săn chắc, vị ngọt thanh trọn vị, không có xương dăm và thuộc top hải sản giàu dinh dưỡng. Cá bơn nhập khẩu đông lạnh được chế biến từ những con cá bơn tươi ngon, thịt săn chắc, làm lạnh nhanh và trữ đông ở -18 độ C, điều này giúp cho thịt cá vẫn giữ nguyên độ tươi ngay khi rã đông sử dụng.',28000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634872997/kgkfnngonn8nearwnjw4.jpg',NULL,1,11,NULL,NULL),(36,'Tôm càng túi 500g','Tôm là nguồn dinh dưỡng dồi dào, cung cấp hàm lượng canxi và sắt rất cao cho chế độ ăn hằng ngày. Khi thưởng thức, bạn sẽ cảm nhận phần thịt ngọt nước và hơi dai. Ngoài ra, tôm càng với kích thước to nên thường được dùng để trang trí các món ăn trong bữa tiệc hoặc bữa cơm gia đình.\r\nTôm càng (hay còn gọi là tôm đồng, tôm càng sông) là loại tôm nước ngọt, càng nhỏ màu xanh lam nhạt, thịt tôm dai giòn, vị ngọt, có chứa nhiều chất dinh dưỡng cho sức khỏe. Hiện ở Việt Nam, tôm càng xanh được tìm thấy nhiều nhất ở các tỉnh Đồng bằng sông Cửu Long cũng như các khu vực Đông Nam Bộ.',80000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634873066/apxsmgnawmmub4lu12pa.jpg',NULL,1,11,NULL,NULL),(37,'Mực ghim nhập khẩu đông lạnh túi 300g','Mực ghim là loại mực thân dài, cuộn tròn như cây ghim, vừa giàu chất dinh dưỡng và thơm ngon đậm vị. Mực ghim nhập khẩu đông lạnh vẫn giữ được độ săn chắc, giúp bảo quản lâu hơn, mang đến vị đậm đà cho món ăn\r\nMực ghim là loại hải sản rất giàu vitamin B1, B2 và các Vitamin khác, bên cạnh đó còn dồi dào sắt, kẽm, đạm, canxi… Mực ghim nhập khẩu đông lạnh từ Indonesia được chế biến từ những con mực  tươi ngon, giòn ngọt, thịt săn chắc có chứa một ít trứng mực, được làm lạnh nhanh và trữ đông ở -18 độ C, điều này giúp cho mực vẫn giữ nguyên độ tươi ngay khi rã đông sử dụng.',60000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634873103/vymxsfw6bhzi7o3rpfen.jpg',NULL,1,11,NULL,NULL),(38,'Dưa leo túi 500g','Được trồng khá nhiều ở nước ta, đây là một loại rau củ rất ngon, gần như là quen thuộc trong tất cả bữa ăn ở mọi gia đình. Dưa leo chứa rất nhiều chất dinh dưỡng và vitamin rất tốt cho cơ thể. Ngoài ra, dưa leo còn có thể dụng để làm đẹp cũng rất hiệu quả.\r\nDưa leo hay còn gọi là dưa chuột, là một loại quả thuộc họ Bầu bí, khi ăn có vị ngọt nhẹ và thanh mát. Đây là loại quả có hàm lượng nước và chất xơ cao cùng với các khoáng chất có lợi cho sức khỏe. Vì thế, dưa leo không chỉ được dùng như một loại nguyên liệu chế biến món ăn mà còn được xem là một thần dược trong việc làm đẹp. ',15000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634873202/pobhde9w2mqrqqvuprhq.jpg',NULL,2,10,NULL,NULL),(39,'Su hào xanh túi 300g','Su hào là một loại củ rất quen thuộc, được nhiều bà nội trợ chọn để chế biến thành các món ăn ngon cho gia đình. Xu hào rất giàu Vitamin, chất xơ, giúp chống oxy hóa mạnh, răng và nướu khỏe mạnh. Xu hào có thể chế biến thành các món ăn ngon như: xào, nấu canh, muối chua,...\r\nSu hào là loại củ được sử dụng nhiều trong chế biến món ăn vì nó có vị ngọt nhẹ, giòn và rất giàu Vitamin, chất xơ. Trong su hào rất giàu Vitamin C. Loại Vitamin này có tính chống oxy hóa mạnh, giúp cơ thể duy trì các mô liên kết, răng và nướu khỏe mạnh, giúp bảo vệ cơ thể con người hạn chế ung thư và đẩy các gốc tự do có hại ra khỏi cơ thể…Su hào còn chứa một lượng dồi dào nhóm Vitamin B phức hợp, là các yếu tố kết hợp với enzym trong quá trình trao đổi chất khác nhau trong cơ thể.',10000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634873251/gnnp2xd9fv5b6epxvlid.jpg',NULL,2,10,NULL,NULL),(40,'Khoai lang mật túi 1kg','Được trồng và có củ quanh năm, ngon nhất là khi được nướng lên trên một bếp than đổ hồng. Loại củ này có vị ngọt ngào như mật, khi cho vào miệng thì bở tơi, tan tan trên đầu lưỡi thì còn gì bằng. Khoai lang Nhật chứa nhiều vitamin A, B, C và nhiều khoáng chất cần thiết cho làn da đẹp.\r\nKhoai lang mật là loại củ có giá trị dinh dưỡng rất cao. Vì thế, giá thành củ nó khá đắt hơn các loại khoai lang khác. Khoai lang mật trước khi chế biến bên trong lớp vỏ có màu hồng đào. Khi cắt hoặc bẻ đầu nhỏ củ khoai chúng ta sẽ thấy chúng tiết ra một lượng mật nhất định và để lâu một tý chúng ta sẽ thấy lượng mật này sẽ biến thành màu đen. Sau khi chế biến, khoai lang mật sẽ có một lượng mật được tiết ra từ củ khoai, màu sắc ngã vàng đậm, khi ăn sẽ thấy bột khoai khá ướt và ngọt thơm không bị khô như các loại khoai lang khác.',40000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634873287/xjyzzmtd0tfufr0hcncj.jpg',NULL,2,10,NULL,NULL),(41,'Củ sắn túi 1kg','Là một loại củ rất quen thuộc với mọi gia đình. Phần thịt của củ sẵn khá ngọt, nhiều nước và rất giòn, chứa nhiều khoáng chất như: sắt, photpho, canxi và các vitamin A, C, B…. Thông thường người ta sẽ dùng củ sắn để ăn sống hoặc chế biến thành nhiều món ăn khác nhau như: xào, luộc hay nấu canh,...\r\nCủ sắn hay còn gọi là củ đậu, đây là một loại rau củ có xuất xứ từ Mexico, được trồng rất nhiều khắp thế giới. Củ sắn có kích thước to, tròn và trông khá giống với con quay, thịt chắc và nặng, có lớp vỏ xơ dai màu vàng. Phần thịt của củ sẵn khá ngọt, nhiều nước và rất giòn.\r\nThông thường người ta sẽ dùng củ sắn để ăn sống hoặc chế biến thành nhiều món ăn khác nhau như: xào, luộc hay nấu canh,...',17000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634873317/ifbsyka5a90znkmgeoyr.jpg',NULL,2,10,NULL,NULL),(42,'Lẩu nấm thiên nhiên khay 300g','Lẩu nấm thiên nhiên gồm nhiều thành phần: nấm bào ngư, nấm kim châm, nấm hương, ớt,... Dùng nấu lẩu ngọt thơm, thanh mát nhờ các loại nấm có giá trị dinh dưỡng cao. Sản phẩm được làm sẵn, đơn giản tiện lợi thích hợp cho gia đình bận rộn không có thời gian.\r\n\r\nLẩu nấm thiên nhiên gồm nhiều thành phần: nấm bào ngư, nấm kim châm, nấm hương, ớt,... Dùng nấu lẩu ngọt thơm, thanh mát nhờ các loại nấm có giá trị dinh dưỡng cao. Tốt với cho trẻ em độ tuổi phát triển, những người bị suy dinh dưỡng, thiếu máu, dồi dào và bồi bổ cho cơ thể. ',33000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634873393/noddheoibftjhrpkzt3r.jpg',NULL,2,10,NULL,NULL),(43,'Nấm kim châm Hàn Quốc túi 150g','Nấm kim châm Hàn Quốc của Bách hóa Xanh được nuôi trồng và đóng gói theo những tiêu chuẩn nghiêm ngặt, bảo đảm các tiêu chuẩn xanh - sach, chất lượng và an toàn với người dùng. Sợi nấm dai, giòn và ngọt, khi nấu chín rất thơm nên thường được lăn bột chiên giòn, nấu súp hoặc để nướng ăn kèm.\r\nNấm là loại thực phẩm tuy có hàm lượng vitamin và khoáng chất chỉ ngang bằng các loại rau xanh nhưng nó lại chứa nhiều loại chất dinh dưỡng cần thiết cho cơ thể trong đó có vitamin D là dưỡng chất mà khó tìm thấy trong rau hoặc một số loại thực phẩm khác. Nấm kim châm cũng là một trong số những nguồn vitamin, khoáng chất họ nấm, theo nghiên cứu chỉ với 65g nấm kim châm cung cấp chất dinh dưỡng cần thiết cho cơ thể. ',16000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634873491/gigohdiri82n3vhd26w3.jpg',NULL,1,10,NULL,NULL),(44,'Nấm mỡ trắng hộp 150g','Nấm mỡ trắng của Bách Hóa Xanh được nuôi trồng và đóng gói theo những tiêu chuẩn nghiêm ngặt, bảo đảm các tiêu chuẩn xanh - sach, chất lượng và an toàn với người dùng. Nấm mỡ chứa hàm lượng chất dinh dưỡng cao, nhiều vitamin và protein quan trọng nên thường được chế biến bằng cách xào hoặc nướng.',56500,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634873582/u70kjfnuqhicuhlhced9.jpg',NULL,2,10,NULL,NULL),(45,'Nấm hải sản túi 150g','Nấm hải sản của Bách hóa Xanh được nuôi trồng và đóng gói theo những tiêu chuẩn nghiêm ngặt, bảo đảm các tiêu chuẩn xanh - sach, chất lượng và an toàn với người dùng. Nấm trắng ngần, ngọt, chứa nhiều chất, hàm lượng dinh dưỡng cao nên thường dùng để nấu cháo hoặc làm rau nhúng lẩu.',21000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634873697/hiyfrd52lnua3gjidamv.jpg',NULL,1,10,NULL,NULL),(46,'Thùng 24 lon nước ngọt Pepsi không calo 320ml','Là loại nước ngọt được nhiều người yêu thích đến từ thương hiệu nổi tiếng thế giới Pepsi với hương vị thơm ngon, sảng khoái. Nước ngọt Pepsi không calo 24 lon 320ml với lượng gas lớn sẽ giúp bạn xua tan mọi cảm giác mệt mỏi, căng thẳng, sản phẩm không calo lành mạnh, tốt cho sức khỏe',220000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634873832/vl3ibit9qbqx1zpcqodk.jpg',NULL,3,12,NULL,NULL),(47,'6 chai trà ô long Tea Plus vị chanh 455ml','Từ những lá Trà ô long hảo hạng tạo nên hương vị thơm ngon, tươi mát đặc trưng của trà ô long kết hợp với vị chanh chua ngọt cực sảng khoái, đặc biệt có chứa hoạt chất OTPP giúp hạn chế hấp thu chất béo giúp bạn tận hưởng những bữa ăn ngon mà vẫn nhẹ nhàng.\r\nTrong trà có chứa polyphenol có khả năng kích hoạt enzyme hòa tan chất béo, giảm cholesterol và tăng cường sức khỏe tim mạch. Sản phẩm trà Tea Plus còn giúp tăng sự tỉnh táo,  giải nhiệt, và giúp giải tỏa cơn khát, sảng khoái. Ngoài ra còn hỗ trợ giảm Cholesterol, bảo vệ đường tiêu hoá, làm tóc chắc khỏe, ổn định đường trong máu,...',40000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634874831/pxk7wuflhgefa5omtndy.jpg',NULL,3,12,'Tea Plus (Việt Nam)','455ml'),(48,'24 lon cà phê đen NesCafé Café Việt 170ml','Được sản xuất từ 100% từ những hạt cà phệ Việt Nam chất lượng, được tuyển chọn và sàng lọc, rang xay theo công nghệ độc quyền của NesCafé, mang đến cho bạn một hương vị cà phê mới, đậm đà hơn, sảng khoái hơn. Sản phẩm cà phê đen pha sẵn uống liền cực mạnh mẽ và tiện lợi',36000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634875918/shjhtpbro8ulljajp9ti.jpg',NULL,3,12,'Việt Nam','170ml'),(49,'24 chai nước tăng lực Rồng Đỏ hương dâu 330ml','Thức uống tăng lực thơm ngon từ thương hiệu Rồng Đỏ. 24 chai nước tăng lực Rồng Đỏ hương dâu 330ml được sản xuất trên dây chuyền công nghệ hiện đại, đảm bảo vệ sinh. Hương dâu dễ chịu, chứa nhiều vitamin và axit amin có tác dụng bổ sung năng lượng tỉnh táo và khỏe khoắn',156000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634876030/jzb1jjgqd8ywm7fzkc0u.jpg',NULL,3,12,'Việt Nam','330ml'),(50,'Thùng 24 lon nước tăng lực Lipovitan mật ong 250ml','Từ những thành phần và hương liệu tổng hợp cao cấp từ thương hiệu nước tăng lực nổi tiếng Lipovitan mang đến chất lượng tuyệt hảo. 24 lon nước tăng lực Lipovitan hương vị mật ong thơm ngon, hấp dẫn giúp bạn đập tan cơn khát, bổ sungnăng lượng cho cơ thể khỏe khắn, mạnh mẽ, tràn đầy hứng khởi',205000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634876078/grldmvmdtihdk5cd7e97.jpg',NULL,3,12,'Việt Nam','250ml'),(51,'6 chai nước bù khoáng Revive chanh muối 390ml','Nước khoáng tác dụng bù khoáng, giảm mất nước, hỗ trợ cung cấp năng lượng và thuận tiện mang theo bên mình cho mọi chuyến đi. 6 chai nước bù khoáng Revive chanh muối 390ml giúp bạn tự tin, năng động ngày hè oi bức. Nước khoáng Revive xua tan mệt mỏi, vận động cùng bạn',50000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634887765/ewpylfmxb0ykui1lnv0l.jpg',NULL,3,12,'Việt Nam','390ml'),(52,'6 chai Sting hương dâu 330ml','Sản phẩm nước tăng lực với mùi vị thơm ngon, sảng khoái, bổ sung hồng sâm chất lượng. Sting giúp cơ thể bù đắp nước, bổ sung năng lượng, vitamin C và E, giúp xua tan cơn khát và cảm giác mệt mỏi cùng dâu cho nhẹ nhàng và dễ chịu. Cam kết chính hãng, chất lượng và an toàn',55000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634887806/mv3rwwjltxxsxtsydcws.jpg',NULL,3,12,'Việt Nam','330ml'),(53,'Thùng 24 chai nước khoáng i-on Pocari Sweat 500ml','Nước khoáng Pocari Sweat bổ sung nước và các ion thiết yếu như Na+, K+, Mg2+, Cl-, Ca2+, giúp cơ thể hấp thụ nhanh, tái tạo năng lượng và sức sống ngay từ bên trong. Thùng 24 chai nước khoáng i-on Pocari Sweat 500ml được chiết xuất từ nguồn nước khoáng trong thiên nhiên tốt cho sức khỏe',330000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634887864/t8izstqlfq8ihnck2c5n.jpg',NULL,1,12,'Việt Nam','500ml'),(54,'6 lon nước tăng lực Monster Energy Ultra 355ml','Sản phẩm thức uống tăng lực thơm ngon từ thương hiệu Monster Energy sản xuất tại Hà Lan. 6 lon nước tăng lực Monster Energy Ultra 355ml giải khát nhanh chóng, mang lại nguồn năng lượng mạnh mẽ, thể hiện đẳng cấp, phong cách sống khác biệt của những người trẻ năng động',174000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634887908/z5uqk7vfw0wzpom3hpse.jpg',NULL,3,12,'Hà Lan','355ml'),(55,'Thùng 48 bịch sữa dinh dưỡng ít đường Vinamilk 220ml','Được chế biến từ nguồn sữa tươi 100% chứa nhiều dưỡng chất như vitamin A, D3, canxi, DHA,... tốt cho xương và hệ miễn dịch. Sữa tươi Vinamilk là thương hiệu được tin dùng hàng đầu với chất lượng tuyệt vời. Thùng 48 bịch sữa dinh dưỡng ít đường Vinamilk 220ml thơm ngon dễ uống',31000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634891117/pwdtsswigpwdmdoqx0i2.jpg',NULL,4,13,'Việt Nam','220ml'),(56,'Thùng 48 hộp sữa tiệt trùng có đường Nuvita 180ml','Là sản phẩm sữa tươi giúp hỗ trợ phát triển chiều cao và trí não hiệu quả. Sữa tươi Nuvita chứa công thức Tallmax IGF1 bổ sung tiền tố DHA, ARA và Taurin, vitamin nhóm B, Canxi, Lysin, kẽm và gấp 3 lần vitamin D. Thùng 48 hộp sữa tiệt trùng có đường Nuvita 180ml thơm ngon, dễ uống',295000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634891232/yht2cn2etszbq57njtvz.jpg',NULL,1,13,'Việt Nam','180ml'),(57,'Giò đậu nành thuần chay CK Food cây 500g','Là loại chả lụa chay được chế biến với nguyên liệu chính là đậu nành cùng những thành phần an toàn cho sức khoẻ. Giò đậu nành thuần chay CK Food cây 500g được phân phối bởi chả lụa CK Food mang đến hương vị thơm ngon, có thể dùng để ăn trực tiếp hoặc ăn kèm với các món ăn khác.',140000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634891346/oc75kb9qd1woej6ptfvi.jpg',NULL,5,14,'Đài Loan',' 500g'),(58,'Xúc xích phô mai Le Gourmet gói 200g','Xúc xích Le Gourmet sử dụng nguồn nguyên liệu thực phẩm tươi sạch, không dùng chất bảo quản hay bất cứ thành phần hóa chất tạo mùi. Mua Xúc xích phô mai Le Gourmet gói 200g với sự kết hợp với phô mai béo ngậy, là loại xúc xích dễ dàng chế biến như chiên, nướng... nhanh chóng.',42000,'https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634891388/yotdxpfmwsta9pzzovda.jpg',NULL,5,14,'Le Gourmet (New Zealand)','200g');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `user_role` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (9,'Lá»c','Tráº§n','loc@ou.edu.vn','0962428696','admin','$2a$10$sCjFNIeb6CiHzaYO5OGr.uD61F7y7fegyqVSU7DIcxE4RJJt6Jdo2',_binary '\0','ROLE_ADMIN',NULL),(10,'Trần','Xuân','loc@gmail.com','0123456789','user','$2a$10$06UZgMWpHcoIXGxsycvXDO2jgrZY8gizDaRu9gUAw5BVCSEH0wrhy',_binary '\0','ROLE_USER','https://res.cloudinary.com/dhj3qxlyh/image/upload/v1634868611/qaltg1kf0itmvx4c5mru.jpg'),(11,'An','NGuyá»n','an@gmail.com','0123456789','an','$2a$10$MczrjzpCRSwJuIQkr1/BluLVgf1ijv/x34ukP8YLmpespnDNnKwNW',_binary '\0','ROLE_USER',NULL),(12,'Mai','Pham','mai.pham@gmail.com','0123456789','mai','$2a$10$.xUAecYAWcDEIIqScC6d6.zS2as4QvDX6vB2KJpKhYRLJm5nL5uPC',_binary '\0','ROLE_USER',NULL),(13,'Phi','Vu','phi.vu@gmail.com','0123456789','phi','$2a$10$vrfp17ODaTWCKgyNd17XguzUKMImIIR5HWa3sA/mgGFfN/6520HzO',_binary '\0','ROLE_USER',NULL),(14,'Phi','Long','m.p@gmail.com','0123456789','long','$2a$10$UGZz4qo7RCecyMCCGNN0fuNgtWmbJPg7z.PzaKJ.iF4N/rGxv72wC',_binary '\0','ROLE_USER',NULL);
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

-- Dump completed on 2021-10-22 16:04:18
