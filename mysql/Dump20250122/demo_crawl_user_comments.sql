-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: demo_crawl
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `user_comments`
--

DROP TABLE IF EXISTS `user_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) NOT NULL,
  `time_of_participation` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_comments`
--

LOCK TABLES `user_comments` WRITE;
/*!40000 ALTER TABLE `user_comments` DISABLE KEYS */;
INSERT INTO `user_comments` VALUES (1,'Phạm Ngọc Dũng','2025-01-14 15:29:00'),(2,'linhthuy250898','2025-01-14 15:54:00'),(3,'Tính Dương','2025-01-14 15:58:00'),(4,'VNE','2025-01-14 15:58:00'),(5,'tranmuoibondhth6','2025-01-14 16:04:00'),(6,'chanhbkkv','2025-01-14 16:09:00'),(7,'Sông Đông êm đềm','2025-01-14 16:19:00'),(8,'Lê Tùng','2025-01-14 16:21:00'),(9,'Doãn Chí Bình','2025-01-14 16:27:00'),(10,'Duy Trịnh Khắc','2025-01-14 16:36:00'),(11,'Đoàn Anh','2025-01-14 16:41:00'),(12,'thangnguyentran75','2025-01-14 16:45:00'),(13,'anhnhan12121985','2025-01-14 16:56:00'),(14,'viettthuong','2025-01-14 17:05:00'),(15,'Mr NN','2025-01-14 17:05:00'),(16,'Kalpas','2025-01-14 17:09:00'),(17,'manhdope','2025-01-14 17:31:00'),(18,'taicutm','2025-01-14 17:31:00'),(19,'tvrlinh','2025-01-14 17:40:00'),(20,'mr.gang622','2025-01-14 18:02:00'),(21,'hoanghonmaudo2016','2025-01-14 18:19:00'),(22,'Tiến','2025-01-14 18:26:00'),(23,'lanchicongaiyeu','2025-01-14 18:53:00'),(24,'thuhong565656','2025-01-14 19:31:00'),(25,'danny','2025-01-14 20:05:00'),(26,'Mộc mộc','2025-01-15 13:25:00'),(27,'quanganh00779','2025-01-14 16:02:00'),(28,'Mr. Sugar','2025-01-14 16:37:00'),(29,'Mr KỆ','2025-01-14 18:41:00'),(30,'Phạm Phương Nam ( Nick Thật )','2025-01-14 16:08:00'),(31,'choemnoichut','2025-01-14 16:29:00'),(32,'Cẩm Chi','2025-01-14 15:57:00'),(33,'Hoàng Gia Nam','2025-01-14 18:38:00'),(34,'hong.doanvan','2025-01-14 19:15:00'),(35,'doannam37','2025-01-14 15:49:00'),(36,'tiasang1911','2025-01-14 15:54:00'),(37,'dinhnhatanh1812','2025-01-14 16:08:00'),(38,'Sông Đông êm đềm','2025-01-14 16:20:00'),(39,'Triệu phú VND','2025-01-14 16:05:00'),(40,'hoangnguyen1508','2025-01-14 16:06:00'),(41,'An Raster','2025-01-14 17:24:00'),(42,'Vanny Do','2025-01-14 21:13:00'),(43,'N2LA','2025-01-14 17:27:00'),(44,'Sông Đông êm đềm','2025-01-14 18:55:00'),(45,'nmkngoc','2025-01-14 21:31:00'),(46,'Dương Đình Duy','2025-01-14 16:05:00'),(47,'hunglee0109','2025-01-14 16:08:00'),(48,'indochinaplan','2025-01-14 16:04:00'),(49,'pr.hidden05','2025-01-14 16:00:00'),(50,'pharmaconceptshare','2025-01-14 16:41:00'),(51,'Bao Công','2025-01-14 17:06:00'),(52,'anhhoap3610','2025-01-14 18:09:00'),(53,'hungsdh168','2025-01-14 16:32:00'),(54,'tranhoaktvkx','2025-01-14 16:36:00'),(55,'teosghn','2025-01-14 16:14:00'),(56,'AKa 100/7','2025-01-14 15:48:00'),(57,'eliseina1987','2025-01-14 16:35:00'),(58,'vanduclinh1911','2025-01-14 16:51:00'),(59,'tutaixo','2025-01-14 16:28:00'),(60,'Hùng Anh','2025-01-14 17:22:00'),(61,'vupho0576','2025-01-14 16:28:00'),(62,'Trương Hiệp','2025-01-14 16:48:00'),(63,'Rồng Phạm','2025-01-14 19:51:00'),(64,'an.vothe150187','2025-01-14 16:22:00'),(65,'sooy355440','2025-01-14 18:13:00'),(66,'Tien Nguyen minh','2025-01-14 17:37:00'),(67,'Tiến Nguyễn','2025-01-14 16:35:00'),(68,'quatangkhaihoan','2025-01-14 16:23:00'),(69,'Mouka','2025-01-14 15:58:00'),(70,'Sông Đông êm đềm','2025-01-14 16:21:00'),(71,'M28burofax','2025-01-14 16:45:00'),(72,'gioitinhdogioitinh','2025-01-14 19:31:00'),(73,'Duong Huy','2025-01-14 17:19:00'),(74,'Mai Lan','2025-01-14 17:13:00'),(75,'Huyền ZenPark','2025-01-14 16:57:00'),(76,'Py Father','2025-01-14 16:31:00'),(77,'tranngocvi1002','2025-01-14 16:27:00'),(78,'Lê lọt','2025-01-14 16:27:00'),(79,'Tiến Lợi Đoàn','2025-01-14 17:05:00'),(80,'levantam0037','2025-01-14 16:46:00'),(81,'hiepdaica83','2025-01-14 16:37:00'),(82,'thaole.qn.qn','2025-01-14 16:30:00'),(83,'Thuùyy Tôômm','2025-01-14 16:12:00'),(84,'Sang Nguyen','2025-01-14 16:11:00'),(85,'MrKen','2025-01-14 15:40:00'),(86,'Connie Nguyen','2025-01-14 19:01:00'),(87,'hongnhungpaticusi','2025-01-14 18:11:00'),(88,'Trần Văn Minh','2025-01-14 17:26:00'),(89,'sukata','2025-01-14 17:25:00'),(90,'nhimthanglong2023','2025-01-14 17:05:00'),(91,'tvrlinh','2025-01-14 17:41:00'),(92,'Khiêm','2025-01-14 16:29:00'),(93,'Phuc Vu','2025-01-14 15:48:00'),(94,'Bao Công','2025-01-14 17:03:00'),(95,'Ngày Khai Trường','2025-01-14 20:35:00'),(96,'nsrcampuchia','2025-01-14 19:34:00'),(97,'phongvukl','2025-01-14 18:34:00'),(98,'decon005','2025-01-14 18:08:00'),(99,'cuongnguyen140921','2025-01-14 17:17:00'),(100,'trungnk.simonvietnam','2025-01-14 17:17:00'),(101,'dang nguyen to','2025-01-14 17:16:00'),(102,'Nguyễn Khánh Tùng','2025-01-14 16:55:00'),(103,'thangnguyen041267','2025-01-14 16:49:00'),(104,'phanquocanh225','2025-01-14 16:41:00'),(105,'HN','2025-01-15 21:19:00'),(106,'Văn Minh','2025-01-15 11:23:00'),(107,'truongquangtrung101179','2025-01-15 09:17:00'),(108,'Văn Minh','2025-01-15 11:24:00'),(109,'princevitfc','2025-01-15 01:35:00'),(110,'.','2025-01-14 22:10:00'),(111,'ngoc.nguyenvan37','2025-01-14 22:02:00'),(112,'thanhtupham9535','2025-01-14 21:57:00'),(113,'Int usege','2025-01-14 21:28:00'),(114,'Dương VĂN Lương','2025-01-14 20:21:00'),(115,'Đinh Quốc Dũng','2025-01-14 20:07:00'),(116,'damvancuongct','2025-01-14 20:05:00'),(117,'mmc.mmt','2025-01-14 19:56:00'),(118,'B Ho','2025-01-14 19:53:00'),(119,'quocvi.tran.88','2025-01-14 19:29:00'),(120,'nguyenthiphuong25021972','2025-01-14 19:23:00'),(121,'hoangvanquang0306','2025-01-14 19:18:00'),(122,'Nguyễn Ngọc Trung','2025-01-14 19:08:00'),(123,'dinhtho081983','2025-01-14 18:57:00'),(124,'tanb1204865','2025-01-14 18:49:00'),(125,'Võ','2025-01-14 18:46:00'),(126,'nguyenvanhien1511994','2025-01-14 18:40:00'),(127,'hung nguyen','2025-01-14 18:36:00'),(128,'Mạnh Nguyễn','2025-01-14 18:27:00'),(129,'mitmat','2025-01-14 18:21:00'),(130,'Hồ Hải Vinh','2025-01-14 18:15:00'),(131,'Mon','2025-01-14 18:01:00'),(132,'doanthithanhthuy041985','2025-01-14 18:00:00'),(133,'Duc Nguyen','2025-01-14 17:52:00'),(134,'trungthanhnt','2025-01-14 17:52:00'),(135,'Chung khờ','2025-01-14 17:50:00'),(136,'tvrlinh','2025-01-14 17:38:00'),(137,'hoangthyct','2025-01-14 17:35:00'),(138,'Do manh Hai','2025-01-14 17:20:00'),(139,'Cuong Pham','2025-01-14 16:27:00');
/*!40000 ALTER TABLE `user_comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-22 16:03:12
