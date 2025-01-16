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
-- Table structure for table `crawler_results`
--

DROP TABLE IF EXISTS `crawler_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crawler_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `crawler_page_id` int NOT NULL,
  `crawl_url` varchar(255) NOT NULL,
  `user_comment_id` int NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `crawler_page_id` (`crawler_page_id`),
  KEY `user_comment_id` (`user_comment_id`),
  CONSTRAINT `crawler_results_ibfk_1` FOREIGN KEY (`crawler_page_id`) REFERENCES `crawler_pages` (`id`),
  CONSTRAINT `crawler_results_ibfk_2` FOREIGN KEY (`user_comment_id`) REFERENCES `user_comments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crawler_results`
--

LOCK TABLES `crawler_results` WRITE;
/*!40000 ALTER TABLE `crawler_results` DISABLE KEYS */;
INSERT INTO `crawler_results` VALUES (1,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',1,'Nhà trường đã quá chủ quan khi để người lạ đến đón mà ko xác minh đúng lai lịch. Xin lỗi giờ giải quyết được gì? Mong gia đình sớm tìm được cháu gái.'),(2,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',2,'tìm được rồi đó ạ'),(3,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',3,'Đã tìm được cháu.'),(4,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',4,'Tìm được rồi, may mắn cho cháu và gia đình.'),(5,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',5,'tìm được rồi đó ông'),(6,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',6,'Cần áp dụng công nghệ trong quản lý trẻ trong trường học. Có lẽ nên cấp QR code cho người đón trẻ và khi ai đến đón trẻ sẽ cần quét QR code nhận diện'),(7,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',7,'Sao phải cầu kỳ thế làm gì? Trong khi bình thường hiện nay các trường vẫn quản lý kiểu giáo viên giao nhận trực tiếp với phụ huynh. Khi cần người khác đón giúp, phụ huynh phải báo trực tiếp với cô.'),(8,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',8,'Làm phức tạp thêm tăng chi phí phụ huynh đóng tiền nhiều hơn thì lại than'),(9,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',9,'vấn đề đơn giản làm gì phải phức tạp lên thế người lạ đón phải gọi điện xác minh với bố hoặc mẹ ,bất kể đó là ai. Vậy thôi.'),(10,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',10,'Cầu kỳ quá bạn ơi, chỉ những người đã được trường xác nhận mới được đăng ký trẻ. Dù có thuê người thì người phụ trách đón trẻ phải lên tận trường cùng người đó xác nhận với trường mới được đón. Khi nhờ người khác thì phải nhắn tin/gọi điện xác nhận với cô giáo, vậy là xong rồi. Còn nếu kẻ gian đã qua được 2 bước này thì mã QR bọn chúng cũng vượt qua được.'),(11,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',11,'bố mẹ tôi 70t, đi đón cháu chỉ cần tờ phiếu do sáng đó trường cung cấp - kiểu phiếu gửi xe 2 biên lai. Tất nhiên các cụ chả hiểu QR là gì'),(12,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',12,'Mong sao bé không bị ảnh hưởng tâm lý, không lo lắng sợ hãi!'),(13,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',13,'đợi công an làm rõ sự việc đã nhé.'),(14,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',14,'\"Mẹ bé thuê người đến đón thì được báo con đã về\"... Chắc bé đã quen với cách thuê người đến đón của mẹ!'),(15,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',15,'QR code nó như là cái file text thôi, có cái gì đâu mà thần thánh hóa lên vậy. Người không rành CNTT nhìn nó phức tạp chứ nó có cái gì đâu mà hở tí QR. Trường hợp này nhấc điện thoại gọi bố mẹ ông bà là được rồi'),(16,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',16,'Rồi bạn không tính đến bọn bắt cóc hack dc code à, cách tốt nhất là gọi điện hỏi và xác nhận là chính'),(17,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',17,'Đợi điều tra thôi chứ khả năng quen vs gia chủ'),(18,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',18,'Ông này không đọc bài à tìm thấy rồi đó còn gì'),(19,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',19,'Mình cũng đến ạ bạn , đây là may mắn, còn nếu ko ????'),(20,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',20,'Mong sao sẽ có sự liên hệ chặt chẽ hơn giữa thầy cô và phụ huynh. Nếu phụ huynh nhờ ai đón thì cũng nên cũng cấp ảnh người đón hoặc ít nhất là sdt người đón or cccd cho cô giáo.'),(21,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',21,'Bác bị sao vậy? Nhà 4 người xin 4 cái mã hả??? Gv chỉ cần hỏi tên người đón yêu cầu trẻ xác minh hoặc gọi về cho gia đình là ok mà.'),(22,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',22,'Cái gì cũng cần đến máy tính nó tính dùm'),(23,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',23,'May mắn cho cả cô giáo và nhà trường'),(24,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',24,'Đứa bé không khóc hay phản ứng gì, có lẽ kẻ bắt cóc đã tiếp cận với nó từ trước. Nó đến đúng vào lúc 1 trong 2 cô giáo nghỉ, lấy đứa bé dễ dàng mà cô còn lại không có chút nghi ngờ. Nó cũng biết luôn vị trí đặt camera ở khu vực xung quanh và có sự che dấu danh tính cẩn thận. Đây phải là 1 bọn bắt cóc chuyên nghiệp, tất cả đều đã được lên kế hoạch, tính toán từ trước. 1 người bị bệnh tâm thần không thể giỏi đến mức bắt cóc 1 đứa trẻ và đánh lừa cả 1 ngôi trường quá dễ dàng như vậy.'),(25,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',25,'Gia đình thuê người đến đón nên trẻ cũng chả biết ai với ai. Lỗi từ gia đình lớn nhất.'),(26,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',26,'Phụ huynh nên có thỏa thuận với thầy, cô là chỉ những ai mới đc đón thay. Nếu thấy ko phải là ng hay đi đón thì nên gọi điện cho ba mẹ xác minh lại xem ba mẹ có nhờ người này đón giùm không? Và nếu đứa trẻ từ 4t trở lên thì thầy cô phải hỏi kĩ bé: \" đây là ai? Con biết đây là ai không? Có quen họ không?\".... chứ lỗi này một phần do cô lơ là, ko sát sao. Và bản thân ba mẹ cũng nên dặn con ko đc đi theo ng lạ, giới hạn những ng có thể đón con cho con biết, thầy cô biết.'),(27,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',27,'Mừng quá ạ. Mong tin cả chiều nay!'),(28,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',28,'Tôi cũng xem tin liên tục. Mừng bé ko sao. Tôi nghĩ cô bé đó chắc không có ác ý. Hy vọng nhà trường rút kinh nghiệm sau những vụ như thế này. May mắn ko phải lúc nào cũng xảy ra.'),(29,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',29,'May quá, nhờ người dân phát hiện và vây xung quanh nên đã bắt được cô này.'),(30,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',30,'Xin chúc mừng bé và gia đình. Qua vụ việc này cũng thấy, quản lý của nhà trường và giáo viên rất lỏng lẻo. Một điều tôi nhận ra hình như là không có bảo vệ thì phải, điều này dễ dàng cho việc kẻ gian bắt cóc. Hy vọng đây là bài học cảnh tỉnh cho các trường khác, trông trẻ cẩn thận hơn nữa !!!'),(31,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',31,'Đọc bài thấy chi tiết \"Mẹ thuê người đến đón bé về\". Phải xem người được thuê có cố định để cô giáo biết không? Có vẻ em bé này thường được nhiều người khác nhau đón nên bé đi theo có vẻ như cảm thấy bình thường mà mà không chút sợ hãi hay băn khoăn gì!'),(32,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',32,'Nay hệ thống camera phủ khắp nên cũng dễ hơn trong việc truy tìm. Chúc mừng cháu bé đã về với gia đình.'),(33,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',33,'Người dân phát hiện ra ... nên giải cứu bé gái mà'),(34,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',34,'Người dân họ phát hiện và trực tiếp giữ lại, phải cảm ơn họ.'),(35,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',35,'Chúc mừng gia đình. Bài học nhớ đời cho cô giáo và nhà trường.'),(36,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',36,'Cảm ơn cháu không sao, cầu phúc cho cháu cả ngày ni.'),(37,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',37,'May quá đã tìm đc bé,cảm ơn người dân đã cảnh giác,phát hiện đối tượng kịp thời.Tôi cũng không hiểu quy trình bảo vệ của trường mầm non này ntn,chứ ngày trước trường mầm non con tôi học cha mẹ phải đăng kí người đón trẻ vs cô giáo từ đầu năm,nếu bất chợt có sự thay đổi người đón thì phải điện thoại báo cho giáo viên.Người đến đón phải nói đúng họ tên mình,cô giáo đã đc báo trước,thì mới đc đưa bé ra khỏi lớp.'),(38,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',38,'Quy trình này hình như là thông lệ rồi bạn, chắc giáo viên lơ là thôi'),(39,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',39,'Chúc mừng cháu và gia đình! Mặt tích cực của MXH.'),(40,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',40,'Nhà trường chủ quan, mà sao con bé nó chịu đi theo cả ngày trời nếu không quen thân nhỉ. Con mình 3 tuổi, người lạ nó còn k đến gần nói gì đến đưa ra trường'),(41,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',41,'Trong bài có đề cập đến việc mẹ nhờ người rước. Có lẽ cha mẹ bé này quá bận nên thường xuyên nhờ người khác rước về, dần tạo thói quen không cảnh giác người lạ.'),(42,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',42,'Đừng chủ quan, trẻ con chỉ cần dỗ bằng điện thoại, đồ chơi, đồ ăn là những lời người lớn dạy bay biến hết'),(43,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',43,'Ở đâu ra tư duy gia đình thuê người đón con là lỗi của gia đình thế bạn? Cực chẳng đã họ mới phải thuê người đón con. Việc giao trẻ mà không có tương tác với phụ huynh hoàn toàn lỗi giáo viên'),(44,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',44,'Ở đâu ra tư duy gia đình thuê người đón con là lỗi của gia đình thế bạn? Cực chẳng đã họ mới phải thuê người đón con. Việc giao trẻ mà không có tương tác với phụ huynh hoàn toàn lỗi giáo viên'),(45,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',45,'Đúng rồi, ko thể đổ lỗi cho gia đình đc. Chẳng ai muốn thuê ng đón con cả. Nhưng do cv nên hiện nay rất nhiều gia đình phải thuê ng đón con (hàng xóm, ng quen...). Và bài báo cũng ko nói rõ gia đình thuê 1 ng chuyên đi đón con hay nhiều ng. Cô giáo chỉ cần 1 cuộc gọi xác nhận với gia đình là đủ, ở đây là quá chủ quan.'),(46,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',46,'Đọc tin mà cảm thấy vui mừng khôn xiết, mong không có những vụ việc như thế này xẩy ra nữa'),(47,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',47,'Các Cô cần lưu ý về việc này để đảm bảo An toàn cho các Cháu.'),(48,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',48,'Tin vui trong ngày, chúc mừng gia đình cháu bé.'),(49,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',49,'Bộ giáo dục nên xây dựng qui trình đón trả bé.'),(50,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',50,'Người dân khi đọc thông tin trên báo, thấy Thu dẫn bé đi trên đường nên đã giữ lại, báo công an. Xin cảm ơn bác công dân gương mẫu và bác phóng viên viết bài kịp thời'),(51,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',51,'Giờ người dân họ rất cảnh giác , ai lạ mặt mới đến làm gì ,còn biết rõ hơn công an khu vực, 1 số vụ án khó bên công an họ nhờ sức mạnh nhân dân rất nhiều'),(52,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',52,'Cám ơn 2 chị đã rất cảnh giác phối hợp mau lẹ.'),(53,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',53,'May mắn nhất là cháu bé an toàn. Còn những cái khác xử lý theo quy định pháp luật.'),(54,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',54,'May là không vào tay kẻ thực sự gian ác. Chúc mừng gia đình. Một bài học cho nhà trường và giáo viên cấp mầm non và tiểu học'),(55,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',55,'Trường này quá bất cẩn! Đón cháu chỉ có người mà GV biết, tuyệt đối người lạ dù có nói rõ như thế nào cũng tuyệt đối không cho và phải báo ngay với người nhà!'),(56,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',56,'Đã bắt được người đưa bé gái ra khỏi trường an toàn, thật sự rất vui cho gia đình!'),(57,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',57,'CA Việt nam và người dân có trách nhiệm , kết hợp công nghệ camera tìm thấy cháu bé khá nhanh. Nhiệt liệt hoan nghênh !'),(58,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',58,'mẹ bé thuê người đến đón.... đây là 1 phần lý do người lạ có thể đón bất cứ khi nào'),(59,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',59,'May mà người dân chú ý và phát hiện được mới tìm được bé sớm. Mừng cho gia đình bé.'),(60,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',60,'Thương bé gái vs gia đình bé quá Thương cả cô gái có thể bị sức khỏe tinh thần.. VÀ rất trách trường Mầm non tắc trách...thậm chí dẫn đến sai lầm ko thể khắc phục được'),(61,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',61,'Chắc có vấn đề về tâm lý mới bắt cóc thế này chứ nếu là bọn buôn người thì nguy hiểm lắm .'),(62,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',62,'Sau Thu lại làm thế chứ, Thu không thích đón Xuân à?'),(63,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',63,'Bạn ấy chỉ đón Thu thôi, xuân bạn ấy chắc phải ở tạm trong nhà giam nhé'),(64,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',64,'May quá cháu nó không sao, nhưng nhà trường quá chủ quan, cần phải xem xét lại'),(65,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',65,'20 điểm cho 2 người phụ nữ, mỗi người 10 điểm.'),(66,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',66,'1 pha kết hợp giữa camera chạy điện và camera chạy bằng cơm'),(67,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',67,'Cô giáo sơ hở quá cả 2 cô, may mắn cho cháu và gia đình'),(68,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',68,'Hú hồn, Người dân và công an đã cứu cho cô giáo và gia đình một àn thua trông thấy.'),(69,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',69,'Nếu không đúng cha mẹ hoặc người đăng ký đi đón bé thì cô giáo phải gọi cha mẹ xác minh về người đón hộ chứ. Thật là chủ quan, cũng may là bé không sao.'),(70,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',70,'Bình thường giáo viên không phải gọi, mà phụ huynh muốn người khác đón thì phải gọi báo cho giáo viên'),(71,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',71,'Đúng rồi, muốn cho đón trẻ thì cha mẹ phải gọi điện cho cô giáo xác nhận là nhờ người nào đó đi đón.'),(72,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',72,'Cháu bị đón về trước thì có gọi cũng tác dụng gì nữa đâu? Đây là vấn đề của giáo viên và nhà trường không phải do bố mẹ nhé!'),(73,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',73,'Yêu cầu tất cả những người đến đón trẻ không được đội nón và đeo khẩu trang khi vào trường đón trẻ'),(74,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',74,'Mỗi học sinh nên có 1 thẻ ghi các thông tin về cha mẹ, họ hàng thân thuộc với số phone( những người có thể đón học sinh đó nếu cha mẹ bận) với trẻ nhỏ, người giữ trẻ phải liên lạc phụ huynh để chắc là họ nhờ người khác đón con'),(75,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',75,'Bà con nhà mình tuyệt quá, thấy việc cần đã lưu tâm, cùng chung tay quan sát và tìm kiếm cháu bé, đã giúp em bé an toàn và sớm về với gia đình.'),(76,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',76,'Mừng quá, Nhà trường cũng như các trường học cần nâng cao cảnh giác, có quy trình quản lý việc đón trả học sinh đồng thời tăng cường công tác hướng dẫn, dạy các kỹ năng cho các bé thì mới mong không có những sự cố như vậy xảy ra.'),(77,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',77,'Chúc mừng gia đình!'),(78,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',78,'điều may mắn đã đến.chúc mừng gia đình bé gái'),(79,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',79,'Chị Minh Thu, rất nhanh và thông minh. Một tình huống xuất hiện và xử lý của chị đã chứng minh điều đó. Hoan nghênh và trân trọng chị; đề nghị Cơ quan chức năng có hình thức khen thưởng kịp thời, xứng đáng cho cho chị Minh Thu! Chúc mừng gia đình đã nhận lại cháu bé, an toàn@'),(80,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',80,'TIN CỰC VUI, XIN CHÚC MÙNG GIA ĐÌNH BÉ'),(81,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',81,'Cô giáo cần rút kinh nghiệm. Ngoài bố mẹ ruột ra thì bất kỳ ai đón bé cũng phải gọi điện thông qua bố mẹ bé mới cho đón.'),(82,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',82,'chờ đọc tin này'),(83,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',83,'Tạ ơn trời phật phù hộ cháu ko sao r'),(84,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',84,'Ơn trời, bé đã bình yên vô sự'),(85,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',85,'Cầu mong, đừng làm gì tổn hại đến bé. Mong con sớm được tìm thấy và trở về với gia đình an toàn'),(86,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',86,'Rất cám ơn 2 cô đã nhanh trí và phối hợp đồng điệu để đưa cháu bé an toàn về với gia đình.'),(87,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',87,'Các trường mẫu giáo nên áp dụng thẻ đón con,cháu. Thẻ có thể in tên cha mẹ, tên bé và số điện thoại, bé cài một cái còn cái kia giao cho người nhà cháu. Nếu đến đón cháu thì bắt buộc phải trình thẻ. nếu là ông bà họặc họ hàng được nhờ thì cô cẩn thận gọi điện hỏi rõ thêm. Có thẻ mới được đón thì kẻ gian khó mà làm được. Nếu mất thẻ phải báo ngay cho nhà trường. Đây là việc mà một số trường đã áp dụng và rất hiệu quả.'),(88,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',88,'Quá may mắn bởi cô gái này không gây hại trẻ. Tuy cô này quý trẻ con (như thông tin từ địa phương) nhưng đây lại là bài học kinh nghiệm lớn cho các trường mầm non.'),(89,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',89,'Ôi mừng quá, bé con tội nghiệp, cứ biết lẳng lặng theo người lạ mà không la khóc gì.'),(90,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',90,'Nghĩ cũng thương cho cô gái này. Chắc rất quý trẻ con.'),(91,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',91,'Đừng võ đoán, thương trẻ thì có nhiều cách, cô gái này không hề là người thân của bé hoặc người phụ trách đưa đón'),(92,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',92,'Ơn trời! Thật vui cho bé và gia đình.'),(93,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',93,'Công an xác định người đưa bé gái ra khỏi trường là Đồng Thị Thu, 18 tuổi, ở phường Hoàng Lâm, thành phố Thủy Nguyên.'),(94,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',94,'Chưa xác nhận dc động cơ người này đưa bé gái đi'),(95,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',95,'Cảm ơn hai người phụ nữ đã nhận diện và giải thoát bé thành công. Thật tuyệt vời.'),(96,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',96,'Đề nghị là khi ra vào trường học bắt buộc phải tháo khẩu trang và xuất trình CCCD cho bảo vệ đối chiếu và ghi nhận . May là hậu quả chưa xảy ra nhưng cho thấy sự lỏng lẻo của các bảo vệ trường học .'),(97,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',97,'Đọc tin này ,nhẹ cả người.'),(98,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',98,'Cám ơn các chị đã giúp đỡ kịp thời.'),(99,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',99,'Chưa rõ động cơ là gì nhỉ? Hay do mình đọc bị sót?'),(100,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',100,'Chúc mừng gia đình đã tìm thấy cháu và vẫn an toàn.'),(101,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',101,'Chắc bạn Thu kia về trí óc có vấn đề chứ ko phải là người xấu hay có mục đích bắt cóc. Bằng chứng là bé khỏe mạnh và ko có dấu hiệu bị bạo hành. Cũng may mắn cho gia đình và là bài học cho các trường mầm non khác cẩn thận hơn. May là kết thúc tốt đẹp'),(102,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',102,'Tin rất mừng ngày hôm nay. Chúc mừng gia đình cháu.'),(103,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',103,'Tin vui nhất trong ngày.'),(104,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',104,'Chúc mừng Bé và Gia đình,Nhà trường và Mọi người Mọi nhà lấy đây là bài học quý giá'),(105,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',105,'Hôm lâu lâu mình đến đón cháu giúp chị dâu. Rõ là đã đến mấy lần rồi nhưng cô vẫn gọi cho mẹ bé để xác nhận xem có đúng là nhờ người này tới đón bé không. Hahaha, lúc ấy còn dỗi cô chứ. Giờ mới thấy cái khó của các cô. Những việc quan trọng này phải chuẩn chỉnh, cẩn thận không thừa.'),(106,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',106,'Cô gái bắt cóc chắc cũng là người không bình thường nhưng thích trẻ con, nên mới dẫn đi cùng như vậy.  Cháu bé an toàn là mừng rồi, đây cũng là bài học lớn cho trường mầm non và gia đình trong thống nhất đón trẻ'),(107,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',107,'cô gái này chắc có vấn đề về thần kinh, tâm thần nên mới như vậy'),(108,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',108,'Thì gia đình nói thần kinh nhưng thích trẻ con'),(109,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',109,'Ca này cũng dễ. Xác định rõ đối tượng. Chỉ sợ thần kinh không bình thường sẽ không trông nom được bé thôi. Chắc bị bệnh nhẹ nên cứ dắt đi chơi lang thang'),(110,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',110,'mình cảm giác bạn Thu này không có tâm lý tội phạm'),(111,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',111,'Mừng cho cháu và gia đình. Rất không đồng tình với nhà trường và giáo viên. Nguy hiểm quá.'),(112,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',112,'Nên làm thẻ đưa rước, đây là cách cuối cùng để giáo viên bàn giao, còn mất thẻ là lỗi phụ huynh...'),(113,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',113,'Xử kẻ xấu đó như thế nào ko thấy nói đến nhỉ?'),(114,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',114,'May quá đã tìm thấy cháu bé.'),(115,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',115,'Bé 3 buổi ko nhận ra ai với ai à , bình thường toàn cô phải hỏi ai đây chứ ?!'),(116,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',116,'Đáng trách cô giáo! chúc mừng cháu bé và gia đình'),(117,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',117,'Các cô bất cẩn quá, mình đón con lần 1 cô giáo đã bit mình là phụ huynh của ai rồi'),(118,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',118,'Nếu mà là kẻ mua, bán người thì phạt thật nặng để không bao giờ có cơ hội bắt cóc con nít'),(119,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',119,'Rất thông cảm cho cô giáo vì nếu không phải là cô gái này đón về thì cũng là 1 người chẳng liên quan được ba mẹ thuê đón bé. Bé đã quen với việc người lạ đón nên không phản ứng gì.'),(120,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',120,'Máy mắn quá rồi. Chúc mừng gia đình cháu bé'),(121,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',121,'May quá cháu đã được về nhà an toàn'),(122,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',122,'Những trường làm nghiêm thì chỉ những người trong danh sách gia đình đã đăng ký,có hình ảnh mới đón được cháu,và sẽ k thể xảy ra chuyện thế này !'),(123,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',123,'quy trình, vẫn là quy trình: bố mẹ muốn người khác đón hộ cần xác minh qua zalo hoặc gọi điện, quy trình lỏng lẻo thì xảy ra dễ như vậy thôi'),(124,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',124,'Mọi người có lưu ý điểm là gia đình thuê người đón em bé không, đây có thể là điểm mấu chốt nên đứa bé mới dễ dàng được người lạ đón.'),(125,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',125,'2 chị kia thật là tốt'),(126,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',126,'cái quan trọng là bé này lại theo người lạ để về cơ'),(127,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',127,'Người lạ sao dẫn dc nhỉ'),(128,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',128,'bao nhiêu năm mình đưa đón con hộ mọi người rất nhiều. Yêu cầu người nhờ phải nhắn tin cho mình và nhắn cho cô nữa'),(129,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',129,'trường mầm non kể cả ở quê mình. 2 cô thì se 1 cô đến sớm đơn trẻ, 1 cô thì hơn 8h chưa đến. Chiều 1 cô chưa tới 4h đã về còn 1 cô trả trẻ. Có khi m đến đón các cô còn đang buôn ở lớp khác ko có cô nào trong lớp'),(130,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',130,'Mẹ cháu thuê người đến đón. Nên cô cũng không biết bàn giao cháu cho ai.'),(131,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',131,'Nhà trường tắc trách quá. Sao có thể cho đón con đơn giản như vậy được.'),(132,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',132,'Cảm ơn người dân đã rất xông pha. Nhiều sự việc nhờ người dân nên phá án rất nhanh.'),(133,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',133,'Thở phào khi bé bình yên trở về với gia đình, bài học lớn cho các trường mầm non khi quản lí các cháu bé!'),(134,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',134,'Cô gái cũng có thể là một người đáng thương. Thật tội nghiệp. Hy vọng tinh thần sẽ ổn định hơn.'),(135,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',135,'May mắn quá,chúc mừng bé đã được về đoàn tụ với gia đình'),(136,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',136,'Lớp con tôi 50 bé , 2 cô giáo, tôi thấy các cô giao trẻ cũng không đảm bảo nhưng vấn đề vẫn còn đó, thẻ đưa đón bé chỉ dùng mấy ngày đầu, về sau không được dùng nữa tuy là các cô nhận ra người thân của bé ( xin lỗi các cô giáo tôi biết là do số lượng trẻ quá đông, nhưng phụ huynh cũng không được lựa chọn vì tình trạng quá tải ở nơi tôi sống ) , cơ bản là không đảm bảo khi đôi lúc có người vẫn đón dùm người khác được'),(137,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',137,'Cảm ơn chị Minh Thu. Chị thật tuyệt vời.'),(138,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',138,'Bao nhiêu bài học, bao nhiêu lần rút kinh nghiệm mà vẫn để xảy ra trường hợp tương tự. Ơn giời cháu đã bình an!'),(139,1,'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html',139,'Nên xay dựng tiêu chí rõ ràng về sỉ số giáo viên/học sinh ở mầm non và quy định 1 lớp phải ít nhất phải có 3 cô. Mầm non cỡ 15hs/3 cô là hợp lý');
/*!40000 ALTER TABLE `crawler_results` ENABLE KEYS */;
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
