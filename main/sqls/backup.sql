-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: main_db
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Table structure for table `Article`
--

DROP TABLE IF EXISTS `Article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `author` int(11) NOT NULL,
  `content` varchar(10000) CHARACTER SET utf8 NOT NULL,
  `publish_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Article`
--

LOCK TABLES `Article` WRITE;
/*!40000 ALTER TABLE `Article` DISABLE KEYS */;
INSERT INTO `Article` VALUES (1,1,'測試',1,'這是測試！','2018-12-30 23:35:41','2018-12-30 23:35:41'),(2,1,'Test addArticle',1,'測試QQ\r\n好慘\r\n時間： 2018/12/31 04:43','2018-12-31 04:43:51','2018-12-31 04:43:51'),(6,1,'安安',1,'jsadfklasjl;dfkjaskasdfj\'a;sdkflasjdl;fkasjld;kfjsalkdjflaksjdf\r\nkasdfklasjdlfjasldk;fjasl;kdfjasTest\r\nBojlksdjlkfasjdbronwiniscutelkjdasl;fkjasldkjfalskdf','2019-01-16 17:04:31','2019-01-16 22:22:52'),(8,1,'你好',1,'嗎','2019-01-16 17:17:17','2019-01-16 17:17:17'),(12,1,'終於修好了',1,'QQQQQQ','2019-01-16 17:31:53','2019-01-16 22:23:03'),(13,1,'0u0',1,'ouo\r\nQAQ\r\n','2019-01-16 23:19:15','2019-01-16 23:19:15'),(14,1,'你好啊',5,'<p><em>yeah 我又來測試囉</em></p>\r\n','2019-01-17 04:46:29','2019-01-17 04:46:29'),(15,1,'安安安',1,'<p>我終於又弄好了QQ</p>\r\n\r\n<p>讚啦</p>\r\n','2019-01-17 05:08:37','2019-01-17 05:40:30'),(16,1,'奕君好可愛喔',1,'<p><span style=\"font-size:28px\"><span style=\"font-family:Comic Sans MS,cursive\">Love You ~</span></span></p>\r\n','2019-01-17 05:16:26','2019-01-17 05:16:26'),(17,1,'奕君好可愛~',1,'<p><img alt=\"\" src=\"https://scontent-tpe1-1.xx.fbcdn.net/v/t1.15752-9/s2048x2048/48414480_946534028876082_2250879062891298816_n.jpg?_nc_cat=102&amp;_nc_ht=scontent-tpe1-1.xx&amp;oh=21affc1dd270af58fd40a225e419697f&amp;oe=5CB67570\" style=\"height:1422px; width:800px\" /></p>\r\n\r\n<p><span style=\"color:#e74c3c\"><span style=\"font-size:28px\">奕君我愛妳~</span></span></p>\r\n\r\n<p><span style=\"font-family:Comic Sans MS,cursive\"><span style=\"color:#e74c3c\"><span style=\"font-size:28px\">Love You~</span></span></span></p>\r\n','2019-01-17 05:33:33','2019-01-17 05:33:33'),(18,1,'奕君~~~~',1,'<p><img alt=\"\" src=\"https://scontent-tpe1-1.xx.fbcdn.net/v/t1.15752-9/s2048x2048/48414480_946534028876082_2250879062891298816_n.jpg?_nc_cat=102&amp;_nc_ht=scontent-tpe1-1.xx&amp;oh=21affc1dd270af58fd40a225e419697f&amp;oe=5CB67570\" style=\"height:533px; width:300px\" /></p>\r\n\r\n<p><span style=\"color:#e74c3c\"><span style=\"font-size:24px\"><span style=\"font-family:Comic Sans MS,cursive\">最愛奕君了~</span></span></span></p>\r\n\r\n<p><span style=\"color:#e74c3c\"><span style=\"font-size:24px\"><span style=\"font-family:Comic Sans MS,cursive\">Love You~</span></span></span></p>\r\n','2019-01-17 05:35:40','2019-01-17 05:35:40'),(19,1,'安安測試',1,'<p><span style=\"font-size:26px\">你好</span></p>\r\n\r\n<p><strong><span style=\"font-size:26px\"><img alt=\"\" src=\"https://i.ytimg.com/vi/W43FJw3yKGM/hqdefault.jpg\" style=\"height:360px; width:480px\" /></span></strong></p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>1</td>\r\n			<td>4</td>\r\n		</tr>\r\n		<tr>\r\n			<td>5</td>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>6</td>\r\n			<td>3</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n','2019-01-20 10:56:11','2019-01-20 10:56:11'),(20,13,'籃球籃球',1,'<p>打籃球</p>\r\n\r\n<p>2019/01/31</p>\r\n\r\n<p>&nbsp;</p>\r\n','2019-01-31 14:59:04','2019-01-31 14:59:04');
/*!40000 ALTER TABLE `Article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BuyPredict`
--

DROP TABLE IF EXISTS `BuyPredict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BuyPredict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `predict_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BuyPredict`
--

LOCK TABLES `BuyPredict` WRITE;
/*!40000 ALTER TABLE `BuyPredict` DISABLE KEYS */;
INSERT INTO `BuyPredict` VALUES (1,1,38);
/*!40000 ALTER TABLE `BuyPredict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `id` int(11) NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 NOT NULL,
  `description` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,'公告','Announcement',1),(2,'生活閒聊',NULL,1),(3,'黑特',NULL,1),(4,'投票',NULL,1),(5,'炫燿',NULL,1),(6,'精華',NULL,1),(7,'MLB',NULL,2),(8,'日本職棒',NULL,2),(9,'中華職棒',NULL,2),(10,'韓國職棒',NULL,2),(11,'墨西哥棒球',NULL,2),(12,'澳洲職棒',NULL,2),(13,'NBA',NULL,3),(14,'WNBA',NULL,3),(15,'韓國職籃',NULL,3),(16,'日本職籃',NULL,3),(17,'歐洲職籃',NULL,3),(18,'中國職籃',NULL,3),(19,'西甲職籃',NULL,3),(20,'SBL',NULL,3),(21,'菲律賓籃球',NULL,3),(22,'百家樂',NULL,4),(23,'彩票',NULL,5),(24,'北京賽車',NULL,6),(25,'足球',NULL,7),(26,'NHL冰球',NULL,7),(27,'俄羅斯冰球',NULL,7),(28,'賽馬',NULL,7),(29,'美式足球',NULL,7),(30,'網球',NULL,7),(31,'電競',NULL,7);
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Class`
--

DROP TABLE IF EXISTS `Class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 NOT NULL,
  `description` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Class`
--

LOCK TABLES `Class` WRITE;
/*!40000 ALTER TABLE `Class` DISABLE KEYS */;
INSERT INTO `Class` VALUES (1,'通用看板',NULL),(2,'棒球',NULL),(3,'籃球',NULL),(4,'百家樂',NULL),(5,'彩票',NULL),(6,'北京賽車',NULL),(7,'其他',NULL);
/*!40000 ALTER TABLE `Class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(5000) CHARACTER SET utf8 NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
INSERT INTO `Comment` VALUES (1,1,3,'<p>安安安安</p>\r\n<p><span style=\"color: #0000ff;\">你好</span></p>\r\n<p><strong>這是測試~</strong></p>\r\n<table border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>這是表格~</td>\r\n<td>安安</td>\r\n<td>你好</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><img src=\"data:image/jpeg;base64,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\" alt=\"\" width=\"261\" height=\"193\" /></p>','2019-01-17 01:18:29'),(2,1,2,'讚喔~','2019-01-17 01:21:11'),(3,1,1,'<p>å®‰å®‰</p>\r\n\r\n<p><strong>æ¸¬è©¦~</strong></p>\r\n','2019-01-17 04:25:12'),(4,1,1,'<p><em>安安</em></p>\r\n\r\n<p><strong>這是第二次測試QQ</strong></p>\r\n','2019-01-17 04:28:11'),(5,1,1,'<p>喔喔喔喔</p>\r\n\r\n<p><strong>好像成功了~</strong></p>\r\n','2019-01-17 04:28:53'),(6,6,5,'<p>好爽喔喔喔喔喔喔</p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<caption>你好~</caption>\r\n	<tbody>\r\n		<tr>\r\n			<td>1</td>\r\n			<td>2</td>\r\n			<td>3</td>\r\n		</tr>\r\n		<tr>\r\n			<td>4</td>\r\n			<td>5</td>\r\n			<td>6</td>\r\n		</tr>\r\n		<tr>\r\n			<td>7</td>\r\n			<td>8</td>\r\n			<td>9</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><img alt=\"\" src=\"https://pm1.narvii.com/6410/bab1d75c20a3e66f68b304dd5329edac78ebe2ff_hq.jpg\" style=\"height:544px; width:500px\" /></p>\r\n\r\n<p>累爆QQQQQ</p>\r\n\r\n<p>&nbsp;</p>\r\n','2019-01-17 04:33:16'),(7,19,1,'<p><strong><span style=\"font-size:48px\"><span style=\"font-family:Comic Sans MS,cursive\">測試~</span></span></strong></p>\r\n','2019-01-20 10:56:50');
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Game`
--

DROP TABLE IF EXISTS `Game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `date` varchar(10) NOT NULL,
  `time` varchar(10) NOT NULL,
  `home_team` varchar(20) CHARACTER SET utf8 NOT NULL,
  `away_team` varchar(20) CHARACTER SET utf8 NOT NULL,
  `game_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Game`
--

LOCK TABLES `Game` WRITE;
/*!40000 ALTER TABLE `Game` DISABLE KEYS */;
INSERT INTO `Game` VALUES (1,27,'02-23','08:30','芝加哥黑鷹','科羅拉多雪崩',NULL),(2,27,'02-23','10:00','卡爾加里火焰','安那翰鴨',NULL),(3,27,'02-23','11:00','維加斯黃金騎士','溫尼伯噴氣機',NULL),(4,27,'02-22','19:30','昆侖紅星','哈薩克斯坦.雪豹',NULL),(5,27,'02-22','22:00','馬格尼托哥爾斯克.麥特魯格','喀山雪豹',NULL),(6,27,'02-22','22:00','拖拉機','聖彼得堡陸軍',NULL),(7,27,'02-23','00:00','北方鋼鐵','斯巴達克',NULL),(8,27,'02-23','00:30','鄂木斯克先鋒','西伯利亞',NULL),(9,27,'02-23','00:30','莫斯科.迪納莫','下諾夫格勒德.魚雷',NULL),(10,27,'02-23','00:30','索契','斯洛萬',NULL),(11,27,'02-23','00:30','維塔茲','阿夫托莫比利斯特',NULL),(12,27,'02-23','00:30','中央陸軍','里加.迪納莫',NULL),(13,27,'02-23','00:30','祖卡列特','明斯克.迪納莫',NULL),(14,27,'02-23','02:15','ERC因戈爾施塔特','艾斯巴倫柏林',NULL),(15,27,'02-23','02:15','奧格斯伯格黑豹','科隆鯊魚',NULL),(16,27,'02-23','02:15','不來梅港企鵝','克雷菲爾德企鵝',NULL),(17,27,'02-23','02:15','曼海姆海鷹','EHC慕尼黑紅牛',NULL),(18,27,'02-23','02:15','施特勞賓猛虎','伊瑟隆公雞',NULL),(19,27,'02-23','02:15','斯溫寧格爾野翼','斯沃爾夫斯堡灰熊',NULL),(20,27,'02-23','02:15','托馬斯薩博冰虎','杜賽爾多夫EG',NULL),(21,27,'02-23','02:45','ZSC獅隊','盧加諾',NULL),(22,27,'02-23','02:45','比爾','SCL老虎',NULL),(23,27,'02-23','02:45','伯爾尼','達沃斯',NULL),(24,27,'02-23','02:45','弗里堡戈塔隆','阿姆比利派奧塔',NULL),(25,27,'02-23','02:45','拉珀斯維爾喬納湖人','日內瓦塞維特',NULL),(26,27,'02-23','02:45','洛桑','楚格',NULL),(27,27,'02-23','02:00','埃斯比約能源','歐登塞牛頭犬',NULL),(28,27,'02-23','02:00','路道夫大力牛','奧爾堡海盜',NULL),(29,27,'02-23','02:30','海寧藍狐','海萊烏老鷹',NULL),(30,27,'02-23','02:30','龍斯泰茲','桑德捷斯基',NULL),(31,27,'02-23','00:30','PSG辛寧','布拉格斯巴達',NULL),(32,27,'02-23','00:30','博萊斯拉夫','斯柯達皮爾森',NULL),(33,27,'02-23','00:30','卡羅維能源','科梅塔布爾諾',NULL),(34,27,'02-23','00:30','皮拉提霍穆托夫','帕爾杜比採迪納摩',NULL),(35,27,'02-23','00:30','維克韋騎士','特日內茨',NULL),(36,27,'02-23','01:00','奧洛穆茨','比利提古里利貝雷茨',NULL),(37,27,'02-23','01:00','蒙特菲爾德','利特威諾夫',NULL),(38,27,'02-23','00:30','HIFK','尤庫里特',NULL),(39,27,'02-23','00:30','JYP於韋斯屈萊','庫庫',NULL),(40,27,'02-23','00:30','拉赫蒂派利肯','亞薩特',NULL),(41,27,'02-23','00:30','鹿科','卡帕',NULL),(42,27,'02-23','00:30','塞帕','歐倫卡帕特',NULL),(43,27,'02-23','00:30','瓦薩運動','HPK',NULL),(44,27,'02-23','00:30','伊爾韋斯','塔帕拉',NULL),(45,27,'02-23','01:00','塞克什白堡','維也納首都',NULL),(46,27,'02-23','02:15','多恩比恩','林茨黑翼',NULL),(47,27,'02-23','02:15','克拉根福AC','摩瑟醫療格拉茨',NULL),(48,27,'02-23','02:15','薩爾斯堡紅牛','博爾扎諾狐狸',NULL),(49,27,'02-23','02:15','因斯布魯克','菲拉赫SV',NULL);
/*!40000 ALTER TABLE `Game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderId` int(11) NOT NULL,
  `receiverId` int(11) NOT NULL,
  `sendTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subject` varchar(60) CHARACTER SET utf8 NOT NULL,
  `message` text CHARACTER SET utf8 NOT NULL,
  `readFlag` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Message`
--

LOCK TABLES `Message` WRITE;
/*!40000 ALTER TABLE `Message` DISABLE KEYS */;
INSERT INTO `Message` VALUES (1,1,2,'2019-02-01 16:40:30','測試喔喔喔','<p><span style=\"color:#1abc9c\">你好啊這是測試信</span></p>\r\n',0),(2,1,1,'2019-02-01 16:57:12','測試~','<p>132456789</p>\r\n',1),(6,1,1,'2019-02-02 00:04:39','我再試試','<p><span style=\"font-size:72px\"><span style=\"font-family:Comic Sans MS,cursive\"><tt>2019/02/02</tt></span></span></p>\r\n\r\n<p><span style=\"font-size:72px\"><span style=\"font-family:Comic Sans MS,cursive\"><tt>00:04</tt></span></span></p>\r\n',0),(7,2,1,'2019-02-02 03:30:48','寄信給系統','<p><strong><span style=\"color:#d35400\"><span style=\"font-size:16px\">安安你好啊</span></span></strong></p>\r\n',1),(8,1,1,'2019-03-09 00:20:59','HI','<p><span style=\"color:#e74c3c\"><span style=\"font-size:20px\"><span style=\"font-family:Comic Sans MS,cursive\">2019/3/9 00:20</span></span></span></p>\r\n',1),(9,1,1,'2019-03-10 15:41:04','HIHIHI','<p>djsakfjlkdsaf</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>dsfksaldjfklasdkfasdfjas</p>\r\n\r\n<p>asdjfklaskdf</p>\r\n\r\n<p>jakdfjasdf</p>\r\n\r\n<p>askjdfkajsf</p>\r\n\r\n<p><img alt=\"\" src=\"https://kids.nationalgeographic.com/content/dam/kids/photos/articles/Science/H-P/heart.adapt.945.1.jpg\" style=\"height:531px; width:945px\" /></p>\r\n',1);
/*!40000 ALTER TABLE `Message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Predict`
--

DROP TABLE IF EXISTS `Predict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Predict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `predict` char(1) NOT NULL,
  `predict_flag` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Predict`
--

LOCK TABLES `Predict` WRITE;
/*!40000 ALTER TABLE `Predict` DISABLE KEYS */;
INSERT INTO `Predict` VALUES (1,1,1,27,'a',0,99),(2,3,1,27,'A',0,99),(3,2,1,27,'A',0,99),(4,2,1,27,'A',1,99),(5,3,1,27,'A',2,99),(6,4,1,27,'A',1,99),(7,5,1,27,'A',1,99),(8,6,1,27,'A',2,99),(9,7,1,27,'A',2,99),(10,1,2,27,'A',2,99),(11,2,2,27,'a',1,99),(12,3,2,27,'A',2,99),(13,4,2,27,'A',2,99),(14,5,2,27,'A',1,99),(15,1,3,27,'A',1,99),(16,2,3,27,'A',1,99),(17,3,3,27,'A',1,99),(18,4,3,27,'A',1,99),(19,5,3,27,'A',2,99),(20,1,4,27,'A',1,99),(21,2,4,27,'A',1,99),(22,3,4,27,'A',2,99),(23,1,5,27,'A',1,99),(24,2,5,27,'A',2,99),(25,3,5,27,'A',2,99),(26,1,6,27,'A',2,99),(27,2,6,27,'A',1,99),(28,1,1,27,'b',2,99),(29,1,1,27,'C',1,99),(30,3,2,27,'B',2,99),(31,3,2,27,'c',1,99),(32,3,2,27,'D',2,99),(33,3,2,27,'E',1,99),(34,2,2,27,'B',1,99),(35,2,2,27,'C',2,99),(36,2,2,27,'d',2,99),(37,2,2,27,'E',2,99),(38,33,2,27,'a',0,99),(39,14,2,27,'a',0,99),(40,14,2,27,'b',0,99),(41,14,2,27,'c',0,99),(42,14,2,27,'D',0,99),(43,14,2,27,'E',0,99);
/*!40000 ALTER TABLE `Predict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `image_url` varchar(120) NOT NULL DEFAULT 'images/product/test.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'黑色高跟鞋',3,100,'images/product/shoes/black.png'),(2,'深藍色高跟鞋',3,200,'images/product/shoes/dark-blue.png'),(3,'綠色高跟鞋',3,100,'images/product/shoes/green.png'),(4,'紅色高跟鞋',3,150,'images/product/shoes/red.png'),(5,'黃色高跟鞋',3,180,'images/product/shoes/yellow.png');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductCategory`
--

DROP TABLE IF EXISTS `ProductCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductCategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `e_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductCategory`
--

LOCK TABLES `ProductCategory` WRITE;
/*!40000 ALTER TABLE `ProductCategory` DISABLE KEYS */;
INSERT INTO `ProductCategory` VALUES (1,'髮型','hairstyles'),(2,'衣服','clothes'),(3,'鞋子','shoes');
/*!40000 ALTER TABLE `ProductCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rating`
--

DROP TABLE IF EXISTS `Rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `failure` int(11) NOT NULL,
  `success` int(11) NOT NULL,
  `rating` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rating`
--

LOCK TABLES `Rating` WRITE;
/*!40000 ALTER TABLE `Rating` DISABLE KEYS */;
INSERT INTO `Rating` VALUES (1,1,27,2,3,60),(2,2,27,3,2,40),(3,3,27,1,4,80),(4,4,27,1,2,66.6667),(5,5,27,2,1,33.3333),(6,6,27,1,1,50);
/*!40000 ALTER TABLE `Rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nickname` varchar(30) CHARACTER SET utf8 NOT NULL,
  `email` varchar(60) NOT NULL,
  `gender` bit(1) DEFAULT NULL,
  `image` varchar(90) DEFAULT NULL,
  `money` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `nickname` (`nickname`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'justin','justin0820','justin0u0','dancinglinkxalgorithm@gmail.com',_binary '\0','0',802),(2,'a','a','a','a@gmail.com',_binary '','0',1000),(3,'peter10','peter1010','peter','peter000@gmail.com',_binary '\0','0',1000),(4,'llstylish','prrrrrrrr','stylish','stylish@gmail.com',_binary '\0','0',1000),(5,'b','b','b','b@gmail.com',_binary '','0',1000),(6,'x','xxxxx','xxxxx','x@gmail.com',_binary '','0',1000),(7,'c','c','c','c@gmail.com',_binary '\0','0',1000),(8,'d','d','d','d@gmail.com',_binary '','0',1000),(9,'zz','zz','zz','zz@gmail.com',_binary '\0','0',1000),(10,'z','z','z','z@gmail.com',_binary '\0','0',1000),(11,'lalalal','lalal','ajkldafasdfsadf','la@gmail.com',_binary '','0',1000),(12,'jasdkf','ajsdkfjas','jaskldfj','ajklaf@gmail.com',_binary '\0','0',1000);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-17 13:25:19
