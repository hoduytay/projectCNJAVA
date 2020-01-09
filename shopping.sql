/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL
 Source Server Type    : MySQL
 Source Server Version : 50051
 Source Host           : localhost:3306
 Source Schema         : shopping

 Target Server Type    : MySQL
 Target Server Version : 50051
 File Encoding         : 65001

 Date: 09/01/2020 14:07:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `parent` int(11) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`category_id`)
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Truyện tranh', 0);
INSERT INTO `category` VALUES (2, 'Truyện trinh thám', 1);
INSERT INTO `category` VALUES (3, 'Truyện cổ tích', 1);
INSERT INTO `category` VALUES (4, 'Học tập', 0);
INSERT INTO `category` VALUES (5, 'Sách công nghệ', 4);
INSERT INTO `category` VALUES (6, 'Thư viện pháp luật', 4);
INSERT INTO `category` VALUES (7, 'Tâm Lý - Kỹ năng sống', 0);
INSERT INTO `category` VALUES (8, 'Kinh tế - Quản Lý', 0);
INSERT INTO `category` VALUES (9, 'Marketing - Bán Hàng', 0);
INSERT INTO `category` VALUES (10, 'Khoa học - Kỹ Thuật', 0);
INSERT INTO `category` VALUES (11, 'Văn Hóa - Tôn Giáo', 0);
INSERT INTO `category` VALUES (13, '', NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`product_id`)
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 2, 'Câu chuyện tình yêu kể về chuyện tình của nam chính mệnh danh là núi băng cùng với cô nàng thích đùa với lửa. Anh có xuất thân là thiếu tướng, hiện tại thân phận khác đó là một tổng giám đốc bá đạo và lạnh lùng trong giới làm ăn. Cũng vì vậy mà bạch đạo s', 'img.png', 'Nàng Dâu Cực Phẩm', 50000);
INSERT INTO `product` VALUES (2, 3, 'Truyện cổ tích Việt Nam là những truyện truyền miệng dân gian kể lại những câu chuyện tưởng tượng xoay quanh một số nhân vật quen thuộc như nhân vật thông minh,ngốc nghếch, nhân vật dũng sĩ, người mồ côi, người em út, người con riêng, người nghèo khổ, ngư', 'img.png', 'Bốn Anh Tài', 30000);
INSERT INTO `product` VALUES (3, 5, 'Blockchain là chủ đề đang vô cùng nóng trên toàn cầu hiện nay. Nó cùng với Bitcoin và tiền kỹ thuật số trở thành đề tài bàn luận trên rất nhiều mặt báo và trong những cuộc trò chuyện của mọi người. Tuy nhiên, khi nói về blockchain vẫn còn nhiều tranh cãi.', 'img.png', 'Công Nghệ BlockChain', 40000);
INSERT INTO `product` VALUES (4, 6, 'Luật hành chính Việt Nam là tổng thể những quy phạm pháp luật điều chỉnh những quan hệ chấp hành và điều chỉnh những quan hệ chấp hành và điều hành phát sinh, phát triển trong lĩnh vực tổ chức và hoạt động hành chính nhà nước. Những quy phạm pháp luật hàn', 'img.png', 'Giáo Trình Luật Hành Chính Việt Nam', 50000);
INSERT INTO `product` VALUES (5, 2, 'Dù bạn có là ai, có đọc bao nhiêu lần thì vẫn thấy thú vị!! Vượt qua thời gian, vượt qua thế hệ, đây là danh tác luôn được yêu quý và đón nhận!! Doraemon Plus là tuyển tập những truyện ngắn về Doraemon và các bạn của tác giả Fujiko F Fujio từng được đăng ', 'img.png', 'Truyện Tranh Doraemon Nhật Bản', 25000);
INSERT INTO `product` VALUES (6, 2, 'Ở một hòn đảo nọ, có một ngôi trường chuyên nhận nuôi trẻ mồ côi. Mọi chuyện sẽ chẳng có gì nếu như trong nhóm học sinh không xuất hiện những lời đồn đãi về một bí mật khủng khiếp mà những giáo viên trên đảo này đang che dấu. Mọi chuyện càng trở nên nghiê', 'img.png', 'Truyện Tranh Đảo Kinh Hoàng', 30000);
INSERT INTO `product` VALUES (7, 3, 'Truyện cổ tích Việt Nam là những truyện truyền miệng dân gian kể lại những câu chuyện tưởng tượng xoay quanh một số nhân vật quen thuộc như nhân vật thông minh,ngốc nghếch, nhân vật dũng sĩ, người mồ côi, người em út, người con riêng, người nghèo khổ, ngư', 'img.png', 'Chàng Ngốc Học Khôn', 35000);
INSERT INTO `product` VALUES (8, 3, 'Truyện cổ tích Việt Nam là những truyện truyền miệng dân gian kể lại những câu chuyện tưởng tượng xoay quanh một số nhân vật quen thuộc như nhân vật thông minh,ngốc nghếch, nhân vật dũng sĩ, người mồ côi, người em út, người con riêng, người nghèo khổ, ngư', 'img.png', 'Đeo Nhạc Cho Mèo', 30000);
INSERT INTO `product` VALUES (9, 5, 'Sách này trình bày dưới dạng song ngữ Anh - Việt các câu hỏi đáp về Khoa học và Công nghệ – có tất cả 77 chủ điểm bao gồm mọi lĩnh vực từ khoa học thuần túy như “Ai đã khám phá ra cấu trúc nguyên tử?”, “Kính tiềm vọng thường được đặt ở đâu?” cho đến những', 'img.png', 'Những Điều Bạn Nên Biết Về KHoa Học ', 45000);
INSERT INTO `product` VALUES (10, 6, 'Luật an ninh mạng 2018 được Quốc hội thông qua ngày 12/6/2018 và bắt đầu có hiệu lực thi hành kể từ ngày 01/01/2019. Luật an ninh mạng gồm có 07 Chương và 43 Điều, trong đó, nêu ra các nguyên tắc bảo vệ an ninh mạng như sau:\r\n\r\nTuân thủ Hiến pháp và pháp ', 'img.png', 'Luật An Ninh Mạng - 2018', 50000);
INSERT INTO `product` VALUES (11, 6, 'Nội dung sách bao gồm các văn bản quy phạm pháp luật quy định về địa vị pháp lý, chuẩn mực pháp lý cho cách ứng xử của cá nhân, pháp nhân, chủ thể khác; quyền, nghĩa vụ của các chủ thể về nhân thân và tài sản trong các quan hệ dân sự, hôn nhân và gia đình', 'img.png', 'Bộ Luật Dân Sự', 50000);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `role` int(11) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`user_id`)
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '12345', 1, 'admin');
INSERT INTO `user` VALUES (2, '12345', 1, 'admin');
INSERT INTO `user` VALUES (3, '12345', 1, 'duytay');
INSERT INTO `user` VALUES (4, '12345', 2, 'khanh');
INSERT INTO `user` VALUES (5, '123456', 2, 'test');
INSERT INTO `user` VALUES (6, '123456', 2, 'test1');

SET FOREIGN_KEY_CHECKS = 1;
