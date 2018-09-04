-- MySQL dump 10.13  Distrib 5.5.54, for Win64 (AMD64)
--
-- Host: localhost    Database: Vpay1
-- ------------------------------------------------------
-- Server version	5.5.54-log

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
-- Table structure for table `nc_admin`
--

DROP TABLE IF EXISTS `nc_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nc_admin` (
  `a_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `a_uname` varchar(20) NOT NULL COMMENT '用户名',
  `a_true_name` varchar(20) NOT NULL COMMENT '真名',
  `a_telephone` varchar(40) NOT NULL,
  `a_email` varchar(64) NOT NULL,
  `a_passwd` varchar(255) NOT NULL,
  `a_login_count` mediumint(8) NOT NULL COMMENT '登录次数',
  `a_last_login_ip` varchar(40) NOT NULL COMMENT '最后登录ip',
  `a_last_ip_region` varchar(40) NOT NULL,
  `a_create_time` int(11) NOT NULL COMMENT '创建时间',
  `a_last_login_time` int(11) NOT NULL COMMENT '最后登录',
  `a_status` tinyint(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nc_admin`
--

LOCK TABLES `nc_admin` WRITE;
/*!40000 ALTER TABLE `nc_admin` DISABLE KEYS */;
INSERT INTO `nc_admin` VALUES (1,'admin','','','admin@admin.com','MDAwMDAwMDAwMJN+d9uzhYGsssyIaw',1082,'27.154.250.41','',1470304751,1531315765,1);
/*!40000 ALTER TABLE `nc_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nc_menu`
--

DROP TABLE IF EXISTS `nc_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nc_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `url` char(255) DEFAULT NULL COMMENT '链接地址',
  `icon` varchar(20) DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nc_menu`
--

LOCK TABLES `nc_menu` WRITE;
/*!40000 ALTER TABLE `nc_menu` DISABLE KEYS */;
INSERT INTO `nc_menu` VALUES (1,0,'系统信息','','icon-book',7),(29,28,'商品管理','Goods/index','',2),(36,35,'订单管理','Order/index','',1),(38,37,'基本信息','settings/general','',1),(40,37,'邮件配置','settings/smtp_mail','',3),(43,0,'用户','','icon-user-md',0),(46,37,'配置管理','Config/index','',5),(47,43,'后台用户','AdminUser/index','',3),(51,1,'基本信息','settings/general','',1),(54,53,'文章分类','BlogCategory/index','',0),(55,53,'文章列表','Blog/index','',3),(56,28,'商品分类','GoodsCategory/index','',1),(66,65,'充值管理','member/chongzhi',NULL,2),(68,65,'资金充值','Member/rmb',NULL,1),(69,65,'资金记录','Member/zijing',NULL,5),(75,74,'投诉列表','/Form/bdlist/bd_id/8',NULL,0),(83,82,'投诉列表','Form/bdlist/bd_id/8',NULL,0),(85,84,'分润记录','Record/fenrun',NULL,1),(88,84,'赠送记录','Record/transaction',NULL,4),(140,107,'总后台店铺','Goods/dianpu',NULL,1),(93,84,'交易记录','Record/sell',NULL,3),(94,84,'团队分红','Record/tuandui',NULL,0),(97,96,'商品管理','Goods/index',NULL,0),(99,96,'商城订单','Goods/shoporder',NULL,0),(102,101,'道具管理','Gpgoods/index','',0),(106,0,'订单','','icon-book',3),(107,0,'商城','','icon-gift',2),(108,106,'订单管理','Order/index',NULL,0),(109,107,'商品管理','Goods/index',NULL,5),(115,110,'其他配置','Gameconfigs/Othersconfig',NULL,16),(116,0,'提现管理','','icon-book',5),(117,116,'提现订单','Tixian/tixian',NULL,0),(118,116,'转账订单','Tixian/Transfers',NULL,0),(119,1,'公告','settings/notice',NULL,3),(121,107,'分类管理','Goods/cate',NULL,3),(123,122,'普通会员三级','Gameconfigs/sanjione',NULL,20),(124,122,'中级会员三级','Gameconfigs/sanjitwo',NULL,21),(125,122,'高级会员三级','Gameconfigs/sanjithree',NULL,22),(126,122,'三级达成条件','Gameconfigs/sanjiconditions',NULL,18),(131,90,'充值余额记录','Member/chongzhibiao','icon-dashboard',55),(132,90,'出售余额记录','Member/chushoubiao','icon-dashboard',44),(133,1,'文章列表','settings/wenzhang','icon-dashboard',33),(134,1,'文章类型','settings/wentype','icon-dashboard',32),(135,0,'商家入驻',NULL,'icon-gift',3),(136,135,'个人店铺','Goods/ggshop','icon-dashboard',0),(137,135,'认证列表','Goods/verify','icon-dashboard',2),(139,138,'升级列表','Goods/level','icon-dashboard',10),(141,1,'短信设置','settings/msgs','icon-dashboard',0);
/*!40000 ALTER TABLE `nc_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ncconfig`
--

DROP TABLE IF EXISTS `ncconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ncconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置名称',
  `config_group` varchar(20) NOT NULL COMMENT '配置分组',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `value` text NOT NULL COMMENT '配置值',
  `info` varchar(255) NOT NULL COMMENT '描述',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_name` (`name`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `group` (`config_group`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ncconfig`
--

LOCK TABLES `ncconfig` WRITE;
/*!40000 ALTER TABLE `ncconfig` DISABLE KEYS */;
INSERT INTO `ncconfig` VALUES (7,'SMTP_HOST','smtp',1448266020,'smtp.ym.163.com','',0),(8,'SMTP_PORT','smtp',1448266020,'25','',0),(9,'SMTP_USER','smtp',1448266020,'','',0),(10,'SMTP_PASS','smtp',1448266020,'','',0),(11,'FROM_EMAIL','smtp',1448266020,'','',0),(12,'FROM_NAME','smtp',1448266020,'','',0),(13,'SITE_TITLE','site',1448285156,'vspay商城','',0),(14,'SITE_NAME','site',1448285156,'vspay','',0),(15,'SITE_DESCRIPTION','site',1448285156,'《Vpay商城》协议《Vpay商城》协议《Vpay商城》协议《Wepay商城》协议《Vpay商城》协议《cctoken商城》协议《cctoken商城》协议','',0),(16,'SITE_KEYWORDS','site',1448285156,'vspay商城','',0),(17,'SITE_URL','site',1448285156,'','',0),(18,'SHORT_URL','site',1448285156,'','',0),(19,'SITE_ICP','site',1448285156,'','ICP备案号',0),(20,'EMAIL','site',1448285156,'123456','',0),(21,'TELEPHONE','site',1448285156,'','',0),(22,'WEB_SITE_CLOSE','site',1448285156,'1','',0),(23,'common_image_thumb_width','image',1448293183,'255','',0),(24,'common_image_thumb_height','image',1448293183,'255','',0),(25,'gallery_thumb_width','image',1448293183,'127','',0),(26,'gallery_thumb_height','image',1448293183,'127','',0),(27,'gallery_related_thumb_width','image',1448293183,'150','',0),(28,'gallery_related_thumb_height','image',1448293183,'150','',0),(29,'blog_list_thumb_width','image',1448293183,'280','',0),(30,'blog_list_thumb_height','image',1448293183,'140','',0),(31,'goods_thumb_width','image',1448293183,'360','',0),(32,'goods_thumb_height','image',1448293183,'360','',0),(33,'goods_gallery_thumb_width','image',1448293183,'75','',0),(34,'goods_gallery_thumb_height','image',1448293183,'75','',0),(35,'goods_cart_thumb_width','image',1448293183,'80','',0),(36,'goods_cart_thumb_height','image',1448293183,'80','',0),(39,'length_clasisz_id','other',1448588459,'2','',0),(40,'WEIGHT_ID','other',1448588459,'1','',0),(41,'FRONT_PAGE_NUM','other',1448588459,'8','',0),(42,'BACK_PAGE_NUM','other',1448588459,'10','',0),(43,'default_order_status_id','other',1448588459,'3','',0),(44,'paid_order_status_id','other',1448588459,'1','',0),(45,'complete_order_status_id','other',1448588459,'4','',0),(47,'URL_ID','other',1448588459,'10','',0),(48,'SITE_SLOGAN','site',1448285156,'','',0),(51,'cancel_order_status_id','other',0,'5','',0),(52,'BLOG_TITLE','other',0,'博客','',0),(53,'SITE_ICON','site',0,'product/57a654b160dd9.png','网站图标',0),(54,'goods_related_thumb_width','image',0,'280','',0),(55,'goods_related_thumb_height','image',0,'280','',0),(59,'PWD_KEY','site',1470304751,'.O&4893h99s-pXf~F9(H4xZ@8NqsP#A3r','',0),(60,'ewm','site',0,'/ewm.jpg','',0),(61,'gg','site',0,'','公告',0),(72,'payid','site',0,'d4m7xoorsaomtjw3shpzu2tq','商户ID',0),(73,'paymi','site',0,'t2iiufvwcky4nvn5tsek4janfmmvmt4x','商户密钥',0),(74,'KM_KEY','site',0,'','',0),(110,'phone','site',0,'88888888888888','电话',0),(113,'chandan_time','site',0,'8','',0),(115,'add_hy','site',0,'30','',0),(116,'default_tx','site',0,'shop/597314adc65d4.jpg','',0),(117,'kefu','site',0,'product/59812e9c2b24b.png','',0),(118,'shuoming','site',0,'&lt;h3&gt;奖励说明：&lt;/h3&gt;\r\n\r\n&lt;p&gt;直推10人，团队业绩150万，奖励每天团队新增业绩0.5%.&lt;/p&gt;\r\n\r\n&lt;p&gt;直推15人，团队业绩350万，奖励每天团队新增业绩1%.&lt;/p&gt;\r\n\r\n&lt;p&gt;直推20人，团队业绩800万，奖励每天团队新增业绩1.5%&lt;/p&gt;\r\n','',0),(119,'sxf','site',0,'0.1','手续费',0),(124,'btd','site',0,'2','每次被偷蛋数',0),(125,'ydd','site',0,'2','被狗咬掉蛋',0),(126,'sd_one','site',0,'0.1','收蛋一代10%',0),(127,'sd_two','site',0,'0.03','收蛋二代3%',0),(128,'sd_three','site',0,'0.02','收蛋三代2%',0),(129,'mai_one','site',0,'0.1','买动物一代10%',0),(130,'mai_two','site',0,'0.03','买动物二代3%',0),(131,'mai_three','site',0,'0.02','买动物三代2%',0),(132,'qq','site',0,'123456','',0),(133,'m_sms_id','site',0,'yakrNoOUFiat3qTJRu5F9We9rXAVgz','accessKeyId',0),(134,'m_sms_user','site',0,'LTAIeVSBAFgHdKuK','accessKeySecret',0),(135,'m_sms_pwd','site',0,'SMS_78790147','SMS_77505064',0),(136,'m_sms_name','site',0,'全民养殖','name',0),(137,'tui_one','site',0,'0.005','直推20人,150万',0),(138,'tui_two','site',0,'0.01','直推15人,350万',0),(139,'tui_three','site',0,'0.015','直推20人,800万',0),(140,'tui_one_rmb','site',0,'1500000','直推20人,150万',0),(141,'tui_two_rmb','site',0,'3500000','直推15人,350万',0),(142,'tui_three_rmb','site',0,'8000000','直推20人,800万',0),(144,'MSG_password','site',0,'86819','短信接口密码',0),(145,'MSG_account','site',0,'92708b93b2dcfad1263437ad5f889e95','短信接口',0),(146,'MSG','site',0,'&quot;你的验证码是&quot;.$code.&quot;，如非本人操作，请忽略本短信&quot;','短信模板',0);
/*!40000 ALTER TABLE `ncconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_activate_num`
--

DROP TABLE IF EXISTS `ysk_activate_num`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_activate_num` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '激活码',
  `activate_num` varchar(20) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL DEFAULT '',
  `mobile` varchar(20) DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-未使用 1已只用',
  `create_time` int(11) NOT NULL,
  `user_time` int(11) NOT NULL DEFAULT '0' COMMENT '使用时间',
  `user_ip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `activate_num` (`activate_num`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_activate_num`
--

LOCK TABLES `ysk_activate_num` WRITE;
/*!40000 ALTER TABLE `ysk_activate_num` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_activate_num` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_address`
--

DROP TABLE IF EXISTS `ysk_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` text NOT NULL,
  `name` varchar(20) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL DEFAULT '地址',
  `city_id` varchar(200) NOT NULL DEFAULT '市',
  `country_id` varchar(200) NOT NULL DEFAULT '县乡',
  `province_id` varchar(200) NOT NULL DEFAULT '省',
  `zt_` int(11) NOT NULL,
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_address`
--

LOCK TABLES `ysk_address` WRITE;
/*!40000 ALTER TABLE `ysk_address` DISABLE KEYS */;
INSERT INTO `ysk_address` VALUES (9,'1688','李生','13713882780','楼村新村17巷7号','深圳市','光明新区','广东',1),(10,'1697','郭','15989408882','布吉启迪科技','深圳市','龙岗区','广东',1),(11,'1736','刘文焕','17620420588','深圳','广州市','越秀区','广东',1),(12,'1746','杨永恒','15343827588','人民路22号','广州市','越秀区','广东',0),(18,'2084','李智明','15672204998','金石镇大兴路512号','邵阳市','新宁县','湖南',0),(19,'2096','倪小华','15873945803','金石镇解放街9号','邵阳市','新宁县','湖南',0),(20,'1878','aa','15575566666','某某某木木木木木','泸州市','泸　县','四川',0),(21,'1878','解决','15573256276','啊啊啊啊啊啊','广州市','天河区','广东',1),(22,'2080','啊啊','15732562764','啊啊','广州市','海珠区','广东',1),(23,'1745','retr','15124853648','布沙路玉玲花园a1栋1245','深圳市','龙岗区','广东',0),(27,'1710','环境规划','15170788826','大幅度发给','县','蓟　县','天津',1),(28,'1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南',0),(29,'1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南',0),(30,'1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南',0),(31,'1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南',0),(32,'1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南',0),(33,'1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南',0),(34,'1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南',0),(35,'1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南',0),(36,'1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南',1),(37,'1821','卢小龙','13713963037','吧呃呃呃额额','深圳市','龙岗区','广东',1),(38,'1689','李生','13713882780','楼村','深圳市','光明新区','广东',0),(39,'1689','李','13713882780','新村','深圳市','光明新区','广东',1),(40,'3053','dfg','15170788826','dfg ','市辖区','河北区','天津',1),(41,'1715','风格化','15170788826','对方回合','安顺市','平坝县','贵州',1),(42,'4184','刘芳华','13517375551','橡胶厂小区','益阳市','南　县','湖南',1),(43,'5892','周鸿逦','18173121063','东二环一段1055号','长沙市','芙蓉区','湖南',1),(44,'5497','尚君展','13810284400','绿地老街三期19号楼1单元402','郑州市','金水区','河南',1),(45,'5533','张三','13123456762','你们都是这样的','广州市','荔湾区','广东',1),(46,'5912','周元新','18008465847','荷花园街道万家丽中路一段42号湘运新村7-4-514','长沙市','芙蓉区','湖南',1),(47,'8536','王成明','13500000000','辉煌家园','淮安市','淮阴区','江苏',1),(48,'4125','朱','13478987503','我是来测试的','郑州市','金水区','河南',1),(49,'4124','111111','13007516318','111111','市辖区','西城区','北京',1),(50,'8546','刘广志','13088888696','hhjj？？？？？？？？？','广州市','海珠区','广东',1),(51,'8550','张飞','15698530661','槐东花园南门新兴巷13号','运城市','盐湖区','山西',1),(52,'8547','666','13011111156','？？？？？？，，，，，，1111','广州市','荔湾区','广东',1),(53,'8553','张杰','17791517166','虹口足球场商务大厦','市辖区','卢湾区','上海',1),(54,'8552','213','13243253232','1321','县','密云县','北京',1),(55,'8545','小猪','13478987503','我是来测试的','市辖区','长宁区','上海',1),(56,'8555','才华','13478954569','郑州','广州市','荔湾区','广东',1),(57,'8570','546456','13145847891','上课电话卡很少看到','广州市','越秀区','广东',1);
/*!40000 ALTER TABLE `ysk_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_admin`
--

DROP TABLE IF EXISTS `ysk_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UID',
  `auth_id` int(11) NOT NULL DEFAULT '1' COMMENT '角色ID',
  `nickname` varchar(63) DEFAULT NULL COMMENT '昵称',
  `username` varchar(31) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(63) NOT NULL DEFAULT '' COMMENT '密码',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  `reg_type` varchar(20) DEFAULT NULL COMMENT '注册人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账号表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_admin`
--

LOCK TABLES `ysk_admin` WRITE;
/*!40000 ALTER TABLE `ysk_admin` DISABLE KEYS */;
INSERT INTO `ysk_admin` VALUES (1,1,'超级管理员','superadmin','09f385fe82d51f291a2db5e8a78b7db5','',0,1438651748,1531130774,1,''),(5,1,'超级管理1','admin','611fd61468729d297328a05cb48f9a86','',1902173178,1526153248,1531655335,1,'');
/*!40000 ALTER TABLE `ysk_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_admin_kucun`
--

DROP TABLE IF EXISTS `ysk_admin_kucun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_admin_kucun` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '平台仓库',
  `total_num` decimal(15,2) NOT NULL COMMENT '累计添加总数',
  `less_num` decimal(15,2) NOT NULL COMMENT '库存余量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_admin_kucun`
--

LOCK TABLES `ysk_admin_kucun` WRITE;
/*!40000 ALTER TABLE `ysk_admin_kucun` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_admin_kucun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_admin_zhuangz`
--

DROP TABLE IF EXISTS `ysk_admin_zhuangz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_admin_zhuangz` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员给用户拨发果子明细表id',
  `manage_id` int(11) NOT NULL COMMENT '管理员id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `guozi_num` decimal(15,0) NOT NULL COMMENT '转给用户的果子数量',
  `create_time` int(11) NOT NULL COMMENT '转果子时间',
  `ip` varchar(20) NOT NULL COMMENT '转果子时使用的电脑ip',
  `before_cangku_num` decimal(11,0) NOT NULL DEFAULT '0',
  `after_cangku_num` decimal(11,0) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1-加 2-减',
  `content` varchar(255) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `account` varchar(20) NOT NULL,
  `manage_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_admin_zhuangz`
--

LOCK TABLES `ysk_admin_zhuangz` WRITE;
/*!40000 ALTER TABLE `ysk_admin_zhuangz` DISABLE KEYS */;
INSERT INTO `ysk_admin_zhuangz` VALUES (51,1,1718,2,1523534817,'121.33.33.195',0,2,1,'转给用户','肥肥鱼','13316098335','admin');
/*!40000 ALTER TABLE `ysk_admin_zhuangz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_baner`
--

DROP TABLE IF EXISTS `ysk_baner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_baner` (
  `baner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `baner_px` int(11) DEFAULT '0' COMMENT '排序序号',
  `baner_url` varchar(250) NOT NULL COMMENT '图片路径',
  `baner_name` varchar(250) DEFAULT NULL COMMENT '点击链接',
  `baner_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`baner_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_baner`
--

LOCK TABLES `ysk_baner` WRITE;
/*!40000 ALTER TABLE `ysk_baner` DISABLE KEYS */;
INSERT INTO `ysk_baner` VALUES (5,1,'2017-08-25/599ffda5edb9c.jpg','###',0),(8,19,'2017-08-25/599ffd8c46b57.jpg','###',0),(9,3,'2017-08-25/599ffd9920d0b.jpg','###',0),(10,0,'2017-08-25/599ffdc415550.jpg','###',1),(11,0,'2017-08-25/599ffdd60ab76.jpg','###',1);
/*!40000 ALTER TABLE `ysk_baner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_bank_name`
--

DROP TABLE IF EXISTS `ysk_bank_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_bank_name` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int(11) NOT NULL COMMENT '外键',
  `banq_genre` varchar(20) NOT NULL COMMENT '银行类型',
  `banq_img` varchar(150) NOT NULL COMMENT '银行卡类型图片',
  PRIMARY KEY (`q_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='银行卡类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_bank_name`
--

LOCK TABLES `ysk_bank_name` WRITE;
/*!40000 ALTER TABLE `ysk_bank_name` DISABLE KEYS */;
INSERT INTO `ysk_bank_name` VALUES (1,1,'广州市农村信用合作社','ncxys.png'),(2,2,'中国农业银行','zgnyyh.png'),(3,3,'中国工商银行','zggsyh.png'),(4,4,'中国招商银行','zsyh.png'),(5,5,'中国邮政储蓄银行','zgyz.png'),(6,6,'中国建设银行','zgjsyh.png'),(7,7,'中国银行','zgyh.png'),(8,8,'交通银行','jtyh.png'),(9,9,'广州市商业银行','fjxyyh.png'),(10,10,'中国民生银行','zgmsyh.png'),(11,11,'深圳发展银行','szfzyh.png'),(12,12,'上海浦东发展银行','shpdfzyh.png'),(13,13,'华夏银行','hxyh.png'),(14,14,'兴业银行','fjxyyh.png'),(15,15,'广东发展银行','fjxyyh.png'),(16,16,'中国光大银行','gdyh.jpg'),(17,17,'支付宝','zfb.png');
/*!40000 ALTER TABLE `ysk_bank_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_banner`
--

DROP TABLE IF EXISTS `ysk_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_banner` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `href` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片链接地址',
  `sort` int(8) DEFAULT NULL COMMENT '排序',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `picture` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_banner`
--

LOCK TABLES `ysk_banner` WRITE;
/*!40000 ALTER TABLE `ysk_banner` DISABLE KEYS */;
INSERT INTO `ysk_banner` VALUES (9,'炫彩轮播',NULL,123,1,'2018-06-26/5b319b28e4475.png',1529977640),(11,'华丽轮播',NULL,456,1,'2018-06-26/5b32069b0bf82.png',1530005147),(13,'多彩轮播',NULL,0,1,'2018-06-26/5b32069232969.png',1530005138);
/*!40000 ALTER TABLE `ysk_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_bofamx`
--

DROP TABLE IF EXISTS `ysk_bofamx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_bofamx` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '拨发果子到平台表的id',
  `manage_id` int(11) NOT NULL COMMENT '管理员id',
  `bofa_num` decimal(15,2) NOT NULL COMMENT '拨发的果子数量',
  `create_time` int(11) NOT NULL COMMENT '拨发时间',
  `note` tinytext NOT NULL COMMENT '备注',
  `manage_name` varchar(20) NOT NULL COMMENT '管理员账号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_bofamx`
--

LOCK TABLES `ysk_bofamx` WRITE;
/*!40000 ALTER TABLE `ysk_bofamx` DISABLE KEYS */;
INSERT INTO `ysk_bofamx` VALUES (1,1,50000.00,1506487943,'','admin');
/*!40000 ALTER TABLE `ysk_bofamx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_caimi`
--

DROP TABLE IF EXISTS `ysk_caimi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_caimi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '每天从好有那采矿记录   ',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'uid=用户ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '采矿时间',
  `num` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '采矿数量',
  `fid` int(11) NOT NULL DEFAULT '0',
  `f_username` varchar(20) NOT NULL,
  `f_account` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=523 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_caimi`
--

LOCK TABLES `ysk_caimi` WRITE;
/*!40000 ALTER TABLE `ysk_caimi` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_caimi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_childcoop_configs`
--

DROP TABLE IF EXISTS `ysk_childcoop_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_childcoop_configs` (
  `id` int(11) NOT NULL,
  `jiwo_ord` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '普通鸡窝开窝消耗积分',
  `jiwo_senior` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '高级鸡窝开窝消耗积分',
  `jiwo_ord_highst` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '普通鸡窝最高收益值',
  `jiwo_senior_highst` decimal(11,2) NOT NULL COMMENT '高级鸡窝最大收益',
  `guoyuan_ord` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '普通地开启消耗',
  `guoyuan_senior` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '果园中级地开启消耗果园积分',
  `guoyuan_henior` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '果园地高级开启消耗积分',
  `guoyuan_higest` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '果园普通地达到最高收益值',
  `yuchang_ord` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '普通渔场开池消耗积分',
  `yucahng_senior` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '高级渔场开池消耗积分',
  `yuchang_higest` int(1) NOT NULL DEFAULT '4' COMMENT '渔场最高收益（倍数）',
  `fengce_add` float(5,4) NOT NULL DEFAULT '0.0000' COMMENT '风车增益率',
  `guanjia_add` float(5,4) NOT NULL DEFAULT '0.0000' COMMENT '管家增益率',
  `dengji_add` float(8,4) NOT NULL DEFAULT '0.0001' COMMENT '等级增益率',
  `zhuanjia_add` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '专家增益率',
  `chai_fen_min` float(8,3) NOT NULL DEFAULT '0.005' COMMENT '最小拆分率',
  `chai_fen_max` float(8,3) NOT NULL DEFAULT '0.250' COMMENT '最大拆分率',
  `chaifenmin_yu` float(8,3) NOT NULL DEFAULT '0.000' COMMENT '渔场最低拆分率',
  `chaifenmax_yu` float(8,3) NOT NULL DEFAULT '0.000' COMMENT '渔场最高拆分率',
  `jifen_cost` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '积分服务费',
  `jifen_transmutation` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '积分转化为消费的比例',
  `fengche_enddays` int(10) NOT NULL DEFAULT '0' COMMENT '风车有效期',
  `jiaoyi_cost` float(5,3) NOT NULL DEFAULT '0.000' COMMENT '交易手续费',
  `housekeeper` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '达到对应收益送专家',
  `expert` int(10) NOT NULL COMMENT '达到推荐人数送管家',
  `zhituijiang` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '第一次建窝给上级奖励',
  `yuchang_earns_max` tinyint(1) NOT NULL DEFAULT '3' COMMENT '渔场可拿最高收益',
  `add_tixian` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1->增养,2->提现',
  `nianhua_shouyi` float(8,2) NOT NULL DEFAULT '3.00' COMMENT '果园年化收益',
  `guoyuan_jiaoshui` float(8,4) NOT NULL DEFAULT '0.0050' COMMENT '果园浇水释放率',
  `gongtongdi_sifang` float(8,4) NOT NULL DEFAULT '0.0000' COMMENT '共同果园浇水释放率',
  `yuchang_guanjia_add` float(8,4) NOT NULL DEFAULT '0.0000' COMMENT '管家增益率',
  `yuchang_ord_max` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '普通渔场最高投资值',
  `yuchang_higst_max` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '高级渔场最高投资值',
  `tixian_beishu` int(10) NOT NULL DEFAULT '20' COMMENT '提现倍数',
  `tixian_start` int(10) NOT NULL DEFAULT '0' COMMENT '起提数量',
  `tixian_shouxu_yj` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '佣金/代理佣金/农联积分提现扣除手续费',
  `tixian_xiaofei_yj` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '佣金/代理佣金/农联积分提现拆分消费积分',
  `ji_tixian_shouxu` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '鸡场提现手续费',
  `guo_tixian_shouxu` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '果园提现手续费',
  `yu_tixian_shouxu` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '渔场提现手续费',
  `ji_tixian_xiaofe` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '鸡场提现消费',
  `guo_tixian_xiaofe` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '果园提现消费',
  `yu_tixian_xiaofe` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '渔场提现消费',
  `putong_member` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '普通会员达成条件',
  `senior_member` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '中级会员达成条件',
  `higst_member` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '高级会员达成条件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_childcoop_configs`
--

LOCK TABLES `ysk_childcoop_configs` WRITE;
/*!40000 ALTER TABLE `ysk_childcoop_configs` DISABLE KEYS */;
INSERT INTO `ysk_childcoop_configs` VALUES (1,360.00,3600.00,1440.00,14440.00,400.00,800.00,1200.00,1600.00,399.000,800.000,6,0.0500,0.0001,0.0000,0.00,0.000,0.010,0.001,0.150,0.10,0.25,60,0.100,0.00,80,40.00,3,1,3.00,0.0050,0.0002,0.0100,48000.000,96000.000,154,154,0.00,0.00,0.10,0.10,0.10,0.25,0.25,0.00,0.00,50000.00,100000.00);
/*!40000 ALTER TABLE `ysk_childcoop_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_chongzhi`
--

DROP TABLE IF EXISTS `ysk_chongzhi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_chongzhi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '昵称',
  `phone` varchar(22) NOT NULL COMMENT '手机号',
  `username` varchar(255) NOT NULL COMMENT '帐号',
  `addtime` varchar(222) NOT NULL COMMENT '提交时间',
  `img` varchar(255) DEFAULT NULL COMMENT '二维码',
  `money` int(233) NOT NULL COMMENT '充值金钱',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态：0未审核，1通过，2拒绝',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_chongzhi`
--

LOCK TABLES `ysk_chongzhi` WRITE;
/*!40000 ALTER TABLE `ysk_chongzhi` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_chongzhi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_chushou`
--

DROP TABLE IF EXISTS `ysk_chushou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_chushou` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `addtime` varchar(222) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `some` varchar(255) NOT NULL COMMENT '价值',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态：0未审核，1通过，2拒绝',
  `jiawei` varchar(255) NOT NULL COMMENT '出售价位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_chushou`
--

LOCK TABLES `ysk_chushou` WRITE;
/*!40000 ALTER TABLE `ysk_chushou` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_chushou` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_coindets`
--

DROP TABLE IF EXISTS `ysk_coindets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_coindets` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '币价格表',
  `cid` int(10) NOT NULL COMMENT '币价格表',
  `coin_name` char(40) NOT NULL COMMENT '币名称',
  `coin_price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '币价格',
  `coin_addtime` char(40) NOT NULL COMMENT '币添加时间',
  `max` float(10,4) DEFAULT NULL,
  `min` float(10,4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20905 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_coindets`
--

LOCK TABLES `ysk_coindets` WRITE;
/*!40000 ALTER TABLE `ysk_coindets` DISABLE KEYS */;
INSERT INTO `ysk_coindets` VALUES (20881,2,'比特币',43994.7354,'1531128424',48394.2070,39595.2617),(20882,3,'莱特币',536.2700,'1531128424',589.8970,482.6430),(20883,4,'以太坊',3169.5202,'1531128424',3486.4722,2852.5681),(20884,5,'狗狗币',0.0170,'1531128424',0.0187,0.0153),(20885,1,'Vpay',0.0000,'1531128426',0.0000,0.0000),(20886,2,'比特币',43994.7354,'1531128426',48394.2070,39595.2617),(20887,3,'莱特币',536.1384,'1531128426',589.7522,482.5246),(20888,4,'以太坊',3169.5202,'1531128426',3486.4722,2852.5681),(20889,5,'狗狗币',0.0170,'1531128426',0.0187,0.0153),(20890,1,'Vpay',1.0000,'1531148072',2.0000,0.5000),(20891,2,'比特币',43994.7354,'1531148072',48394.2070,39595.2617),(20892,3,'莱特币',536.1384,'1531148072',589.7522,482.5246),(20893,4,'以太坊',3169.5202,'1531148072',3486.4722,2852.5681),(20894,5,'狗狗币',0.0170,'1531148072',0.0187,0.0153),(20895,1,'Vpay',0.0000,'1531200875',0.0000,0.0000),(20896,2,'比特币',43994.7354,'1531200875',48394.2070,39595.2617),(20897,3,'莱特币',536.1384,'1531200875',589.7522,482.5246),(20898,4,'以太坊',3169.5202,'1531200875',3486.4722,2852.5681),(20899,5,'狗狗币',0.0170,'1531200875',0.0187,0.0153),(20900,1,'Vpay',0.0000,'1531448699',0.0000,0.0000),(20901,2,'比特币',41458.0000,'1531448699',43265.0000,40895.0000),(20902,3,'莱特币',513.2400,'1531448699',520.1700,500.2900),(20903,4,'以太坊',2885.0000,'1531448699',3390.0000,2831.0000),(20904,5,'狗狗币',0.0153,'1531448699',0.0233,0.0149);
/*!40000 ALTER TABLE `ysk_coindets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_coindets_copy`
--

DROP TABLE IF EXISTS `ysk_coindets_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_coindets_copy` (
  `cid` int(10) NOT NULL AUTO_INCREMENT COMMENT '币价格表',
  `coin_name` char(40) NOT NULL COMMENT '币名称',
  `coin_price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '币价格',
  `coin_addtime` char(40) NOT NULL COMMENT '币添加时间',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_coindets_copy`
--

LOCK TABLES `ysk_coindets_copy` WRITE;
/*!40000 ALTER TABLE `ysk_coindets_copy` DISABLE KEYS */;
INSERT INTO `ysk_coindets_copy` VALUES (1,'cctoken资产',1.1857,'1522825163'),(2,'比特币',42604.9263,'1522825163'),(3,'莱特币',709.1594,'1522825163'),(4,'以太坊',2390.0137,'1522825163'),(5,'狗狗币',0.0175,'1522825163');
/*!40000 ALTER TABLE `ysk_coindets_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_collect`
--

DROP TABLE IF EXISTS `ysk_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `type` int(1) DEFAULT NULL COMMENT '收藏类型',
  `proid` int(11) NOT NULL COMMENT 'ID',
  `time` int(11) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_collect`
--

LOCK TABLES `ysk_collect` WRITE;
/*!40000 ALTER TABLE `ysk_collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_complaint`
--

DROP TABLE IF EXISTS `ysk_complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '投诉人id',
  `content` text COMMENT '投诉内容',
  `imgs` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `status` tinyint(1) DEFAULT '0' COMMENT '0 未查看 1 已查看',
  `create_time` int(10) DEFAULT NULL COMMENT '投诉时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_complaint`
--

LOCK TABLES `ysk_complaint` WRITE;
/*!40000 ALTER TABLE `ysk_complaint` DISABLE KEYS */;
INSERT INTO `ysk_complaint` VALUES (7,8545,'99999','blob:http://pay.rzdrj.cn/05d861f6-f8ae-4c39-b16d-09820ac25e69',1,1529550487),(9,8545,'我是来测试的',NULL,1,1529572796),(10,8545,'54564815656',NULL,1,1529572889),(11,8570,'sddsdsd',NULL,1,1530328333),(12,8580,'000000',NULL,1,1531145782),(13,8582,'在吗？',NULL,1,1531146092);
/*!40000 ALTER TABLE `ysk_complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_config`
--

DROP TABLE IF EXISTS `ysk_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '配置标题',
  `name` varchar(32) DEFAULT NULL COMMENT '配置名称',
  `value` text NOT NULL COMMENT '配置值',
  `group` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT '配置类型',
  `options` varchar(255) NOT NULL DEFAULT '' COMMENT '配置额外值',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_config`
--

LOCK TABLES `ysk_config` WRITE;
/*!40000 ALTER TABLE `ysk_config` DISABLE KEYS */;
INSERT INTO `ysk_config` VALUES (1,'站点开关','TOGGLE_WEB_SITE','1',3,'0','0:关闭\r\n1:开启','',1378898976,1406992386,1,1),(2,'网站标题','WEB_SITE_TITLE','',1,'0','','网站标题前台显示标题',1378898976,1379235274,2,1),(3,'网站LOGO','WEB_SITE_LOGO','',1,'0','','网站LOGO',1407003397,1407004692,3,1),(4,'网站描述','WEB_SITE_DESCRIPTION','',1,'0','','网站搜索引擎描述',1378898976,1379235841,4,1),(5,'网站关键字','WEB_SITE_KEYWORD','',1,'0','','网站搜索引擎关键字',1378898976,1381390100,5,1),(6,'版权信息','WEB_SITE_COPYRIGHT','',1,'0','','设置在网站底部显示的版权信息，如“版权所有 (c) 2014-2015 科斯克网络科技”',1406991855,1406992583,6,1),(7,'网站备案号','WEB_SITE_ICP','',1,'0','','设置在网站底部显示的备案号，如“苏ICP备1502009号\"',1378900335,1415983236,9,1),(8,'黄土地最小值','huang_min','300',2,'1','','',0,0,20,1),(9,'黄土地最大值','huang_max','600',2,'1','','',0,0,21,1),(10,'红土地最小值','hong_min','1000',2,'2','','',0,0,21,1),(11,'红土地最大值','hong_max','2000',2,'2','','',0,0,30,1),(12,'黑土地最小值','hei_min','2000',2,'3','','',0,0,31,1),(13,'黑土地最大值','hei_max','4000',2,'3','','',0,0,31,1),(14,'积分基础释放率','sell_fee','0.2',4,'','','',0,0,23,1),(15,'1代积分加速放率','direct_fee','5',4,'','','',0,0,0,1),(16,'2-15代积分加速放率','shop_fee','1',4,'','','',0,0,33,1),(29,'2代Vip增加积分率','vadd_lv','8',4,'','','',0,0,0,1),(30,'2-15代Vip增加积分率','morevadd_lv','5',4,'0','','',0,0,0,1),(31,'总要扣比例','des_lv','0.4',2,'5','','',0,0,0,1),(27,'基础拆分倍数','base_lv','2.5',2,'5','','',0,0,0,1),(28,'哈士奇拆分倍数','hashiqi_lv','0.05',2,'5','','',0,0,0,1),(24,'一级好友采矿拆分','friends_one','10',2,'','','',0,0,0,1),(25,'二级好友采矿拆分','friends_two','0',2,'','','',0,0,0,1),(26,'微信二维码','WEB_SITE_WX','',1,'','','',0,0,0,1),(32,'注册开关','close_reg','1',3,'','0:关闭1:开启','关闭注册功能说明',0,0,12,1),(33,'交易开关','close_trading','1',3,'','0:关闭1:开启','交易暂时关闭，16:00后开启',0,0,13,0),(34,'果子转出开关','close_sellnum','0',3,'','0:关闭1:开启','关闭果子转出说明11',0,0,0,0),(35,'三级好友采矿拆分','friends_tree','0',2,'','','',0,0,0,1),(36,'体验地最小值','tiyan_min','66',2,'4','','',0,0,0,1),(37,'体验地最大值','tiyan_max','130',2,'4','','',0,0,0,1),(38,'鸡拆分倍数','ji_lv','0.05',2,'5','','',0,0,0,1),(39,'鸟拆分倍数','niao_lv','0.15',2,'5','','',0,0,0,1),(40,'猫拆分倍数','mao_lv','0.1',2,'5','','',0,0,0,1),(41,'实时价格每分钟增长','growem','10',2,'','','',0,0,12,1),(42,'商城开关','TOGGLE_MALL_SITE','1',3,'0','0:关闭\r\n1:开启','商城暂未开放',1378898976,1406992386,1,1),(43,'注册送积分数','jifen','50',1,'0','','',1407003397,1407004692,3,1),(44,'奖励开关','regjifen','0',1,'0','','',1407003397,1407004692,3,1),(45,'直推奖条件','zhitui1','8',6,'','','500',0,0,0,1),(46,'直推奖条件','zhitui2','',6,'','','',0,0,33,1),(47,'直推奖条件','zhitui3','',6,'','','',0,0,0,1),(48,'直推奖条件','zhitui4','',6,'','','',0,0,0,1),(49,'管理奖条件','guanli1','0',7,'','','0',0,0,0,1),(50,'管理奖条件','guanli2','0',7,'','','0',0,0,33,1),(51,'管理奖条件','guanli3','0',7,'','','0',0,0,0,1),(52,'余额转动奖条件','zhuand1','1',8,'','','500',0,0,0,1),(53,'余额转动奖条件','zhuand2','',8,'','','',0,0,33,1),(54,'余额转动奖条件','zhuand3','',8,'','','',0,0,0,1),(55,'余额转动奖条件','zhuand4','',8,'','','',0,0,0,1),(56,'区块奖条件','qukuai1','0.8',9,'','','1',0,0,0,1),(57,'区块奖条件','qukuai2','0.8',9,'','','2',0,0,33,1),(58,'区块奖条件','qukuai3','0.8',9,'','','3',0,0,0,1),(59,'区块奖条件','qukuai4','0.5',9,'','','4',0,0,0,1),(60,'区块奖条件','qukuai5','0.5',9,'','','5',0,0,0,1),(61,'VIP1加速放率','vip1','8',10,'','','1000000',0,0,33,1),(62,'VIP2加速放率','vip2','2',10,'','','1',0,0,0,1),(63,'推荐一个人赠送积分数','jifens','',1,'0','','',1407003397,1407004692,3,1),(64,'赠送积分最大推荐人数','rens','',1,'0','','',1407003397,1407004692,3,1);
/*!40000 ALTER TABLE `ysk_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_crowds`
--

DROP TABLE IF EXISTS `ysk_crowds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_crowds` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '出售数量',
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-出售成功 1-买家确认  2-买家确认 3-取消交易',
  `dprice` decimal(10,4) DEFAULT NULL,
  `jindu` decimal(10,2) DEFAULT NULL,
  `open_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=930 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_crowds`
--

LOCK TABLES `ysk_crowds` WRITE;
/*!40000 ALTER TABLE `ysk_crowds` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_crowds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_crowds_detail`
--

DROP TABLE IF EXISTS `ysk_crowds_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_crowds_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `crowds_id` int(11) NOT NULL,
  `num` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '出售数量',
  `dprice` decimal(10,4) DEFAULT NULL,
  `tprice` decimal(10,4) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=930 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_crowds_detail`
--

LOCK TABLES `ysk_crowds_detail` WRITE;
/*!40000 ALTER TABLE `ysk_crowds_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_crowds_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_daojudets`
--

DROP TABLE IF EXISTS `ysk_daojudets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_daojudets` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '道具表',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `time` date NOT NULL COMMENT '开始时间',
  `end_time` date NOT NULL COMMENT '到期时间',
  `state` tinyint(1) NOT NULL COMMENT '1-使用中 2已过期 3未使用',
  `daoju_type` tinyint(1) NOT NULL COMMENT '1一键挑粪',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE COMMENT '唯一主键id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_daojudets`
--

LOCK TABLES `ysk_daojudets` WRITE;
/*!40000 ALTER TABLE `ysk_daojudets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_daojudets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_daojugoods`
--

DROP TABLE IF EXISTS `ysk_daojugoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_daojugoods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `image` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `content` text NOT NULL COMMENT '商品详情',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `date_added` datetime NOT NULL COMMENT '加入时间',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1鸡窝 2果园 3渔场',
  `daoju_limit` int(11) NOT NULL DEFAULT '30' COMMENT '有效期',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_daojugoods`
--

LOCK TABLES `ysk_daojugoods` WRITE;
/*!40000 ALTER TABLE `ysk_daojugoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_daojugoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_date_sell_limit`
--

DROP TABLE IF EXISTS `ysk_date_sell_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_date_sell_limit` (
  `uid` int(11) NOT NULL COMMENT '每天出售限制',
  `num` int(11) NOT NULL DEFAULT '0',
  `datestr` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_date_sell_limit`
--

LOCK TABLES `ysk_date_sell_limit` WRITE;
/*!40000 ALTER TABLE `ysk_date_sell_limit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_date_sell_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_deal`
--

DROP TABLE IF EXISTS `ysk_deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_deal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '出售数量',
  `sell_id` int(11) NOT NULL DEFAULT '0' COMMENT '出售人ID',
  `fee_num` decimal(11,2) DEFAULT NULL COMMENT '手续费',
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-出售成功 1-买家确认  2-买家确认 3-取消交易',
  `cid` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1,出售 2,购买',
  `tprice` decimal(10,2) DEFAULT NULL,
  `dprice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sell_id` (`sell_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_deal`
--

LOCK TABLES `ysk_deal` WRITE;
/*!40000 ALTER TABLE `ysk_deal` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_deals`
--

DROP TABLE IF EXISTS `ysk_deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_deals` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '出售数量',
  `sell_id` int(11) NOT NULL DEFAULT '0' COMMENT '出售人ID',
  `buy_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买者ID',
  `fee_num` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `create_time` int(11) DEFAULT NULL,
  `buy_uname` varchar(255) DEFAULT NULL,
  `cid` tinyint(1) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1,出售 2,购买',
  `tprice` decimal(10,2) DEFAULT NULL,
  `dprice` decimal(10,2) DEFAULT NULL,
  `d_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sell_id` (`sell_id`) USING BTREE,
  KEY `buy_id` (`buy_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_deals`
--

LOCK TABLES `ysk_deals` WRITE;
/*!40000 ALTER TABLE `ysk_deals` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_earnsrecords`
--

DROP TABLE IF EXISTS `ysk_earnsrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_earnsrecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '喂养收入明细表',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `land_id` int(11) NOT NULL COMMENT '土地id',
  `add_nums` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '收入数量',
  `add_times` date DEFAULT NULL COMMENT '收钱时间',
  `farms_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1->鸡窝,2->果园，3->渔场',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE COMMENT '唯一id',
  KEY `landid` (`land_id`) USING BTREE COMMENT '土地id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_earnsrecords`
--

LOCK TABLES `ysk_earnsrecords` WRITE;
/*!40000 ALTER TABLE `ysk_earnsrecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_earnsrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_farmgoods`
--

DROP TABLE IF EXISTS `ysk_farmgoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_farmgoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '土地详情表',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `farm_landstype` varchar(20) NOT NULL COMMENT '1->普通地,2->高级地',
  `open_time` date DEFAULT NULL COMMENT '建窝时间',
  `lands_posi` int(11) NOT NULL COMMENT '鸡窝位置',
  `farms_type` tinyint(1) NOT NULL COMMENT '1->养鸡场,2->果园,3->渔场',
  `jiwoearns_all` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '对应鸡窝总收益',
  `chicken_type` tinyint(1) DEFAULT '1' COMMENT '1->小鸡,2->大鸡',
  `qingsao_time` date NOT NULL COMMENT '最后一次清扫时间',
  `chicken_bjmoney` decimal(11,2) NOT NULL DEFAULT '360.00' COMMENT '鸡窝本金',
  `chicken_profit` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '鸡窝收益',
  `nianhua_shouyi` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '果园年化收益',
  `yuchang_higst` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '渔场最高值临界点',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE COMMENT 'id主键',
  KEY `seach` (`uid`,`farm_landstype`,`lands_posi`,`farms_type`) USING BTREE COMMENT '搜索优化'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_farmgoods`
--

LOCK TABLES `ysk_farmgoods` WRITE;
/*!40000 ALTER TABLE `ysk_farmgoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_farmgoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_feedtimes`
--

DROP TABLE IF EXISTS `ysk_feedtimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_feedtimes` (
  `id` int(11) NOT NULL COMMENT '渔场可喂养时间点',
  `feed_time` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_feedtimes`
--

LOCK TABLES `ysk_feedtimes` WRITE;
/*!40000 ALTER TABLE `ysk_feedtimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_feedtimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_fengche`
--

DROP TABLE IF EXISTS `ysk_fengche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_fengche` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `f_uid` int(11) NOT NULL COMMENT '用户UID',
  `f_time` date NOT NULL COMMENT '获得用时间',
  `f_end_time` date NOT NULL COMMENT '到期时间',
  `f_state` tinyint(1) NOT NULL COMMENT '状态 1使用中   2未使用  3已过期 ',
  `f_type` tinyint(1) NOT NULL COMMENT '1风车',
  PRIMARY KEY (`f_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_fengche`
--

LOCK TABLES `ysk_fengche` WRITE;
/*!40000 ALTER TABLE `ysk_fengche` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_fengche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_fenxiaojiang`
--

DROP TABLE IF EXISTS `ysk_fenxiaojiang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_fenxiaojiang` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分销记录表',
  `buy_id` int(11) NOT NULL COMMENT '购买者',
  `get_id` int(11) NOT NULL COMMENT '获得佣金用户',
  `goods_id` int(11) NOT NULL COMMENT '所购买时商品id',
  `buy_time` datetime DEFAULT NULL COMMENT '购买时间',
  `buy_grade` tinyint(1) NOT NULL COMMENT '第几级用户',
  `money_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:三级分销 2:代理佣金',
  `money_nums` decimal(15,3) NOT NULL DEFAULT '0.000' COMMENT '所拿数目',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_fenxiaojiang`
--

LOCK TABLES `ysk_fenxiaojiang` WRITE;
/*!40000 ALTER TABLE `ysk_fenxiaojiang` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_fenxiaojiang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_fruit_in`
--

DROP TABLE IF EXISTS `ysk_fruit_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_fruit_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '果子转入',
  `manage_id` int(11) NOT NULL COMMENT '管理员id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` decimal(15,0) NOT NULL COMMENT '转给用户的果子数量',
  `create_time` int(11) NOT NULL COMMENT '转果子时间',
  `ip` varchar(20) NOT NULL COMMENT '转果子时使用的电脑ip',
  `type` char(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `account` varchar(20) NOT NULL,
  `manage_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_fruit_in`
--

LOCK TABLES `ysk_fruit_in` WRITE;
/*!40000 ALTER TABLE `ysk_fruit_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_fruit_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_fruitdetail`
--

DROP TABLE IF EXISTS `ysk_fruitdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_fruitdetail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `trading_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '交易类型 0-数量在自己账户内变动 1-收入  2-支出',
  `num` decimal(10,2) NOT NULL COMMENT '交易数量',
  `to_id` int(11) DEFAULT NULL COMMENT '支出给对方ID',
  `trading_name` varchar(255) DEFAULT NULL,
  `content` text COMMENT '说明',
  `add_time` int(11) NOT NULL COMMENT '交易时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_fruitdetail`
--

LOCK TABLES `ysk_fruitdetail` WRITE;
/*!40000 ALTER TABLE `ysk_fruitdetail` DISABLE KEYS */;
INSERT INTO `ysk_fruitdetail` VALUES (62,1718,1,2.00,0,'平台播发','平台播发金钱2',1523534817);
/*!40000 ALTER TABLE `ysk_fruitdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_gerenshangpu`
--

DROP TABLE IF EXISTS `ysk_gerenshangpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_gerenshangpu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `shop_name` varchar(255) NOT NULL COMMENT '店铺名称',
  `shop_logo` varchar(255) DEFAULT NULL COMMENT '店铺logo',
  `shop_type` int(2) NOT NULL COMMENT '商铺类型:1服饰2餐饮3酒店4旅游5科技6养生7美容8特产9生鲜0其它',
  `shop_beijing` varchar(255) DEFAULT NULL COMMENT '商铺背景',
  `shop_vpay` varchar(255) DEFAULT NULL COMMENT 'vpay二维码',
  `shop_zhifubao` varchar(255) DEFAULT NULL COMMENT '支付宝二维码',
  `shop_weixin` varchar(255) DEFAULT NULL COMMENT '微信二维码',
  `shop_dengji` varchar(255) DEFAULT NULL COMMENT '店铺等级:0没有店铺,1,一级2,二级,3,三级',
  `shop_shoucang` int(111) DEFAULT NULL COMMENT '收藏数',
  `shop_xiaoshou` int(122) DEFAULT NULL COMMENT '销售量',
  `userid` int(111) NOT NULL COMMENT '用户id',
  `kaihuhang` varchar(255) DEFAULT NULL COMMENT '开户行',
  `name` varchar(255) DEFAULT NULL COMMENT '开户姓名',
  `bank` varchar(255) DEFAULT NULL COMMENT '银行卡',
  `shop_phone` varchar(255) NOT NULL COMMENT '店铺手机号码',
  `shop_stort` int(5) NOT NULL DEFAULT '500' COMMENT '店铺排序',
  `shop_zhuangtai` int(1) NOT NULL DEFAULT '1' COMMENT '1启用2禁用',
  `shop_guanggao` varchar(255) DEFAULT NULL COMMENT '广告背景',
  `shop_address` varchar(255) NOT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_gerenshangpu`
--

LOCK TABLES `ysk_gerenshangpu` WRITE;
/*!40000 ALTER TABLE `ysk_gerenshangpu` DISABLE KEYS */;
INSERT INTO `ysk_gerenshangpu` VALUES (1,'后台商店','/Uploads/image/product/5ad83a4b9c41c.jpg',8,NULL,NULL,'/Uploads/image/product/5a9669c45b4f3.jpg','/Uploads/image/product/5a9669bf09789.jpg','',NULL,NULL,0,NULL,NULL,NULL,'',500,1,NULL,'深圳北海');
/*!40000 ALTER TABLE `ysk_gerenshangpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_goods`
--

DROP TABLE IF EXISTS `ysk_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `subtract` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否扣除库存',
  `minimum` int(11) NOT NULL DEFAULT '1' COMMENT '最小起订数目',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL COMMENT '加入时间',
  `date_modified` datetime DEFAULT NULL COMMENT '修改的时间',
  `viewed` int(5) NOT NULL DEFAULT '0' COMMENT '点击量',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_goods`
--

LOCK TABLES `ysk_goods` WRITE;
/*!40000 ALTER TABLE `ysk_goods` DISABLE KEYS */;
INSERT INTO `ysk_goods` VALUES (1,'11111111111','product/59a91f7fb7fa6.jpg',111.00,1,1,0,1,'2017-09-01 16:51:31',NULL,0);
/*!40000 ALTER TABLE `ysk_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_goods_discount`
--

DROP TABLE IF EXISTS `ysk_goods_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_goods_discount` (
  `product_discount_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='数量折扣';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_goods_discount`
--

LOCK TABLES `ysk_goods_discount` WRITE;
/*!40000 ALTER TABLE `ysk_goods_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_goods_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_group`
--

DROP TABLE IF EXISTS `ysk_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级部门ID',
  `title` varchar(31) NOT NULL DEFAULT '' COMMENT '部门名称',
  `icon` varchar(31) NOT NULL DEFAULT '' COMMENT '图标',
  `menu_auth` text NOT NULL COMMENT '权限列表',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  `auth_id` int(11) DEFAULT NULL,
  `hylb` varchar(10) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_group`
--

LOCK TABLES `ysk_group` WRITE;
/*!40000 ALTER TABLE `ysk_group` DISABLE KEYS */;
INSERT INTO `ysk_group` VALUES (1,0,'超级管理员','','',1426881003,1427552428,0,1,1,'0'),(2,0,'财务查看','','1,7,8,322,323',1498324367,1527084992,0,0,2,'5'),(7,0,'超级管理','','1,3,4,6,327,7,8,9,316,318,322,323',1526152893,1528963727,0,0,0,''),(8,0,'数据管理','','1,3,4,327,7,8,10,11,315,324,325,334,329,328',1527085184,1527140823,0,0,0,'0'),(9,0,'数据管理1','','3,4,327,7,8',1527140086,1527140086,0,-1,0,'0'),(10,0,'测试','','1,3,4,327,7,8,9,316,318,322,323',1529227955,1530002816,0,-1,NULL,'2,3,5');
/*!40000 ALTER TABLE `ysk_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_growth`
--

DROP TABLE IF EXISTS `ysk_growth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_growth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `num` decimal(11,2) NOT NULL DEFAULT '0.00',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `hashiqi_lv` decimal(8,6) NOT NULL DEFAULT '0.000000',
  `zangao_lv` decimal(8,6) NOT NULL DEFAULT '0.000000',
  `dcr_lv` decimal(8,6) NOT NULL DEFAULT '0.000000',
  `des_lv` decimal(8,6) NOT NULL DEFAULT '0.000000' COMMENT '扣除',
  `base_lv` decimal(8,6) NOT NULL DEFAULT '0.000000' COMMENT '基础拆分',
  `total_lv` decimal(8,6) NOT NULL DEFAULT '0.000000' COMMENT '总拆分',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_growth`
--

LOCK TABLES `ysk_growth` WRITE;
/*!40000 ALTER TABLE `ysk_growth` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_growth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_harvdets`
--

DROP TABLE IF EXISTS `ysk_harvdets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_harvdets` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '增养记录表',
  `har_nums` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '增氧数量',
  `har_landid` int(11) NOT NULL COMMENT '增养地id',
  `uid` int(11) NOT NULL COMMENT '增养用户id',
  `har_time` date NOT NULL COMMENT '增氧时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_harvdets`
--

LOCK TABLES `ysk_harvdets` WRITE;
/*!40000 ALTER TABLE `ysk_harvdets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_harvdets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_jiaoyiorder`
--

DROP TABLE IF EXISTS `ysk_jiaoyiorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_jiaoyiorder` (
  `jy_id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `jy_type` tinyint(3) NOT NULL COMMENT '类型 5喂养 6挑粪',
  `jy_fromuid` int(15) NOT NULL COMMENT '出售者',
  `jy_touid` int(15) NOT NULL COMMENT '收购者',
  `jy_mobile` varchar(255) NOT NULL COMMENT '收购者手机号码',
  `jy_addtime` varchar(20) NOT NULL COMMENT '添加时间',
  `jy_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '交易状态',
  `yj_jiangjin` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '买家是地主的奖金',
  `jy_fee` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `jy_mun` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '积分',
  `all_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1->取消,2->完成',
  PRIMARY KEY (`jy_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_jiaoyiorder`
--

LOCK TABLES `ysk_jiaoyiorder` WRITE;
/*!40000 ALTER TABLE `ysk_jiaoyiorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_jiaoyiorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_kaidi`
--

DROP TABLE IF EXISTS `ysk_kaidi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_kaidi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '播种记录表id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `farm_id` tinyint(4) NOT NULL COMMENT '农田id',
  `num` int(11) NOT NULL COMMENT '播种数量',
  `farm_type` tinyint(4) NOT NULL COMMENT '土地类型：1.黄土地 2.红土地 3.黑土地',
  `sow_time` int(11) NOT NULL COMMENT '播种时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '播种状态  0隐藏 1显示',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_kaidi`
--

LOCK TABLES `ysk_kaidi` WRITE;
/*!40000 ALTER TABLE `ysk_kaidi` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_kaidi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_layerneeds`
--

DROP TABLE IF EXISTS `ysk_layerneeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_layerneeds` (
  `id` int(11) NOT NULL COMMENT '等级设置表',
  `direct_pers` int(11) NOT NULL DEFAULT '0' COMMENT '所需直推人数',
  `member_jifen` int(11) NOT NULL DEFAULT '0' COMMENT '所需要积分',
  `member_grade` int(11) NOT NULL DEFAULT '1' COMMENT '对应用户等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_layerneeds`
--

LOCK TABLES `ysk_layerneeds` WRITE;
/*!40000 ALTER TABLE `ysk_layerneeds` DISABLE KEYS */;
INSERT INTO `ysk_layerneeds` VALUES (1,0,0,1),(2,10,10,2),(3,20,12,3),(4,30,16,4),(5,40,20,5),(6,50,30,6),(7,60,400,7);
/*!40000 ALTER TABLE `ysk_layerneeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_level_list`
--

DROP TABLE IF EXISTS `ysk_level_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_level_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '升级等级',
  `proof` varchar(128) NOT NULL COMMENT '支付凭证',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '付款金额',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态0未处理 1已处理 2已取消',
  `time` varchar(12) NOT NULL COMMENT '申请时间',
  `datestr` varchar(16) NOT NULL COMMENT '申请日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_level_list`
--

LOCK TABLES `ysk_level_list` WRITE;
/*!40000 ALTER TABLE `ysk_level_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_level_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_limit`
--

DROP TABLE IF EXISTS `ysk_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_limit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `limit_num` int(11) NOT NULL COMMENT '限制数量',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '按稻草人还是直推会员推荐',
  `level_name` varchar(20) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_limit`
--

LOCK TABLES `ysk_limit` WRITE;
/*!40000 ALTER TABLE `ysk_limit` DISABLE KEYS */;
INSERT INTO `ysk_limit` VALUES (1,50,0,'普通用户',''),(2,500,1,'青铜农主',''),(3,500,2,'白金农主',''),(4,500,3,'水晶农主',''),(5,1000,4,'宝石农主',''),(6,1500,5,'钻石农主',''),(7,2000,6,'皇冠农主','');
/*!40000 ALTER TABLE `ysk_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_love_shop`
--

DROP TABLE IF EXISTS `ysk_love_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_love_shop` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '收藏店铺id',
  `user_id` int(5) NOT NULL COMMENT '用户id',
  `shop_id` int(5) NOT NULL COMMENT '店铺id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_love_shop`
--

LOCK TABLES `ysk_love_shop` WRITE;
/*!40000 ALTER TABLE `ysk_love_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_love_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_love_shoping`
--

DROP TABLE IF EXISTS `ysk_love_shoping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_love_shoping` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '收藏商品id',
  `user_id` int(5) NOT NULL COMMENT '用户id',
  `shop_id` int(5) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_love_shoping`
--

LOCK TABLES `ysk_love_shoping` WRITE;
/*!40000 ALTER TABLE `ysk_love_shoping` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_love_shoping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_member`
--

DROP TABLE IF EXISTS `ysk_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员表',
  `uname` varchar(11) DEFAULT NULL COMMENT '用户名',
  `fid` int(11) NOT NULL DEFAULT '0' COMMENT '推荐人id',
  `path_id` text NOT NULL COMMENT '团队路径',
  `phone` varchar(11) NOT NULL DEFAULT '0' COMMENT '电话号码',
  `cangkujiwo__jifen` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '仓库鸡窝积分',
  `renqizhinums` int(10) NOT NULL DEFAULT '0' COMMENT '人气值',
  `xiaofei_jifen` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '消费积分',
  `mobile` varchar(11) NOT NULL DEFAULT '0' COMMENT '电话号码',
  `fc` int(11) NOT NULL DEFAULT '0' COMMENT '累计获得风车数',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `last_login_ip` varchar(40) DEFAULT NULL COMMENT '上次登录ip',
  `last_ip_region` varchar(64) DEFAULT NULL COMMENT 'ip指向详细地址',
  `last_login_time` int(11) DEFAULT NULL,
  `session_id` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0->默认,1->冻结',
  `chicken_bili` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '鸡窝拆分率',
  `lenth_layer` int(11) NOT NULL DEFAULT '0' COMMENT '深度',
  `member_grade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '对应用户等级 0普通会员 1体验会员 2钻石会员 3联盟会员  ',
  `member_grade_shoudong` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1默认 2后台已改 3前台受方法影响',
  `api_pay` varchar(30) DEFAULT NULL COMMENT '支付宝账号',
  `wx_name` varchar(30) DEFAULT NULL COMMENT '微信',
  `add_ress` varchar(100) DEFAULT NULL COMMENT '收货地址',
  `farmlink_address` varchar(100) DEFAULT NULL COMMENT '农联币地址',
  `zhuanjia` tinyint(1) NOT NULL DEFAULT '0' COMMENT '专家',
  `guanjia` tinyint(1) NOT NULL DEFAULT '0' COMMENT '管家',
  `pwd` varchar(255) NOT NULL COMMENT '密码',
  `twopass` varchar(255) NOT NULL COMMENT '二级密码',
  `avatar` varchar(50) NOT NULL DEFAULT '1.jpg' COMMENT '头像',
  `create_time` int(11) NOT NULL COMMENT '产生时间',
  `member_directnums` int(11) NOT NULL DEFAULT '0' COMMENT '直推有效人数',
  `team_directnums` int(11) NOT NULL DEFAULT '0' COMMENT '团队有效人数',
  `direct_kaidi` float(11,1) NOT NULL DEFAULT '0.0' COMMENT '我的直推人第一次开地',
  `weiyang_time` date NOT NULL COMMENT '会员喂养时间',
  `weiyang_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '会员喂养收益',
  `tiaofen_mid` text NOT NULL COMMENT '挑我粪人员会员id',
  `buyu_earns` decimal(11,3) NOT NULL COMMENT '喂鱼收益',
  `buyu_id` text NOT NULL COMMENT '捕鱼id',
  `buyu_time` date NOT NULL COMMENT '捕鱼时间',
  `yangqiji` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '下级购买氧气机+0.1',
  `yangqiji_nums` int(1) NOT NULL DEFAULT '0' COMMENT '氧气机数量 最多5个',
  `music_isplay` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1->播放,2->暂停',
  `yuchang_guanjia` tinyint(1) NOT NULL DEFAULT '0' COMMENT '渔场管家',
  `bankname` varchar(80) NOT NULL DEFAULT '0' COMMENT '开户行',
  `banknumber` varchar(20) NOT NULL DEFAULT '0' COMMENT '银行卡号',
  `chaifen_bili` float(8,4) NOT NULL DEFAULT '0.0000' COMMENT '鸡窝拆分比例',
  `count_time` date NOT NULL COMMENT '计算拆分/收益时间',
  `tiaofen_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '挑粪收益',
  `guoyuan_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '果园施肥收益',
  `yuchang_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '渔场喂鱼收益',
  `guoyuan_chaifen` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '果园拆分',
  `yuchang_chaifen` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '渔场拆分',
  `jiwo_chaifen` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '鸡场拆分率',
  `guoyuan_nextsix` decimal(15,3) NOT NULL DEFAULT '0.000' COMMENT '下6级本金',
  `guoyuan_nextone` decimal(15,3) NOT NULL DEFAULT '0.000' COMMENT '下1级本金',
  `jiaoshuiid` text NOT NULL COMMENT '给我浇水的下级',
  `houtaijibie` tinyint(1) NOT NULL DEFAULT '1' COMMENT '后台设置级别',
  `judian_pic` varchar(40) NOT NULL COMMENT '聚点收款账号',
  `buy_moneys` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '购买总数量',
  `is_dailishang` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1->普通用户,2->代理商,3->大区负责人',
  `is_manager` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为大区负责人0否 1是',
  `is_p_verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '个人认证 0未认证 1已认证 ',
  `is_e_verify` tinyint(1) NOT NULL COMMENT '企业认证 0未认证 1已认证 ',
  `prov` varchar(64) DEFAULT NULL COMMENT '代理省份',
  `city` varchar(64) DEFAULT NULL COMMENT '代理城市',
  `dl_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '代理服务费',
  `tg_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '推广金',
  `gl_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '管理服务费',
  `team_grade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户所属团队',
  `dailishang_logo` varchar(256) NOT NULL DEFAULT '1.jpg' COMMENT '商家logo',
  `dailishang_name` varchar(35) NOT NULL COMMENT '商家店铺名',
  PRIMARY KEY (`member_id`) USING BTREE,
  UNIQUE KEY `member_id` (`member_id`) USING BTREE COMMENT 'member_id',
  KEY `fuzhu` (`lenth_layer`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_member`
--

LOCK TABLES `ysk_member` WRITE;
/*!40000 ALTER TABLE `ysk_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_member_jifens`
--

DROP TABLE IF EXISTS `ysk_member_jifens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_member_jifens` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分明细表',
  `chicken_jifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '鸡窝积分',
  `fish_jifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '渔场积分',
  `farm_jifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '农场积分',
  `farmlink_jifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '农联积分',
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `chicken_earnjifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '鸡场总收益',
  `fish_earnjifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '渔场总收益',
  `farm_earnjifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '农场总收益',
  `xiaofei_jifen` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '消费积分',
  `renqicount` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '人气值',
  `yongjin` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '分销佣金',
  `daili_yongjin` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '代理佣金',
  `balance_nums` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '余额/(区块链使用)',
  `yu_ku` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '只能用来提现',
  `yuchang_dongjie` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '渔场摸虾冻结积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_member_jifens`
--

LOCK TABLES `ysk_member_jifens` WRITE;
/*!40000 ALTER TABLE `ysk_member_jifens` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_member_jifens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_menu`
--

DROP TABLE IF EXISTS `ysk_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `pid` int(11) NOT NULL COMMENT '父级id',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '爷爷ID、',
  `col` varchar(30) NOT NULL COMMENT '控制器',
  `act` varchar(30) NOT NULL COMMENT '方法',
  `patch` varchar(50) DEFAULT NULL COMMENT '全路径',
  `level` int(11) NOT NULL COMMENT '级别',
  `icon` varchar(50) DEFAULT NULL,
  `sort` char(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=341 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_menu`
--

LOCK TABLES `ysk_menu` WRITE;
/*!40000 ALTER TABLE `ysk_menu` DISABLE KEYS */;
INSERT INTO `ysk_menu` VALUES (4,'系统配置',3,1,'Config','group4','',2,'fa-wrench','11',1),(6,'管理员管理',3,1,'Manage','index','',2,'fa fa-cog','13',1),(3,'统用功能',1,1,'','','',1,'fa-folder-open-o','1',1),(5,'角色管理',3,1,'Group','index','',2,'fa-sitemap','12',1),(7,'会员管理',1,1,'','','',1,'fa-folder-open-o','2',1),(8,'会员列表',7,1,'User','index',NULL,2,'fa-user','21',1),(9,'推荐结构',7,1,'Tree','index',NULL,2,'fa-th-large','22',1),(1,'系统',0,0,'','',NULL,0,'fa-cog','0',1),(10,'系统记录',0,0,'','',NULL,0,'fa-tasks','0',0),(11,'商品管理',10,10,'','',NULL,1,'fa-folder-open-o','3',1),(315,'商品列表',11,10,'Good','index',NULL,2,NULL,'31',1),(316,'反馈管理',1,1,'','',NULL,1,'fa-folder-open-o','3',1),(331,'游戏币转入',319,1,'BuyNum','index',NULL,2,'fa-list','43',0),(318,'反馈列表',316,1,'Recyling','index',NULL,2,'fa-file-text','32',1),(319,'平台充值管理',1,1,'','',NULL,1,'fa-folder-open-o','4',0),(320,'平台充值',319,1,'FruitsManage','index',NULL,2,'fa-jpy','41',0),(321,'充值流水',319,1,'FruitsDetail','index',NULL,2,'fa-list','42',0),(322,'公告管理',1,1,'','',NULL,1,'fa-folder-open-o','5',1),(323,'系统公告',322,1,'News','index',NULL,2,'fa-twitter-square','51',1),(324,'交易管理',10,10,'','','',1,'fa-folder-open-o','6',1),(325,'定向交易记录',324,10,'Traing','index','',2,'fa-list','61',1),(327,'数据库管理',3,1,'Database','index',NULL,2,'fa fa-lock','14',1),(328,'转盘记录',324,10,'Traing','turntable','',2,'fa-list','67',1),(329,'施肥记录',324,10,'Traing','growth','',2,'fa-list','66',1),(330,'果子转聚宝盆',319,1,'SellNum','index',NULL,2,'fa-list','45',0),(332,'激活码管理',1,1,'','',NULL,1,'fa-folder-open-o','7',0),(333,'激活码列表',332,1,'ActivateNum','index',NULL,2,'fa-list','71',0),(334,'自由交易记录',324,10,'Traing','tradingfree','',2,'fa-list','62',1),(335,'轮播管理',1,1,'','','',1,'fa-folder-open-o','6',1),(336,'系统轮播',335,1,'Banner','index','',2,'fa-twitter-square','51',1),(337,'投诉列表',316,1,'Complaint','index',NULL,2,'fa-file-text','33',1),(338,'短信配置',3,1,'Config','msgs',NULL,2,'fa fa-twitter-square','88',1),(339,'后台充值记录',7,1,'User','recharge',NULL,2,'fa-list','99',1),(340,'众筹记录',7,1,'Crowdsd','index',NULL,2,'fa-list','68',1);
/*!40000 ALTER TABLE `ysk_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_moneyils`
--

DROP TABLE IF EXISTS `ysk_moneyils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_moneyils` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_id` int(10) NOT NULL COMMENT '付钱会员id',
  `get_id` int(10) NOT NULL COMMENT '拿钱id',
  `get_nums` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '拿钱数量',
  `get_level` int(2) NOT NULL DEFAULT '0' COMMENT '第几代拿钱',
  `get_types` int(2) NOT NULL DEFAULT '0' COMMENT '1->转账三级分销，2->余额转积分三级分销',
  `get_time` char(30) NOT NULL DEFAULT '0' COMMENT '拿钱时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1036 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_moneyils`
--

LOCK TABLES `ysk_moneyils` WRITE;
/*!40000 ALTER TABLE `ysk_moneyils` DISABLE KEYS */;
INSERT INTO `ysk_moneyils` VALUES (53,6000125,6000028,40.00,1,1,'1521624882'),(54,6000114,6000110,16.00,1,1,'1521777204'),(55,6000114,6000110,16.00,1,1,'1521783962'),(56,6000032,6000016,500.00,1,1,'1521789857'),(33,6000138,6000104,8.00,1,2,'1520679221'),(34,6000138,6000005,3.00,2,2,'1520679221'),(35,6000138,6000004,3.00,3,2,'1520679221'),(36,6000138,6000001,3.00,4,2,'1520679221'),(37,6000138,6000104,8.00,1,2,'1520679238'),(38,6000138,6000005,3.00,2,2,'1520679238'),(39,6000138,6000004,3.00,3,2,'1520679238'),(40,6000138,6000001,3.00,4,2,'1520679238'),(41,6000138,6000104,8.00,1,2,'1520679271'),(42,6000138,6000005,3.00,2,2,'1520679271'),(43,6000138,6000004,3.00,3,2,'1520679271'),(44,6000138,6000001,3.00,4,2,'1520679271'),(45,6000138,6000104,8.00,1,2,'1520679351'),(46,6000138,6000104,16.00,1,2,'1520680159'),(47,6000138,6000104,1.60,1,1,'1520680588'),(48,6000138,6000104,16.00,1,2,'1520680601'),(49,6000138,6000104,8.00,1,2,'1521027562'),(50,6000138,6000104,8.00,1,2,'1521027577'),(51,6000138,6000104,1.60,1,1,'1521027608'),(52,6000125,6000028,40.00,1,1,'1521624561'),(57,6000164,6000163,8.00,1,2,'1522218777'),(58,6000149,6000148,8.00,1,1,'1522635230'),(59,6000149,6000148,8.00,1,1,'1522635676'),(60,6000158,6000148,8.00,1,1,'1522635939'),(61,6000158,6000148,8.00,1,1,'1522635987'),(62,6000190,6000148,3.00,3,1,'1522661923'),(63,6000165,6000163,8.00,1,2,'1522725079'),(64,6000164,6000163,16.00,1,1,'1522727205'),(65,6000164,6000163,16.00,1,1,'1522727252'),(66,6000164,6000163,16.00,1,1,'1522727804'),(67,6000164,6000163,16.00,1,1,'1522727859'),(68,6000201,6000163,4.80,2,1,'1522727981'),(69,6000201,6000163,3.00,2,2,'1522728015'),(70,6000164,6000163,16.00,1,1,'1522728472'),(71,6000201,6000163,6.00,2,2,'1522728629'),(72,6000164,6000163,16.00,1,1,'1522745092'),(73,6000164,6000163,16.00,1,1,'1522745167'),(74,6000164,6000163,16.00,1,1,'1522745442'),(75,6000164,6000163,16.00,1,1,'1522760114'),(76,6000164,6000163,16.00,1,1,'1522764359'),(77,6000164,6000163,16.00,1,1,'1522764404'),(78,6000164,6000163,16.00,1,1,'1522764451'),(79,6000164,6000163,16.00,1,1,'1522764506'),(80,6000164,6000163,16.00,1,1,'1522764572'),(81,6000164,6000163,16.00,1,1,'1522764611'),(82,6000203,6000202,4160.00,1,2,'1522765147'),(83,6000208,6000203,1200.00,3,2,'1522767980'),(84,6000164,6000163,16.00,1,1,'1522798157'),(85,6000209,6000165,8.00,1,2,'1522802639'),(86,6000164,6000163,16.00,1,1,'1522815470'),(87,6000164,6000163,800.00,1,1,'1522817875'),(88,6000214,6000163,3.00,2,2,'1522818440'),(89,6000215,6000163,240.00,2,2,'1522818700'),(90,6000207,6000203,3.00,3,2,'1522822146'),(91,6000197,6000148,0.06,2,1,'1522839800'),(92,6000215,6000163,3.00,2,2,'1522891806'),(93,6000164,6000163,1600.00,1,2,'1522959750'),(94,6000198,6000165,8.00,1,2,'1523009432'),(95,6000200,6000165,8.00,1,2,'1523009951'),(96,6000200,6000165,320.00,1,2,'1523024676'),(97,6000200,6000165,8.00,1,2,'1523030629'),(98,6000199,6000165,8.00,1,2,'1523060320'),(99,6000197,6000148,30.00,2,1,'1523071387'),(100,6000197,6000148,3.00,2,1,'1523072806'),(101,6000158,6000148,4.00,1,1,'1523072856'),(102,6000199,6000165,4.80,1,1,'1523080029'),(103,6000200,6000165,8.00,1,2,'1523080605'),(104,6000210,6000208,80.00,1,1,'1523090260'),(105,6000210,6000208,80.00,1,1,'1523090261'),(106,6000210,6000208,80.00,1,1,'1523091013'),(107,6000210,6000208,80.00,1,1,'1523091035'),(108,6000210,6000208,80.00,1,1,'1523091101'),(109,6000210,6000208,80.00,1,1,'1523091474'),(110,6000210,6000203,30.00,4,1,'1523091495'),(111,6000210,6000203,30.00,4,1,'1523092504'),(112,6000210,6000203,30.00,4,1,'1523093986'),(113,6000210,6000203,30.00,4,1,'1523096440'),(114,6000210,6000203,30.00,4,1,'1523096641'),(115,6000200,6000165,8.00,1,2,'1523102777'),(116,6000200,6000165,3.20,1,1,'1523103873'),(117,6000199,6000165,0.15,1,1,'1523104036'),(118,6000225,6000165,1.00,2,1,'1523104111'),(119,6000167,6000163,704.00,1,2,'1523116623'),(120,6000227,6000165,4.80,2,1,'1523142634'),(121,6000198,6000165,8.00,1,2,'1523142868'),(122,6000226,6000165,4.80,2,1,'1523143673'),(123,6000200,6000165,8.00,1,2,'1523144390'),(124,6000225,6000165,4.80,2,1,'1523148709'),(125,6000199,6000165,8.00,1,2,'1523148777'),(126,6000198,6000165,1.20,1,1,'1523149856'),(127,6000200,6000165,8.00,1,2,'1523149911'),(128,6000208,6000203,300.00,3,1,'1523151612'),(129,6000207,6000203,90.00,3,2,'1523151980'),(130,6000206,6000203,6.00,2,2,'1523155711'),(131,6000204,6000203,16.00,1,2,'1523163938'),(132,6000204,6000203,16.00,1,2,'1523164061'),(133,6000207,6000203,3.00,3,2,'1523170267'),(134,6000223,6000203,3.00,4,2,'1523171748'),(135,6000224,6000165,3.00,2,2,'1523184365'),(136,6000206,6000203,15.00,2,2,'1523185934'),(137,6000199,6000165,8.00,1,2,'1523203489'),(138,6000237,6000163,16.00,1,2,'1523239938'),(139,6000213,6000203,3.00,4,2,'1523240011'),(140,6000219,6000203,8.00,1,2,'1523245529'),(141,6000208,6000203,150.00,3,2,'1523250004'),(142,6000207,6000203,60.00,3,2,'1523250138'),(143,6000248,6000245,30.00,3,1,'1523257214'),(144,6000207,6000203,60.00,3,2,'1523259418'),(145,6000206,6000203,27.00,2,2,'1523269820'),(146,6000204,6000203,80.00,1,2,'1523277659'),(147,6000206,6000203,30.00,2,2,'1523278178'),(148,6000207,6000203,30.00,3,2,'1523283310'),(149,6000208,6000203,150.00,3,2,'1523285514'),(150,6000257,6000163,640.00,1,2,'1523327207'),(151,1689,1688,3840.00,1,2,'1523376180'),(152,1691,1688,20.80,1,1,'1523421614'),(153,1697,1688,1600.00,1,1,'1523442339'),(154,1689,1688,16000.00,1,1,'1523446694'),(155,1690,1688,28800.00,2,2,'1523448593'),(156,1692,1688,8250.00,2,1,'1523448894'),(157,1689,1688,57600.00,1,2,'1523449923'),(158,1698,1688,171.00,3,1,'1523453285'),(159,1695,1688,450.00,3,2,'1523453448'),(160,1695,1688,360.00,3,2,'1523457004'),(161,1695,1688,18.00,3,2,'1523491415'),(162,1691,1688,0.08,1,1,'1523521899'),(163,1691,1688,0.08,1,1,'1523522578'),(164,1691,1688,0.08,1,1,'1523522610'),(165,1691,1688,0.08,1,1,'1523522641'),(166,1691,1688,0.08,1,1,'1523522710'),(167,1691,1688,0.08,1,1,'1523522797'),(168,1691,1688,0.08,1,1,'1523522823'),(169,1691,1688,0.08,1,1,'1523522855'),(170,1691,1688,0.08,1,1,'1523522977'),(171,1716,1688,0.08,1,1,'1523526916'),(172,1715,1688,0.08,1,1,'1523527009'),(173,1716,1688,0.08,1,1,'1523527146'),(174,1716,1688,0.03,2,1,'1523527493'),(175,1716,1688,0.03,2,1,'1523527493'),(176,1716,1688,0.03,2,1,'1523527790'),(177,1716,1688,8.00,2,1,'1523531684'),(178,1716,1688,8.00,2,1,'1523531693'),(179,1716,1688,8.00,2,1,'1523531783'),(180,1716,1688,8.00,2,1,'1523531835'),(181,1690,1688,800.00,2,1,'1523538796'),(182,1690,1688,800.00,2,1,'1523538827'),(183,1690,1688,500.00,2,1,'1523539042'),(184,1690,1688,500.00,2,1,'1523539052'),(185,1690,1688,500.00,2,1,'1523539107'),(186,1690,1688,500.00,2,1,'1523539108'),(187,1690,1688,500.00,2,1,'1523539178'),(188,1690,1688,500.00,2,1,'1523539219'),(189,1690,1688,500.00,2,1,'1523539241'),(190,1690,1688,500.00,2,1,'1523539297'),(191,1690,1688,500.00,2,1,'1523539310'),(192,1690,1688,500.00,2,1,'1523539361'),(193,1690,1688,500.00,2,1,'1523539442'),(194,1690,1688,500.00,2,1,'1523539481'),(195,1690,1688,500.00,2,1,'1523539506'),(196,1690,1688,500.00,2,1,'1523539580'),(197,1690,1688,500.00,2,1,'1523539834'),(198,1690,1688,500.00,2,1,'1523541045'),(199,1690,1688,50.00,2,1,'1523542071'),(200,1701,1688,48.00,4,2,'1523544820'),(201,1705,1688,48.00,8,2,'1523545289'),(202,1704,1688,48.00,7,2,'1523545416'),(203,1691,1688,16.00,1,1,'1523545522'),(204,1691,1688,16.00,1,1,'1523545569'),(205,1691,1688,16.00,1,1,'1523545627'),(206,1691,1688,16.00,1,1,'1523545705'),(207,1691,1688,16.00,1,1,'1523545753'),(208,1691,1688,16.00,1,1,'1523545794'),(209,1691,1688,16.00,1,1,'1523545831'),(210,1691,1688,16.00,1,1,'1523545864'),(211,1691,1688,16.00,1,1,'1523545897'),(212,1722,1688,48.00,3,2,'1523567644'),(213,1698,1688,48.00,3,2,'1523571884'),(214,1692,1688,192.00,2,2,'1523572027'),(215,1693,1688,48.00,3,2,'1523573337'),(216,1717,1688,48.00,7,2,'1523577942'),(217,1702,1688,48.00,5,2,'1523578652'),(218,1704,1688,96.00,7,2,'1523579536'),(219,1689,1688,76800.00,1,2,'1523595464'),(220,1707,1688,48.00,4,2,'1523595942'),(221,1690,1689,76800.00,1,2,'1523596046'),(222,1690,1688,80.00,2,1,'1523599807'),(223,1690,1688,1600.00,2,1,'1523600415'),(224,1690,1688,80.00,2,1,'1523600771'),(225,1689,1688,160.00,1,1,'1523600857'),(226,1712,1688,48.00,9,2,'1523602260'),(227,1690,1688,640.00,2,1,'1523604216'),(228,1689,1688,2880.00,1,2,'1523606322'),(229,1690,1688,1.60,2,1,'1523629793'),(230,1690,1688,1.60,2,1,'1523629821'),(231,1705,1688,1.60,8,1,'1523629877'),(232,1705,1688,1.60,8,1,'1523630029'),(233,1705,1691,1.60,7,1,'1523630094'),(234,1744,1688,160.00,2,1,'1523635052'),(235,1744,1688,160.00,2,2,'1523635379'),(236,1690,1688,640.00,2,1,'1523638681'),(237,1690,1688,2560.00,2,2,'1523639058'),(238,1692,1688,40.00,2,2,'1523639423'),(239,1738,1688,3.20,7,1,'1523639701'),(240,1737,1688,3.20,7,1,'1523639739'),(241,1697,1688,16.00,1,1,'1523639782'),(242,1697,1688,80.00,1,2,'1523640194'),(243,1733,1688,3.20,7,1,'1523640826'),(244,1728,1688,3.20,7,1,'1523640875'),(245,1735,1688,3.20,8,1,'1523640920'),(246,1731,1688,3.20,10,1,'1523640971'),(247,1730,1688,3.20,10,1,'1523641015'),(248,1740,1688,3.20,7,1,'1523641066'),(249,1724,1688,3.20,9,1,'1523641200'),(250,1723,1688,3.20,9,1,'1523641247'),(251,1726,1688,3.20,9,1,'1523641294'),(252,1730,1688,8.00,10,2,'1523659046'),(253,1734,1688,3.20,7,1,'1523660929'),(254,1703,1688,0.96,6,1,'1523661995'),(255,1703,1688,8.00,6,2,'1523662058'),(256,1724,1688,8.00,9,2,'1523665751'),(257,1731,1688,8.00,10,2,'1523667020'),(258,1742,1688,3.20,7,1,'1523668180'),(259,1743,1688,3.20,7,1,'1523668221'),(260,1700,1688,960.00,3,1,'1523668667'),(261,1700,1688,3840.00,3,2,'1523669537'),(262,1745,1688,3.20,3,1,'1523672467'),(263,1689,1688,16000.00,1,2,'1523672935'),(264,1702,1688,2000.00,5,1,'1523679204'),(265,1702,1688,8000.00,5,2,'1523679275'),(266,1726,1688,8.00,9,2,'1523681838'),(267,1709,1688,8.00,7,2,'1523688845'),(268,1735,1688,8.00,8,2,'1523698217'),(269,1694,1688,4.16,3,1,'1523703933'),(270,1692,1688,400.00,2,1,'1523704039'),(271,1692,1688,1200.00,2,1,'1523704209'),(272,1708,1688,8.00,4,2,'1523704861'),(273,1695,1688,8.00,3,2,'1523705446'),(274,1723,1688,8.00,9,2,'1523707879'),(275,1702,1688,1200.00,5,1,'1523711000'),(276,1753,1688,3.20,4,1,'1523713023'),(277,1754,1688,3.20,4,1,'1523713056'),(278,1757,1688,3.20,9,1,'1523713106'),(279,1755,1688,3.20,9,1,'1523713152'),(280,1748,1688,3.20,9,1,'1523713185'),(281,1740,1688,8.00,7,2,'1523719557'),(282,1736,1688,8.00,2,2,'1523723709'),(283,1762,1688,3.20,5,1,'1523746675'),(284,1694,1688,8.00,3,2,'1523747175'),(285,1695,1688,8.00,3,2,'1523747212'),(286,1756,1688,3.20,10,1,'1523749305'),(287,1717,1688,3.20,7,1,'1523749334'),(288,1702,1688,4888.00,5,2,'1523749469'),(289,1769,1688,3.20,4,1,'1523749620'),(290,1759,1688,3.20,2,1,'1523751493'),(291,1759,1688,8.00,2,2,'1523752740'),(292,1763,1702,3.20,4,1,'1523754155'),(293,1717,1702,16.00,2,2,'1523755650'),(294,1737,1702,8.00,2,2,'1523755831'),(295,1762,1688,8.00,5,2,'1523761332'),(296,1755,1702,8.00,4,2,'1523762655'),(297,1756,1702,8.00,5,2,'1523764817'),(298,1764,1702,3.20,3,1,'1523771308'),(299,1765,1702,3.20,3,1,'1523771343'),(300,1766,1702,3.20,3,1,'1523771380'),(301,1767,1702,3.20,3,1,'1523771426'),(302,1768,1702,3.20,3,1,'1523771458'),(303,1770,1702,3.20,3,1,'1523771571'),(304,1771,1702,3.20,3,1,'1523771611'),(305,1772,1702,3.20,3,1,'1523771714'),(306,1773,1702,3.20,3,1,'1523771751'),(307,1777,1702,3.20,3,1,'1523771797'),(308,1778,1702,3.20,4,1,'1523771859'),(309,1775,1702,3.20,3,1,'1523772112'),(310,1757,1702,8.00,4,2,'1523773537'),(311,1777,1702,8.00,3,2,'1523775233'),(312,1775,1702,8.00,3,2,'1523782668'),(313,1754,1688,8.00,4,2,'1523786160'),(314,1785,1702,3.20,4,1,'1523786314'),(315,1779,1702,3.20,4,1,'1523786344'),(316,1782,1702,3.20,4,1,'1523786385'),(317,1786,1702,3.20,4,1,'1523786428'),(318,1789,1702,3.20,4,1,'1523786473'),(319,1774,1702,3.20,5,1,'1523786563'),(320,1790,1702,3.20,5,1,'1523786596'),(321,1787,1702,3.20,5,1,'1523786627'),(322,1741,1702,3.20,5,1,'1523786738'),(323,1792,1702,3.20,5,1,'1523786771'),(324,1782,1702,8.00,4,2,'1523786858'),(325,1701,1688,3.20,4,1,'1523787701'),(326,1789,1702,8.00,4,2,'1523789734'),(327,1792,1702,8.00,5,2,'1523794516'),(328,1753,1688,8.00,4,2,'1523798031'),(329,1779,1702,8.00,4,2,'1523799280'),(330,1701,1688,8.00,4,2,'1523805141'),(331,1807,1702,3.20,3,1,'1523831887'),(332,1808,1702,3.20,3,1,'1523831920'),(333,1809,1702,3.20,3,1,'1523831961'),(334,1797,1702,3.20,5,1,'1523833085'),(335,1796,1702,3.20,5,1,'1523833114'),(336,1791,1702,3.20,6,1,'1523833153'),(337,1803,1702,3.20,4,1,'1523833185'),(338,1774,1702,8.00,5,2,'1523833294'),(339,1701,1688,8.00,4,1,'1523833620'),(340,1775,1702,1.14,3,1,'1523833645'),(341,1717,1702,1.89,2,1,'1523833856'),(342,1694,1688,8.00,3,2,'1523835508'),(343,1800,1702,2.57,4,1,'1523837179'),(344,1796,1702,8.00,5,2,'1523839191'),(345,1797,1702,8.00,5,2,'1523839350'),(346,1705,1702,2.40,3,1,'1523839908'),(347,1790,1702,8.00,5,2,'1523839965'),(348,1791,1702,8.00,6,2,'1523840174'),(349,1816,1702,3.20,2,1,'1523845666'),(350,1799,1702,3.20,6,1,'1523845710'),(351,1806,1702,3.20,6,1,'1523845746'),(352,1818,1702,3.20,7,1,'1523845803'),(353,1819,1702,3.20,7,1,'1523845861'),(354,1800,1702,3.20,4,1,'1523846062'),(355,1801,1702,3.20,4,1,'1523846093'),(356,1802,1702,3.20,4,1,'1523846136'),(357,1804,1702,3.20,4,1,'1523846167'),(358,1805,1702,3.20,4,1,'1523846213'),(359,1785,1702,8.00,4,2,'1523857125'),(360,1786,1702,8.00,4,2,'1523857872'),(361,1787,1702,8.00,5,2,'1523860775'),(362,1831,1689,4.16,1,1,'1523871420'),(363,1831,1689,8.00,1,2,'1523871494'),(364,1831,1689,8.00,1,2,'1523871512'),(365,1705,1702,16.00,3,2,'1523877627'),(366,1757,1702,8.00,4,1,'1523881188'),(367,1818,1702,8.00,7,2,'1523886300'),(368,1803,1702,8.00,4,2,'1523886360'),(369,1799,1702,8.00,6,2,'1523891696'),(370,1750,1688,16.00,2,1,'1523895352'),(371,1825,1702,3.20,6,1,'1523895670'),(372,1837,1702,3.20,7,1,'1523895710'),(373,1822,1702,3.20,3,1,'1523895898'),(374,1794,1702,3.20,6,1,'1523895934'),(375,1812,1702,3.20,3,1,'1523895974'),(376,1827,1702,3.20,1,1,'1523896143'),(377,1841,1689,4.16,2,1,'1523896721'),(378,1841,1689,16.00,2,2,'1523897196'),(379,1712,1702,0.61,4,1,'1523916232'),(380,1712,1702,0.32,4,1,'1523916449'),(381,1712,1702,8.00,4,2,'1523916538'),(382,1695,1688,8.00,3,2,'1523917874'),(383,1843,1702,3.20,4,1,'1523918325'),(384,1839,1702,3.20,4,1,'1523918371'),(385,1811,1702,3.20,4,1,'1523918413'),(386,1810,1702,3.20,4,1,'1523918466'),(387,1798,1702,3.20,4,1,'1523918580'),(388,1784,1702,3.20,4,1,'1523918645'),(389,1781,1702,3.20,4,1,'1523918698'),(390,1780,1702,3.20,4,1,'1523918746'),(391,1847,1702,3.20,4,1,'1523918815'),(392,1836,1702,3.20,4,1,'1523918880'),(393,1835,1702,3.20,4,1,'1523918926'),(394,1834,1702,3.20,4,1,'1523918981'),(395,1833,1702,3.20,4,1,'1523919031'),(396,1824,1702,3.20,4,1,'1523919076'),(397,1799,1702,8.80,6,1,'1523919168'),(398,1774,1702,16.80,5,1,'1523919236'),(399,1797,1702,0.96,5,1,'1523921225'),(400,1797,1702,8.00,5,2,'1523921326'),(401,1736,1688,8.00,2,2,'1523922196'),(402,1712,1702,8.00,4,1,'1523924465'),(403,1731,1702,0.18,5,1,'1523926298'),(404,1730,1702,1.15,5,1,'1523926456'),(405,1819,1702,8.00,7,2,'1523928882'),(406,1709,1702,2.56,2,1,'1523937238'),(407,1837,1702,8.00,7,2,'1523938152'),(408,1851,1702,3.20,2,1,'1523939411'),(409,1853,1702,3.20,4,1,'1523939461'),(410,1709,1702,0.48,2,1,'1523939684'),(411,1709,1702,2.08,2,1,'1523940937'),(412,1780,1702,8.00,4,2,'1523943209'),(413,1706,1702,0.64,4,1,'1523953896'),(414,1706,1702,8.00,4,2,'1523953941'),(415,1854,1702,3.20,8,1,'1523956040'),(416,1850,1702,3.20,6,1,'1523956076'),(417,1855,1702,3.20,8,1,'1523956109'),(418,1842,1702,3.20,4,1,'1523956151'),(419,1852,1702,3.20,4,1,'1523956185'),(420,1862,1702,3.20,5,1,'1523956225'),(421,1815,1702,3.20,4,1,'1523956258'),(422,1694,1688,3.20,3,1,'1523956305'),(423,1693,1688,2.08,3,1,'1523956366'),(424,1787,1702,8.80,5,1,'1523956507'),(425,1791,1702,8.00,6,1,'1523957543'),(426,1850,1702,8.00,6,2,'1523958593'),(427,1741,1702,8.00,5,2,'1523966772'),(428,1730,1702,0.96,5,1,'1523966840'),(429,1695,1688,0.24,3,1,'1523967817'),(430,1693,1688,0.13,3,1,'1523972519'),(431,1822,1702,2.56,3,1,'1523973998'),(432,1822,1702,2.56,3,1,'1523974297'),(433,1693,1688,8.00,3,2,'1523974404'),(434,1822,1702,2.56,3,1,'1523974525'),(435,1822,1702,2.56,3,1,'1523974641'),(436,1822,1702,2.56,3,1,'1523974732'),(437,2088,1689,3200.00,2,1,'1523976236'),(438,2088,1689,12800.00,2,2,'1523976328'),(439,1718,1702,8.00,2,2,'1523977119'),(440,1848,1702,1.60,6,1,'1523978520'),(441,1757,1702,1.60,4,1,'1523979331'),(442,2088,1689,160.00,2,2,'1523981780'),(443,1860,1702,3.20,4,1,'1523985143'),(444,1865,1702,3.20,2,1,'1523985217'),(445,1867,1702,3.20,2,1,'1523985256'),(446,1872,1702,3.20,2,1,'1523985297'),(447,1877,1702,3.20,2,1,'1523985341'),(448,1866,1702,3.20,3,1,'1523985382'),(449,1873,1702,3.20,2,1,'1523985417'),(450,1870,1702,3.20,2,1,'1523985451'),(451,1869,1702,3.20,3,1,'1523985503'),(452,1874,1702,3.20,2,1,'1523985537'),(453,1868,1702,3.20,2,1,'1523985578'),(454,1879,1702,3.20,3,1,'1523985652'),(455,1856,1702,3.20,3,1,'1523985690'),(456,1788,1702,3.20,3,1,'1523985740'),(457,2084,1702,3.20,2,1,'1523985784'),(458,1863,1702,3.20,9,1,'1523986163'),(459,1864,1702,3.20,6,1,'1523986206'),(460,1871,1702,3.20,8,1,'1523986243'),(461,2082,1702,3.20,5,1,'1523986288'),(462,1853,1702,8.00,4,2,'1523994143'),(463,1730,1702,0.24,5,1,'1524007123'),(464,1731,1702,0.38,5,1,'1524007203'),(465,1712,1702,0.34,4,1,'1524007313'),(466,1731,1702,0.27,5,1,'1524007418'),(467,1797,1702,0.03,5,1,'1524007675'),(468,1796,1702,0.21,5,1,'1524007760'),(469,1815,1702,8.00,4,2,'1524009795'),(470,1704,1702,8.00,2,2,'1524012443'),(471,1774,1702,0.80,5,1,'1524013920'),(472,1848,1702,3.20,6,1,'1524027092'),(473,1846,1702,3.20,6,1,'1524027120'),(474,1844,1702,3.20,5,1,'1524027155'),(475,1845,1702,3.20,5,1,'1524027190'),(476,1825,1702,3.20,6,1,'1524027219'),(477,2086,1702,3.20,5,1,'1524027317'),(478,2085,1702,3.20,5,1,'1524027353'),(479,2081,1702,3.20,5,1,'1524027384'),(480,2099,1702,3.20,3,1,'1524027443'),(481,2098,1702,3.20,3,1,'1524027518'),(482,2095,1702,3.20,5,1,'1524027586'),(483,1817,1702,3.20,5,1,'1524027637'),(484,2091,1702,3.20,2,1,'1524027694'),(485,2096,1702,3.20,2,1,'1524027751'),(486,2105,1702,3.20,3,1,'1524028375'),(487,2103,1702,3.20,3,1,'1524028435'),(488,1879,1702,3.20,3,1,'1524028481'),(489,1709,1702,2.56,2,1,'1524030885'),(490,2104,1702,3.20,5,1,'1524042397'),(491,2102,1702,3.20,5,1,'1524042470'),(492,2106,1702,3.20,4,1,'1524042877'),(493,2109,1702,3.20,3,1,'1524042906'),(494,2110,1702,3.20,3,1,'1524042940'),(495,2107,1702,3.20,2,1,'1524043023'),(496,2111,1702,3.20,3,1,'1524043925'),(497,2113,1702,3.20,5,1,'1524046155'),(498,1859,1702,3.20,4,1,'1524047630'),(499,1711,1688,8.00,2,2,'1524048097'),(500,1693,1688,1.60,3,1,'1524051927'),(501,1706,1702,4.00,4,1,'1524052077'),(502,1693,1688,0.48,3,1,'1524052476'),(503,1693,1688,8.00,3,2,'1524052518'),(504,1705,1702,28.00,3,1,'1524052923'),(505,1861,1702,3.20,4,1,'1524057048'),(506,1730,1702,0.21,5,1,'1524059173'),(507,1712,1702,0.18,4,1,'1524059266'),(508,1741,1702,0.13,5,1,'1524059353'),(509,1731,1702,0.13,5,1,'1524059485'),(510,1712,1702,0.11,4,1,'1524059618'),(511,1701,1688,16.00,4,2,'1524060089'),(512,1704,1702,1.60,2,1,'1524060227'),(513,1704,1702,0.48,2,1,'1524060893'),(514,1704,1702,8.00,2,2,'1524060944'),(515,1757,1702,8.00,4,2,'1524063141'),(516,1774,1702,0.96,5,1,'1524063417'),(517,1774,1702,8.00,5,2,'1524063682'),(518,1848,1702,2.56,6,1,'1524064328'),(519,2124,1702,3.20,3,1,'1524064934'),(520,2123,1702,3.20,3,1,'1524064965'),(521,2122,1702,3.20,3,1,'1524064994'),(522,2120,1702,3.20,3,1,'1524065029'),(523,2118,1702,3.20,3,1,'1524065094'),(524,2116,1702,3.20,3,1,'1524065150'),(525,1876,1702,3.20,7,1,'1524065397'),(526,2128,1702,3.20,2,1,'1524065478'),(527,2129,1702,3.20,3,1,'1524065511'),(528,2130,1702,3.20,5,1,'1524065558'),(529,2132,1702,3.20,5,1,'1524065602'),(530,2114,1702,3.20,7,1,'1524065759'),(531,2112,1702,3.20,7,1,'1524065792'),(532,2094,1702,3.20,5,1,'1524065873'),(533,2119,1702,3.20,5,1,'1524065907'),(534,2117,1688,3.20,5,1,'1524065955'),(535,2121,1688,3.20,5,1,'1524066046'),(536,2127,1688,3.20,5,1,'1524066086'),(537,2126,1702,3.20,5,1,'1524066114'),(538,2125,1702,3.20,5,1,'1524066145'),(539,1848,1702,3.20,6,1,'1524066449'),(540,1846,1702,3.20,6,1,'1524066482'),(541,1848,1702,2.56,6,1,'1524066581'),(542,1784,1702,8.00,4,2,'1524082647'),(543,1736,1688,8.00,2,2,'1524088614'),(544,1702,1688,320.00,5,1,'1524088620'),(545,1797,1702,0.19,5,1,'1524094111'),(546,2102,1702,1.60,5,1,'1524098133'),(547,2102,1702,8.00,5,2,'1524098471'),(548,2102,1702,8.00,5,2,'1524098729'),(549,2104,1702,0.64,5,1,'1524098829'),(550,1709,1702,2.56,2,1,'1524105432'),(551,2108,1702,3.20,4,1,'1524112133'),(552,2131,1702,3.20,4,1,'1524112160'),(553,2133,1702,3.20,3,1,'1524112203'),(554,1861,1702,3.20,4,1,'1524112238'),(555,1829,1702,3.20,3,1,'1524112284'),(556,2138,1702,3.20,4,1,'1524112313'),(557,2142,1702,3.20,4,1,'1524112346'),(558,2143,1702,3.20,3,1,'1524112388'),(559,2144,1702,3.20,4,1,'1524112421'),(560,1709,1702,2.56,2,1,'1524115410'),(561,1709,1702,2.56,2,1,'1524115551'),(562,2147,1702,3.20,3,1,'1524116970'),(563,2148,1702,3.20,3,1,'1524117006'),(564,2149,1702,3.20,4,1,'1524117052'),(565,2151,1702,3.20,4,1,'1524117086'),(566,2146,1702,3.20,3,1,'1524117124'),(567,2150,1702,3.20,3,1,'1524117155'),(568,2153,1702,3.20,3,1,'1524117192'),(569,1709,1702,2.56,2,1,'1524117212'),(570,2150,1702,3.20,3,1,'1524117229'),(571,1709,1702,2.56,2,1,'1524117323'),(572,2152,1702,3.20,4,1,'1524117337'),(573,2154,1702,3.20,4,1,'1524117375'),(574,2155,1702,3.20,3,1,'1524117405'),(575,1853,1702,2.56,4,1,'1524117410'),(576,2150,1702,8.00,3,1,'1524117512'),(577,1853,1702,2.56,4,1,'1524117531'),(578,2152,1702,8.00,4,1,'1524117579'),(579,1853,1702,2.56,4,1,'1524117630'),(580,1853,1702,2.56,4,1,'1524117711'),(581,1773,1702,2.56,3,1,'1524117769'),(582,1773,1702,2.56,3,1,'1524117834'),(583,1773,1702,2.56,3,1,'1524117969'),(584,2154,1702,8.00,4,1,'1524118059'),(585,2138,1702,8.00,4,2,'1524123409'),(586,1731,1702,0.22,5,1,'1524124126'),(587,1730,1702,0.19,5,1,'1524124218'),(588,1712,1702,0.18,4,1,'1524124752'),(589,1730,1702,0.14,5,1,'1524125465'),(590,1741,1702,0.11,5,1,'1524125561'),(591,1731,1702,0.10,5,1,'1524125681'),(592,2143,1702,2.56,3,1,'1524130122'),(593,2143,1702,2.56,3,1,'1524130897'),(594,2143,1702,1.44,3,1,'1524131652'),(595,2143,1702,0.70,3,1,'1524131795'),(596,1777,1702,5.12,3,1,'1524132065'),(597,1709,1702,1.60,2,1,'1524132196'),(598,2143,1702,0.74,3,1,'1524132282'),(599,1870,1702,2.56,2,1,'1524133335'),(600,2133,1702,2.56,3,1,'1524133383'),(601,1848,1702,8.00,6,2,'1524138307'),(602,1695,1688,8.00,3,1,'1524143645'),(603,1689,1688,80.00,1,2,'1524145670'),(604,1709,1702,16.00,2,1,'1524146025'),(605,1718,1702,8.00,2,1,'1524146463'),(606,1745,1688,8.00,3,1,'1524146631'),(607,2142,1702,8.00,4,2,'1524147125'),(608,1740,1702,16.00,2,1,'1524147608'),(609,2519,1689,4.16,1,1,'1524149767'),(610,2519,1689,16.00,1,2,'1524149822'),(611,2520,1689,4.16,2,1,'1524149916'),(612,2520,1689,16.00,2,2,'1524150007'),(613,2090,1688,4.16,1,1,'1524150053'),(614,2090,1688,16.00,1,2,'1524150658'),(615,2156,1702,3.20,3,1,'1524152278'),(616,2158,1702,3.20,4,1,'1524152342'),(617,2160,1702,3.20,3,1,'1524152387'),(618,2157,1702,3.20,4,1,'1524152440'),(619,2159,1702,3.20,4,1,'1524152485'),(620,2161,1702,3.20,4,1,'1524152557'),(621,2164,1702,3.20,5,1,'1524152598'),(622,2168,1702,3.20,5,1,'1524152632'),(623,2169,1702,3.20,3,1,'1524152666'),(624,2170,1702,3.20,3,1,'1524152705'),(625,2171,1702,3.20,3,1,'1524152739'),(626,2176,1702,3.20,3,1,'1524152775'),(627,2175,1702,3.20,4,1,'1524152811'),(628,2177,1702,3.20,4,1,'1524152865'),(629,2179,1702,3.20,4,1,'1524152904'),(630,2181,1702,3.20,4,1,'1524152949'),(631,2184,1702,3.20,4,1,'1524152988'),(632,2185,1702,3.20,4,1,'1524153038'),(633,2186,1702,3.20,4,1,'1524153124'),(634,2188,1702,3.20,4,1,'1524153159'),(635,2189,1702,3.20,4,1,'1524153192'),(636,2190,1702,3.20,4,1,'1524153226'),(637,2193,1702,3.20,3,1,'1524153355'),(638,2210,1702,3.20,4,1,'1524153536'),(639,2211,1702,3.20,3,1,'1524153635'),(640,2209,1702,3.20,5,1,'1524153693'),(641,2208,1702,3.20,5,1,'1524153729'),(642,2207,1702,3.20,5,1,'1524153765'),(643,2206,1702,3.20,5,1,'1524153816'),(644,2205,1702,3.20,5,1,'1524153850'),(645,2204,1702,3.20,5,1,'1524153892'),(646,2203,1702,3.20,5,1,'1524153967'),(647,2202,1702,3.20,5,1,'1524153998'),(648,2201,1702,3.20,5,1,'1524154038'),(649,2200,1702,3.20,5,1,'1524154075'),(650,2198,1702,3.20,5,1,'1524154111'),(651,2197,1702,3.20,5,1,'1524154209'),(652,2196,1702,3.20,5,1,'1524154247'),(653,2195,1702,3.20,5,1,'1524154349'),(654,2192,1702,3.20,5,1,'1524154475'),(655,2191,1702,3.20,5,1,'1524154513'),(656,2168,1702,3.20,5,1,'1524154560'),(657,2517,1702,3.20,3,1,'1524154677'),(658,1875,1702,3.20,8,1,'1524154711'),(659,2214,1702,3.20,8,1,'1524154800'),(660,2515,1702,3.20,4,1,'1524154846'),(661,2215,1702,3.20,5,1,'1524154890'),(662,2141,1702,3.20,3,1,'1524154941'),(663,2167,1702,3.20,7,1,'1524155530'),(664,2215,1702,8.00,5,2,'1524176850'),(665,1794,1702,8.00,6,2,'1524177020'),(666,1775,1702,1.60,3,1,'1524177041'),(667,1775,1702,2.56,3,1,'1524177375'),(668,1775,1702,8.00,3,2,'1524177429'),(669,1702,1688,160.00,5,1,'1524177833'),(670,2161,1702,2.56,4,1,'1524182846'),(671,1709,1702,2.56,2,1,'1524183220'),(672,1709,1702,2.56,2,1,'1524187216'),(673,1709,1702,2.56,2,1,'1524187407'),(674,2161,1702,2.56,4,1,'1524192070'),(675,2161,1702,2.56,4,1,'1524192225'),(676,2161,1702,2.56,4,1,'1524192380'),(677,2161,1702,2.56,4,1,'1524192542'),(678,2161,1702,2.56,4,1,'1524192621'),(679,2161,1702,2.56,4,1,'1524192896'),(680,2161,1702,2.56,4,1,'1524192984'),(681,2161,1702,2.56,4,1,'1524193057'),(682,2161,1702,2.56,4,1,'1524193132'),(683,2161,1702,2.56,4,1,'1524193198'),(684,2161,1702,2.56,4,1,'1524193347'),(685,2161,1702,2.56,4,1,'1524193423'),(686,2161,1702,2.56,4,1,'1524193535'),(687,2161,1702,2.56,4,1,'1524193618'),(688,2161,1702,2.56,4,1,'1524196061'),(689,1693,1688,2.56,3,1,'1524197046'),(690,1693,1688,2.56,3,1,'1524197361'),(691,2161,1702,2.56,4,1,'1524197419'),(692,1800,1702,2.56,4,1,'1524197605'),(693,1703,1702,2.56,1,1,'1524197949'),(694,1717,1702,2.56,2,1,'1524198052'),(695,1693,1688,2.56,3,1,'1524198130'),(696,1706,1702,2.56,4,1,'1524198495'),(697,1693,1688,2.56,3,1,'1524198667'),(698,1800,1702,2.56,4,1,'1524198857'),(699,1693,1688,16.00,3,2,'1524199061'),(700,1693,1688,32.00,3,2,'1524199083'),(701,1693,1688,4.00,3,1,'1524199187'),(702,1747,1688,35.20,2,1,'1524200681'),(703,1729,1688,24.96,1,1,'1524201005'),(704,1747,1688,16.00,2,2,'1524201026'),(705,1729,1688,96.00,1,2,'1524201411'),(706,1693,1688,2.56,3,1,'1524201420'),(707,2161,1702,5.12,4,1,'1524201884'),(708,1703,1702,2.56,1,1,'1524201896'),(709,1717,1702,2.56,2,1,'1524201975'),(710,2524,1702,4.80,3,1,'1524204236'),(711,2161,1702,2.56,4,1,'1524205196'),(712,2524,1702,16.00,3,2,'1524206191'),(713,2088,1689,3200.00,2,1,'1524207964'),(714,2097,1689,1600.00,1,1,'1524208111'),(715,2097,1689,6400.00,1,2,'1524208219'),(716,1730,1702,0.11,5,1,'1524213236'),(717,1706,1702,2.56,4,1,'1524217837'),(718,1709,1702,2.56,2,1,'1524218471'),(719,1706,1702,2.56,4,1,'1524218664'),(720,1709,1702,2.56,2,1,'1524218870'),(721,1709,1702,2.56,2,1,'1524218934'),(722,1709,1702,2.56,2,1,'1524219078'),(723,1709,1702,2.56,2,1,'1524219175'),(724,1709,1702,2.56,2,1,'1524219227'),(725,1709,1702,2.56,2,1,'1524219308'),(726,1709,1702,2.56,2,1,'1524219425'),(727,1709,1702,2.56,2,1,'1524219475'),(728,1709,1702,2.56,2,1,'1524219519'),(729,1709,1702,2.56,2,1,'1524219589'),(730,1709,1702,2.56,2,1,'1524219652'),(731,1709,1702,2.56,2,1,'1524219705'),(732,1709,1702,2.56,2,1,'1524220073'),(733,1709,1702,2.56,2,1,'1524220569'),(734,2102,1702,1.47,5,1,'1524225209'),(735,1693,1688,24.00,3,2,'1524230931'),(736,2530,1689,4.16,3,1,'1524233725'),(737,2530,1689,16.00,3,2,'1524235632'),(738,1690,1689,960.00,1,1,'1524240389'),(739,1690,1689,4800.00,1,2,'1524240467'),(740,1690,1689,1280.00,1,1,'1524240560'),(741,1690,1689,4800.00,1,2,'1524240645'),(742,1690,1689,320.00,1,1,'1524240703'),(743,1690,1689,1600.00,1,2,'1524240741'),(744,1736,1688,8.00,2,2,'1524265832'),(745,1709,1702,2.56,2,1,'1524274700'),(746,1773,1702,1.60,3,1,'1524284427'),(747,1773,1702,0.80,3,1,'1524284514'),(748,1773,1702,8.00,3,2,'1524284532'),(749,1765,1702,3.20,3,1,'1524284903'),(750,1765,1702,0.96,3,1,'1524284945'),(751,1765,1702,16.00,3,2,'1524284977'),(752,1766,1702,4.16,3,1,'1524285183'),(753,1766,1702,16.00,3,2,'1524285200'),(754,1771,1702,4.16,3,1,'1524285380'),(755,1771,1702,16.00,3,2,'1524285422'),(756,1709,1702,0.35,2,1,'1524286034'),(757,1709,1702,168.00,2,2,'1524286071'),(758,1709,1702,0.01,2,1,'1524286509'),(759,1709,1702,0.00,2,1,'1524286537'),(760,1709,1702,0.01,2,1,'1524286593'),(761,1709,1702,0.01,2,1,'1524286869'),(762,1709,1702,0.01,2,1,'1524286938'),(763,1709,1702,0.01,2,1,'1524286990'),(764,1709,1702,0.01,2,1,'1524287036'),(765,1709,1702,0.01,2,1,'1524287085'),(766,1709,1702,0.01,2,1,'1524287133'),(767,1709,1702,0.01,2,1,'1524287278'),(768,2161,1702,216.00,4,2,'1524288190'),(769,1777,1702,24.00,3,2,'1524292617'),(770,1709,1702,0.01,2,1,'1524298621'),(771,1730,1702,8.00,5,2,'1524299327'),(772,1712,1702,32.00,4,2,'1524299375'),(773,3036,1702,4.00,1,1,'1524309693'),(774,3036,1702,16.00,1,2,'1524309765'),(775,3037,1702,4.00,1,1,'1524311452'),(776,3035,1702,4.00,1,1,'1524311492'),(777,3038,1702,4.00,1,1,'1524311672'),(778,3036,1702,4.00,1,1,'1524311701'),(779,3037,1702,16.00,1,2,'1524311764'),(780,3038,1702,16.00,1,2,'1524311877'),(781,3035,1702,16.00,1,2,'1524311972'),(782,1705,1702,3.20,3,1,'1524315647'),(783,1705,1702,0.96,3,1,'1524315760'),(784,1717,1702,1.92,2,1,'1524315843'),(785,1705,1702,8.80,3,1,'1524315852'),(786,1717,1702,3.31,2,1,'1524315936'),(787,1717,1702,2.40,2,1,'1524316013'),(788,1705,1702,2.56,3,1,'1524316054'),(789,1717,1702,7.12,2,1,'1524316087'),(790,1705,1702,2.56,3,1,'1524316145'),(791,1705,1702,2.56,3,1,'1524316233'),(792,1691,1688,160.00,1,1,'1524316369'),(793,1712,1702,0.14,4,1,'1524316371'),(794,1691,1688,32.00,1,1,'1524316449'),(795,1705,1702,2.56,3,1,'1524316632'),(796,3034,1689,160.00,1,1,'1524316747'),(797,1705,1702,2.56,3,1,'1524316878'),(798,3034,1689,1.60,1,1,'1524316909'),(799,3039,1689,160.00,2,1,'1524317070'),(800,1712,1702,0.05,4,1,'1524317579'),(801,1703,1702,2.56,1,1,'1524317749'),(802,1703,1702,2.56,1,1,'1524317811'),(803,1703,1702,2.56,1,1,'1524317872'),(804,1703,1702,2.56,1,1,'1524317921'),(805,1703,1702,2.56,1,1,'1524317990'),(806,1703,1702,2.56,1,1,'1524318041'),(807,1791,1702,32.00,6,2,'1524323021'),(808,1848,1702,8.00,6,2,'1524323534'),(809,1846,1702,8.00,6,2,'1524323610'),(810,2517,1702,0.08,3,1,'1524324319'),(811,1799,1702,40.00,6,2,'1524326325'),(812,1773,1702,1.92,3,1,'1524326629'),(813,1709,1702,1.58,2,1,'1524326807'),(814,3034,1689,8.00,1,2,'1524328261'),(815,3034,1689,32.00,1,1,'1524329523'),(816,1692,1688,1600.00,2,1,'1524340733'),(817,1692,1688,6488.00,2,2,'1524340837'),(818,1731,1702,0.21,5,1,'1524349256'),(819,1730,1702,0.21,5,1,'1524349335'),(820,1712,1702,0.21,4,1,'1524349652'),(821,1730,1702,0.16,5,1,'1524349797'),(822,1731,1702,0.13,5,1,'1524349873'),(823,1741,1702,0.11,5,1,'1524349966'),(824,1712,1702,0.11,4,1,'1524350044'),(825,1731,1702,0.10,5,1,'1524350163'),(826,1741,1702,0.08,5,1,'1524350248'),(827,1730,1702,0.06,5,1,'1524350313'),(828,1712,1702,0.06,4,1,'1524350398'),(829,1741,1702,0.05,5,1,'1524350455'),(830,2141,1702,8.00,3,2,'1524350492'),(831,2091,1702,8.00,2,2,'1524354725'),(832,1742,1702,8.00,2,2,'1524355590'),(833,2517,1702,8.00,3,2,'1524355910'),(834,1879,1702,24.00,3,2,'1524356647'),(835,1767,1702,8.00,3,1,'1524357596'),(836,1745,1692,8.00,1,2,'1524359799'),(837,1740,1702,64.00,2,2,'1524360756'),(838,1791,1702,0.96,6,1,'1524362042'),(839,1818,1702,2.56,7,1,'1524362712'),(840,1706,1702,0.03,4,1,'1524363745'),(841,1773,1702,32.00,3,1,'1524363894'),(842,1706,1702,0.03,4,1,'1524363903'),(843,1773,1702,128.00,3,2,'1524364009'),(844,1703,1702,32.00,1,2,'1524364664'),(845,1791,1702,2.56,6,1,'1524364699'),(846,1693,1692,8.00,1,2,'1524364736'),(847,1693,1692,2.70,1,1,'1524364914'),(848,1693,1692,8.00,1,2,'1524364957'),(849,2094,1702,0.11,5,1,'1524364974'),(850,1791,1702,16.00,6,2,'1524365253'),(851,1822,1702,64.00,3,2,'1524366489'),(852,1824,1702,8.00,4,2,'1524368115'),(853,1811,1702,8.00,4,2,'1524371127'),(854,1718,1702,32.00,2,2,'1524371465'),(855,1701,1692,8.00,2,2,'1524378041'),(856,1705,1702,0.69,3,1,'1524378306'),(857,1705,1702,8.00,3,2,'1524378355'),(858,1842,1702,8.00,4,2,'1524378519'),(859,1852,1702,8.00,4,2,'1524378761'),(860,1842,1702,0.96,4,1,'1524379558'),(861,1842,1702,8.00,4,2,'1524379636'),(862,1819,1702,2.56,7,1,'1524381802'),(863,2143,1702,40.00,3,2,'1524382407'),(864,1819,1702,2.56,7,1,'1524382570'),(865,1853,1702,8.00,4,2,'1524382584'),(866,1819,1702,24.00,7,2,'1524382699'),(867,2192,1702,0.88,5,1,'1524382822'),(868,1818,1702,8.00,7,2,'1524383203'),(869,1796,1702,0.21,5,1,'1524383577'),(870,1777,1702,0.03,3,1,'1524386230'),(871,1709,1702,0.19,2,1,'1524387229'),(872,1709,1702,0.18,2,1,'1524387289'),(873,1709,1702,0.18,2,1,'1524387337'),(874,1709,1702,0.01,2,1,'1524387396'),(875,1709,1702,0.01,2,1,'1524387440'),(876,1709,1702,0.01,2,1,'1524387485'),(877,1709,1702,0.01,2,1,'1524387625'),(878,1709,1702,0.01,2,1,'1524387671'),(879,1709,1702,0.01,2,1,'1524387724'),(880,1709,1702,0.01,2,1,'1524387771'),(881,1709,1702,0.01,2,1,'1524387826'),(882,1709,1702,0.01,2,1,'1524387873'),(883,1709,1702,0.01,2,1,'1524387990'),(884,1709,1702,0.01,2,1,'1524388077'),(885,1709,1702,0.01,2,1,'1524388125'),(886,1709,1702,0.01,2,1,'1524388322'),(887,1709,1702,0.01,2,1,'1524388373'),(888,1709,1702,8.00,2,2,'1524389126'),(889,1877,1702,8.00,2,2,'1524391385'),(890,2150,1702,56.00,3,2,'1524391397'),(891,2152,1702,40.00,4,2,'1524391479'),(892,2154,1702,40.00,4,2,'1524391533'),(893,2158,1702,8.00,4,2,'1524391596'),(894,1757,1702,32.00,4,2,'1524393030'),(895,1774,1702,0.96,5,1,'1524393269'),(896,1848,1702,32.00,6,2,'1524393589'),(897,1855,1702,2.56,8,1,'1524398290'),(898,1855,1702,16.00,8,2,'1524399565'),(899,1774,1702,64.00,5,2,'1524411583'),(900,1709,1702,16.00,2,2,'1524413048'),(901,1773,1702,0.05,3,1,'1524413249'),(902,1773,1702,0.05,3,1,'1524413320'),(903,1773,1702,0.05,3,1,'1524413383'),(904,1773,1702,0.01,3,1,'1524413592'),(905,1773,1702,0.01,3,1,'1524413706'),(906,1773,1702,0.01,3,1,'1524413771'),(907,1818,1702,8.00,7,2,'1524425487'),(908,1712,1702,0.02,4,1,'1524434207'),(909,1712,1702,0.04,4,1,'1524434279'),(910,1730,1702,0.18,5,1,'1524434360'),(911,1731,1702,0.14,5,1,'1524434457'),(912,1712,1702,0.12,4,1,'1524434752'),(913,2094,1702,0.03,5,1,'1524434798'),(914,1730,1702,0.11,5,1,'1524434830'),(915,1731,1702,0.09,5,1,'1524434947'),(916,2094,1702,0.02,5,1,'1524434996'),(917,2094,1702,0.05,5,1,'1524435144'),(918,1703,1702,16.00,1,2,'1524435290'),(919,1693,1692,8.00,1,2,'1524435396'),(920,1693,1692,2.56,1,1,'1524437581'),(921,1693,1692,2.56,1,1,'1524437681'),(922,1693,1692,24.00,1,2,'1524437820'),(923,2192,1702,0.54,5,1,'1524438806'),(924,1736,1688,8.00,2,2,'1524439613'),(925,1745,1692,16.00,1,2,'1524443645'),(926,1797,1702,0.24,5,1,'1524445709'),(927,2125,1702,8.00,5,2,'1524450504'),(928,2192,1702,0.02,5,1,'1524450596'),(929,1777,1702,16.00,3,1,'1524450910'),(930,1748,1702,8.00,4,2,'1524451257'),(931,1701,1692,8.00,2,2,'1524451484'),(932,1705,1702,0.64,3,1,'1524451605'),(933,1705,1702,8.00,3,2,'1524451655'),(934,1740,1702,2.56,2,1,'1524451881'),(935,1740,1702,2.56,2,1,'1524451960'),(936,2147,1702,2.56,3,1,'1524454186'),(937,2192,1702,0.01,5,1,'1524457579'),(938,2192,1702,0.02,5,1,'1524457683'),(939,2192,1702,0.02,5,1,'1524457755'),(940,2192,1702,0.02,5,1,'1524457816'),(941,2192,1702,0.02,5,1,'1524457871'),(942,2192,1702,0.02,5,1,'1524457926'),(943,2192,1702,0.02,5,1,'1524457976'),(944,1740,1702,2.56,2,1,'1524458858'),(945,1717,1702,17.60,2,1,'1524461853'),(946,1717,1702,72.00,2,2,'1524461928'),(947,2192,1702,0.02,5,1,'1524462383'),(948,2192,1702,0.02,5,1,'1524462441'),(949,2192,1702,0.02,5,1,'1524462500'),(950,2192,1702,0.02,5,1,'1524462658'),(951,2192,1702,0.02,5,1,'1524462750'),(952,2192,1702,0.01,5,1,'1524462989'),(953,1773,1702,0.01,3,1,'1524476804'),(954,1773,1702,0.01,3,1,'1524477003'),(955,1773,1702,0.01,3,1,'1524477049'),(956,1773,1702,0.01,3,1,'1524477145'),(957,1773,1702,0.01,3,1,'1524477200'),(958,1773,1702,0.01,3,1,'1524477257'),(959,1773,1702,0.01,3,1,'1524477332'),(960,1773,1702,0.01,3,1,'1524477386'),(961,1773,1702,0.01,3,1,'1524477432'),(962,1773,1702,0.01,3,1,'1524477483'),(963,1773,1702,0.01,3,1,'1524477528'),(964,1773,1702,0.01,3,1,'1524477575'),(965,1773,1702,0.01,3,1,'1524477680'),(966,3056,1689,1600.00,1,1,'1524479818'),(967,3056,1689,6400.00,1,2,'1524480206'),(968,1781,1702,8.00,4,2,'1524480673'),(969,3053,1689,32.00,1,2,'1524483591'),(970,3053,1689,800.00,1,2,'1524483755'),(971,3053,1689,520.00,1,2,'1524483906'),(972,3044,1692,8.00,1,1,'1524485329'),(973,3045,1692,800.00,1,1,'1524485439'),(974,3046,1692,800.00,1,1,'1524485544'),(975,3047,1692,800.00,1,1,'1524485594'),(976,3044,1692,800.00,1,1,'1524485634'),(977,1740,1702,2.56,2,1,'1524487547'),(978,3042,1689,48.00,2,1,'1524490358'),(979,3040,1689,16.00,1,1,'1524490681'),(980,3040,1689,8.00,1,2,'1524491318'),(981,3040,1689,8.00,1,2,'1524494887'),(982,1705,1702,0.08,3,1,'1524494892'),(983,1705,1702,0.16,3,1,'1524495107'),(984,1705,1702,0.32,3,1,'1524495398'),(985,1717,1702,0.54,2,1,'1524495521'),(986,1717,1702,0.27,2,1,'1524495588'),(987,1717,1702,0.18,2,1,'1524495638'),(988,1717,1702,0.04,2,1,'1524495698'),(989,1702,1692,294.40,3,1,'1524496033'),(990,1721,1702,48.00,5,1,'1524496344'),(991,1718,1702,16.00,2,1,'1524497533'),(992,1706,1702,0.18,4,1,'1524497706'),(993,2095,1702,8.00,5,1,'1524498155'),(994,3053,1689,400.00,1,2,'1524498665'),(995,1740,1702,32.00,2,1,'1524498693'),(996,1853,1702,8.00,4,1,'1524498758'),(997,1799,1702,32.00,6,1,'1524499123'),(998,1693,1692,48.00,1,1,'1524499319'),(999,1712,1702,0.04,4,1,'1524499333'),(1000,3042,1689,56.00,2,2,'1524499386'),(1001,1705,1702,0.40,3,1,'1524499624'),(1002,1705,1702,3.74,3,1,'1524499764'),(1003,1705,1702,0.05,3,1,'1524500026'),(1004,1740,1702,32.00,2,1,'1524500072'),(1005,1705,1702,0.05,3,1,'1524500155'),(1006,2192,1702,0.01,5,1,'1524500292'),(1007,2192,1702,0.25,5,1,'1524500512'),(1008,2192,1702,0.06,5,1,'1524500608'),(1009,2192,1702,8.00,5,2,'1524500663'),(1010,2161,1702,0.01,4,1,'1524500894'),(1011,1705,1702,32.00,3,1,'1524501019'),(1012,2161,1702,0.01,4,1,'1524501065'),(1013,1730,1702,8.00,5,1,'1524501114'),(1014,2161,1702,0.01,4,1,'1524501141'),(1015,2161,1702,0.01,4,1,'1524501208'),(1016,2161,1702,0.01,4,1,'1524501270'),(1017,2161,1702,0.01,4,1,'1524501335'),(1018,1730,1702,0.04,5,1,'1524501366'),(1019,2161,1702,0.01,4,1,'1524501396'),(1020,2161,1702,0.01,4,1,'1524501507'),(1021,2161,1702,0.01,4,1,'1524501568'),(1022,2161,1702,0.01,4,1,'1524501642'),(1023,2161,1702,0.01,4,1,'1524501713'),(1024,2161,1702,0.01,4,1,'1524501771'),(1025,3053,1689,16.00,1,2,'1524509790'),(1026,3053,1689,8.00,1,2,'1524509809'),(1027,3060,1689,80.00,1,1,'1524533990'),(1028,1843,1702,8.00,4,2,'1524534428'),(1029,3060,1689,320.00,1,2,'1524534478'),(1030,1777,1702,0.96,3,1,'1524535283'),(1031,1729,1688,8.00,1,2,'1524537998'),(1032,1811,1702,8.00,4,1,'1524540826'),(1033,2147,1702,4.80,3,1,'1524541322'),(1034,1822,1702,0.98,3,1,'1524544269'),(1035,3034,1689,8.00,1,2,'1524547511');
/*!40000 ALTER TABLE `ysk_moneyils` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_news`
--

DROP TABLE IF EXISTS `ysk_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '文章图片',
  `sort` smallint(6) NOT NULL DEFAULT '0',
  `desc` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_out` tinyint(4) NOT NULL DEFAULT '0',
  `content` text NOT NULL COMMENT '内容',
  `from` varchar(255) NOT NULL DEFAULT '' COMMENT '文章来源',
  `visit` smallint(6) NOT NULL DEFAULT '0',
  `lang` tinyint(4) NOT NULL DEFAULT '0',
  `tuijian` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_news`
--

LOCK TABLES `ysk_news` WRITE;
/*!40000 ALTER TABLE `ysk_news` DISABLE KEYS */;
INSERT INTO `ysk_news` VALUES (100,'恭贺','',0,'',1531364351,0,'&lt;p align=&quot;center&quot;&gt;\r\n	Vpay公告\r\n&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	全球Vpay资产用户:大家好！自美国、新加坡、马来西亚、中国社区七月十二正式启动，陆续有台湾、香港、老挝等社区开始进入，为了保证前期平台平稳良性发展，望各玩家积极推动分享，其余事宜敬请关注后续公告。进一步推动财富新起点！谢谢！\r\n&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	Vpay马来西亚运营总部\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-indent:2em;&quot;&gt;\r\n	&lt;span&gt;&lt;/span&gt; \r\n&lt;/p&gt;','',0,0,0);
/*!40000 ALTER TABLE `ysk_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_notice`
--

DROP TABLE IF EXISTS `ysk_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_tittle` varchar(80) NOT NULL COMMENT '公告标题',
  `notice_content` varchar(600) NOT NULL COMMENT '公告详情',
  `notice_addtime` varchar(20) NOT NULL COMMENT '公告添加时间',
  `notice_read` text NOT NULL COMMENT '看过公告会员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_notice`
--

LOCK TABLES `ysk_notice` WRITE;
/*!40000 ALTER TABLE `ysk_notice` DISABLE KEYS */;
INSERT INTO `ysk_notice` VALUES (4,'4','商品价格绝不允许高于市场价!','1509373088',''),(5,'3','消费产品由商家赠送Lacpay积分宝!','1509373088',''),(6,'2','现金支付者免费赠送Lacpay资产钱包!','1509373088',''),(7,'1','本商城所有商品接受Lacpay支付!','1509373088','614013096,');
/*!40000 ALTER TABLE `ysk_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_nzbill`
--

DROP TABLE IF EXISTS `ysk_nzbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_nzbill` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '明细id',
  `bill_uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `bill_num` decimal(10,1) NOT NULL DEFAULT '0.0' COMMENT '财富币',
  `bill_reason` char(20) NOT NULL COMMENT '生成的原因',
  `bill_time` int(11) NOT NULL DEFAULT '0' COMMENT '生成时间',
  `bill_name` varchar(50) DEFAULT NULL,
  `bill_type` char(1) NOT NULL COMMENT '0-扣除 1-获得',
  `bill_username` varchar(20) DEFAULT NULL,
  `bill_account` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bill_id`) USING BTREE,
  KEY `bill_userid` (`bill_uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=295 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='转盘抽奖';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_nzbill`
--

LOCK TABLES `ysk_nzbill` WRITE;
/*!40000 ALTER TABLE `ysk_nzbill` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_nzbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_nzletter`
--

DROP TABLE IF EXISTS `ysk_nzletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_nzletter` (
  `letter_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '站内信id',
  `send_id` int(11) DEFAULT NULL COMMENT '发件人id',
  `recipient_id` int(11) DEFAULT NULL COMMENT '收件人id',
  `title` char(50) DEFAULT NULL COMMENT '信件标题',
  `content` text COMMENT '信件内容',
  `time` int(11) DEFAULT NULL COMMENT '时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未读，1已读',
  `img` varchar(225) NOT NULL,
  `reply` text NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `account` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`letter_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_nzletter`
--

LOCK TABLES `ysk_nzletter` WRITE;
/*!40000 ALTER TABLE `ysk_nzletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_nzletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_nzusfarm`
--

DROP TABLE IF EXISTS `ysk_nzusfarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_nzusfarm` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '农田id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `f_id` int(10) unsigned NOT NULL COMMENT '用户自己的农田ID号 1-15',
  `farm_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '农田类型id 1普通矿车 2银矿车 3-金矿车',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '显示图片 0地 1树 2果子3死亡',
  `seeds` decimal(13,2) NOT NULL COMMENT '本金',
  `fruits` decimal(13,2) NOT NULL COMMENT '果子数量',
  `income` decimal(13,2) NOT NULL DEFAULT '0.00' COMMENT '收益累计 本金的10配枯死',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `f_id` (`f_id`) USING BTREE,
  KEY `farm_type` (`farm_type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2149 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_nzusfarm`
--

LOCK TABLES `ysk_nzusfarm` WRITE;
/*!40000 ALTER TABLE `ysk_nzusfarm` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_nzusfarm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_opesfarms`
--

DROP TABLE IF EXISTS `ysk_opesfarms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_opesfarms` (
  `id` varchar(11) NOT NULL COMMENT '系统土地操作表',
  `farm_type` tinyint(1) NOT NULL COMMENT '1->鸡窝 2->果园 3->渔场',
  `from_uid` varchar(0) NOT NULL COMMENT '被操作id',
  `ope_uid` varchar(0) NOT NULL COMMENT '操作id',
  `ope_nums` decimal(11,3) NOT NULL COMMENT '操作数量',
  `ope_types` int(2) NOT NULL COMMENT '具体操作',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_opesfarms`
--

LOCK TABLES `ysk_opesfarms` WRITE;
/*!40000 ALTER TABLE `ysk_opesfarms` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_opesfarms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_opetypes`
--

DROP TABLE IF EXISTS `ysk_opetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_opetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '自己id',
  `fid` int(11) NOT NULL COMMENT '触发人id',
  `ope_nums` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '动作触发数量',
  `ope_date` date NOT NULL COMMENT '操作时间',
  `ope_type` int(2) NOT NULL COMMENT '操作类型:1开窝 2清扫 3收货 4清窝 5喂养 6挑粪 7获得风车 8获得管家 9获得专家 10购买一键挑粪 11冻结积分',
  `ope_farm` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1鸡窝 2果园 3渔场',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_opetypes`
--

LOCK TABLES `ysk_opetypes` WRITE;
/*!40000 ALTER TABLE `ysk_opetypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_opetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_opinions`
--

DROP TABLE IF EXISTS `ysk_opinions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_opinions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `contents` text NOT NULL,
  `plansimg` char(50) NOT NULL,
  `add_time` datetime NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '意见处理状态默认是0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_opinions`
--

LOCK TABLES `ysk_opinions` WRITE;
/*!40000 ALTER TABLE `ysk_opinions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_opinions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_order`
--

DROP TABLE IF EXISTS `ysk_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购买商品订单id',
  `order_no` varchar(225) NOT NULL COMMENT '订单号',
  `uid` int(11) NOT NULL COMMENT '购买者id',
  `total_yf` decimal(11,1) DEFAULT NULL COMMENT '总运费',
  `buy_price` decimal(11,2) DEFAULT NULL COMMENT '购买总价',
  `time` int(11) NOT NULL COMMENT '下单时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '订单状态 0未支付 1已支付 2已发货  3交易完成(已收货)',
  `buy_name` varchar(50) NOT NULL COMMENT '收货人',
  `buy_phone` char(12) NOT NULL COMMENT '收货人手机号码',
  `buy_address` varchar(255) NOT NULL COMMENT '收货地址',
  `pay_time` int(11) DEFAULT NULL COMMENT '付款时间',
  `pay_type` varchar(20) DEFAULT '' COMMENT '支付方式 1Vpay 2微信 3支付宝 4网银',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '0-删除 1-显示 只用于客户端',
  `pay_money` decimal(11,2) DEFAULT NULL COMMENT '实际支付金额',
  `kd_name` varchar(64) DEFAULT NULL COMMENT '快递公司',
  `kd_no` varchar(30) DEFAULT NULL COMMENT '快递订单号',
  `remark` varchar(225) DEFAULT NULL COMMENT '备注',
  `trade_no` varchar(50) DEFAULT NULL COMMENT '交易订单号',
  `kd_type` varchar(66) DEFAULT NULL COMMENT '快递类型',
  `xiaofei_jifen` decimal(11,0) DEFAULT '0' COMMENT '消费积分积分总共可使用',
  `jifen_yu` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '渔场积分',
  `jifen_ji` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '总共可赠送鸡场积分',
  `jifen_guoyuan` decimal(11,0) DEFAULT '0' COMMENT '果园积分',
  `sanji_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '订单所有可三级分销的钱',
  `is_duobao` tinyint(1) DEFAULT '1' COMMENT '1->普通订单,2->夺宝订单',
  `seluid` int(11) DEFAULT '0' COMMENT '竞标选中uid',
  `order_proof` varchar(164) DEFAULT NULL COMMENT '收款凭证',
  `order_sellerid` int(11) NOT NULL DEFAULT '0' COMMENT '商家UID',
  `order_relation` varchar(255) DEFAULT NULL COMMENT '关联订单',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=434 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购买商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_order`
--

LOCK TABLES `ysk_order` WRITE;
/*!40000 ALTER TABLE `ysk_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_order_detail`
--

DROP TABLE IF EXISTS `ysk_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `com_id` int(11) NOT NULL COMMENT '商品ID',
  `com_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '商品名称',
  `com_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '购买产品价格',
  `com_num` int(11) NOT NULL COMMENT '产品数量',
  `com_img` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `com_cs` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品参数',
  `is_comment` tinyint(1) DEFAULT '0' COMMENT '是否已评论 0-未评论 1-已评论',
  `com_shoptype` int(15) DEFAULT NULL COMMENT '商品所属',
  `size` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品尺寸',
  `color` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品颜色',
  `xiaofei_jifen` decimal(50,0) NOT NULL DEFAULT '0' COMMENT '可使用消费积分',
  `jifen_nums` decimal(11,0) DEFAULT '0' COMMENT '赠送数量(渔场鸡场果园)',
  `jifen_types` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '1-鸡场积分,2-果园积分,3-渔场积分',
  `buy_num` int(11) NOT NULL DEFAULT '0' COMMENT '购买次数',
  `sanji_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品可参与三级分销的钱',
  `shangjia` int(11) NOT NULL COMMENT '商家id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `jiesuan_price` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '结算价',
  `express_order` decimal(20,0) DEFAULT NULL COMMENT '发货订单号',
  `express_name` varchar(80) CHARACTER SET utf8 DEFAULT NULL COMMENT '快递公司名称',
  `goods_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1->未付款,2->以付款,3->以发货,4-以签收',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=323 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_order_detail`
--

LOCK TABLES `ysk_order_detail` WRITE;
/*!40000 ALTER TABLE `ysk_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_platforms`
--

DROP TABLE IF EXISTS `ysk_platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_platforms` (
  `id` int(11) NOT NULL COMMENT '平台每天所有积分总和',
  `count_time` date NOT NULL COMMENT '计算时间',
  `platform_nums` decimal(20,2) NOT NULL COMMENT '平台每天所有积分总和(鸡场)',
  `chaifenbili_all` float(11,5) NOT NULL DEFAULT '0.00000' COMMENT '平台基础拆分率（鸡场）',
  `platform_yuchangnums` decimal(20,5) NOT NULL DEFAULT '0.00000' COMMENT '渔场建窝总积分',
  `yuchangchaifenbili_all` float(11,5) NOT NULL DEFAULT '0.00000' COMMENT '渔场基础拆分率',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_platforms`
--

LOCK TABLES `ysk_platforms` WRITE;
/*!40000 ALTER TABLE `ysk_platforms` DISABLE KEYS */;
INSERT INTO `ysk_platforms` VALUES (1,'2017-11-04',8467578.24,0.00044,575120.00000,0.00000);
/*!40000 ALTER TABLE `ysk_platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_preventip`
--

DROP TABLE IF EXISTS `ysk_preventip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_preventip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `time` varchar(30) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5875 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_preventip`
--

LOCK TABLES `ysk_preventip` WRITE;
/*!40000 ALTER TABLE `ysk_preventip` DISABLE KEYS */;
INSERT INTO `ysk_preventip` VALUES (5786,'123.149.113.226','1530240656'),(5787,'115.199.251.73','1530359733'),(5788,'123.52.72.162','1530499110'),(5789,'1.192.82.124','1530599353'),(5790,'117.136.100.114','1530839156'),(5791,'123.52.75.168','1531127483'),(5792,'58.22.114.64','1531139367'),(5793,'223.104.6.5','1531486479'),(5794,'58.22.113.126','1531149367'),(5795,'223.104.6.60','1531477872'),(5796,'223.104.6.17','1531479709'),(5797,'112.5.202.158','1531276899'),(5798,'223.104.6.49','1531553172'),(5799,'112.5.202.85','1531409893'),(5800,'117.30.152.200','1531391099'),(5801,'140.243.160.248','1531404293'),(5802,'140.243.25.175','1531457911'),(5803,'223.104.6.63','1531550903'),(5804,'207.244.149.5','1531458754'),(5805,'117.30.145.17','1531472821'),(5806,'112.5.202.21','1531465429'),(5807,'223.104.6.10','1531586923'),(5808,'202.109.239.122','1531473431'),(5809,'58.23.19.145','1531657710'),(5810,'140.243.224.65','1531473507'),(5811,'211.97.128.252','1531473867'),(5812,'140.243.228.166','1531474965'),(5813,'140.243.184.164','1531480197'),(5814,'117.30.147.255','1531477898'),(5815,'140.243.226.151','1531478250'),(5816,'110.87.15.103','1531638977'),(5817,'223.104.6.55','1531478549'),(5818,'223.104.6.61','1531649253'),(5819,'223.104.6.2','1531479149'),(5820,'140.243.101.206','1531480085'),(5821,'183.251.22.61','1531575215'),(5822,'223.167.142.60','1531481363'),(5823,'211.97.131.21','1531481760'),(5824,'106.122.5.93','1531481868'),(5825,'211.97.128.134','1531482497'),(5826,'117.30.139.133','1531485666'),(5827,'117.136.11.1','1531485673'),(5828,'117.30.146.153','1531486840'),(5829,'58.23.232.58','1531499420'),(5830,'183.253.7.125','1531523620'),(5831,'211.97.128.87','1531544047'),(5832,'182.106.221.198','1531534547'),(5833,'117.30.141.85','1531534656'),(5834,'140.243.218.60','1531543023'),(5835,'223.104.6.38','1531543736'),(5836,'223.104.6.14','1531551568'),(5837,'211.97.130.125','1531553302'),(5838,'117.30.147.172','1531554505'),(5839,'211.97.130.239','1531557106'),(5840,'117.136.38.128','1531557413'),(5841,'211.97.130.33','1531557809'),(5842,'223.104.6.4','1531557894'),(5843,'211.97.130.160','1531559998'),(5844,'223.104.6.40','1531560119'),(5845,'117.30.147.28','1531561327'),(5846,'106.122.4.220','1531565305'),(5847,'140.243.137.135','1531565452'),(5848,'140.243.231.88','1531571111'),(5849,'111.128.184.77','1531582161'),(5850,'112.5.202.133','1531586355'),(5851,'112.40.90.165','1531621521'),(5852,'223.104.6.11','1531631693'),(5853,'223.104.6.54','1531625442'),(5854,'211.97.129.134','1531628479'),(5855,'140.243.166.152','1531629331'),(5856,'223.104.6.27','1531631954'),(5857,'110.87.114.31','1531633475'),(5858,'140.243.59.50','1531649388'),(5859,'140.243.188.14','1531634069'),(5860,'59.60.94.120','1531634801'),(5861,'211.97.128.131','1531635270'),(5862,'223.104.6.19','1531637992'),(5863,'27.152.74.89','1531639330'),(5864,'27.154.132.92','1531640156'),(5865,'223.104.6.57','1531643077'),(5866,'117.136.11.174','1531647386'),(5867,'223.104.169.254','1531648376'),(5868,'223.104.6.15','1531662265'),(5869,'223.104.6.1','1531652560'),(5870,'183.253.38.223','1531665235'),(5871,'117.136.64.110','1531660119'),(5872,'183.149.74.95','1531661276'),(5873,'211.97.129.156','1531661030'),(5874,'223.104.6.24','1531664935');
/*!40000 ALTER TABLE `ysk_preventip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_product_cate`
--

DROP TABLE IF EXISTS `ysk_product_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_product_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `tag` varchar(120) DEFAULT NULL COMMENT '标签',
  `pic` varchar(124) NOT NULL COMMENT '分类图片',
  `is_tui` tinyint(2) DEFAULT '0' COMMENT '是否推荐(0否 1是)',
  `is_hot` tinyint(2) DEFAULT '0' COMMENT '是否热门(0 否 1是)',
  `sort` tinyint(5) DEFAULT '0' COMMENT '商品排序',
  `pic1` varchar(255) DEFAULT NULL COMMENT '轮播图1',
  `pic2` varchar(255) DEFAULT NULL COMMENT '轮播图2',
  `pic3` varchar(255) DEFAULT NULL COMMENT '轮播图3',
  `pic4` varchar(255) DEFAULT NULL COMMENT '轮播图4',
  `pic5` varchar(255) DEFAULT NULL COMMENT '轮播图5',
  `ctime` varchar(11) DEFAULT NULL COMMENT '添加时间',
  `is_activity` tinyint(2) DEFAULT '0' COMMENT '是否活动0否1是',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态',
  `is_duobao` tinyint(1) NOT NULL DEFAULT '1' COMMENT '2一元夺宝分类',
  `type` int(2) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_product_cate`
--

LOCK TABLES `ysk_product_cate` WRITE;
/*!40000 ALTER TABLE `ysk_product_cate` DISABLE KEYS */;
INSERT INTO `ysk_product_cate` VALUES (5,0,'服饰','test','/Uploads/image/touxiang/2017-12-27/5a43124b316c1.png',0,0,0,NULL,NULL,NULL,NULL,NULL,'1508125176',0,NULL,1,1),(8,0,'餐饮','test','/Uploads/image/touxiang/2017-12-27/5a43126bd052b.png',0,0,0,NULL,NULL,NULL,NULL,NULL,'1508125567',0,NULL,1,2),(15,0,'酒店','test','/Uploads/image/touxiang/2017-12-27/5a43128769fdb.png',0,0,0,NULL,NULL,NULL,NULL,NULL,'1508513711',0,NULL,1,3),(16,0,'旅游','test','/Uploads/image/touxiang/2017-12-27/5a4312a06ba97.png',0,0,0,NULL,NULL,NULL,NULL,NULL,'1508513760',0,NULL,1,4),(22,0,'科技','test','/Uploads/image/touxiang/2017-12-27/5a4312b7ba490.png',0,0,0,NULL,NULL,NULL,NULL,NULL,'1508515392',0,NULL,1,5),(23,0,'养生','test','/Uploads/image/touxiang/2017-12-27/5a4312d6381f6.png',0,0,0,NULL,NULL,NULL,NULL,NULL,'1508515569',0,NULL,1,6),(24,0,'美容','test','/Uploads/image/touxiang/2017-12-27/5a4312e50c2f0.png',0,0,0,NULL,NULL,NULL,NULL,NULL,'1508515811',0,NULL,1,7),(25,0,'特产','test','/Uploads/image/touxiang/2017-12-27/5a4312f3c526a.png',0,0,0,NULL,NULL,NULL,NULL,NULL,'1508516000',0,NULL,1,8),(35,0,'生鲜',NULL,'/Uploads/image/touxiang/2017-12-27/5a43131342991.png',0,0,0,NULL,NULL,NULL,NULL,NULL,'1510280398',0,NULL,1,9),(36,0,'其它',NULL,'/Uploads/image/touxiang/2017-12-27/5a431328ed687.png',0,0,0,NULL,NULL,NULL,NULL,NULL,'1510280422',0,NULL,1,10);
/*!40000 ALTER TABLE `ysk_product_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_product_detail`
--

DROP TABLE IF EXISTS `ysk_product_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_product_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `type_id` int(11) DEFAULT NULL COMMENT '类型ID',
  `name` varchar(120) NOT NULL COMMENT '商品名',
  `s_desc` text COMMENT '商品描述',
  `price` decimal(8,0) NOT NULL COMMENT '现价',
  `old_price` decimal(8,2) DEFAULT NULL COMMENT '原价',
  `buy_num` int(11) DEFAULT '0' COMMENT '付款人数',
  `pic` varchar(160) NOT NULL COMMENT '商品封面图',
  `pic1` varchar(160) DEFAULT NULL COMMENT '轮播图1',
  `pic2` varchar(160) DEFAULT NULL COMMENT '轮播图2',
  `pic3` varchar(160) DEFAULT NULL COMMENT '轮播图3',
  `pic4` varchar(160) DEFAULT NULL COMMENT '轮播图4',
  `pic5` varchar(160) DEFAULT NULL COMMENT '轮播图5',
  `freight` decimal(8,2) DEFAULT '0.00' COMMENT '运费',
  `address` varchar(50) DEFAULT NULL COMMENT '发货地址',
  `ctime` int(11) DEFAULT NULL COMMENT '添加时间',
  `is_sort` tinyint(5) DEFAULT '0' COMMENT '排序',
  `is_hot` tinyint(2) DEFAULT '1' COMMENT '是否热门',
  `color_cate` varchar(250) DEFAULT NULL COMMENT '颜色',
  `csize` varchar(250) DEFAULT NULL COMMENT '尺码',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `praise_num` int(11) DEFAULT '0' COMMENT '点赞人数',
  `content` text COMMENT '商品详情',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否启用0否1是',
  `jifen_nums` decimal(11,0) NOT NULL DEFAULT '0' COMMENT '积分数量',
  `jifen_type` varchar(25) DEFAULT NULL COMMENT '积分类型1:鸡场积分 2:果园积分 3:渔场积分',
  `xiaofei_bili` int(9) DEFAULT '10' COMMENT '消费积分使用比例',
  `is_duobao` tinyint(1) DEFAULT '1' COMMENT '1->普通商品,2->一元夺宝',
  `kaijiang_nums` int(11) DEFAULT '0' COMMENT '达到多少数量开奖',
  `sanji_use` int(8) DEFAULT '1' COMMENT '三级使用比例',
  `shangjia` int(11) NOT NULL DEFAULT '0' COMMENT '上传用户id默认为0',
  `seluid` int(11) DEFAULT NULL COMMENT '竞标选中uid',
  `count_price` decimal(11,2) DEFAULT '0.00' COMMENT '结算价格',
  `producs_pingjia` text COMMENT '商品评价',
  `gr_hot` int(1) NOT NULL DEFAULT '0' COMMENT '个人店铺-1-火热0-普通',
  `gr_new` int(1) NOT NULL DEFAULT '0' COMMENT '个人店铺-1-最新0-普通',
  `gr_tuijian` int(1) NOT NULL DEFAULT '0' COMMENT '个人店铺-1-推荐0-普通',
  `is_new` int(1) NOT NULL DEFAULT '1' COMMENT '是否最新',
  `is_tuijian` int(1) NOT NULL DEFAULT '1' COMMENT '是否推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_product_detail`
--

LOCK TABLES `ysk_product_detail` WRITE;
/*!40000 ALTER TABLE `ysk_product_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_product_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_proxy`
--

DROP TABLE IF EXISTS `ysk_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_proxy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `province` int(11) NOT NULL COMMENT '省份',
  `city` int(11) NOT NULL COMMENT '城市',
  `time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_proxy`
--

LOCK TABLES `ysk_proxy` WRITE;
/*!40000 ALTER TABLE `ysk_proxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_qingsaonums`
--

DROP TABLE IF EXISTS `ysk_qingsaonums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_qingsaonums` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '受益期间内清扫次数',
  `farm_types` tinyint(1) NOT NULL COMMENT '农场类型',
  `day_nums` int(11) NOT NULL DEFAULT '0' COMMENT '收益天数',
  `land_id` int(11) NOT NULL COMMENT '操作土地对应id',
  `qingsao_date` date NOT NULL COMMENT '到期时间',
  `qingsao_uid` int(11) NOT NULL COMMENT '会员id',
  `qingsao_times` date NOT NULL COMMENT '清扫时间',
  `is_select` date NOT NULL COMMENT '1未查询过,2->已经查询过',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `land_id` (`land_id`) USING BTREE,
  KEY `qingsao_uid` (`qingsao_uid`) USING BTREE,
  KEY `farm_types` (`farm_types`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_qingsaonums`
--

LOCK TABLES `ysk_qingsaonums` WRITE;
/*!40000 ALTER TABLE `ysk_qingsaonums` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_qingsaonums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_qingsaorecord`
--

DROP TABLE IF EXISTS `ysk_qingsaorecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_qingsaorecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '清扫记录详情表',
  `uid` int(11) NOT NULL COMMENT '清扫会员id',
  `qingsao_time` date NOT NULL COMMENT '清扫时间',
  `qingsao_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '清扫哪个农场的',
  `qingsao_id` int(11) NOT NULL COMMENT '清扫地对应的id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `qingsao_id` (`qingsao_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_qingsaorecord`
--

LOCK TABLES `ysk_qingsaorecord` WRITE;
/*!40000 ALTER TABLE `ysk_qingsaorecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_qingsaorecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_sanjione`
--

DROP TABLE IF EXISTS `ysk_sanjione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_sanjione` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '三级分销',
  `first` float(8,2) NOT NULL COMMENT '一级比例',
  `second` float(8,2) NOT NULL COMMENT '二级比例',
  `third` float(8,2) NOT NULL COMMENT '三级比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_sanjione`
--

LOCK TABLES `ysk_sanjione` WRITE;
/*!40000 ALTER TABLE `ysk_sanjione` DISABLE KEYS */;
INSERT INTO `ysk_sanjione` VALUES (1,0.30,0.20,0.10);
/*!40000 ALTER TABLE `ysk_sanjione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_sanjithree`
--

DROP TABLE IF EXISTS `ysk_sanjithree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_sanjithree` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '三级分销',
  `first` float(8,2) NOT NULL COMMENT '一级比例',
  `second` float(8,2) NOT NULL COMMENT '二级比例',
  `third` float(8,2) NOT NULL COMMENT '三级比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_sanjithree`
--

LOCK TABLES `ysk_sanjithree` WRITE;
/*!40000 ALTER TABLE `ysk_sanjithree` DISABLE KEYS */;
INSERT INTO `ysk_sanjithree` VALUES (1,0.30,0.20,0.10);
/*!40000 ALTER TABLE `ysk_sanjithree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_sanjitwo`
--

DROP TABLE IF EXISTS `ysk_sanjitwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_sanjitwo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '三级分销',
  `first` float(8,2) NOT NULL COMMENT '一级比例',
  `second` float(8,2) NOT NULL COMMENT '二级比例',
  `third` float(8,2) NOT NULL COMMENT '三级比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_sanjitwo`
--

LOCK TABLES `ysk_sanjitwo` WRITE;
/*!40000 ALTER TABLE `ysk_sanjitwo` DISABLE KEYS */;
INSERT INTO `ysk_sanjitwo` VALUES (1,0.30,0.20,0.12);
/*!40000 ALTER TABLE `ysk_sanjitwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_seed_to_fruit`
--

DROP TABLE IF EXISTS `ysk_seed_to_fruit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_seed_to_fruit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(11) NOT NULL COMMENT '总种子数量',
  `fee` decimal(14,2) NOT NULL COMMENT '手续费',
  `create_time` int(11) NOT NULL,
  `fruit` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '扣除手续费后的数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_seed_to_fruit`
--

LOCK TABLES `ysk_seed_to_fruit` WRITE;
/*!40000 ALTER TABLE `ysk_seed_to_fruit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_seed_to_fruit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_shifeijl`
--

DROP TABLE IF EXISTS `ysk_shifeijl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_shifeijl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '施肥表id ',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `shifei_num` decimal(13,2) NOT NULL COMMENT '施肥数量',
  `farm_id` int(11) NOT NULL COMMENT '农田id',
  `tudi_type` tinyint(4) NOT NULL COMMENT '土地类型:1黄土地，2红土地，3黑土地',
  `shifei_time` int(11) NOT NULL COMMENT '施肥时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=458 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_shifeijl`
--

LOCK TABLES `ysk_shifeijl` WRITE;
/*!40000 ALTER TABLE `ysk_shifeijl` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_shifeijl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_shop_banner`
--

DROP TABLE IF EXISTS `ysk_shop_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_shop_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '轮播图ID',
  `name` varchar(126) DEFAULT NULL COMMENT '轮播图名称',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `ctime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `s_sort` tinyint(5) DEFAULT '0' COMMENT '排序',
  `s_desc` varchar(120) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_shop_banner`
--

LOCK TABLES `ysk_shop_banner` WRITE;
/*!40000 ALTER TABLE `ysk_shop_banner` DISABLE KEYS */;
INSERT INTO `ysk_shop_banner` VALUES (1,'夏装新时尚','/Themes/Shop/Public/images/banner.jpg','#','1506350099',0,'描述'),(2,'夏装新时尚','/Themes/Shop/Public/images/banner.jpg','#','1506350099',0,'描述'),(3,'夏装新时尚','/Themes/Shop/Public/images/banner.jpg','#','1506350099',0,'描述'),(4,'夏装新时尚','/Themes/Shop/Public/images/banner.jpg','#','1506350099',0,'描述'),(5,'夏装新时尚','/Themes/Shop/Public/images/banner.jpg','#','1506350099',0,'描述');
/*!40000 ALTER TABLE `ysk_shop_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_shouge`
--

DROP TABLE IF EXISTS `ysk_shouge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_shouge` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收割表id主键',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `farm_id` int(11) NOT NULL COMMENT '农田id',
  `farm_type` tinyint(4) NOT NULL COMMENT '农田类型：1黄土地 2.红土地 3黑土地',
  `shouge_num` decimal(13,2) NOT NULL COMMENT '收割数量',
  `shouge_time` int(11) NOT NULL COMMENT '收割时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=688 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_shouge`
--

LOCK TABLES `ysk_shouge` WRITE;
/*!40000 ALTER TABLE `ysk_shouge` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_shouge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_sow`
--

DROP TABLE IF EXISTS `ysk_sow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_sow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '播种记录表id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `farm_id` tinyint(4) NOT NULL COMMENT '农田id',
  `sow_num` int(11) NOT NULL COMMENT '播种数量',
  `farm_type` tinyint(4) NOT NULL COMMENT '土地类型：1.黄土地 2.红土地 3.黑土地',
  `sow_type` varchar(15) NOT NULL COMMENT '播种类型',
  `sow_time` int(11) NOT NULL COMMENT '播种时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '播种状态  0隐藏 1显示',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=560 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_sow`
--

LOCK TABLES `ysk_sow` WRITE;
/*!40000 ALTER TABLE `ysk_sow` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_sow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_steal_detail`
--

DROP TABLE IF EXISTS `ysk_steal_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_steal_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '种子奖励表id  ',
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `num` char(20) NOT NULL COMMENT '推荐人id',
  `fid` int(11) NOT NULL COMMENT '种子数量',
  `create_time` int(11) NOT NULL COMMENT '奖励时间',
  `type_name` varchar(20) NOT NULL COMMENT '状态',
  `username` varchar(20) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `datestr` varchar(20) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0-取偷 1-被偷',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=928 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_steal_detail`
--

LOCK TABLES `ysk_steal_detail` WRITE;
/*!40000 ALTER TABLE `ysk_steal_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_steal_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_store`
--

DROP TABLE IF EXISTS `ysk_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_store` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `cangku_num` decimal(13,5) NOT NULL DEFAULT '0.00000' COMMENT '钱包余额',
  `fengmi_num` decimal(13,5) NOT NULL DEFAULT '0.00000' COMMENT '积分',
  `plant_num` decimal(13,4) NOT NULL DEFAULT '0.0000' COMMENT '播种总数',
  `huafei_total` decimal(13,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '施肥累计',
  `vip_grade` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_store`
--

LOCK TABLES `ysk_store` WRITE;
/*!40000 ALTER TABLE `ysk_store` DISABLE KEYS */;
INSERT INTO `ysk_store` VALUES (8604,7.37542,617.62458,0.0000,0.00,0),(8603,9.32012,615.67988,0.0000,0.00,0),(8602,6.95953,618.04047,0.0000,0.00,0),(8601,6.96947,618.03053,0.0000,0.00,0),(8600,33.28373,4926.71627,0.0000,0.00,0),(8599,92074.72032,1008175.27968,0.0000,0.00,0),(8569,0.00000,0.00000,0.0000,0.00,0),(8605,6.13291,618.86709,0.0000,0.00,0),(8606,7.37542,617.62458,0.0000,0.00,0),(8607,7.37542,617.62458,0.0000,0.00,0),(8608,7.37542,617.62458,0.0000,0.00,0),(8609,7.37542,617.62458,0.0000,0.00,0),(8610,7.37542,617.62458,0.0000,0.00,0),(8611,7.37542,617.62458,0.0000,0.00,0),(8612,3.74250,621.25750,0.0000,0.00,0),(8613,6.57862,618.42138,0.0000,0.00,0),(8614,5.33611,619.66389,0.0000,0.00,0),(8615,5.38581,619.61419,0.0000,0.00,0),(8616,85.89465,1529.10535,0.0000,0.00,0),(8617,5.78181,619.21819,0.0000,0.00,0),(8618,4003.98821,1620.81179,0.0000,0.00,0),(8619,0.00000,0.00000,0.0000,0.00,0),(8620,0.00000,0.00000,0.0000,0.00,0),(8621,86788.70016,20956.29984,0.0000,0.00,0),(8622,0.05000,624.95000,0.0000,0.00,0),(8623,0.05000,624.95000,0.0000,0.00,0),(8624,95008.00000,3992.00000,0.0000,0.00,0),(8625,0.00000,0.00000,0.0000,0.00,0),(8626,0.05000,624.95000,0.0000,0.00,0),(8627,0.05000,624.95000,0.0000,0.00,0),(8628,29.73130,595.26870,0.0000,0.00,0),(8629,32.93210,5592.06790,0.0000,0.00,0),(8630,0.80118,0.19882,0.0000,0.00,0),(8631,10.39920,4989.60080,0.0000,0.00,0),(8632,37.13844,37462.86156,0.0000,0.00,0),(8633,295.86400,49704.13600,0.0000,0.00,0),(8634,3.99200,50496.00800,0.0000,0.00,0),(8635,3.99200,50496.00800,0.0000,0.00,0),(8636,0.00000,0.00000,0.0000,0.00,0),(8637,0.00000,0.00000,0.0000,0.00,0),(8638,1008.79840,3991.20160,0.0000,0.00,0),(8639,4.00000,49996.00000,0.0000,0.00,0),(8640,103.99200,49896.00800,0.0000,0.00,0),(8641,295.86400,49704.13600,0.0000,0.00,0),(8642,167.99200,49832.00800,0.0000,0.00,0),(8643,359.99200,49640.00800,0.0000,0.00,0),(8644,103.99200,49896.00800,0.0000,0.00,0),(8645,62.63711,637.36289,0.0000,0.00,0),(8646,3.99200,50496.00800,0.0000,0.00,0),(8647,3.99200,50496.00800,0.0000,0.00,0),(8648,3.99200,100496.00800,0.0000,0.00,0),(8649,103.99200,49896.00800,0.0000,0.00,0),(8650,4.00000,49996.00000,0.0000,0.00,0),(8651,7.99200,49992.00800,0.0000,0.00,0),(8652,8000.00000,2000.00000,0.0000,0.00,0),(8653,0.00000,0.00000,0.0000,0.00,0),(8654,103.99200,49896.00800,0.0000,0.00,0),(8655,3.99200,50496.00800,0.0000,0.00,0),(8656,8000.00000,2000.00000,0.0000,0.00,0),(8657,3.99200,50496.00800,0.0000,0.00,0),(8658,3.99200,50496.00800,0.0000,0.00,0),(8659,4.00000,49996.00000,0.0000,0.00,0),(8660,299.60000,50900.40000,0.0000,0.00,0),(8661,0.00000,0.00000,0.0000,0.00,0),(8662,1.29990,623.70010,0.0000,0.00,0),(8663,0.00000,0.00000,0.0000,0.00,0),(8664,0.00000,0.00000,0.0000,0.00,0),(8665,0.00000,0.00000,0.0000,0.00,0),(8666,0.00000,0.00000,0.0000,0.00,0),(8667,0.00000,0.00000,0.0000,0.00,0),(8668,1.25000,623.75000,0.0000,0.00,0),(8669,100.00000,25.00000,0.0000,0.00,0),(8670,7.99200,49992.00800,0.0000,0.00,0),(8671,0.00000,0.00000,0.0000,0.00,0),(8672,0.00000,0.00000,0.0000,0.00,0),(8673,0.00000,0.00000,0.0000,0.00,0),(8674,0.00000,0.00000,0.0000,0.00,0),(8675,0.00000,0.00000,0.0000,0.00,0),(8676,0.00000,0.00000,0.0000,0.00,0),(8677,0.00000,0.00000,0.0000,0.00,0),(8678,0.00000,0.00000,0.0000,0.00,0),(8679,4.00000,49996.00000,0.0000,0.00,0),(8680,61.35983,638.64017,0.0000,0.00,0),(8681,0.00000,0.00000,0.0000,0.00,0),(8682,0.00000,0.00000,0.0000,0.00,0),(8683,0.00000,0.00000,0.0000,0.00,0),(8684,0.00000,0.00000,0.0000,0.00,0),(8685,0.00000,0.00000,0.0000,0.00,0),(8686,0.00000,0.00000,0.0000,0.00,0),(8687,0.00000,0.00000,0.0000,0.00,0),(8688,0.00000,0.00000,0.0000,0.00,0),(8689,4.00000,49996.00000,0.0000,0.00,0),(8690,0.00000,0.00000,0.0000,0.00,0),(8691,0.00000,0.00000,0.0000,0.00,0),(8692,0.00000,0.00000,0.0000,0.00,0),(8693,175.40000,3299.60000,0.0000,0.00,0),(8694,0.00000,0.00000,0.0000,0.00,0),(8695,0.00000,0.00000,0.0000,0.00,0),(8696,0.00000,0.00000,0.0000,0.00,0),(8697,0.00000,0.00000,0.0000,0.00,0),(8698,0.00000,0.00000,0.0000,0.00,0),(8699,0.00000,0.00000,0.0000,0.00,0),(8700,0.05000,624.95000,0.0000,0.00,0),(8701,0.00000,0.00000,0.0000,0.00,0),(8702,0.00000,0.00000,0.0000,0.00,0),(8703,0.00000,0.00000,0.0000,0.00,0),(8704,0.00000,0.00000,0.0000,0.00,0),(8705,0.00000,0.00000,0.0000,0.00,0),(8706,0.00000,0.00000,0.0000,0.00,0),(8707,0.00000,0.00000,0.0000,0.00,0),(8708,0.00000,0.00000,0.0000,0.00,0),(8709,0.00000,0.00000,0.0000,0.00,0),(8710,0.00000,0.00000,0.0000,0.00,0),(8711,0.00000,0.00000,0.0000,0.00,0),(8712,0.00000,0.00000,0.0000,0.00,0),(8713,0.00000,0.00000,0.0000,0.00,0),(8714,0.00000,0.00000,0.0000,0.00,0),(8715,0.00000,0.00000,0.0000,0.00,0),(8716,0.00000,0.00000,0.0000,0.00,0),(8717,0.00000,0.00000,0.0000,0.00,0),(8718,0.00000,0.00000,0.0000,0.00,0),(8719,0.00000,0.00000,0.0000,0.00,0),(8720,0.00000,0.00000,0.0000,0.00,0),(8721,0.00000,0.00000,0.0000,0.00,0),(8722,0.00000,0.00000,0.0000,0.00,0),(8723,0.00000,0.00000,0.0000,0.00,0),(8724,0.00000,0.00000,0.0000,0.00,0),(8725,0.00000,0.00000,0.0000,0.00,0);
/*!40000 ALTER TABLE `ysk_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_tcp_config`
--

DROP TABLE IF EXISTS `ysk_tcp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_tcp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '挑粪/采蜜/扑鱼设置表',
  `farm_type` tinyint(1) NOT NULL COMMENT '1->鸡窝挑粪设置,2->渔场扑鱼设置,3->果园好友',
  `dai_dets` int(2) NOT NULL COMMENT '对应第几代',
  `earns_bili` float(10,2) NOT NULL COMMENT '可拿收益比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_tcp_config`
--

LOCK TABLES `ysk_tcp_config` WRITE;
/*!40000 ALTER TABLE `ysk_tcp_config` DISABLE KEYS */;
INSERT INTO `ysk_tcp_config` VALUES (1,1,1,0.07),(2,1,2,0.05),(3,1,3,0.03),(4,3,3,0.05),(5,3,4,0.03);
/*!40000 ALTER TABLE `ysk_tcp_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_tiaofen`
--

DROP TABLE IF EXISTS `ysk_tiaofen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_tiaofen` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '挑粪/采蜜/捕鱼',
  `type` tinyint(1) NOT NULL COMMENT '1 挑粪 2采蜜 3 捕鱼',
  `tf_date` datetime NOT NULL COMMENT '挑粪时间',
  `tf_id` int(11) NOT NULL COMMENT '从谁身上获取的',
  `tf_nums` decimal(11,2) NOT NULL COMMENT '挑粪数量',
  `fiaofen_uid` varchar(30) NOT NULL COMMENT '挑过我粪的上级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_tiaofen`
--

LOCK TABLES `ysk_tiaofen` WRITE;
/*!40000 ALTER TABLE `ysk_tiaofen` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_tiaofen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_tixian`
--

DROP TABLE IF EXISTS `ysk_tixian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_tixian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '订单号',
  `member_id` int(11) NOT NULL COMMENT '用户id',
  `zong_rmb` decimal(15,2) NOT NULL COMMENT '提现金额',
  `tx_rmb` decimal(15,2) NOT NULL COMMENT '实际到账金额',
  `pay_type` int(11) NOT NULL COMMENT '提现方式类型 1:微信 2:支付宝 3:银行卡4聚宝提现',
  `time` datetime NOT NULL COMMENT '时间',
  `state` int(1) NOT NULL DEFAULT '1' COMMENT '状t态 1->申请中，2->已通过 3->已拒绝',
  `refuse_rea` text CHARACTER SET utf8 COMMENT '拒绝说明',
  `zhifu_type` tinyint(1) NOT NULL COMMENT '哪种积分提现1佣金提现,2代理佣金提现,3农联积分提现，4鸡分提现，5鱼库积分提现，6果园积分提现',
  `give_xiaofei` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '赠送消费积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_tixian`
--

LOCK TABLES `ysk_tixian` WRITE;
/*!40000 ALTER TABLE `ysk_tixian` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_tixian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_tool`
--

DROP TABLE IF EXISTS `ysk_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_tool` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `t_name` varchar(20) NOT NULL DEFAULT '',
  `t_num` int(11) NOT NULL DEFAULT '0' COMMENT '价格',
  `t_type` tinyint(1) NOT NULL DEFAULT '0',
  `t_month` tinyint(4) NOT NULL DEFAULT '0',
  `t_fieldname` varchar(20) DEFAULT NULL,
  `t_value` tinyint(4) NOT NULL DEFAULT '1',
  `t_img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_tool`
--

LOCK TABLES `ysk_tool` WRITE;
/*!40000 ALTER TABLE `ysk_tool` DISABLE KEYS */;
INSERT INTO `ysk_tool` VALUES (1,'狗粮',16,1,1,NULL,0,'/Public/home/wap/images/ck2.jpg'),(2,'一键采蜜',12,1,1,NULL,0,'/Public/home/wap/images/ck3.jpg'),(3,'农夫',128,2,0,'nongfu_num',1,'/Public/home/wap/images/ck10.jpg'),(4,'鸟',108,2,0,'niao_num',1,'/Public/home/wap/images/ck4.jpg'),(5,'小鸡',88,2,0,'ji_num',1,'/Public/home/wap/images/ck8.jpg'),(6,'猫',98,2,0,'mao_num',1,'/Public/home/wap/images/ck9.jpg'),(7,'泰迪',68,2,0,'zangao_num',1,'/Public/home/wap/images/ck6.jpg'),(8,'哈士奇',98,2,0,'zangao_num',2,'/Public/home/wap/images/ck5.jpg'),(9,'藏獒',128,2,0,'zangao_num',3,'/Public/home/wap/images/ck7.jpg');
/*!40000 ALTER TABLE `ysk_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_trading`
--

DROP TABLE IF EXISTS `ysk_trading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_trading` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '出售数量',
  `sell_id` int(11) NOT NULL DEFAULT '0' COMMENT '出售人ID',
  `sell_account` varchar(50) NOT NULL,
  `sell_username` varchar(20) DEFAULT NULL,
  `buy_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买者ID',
  `buy_account` varchar(50) NOT NULL COMMENT '购买者账号',
  `buy_username` varchar(20) DEFAULT NULL COMMENT '购买者姓名',
  `fee_num` decimal(11,2) NOT NULL COMMENT '手续费',
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-出售成功 1-买家确认  2-买家确认 3-取消交易',
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sell_id` (`sell_id`) USING BTREE,
  KEY `buy_id` (`buy_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_trading`
--

LOCK TABLES `ysk_trading` WRITE;
/*!40000 ALTER TABLE `ysk_trading` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_trading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_trading_free`
--

DROP TABLE IF EXISTS `ysk_trading_free`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_trading_free` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '出售数量',
  `sell_id` int(11) NOT NULL DEFAULT '0' COMMENT '出售人ID',
  `sell_account` varchar(50) NOT NULL,
  `sell_username` varchar(20) DEFAULT NULL,
  `buy_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买者ID',
  `buy_account` varchar(50) DEFAULT NULL COMMENT '购买者账号',
  `buy_username` varchar(20) DEFAULT NULL COMMENT '购买者姓名',
  `fee_num` decimal(11,2) NOT NULL COMMENT '手续费',
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-出售成功 1-买家确认  2-买家确认 3-取消交易',
  `img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sell_id` (`sell_id`) USING BTREE,
  KEY `buy_id` (`buy_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_trading_free`
--

LOCK TABLES `ysk_trading_free` WRITE;
/*!40000 ALTER TABLE `ysk_trading_free` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_trading_free` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_tranmoney`
--

DROP TABLE IF EXISTS `ysk_tranmoney`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_tranmoney` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_id` int(10) DEFAULT NULL COMMENT '支付的会员',
  `get_id` int(10) DEFAULT NULL COMMENT '收到转账用户id',
  `get_nums` decimal(10,2) DEFAULT '0.00' COMMENT '转账总金额',
  `get_time` char(30) DEFAULT '0' COMMENT '转账时间',
  `get_type` tinyint(1) DEFAULT '0' COMMENT '0->转账,1->积分相关【转出80%与转入20%（只记录转入数）】、【余额对换积分（正数）或积分释放余额（负数）（判断2个UID相等）】,2->积分释放到余额（记录余额）,3->【余额交易】挂求购,4->购买，5->【余额交易】出售，6->取消，7->购买众筹， 8->买入（增加余额），9->卖出（减余额），10->取消（卖家返回余额），11->后台操作-余额，12->后台操作-积分，13->余额兑换积分（记录余额），22->转入的人弹出领取红包 23 推荐赠送 24 购物送积分',
  `now_nums` decimal(11,2) DEFAULT '0.00' COMMENT '兑换之后当前余额 ',
  `now_nums_get` decimal(11,2) DEFAULT '0.00' COMMENT '兑换之后当前余额 ',
  `is_release` tinyint(1) DEFAULT '0' COMMENT '0->未释放转账,1->1以释放转账',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=74282 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_tranmoney`
--

LOCK TABLES `ysk_tranmoney` WRITE;
/*!40000 ALTER TABLE `ysk_tranmoney` DISABLE KEYS */;
INSERT INTO `ysk_tranmoney` VALUES (73676,0,8569,10000.00,'1531294058',11,10000.00,10000.00,1),(73677,0,8569,10000.00,'1531297408',11,20000.00,20000.00,1),(73678,0,8569,-20000.00,'1531387937',11,0.00,0.00,1),(73679,0,8600,1000.00,'1531405714',11,1000.00,1000.00,1),(73680,8600,8600,100.00,'1531405795',13,900.00,900.00,1),(73681,8600,8600,600.00,'1531405795',1,600.00,600.00,1),(73682,8600,8600,1.20,'1531405842',2,901.20,901.20,1),(73683,8600,8600,-1.20,'1531405842',1,598.80,598.80,1),(73684,8600,8601,20.00,'1531405876',1,678.80,20.00,1),(73685,8600,8601,100.00,'1531405876',0,801.20,80.00,1),(73686,8601,8601,0.04,'1531405896',2,80.04,80.04,1),(73687,8601,8601,-0.04,'1531405896',1,19.96,19.96,1),(73688,8600,8601,5.00,'1531405922',1,698.80,24.96,1),(73689,8600,8601,25.00,'1531405922',0,776.20,100.04,1),(73690,8601,8601,100.00,'1531405960',13,0.04,0.04,1),(73691,8601,8601,600.00,'1531405960',1,624.96,624.96,1),(73692,0,8600,2000.00,'1531408829',11,2776.20,2776.20,1),(73693,0,8600,-2000.00,'1531408859',11,776.20,776.20,1),(73694,0,8616,2000.00,'1531408930',11,2000.00,2000.00,1),(73695,8600,8600,700.00,'1531410077',13,76.20,76.20,1),(73696,8600,8600,4200.00,'1531410077',1,4898.80,4898.80,1),(73697,8600,8602,15.00,'1531410143',1,4958.80,15.00,1),(73698,8600,8602,75.00,'1531410143',0,1.20,60.00,1),(73699,8602,8602,0.03,'1531410234',2,60.03,60.03,1),(73700,8602,8602,-0.03,'1531410234',1,14.97,14.97,1),(73701,8616,8602,10.00,'1531410273',1,40.00,24.97,1),(73702,8616,8602,50.00,'1531410273',0,1950.00,100.03,1),(73703,8616,8616,0.08,'1531410277',2,1950.08,1950.08,1),(73704,8616,8616,-0.08,'1531410277',1,39.92,39.92,1),(73705,8602,8602,100.00,'1531410288',13,0.03,0.03,1),(73706,8602,8602,600.00,'1531410288',1,624.97,624.97,1),(73707,8616,8603,25.00,'1531410370',1,139.92,25.00,1),(73708,8616,8603,125.00,'1531410370',0,1825.08,100.00,1),(73709,8603,8603,100.00,'1531410381',13,0.00,0.00,1),(73710,8603,8603,600.00,'1531410381',1,625.00,625.00,1),(73711,8616,8604,25.00,'1531410421',1,239.92,25.00,1),(73712,8616,8604,125.00,'1531410421',0,1700.08,100.00,1),(73713,8604,8604,100.00,'1531410433',13,0.00,0.00,1),(73714,8604,8604,600.00,'1531410433',1,625.00,625.00,1),(73715,8604,8604,1.25,'1531410444',2,1.25,1.25,1),(73716,8604,8604,-1.25,'1531410444',1,623.75,623.75,1),(73717,8616,8612,25.00,'1531410503',1,339.92,25.00,1),(73718,8616,8612,125.00,'1531410503',0,1575.08,100.00,1),(73719,8612,8612,100.00,'1531410511',13,0.00,0.00,1),(73720,8612,8612,600.00,'1531410511',1,625.00,625.00,1),(73721,8616,8605,25.00,'1531410548',1,439.92,25.00,1),(73722,8616,8605,125.00,'1531410548',0,1450.08,100.00,1),(73723,8605,8605,100.00,'1531410556',13,0.00,0.00,1),(73724,8605,8605,600.00,'1531410556',1,625.00,625.00,1),(73725,8616,8606,25.00,'1531410608',1,539.92,25.00,1),(73726,8616,8606,125.00,'1531410608',0,1325.08,100.00,1),(73727,8606,8606,100.00,'1531410617',13,0.00,0.00,1),(73728,8606,8606,600.00,'1531410617',1,625.00,625.00,1),(73729,8606,8606,1.25,'1531410623',2,1.25,1.25,1),(73730,8606,8606,-1.25,'1531410623',1,623.75,623.75,1),(73731,8616,8607,25.00,'1531410648',1,639.92,25.00,1),(73732,8616,8607,125.00,'1531410648',0,1200.08,100.00,1),(73733,8607,8607,100.00,'1531410657',13,0.00,0.00,1),(73734,8607,8607,600.00,'1531410657',1,625.00,625.00,1),(73735,8607,8607,1.25,'1531410661',2,1.25,1.25,1),(73736,8607,8607,-1.25,'1531410661',1,623.75,623.75,1),(73737,8616,8608,25.00,'1531410690',1,739.92,25.00,1),(73738,8616,8608,125.00,'1531410690',0,1075.08,100.00,1),(73739,8608,8608,100.00,'1531410699',13,0.00,0.00,1),(73740,8608,8608,600.00,'1531410699',1,625.00,625.00,1),(73741,8608,8608,1.25,'1531410708',2,1.25,1.25,1),(73742,8608,8608,-1.25,'1531410708',1,623.75,623.75,1),(73743,8616,8609,25.00,'1531410737',1,839.92,25.00,1),(73744,8616,8609,125.00,'1531410737',0,950.08,100.00,1),(73745,8609,8609,100.00,'1531410745',13,0.00,0.00,1),(73746,8609,8609,600.00,'1531410745',1,625.00,625.00,1),(73747,8609,8609,1.25,'1531410752',2,1.25,1.25,1),(73748,8609,8609,-1.25,'1531410752',1,623.75,623.75,1),(73749,8616,8610,25.00,'1531410776',1,939.92,25.00,1),(73750,8616,8610,125.00,'1531410776',0,825.08,100.00,1),(73751,8610,8610,100.00,'1531410785',13,0.00,0.00,1),(73752,8610,8610,600.00,'1531410785',1,625.00,625.00,1),(73753,8610,8610,1.25,'1531410802',2,1.25,1.25,1),(73754,8610,8610,-1.25,'1531410802',1,623.75,623.75,1),(73755,8616,8611,25.00,'1531410823',1,1039.92,25.00,1),(73756,8616,8611,125.00,'1531410823',0,700.08,100.00,1),(73757,8611,8611,100.00,'1531410831',13,0.00,0.00,1),(73758,8611,8611,600.00,'1531410831',1,625.00,625.00,1),(73759,8611,8611,1.25,'1531410840',2,1.25,1.25,1),(73760,8611,8611,-1.25,'1531410840',1,623.75,623.75,1),(73761,8616,8613,25.00,'1531410864',1,1139.92,25.00,1),(73762,8616,8613,125.00,'1531410864',0,575.08,100.00,1),(73763,8613,8613,100.00,'1531410871',13,0.00,0.00,1),(73764,8613,8613,600.00,'1531410871',1,625.00,625.00,1),(73765,8613,8613,1.25,'1531410894',2,1.25,1.25,1),(73766,8613,8613,-1.25,'1531410894',1,623.75,623.75,1),(73767,8616,8614,25.00,'1531410906',1,1239.92,25.00,1),(73768,8616,8614,125.00,'1531410907',0,450.08,100.00,1),(73769,8614,8614,100.00,'1531410912',13,0.00,0.00,1),(73770,8614,8614,600.00,'1531410912',1,625.00,625.00,1),(73771,8616,8615,25.00,'1531410965',1,1339.92,25.00,1),(73772,8616,8615,125.00,'1531410965',0,325.08,100.00,1),(73773,8615,8615,0.05,'1531410971',2,100.05,100.05,1),(73774,8615,8615,-0.05,'1531410971',1,24.95,24.95,1),(73775,8615,8615,100.00,'1531410983',13,0.05,0.05,1),(73776,8615,8615,600.00,'1531410983',1,624.95,624.95,1),(73777,8616,8617,25.00,'1531411041',1,1439.92,25.00,1),(73778,8616,8617,125.00,'1531411041',0,200.08,100.00,1),(73779,8617,8617,100.00,'1531411049',13,0.00,0.00,1),(73780,8617,8617,600.00,'1531411049',1,625.00,625.00,1),(73781,8617,8617,1.25,'1531411063',2,1.25,1.25,1),(73782,8617,8617,-1.25,'1531411063',1,623.75,623.75,1),(73783,8616,8618,25.00,'1531411101',1,1539.92,25.00,1),(73784,8616,8618,125.00,'1531411101',0,75.08,100.00,1),(73785,8618,8618,100.00,'1531411109',13,0.00,0.00,1),(73786,8618,8618,600.00,'1531411109',1,625.00,625.00,1),(73787,8618,8618,1.25,'1531411119',2,1.25,1.25,1),(73788,8618,8618,-1.25,'1531411119',1,623.75,623.75,1),(73789,8616,8616,4.68,'1531411207',2,79.76,79.76,1),(73790,8616,8616,-4.68,'1531411207',1,1535.24,1535.24,1),(73791,8600,8600,12.32,'1531411503',2,13.52,13.52,1),(73792,8600,8600,-12.32,'1531411503',1,4946.48,4946.48,1),(73793,8617,8617,2.05,'1531411732',2,3.30,3.30,1),(73794,8617,8617,-2.05,'1531411732',1,621.70,621.70,1),(73795,8618,8618,1.25,'1531411778',2,2.50,2.50,1),(73796,8618,8618,-1.25,'1531411778',1,622.50,622.50,1),(73797,8614,8614,2.85,'1531411827',2,2.85,2.85,1),(73798,8614,8614,-2.85,'1531411827',1,622.15,622.15,1),(73799,8613,8613,2.85,'1531412095',2,4.10,4.10,1),(73800,8613,8613,-2.85,'1531412095',1,620.90,620.90,1),(73801,8612,8612,1.25,'1531412135',2,1.25,1.25,1),(73802,8612,8612,-1.25,'1531412135',1,623.75,623.75,1),(73803,8611,8611,3.65,'1531412160',2,4.90,4.90,1),(73804,8611,8611,-3.65,'1531412160',1,620.10,620.10,1),(73805,8610,8610,3.65,'1531412173',2,4.90,4.90,1),(73806,8610,8610,-3.65,'1531412173',1,620.10,620.10,1),(73807,8609,8609,3.65,'1531412189',2,4.90,4.90,1),(73808,8609,8609,-3.65,'1531412189',1,620.10,620.10,1),(73809,8608,8608,3.65,'1531412201',2,4.90,4.90,1),(73810,8608,8608,-3.65,'1531412201',1,620.10,620.10,1),(73811,8607,8607,3.65,'1531412212',2,4.90,4.90,1),(73812,8607,8607,-3.65,'1531412212',1,620.10,620.10,1),(73813,8606,8606,3.65,'1531412221',2,4.90,4.90,1),(73814,8606,8606,-3.65,'1531412221',1,620.10,620.10,1),(73815,8605,8605,3.65,'1531412230',2,3.65,3.65,1),(73816,8605,8605,-3.65,'1531412230',1,621.35,621.35,1),(73817,8604,8604,3.65,'1531412240',2,4.90,4.90,1),(73818,8604,8604,-3.65,'1531412240',1,620.10,620.10,1),(73819,8603,8603,6.85,'1531412248',2,6.85,6.85,1),(73820,8603,8603,-6.85,'1531412248',1,618.15,618.15,1),(73821,8602,8602,4.45,'1531412268',2,4.48,4.48,1),(73822,8602,8602,-4.45,'1531412268',1,620.52,620.52,1),(73823,8601,8601,4.45,'1531412301',2,4.49,4.49,1),(73824,8601,8601,-4.45,'1531412301',1,620.51,620.51,1),(73825,8618,8630,0.20,'1531465953',1,623.30,0.20,1),(73826,8618,8630,1.00,'1531465953',0,1.50,0.80,1),(73827,8630,8630,0.00,'1531465962',2,0.80,0.80,1),(73828,8630,8630,0.00,'1531465962',1,0.20,0.20,1),(73829,0,8621,100000.00,'1531467015',11,100000.00,100000.00,1),(73830,8621,8622,25.00,'1531469333',1,100.00,25.00,1),(73831,8621,8622,125.00,'1531469333',0,99875.00,100.00,1),(73832,8621,8621,0.20,'1531469336',2,99875.20,99875.20,1),(73833,8621,8621,-0.20,'1531469336',1,99.80,99.80,1),(73834,8621,8623,25.00,'1531469956',1,199.80,25.00,1),(73835,8621,8623,125.00,'1531469956',0,99750.20,100.00,1),(73836,8621,8626,25.00,'1531470005',1,299.80,25.00,1),(73837,8621,8626,125.00,'1531470005',0,99625.20,100.00,1),(73838,8621,8627,25.00,'1531470042',1,399.80,25.00,1),(73839,8621,8627,125.00,'1531470042',0,99500.20,100.00,1),(73840,8621,8628,25.00,'1531470074',1,499.80,25.00,1),(73841,8621,8628,125.00,'1531470074',0,99375.20,100.00,1),(73842,8621,8629,25.00,'1531470105',1,599.80,25.00,1),(73843,8621,8629,125.00,'1531470105',0,99250.20,100.00,1),(73844,8622,8622,0.05,'1531471085',2,100.05,100.05,1),(73845,8622,8622,-0.05,'1531471085',1,24.95,24.95,1),(73846,8623,8623,0.05,'1531471115',2,100.05,100.05,1),(73847,8623,8623,-0.05,'1531471115',1,24.95,24.95,1),(73848,8623,8623,100.00,'1531471234',13,0.05,0.05,1),(73849,8623,8623,600.00,'1531471234',1,624.95,624.95,1),(73850,8622,8622,100.00,'1531471388',13,0.05,0.05,1),(73851,8622,8622,600.00,'1531471388',1,624.95,624.95,1),(73852,8621,8621,1000.00,'1531471455',13,98250.20,98250.20,1),(73853,8621,8621,6000.00,'1531471455',1,6599.80,6599.80,1),(73854,8621,8621,1000.00,'1531471468',13,97250.20,97250.20,1),(73855,8621,8621,6000.00,'1531471468',1,12599.80,12599.80,1),(73856,8626,8626,0.05,'1531471506',2,100.05,100.05,1),(73857,8626,8626,-0.05,'1531471506',1,24.95,24.95,1),(73858,8626,8626,100.00,'1531471517',13,0.05,0.05,1),(73859,8626,8626,600.00,'1531471517',1,624.95,624.95,1),(73860,8627,8627,0.05,'1531471541',2,100.05,100.05,1),(73861,8627,8627,-0.05,'1531471541',1,24.95,24.95,1),(73862,8627,8627,100.00,'1531471551',13,0.05,0.05,1),(73863,8627,8627,600.00,'1531471551',1,624.95,624.95,1),(73864,8628,8628,0.05,'1531471572',2,100.05,100.05,1),(73865,8628,8628,-0.05,'1531471572',1,24.95,24.95,1),(73866,8628,8628,100.00,'1531471593',13,0.05,0.05,1),(73867,8628,8628,600.00,'1531471593',1,624.95,624.95,1),(73868,8629,8629,0.05,'1531471620',2,100.05,100.05,1),(73869,8629,8629,-0.05,'1531471620',1,24.95,24.95,1),(73870,8629,8629,100.00,'1531471632',13,0.05,0.05,1),(73871,8629,8629,600.00,'1531471632',1,624.95,624.95,1),(73872,8615,8615,2.85,'1531472397',2,2.90,2.90,1),(73873,8615,8615,-2.85,'1531472397',1,622.10,622.10,1),(73874,8621,8632,200.00,'1531477726',1,13399.80,200.00,1),(73875,8621,8632,1000.00,'1531477726',0,96250.20,800.00,1),(73876,8632,8632,800.00,'1531477796',13,0.00,0.00,1),(73877,8632,8632,4800.00,'1531477796',1,5000.00,5000.00,1),(73878,8632,8632,10.00,'1531477817',2,10.00,10.00,1),(73879,8632,8632,-10.00,'1531477817',1,4990.00,4990.00,1),(73880,8621,8645,40.00,'1531478412',1,13559.80,40.00,1),(73881,8621,8645,200.00,'1531478412',0,96050.20,160.00,1),(73882,8645,8645,0.08,'1531478424',2,160.08,160.08,1),(73883,8645,8645,-0.08,'1531478424',1,39.92,39.92,1),(73884,8645,8645,100.00,'1531478474',13,60.08,60.08,1),(73885,8645,8645,600.00,'1531478474',1,639.92,639.92,1),(73886,0,8599,200000.00,'1531484635',11,200000.00,200000.00,1),(73887,0,8599,400000.00,'1531484737',11,600000.00,600000.00,1),(73888,0,8599,-600000.00,'1531484997',11,0.00,0.00,1),(73889,0,8570,200000.00,'1531485174',11,NULL,NULL,1),(73890,0,8570,200000.00,'1531485181',11,NULL,NULL,1),(73891,0,8570,200000.00,'1531485212',11,NULL,NULL,1),(73892,0,8570,200000.00,'1531485323',11,NULL,NULL,1),(73893,0,8599,160000.00,'1531485414',11,160000.00,160000.00,1),(73894,0,8599,40000.00,'1531485432',12,40000.00,40000.00,1),(73895,8599,8599,80.00,'1531485458',2,160080.00,160080.00,1),(73896,8599,8599,-80.00,'1531485458',1,39920.00,39920.00,1),(73897,0,8570,-800000.00,'1531485831',11,NULL,NULL,1),(73898,8621,8621,29.52,'1531497935',2,96079.72,96079.72,1),(73899,8621,8621,-29.52,'1531497935',1,13530.28,13530.28,1),(73900,8632,8632,10.78,'1531498316',2,20.78,20.78,1),(73901,8632,8632,-10.78,'1531498316',1,4979.22,4979.22,1),(73902,8617,8617,1.24,'1531498387',2,4.54,4.54,1),(73903,8617,8617,-1.24,'1531498387',1,620.46,620.46,1),(73904,8599,8599,79.84,'1531498766',2,160159.84,160159.84,1),(73905,8599,8599,-79.84,'1531498766',1,39840.16,39840.16,1),(73906,8601,8601,1.24,'1531500511',2,5.73,5.73,1),(73907,8601,8601,-1.24,'1531500511',1,619.27,619.27,1),(73908,0,8633,8000.00,'1531507372',11,8000.00,8000.00,1),(73909,0,8633,2000.00,'1531507383',12,2000.00,2000.00,1),(73910,0,8634,8000.00,'1531507426',11,8000.00,8000.00,1),(73911,0,8634,2000.00,'1531507435',12,2000.00,2000.00,1),(73912,0,8635,8000.00,'1531507492',11,8000.00,8000.00,1),(73913,0,8635,2000.00,'1531507502',12,2000.00,2000.00,1),(73914,0,8639,8000.00,'1531507573',11,8000.00,8000.00,1),(73915,0,8639,2000.00,'1531507584',12,2000.00,2000.00,1),(73916,0,8640,8000.00,'1531507621',11,8000.00,8000.00,1),(73917,0,8640,2000.00,'1531507631',12,2000.00,2000.00,1),(73918,0,8641,8000.00,'1531507666',11,8000.00,8000.00,1),(73919,0,8641,2000.00,'1531507676',12,2000.00,2000.00,1),(73920,0,8642,8000.00,'1531507706',11,8000.00,8000.00,1),(73921,0,8642,2000.00,'1531507715',12,2000.00,2000.00,1),(73922,0,8643,8000.00,'1531507745',11,8000.00,8000.00,1),(73923,0,8643,2000.00,'1531507756',12,2000.00,2000.00,1),(73924,0,8644,8000.00,'1531507787',11,8000.00,8000.00,1),(73925,0,8644,2000.00,'1531507799',12,2000.00,2000.00,1),(73926,0,8646,8000.00,'1531507839',11,8000.00,8000.00,1),(73927,0,8646,2000.00,'1531507847',12,2000.00,2000.00,1),(73928,0,8647,8000.00,'1531507873',11,8000.00,8000.00,1),(73929,0,8647,2000.00,'1531507881',12,2000.00,2000.00,1),(73930,0,8648,8000.00,'1531507911',11,8000.00,8000.00,1),(73931,0,8648,2000.00,'1531507920',12,2000.00,2000.00,1),(73932,0,8649,8000.00,'1531507945',11,8000.00,8000.00,1),(73933,0,8649,2000.00,'1531507953',12,2000.00,2000.00,1),(73934,0,8650,8000.00,'1531507979',11,8000.00,8000.00,1),(73935,0,8650,2000.00,'1531507989',12,2000.00,2000.00,1),(73936,0,8651,8000.00,'1531508030',11,8000.00,8000.00,1),(73937,0,8651,2000.00,'1531508039',12,2000.00,2000.00,1),(73938,0,8652,8000.00,'1531508065',11,8000.00,8000.00,1),(73939,0,8652,2000.00,'1531508074',12,2000.00,2000.00,1),(73940,0,8654,8000.00,'1531508120',11,8000.00,8000.00,1),(73941,0,8654,2000.00,'1531508128',12,2000.00,2000.00,1),(73942,0,8657,8000.00,'1531508162',11,8000.00,8000.00,1),(73943,0,8657,2000.00,'1531508169',12,2000.00,2000.00,1),(73944,0,8658,8000.00,'1531508198',11,8000.00,8000.00,1),(73945,0,8658,2000.00,'1531508207',12,2000.00,2000.00,1),(73946,0,8659,8000.00,'1531508240',11,8000.00,8000.00,1),(73947,0,8659,2000.00,'1531508253',12,2000.00,2000.00,1),(73948,0,8660,8000.00,'1531508282',11,8000.00,8000.00,1),(73949,0,8660,2000.00,'1531508289',11,10000.00,10000.00,1),(73950,0,8656,8000.00,'1531508335',11,8000.00,8000.00,1),(73951,0,8656,2000.00,'1531508344',12,2000.00,2000.00,1),(73952,0,8655,8000.00,'1531508405',11,8000.00,8000.00,1),(73953,0,8655,2000.00,'1531508415',12,2000.00,2000.00,1),(73954,8635,8635,4.00,'1531519185',2,8004.00,8004.00,1),(73955,8635,8635,-4.00,'1531519185',1,1996.00,1996.00,1),(73956,8635,8635,8000.00,'1531519244',13,4.00,4.00,1),(73957,8635,8635,48000.00,'1531519244',1,49996.00,49996.00,1),(73958,8647,8647,4.00,'1531523187',2,8004.00,8004.00,1),(73959,8647,8647,-4.00,'1531523187',1,1996.00,1996.00,1),(73960,8644,8644,4.00,'1531523490',2,8004.00,8004.00,1),(73961,8644,8644,-4.00,'1531523490',1,1996.00,1996.00,1),(73962,8658,8658,4.00,'1531525170',2,8004.00,8004.00,1),(73963,8658,8658,-4.00,'1531525170',1,1996.00,1996.00,1),(73964,8643,8643,4.00,'1531528550',2,8004.00,8004.00,1),(73965,8643,8643,-4.00,'1531528550',1,1996.00,1996.00,1),(73966,8654,8654,4.00,'1531531960',2,8004.00,8004.00,1),(73967,8654,8654,-4.00,'1531531960',1,1996.00,1996.00,1),(73968,8654,8654,8000.00,'1531532010',13,4.00,4.00,1),(73969,8654,8654,48000.00,'1531532010',1,49996.00,49996.00,1),(73970,8642,8642,4.00,'1531532872',2,8004.00,8004.00,1),(73971,8642,8642,-4.00,'1531532872',1,1996.00,1996.00,1),(73972,8646,8646,4.00,'1531532942',2,8004.00,8004.00,1),(73973,8646,8646,-4.00,'1531532942',1,1996.00,1996.00,1),(73974,8646,8646,8000.00,'1531532964',13,4.00,4.00,1),(73975,8646,8646,48000.00,'1531532964',1,49996.00,49996.00,1),(73976,8634,8634,4.00,'1531533314',2,8004.00,8004.00,1),(73977,8634,8634,-4.00,'1531533314',1,1996.00,1996.00,1),(73978,8640,8640,4.00,'1531533547',2,8004.00,8004.00,1),(73979,8640,8640,-4.00,'1531533547',1,1996.00,1996.00,1),(73980,8641,8641,68.00,'1531533614',2,8068.00,8068.00,1),(73981,8641,8641,-68.00,'1531533614',1,1932.00,1932.00,1),(73982,8633,8633,68.00,'1531533686',2,8068.00,8068.00,1),(73983,8633,8633,-68.00,'1531533686',1,1932.00,1932.00,1),(73984,8618,8618,1.25,'1531533975',2,2.74,2.74,1),(73985,8618,8618,-1.25,'1531533975',1,622.06,622.06,1),(73986,8649,8649,4.00,'1531533976',2,8004.00,8004.00,1),(73987,8649,8649,-4.00,'1531533976',1,1996.00,1996.00,1),(73988,8649,8649,8000.00,'1531534014',13,4.00,4.00,1),(73989,8649,8649,48000.00,'1531534014',1,49996.00,49996.00,1),(73990,8657,8657,4.00,'1531534657',2,8004.00,8004.00,1),(73991,8657,8657,-4.00,'1531534657',1,1996.00,1996.00,1),(73992,8657,8657,8000.00,'1531534706',13,4.00,4.00,1),(73993,8657,8657,48000.00,'1531534706',1,49996.00,49996.00,1),(73994,8643,8643,8000.00,'1531535208',13,4.00,4.00,1),(73995,8643,8643,48000.00,'1531535208',1,49996.00,49996.00,1),(73996,8642,8642,8000.00,'1531535350',13,4.00,4.00,1),(73997,8642,8642,48000.00,'1531535350',1,49996.00,49996.00,1),(73998,8633,8633,8000.00,'1531535405',13,68.00,68.00,1),(73999,8633,8633,48000.00,'1531535405',1,49932.00,49932.00,1),(74000,8640,8640,8000.00,'1531535457',13,4.00,4.00,1),(74001,8640,8640,48000.00,'1531535457',1,49996.00,49996.00,1),(74002,8641,8641,8000.00,'1531535499',13,68.00,68.00,1),(74003,8641,8641,48000.00,'1531535499',1,49932.00,49932.00,1),(74004,8634,8634,8000.00,'1531535607',13,4.00,4.00,1),(74005,8634,8634,48000.00,'1531535607',1,49996.00,49996.00,1),(74006,8655,8655,4.00,'1531535659',2,8004.00,8004.00,1),(74007,8655,8655,-4.00,'1531535659',1,1996.00,1996.00,1),(74008,8647,8647,8000.00,'1531535860',13,4.00,4.00,1),(74009,8647,8647,48000.00,'1531535860',1,49996.00,49996.00,1),(74010,8648,8648,4.00,'1531536562',2,8004.00,8004.00,1),(74011,8648,8648,-4.00,'1531536562',1,1996.00,1996.00,1),(74012,8648,8648,100.00,'1531536611',13,7904.00,7904.00,1),(74013,8648,8648,600.00,'1531536611',1,2596.00,2596.00,1),(74014,8648,8648,7900.00,'1531536647',13,4.00,4.00,1),(74015,8648,8648,47400.00,'1531536647',1,49996.00,49996.00,1),(74016,8655,8655,8000.00,'1531538647',13,4.00,4.00,1),(74017,8655,8655,48000.00,'1531538647',1,49996.00,49996.00,1),(74018,0,8670,8000.00,'1531551077',11,8000.00,8000.00,1),(74019,0,8670,2000.00,'1531551087',12,2000.00,2000.00,1),(74020,8670,8670,4.00,'1531551095',2,8004.00,8004.00,1),(74021,8670,8670,-4.00,'1531551095',1,1996.00,1996.00,1),(74022,8630,8630,0.00,'1531552053',2,0.80,0.80,1),(74023,8630,8630,0.00,'1531552053',1,0.20,0.20,1),(74024,8621,8629,200.00,'1531552056',1,14330.28,824.95,1),(74025,8621,8629,1000.00,'1531552056',0,95079.72,800.05,1),(74026,8621,8638,400.00,'1531552146',1,15930.28,400.00,1),(74027,8621,8638,2000.00,'1531552146',0,93079.72,1600.00,1),(74028,8629,8629,8.85,'1531552184',2,808.90,808.90,1),(74029,8629,8629,-8.85,'1531552184',1,816.10,816.10,1),(74030,8629,8629,800.00,'1531552198',13,8.90,8.90,1),(74031,8629,8629,4800.00,'1531552198',1,5616.10,5616.10,1),(74032,8638,8638,0.80,'1531552454',2,1600.80,1600.80,1),(74033,8638,8638,-0.80,'1531552454',1,399.20,399.20,1),(74034,8645,8645,1.28,'1531553072',2,61.36,61.36,1),(74035,8645,8645,-1.28,'1531553072',1,638.64,638.64,1),(74036,8638,8638,600.00,'1531553381',13,1000.80,1000.80,1),(74037,8638,8638,3600.00,'1531553381',1,3999.20,3999.20,1),(74038,8621,8631,200.00,'1531553522',1,16730.28,200.00,1),(74039,8621,8631,1000.00,'1531553522',0,92079.72,800.00,1),(74040,8631,8631,0.40,'1531553540',2,800.40,800.40,1),(74041,8631,8631,-0.40,'1531553540',1,199.60,199.60,1),(74042,8631,8631,800.00,'1531553573',13,0.40,0.40,1),(74043,8631,8631,4800.00,'1531553573',1,4999.60,4999.60,1),(74044,8658,8658,8000.00,'1531554989',13,4.00,4.00,1),(74045,8658,8658,48000.00,'1531554989',1,49996.00,49996.00,1),(74046,8628,8628,9.25,'1531556043',2,9.30,9.30,1),(74047,8628,8628,-9.25,'1531556043',1,615.70,615.70,1),(74048,8621,8662,25.00,'1531558232',1,16830.28,25.00,1),(74049,8621,8662,125.00,'1531558232',0,91954.72,100.00,1),(74050,8662,8662,0.05,'1531558238',2,100.05,100.05,1),(74051,8662,8662,-0.05,'1531558238',1,24.95,24.95,1),(74052,8662,8662,100.00,'1531558271',13,0.05,0.05,1),(74053,8662,8662,600.00,'1531558271',1,624.95,624.95,1),(74054,8651,8651,4.00,'1531560494',2,8004.00,8004.00,1),(74055,8651,8651,-4.00,'1531560494',1,1996.00,1996.00,1),(74056,8621,8680,40.00,'1531561270',1,16990.28,40.00,1),(74057,8621,8680,200.00,'1531561270',0,91754.72,160.00,1),(74058,8680,8680,0.08,'1531561322',2,160.08,160.08,1),(74059,8680,8680,-0.08,'1531561322',1,39.92,39.92,1),(74060,8680,8680,100.00,'1531561346',13,60.08,60.08,1),(74061,8680,8680,600.00,'1531561346',1,639.92,639.92,1),(74062,8616,8616,3.07,'1531562407',2,82.83,82.83,1),(74063,8616,8616,-3.07,'1531562407',1,1532.17,1532.17,1),(74064,8614,8614,1.24,'1531562448',2,4.09,4.09,1),(74065,8614,8614,-1.24,'1531562448',1,620.91,620.91,1),(74066,8599,8599,160100.00,'1531565368',13,59.84,59.84,1),(74067,8599,8599,960600.00,'1531565368',1,1000440.16,1000440.16,1),(74068,8644,8644,8000.00,'1531574967',13,4.00,4.00,1),(74069,8644,8644,48000.00,'1531574967',1,49996.00,49996.00,1),(74070,8600,8600,9.89,'1531582324',2,23.41,23.41,1),(74071,8600,8600,-9.89,'1531582324',1,4936.59,4936.59,1),(74072,8602,8602,1.24,'1531582340',2,5.72,5.72,1),(74073,8602,8602,-1.24,'1531582340',1,619.28,619.28,1),(74074,8603,8603,1.24,'1531582350',2,8.09,8.09,1),(74075,8603,8603,-1.24,'1531582350',1,616.91,616.91,1),(74076,8604,8604,1.24,'1531582688',2,6.14,6.14,1),(74077,8604,8604,-1.24,'1531582688',1,618.86,618.86,1),(74078,8605,8605,1.24,'1531582699',2,4.89,4.89,1),(74079,8605,8605,-1.24,'1531582699',1,620.11,620.11,1),(74080,8606,8606,1.24,'1531582709',2,6.14,6.14,1),(74081,8606,8606,-1.24,'1531582709',1,618.86,618.86,1),(74082,8607,8607,1.24,'1531582719',2,6.14,6.14,1),(74083,8607,8607,-1.24,'1531582719',1,618.86,618.86,1),(74084,8608,8608,1.24,'1531582731',2,6.14,6.14,1),(74085,8608,8608,-1.24,'1531582731',1,618.86,618.86,1),(74086,8609,8609,1.24,'1531582741',2,6.14,6.14,1),(74087,8609,8609,-1.24,'1531582741',1,618.86,618.86,1),(74088,8610,8610,1.24,'1531582751',2,6.14,6.14,1),(74089,8610,8610,-1.24,'1531582751',1,618.86,618.86,1),(74090,8611,8611,1.24,'1531582760',2,6.14,6.14,1),(74091,8611,8611,-1.24,'1531582760',1,618.86,618.86,1),(74092,8612,8612,1.25,'1531582771',2,2.50,2.50,1),(74093,8612,8612,-1.25,'1531582771',1,622.50,622.50,1),(74094,8613,8613,1.24,'1531582781',2,5.34,5.34,1),(74095,8613,8613,-1.24,'1531582781',1,619.66,619.66,1),(74096,8615,8615,1.24,'1531582868',2,4.14,4.14,1),(74097,8615,8615,-1.24,'1531582868',1,620.86,620.86,1),(74098,8644,8644,99.99,'1531584242',2,103.99,103.99,1),(74099,8644,8644,-99.99,'1531584242',1,49896.01,49896.01,1),(74100,8651,8651,3.99,'1531584496',2,8007.99,8007.99,1),(74101,8651,8651,-3.99,'1531584496',1,1992.01,1992.01,1),(74102,8599,8599,3664.88,'1531584652',2,3724.72,3724.72,1),(74103,8599,8599,-3664.88,'1531584652',1,996775.28,996775.28,1),(74104,8641,8641,227.86,'1531584743',2,295.86,295.86,1),(74105,8641,8641,-227.86,'1531584743',1,49704.14,49704.14,1),(74106,8649,8649,99.99,'1531584778',2,103.99,103.99,1),(74107,8649,8649,-99.99,'1531584778',1,49896.01,49896.01,1),(74108,8655,8655,99.99,'1531584783',2,103.99,103.99,1),(74109,8655,8655,-99.99,'1531584783',1,49896.01,49896.01,1),(74110,8655,8655,100.00,'1531584808',13,3.99,3.99,1),(74111,8655,8655,600.00,'1531584808',1,50496.01,50496.01,1),(74112,8650,8650,4.00,'1531584831',2,8004.00,8004.00,1),(74113,8650,8650,-4.00,'1531584831',1,1996.00,1996.00,1),(74114,8634,8634,99.99,'1531584878',2,103.99,103.99,1),(74115,8634,8634,-99.99,'1531584878',1,49896.01,49896.01,1),(74116,8650,8650,8000.00,'1531584880',13,4.00,4.00,1),(74117,8650,8650,48000.00,'1531584880',1,49996.00,49996.00,1),(74118,8634,8634,100.00,'1531584899',13,3.99,3.99,1),(74119,8634,8634,600.00,'1531584899',1,50496.01,50496.01,1),(74120,8599,8668,25.00,'1531585573',1,996875.28,25.00,1),(74121,8599,8668,125.00,'1531585573',0,3599.72,100.00,1),(74122,8668,8668,100.00,'1531585627',13,0.00,0.00,1),(74123,8668,8668,600.00,'1531585627',1,625.00,625.00,1),(74124,8599,8669,25.00,'1531585642',1,996975.28,25.00,1),(74125,8599,8669,125.00,'1531585642',0,3474.72,100.00,1),(74126,8668,8668,1.25,'1531585644',2,1.25,1.25,1),(74127,8668,8668,-1.25,'1531585644',1,623.75,623.75,1),(74128,8648,8648,99.99,'1531585916',2,103.99,103.99,1),(74129,8648,8648,-99.99,'1531585916',1,49896.01,49896.01,1),(74130,8648,8648,100.00,'1531585940',13,3.99,3.99,1),(74131,8648,8648,600.00,'1531585940',1,50496.01,50496.01,1),(74132,8646,8646,99.99,'1531586160',2,103.99,103.99,1),(74133,8646,8646,-99.99,'1531586160',1,49896.01,49896.01,1),(74134,8615,8615,1.24,'1531586243',2,5.39,5.39,1),(74135,8615,8615,-1.24,'1531586243',1,619.61,619.61,1),(74136,8618,8618,1.24,'1531586262',2,3.99,3.99,1),(74137,8618,8618,-1.24,'1531586262',1,620.81,620.81,1),(74138,8670,8670,3.99,'1531587324',2,8007.99,8007.99,1),(74139,8670,8670,-3.99,'1531587324',1,1992.01,1992.01,1),(74140,8670,8670,8000.00,'1531587342',13,7.99,7.99,1),(74141,8670,8670,48000.00,'1531587342',1,49992.01,49992.01,1),(74142,0,8624,100000.00,'1531587395',11,100000.00,100000.00,1),(74143,0,8648,8000.00,'1531587501',11,8003.99,8003.99,1),(74144,0,8648,2000.00,'1531587512',12,52496.01,52496.01,1),(74145,0,8679,8000.00,'1531587560',11,8000.00,8000.00,1),(74146,0,8679,2000.00,'1531587569',12,2000.00,2000.00,1),(74147,0,8599,100000.00,'1531587823',11,103474.72,103474.72,1),(74148,8632,8632,16.36,'1531588306',2,37.14,37.14,1),(74149,8632,8632,-16.36,'1531588306',1,4962.86,4962.86,1),(74150,8662,8662,1.25,'1531588999',2,1.30,1.30,1),(74151,8662,8662,-1.25,'1531588999',1,623.70,623.70,1),(74152,8646,8646,100.00,'1531605342',13,3.99,3.99,1),(74153,8646,8646,600.00,'1531605342',1,50496.01,50496.01,1),(74154,8647,8647,99.99,'1531606151',2,103.99,103.99,1),(74155,8647,8647,-99.99,'1531606151',1,49896.01,49896.01,1),(74156,8647,8647,100.00,'1531606178',13,3.99,3.99,1),(74157,8647,8647,600.00,'1531606178',1,50496.01,50496.01,1),(74158,8621,8621,33.98,'1531609984',2,91788.70,91788.70,1),(74159,8621,8621,-33.98,'1531609984',1,16956.30,16956.30,1),(74160,8629,8629,24.03,'1531610100',2,32.93,32.93,1),(74161,8629,8629,-24.03,'1531610100',1,5592.07,5592.07,1),(74162,8630,8630,0.00,'1531612517',2,0.80,0.80,1),(74163,8630,8630,0.00,'1531612517',1,0.20,0.20,1),(74164,8658,8658,99.99,'1531615070',2,103.99,103.99,1),(74165,8658,8658,-99.99,'1531615070',1,49896.01,49896.01,1),(74166,8658,8658,100.00,'1531615138',13,3.99,3.99,1),(74167,8658,8658,600.00,'1531615138',1,50496.01,50496.01,1),(74168,8679,8679,4.00,'1531615236',2,8004.00,8004.00,1),(74169,8679,8679,-4.00,'1531615236',1,1996.00,1996.00,1),(74170,8679,8679,8000.00,'1531615263',13,4.00,4.00,1),(74171,8679,8679,48000.00,'1531615263',1,49996.00,49996.00,1),(74172,8628,8628,20.43,'1531615343',2,29.73,29.73,1),(74173,8628,8628,-20.43,'1531615343',1,595.27,595.27,1),(74174,8635,8635,99.99,'1531615609',2,103.99,103.99,1),(74175,8635,8635,-99.99,'1531615609',1,49896.01,49896.01,1),(74176,8635,8635,100.00,'1531615628',13,3.99,3.99,1),(74177,8635,8635,600.00,'1531615628',1,50496.01,50496.01,1),(74178,8616,8616,3.06,'1531616543',2,85.89,85.89,1),(74179,8616,8616,-3.06,'1531616543',1,1529.11,1529.11,1),(74180,8614,8614,1.24,'1531616556',2,5.34,5.34,1),(74181,8614,8614,-1.24,'1531616556',1,619.66,619.66,1),(74182,8613,8613,1.24,'1531616565',2,6.58,6.58,1),(74183,8613,8613,-1.24,'1531616565',1,618.42,618.42,1),(74184,8612,8612,1.25,'1531616574',2,3.74,3.74,1),(74185,8612,8612,-1.25,'1531616574',1,621.26,621.26,1),(74186,8611,8611,1.24,'1531616582',2,7.38,7.38,1),(74187,8611,8611,-1.24,'1531616582',1,617.62,617.62,1),(74188,8610,8610,1.24,'1531616592',2,7.38,7.38,1),(74189,8610,8610,-1.24,'1531616592',1,617.62,617.62,1),(74190,8609,8609,1.24,'1531616607',2,7.38,7.38,1),(74191,8609,8609,-1.24,'1531616607',1,617.62,617.62,1),(74192,8608,8608,1.24,'1531616625',2,7.38,7.38,1),(74193,8608,8608,-1.24,'1531616625',1,617.62,617.62,1),(74194,8607,8607,1.24,'1531616636',2,7.38,7.38,1),(74195,8607,8607,-1.24,'1531616636',1,617.62,617.62,1),(74196,8606,8606,1.24,'1531616645',2,7.38,7.38,1),(74197,8606,8606,-1.24,'1531616645',1,617.62,617.62,1),(74198,8605,8605,1.24,'1531616653',2,6.13,6.13,1),(74199,8605,8605,-1.24,'1531616653',1,618.87,618.87,1),(74200,8604,8604,1.24,'1531616662',2,7.38,7.38,1),(74201,8604,8604,-1.24,'1531616662',1,617.62,617.62,1),(74202,8603,8603,1.23,'1531616672',2,9.32,9.32,1),(74203,8603,8603,-1.23,'1531616672',1,615.68,615.68,1),(74204,8602,8602,1.24,'1531616680',2,6.96,6.96,1),(74205,8602,8602,-1.24,'1531616680',1,618.04,618.04,1),(74206,8600,8600,9.87,'1531616703',2,33.28,33.28,1),(74207,8600,8600,-9.87,'1531616703',1,4926.72,4926.72,1),(74208,8601,8601,1.24,'1531616722',2,6.97,6.97,1),(74209,8601,8601,-1.24,'1531616722',1,618.03,618.03,1),(74210,8680,8680,1.28,'1531617942',2,61.36,61.36,1),(74211,8680,8680,-1.28,'1531617942',1,638.64,638.64,1),(74212,8617,8617,1.24,'1531621654',2,5.78,5.78,1),(74213,8617,8617,-1.24,'1531621654',1,619.22,619.22,1),(74214,8648,8648,8000.00,'1531621735',13,3.99,3.99,1),(74215,8648,8648,48000.00,'1531621735',1,100496.01,100496.01,1),(74216,8599,8599,400.00,'1531626133',13,103074.72,103074.72,1),(74217,8599,8599,2400.00,'1531626133',1,999375.28,999375.28,1),(74218,8633,8633,227.86,'1531628093',2,295.86,295.86,1),(74219,8633,8633,-227.86,'1531628093',1,49704.14,49704.14,1),(74220,8640,8640,99.99,'1531628410',2,103.99,103.99,1),(74221,8640,8640,-99.99,'1531628410',1,49896.01,49896.01,1),(74222,8643,8643,355.99,'1531628524',2,359.99,359.99,1),(74223,8643,8643,-355.99,'1531628524',1,49640.01,49640.01,1),(74224,8642,8642,163.99,'1531628700',2,167.99,167.99,1),(74225,8642,8642,-163.99,'1531628700',1,49832.01,49832.01,1),(74226,8660,8660,8000.00,'1531631725',13,2000.00,2000.00,1),(74227,8660,8660,48000.00,'1531631725',1,48000.00,48000.00,1),(74228,8660,8660,300.00,'1531631820',13,1700.00,1700.00,1),(74229,8660,8660,1800.00,'1531631820',1,49800.00,49800.00,1),(74230,8660,8660,99.60,'1531631834',2,1799.60,1799.60,1),(74231,8660,8660,-99.60,'1531631834',1,49700.40,49700.40,1),(74232,8659,8659,4.00,'1531632016',2,8004.00,8004.00,1),(74233,8659,8659,-4.00,'1531632016',1,1996.00,1996.00,1),(74234,8659,8659,8000.00,'1531632044',13,4.00,4.00,1),(74235,8659,8659,48000.00,'1531632044',1,49996.00,49996.00,1),(74236,8651,8651,8000.00,'1531632357',13,7.99,7.99,1),(74237,8651,8651,48000.00,'1531632357',1,49992.01,49992.01,1),(74238,8654,8654,99.99,'1531632886',2,103.99,103.99,1),(74239,8654,8654,-99.99,'1531632886',1,49896.01,49896.01,1),(74240,8599,8693,200.00,'1531633978',1,1000175.28,200.00,1),(74241,8599,8693,1000.00,'1531633978',0,102074.72,800.00,1),(74242,8693,8693,0.40,'1531634163',2,800.40,800.40,1),(74243,8693,8693,-0.40,'1531634163',1,199.60,199.60,1),(74244,8693,8693,500.00,'1531634194',13,300.40,300.40,1),(74245,8693,8693,3000.00,'1531634194',1,3199.60,3199.60,1),(74246,8639,8639,4.00,'1531634290',2,8004.00,8004.00,1),(74247,8639,8639,-4.00,'1531634290',1,1996.00,1996.00,1),(74248,8639,8639,8000.00,'1531634469',13,4.00,4.00,1),(74249,8639,8639,48000.00,'1531634469',1,49996.00,49996.00,1),(74250,8693,8700,25.00,'1531635610',1,3299.60,25.00,1),(74251,8693,8700,125.00,'1531635610',0,175.40,100.00,1),(74252,8700,8700,0.05,'1531635621',2,100.05,100.05,1),(74253,8700,8700,-0.05,'1531635621',1,24.95,24.95,1),(74254,8700,8700,100.00,'1531635638',13,0.05,0.05,1),(74255,8700,8700,600.00,'1531635638',1,624.95,624.95,1),(74256,8631,8631,10.00,'1531639767',2,10.40,10.40,1),(74257,8631,8631,-10.00,'1531639767',1,4989.60,4989.60,1),(74258,8645,8645,1.28,'1531646766',2,62.64,62.64,1),(74259,8645,8645,-1.28,'1531646766',1,637.36,637.36,1),(74260,8638,8638,8.00,'1531647302',2,1008.80,1008.80,1),(74261,8638,8638,-8.00,'1531647302',1,3991.20,3991.20,1),(74262,8660,8632,300.00,'1531648391',1,50900.40,5262.86,1),(74263,8660,8632,1500.00,'1531648391',0,299.60,1237.14,1),(74264,8621,8632,1000.00,'1531648454',1,20956.30,6262.86,1),(74265,8621,8632,5000.00,'1531648454',0,86788.70,5237.14,1),(74266,8657,8657,99.99,'1531648483',2,103.99,103.99,1),(74267,8657,8657,-99.99,'1531648483',1,49896.01,49896.01,1),(74268,8657,8657,100.00,'1531648516',13,3.99,3.99,1),(74269,8657,8657,600.00,'1531648516',1,50496.01,50496.01,1),(74270,8632,8632,5200.00,'1531650004',13,37.14,37.14,1),(74271,8632,8632,31200.00,'1531650004',1,37462.86,37462.86,1),(74272,8624,8618,1000.00,'1531661834',1,4000.00,1620.81,1),(74273,8624,8618,5000.00,'1531661834',0,95000.00,4003.99,1),(74274,8624,8624,8.00,'1531661837',2,95008.00,95008.00,1),(74275,8624,8624,-8.00,'1531661837',1,3992.00,3992.00,1),(74276,8599,8689,2000.00,'1531662525',1,1008175.28,2000.00,1),(74277,8599,8689,10000.00,'1531662525',0,92074.72,8000.00,1),(74278,8689,8689,4.00,'1531663747',2,8004.00,8004.00,1),(74279,8689,8689,-4.00,'1531663747',1,1996.00,1996.00,1),(74280,8689,8689,8000.00,'1531663772',13,4.00,4.00,1),(74281,8689,8689,48000.00,'1531663772',1,49996.00,49996.00,1);
/*!40000 ALTER TABLE `ysk_tranmoney` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_trans`
--

DROP TABLE IF EXISTS `ysk_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_trans` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '挂单中心',
  `payout_id` int(10) DEFAULT '0' COMMENT '转出余额会员id',
  `payin_id` int(10) DEFAULT '0' COMMENT '转入会员id',
  `pay_nums` decimal(11,2) DEFAULT '0.00' COMMENT '转出数量',
  `pay_state` tinyint(1) DEFAULT '0' COMMENT '订单状态:0->默认上架,1->有人买入,2->已打款,3->确认到款(已完成)',
  `pay_time` char(30) DEFAULT NULL COMMENT '订单生成时间',
  `pay_no` char(30) DEFAULT NULL COMMENT '订单编号',
  `card_id` int(10) DEFAULT NULL COMMENT '会员银行卡id',
  `trade_notes` text COMMENT '订单备注',
  `trans_type` tinyint(1) DEFAULT '0' COMMENT '0->买入,1->卖出',
  `trans_img` varchar(100) DEFAULT NULL COMMENT '打款凭证',
  `get_moneytime` char(50) DEFAULT NULL COMMENT '收到款时间',
  `fee_nums` decimal(11,2) DEFAULT '0.00' COMMENT '手续费',
  `out_card` int(10) DEFAULT NULL COMMENT '买入会员银行卡id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_trans`
--

LOCK TABLES `ysk_trans` WRITE;
/*!40000 ALTER TABLE `ysk_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_trans_quxiao`
--

DROP TABLE IF EXISTS `ysk_trans_quxiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_trans_quxiao` (
  `id` int(10) NOT NULL COMMENT '挂单中心',
  `payout_id` int(10) DEFAULT '0' COMMENT '转出余额会员id',
  `payin_id` int(10) DEFAULT '0' COMMENT '转入会员id',
  `pay_nums` decimal(11,2) DEFAULT '0.00' COMMENT '转出数量',
  `pay_state` tinyint(1) DEFAULT '0' COMMENT '订单状态:0->默认上架,1->有人买入,2->已打款,3->确认到款(已完成),4->取消',
  `pay_time` char(30) DEFAULT NULL COMMENT '订单生成时间',
  `pay_no` char(30) DEFAULT NULL COMMENT '订单编号',
  `card_id` int(10) DEFAULT NULL COMMENT '会员银行卡id',
  `trade_notes` text COMMENT '订单备注',
  `trans_type` tinyint(1) DEFAULT '0' COMMENT '0->买入,1->卖出,',
  `trans_img` varchar(100) DEFAULT NULL COMMENT '打款凭证',
  `get_moneytime` char(50) DEFAULT NULL COMMENT '收到款时间',
  `fee_nums` decimal(11,2) DEFAULT '0.00' COMMENT '手续费',
  `out_card` int(10) DEFAULT NULL COMMENT '买入会员银行卡id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_trans_quxiao`
--

LOCK TABLES `ysk_trans_quxiao` WRITE;
/*!40000 ALTER TABLE `ysk_trans_quxiao` DISABLE KEYS */;
INSERT INTO `ysk_trans_quxiao` VALUES (132,0,8574,500.00,0,'1530495303','PAY2018070255505751',NULL,'',1,NULL,NULL,0.00,339),(127,0,8573,500.00,0,'1530240894','PAY2018062910197499',NULL,'',1,NULL,NULL,0.00,335),(126,8573,8545,500.00,1,'1530007597','PAY2018062610050974',2,'',1,NULL,NULL,100.00,328),(143,0,8569,500.00,0,'1530612770','PAY2018070350555148',NULL,'',1,NULL,NULL,0.00,338),(131,0,8569,500.00,0,'1530341088','PAY2018063048514999',NULL,'',1,NULL,NULL,0.00,338),(136,0,8579,500.00,0,'1530513859','PAY2018070251535757',NULL,'',1,NULL,NULL,0.00,340),(150,0,8579,500.00,0,'1530688235','PAY2018070498519749',NULL,'',1,NULL,NULL,0.00,347),(151,0,8579,500.00,0,'1530688559','PAY2018070410249531',NULL,'',1,NULL,NULL,0.00,347);
/*!40000 ALTER TABLE `ysk_trans_quxiao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_tuandui`
--

DROP TABLE IF EXISTS `ysk_tuandui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_tuandui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id_2` (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_tuandui`
--

LOCK TABLES `ysk_tuandui` WRITE;
/*!40000 ALTER TABLE `ysk_tuandui` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_tuandui` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_turntable_lv`
--

DROP TABLE IF EXISTS `ysk_turntable_lv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_turntable_lv` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '转盘抽奖概率',
  `one` int(11) unsigned NOT NULL DEFAULT '0',
  `two` int(11) unsigned NOT NULL DEFAULT '0',
  `three` int(11) unsigned NOT NULL DEFAULT '0',
  `four` int(11) unsigned NOT NULL DEFAULT '0',
  `five` int(11) unsigned NOT NULL DEFAULT '0',
  `six` int(11) unsigned NOT NULL DEFAULT '0',
  `seven` int(11) unsigned NOT NULL DEFAULT '0',
  `eight` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6000002 DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_turntable_lv`
--

LOCK TABLES `ysk_turntable_lv` WRITE;
/*!40000 ALTER TABLE `ysk_turntable_lv` DISABLE KEYS */;
INSERT INTO `ysk_turntable_lv` VALUES (6000001,0,0,1,1,1,1,30,70);
/*!40000 ALTER TABLE `ysk_turntable_lv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_ubanks`
--

DROP TABLE IF EXISTS `ysk_ubanks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_ubanks` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '会员绑定银行卡',
  `card_id` int(2) NOT NULL COMMENT '银行卡id',
  `user_id` int(10) NOT NULL COMMENT '会员id',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-》默认,1->默认银行卡',
  `add_time` char(30) NOT NULL COMMENT '添加时间',
  `hold_name` char(50) NOT NULL COMMENT '持卡人姓名',
  `card_number` char(19) NOT NULL COMMENT '银行卡号',
  `open_card` char(100) NOT NULL COMMENT '开户支行',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=354 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_ubanks`
--

LOCK TABLES `ysk_ubanks` WRITE;
/*!40000 ALTER TABLE `ysk_ubanks` DISABLE KEYS */;
INSERT INTO `ysk_ubanks` VALUES (353,6,8671,0,'1531562091','陈景德','6217001930010128115','厦门集美区杏林支行');
/*!40000 ALTER TABLE `ysk_ubanks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_ucoins`
--

DROP TABLE IF EXISTS `ysk_ucoins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_ucoins` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '每个人账户对应币',
  `cid` int(10) NOT NULL COMMENT '币对应id',
  `c_nums` decimal(11,4) NOT NULL DEFAULT '0.0000' COMMENT '对应币数量',
  `c_uid` int(10) NOT NULL COMMENT '对应的会员id',
  `djie_nums` decimal(11,4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_ucoins`
--

LOCK TABLES `ysk_ucoins` WRITE;
/*!40000 ALTER TABLE `ysk_ucoins` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_ucoins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_uesources`
--

DROP TABLE IF EXISTS `ysk_uesources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_uesources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 用户资源表(拆分比例,风车拥有数量)',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `chaifen_bili` float(8,4) NOT NULL DEFAULT '0.0000' COMMENT '拆分比例',
  `jiwo_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '鸡窝收益',
  `count_time` date NOT NULL COMMENT '计算拆分/收益时间',
  `earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '记录收益',
  `tiaofen_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '挑粪收益',
  `guoyuan_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '果园施肥收益',
  `yuchang_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '渔场喂鱼收益',
  `buyu_earns` decimal(11,3) NOT NULL DEFAULT '0.000' COMMENT '捕鱼收益',
  `guoyuan_chaifen` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '果园拆分',
  `yuchang_chaifen` float(11,3) NOT NULL DEFAULT '0.000' COMMENT '渔场拆分',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE COMMENT '表id',
  KEY `uid` (`uid`) USING BTREE COMMENT '用户id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_uesources`
--

LOCK TABLES `ysk_uesources` WRITE;
/*!40000 ALTER TABLE `ysk_uesources` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_uesources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_upgoods`
--

DROP TABLE IF EXISTS `ysk_upgoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_upgoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商户产品表',
  `uid` int(11) NOT NULL COMMENT '商户id',
  `goods_id` int(11) NOT NULL COMMENT '产品id',
  `uptime` int(20) NOT NULL COMMENT '产品上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=276 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_upgoods`
--

LOCK TABLES `ysk_upgoods` WRITE;
/*!40000 ALTER TABLE `ysk_upgoods` DISABLE KEYS */;
INSERT INTO `ysk_upgoods` VALUES (161,1,120,1523524539),(162,1,1,1523524892),(163,1,121,1523527487),(164,1,122,1523527893),(165,1,123,1523528164),(166,1,124,1523585146),(167,1,1,1523585999),(168,1,1,1523590787),(169,1,1,1523590805),(170,1,125,1523591034),(171,1,1,1523591062),(172,1,1,1523591084),(173,1,1,1523591691),(174,1,1,1523591706),(175,1,126,1523591905),(176,1,127,1523592170),(177,1,1,1523592183),(178,1,128,1523599780),(179,1,129,1523600007),(180,1,130,1523600332),(181,1,131,1523600487),(182,1,1,1523600643),(183,1,1,1523600994),(184,1,1,1523601000),(185,1,134,1523601233),(186,1,1,1523601368),(187,1,1,1523601669),(188,1,1,1523601939),(189,1,1,1523602635),(190,1,1,1523602922),(191,1,1,1523602954),(192,1,1,1523603192),(193,1,1,1523603229),(194,1,1,1523603236),(195,1,1,1523603247),(196,1,1,1523603254),(197,1,1,1523603264),(198,1,1,1523603272),(199,1,1,1523603281),(200,1,1,1523603288),(201,1,1,1523603297),(202,1,139,1523678159),(203,1,140,1523681996),(204,1,141,1523682082),(205,1,142,1523682186),(206,1,143,1523682266),(207,1,144,1523682359),(208,1,145,1523682452),(209,1,146,1523682580),(210,1,147,1523682632),(211,1,148,1523682759),(212,1,149,1523682825),(213,1,150,1523682902),(214,1,151,1523682999),(215,1,152,1523683071),(216,1,153,1523683148),(217,1,154,1523683209),(218,1,155,1523683285),(219,1,156,1523683378),(220,1,157,1523683444),(221,1,158,1523683515),(222,1,159,1523683570),(223,1,160,1523683659),(224,1,161,1523683725),(225,1,162,1523683804),(226,1,163,1523683860),(227,1,164,1523683977),(228,1,165,1523684050),(229,1,166,1523684121),(230,1,1,1523684189),(231,1,1,1523684211),(232,1,1,1523684226),(233,1,1,1523690932),(234,1,1,1523690943),(235,1,1,1523690951),(236,1,1,1523690960),(237,1,1,1523690978),(238,1,1,1523690994),(239,1,1,1523691012),(240,1,1,1523691022),(241,1,1,1523691032),(242,1,1,1523691569),(243,1,1,1523691731),(244,1,1,1523692218),(245,1,1,1523694090),(246,1,1,1523694440),(247,1,1,1523694539),(248,1,1,1523694665),(249,1,1,1523694727),(250,1,1,1523695077),(251,1,1,1523695326),(252,1,1,1523695512),(253,1,1,1523695722),(254,1,1,1523695930),(255,1,1,1523696092),(256,1,1,1523696221),(257,1,1,1523696271),(258,1,1,1523696343),(259,1,1,1523696374),(260,1,1,1523696409),(261,1,1,1523697334),(262,1,1,1524195965),(263,0,171,1524204208),(264,0,172,1524204245),(265,24,1,1524204574),(266,24,173,1524205395),(267,24,1,1524205408),(268,25,174,1524449398),(269,26,175,1524741955),(270,27,176,1529046933),(271,28,177,1529047274),(272,27,178,1529059391),(273,27,179,1529059631),(274,27,180,1529059814),(275,29,181,1529565644);
/*!40000 ALTER TABLE `ysk_upgoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_upload`
--

DROP TABLE IF EXISTS `ysk_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'UID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `url` varchar(255) DEFAULT NULL COMMENT '文件链接',
  `ext` char(4) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) DEFAULT NULL COMMENT '文件md5',
  `sha1` char(40) DEFAULT NULL COMMENT '文件sha1编码',
  `location` varchar(15) NOT NULL DEFAULT '' COMMENT '文件存储位置',
  `download` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_upload`
--

LOCK TABLES `ysk_upload` WRITE;
/*!40000 ALTER TABLE `ysk_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_user`
--

DROP TABLE IF EXISTS `ysk_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_user` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL COMMENT '上级ID',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '上上级ID',
  `ggid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上上上级ID',
  `account` char(20) NOT NULL DEFAULT '0' COMMENT '用户账号',
  `mobile` char(20) NOT NULL COMMENT '用户手机号',
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `safety_pwd` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '安全密码',
  `safety_salt` char(5) CHARACTER SET latin1 NOT NULL,
  `login_pwd` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `login_salt` char(3) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-女 1-男',
  `reg_date` int(11) NOT NULL COMMENT '注册时间',
  `reg_ip` varchar(20) NOT NULL COMMENT '注册IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户锁定  1 不锁  0拉黑  -1 删除',
  `activate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否激活 1-已激活 0-未激活',
  `session_id` varchar(225) DEFAULT NULL,
  `wx_no` varchar(20) DEFAULT '0' COMMENT '微信',
  `alipay` varchar(20) DEFAULT NULL,
  `note` text,
  `deep` int(11) NOT NULL DEFAULT '0',
  `path` text,
  `user_credit` int(11) NOT NULL DEFAULT '5' COMMENT '用户星级',
  `use_grade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `img_head` varchar(100) NOT NULL DEFAULT 'toux-icon.png' COMMENT '用户头像',
  `bank_uname` varchar(20) DEFAULT NULL COMMENT '开户名',
  `releas_rate` float(10,4) NOT NULL DEFAULT '0.0000' COMMENT '增加的释放率',
  `releas_time` char(40) NOT NULL DEFAULT '1' COMMENT '释放时间',
  `is_reward` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0->默认未领取奖金,1->已经领取积分释放',
  `today_releas` float(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '今日释放率',
  `is_dailishang` tinyint(1) NOT NULL DEFAULT '0' COMMENT '2->商家',
  `wallet_add` text COMMENT '个人钱包地址',
  `vip_grade` tinyint(1) DEFAULT '0',
  `yinbi` tinyint(1) DEFAULT '0',
  `quanxian` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  UNIQUE KEY `account` (`account`) USING BTREE,
  KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8726 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_user`
--

LOCK TABLES `ysk_user` WRITE;
/*!40000 ALTER TABLE `ysk_user` DISABLE KEYS */;
INSERT INTO `ysk_user` VALUES (8576,0,0,0,'7','7','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8575,0,0,0,'6','6','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8574,0,0,0,'5','5','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8573,0,0,0,'4','4','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8572,0,0,0,'3','3','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531662301',0,50.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8570,0,0,0,'1','1','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',775.7500,'1531584001',0,15048.7998,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8571,0,0,0,'2','2','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'5ohl6pimnimiobv3rr5uij8732','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531411201',0,82.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8569,0,0,0,'18605969188','18605969188','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'llb6ag39kuti4jpm11liaat397','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8577,0,0,0,'8','8','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8578,0,0,0,'9','9','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8579,0,0,0,'10','10','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8580,0,0,0,'11','11','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8581,0,0,0,'12','12','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8582,0,0,0,'13','13','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8583,0,0,0,'14','14','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8584,0,0,0,'15','15','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8585,0,0,0,'16','16','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8586,0,0,0,'17','17','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8587,0,0,0,'18','18','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8588,0,0,0,'19','19','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'q41mnu3jcp4rt2aeipdbove322','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',102.0000,'1531584001',0,59.2500,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8589,0,0,0,'20','20','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8590,0,0,0,'21','21','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8591,0,0,0,'22','22','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8592,0,0,0,'23','23','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8593,0,0,0,'24','24','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8594,0,0,0,'25','25','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8595,0,0,0,'26','26','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8596,0,0,0,'27','27','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8597,0,0,0,'28','28','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8598,0,0,0,'29','29','123','','8dcdb451972f952a3eb8bd60d9fd384b','053','8dcdb451972f952a3eb8bd60d9fd384b','053',0,1530068736,'1.192.80.97',1,1,'jg3kdvqca2aatr5aomkv1u8oh0','0',NULL,NULL,15,'',5,1,'8afdec3bb0d3b631b1fbdd3928d6859a.png','erwtr',0.0000,'1531324801',0,0.0000,0,'4wXd13B5N6jeUN6lffj0gYu3CdNQjWUkCx',0,0,''),(8599,8570,0,0,'15750748900','15750748900','人生难得一知己','','45924159a6f7b4ed3140b8e9f551568b','c2d','4d4d88797c6ddd84cc5a89f3e48f8312','b65',0,1531306998,'223.104.6.49',1,1,'9ge6gbnci1rmi5cm4h4m0k81k2','0',NULL,NULL,16,'-8570-',5,4,'ee0eef8b58c663199cd68fdac86099d8.png',NULL,6494.3994,'1531584652',1,0.0000,0,'UxPaQffewwwRcTmfm3lZeukDfiAYyYhvB1',1,0,NULL),(8600,8571,0,0,'18650172189','18650172189','精忠报国','','7451446c365a7c2021b9b94a46b6ba6b','950','28b357723d55068c0a9007325e838b25','950',0,1531391756,'61.151.178.170',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,16,'-8571-',5,4,'toux-icon.png',NULL,0.0000,'1531616703',1,0.0000,0,'vbhYPvVc5SjSkePPg0f0SP4XWdQXZkiASj',0,0,NULL),(8601,8600,8571,0,'15980838559','15980838559','李世民','','00512a8878c4bd5ec0f9c14bf1c9ca8c','82d','1f637d3b6b1a27ca4f1bd8410291d667','82d',0,1531392161,'101.226.225.86',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,17,'-8571-8600-',5,4,'toux-icon.png',NULL,0.0000,'1531616722',1,0.0000,0,'hRCl6CbPVbykCka4DlkCUuRbNVYZ44xae5',0,0,NULL),(8602,8601,8600,8571,'17859386418','17859386418','芳草','','80755c1908d2e91a8f6a59f445c1635d','ea3','672ff73969adfeb5e78ccf767b07d336','ea3',0,1531392400,'112.5.202.85',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,18,'-8571-8600-8601-',5,4,'toux-icon.png',NULL,0.0000,'1531616680',1,0.0000,0,NULL,0,0,NULL),(8603,8602,8601,8600,'18178912678','18178912678','周文娟','','0c15db5f671bb1fad1d8bcd424bfdc88','f70','dc27272d632ad97b075987b5f34fcfdd','f70',0,1531392964,'61.151.178.180',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,19,'-8571-8600-8601-8602-',5,4,'toux-icon.png',NULL,0.0000,'1531616672',1,0.0000,0,NULL,0,0,NULL),(8604,8603,8602,8601,'15859256879','15859256879','碧海蓝天','','afce13c162f36c1f97bf62dd4631a2d7','6b7','79f48f3947932f3da4256a5fc0208aaf','6b7',0,1531393337,'61.151.178.180',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,20,'-8571-8600-8601-8602-8603-',5,4,'toux-icon.png',NULL,0.0000,'1531616662',1,0.0000,0,NULL,0,0,NULL),(8605,8604,8603,8602,'18950802761','18950802761','祖华','','59ee6eedbe7db6b27784b0dbff66b559','2ca','068403e4850d5c8225d36d7bd8d10435','2ca',0,1531393718,'120.204.17.68',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,21,'-8571-8600-8601-8602-8603-8604-',5,4,'toux-icon.png',NULL,0.0000,'1531616653',1,0.0000,0,NULL,0,0,NULL),(8606,8605,8604,8603,'18876435030','18876435030','陈浩','','322775708a36a5c20a433dd3fe3caf52','f78','753959bc27a0a5b2d5b7306b75114dc9','f78',0,1531394116,'61.151.180.39',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,22,'-8571-8600-8601-8602-8603-8604-8605-',5,4,'toux-icon.png',NULL,0.0000,'1531616645',1,0.0000,0,NULL,0,0,NULL),(8607,8606,8605,8604,'18876435010','18876435010','陈和好','','123a2844dde48a4956fa37b67cff2b2a','955','dcb14d4029bf7a0184298dc66e59bb21','955',0,1531394432,'61.151.178.170',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,23,'-8571-8600-8601-8602-8603-8604-8605-8606-',5,4,'toux-icon.png',NULL,0.0000,'1531616636',1,0.0000,0,'RU2uuvPvVTx4bh0xm4Dlf4B4PgBU0zBcSD',0,0,NULL),(8608,8607,8606,8605,'15359246291','15359246291','吴标胜','','f08b0eca66efdb3282d50de895447428','e0b','442026ee120397b563c239bc616dfb5c','e0b',0,1531394736,'61.151.178.168',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,24,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-',5,4,'toux-icon.png',NULL,0.0000,'1531616625',1,0.0000,0,NULL,0,0,NULL),(8609,8608,8607,8606,'15359246270','15359246270','吴任胜','','87ce5e726213c766804cb7f4e014a616','a37','57df3b302c8d23b233be37fe21c59c64','a37',0,1531395051,'61.151.178.168',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,25,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-',5,4,'toux-icon.png',NULL,0.0000,'1531616607',1,0.0000,0,NULL,0,0,NULL),(8610,8609,8608,8607,'18876435060','18876435060','桂森林','','65715ee05be89c0a731a0d683571bd16','895','e15fd8614165c070f8a60d10c868208d','895',0,1531395681,'61.151.178.168',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,26,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-',5,4,'toux-icon.png',NULL,0.0000,'1531616592',1,0.0000,0,'hy36U1TgXAhjh0l4bSuvYVSfc3lz3dlP1D',0,0,NULL),(8611,8610,8609,8608,'18876435070','18876435070','王超','','4b0a41460da95fd0ab764af075bf084c','531','317ddeb37c16a736b3f451d1ea4c71eb','531',0,1531395980,'112.5.202.85',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,27,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-',5,4,'toux-icon.png',NULL,0.0000,'1531616582',1,0.0000,0,NULL,0,0,NULL),(8612,8603,8602,8601,'15359245712','15359245712','小珠','','c2d3cf0fdc960b2ceb7b8d850ce5458e','b49','bcbb16372b9cb00870914fb95e6149e8','b49',0,1531396359,'61.151.178.168',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,20,'-8571-8600-8601-8602-8603-',5,4,'toux-icon.png',NULL,0.0000,'1531616574',1,0.0000,0,NULL,0,0,NULL),(8613,8611,8610,8609,'17750663018','17750663018','王远志','','cb3ddb9eb29dfdd39dae5d17203ed64c','0b2','feeb6a6aae90d0e899a4a007505ae11f','0b2',0,1531396860,'61.151.178.168',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,28,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-',5,4,'toux-icon.png',NULL,0.0000,'1531616565',1,0.0000,0,'g6Xi3DwW34eQ2ylufwB1c0iAPQgwwYhxSz',0,0,NULL),(8614,8613,8611,8610,'15359245701','15359245701','陈首震','','a6ee1a5ae6eff26ac7833f263137f00e','2eb','94128a77596a86b829827265025ec21f','2eb',0,1531397286,'61.151.178.168',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,29,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-',5,4,'toux-icon.png',NULL,0.0000,'1531616556',1,0.0000,0,NULL,0,0,NULL),(8615,8614,8613,8611,'13850077841','13850077841','李老头','','5d21bc1e6f758ed67fb8e580caf9bf0d','583','1e1690d498f252576edf3f6b74933a7a','583',0,1531397578,'61.151.178.168',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,30,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-',5,4,'toux-icon.png',NULL,0.0000,'1531586243',1,0.0000,0,NULL,0,0,NULL),(8616,8615,8614,8613,'18659202715','18659202715','自飞','','7ecfbffbe855929e09d0d0b4bb777ba7','c18','f4226c8f168e7a53870ffb7e742335da','c18',0,1531397880,'61.151.178.168',1,1,'9o9a0eamr6m8g6sio24hqmrdm5','0',NULL,NULL,31,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-',5,0,'toux-icon.png',NULL,0.0000,'1531616543',1,0.0000,0,NULL,0,0,NULL),(8617,8616,8615,8614,'18650008962','18650008962','金辉','','3cbcbe8df346d76c54f60ab6fd362496','710','771c3b728503533d3cc7603b7f253f09','710',0,1531398259,'61.151.178.170',1,1,'9o9a0eamr6m8g6sio24hqmrdm5','0',NULL,NULL,32,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-8616-',5,4,'toux-icon.png',NULL,0.0000,'1531621654',1,0.0000,0,'PV66OA0TCw3j6d2zPgUXduBkuiaPPjNBmg',0,0,NULL),(8618,8617,8616,8615,'15605024389','15605024389','啊辉','','f3ac009faba10146efdb08d6ed9f0b93','67d','f1ac9c30986cb0c2091cbc23ca25976c','67d',0,1531404330,'61.151.178.170',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,33,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-8616-8617-',5,4,'toux-icon.png',NULL,0.0000,'1531586262',1,0.0000,0,'XaUNCVOm3xPAZleNTR0ZwabWBUPXDOZ6vv',0,0,NULL),(8619,8615,8614,8613,'13055200350','13055200350','王兵','','edfa4120ef059c5864339aa5ef1f9a14','e7f','edfa4120ef059c5864339aa5ef1f9a14','e7f',0,1531409257,'117.135.173.79',1,1,'h6bmm130ddbubkrjfm0gd26bm3','0',NULL,NULL,31,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8620,8618,8617,8616,'15985827841','15985827841','李家军团','','923021eb9cee53825da6ed2cb993076d','80b','1d97bc9b717ecde0762eb188db9398d5','80b',0,1531409930,'61.151.178.170',1,1,NULL,'0',NULL,NULL,34,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-8616-8617-8618-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8621,8588,0,0,'13806032999','13806032999','能量钱包','','ede442c6109e6d26c56f746eff401327','18f','504b5a488a8dc0ccde6f728e8ea5a7f3','18f',0,1531457461,'223.104.6.17',1,1,'7qmbdge48ne4jacr7rfgi5cpo0','0',NULL,NULL,16,'-8588-',5,4,'toux-icon.png',NULL,0.0000,'1531609984',1,0.0000,0,'xD5gkiCdSOxAwlCCVYVdhcxVevf2ddN0Cm',0,0,''),(8633,8599,8570,0,'17050518253','17050518253','zd8','','7f94f1402a45e258400dfb9a547bfc3a','4a8','7f94f1402a45e258400dfb9a547bfc3a','4a8',0,1531472418,'101.226.225.84',1,1,'0o2qfkocgp98hkhjhmbdqbtf41','0',NULL,NULL,17,'-8570-8599-',5,4,'toux-icon.png',NULL,66.4000,'1531628093',1,0.0000,0,NULL,0,0,NULL),(8622,8621,8588,0,'18965130448','18965130448','能力钱包','','bbe8d38be6f4b1d42bd346b27e2c5fef','334','44e76140fb6410d9de25a71537fbd3e1','334',0,1531457967,'61.151.178.180',1,1,'saui69f6vk15p8p5kklnbqoi52','0',NULL,NULL,17,'-8588-8621-',5,4,'toux-icon.png',NULL,0.0000,'1531497601',0,2.4000,0,NULL,0,0,''),(8623,8622,8621,8588,'13338451393','13338451393','能群','','f8314d5be482c2927ceecfc90c13bda2','2b0','3321bac34e4a24bab2779d350892d182','2b0',0,1531458303,'223.104.6.17',1,1,'saui69f6vk15p8p5kklnbqoi52','0',NULL,NULL,18,'-8588-8621-8622-',5,4,'toux-icon.png',NULL,0.0000,'1531497601',0,2.4000,0,NULL,0,0,''),(8624,8572,0,0,'18650130050','18650130050','周瑜','','4b163375d4a410cd48f96a7e3e3a09b7','6b3','4b163375d4a410cd48f96a7e3e3a09b7','6b3',0,1531458577,'101.226.225.84',1,1,'9kq0apckmjdmfvbi1q1gpan8k4','0',NULL,NULL,16,'-8572-',5,0,'toux-icon.png',NULL,0.0000,'1531661837',1,0.0000,0,'SQg152Cb2g44OZ1OOdDO0XWOCbkllWTg21',0,0,''),(8625,8624,8572,0,'17817730270','17817730270','大黄','','a1e4c1e014030ff416278c55c348a357','e9c','a9f3e6ae8a5016e54015be7a9fcde135','e9c',0,1531458783,'207.244.149.5',1,1,'at4eql876h2lhh9obbcsvra8g2','0',NULL,NULL,17,'-8572-8624-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8626,8623,8622,8621,'18064432666','18064432666','凯帝','','1aabcb68342cc051c0c271842a32f053','a63','e59bab92ec7d5630752443e25e9603e2','a63',0,1531458940,'117.30.145.17',1,1,'saui69f6vk15p8p5kklnbqoi52','0',NULL,NULL,19,'-8588-8621-8622-8623-',5,4,'toux-icon.png',NULL,0.0000,'1531584001',0,6.4000,0,NULL,0,0,''),(8627,8626,8623,8622,'18064432777','18064432777','凯帝国','','14f13c24f1adafd31cbc9e0e4bd8a6bf','9d9','852d4b7d1a56869e842c66d48b3e9af4','9d9',0,1531459271,'117.30.145.17',1,1,'saui69f6vk15p8p5kklnbqoi52','0',NULL,NULL,20,'-8588-8621-8622-8623-8626-',5,4,'toux-icon.png',NULL,41.6000,'1531584001',0,12.8000,0,NULL,0,0,''),(8628,8627,8626,8623,'18688637929','18688637929','凯旋门','','4a13173501c32658e508a9fa83a7f5f5','5e1','f89f6e558842c21db1fd0386479f5431','157',0,1531459657,'117.30.145.17',1,1,'nfgd0cui0qk8o76ddaf7qh8jc6','0',NULL,NULL,21,'-8588-8621-8622-8623-8626-8627-',5,4,'eca24f48354627bb0103a5e0d974f5c3.png',NULL,41.6000,'1531615343',1,0.0000,0,'k1uPwb2l4AjcgZk3D6CXDi1u6eYBiyaC50',0,0,''),(8629,8628,8627,8626,'18965103000','18965103000','凯凯哥','','9a15c16c47e145ce1ef34f394189c8c1','c29','ca7237dff1f2bf324e36b88063d62d86','c29',0,1531459949,'117.30.145.17',1,1,'pp33dprs3e73aa1cmtqo04c7d4','0',NULL,NULL,22,'-8588-8621-8622-8623-8626-8627-8628-',5,4,'toux-icon.png',NULL,41.6000,'1531610100',1,0.0000,0,NULL,0,0,''),(8630,8618,8617,8616,'18650021060','18650021060','好人缘','','b743999ce20702e2be44cf13079ecc8e','76d','ae020699e6867347294e7d90f25dd517','76d',0,1531465487,'61.151.178.167',1,1,'3diqp926bvmmebfhl16ivm96e7','0',NULL,NULL,34,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-8616-8617-8618-',5,0,'toux-icon.png',NULL,0.0000,'1531612517',1,0.0000,0,'jZ3XZBumy0efbkYyZPN3BAvOhyOADmNBkQ',0,0,NULL),(8662,8632,8629,8628,'17605927831','17605927831','致青春','','1e58ba0590429efc927d42c30f15ae27','2bf','1e58ba0590429efc927d42c30f15ae27','2bf',0,1531499485,'58.23.232.58',1,1,'idieru35vfel5h71dblsbvmns2','0',NULL,NULL,24,'-8588-8621-8622-8623-8626-8627-8628-8629-8632-',5,4,'toux-icon.png',NULL,0.0000,'1531588999',1,0.0000,0,'wlXhXeQPBka5kBZA21Cw1fVUj2iDQhmP10',0,0,NULL),(8631,8629,8628,8627,'15738871906','15738871906','蒲月','','958a9aa3a4aab546f17db2618fa976b2','8a3','a74ef318e58afcd88a5b9b49d99b4a44','8a3',0,1531471823,'113.96.219.248',1,1,'bd6upceonbqvtlct1ue2vbl275','0',NULL,NULL,23,'-8588-8621-8622-8623-8626-8627-8628-8629-',5,4,'toux-icon.png',NULL,0.0000,'1531639767',1,0.0000,0,NULL,0,0,NULL),(8632,8629,8628,8627,'15703951160','15703951160','鸽子','','7b9b79441754804442f9983c2da7c7e0','f42','7b9b79441754804442f9983c2da7c7e0','f42',0,1531472100,'117.30.145.17',1,1,'ma95ervi0mpefp7cfh4vjg7m81','0',NULL,NULL,23,'-8588-8621-8622-8623-8626-8627-8628-8629-',5,4,'toux-icon.png',NULL,0.0000,'1531588306',1,0.0000,0,'wwmV6jBfRQXSVcOdQVuj3RYueUTwbe2Zwz',0,0,NULL),(8634,8633,8599,8570,'18606926164','18606926164','lxx0906','','bffa1b0c4c4beeca60001cd35a37014b','fbd','5362c4d8aa28f2ffee567436fd13b91e','fbd',0,1531472866,'117.30.145.17',1,1,'0o2qfkocgp98hkhjhmbdqbtf41','0',NULL,NULL,18,'-8570-8599-8633-',5,4,'toux-icon.png',NULL,0.8000,'1531584878',1,0.0000,0,'5YUNeWdZ0a03ijkc2wAi0OWcOxzVdegwY6',0,0,NULL),(8635,8633,8599,8570,'13559695089','13559695089','苏泗光','','98cd6a3112df92d7cc563316034db7ed','3a0','47107d824d1c4551f249db112c1b673f','3a0',0,1531473448,'117.185.117.60',1,1,'anb0c8m7p7l0leh9lrse6ase34','0',NULL,NULL,18,'-8570-8599-8633-',5,4,'toux-icon.png',NULL,0.0000,'1531615609',1,0.0000,0,NULL,0,0,NULL),(8636,8618,8617,8616,'18959200506','18959200506','李学如','','e858ba99fe6a51a612e2896681ad56a5','5d7','cbdb2e5a60dd1824dda1d7c4214cca44','5d7',0,1531473535,'61.151.178.170',1,1,NULL,'0',NULL,NULL,34,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-8616-8617-8618-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8637,8634,8633,8599,'13906004439','13906004439','陈帆','','07e9aab85508250dbe080d16d4db676e','712','810bad647a8a739314b754c801cf676e','712',0,1531473563,'61.129.8.250',1,1,'8qm3ina6vo2krv63ds0sdi88k0','0',NULL,NULL,19,'-8570-8599-8633-8634-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,'W5BObYB2uhhkkUQYelQAlzA3Rbeby4DAiA',0,0,NULL),(8638,8632,8629,8628,'15659294376','15659294376','福哥','','c1ab20fdebbe64ba7b0d6e14aa5e5dda','694','2ba58b68cf222bd89065b84c4c6981f2','eb9',0,1531473920,'211.97.128.252',1,1,'sscr59p3doj1l3ppif8r48gma2','0',NULL,NULL,24,'-8588-8621-8622-8623-8626-8627-8628-8629-8632-',5,4,'toux-icon.png',NULL,0.0000,'1531647302',1,0.0000,0,'x24XZ5CPd5bWiib6eCClYWeD2lBVQNBQD4',0,0,NULL),(8639,8633,8599,8570,'19906015513','19906015513','王平','','10a9cd1db3a23dc3fd7e9b38433f2d03','000','6e3fa6c85763b53b2449eec6a8454251','000',0,1531475014,'140.243.228.166',1,1,'ps1qsm9t6nosflq78qdgsqm8o4','0',NULL,NULL,18,'-8570-8599-8633-',5,4,'toux-icon.png',NULL,0.0000,'1531634290',1,0.0000,0,NULL,0,0,NULL),(8640,8599,8570,0,'17050518237','17050518237','大8','','2ee64b378c86eef5854d65612410d2f2','9bf','2ee64b378c86eef5854d65612410d2f2','9bf',0,1531476580,'101.226.225.84',1,1,'0o2qfkocgp98hkhjhmbdqbtf41','0',NULL,NULL,17,'-8570-8599-',5,4,'toux-icon.png',NULL,130.4000,'1531628410',1,0.0000,0,NULL,0,0,NULL),(8641,8599,8570,0,'17050518236','17050518236','大9','','db3efd0a8cfd95d5d3d18fc12b841fcd','d12','0b506256c42ee9ae5ac8caf8232cf934','d12',0,1531476827,'117.30.147.255',1,1,'0o2qfkocgp98hkhjhmbdqbtf41','0',NULL,NULL,17,'-8570-8599-',5,4,'toux-icon.png',NULL,65.6000,'1531584743',1,0.0000,0,NULL,0,0,NULL),(8642,8599,8570,0,'17050518239','17050518239','大888','','6cd3109149ece07cec5b378913606cfd','f5d','6cd3109149ece07cec5b378913606cfd','f5d',0,1531476993,'101.226.225.84',1,1,'0o2qfkocgp98hkhjhmbdqbtf41','0',NULL,NULL,17,'-8570-8599-',5,4,'toux-icon.png',NULL,256.0000,'1531628700',1,0.0000,0,NULL,0,0,NULL),(8643,8599,8570,0,'17050518238','17050518238','大8888','','a06fa76c412180b771d8202b455e566d','e22','b39580a6cb399fac4aacaf366044faf9','e22',0,1531477178,'117.30.147.255',1,1,'0o2qfkocgp98hkhjhmbdqbtf41','0',NULL,NULL,17,'-8570-8599-',5,4,'toux-icon.png',NULL,72.0000,'1531628524',1,0.0000,0,NULL,0,0,NULL),(8644,8633,8599,8570,'18205978911','18205978911','共享','','41e6009e4a23aabcec2cb2984bf8b1df','ee2','a8adc6bed254482812095cd6bbc0745f','ee2',0,1531477888,'61.129.7.254',1,1,'90nrmrqd1edfc3kfu452gbc4f5','0',NULL,NULL,18,'-8570-8599-8633-',5,4,'toux-icon.png',NULL,0.0000,'1531584242',1,0.0000,0,'VVX31mOze0BPiyBlVhgajP2bd1fiQkAAbi',0,0,NULL),(8645,8632,8629,8628,'15980831541','15980831541','汐楠','','356cbe70556f906b22c522922d7c0784','db7','6d0ce24d0754a9e8b4801a6279ce51c6','db7',0,1531477988,'61.129.6.148',1,1,'htkqkju2ectlfm03191flrhl07','0',NULL,NULL,24,'-8588-8621-8622-8623-8626-8627-8628-8629-8632-',5,4,'toux-icon.png',NULL,0.0000,'1531646766',1,0.0000,0,NULL,0,0,NULL),(8646,8643,8599,8570,'18065712756','18065712756','祥哥','','43bb88687aeb3bed9a029d34d6df613f','466','0b5f0f1ae234fb7935e0fa6a7d9ac05b','466',0,1531478312,'61.151.179.27',1,1,'0q0k4o4hp112op6ik49uohjk41','0',NULL,NULL,18,'-8570-8599-8643-',5,4,'toux-icon.png',NULL,0.0000,'1531586160',1,0.0000,0,NULL,0,0,NULL),(8647,8643,8599,8570,'18030177931','18030177931','碧莲','','7930e90fbdb71f5fb5e558e96a89e39d','874','502fece3c0c55f945243d6faa8ab0d86','874',0,1531478431,'117.135.170.150',1,1,'tj23bn9ttg57c7ng4cvrsp8qg1','0',NULL,NULL,18,'-8570-8599-8643-',5,4,'toux-icon.png',NULL,0.0000,'1531606151',1,0.0000,0,'dhUWZZQAxDPlmO4amBcXPxbguwVSAzy5hc',0,0,NULL),(8648,8643,8599,8570,'13600903456','13600903456','健斌','','413b7db491013eab1a6f792b842d0774','c83','1d829cda2c464c0bb8b6fb318fe56d1f','c83',0,1531478622,'223.104.6.55',1,1,'hfbbl99siaomabtkf7fjt03tf3','0',NULL,NULL,18,'-8570-8599-8643-',5,4,'toux-icon.png',NULL,4.8000,'1531585916',1,0.0000,0,'gyeCWYvX0AySN1uz4WVkWTPO6Yv5BAeCkO',0,0,NULL),(8649,8642,8599,8570,'13459219119','13459219119','天福0504','','022321e61c264e91ed4e4d34871849d0','1da','69a6652742acb1061d1c579771d9d7d1','1da',0,1531478962,'223.104.6.61',1,1,'dl8n5pbimm41i1l62ksibv1a92','0',NULL,NULL,18,'-8570-8599-8642-',5,4,'toux-icon.png',NULL,64.0000,'1531584778',1,0.0000,0,'6mDXxTYUPkfz2wB4aRa1lVXiyv5gwCeigT',0,0,NULL),(8650,8642,8599,8570,'13779932095','13779932095','九姐','','a092e64183775caf15313cd3c6bb4f67','dfd','1909e8cf63eccd0ec7f4dc8043f3bc46','dfd',0,1531479164,'223.104.6.2',1,1,'fmlbbtfl1mpu8mcv8uf38thes4','0',NULL,NULL,18,'-8570-8599-8642-',5,4,'toux-icon.png',NULL,0.0000,'1531584831',1,0.0000,0,NULL,0,0,NULL),(8651,8642,8599,8570,'18965859139','18965859139','最新支付','','25d743723bed30016ab460e314f09d10','3f1','0c48144df2f8615356fd18053b3b6b55','3f1',0,1531480118,'101.226.225.84',1,1,'o8h7unglf6r2eo7mobpa62mfj2','0',NULL,NULL,18,'-8570-8599-8642-',5,4,'toux-icon.png',NULL,0.0000,'1531584496',1,0.0000,0,'ujexBu3l6cxkWydRwVfUXQCvvg1OdQbfaa',0,0,NULL),(8652,8633,8599,8570,'15060872088','15060872088','叶百霞','','a115699b1e7f53e15ad6644235c6fa9d','214','cbedbc299cde9661bdb1d4d7fd229730','214',0,1531480246,'101.226.225.59',1,1,NULL,'0',NULL,NULL,18,'-8570-8599-8633-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8653,8618,8617,8616,'13779955226','13779955226','李春容','','dfb6c0aef9c38b73a9d5b028a64b54e2','82c','ab7b9799bfac8fd644e21edd1850cf74','82c',0,1531481388,'61.151.178.170',1,1,NULL,'0',NULL,NULL,34,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-8616-8617-8618-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8654,8641,8599,8570,'13205921166','13205921166','阮赛平','','0a1ca0853d6abcc683810454cf4e46aa','9ea','0a1ca0853d6abcc683810454cf4e46aa','9ea',0,1531481397,'223.167.142.60',1,1,'15tm8804tguc74tf7nke18ks00','0',NULL,NULL,18,'-8570-8599-8641-',5,4,'toux-icon.png',NULL,0.0000,'1531632886',1,0.0000,0,NULL,0,0,NULL),(8655,8643,8599,8570,'13720878335','13720878335','黄薪燕','','8a9059896bf6a6971f5a8cccb4712309','d6d','5cb9029b9ab786a18a1b180805bbae6a','d6d',0,1531481797,'211.97.131.21',1,1,'42klj7pqim6ibp82alp4bir205','0',NULL,NULL,18,'-8570-8599-8643-',5,4,'toux-icon.png',NULL,0.0000,'1531584783',1,0.0000,0,NULL,0,0,NULL),(8656,8640,8599,8570,'13358336873','13358336873','郑亚庆','','051baec88dbcc1921f88775a4bddb97e','dcf','5fd7666075b732a934a20d1feddd2403','dcf',0,1531481909,'106.122.5.93',1,1,'prmsqdq5nhvutm606h8i397k07','0',NULL,NULL,18,'-8570-8599-8640-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8657,8641,8599,8570,'13023984908','13023984908','刘备','','26e399582ac7c028f17c38eb6c0cad35','2d0','6239f915e2a3203f182b73f6ad7a19dd','2d0',0,1531482578,'211.97.128.134',1,1,'s3hljm0iigs5gcqrl4d5tc8n15','0',NULL,NULL,18,'-8570-8599-8641-',5,4,'toux-icon.png',NULL,0.0000,'1531648483',1,0.0000,0,NULL,0,0,NULL),(8658,8641,8599,8570,'17359879413','17359879413','zyh1313','','0103fe79c0028312e1830dd0327d547c','2d4','ef56e600b52666bc7302a40af7c5be1b','fe0',0,1531485689,'117.185.117.60',1,1,'olf7dhs9ivoq0m9rtgcdbemci1','0',NULL,NULL,18,'-8570-8599-8641-',5,4,'toux-icon.png',NULL,0.0000,'1531615070',1,0.0000,0,'ZxRiWyybx500R3kC146yAPcwOb6YWcYgwN',0,0,NULL),(8659,8640,8599,8570,'13860129726','13860129726','清风','','d42214119836cb163157df4ea5199ae4','aee','d42214119836cb163157df4ea5199ae4','aee',0,1531486518,'101.226.225.86',1,1,'rmi4sv6qhqrdomji2mop2qdts6','0',NULL,NULL,18,'-8570-8599-8640-',5,4,'toux-icon.png',NULL,0.0000,'1531632016',1,0.0000,0,NULL,0,0,NULL),(8660,8640,8599,8570,'15159202351','15159202351','健康汇','','f6240eafd079fe872a1107b142915e87','89d','9ced2014ebb9c01637f80a177017b99c','89d',0,1531486893,'117.30.146.153',1,1,'7qmbdge48ne4jacr7rfgi5cpo0','0',NULL,NULL,18,'-8570-8599-8640-',5,4,'toux-icon.png',NULL,0.0000,'1531631834',1,0.0000,0,NULL,0,0,NULL),(8661,8617,8616,8615,'13860138087','13860138087','王彩辉','','ee496787fa795b56ec7ff0abff77f34a','b3d','4b77ca2dec016115cd1e3815d26035f9','b3d',0,1531491576,'61.151.178.170',1,1,NULL,'0',NULL,NULL,33,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-8616-8617-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8663,8644,8633,8599,'15959609055','15959609055','舍得','','a3c7f8749985010cf6ca5d54c533f452','cf0','d73f4c52c85beebe2e51af2b1f6c5f2a','cf0',0,1531523659,'113.96.219.248',1,1,'j8vdku2i82r06ucdak7iu95lp1','0',NULL,NULL,19,'-8570-8599-8633-8644-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8664,8640,8599,8570,'13123399626','13123399626','王淑萍','','e09fd1c4b1141b9057be8291781dac4d','ed9','9fcb827bdb167c426832f74b36eda9a3','ed9',0,1531533146,'211.97.128.87',1,1,NULL,'0',NULL,NULL,18,'-8570-8599-8640-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8665,8641,8599,8570,'13806023409','13806023409','刘备','','37b8864ad467cb3744a195cba107e1b3','94d','b2a3b7631b3bfd841fa089364b7753f6','94d',0,1531534321,'182.106.221.198',1,1,'6i3m044q91ukr7dva608eptmm1','0',NULL,NULL,18,'-8570-8599-8641-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8666,8643,8599,8570,'18605128901','18605128901','王慧','','f5165d678a0dc37cbaeeccc2c0465101','859','f138be7c42c2d79a6dba4edd39c83671','859',0,1531534372,'211.97.128.87',1,1,'oms349nkesonofl4hph52v4bd5','0',NULL,NULL,18,'-8570-8599-8643-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8667,8617,8616,8615,'18659203121','18659203121','员女','','473f2aa7c40d2bbc0f496b1829ee596e','c37','2580c6839cef49933dcdc8973dca3478','c37',0,1531534752,'117.30.141.85',1,1,NULL,'0',NULL,NULL,33,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-8616-8617-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8668,8634,8633,8599,'19906044067','19906044067','秀秀','','c7e410308ce98b16161d33151366af00','aa8','3d2921c001958966bf4e9c8a1990a360','aa8',0,1531543054,'140.243.218.60',1,1,'0o2qfkocgp98hkhjhmbdqbtf41','0',NULL,NULL,19,'-8570-8599-8633-8634-',5,4,'toux-icon.png',NULL,0.0000,'1531585644',1,0.0000,0,NULL,0,0,NULL),(8669,8668,8634,8633,'13960566789','13960566789','简单','','6c4053a7a73c229043b3158c3bfe0b92','505','76478eb5fceb14f8415666b5d4127a4e','94f',0,1531544074,'211.97.128.87',1,1,'3pv0c3n99soecubfau46m12k14','0',NULL,NULL,20,'-8570-8599-8633-8634-8668-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8670,8642,8599,8570,'15710617901','15710617901','周瑜打黄盖','','c43e5da4d561c0e699d5fd7dfad61b5e','cda','c43e5da4d561c0e699d5fd7dfad61b5e','cda',0,1531550925,'101.226.225.84',1,1,'4pals32q2ttn5prpckm8njlo23','0',NULL,NULL,18,'-8570-8599-8642-',5,4,'toux-icon.png',NULL,0.0000,'1531587324',1,0.0000,0,NULL,0,0,NULL),(8671,8647,8643,8599,'15985835218','15985835218','曾经','','c8961e904a08653a58ae3e48e103a4da','c6c','1158edf239cf8db1ec132002c0b1dc5b','c6c',0,1531551588,'61.151.178.171',1,1,'d9rmu3viotqae0sd3sknith4p6','0',NULL,NULL,19,'-8570-8599-8643-8647-',5,0,'toux-icon.png','陈景德',0.0000,'1',0,0.0000,0,'YQBy2wA36fYQhOPkdgYuXVgxygX2x4XRmw',0,0,NULL),(8672,8649,8642,8599,'13459219199','13459219199','永福0504','','252c1a4996d618695236a5cf2fcf6616','27a','b573ed849cb09df690ee5ee724d6693b','27a',0,1531553197,'223.104.6.49',1,1,'c7278rilncg39epuq3sf0ta8k0','0',NULL,NULL,19,'-8570-8599-8642-8649-',5,0,'toux-icon.png',NULL,0.0000,'1531615501',0,64.0000,0,NULL,0,0,NULL),(8673,8672,8649,8642,'13960226591','13960226591','周怡庭','','09c024f455ce200b153f0d45b7eb04f7','d61','9d4d2f80ef68100629a353c5ad01fb40','d61',0,1531553470,'223.104.6.61',1,1,'dl8n5pbimm41i1l62ksibv1a92','0',NULL,NULL,20,'-8570-8599-8642-8649-8672-',5,0,'toux-icon.png',NULL,0.0000,'1531615501',0,64.0000,0,NULL,0,0,NULL),(8674,8638,8632,8629,'13666956566','13666956566','官阳','','960aa3d5ddfb319734953c436621edd8','4e7','3abe1ed8d4b85f11d01aa928b3afda85','4e7',0,1531554572,'101.226.225.86',1,1,'r8n6medjod6pp02vhq4n58m902','0',NULL,NULL,25,'-8588-8621-8622-8623-8626-8627-8628-8629-8632-8638-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,'l4mvfUWU2XcOgC3jlQg3OkcXfd5fCzQAkb',0,0,NULL),(8690,8618,8617,8616,'13859956369','13859956369','郑贺王','','d33dd2feef3f497f35636431e72b740b','c30','a639f011354808f9893c4d59c56c6573','c30',0,1531586399,'61.151.207.252',1,1,'m18qolb22r1frn52ud6mksup37','0',NULL,NULL,34,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-8616-8617-8618-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,'ZAzBUld3OyhaUwzcUbOUAgT56Vu6hdz1Vm',0,0,NULL),(8675,8618,8617,8616,'18650138916','18650138916','张艺赢','','8a1c3430df140a00ddbedf084ae11b8e','b33','c12d382e73d2738e449debde69755493','b33',0,1531557280,'61.151.178.170',1,1,'e12v4r80iocsm2au1f25ce8fd0','0',NULL,NULL,34,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-8616-8617-8618-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8676,8641,8599,8570,'13600956691','13600956691','黄姐','','9cbb2583160054e4b2e49d6191edef35','e50','354f97ac8dddc410a3b4f1fc56bc6289','e50',0,1531557489,'117.136.38.128',1,1,'3ovdiv4t08ho0k88bm7gmhtnc7','0',NULL,NULL,18,'-8570-8599-8641-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8677,8675,8618,8617,'13055928196','13055928196','陈美芬','','100b37f6c7554934afe2aa3fc2ea12c0','a25','100b37f6c7554934afe2aa3fc2ea12c0','a25',0,1531557877,'223.166.151.237',1,1,'t7dsbajt3qu3sgdf0fknglq173','0',NULL,NULL,35,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-8616-8617-8618-8675-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8678,8658,8641,8599,'13606936024','13606936024','谢炳根','','687166148f9f08cb5f342559940101d1','93f','3885180b737fcef6fbeda9fe4bb5cfce','93f',0,1531557980,'61.151.179.27',1,1,'vu2cb08sotiiggc8ij781e5fm3','0',NULL,NULL,19,'-8570-8599-8641-8658-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8679,8673,8672,8649,'13459259057','13459259057','高笑','','60be8dace15fd9ac127cd775f1dcaf4b','071','d794155a6d34d5cf4dc43fb7b3d2b18e','071',0,1531558062,'223.104.6.61',1,1,'dl8n5pbimm41i1l62ksibv1a92','0',NULL,NULL,21,'-8570-8599-8642-8649-8672-8673-',5,4,'toux-icon.png',NULL,0.0000,'1531615236',1,0.0000,0,'6cuy2TlOwQfgde4khOw14ai0xQvhXiC32A',0,0,NULL),(8680,8632,8629,8628,'15606925288','15606925288','鱼人','','229a5c0549d96e2681847e361e7f20ec','879','229a5c0549d96e2681847e361e7f20ec','879',0,1531560040,'61.129.6.147',1,1,'qoks0c8jee8uuequ9eus4nvml0','0',NULL,NULL,24,'-8588-8621-8622-8623-8626-8627-8628-8629-8632-',5,4,'toux-icon.png',NULL,0.0000,'1531617942',1,0.0000,0,'R66N6jZVYZRXVUfVN12aAmhiVXRXvWWk0Q',0,0,NULL),(8681,8648,8643,8599,'15260215272','15260215272','yfj888','','4b10f0da11d68a47df29eaba95de4254','79a','b83cc6de0c2fa8dfb7a43904905ef7ac','79a',0,1531560145,'61.151.178.171',1,1,'c1jdjti8sg6h7189aimbc3rrp4','0',NULL,NULL,19,'-8570-8599-8643-8648-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8682,8632,8629,8628,'13559846704','13559846704','姜昕','','138f4d6d74742eb31455824ddd0963b6','6dd','b4eb2a9818ebb1660fae8adf6efb36af','6dd',0,1531561380,'117.30.147.28',1,1,'8pdok87jaiem9ojajshth40146','0',NULL,NULL,24,'-8588-8621-8622-8623-8626-8627-8628-8629-8632-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8683,8614,8613,8611,'13767155995','13767155995','童文秀','','6518c5b0e51ca8b221bf6ebadecd44b6','bf1','63e9d7d6850aadd14ac522eb28bd4e07','bf1',0,1531563269,'61.151.178.170',1,1,NULL,'0',NULL,NULL,30,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8684,8614,8613,8611,'13605922310','13605922310','百媚生','','451ff272f4a3e87d0912f5fbbbb74b80','680','bac2aedb8078a3e4ca58662f72116960','680',0,1531563738,'61.151.178.180',1,1,NULL,'0',NULL,NULL,30,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8685,8675,8618,8617,'15880203287','15880203287','李姐','','3986fbe0459fdcfbfda244482161c13a','795','3986fbe0459fdcfbfda244482161c13a','795',0,1531565348,'61.129.7.254',1,1,'beqmto4s0d2gdip33e56miv724','0',NULL,NULL,35,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-8616-8617-8618-8675-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8686,8685,8675,8618,'18030311391','18030311391','老羊','','b5d32a6523e1b1aea0441c28c2c4cbb6','d8c','b5d32a6523e1b1aea0441c28c2c4cbb6','d8c',0,1531565517,'61.129.6.78',1,1,'ig4ie7i5efpcqd7lbv3n51m2q1','0',NULL,NULL,36,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-8616-8617-8618-8675-8685-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8687,8648,8643,8599,'15359239785','15359239785','康熙','','5381ac8358d5d128333f57d68774237c','3db','32f752420fc7c56275a3c6ad194c8c6f','3db',0,1531571165,'101.226.225.86',1,1,'bnfjln9jejhaoklj8gd7oum5j0','0',NULL,NULL,19,'-8570-8599-8643-8648-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,'Yv2C2bDZxCS3ZBDZPuWvyeydD1ObaDf0ew',0,0,NULL),(8688,8614,8613,8611,'18850567806','18850567806','薛美女','','0aa0ac73addcee71351a6bc8457d0713','1ad','459ef370697f5ac63eb79353ed9b919f','1ad',0,1531575244,'61.151.178.180',1,1,NULL,'0',NULL,NULL,30,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8689,8641,8599,8570,'13950067421','13950067421','Lyh8888','','81c22804e86efde8aea63247c16ea64d','635','81c22804e86efde8aea63247c16ea64d','635',0,1531582214,'111.128.184.77',1,1,'he6d6q25okkm5vssdnk7to1l34','0',NULL,NULL,18,'-8570-8599-8641-',5,4,'toux-icon.png',NULL,0.0000,'1531663747',1,0.0000,0,'kChYhzd5XwSQC45RPg4SuNzVYQbwAzjNC6',0,0,NULL),(8691,8648,8643,8599,'13720872535','13720872535','绿叶对根的情意','','d6cf1b92b7b7aabc9e7fc512f9d213ac','59a','a476a4910583100906f8cf80c183dab1','59a',0,1531621589,'123.151.76.158',1,1,'9jdsvforu596v0ji3pqa3bld15','0',NULL,NULL,19,'-8570-8599-8643-8648-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8692,8644,8633,8599,'15080270077','15080270077','福鑫记','','90690b7b1ab7e2f4aede51a64437b89b','eb8','f4ac26e4bad166565b17c04113d1f7bb','eb8',0,1531624943,'61.129.8.203',1,1,'omsvke6mn5o7kcfsp1ophga3a2','0',NULL,NULL,19,'-8570-8599-8633-8644-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8693,8648,8643,8599,'13559249852','13559249852','源和联美','','734e7236e38a8765a06a298f18b9ab79','707','62610cc2fecfa02c9221650649fd0983','707',0,1531625478,'223.104.6.54',1,1,'p9fu6diqeih6eh7tomjp4vu572','0',NULL,NULL,19,'-8570-8599-8643-8648-',5,4,'toux-icon.png',NULL,0.8000,'1531634163',1,0.0000,0,'4Vlc03b2wfmhNA6BaAlDN1UfXkZjzv1D2e',0,0,NULL),(8694,8614,8613,8611,'18159281817','18159281817','阿宝哥','','a0dedacacfbdd17946631f6b01a7ffae','50f','e767008c13ac21ecd5fb8b8ee9d05751','50f',0,1531630979,'61.151.178.170',1,1,NULL,'0',NULL,NULL,30,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8695,8679,8673,8672,'17759287191','17759287191','阿福总','','152600132ede870e6b33afe5eaceec2d','d09','b5fc4fa0d38810e48558877c48e500c3','d09',0,1531631763,'223.104.6.11',1,1,'dl8n5pbimm41i1l62ksibv1a92','0',NULL,NULL,22,'-8570-8599-8642-8649-8672-8673-8679-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8696,8695,8679,8673,'18850062388','18850062388','李苏闽','','09f7f4facd413d3ea81663763ab03ae5','41b','09f7f4facd413d3ea81663763ab03ae5','41b',0,1531631993,'223.104.6.27',1,1,'fsagbogl16aqhvpvo9ir7jj4l3','0',NULL,NULL,23,'-8570-8599-8642-8649-8672-8673-8679-8695-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,'i4uicSefVgwBYORchRdjDD0iRjQyf4N0PQ',0,0,NULL),(8697,8634,8633,8599,'18649625296','18649625296','李秀秀','','a5f53404d9d544c1f0f2abb9e41599f3','5ed','bede0c07937900d56d0399d31968c481','5ed',0,1531633523,'110.87.114.31',1,1,'0o2qfkocgp98hkhjhmbdqbtf41','0',NULL,NULL,19,'-8570-8599-8633-8634-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8698,8648,8643,8599,'18217582356','18217582356','阿宾','','23e3c4f7cb54129c2a36af4aaa5a0759','a52','f89c24be94edd374dd1e48ce0d3cdec9','a52',0,1531633636,'140.243.59.50',1,1,'vap8s2g7mfndpblalrdggem0p1','0',NULL,NULL,19,'-8570-8599-8643-8648-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,'52BDRxOvTvucAaO5zj6VZWTfXczAuNbCZc',0,0,NULL),(8699,8634,8633,8599,'18060355599','18060355599','强哥','','e2795d1df2a64d97067df045dbf841be','e3b','e2795d1df2a64d97067df045dbf841be','e3b',0,1531634831,'101.226.225.84',1,1,'0dsfn41fjs9l0eon3idpr4kdm4','0',NULL,NULL,19,'-8570-8599-8633-8634-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,'XzfdkDZcBYbBxS1BXuRhviuuWBTe5kWuz5',0,0,NULL),(8700,8693,8648,8643,'18659206867','18659206867','源和联美','','b723e64e25c54415f3f70b3dee7c2edb','44d','4f0fd134525400cca63a4b6e10450f24','44d',0,1531635304,'61.151.179.27',1,1,'cld0g9gljcacaoiegmdpvh2gj3','0',NULL,NULL,20,'-8570-8599-8643-8648-8693-',5,4,'toux-icon.png',NULL,0.0000,'1531635621',1,0.0000,0,NULL,0,0,NULL),(8701,8613,8611,8610,'15860729495','15860729495','张祖华169','','59c5250b01bca9bd692059b04f3df115','9d6','4fd9a025188b8c5120222013728574f3','9d6',0,1531636447,'58.23.19.145',1,1,NULL,'0',NULL,NULL,29,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8702,8613,8611,8610,'17085858858','17085858858','张祖浩169','','98d86b2730e929a0caae4b99e859dbde','6df','c30b4cf9da7d4bc03a819e3f31288338','6df',0,1531636814,'61.151.178.170',1,1,NULL,'0',NULL,NULL,29,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8703,8632,8629,8628,'15059600581','15059600581','黄超滨','','335d8867a5f48093b6694971e3b6dc3c','431','44372c2cdca68e621473a022ff1066a3','431',0,1531638120,'223.104.6.19',1,1,'158n3sugfc2jolc7fae09npua6','0',NULL,NULL,24,'-8588-8621-8622-8623-8626-8627-8628-8629-8632-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8704,8618,8617,8616,'18059853580','18059853580','zzq5688','','8c9672fd48d55bf4599acebba8c73353','74f','f0caff1c32310fa8c7427ae215a80244','74f',0,1531639394,'61.151.180.39',1,1,'sa2d75gnf9js0uhmpcfl8houl0','0',NULL,NULL,34,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-8616-8617-8618-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,'hV0zXvaSOUN4jgUxVuWiQiDlvbZa1RDdyQ',0,0,NULL),(8705,8671,8647,8643,'15080303769','15080303769','成成','','1972738b85c632fc222c06f1c15e04a2','a5c','e9e50a744b055551d45c772cb383cf7d','a5c',0,1531640201,'117.135.170.150',1,1,'39m93ebpvhs3hhc0boh3ovggo2','0',NULL,NULL,20,'-8570-8599-8643-8647-8671-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8706,8603,8602,8601,'18759291096','18759291096','卓光兴166','','c7929b3ffd966ceaea95f67ea9f34ba9','f33','71992644dfb92c611d40c1865ae65425','f33',0,1531642369,'61.151.178.170',1,1,NULL,'0',NULL,NULL,20,'-8571-8600-8601-8602-8603-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8707,8603,8602,8601,'15959249821','15959249821','卓光兴168','','6197f28a83e1961953e9c67f31de0a37','71c','261920ef48ea0700a1b68c57fe270237','71c',0,1531642657,'61.151.178.170',1,1,NULL,'0',NULL,NULL,20,'-8571-8600-8601-8602-8603-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8708,8603,8602,8601,'17085858199','17085858199','厦门卓光兴','','37c50b7bfdd9f5727791188bd963bb36','6e6','f64e9d92af0fc6f8b62dc89746fa52af','6e6',0,1531643099,'61.151.178.170',1,1,NULL,'0',NULL,NULL,20,'-8571-8600-8601-8602-8603-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8709,8604,8603,8602,'18750282280','18750282280','郑新得','','99316b64956d2d6cb08a22866ab30b82','a1b','dafd6c5674ce0a88ac1b35c5b267c0ce','a1b',0,1531646882,'61.151.178.180',1,1,NULL,'0',NULL,NULL,21,'-8571-8600-8601-8602-8603-8604-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8710,8604,8603,8602,'17181111371','17181111371','老郑新得','','d522544db20bf11090da43d15aa40d0a','8d8','23faef2157b131c28b4925f21b33407e','8d8',0,1531647178,'58.247.212.75',1,1,NULL,'0',NULL,NULL,21,'-8571-8600-8601-8602-8603-8604-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8711,8675,8618,8617,'18850316141','18850316141','秋日传奇','','9f58e7cd9f6dc8c5936a6140ad835b11','3d5','ada4e02b0cb1c579b880afd86d5fc733','3d5',0,1531647433,'58.246.221.75',1,1,'0gg45sj1ns0e342jgvk3pm9fd4','0',NULL,NULL,35,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-8616-8617-8618-8675-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8712,8604,8603,8602,'15060770190','15060770190','卓光兴12','','7d9a54557d858b9fb774510805cc7381','237','df6700b2c1aea39dc8b5bd12de36d305','237',0,1531648229,'61.151.178.180',1,1,NULL,'0',NULL,NULL,21,'-8571-8600-8601-8602-8603-8604-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8713,8648,8643,8599,'17895992996','17895992996','蒲公英','','8ceda046ea15264fd7632f885554d024','3fc','5a825a466e2a18d4afb4fc79c4e4d1df','3fc',0,1531649413,'140.243.59.50',1,1,'kt0c7ksbomvp8dvkknstcvont5','0',NULL,NULL,19,'-8570-8599-8643-8648-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,'AfPjONO4NjuA2cjUQ5mO1O43Yh2Tw6Q62w',0,0,NULL),(8714,8618,8617,8616,'18965831447','18965831447','楚轩','','b76b7868b5d600b7eaa9cec957a67b6e','69f','84735a093d92e88fa4195bc943273364','69f',0,1531652627,'14.116.133.169',1,1,'mfbldqimafnabs1228ufpn7m22','0',NULL,NULL,34,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-8616-8617-8618-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8715,8604,8603,8602,'18559227711','18559227711','曾亮199','','c2cb68396200ff10902bf446e91253a1','ac3','95e62c4f6b503b7cf3aca7931159248f','ac3',0,1531654012,'61.151.178.180',1,1,NULL,'0',NULL,NULL,21,'-8571-8600-8601-8602-8603-8604-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8716,8605,8604,8603,'13559256126','13559256126','曾亮琦','','14c5d66006c24126ef8af1e1772ef55c','be7','35c57916475197847b265d63403972ad','be7',0,1531654322,'61.151.178.170',1,1,NULL,'0',NULL,NULL,22,'-8571-8600-8601-8602-8603-8604-8605-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8717,8714,8618,8617,'13004953133','13004953133','潘薪逢','','7e442927894caa9be52fa13caa5770a5','eef','b684032831b61fc1df05f09bd42eb90a','eef',0,1531654707,'61.129.6.147',1,1,'a1f9oti56528u8iggnaai37sf4','0',NULL,NULL,35,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-8611-8613-8614-8615-8616-8617-8618-8714-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8718,8605,8604,8603,'15860723205','15860723205','王星','','d21943e2b0064715f5e634ac6eb3050f','a27','e60eee02d24328f2c2ac157be98cfbb7','a27',0,1531657750,'61.151.178.170',1,1,NULL,'0',NULL,NULL,22,'-8571-8600-8601-8602-8603-8604-8605-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8719,8705,8671,8647,'13684158897','13684158897','汇聚力量','','1bed6ca91ca3804dd675fa98594adbfe','2d3','7121222ad5ae50b13eec970e9a83c075','2d3',0,1531660176,'182.131.11.251',1,1,'f4lt522lgdp11p48gs3rr5jq96','0',NULL,NULL,21,'-8570-8599-8643-8647-8671-8705-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8720,8624,8572,0,'17605074999','17605074999','健健','','b013927b324d20f14fbaabd846f00cf1','96e','e78095ce80648a1b8e7ab0afb97f926f','96e',0,1531661058,'61.129.7.217',1,1,'o3fsm78dhbtp148ni03diohte6','0',NULL,NULL,17,'-8572-8624-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8721,8632,8629,8628,'15888620118','15888620118','Jeff','','57c4a3a8fd2dc25dd18cdec59a6a6c2d','d65','a4177b9535f81912f1178ada5da9e8ba','d65',0,1531661290,'183.149.74.95',1,1,'fnlbm54vmgf4khd1v7pkhoglo3','0',NULL,NULL,24,'-8588-8621-8622-8623-8626-8627-8628-8629-8632-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8722,8610,8609,8608,'15659265806','15659265806','陈永超现','','29da687d128a495239a695ef6137a525','f85','f33ba0414b077583d76dc037af76ca20','f85',0,1531662002,'61.151.178.170',1,1,NULL,'0',NULL,NULL,27,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8723,8610,8609,8608,'18850301218','18850301218','陈永华','','597fffdbe8bf0437b9b6b4168bb76475','b7e','dd730c3fe95afbd8a9bd2a8e240b6199','b7e',0,1531662349,'223.104.6.15',1,1,NULL,'0',NULL,NULL,27,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8724,8610,8609,8608,'15980874275','15980874275','童超168','','e36eb84d87e4232898c893a1c4848bdc','eb1','29bd111597a2c22e052698a5b3e4238b','eb1',0,1531664968,'61.151.178.170',1,1,NULL,'0',NULL,NULL,27,'-8571-8600-8601-8602-8603-8604-8605-8606-8607-8608-8609-8610-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL),(8725,8670,8642,8599,'18860050558','18860050558','杨丕渊','','2dbfd6c8ea409018ef2e526364aa498e','b16','3c0c953921ba991c1285e8820f98be58','b16',0,1531665251,'183.253.38.223',1,1,'a7oms93h9n439mr1ujvkfdbcc3','0',NULL,NULL,19,'-8570-8599-8642-8670-',5,0,'toux-icon.png',NULL,0.0000,'1',0,0.0000,0,NULL,0,0,NULL);
/*!40000 ALTER TABLE `ysk_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_user_action`
--

DROP TABLE IF EXISTS `ysk_user_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_user_action` (
  `ua_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(40) NOT NULL COMMENT 'frontend,backend',
  `user_id` int(11) NOT NULL,
  `uname` varchar(40) NOT NULL COMMENT '用户名',
  `add_time` varchar(40) NOT NULL COMMENT '加入时间',
  `info` varchar(255) NOT NULL COMMENT '行为描述',
  PRIMARY KEY (`ua_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=233 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户行为';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_user_action`
--

LOCK TABLES `ysk_user_action` WRITE;
/*!40000 ALTER TABLE `ysk_user_action` DISABLE KEYS */;
INSERT INTO `ysk_user_action` VALUES (207,'后台系统用户',1,'admin','2018-06-17 18:09:56','登录了后台系统'),(208,'后台系统用户',1,'admin','2018-06-17 21:18:20','登录了后台系统'),(209,'后台系统用户',1,'admin','2018-06-19 09:51:33','登录了后台系统'),(210,'后台系统用户',1,'admin','2018-06-19 10:56:10','登录了后台系统'),(211,'后台系统用户',1,'admin','2018-06-19 16:52:35','登录了后台系统'),(212,'后台系统用户',1,'admin','2018-06-19 16:52:38','登录了后台系统'),(213,'后台系统用户',1,'admin','2018-06-20 16:04:45','登录了后台系统'),(214,'后台系统用户',1,'admin','2018-06-20 16:56:41','登录了后台系统'),(215,'后台系统用户',1,'admin','2018-06-20 17:46:56','登录了后台系统'),(216,'后台系统用户',1,'admin','2018-06-20 18:17:50','登录了后台系统'),(217,'后台系统用户',1,'admin','2018-06-20 19:05:45','登录了后台系统'),(218,'后台系统用户',1,'admin','2018-06-21 15:16:20','登录了后台系统'),(219,'后台系统用户',1,'admin','2018-06-21 16:21:08','登录了后台系统'),(220,'后台系统用户',1,'admin','2018-06-22 18:53:48','登录了后台系统'),(221,'后台系统用户',1,'admin','2018-06-22 18:53:56','登录了后台系统'),(222,'后台系统用户',1,'admin','2018-06-22 19:01:46','登录了后台系统'),(223,'后台系统用户',1,'admin','2018-06-22 19:37:44','登录了后台系统'),(224,'后台系统用户',1,'admin','2018-06-23 14:46:44','登录了后台系统'),(225,'后台系统用户',1,'admin','2018-06-25 09:59:30','登录了后台系统'),(226,'后台系统用户',1,'admin','2018-06-26 10:07:24','登录了后台系统'),(227,'后台系统用户',1,'admin','2018-06-26 18:03:01','登录了后台系统'),(228,'后台系统用户',1,'admin','2018-06-26 18:58:17','登录了后台系统'),(229,'后台系统用户',1,'admin','2018-07-06 14:44:26','登录了后台系统'),(230,'后台系统用户',1,'admin','2018-07-09 17:58:44','登录了后台系统'),(231,'后台系统用户',1,'admin','2018-07-10 13:08:28','登录了后台系统'),(232,'后台系统用户',1,'admin','2018-07-11 21:29:25','登录了后台系统');
/*!40000 ALTER TABLE `ysk_user_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_user_caimi`
--

DROP TABLE IF EXISTS `ysk_user_caimi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_user_caimi` (
  `uid` int(11) unsigned NOT NULL COMMENT '采蜜表',
  `num` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `datestr` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_user_caimi`
--

LOCK TABLES `ysk_user_caimi` WRITE;
/*!40000 ALTER TABLE `ysk_user_caimi` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_user_caimi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_user_copy`
--

DROP TABLE IF EXISTS `ysk_user_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_user_copy` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL COMMENT '上级ID',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '上上级ID',
  `ggid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上上上级ID',
  `account` char(20) NOT NULL DEFAULT '0' COMMENT '用户账号',
  `mobile` char(20) NOT NULL COMMENT '用户手机号',
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `safety_pwd` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '安全密码',
  `safety_salt` char(5) CHARACTER SET latin1 NOT NULL,
  `login_pwd` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `login_salt` char(3) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-女 1-男',
  `reg_date` int(11) NOT NULL COMMENT '注册时间',
  `reg_ip` varchar(20) NOT NULL COMMENT '注册IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户锁定  1 不锁  0拉黑  -1 删除',
  `activate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否激活 1-已激活 0-未激活',
  `session_id` varchar(225) DEFAULT NULL,
  `wx_no` varchar(20) DEFAULT '0' COMMENT '微信',
  `alipay` varchar(20) DEFAULT NULL,
  `note` text,
  `deep` int(11) NOT NULL DEFAULT '0',
  `path` text,
  `user_credit` int(11) NOT NULL DEFAULT '5' COMMENT '用户星级',
  `use_grade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `img_head` varchar(100) NOT NULL DEFAULT 'toux-icon.png' COMMENT '用户头像',
  `bank_uname` varchar(20) NOT NULL COMMENT '开户名',
  `releas_rate` float(10,4) NOT NULL DEFAULT '0.0000' COMMENT '增加的释放率',
  `releas_time` char(40) NOT NULL DEFAULT '1' COMMENT '释放时间',
  `is_reward` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0->默认未领取奖金,1->已经领取积分释放',
  `today_releas` float(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '今日释放率',
  `is_dailishang` tinyint(1) NOT NULL DEFAULT '0' COMMENT '2->商家',
  `wallet_add` text NOT NULL COMMENT '个人钱包地址',
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  UNIQUE KEY `account` (`account`) USING BTREE,
  KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4064 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_user_copy`
--

LOCK TABLES `ysk_user_copy` WRITE;
/*!40000 ALTER TABLE `ysk_user_copy` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_user_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_user_dogeat`
--

DROP TABLE IF EXISTS `ysk_user_dogeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_user_dogeat` (
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(11) NOT NULL COMMENT '总种子数量',
  `create_time` int(11) NOT NULL,
  `datestr` varchar(11) NOT NULL DEFAULT '0.00' COMMENT '扣除手续费后的数量',
  PRIMARY KEY (`uid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_user_dogeat`
--

LOCK TABLES `ysk_user_dogeat` WRITE;
/*!40000 ALTER TABLE `ysk_user_dogeat` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_user_dogeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_user_huafei`
--

DROP TABLE IF EXISTS `ysk_user_huafei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_user_huafei` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户每天产生的化肥',
  `huafei_num` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当天产生的肥料',
  `datestr` char(20) CHARACTER SET utf16 NOT NULL DEFAULT '',
  `uid_str` varchar(255) NOT NULL DEFAULT '',
  `pid_caimi` int(11) NOT NULL DEFAULT '0' COMMENT '一级采蜜',
  `gid_caimi` int(11) NOT NULL DEFAULT '0' COMMENT '二级采蜜',
  `ggid_caimi` int(11) NOT NULL DEFAULT '0' COMMENT '三级采蜜',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_user_huafei`
--

LOCK TABLES `ysk_user_huafei` WRITE;
/*!40000 ALTER TABLE `ysk_user_huafei` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_user_huafei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_user_level`
--

DROP TABLE IF EXISTS `ysk_user_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_user_level` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID   用户等级表',
  `nongfu_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '农夫',
  `zangao_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '藏獒数量 1-小狗 2-中狗 3-大狗',
  `mao_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '猫',
  `land_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '种树数量',
  `sell_num` int(11) NOT NULL DEFAULT '0' COMMENT '出售次数',
  `buy_num` int(11) NOT NULL DEFAULT '0' COMMENT '出售数量',
  `children_num` int(11) NOT NULL DEFAULT '0' COMMENT '用户直推人数',
  `ji_num` int(11) NOT NULL DEFAULT '0' COMMENT '鸡',
  `niao_num` int(11) NOT NULL DEFAULT '0' COMMENT '鸟',
  `user_level` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_user_level`
--

LOCK TABLES `ysk_user_level` WRITE;
/*!40000 ALTER TABLE `ysk_user_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_user_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_user_seed`
--

DROP TABLE IF EXISTS `ysk_user_seed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_user_seed` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户种子',
  `zhongzi_num` decimal(11,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_user_seed`
--

LOCK TABLES `ysk_user_seed` WRITE;
/*!40000 ALTER TABLE `ysk_user_seed` DISABLE KEYS */;
INSERT INTO `ysk_user_seed` VALUES (1,0.00);
/*!40000 ALTER TABLE `ysk_user_seed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_user_tool_month`
--

DROP TABLE IF EXISTS `ysk_user_tool_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_user_tool_month` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户种子',
  `oneclick` int(11) NOT NULL DEFAULT '0',
  `buy_oneclick_time` int(11) NOT NULL DEFAULT '0',
  `end_oneclick_time` int(11) NOT NULL,
  `dogfood` int(11) NOT NULL COMMENT '狗粮',
  `buy_dogfood_time` int(11) NOT NULL DEFAULT '0',
  `end_dogfood_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_user_tool_month`
--

LOCK TABLES `ysk_user_tool_month` WRITE;
/*!40000 ALTER TABLE `ysk_user_tool_month` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_user_tool_month` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_verify_list`
--

DROP TABLE IF EXISTS `ysk_verify_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_verify_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '认证列表',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `account` varchar(64) NOT NULL COMMENT '账号',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '认证类型 1个人 2企业',
  `realname` varchar(64) NOT NULL COMMENT '真实姓名',
  `idcard` varchar(64) NOT NULL COMMENT '身份证号',
  `phone` varchar(15) NOT NULL COMMENT '手机号码',
  `up_idcard` varchar(128) DEFAULT NULL COMMENT '身份证正面',
  `down_idcard` varchar(128) DEFAULT NULL COMMENT '身份证反面',
  `hand_idcard` varchar(128) DEFAULT NULL COMMENT '手持身份证',
  `licence` varchar(128) DEFAULT NULL COMMENT '营业执照',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0未审核 1已通过审核 2未通过审核',
  `time` varchar(12) NOT NULL COMMENT '申请时间',
  `datestr` varchar(12) NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_verify_list`
--

LOCK TABLES `ysk_verify_list` WRITE;
/*!40000 ALTER TABLE `ysk_verify_list` DISABLE KEYS */;
INSERT INTO `ysk_verify_list` VALUES (43,3060,'13728686350','多多',1,'牛玉淑','430528198107135889','13728686350','/Uploads/image/shop/2018-04-24/5ade9bc779eae.jpg','/Uploads/image/shop/2018-04-24/5ade9bc784afc.jpg',NULL,NULL,2,'1524538311','20180424'),(42,1710,'15170788825','定时',2,'速度更','360731199106230088','15170788829',NULL,NULL,'/Uploads/image/shop/2018-04-21/5adb33764df1d.png','/Uploads/image/shop/2018-04-21/5adb33764efb6.png',1,'1524314998','20180421'),(36,1710,'15170788825','定时',1,'是大法官','360731199106230055','15170788824','/Uploads/image/shop/2018-04-21/5adb2d5810d0f.png','/Uploads/image/shop/2018-04-21/5adb2d58121ff.jpg',NULL,NULL,2,'1524313432','20180421'),(41,1710,'15170788825','定时',1,'东方红','360731199106230077','15170788828','/Uploads/image/shop/2018-04-21/5adb335cca048.JPG','/Uploads/image/shop/2018-04-21/5adb335ccb11c.png',NULL,NULL,1,'1524314972','20180421'),(38,1710,'15170788825','定时',2,'法国','360731199106230088','15170788829',NULL,NULL,'/Uploads/image/shop/2018-04-21/5adb2d9d10a7c.JPG','/Uploads/image/shop/2018-04-21/5adb2d9d11f20.jpg',2,'1524313501','20180421'),(39,1710,'15170788825','定时',1,'速度更','360731199106230055','15170788824','/Uploads/image/shop/2018-04-21/5adb2e865df94.png','/Uploads/image/shop/2018-04-21/5adb2e865ecb0.png',NULL,NULL,2,'1524313734','20180421'),(44,1715,'13243824326','Heres',2,'gsadhg','360731199106230055','15170788825','/Uploads/image/shop/2018-04-26/5ae1b696253b7.png','/Uploads/image/shop/2018-04-26/5ae1b6962b7fd.png','/Uploads/image/shop/2018-04-26/5ae1b6962d52b.png','/Uploads/image/shop/2018-04-26/5ae1b6962f3a0.png',1,'1524741782','20180426'),(45,5163,'13574158038','lzc8899',1,'廖仲常','430124196511058399','13574158038','/Uploads/image/shop/2018-05-29/5b0cdaa40b606.jpg','/Uploads/image/shop/2018-05-29/5b0cdaa40da75.jpg',NULL,NULL,0,'1527569060','20180529'),(46,5878,'13684898397','陈钢山',1,'陈钢山','360313196409170011','13684898397','/Uploads/image/shop/2018-05-29/5b0cf44d0c038.jpg','/Uploads/image/shop/2018-05-29/5b0cf44d19aeb.jpg',NULL,NULL,0,'1527575629','20180529'),(47,5747,'18871487589','拼博',1,'商银','420117198710176340','18871487589','/Uploads/image/shop/2018-05-29/5b0d1671b9472.jpg','/Uploads/image/shop/2018-05-29/5b0d1671ba92a.jpg',NULL,NULL,0,'1527584369','20180529'),(48,4184,'13517375551','刘芳华',1,'刘芳华','432322195503150879','13517375551','/Uploads/image/shop/2018-05-29/5b0d4a2413773.jpg','/Uploads/image/shop/2018-05-29/5b0d4a2418434.jpg',NULL,NULL,0,'1527597604','20180529'),(49,5874,'15854096590','秀林',1,'孔秀林','372901196510280654','15854096590','/Uploads/image/shop/2018-05-30/5b0d8ec297f16.jpg','/Uploads/image/shop/2018-05-30/5b0d8ec29912e.jpg',NULL,NULL,0,'1527615170','20180530'),(50,5892,'18173121063','王朝公益基金',2,'周顺华','432625196111269424','18173121063',NULL,NULL,'/Uploads/image/shop/2018-05-30/5b0d959326955.jpg','/Uploads/image/shop/2018-05-30/5b0d959327d8d.jpg',0,'1527616915','20180530'),(51,4125,'13977209588','ycj999',1,'朱','412722199402133513','13478987503','/Uploads/image/shop/2018-06-15/5b234e7d928d5.jpg','/Uploads/image/shop/2018-06-15/5b234e7d92dc9.jpg',NULL,NULL,1,'1529040509','20180615'),(52,8537,'18300693527','董雄飞',2,'dongxongfei','411282199507142811','18300693527',NULL,NULL,'/Uploads/image/shop/2018-06-15/5b235db3011ba.jpg','/Uploads/image/shop/2018-06-15/5b235db3015e2.jpg',0,'1529044403','20180615'),(53,4125,'13977209588','ycj999',1,'朱','412722199402133513','13478987503','/Uploads/image/shop/2018-06-15/5b2360358042d.jpg','/Uploads/image/shop/2018-06-15/5b236035806d4.jpg',NULL,NULL,1,'1529045045','20180615'),(54,8539,'15824876380','魔女',1,'0111','411522199601196322','17596528302','/Uploads/image/shop/2018-06-15/5b23625b0dab2.jpg','/Uploads/image/shop/2018-06-15/5b23625b0dc32.jpg',NULL,NULL,1,'1529045595','20180615'),(55,8553,'17791517166','张杰',1,'张杰','688888888888888888','17791517166','/Uploads/image/shop/2018-06-18/5b27bc87c8afb.jpg','/Uploads/image/shop/2018-06-18/5b27bc87c92a1.jpg',NULL,NULL,1,'1529330823','20180618'),(56,8545,'13478987503','小猪',1,'xiaozhu','412722199502133513','13478987503','/Uploads/image/shop/2018-06-21/5b2b04b991e71.jpg','/Uploads/image/shop/2018-06-21/5b2b04b9920c2.jpg',NULL,NULL,1,'1529545913','20180621');
/*!40000 ALTER TABLE `ysk_verify_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_wbao_detail`
--

DROP TABLE IF EXISTS `ysk_wbao_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_wbao_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '每个人账户对应币',
  `num` decimal(11,4) NOT NULL DEFAULT '0.0000' COMMENT '对应币数量',
  `dprice` decimal(10,4) DEFAULT NULL COMMENT '对应的会员id',
  `tprice` decimal(10,4) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `crowds_id` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1转出，2转入,3释放',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=56914 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_wbao_detail`
--

LOCK TABLES `ysk_wbao_detail` WRITE;
/*!40000 ALTER TABLE `ysk_wbao_detail` DISABLE KEYS */;
INSERT INTO `ysk_wbao_detail` VALUES (56612,0.0000,0.0000,0.0000,1531405842,8600,0,3),(56613,0.0000,0.0000,0.0000,1531405842,8600,0,4),(56614,0.0000,0.0000,0.0000,1531405896,8601,0,3),(56615,0.0000,0.0000,0.0000,1531405896,8601,0,4),(56616,0.0000,0.0000,0.0000,1531410234,8602,0,3),(56617,0.0000,0.0000,0.0000,1531410234,8602,0,4),(56618,0.0000,0.0000,0.0000,1531410277,8616,0,3),(56619,0.0000,0.0000,0.0000,1531410277,8616,0,4),(56620,0.0000,0.0000,0.0000,1531410444,8604,0,3),(56621,0.0000,0.0000,0.0000,1531410444,8604,0,4),(56622,0.0000,0.0000,0.0000,1531410623,8606,0,3),(56623,0.0000,0.0000,0.0000,1531410623,8606,0,4),(56624,0.0000,0.0000,0.0000,1531410661,8607,0,3),(56625,0.0000,0.0000,0.0000,1531410661,8607,0,4),(56626,0.0000,0.0000,0.0000,1531410708,8608,0,3),(56627,0.0000,0.0000,0.0000,1531410708,8608,0,4),(56628,0.0000,0.0000,0.0000,1531410752,8609,0,3),(56629,0.0000,0.0000,0.0000,1531410752,8609,0,4),(56630,0.0000,0.0000,0.0000,1531410802,8610,0,3),(56631,0.0000,0.0000,0.0000,1531410802,8610,0,4),(56632,0.0000,0.0000,0.0000,1531410840,8611,0,3),(56633,0.0000,0.0000,0.0000,1531410840,8611,0,4),(56634,0.0000,0.0000,0.0000,1531410894,8613,0,3),(56635,0.0000,0.0000,0.0000,1531410894,8613,0,4),(56636,0.0000,0.0000,0.0000,1531410971,8615,0,3),(56637,0.0000,0.0000,0.0000,1531410971,8615,0,4),(56638,0.0000,0.0000,0.0000,1531411063,8617,0,3),(56639,0.0000,0.0000,0.0000,1531411063,8617,0,4),(56640,0.0000,0.0000,0.0000,1531411119,8618,0,3),(56641,0.0000,0.0000,0.0000,1531411119,8618,0,4),(56642,0.0000,0.0000,0.0000,1531411207,8616,0,3),(56643,0.0000,0.0000,0.0000,1531411207,8616,0,4),(56644,0.0000,0.0000,0.0000,1531411503,8600,0,3),(56645,0.0000,0.0000,0.0000,1531411503,8600,0,4),(56646,0.0000,0.0000,0.0000,1531411732,8617,0,3),(56647,0.0000,0.0000,0.0000,1531411732,8617,0,4),(56648,0.0000,0.0000,0.0000,1531411778,8618,0,3),(56649,0.0000,0.0000,0.0000,1531411778,8618,0,4),(56650,0.0000,0.0000,0.0000,1531411827,8614,0,3),(56651,0.0000,0.0000,0.0000,1531411827,8614,0,4),(56652,0.0000,0.0000,0.0000,1531412095,8613,0,3),(56653,0.0000,0.0000,0.0000,1531412095,8613,0,4),(56654,0.0000,0.0000,0.0000,1531412135,8612,0,3),(56655,0.0000,0.0000,0.0000,1531412135,8612,0,4),(56656,0.0000,0.0000,0.0000,1531412160,8611,0,3),(56657,0.0000,0.0000,0.0000,1531412160,8611,0,4),(56658,0.0000,0.0000,0.0000,1531412173,8610,0,3),(56659,0.0000,0.0000,0.0000,1531412173,8610,0,4),(56660,0.0000,0.0000,0.0000,1531412189,8609,0,3),(56661,0.0000,0.0000,0.0000,1531412189,8609,0,4),(56662,0.0000,0.0000,0.0000,1531412201,8608,0,3),(56663,0.0000,0.0000,0.0000,1531412201,8608,0,4),(56664,0.0000,0.0000,0.0000,1531412212,8607,0,3),(56665,0.0000,0.0000,0.0000,1531412212,8607,0,4),(56666,0.0000,0.0000,0.0000,1531412221,8606,0,3),(56667,0.0000,0.0000,0.0000,1531412221,8606,0,4),(56668,0.0000,0.0000,0.0000,1531412230,8605,0,3),(56669,0.0000,0.0000,0.0000,1531412230,8605,0,4),(56670,0.0000,0.0000,0.0000,1531412240,8604,0,3),(56671,0.0000,0.0000,0.0000,1531412240,8604,0,4),(56672,0.0000,0.0000,0.0000,1531412248,8603,0,3),(56673,0.0000,0.0000,0.0000,1531412248,8603,0,4),(56674,0.0000,0.0000,0.0000,1531412268,8602,0,3),(56675,0.0000,0.0000,0.0000,1531412268,8602,0,4),(56676,0.0000,0.0000,0.0000,1531412301,8601,0,3),(56677,0.0000,0.0000,0.0000,1531412301,8601,0,4),(56678,0.0000,0.0000,0.0000,1531465962,8630,0,3),(56679,0.0000,0.0000,0.0000,1531465962,8630,0,4),(56680,0.0000,0.0000,0.0000,1531469336,8621,0,3),(56681,0.0000,0.0000,0.0000,1531469336,8621,0,4),(56682,0.0000,0.0000,0.0000,1531471085,8622,0,3),(56683,0.0000,0.0000,0.0000,1531471085,8622,0,4),(56684,0.0000,0.0000,0.0000,1531471115,8623,0,3),(56685,0.0000,0.0000,0.0000,1531471115,8623,0,4),(56686,0.0000,0.0000,0.0000,1531471506,8626,0,3),(56687,0.0000,0.0000,0.0000,1531471506,8626,0,4),(56688,0.0000,0.0000,0.0000,1531471541,8627,0,3),(56689,0.0000,0.0000,0.0000,1531471541,8627,0,4),(56690,0.0000,0.0000,0.0000,1531471572,8628,0,3),(56691,0.0000,0.0000,0.0000,1531471572,8628,0,4),(56692,0.0000,0.0000,0.0000,1531471620,8629,0,3),(56693,0.0000,0.0000,0.0000,1531471620,8629,0,4),(56694,0.0000,0.0000,0.0000,1531472397,8615,0,3),(56695,0.0000,0.0000,0.0000,1531472397,8615,0,4),(56696,0.0000,0.0000,0.0000,1531477817,8632,0,3),(56697,0.0000,0.0000,0.0000,1531477817,8632,0,4),(56698,0.0000,0.0000,0.0000,1531478424,8645,0,3),(56699,0.0000,0.0000,0.0000,1531478424,8645,0,4),(56700,0.0000,0.0000,0.0000,1531485458,8599,0,3),(56701,0.0000,0.0000,0.0000,1531485458,8599,0,4),(56702,0.0000,0.0000,0.0000,1531497935,8621,0,3),(56703,0.0000,0.0000,0.0000,1531497935,8621,0,4),(56704,0.0000,0.0000,0.0000,1531498316,8632,0,3),(56705,0.0000,0.0000,0.0000,1531498316,8632,0,4),(56706,0.0000,0.0000,0.0000,1531498387,8617,0,3),(56707,0.0000,0.0000,0.0000,1531498387,8617,0,4),(56708,0.0000,0.0000,0.0000,1531498766,8599,0,3),(56709,0.0000,0.0000,0.0000,1531498766,8599,0,4),(56710,0.0000,0.0000,0.0000,1531500511,8601,0,3),(56711,0.0000,0.0000,0.0000,1531500511,8601,0,4),(56712,0.0000,0.0000,0.0000,1531519185,8635,0,3),(56713,0.0000,0.0000,0.0000,1531519185,8635,0,4),(56714,0.0000,0.0000,0.0000,1531523187,8647,0,3),(56715,0.0000,0.0000,0.0000,1531523187,8647,0,4),(56716,0.0000,0.0000,0.0000,1531523490,8644,0,3),(56717,0.0000,0.0000,0.0000,1531523490,8644,0,4),(56718,0.0000,0.0000,0.0000,1531525170,8658,0,3),(56719,0.0000,0.0000,0.0000,1531525170,8658,0,4),(56720,0.0000,0.0000,0.0000,1531528550,8643,0,3),(56721,0.0000,0.0000,0.0000,1531528550,8643,0,4),(56722,0.0000,0.0000,0.0000,1531531960,8654,0,3),(56723,0.0000,0.0000,0.0000,1531531960,8654,0,4),(56724,0.0000,0.0000,0.0000,1531532872,8642,0,3),(56725,0.0000,0.0000,0.0000,1531532872,8642,0,4),(56726,0.0000,0.0000,0.0000,1531532942,8646,0,3),(56727,0.0000,0.0000,0.0000,1531532942,8646,0,4),(56728,0.0000,0.0000,0.0000,1531533314,8634,0,3),(56729,0.0000,0.0000,0.0000,1531533314,8634,0,4),(56730,0.0000,0.0000,0.0000,1531533547,8640,0,3),(56731,0.0000,0.0000,0.0000,1531533547,8640,0,4),(56732,0.0000,0.0000,0.0000,1531533614,8641,0,3),(56733,0.0000,0.0000,0.0000,1531533614,8641,0,4),(56734,0.0000,0.0000,0.0000,1531533686,8633,0,3),(56735,0.0000,0.0000,0.0000,1531533686,8633,0,4),(56736,0.0000,0.0000,0.0000,1531533975,8618,0,3),(56737,0.0000,0.0000,0.0000,1531533975,8618,0,4),(56738,0.0000,0.0000,0.0000,1531533976,8649,0,3),(56739,0.0000,0.0000,0.0000,1531533976,8649,0,4),(56740,0.0000,0.0000,0.0000,1531534657,8657,0,3),(56741,0.0000,0.0000,0.0000,1531534657,8657,0,4),(56742,0.0000,0.0000,0.0000,1531535659,8655,0,3),(56743,0.0000,0.0000,0.0000,1531535659,8655,0,4),(56744,0.0000,0.0000,0.0000,1531536562,8648,0,3),(56745,0.0000,0.0000,0.0000,1531536562,8648,0,4),(56746,0.0000,0.0000,0.0000,1531551095,8670,0,3),(56747,0.0000,0.0000,0.0000,1531551095,8670,0,4),(56748,0.0000,0.0000,0.0000,1531552053,8630,0,3),(56749,0.0000,0.0000,0.0000,1531552053,8630,0,4),(56750,0.0000,0.0000,0.0000,1531552184,8629,0,3),(56751,0.0000,0.0000,0.0000,1531552184,8629,0,4),(56752,0.0000,0.0000,0.0000,1531552454,8638,0,3),(56753,0.0000,0.0000,0.0000,1531552454,8638,0,4),(56754,0.0000,0.0000,0.0000,1531553072,8645,0,3),(56755,0.0000,0.0000,0.0000,1531553072,8645,0,4),(56756,0.0000,0.0000,0.0000,1531553540,8631,0,3),(56757,0.0000,0.0000,0.0000,1531553540,8631,0,4),(56758,0.0000,0.0000,0.0000,1531556043,8628,0,3),(56759,0.0000,0.0000,0.0000,1531556043,8628,0,4),(56760,0.0000,0.0000,0.0000,1531558238,8662,0,3),(56761,0.0000,0.0000,0.0000,1531558238,8662,0,4),(56762,0.0000,0.0000,0.0000,1531560494,8651,0,3),(56763,0.0000,0.0000,0.0000,1531560494,8651,0,4),(56764,0.0000,0.0000,0.0000,1531561322,8680,0,3),(56765,0.0000,0.0000,0.0000,1531561322,8680,0,4),(56766,0.0000,0.0000,0.0000,1531562407,8616,0,3),(56767,0.0000,0.0000,0.0000,1531562407,8616,0,4),(56768,0.0000,0.0000,0.0000,1531562448,8614,0,3),(56769,0.0000,0.0000,0.0000,1531562448,8614,0,4),(56770,0.0000,0.0000,0.0000,1531582324,8600,0,3),(56771,0.0000,0.0000,0.0000,1531582324,8600,0,4),(56772,0.0000,0.0000,0.0000,1531582340,8602,0,3),(56773,0.0000,0.0000,0.0000,1531582340,8602,0,4),(56774,0.0000,0.0000,0.0000,1531582350,8603,0,3),(56775,0.0000,0.0000,0.0000,1531582350,8603,0,4),(56776,0.0000,0.0000,0.0000,1531582688,8604,0,3),(56777,0.0000,0.0000,0.0000,1531582688,8604,0,4),(56778,0.0000,0.0000,0.0000,1531582699,8605,0,3),(56779,0.0000,0.0000,0.0000,1531582699,8605,0,4),(56780,0.0000,0.0000,0.0000,1531582709,8606,0,3),(56781,0.0000,0.0000,0.0000,1531582709,8606,0,4),(56782,0.0000,0.0000,0.0000,1531582719,8607,0,3),(56783,0.0000,0.0000,0.0000,1531582719,8607,0,4),(56784,0.0000,0.0000,0.0000,1531582731,8608,0,3),(56785,0.0000,0.0000,0.0000,1531582731,8608,0,4),(56786,0.0000,0.0000,0.0000,1531582741,8609,0,3),(56787,0.0000,0.0000,0.0000,1531582741,8609,0,4),(56788,0.0000,0.0000,0.0000,1531582751,8610,0,3),(56789,0.0000,0.0000,0.0000,1531582751,8610,0,4),(56790,0.0000,0.0000,0.0000,1531582760,8611,0,3),(56791,0.0000,0.0000,0.0000,1531582760,8611,0,4),(56792,0.0000,0.0000,0.0000,1531582771,8612,0,3),(56793,0.0000,0.0000,0.0000,1531582771,8612,0,4),(56794,0.0000,0.0000,0.0000,1531582781,8613,0,3),(56795,0.0000,0.0000,0.0000,1531582781,8613,0,4),(56796,0.0000,0.0000,0.0000,1531582868,8615,0,3),(56797,0.0000,0.0000,0.0000,1531582868,8615,0,4),(56798,0.0000,0.0000,0.0000,1531584242,8644,0,3),(56799,0.0000,0.0000,0.0000,1531584242,8644,0,4),(56800,0.0000,0.0000,0.0000,1531584496,8651,0,3),(56801,0.0000,0.0000,0.0000,1531584496,8651,0,4),(56802,0.0000,0.0000,0.0000,1531584652,8599,0,3),(56803,0.0000,0.0000,0.0000,1531584652,8599,0,4),(56804,0.0000,0.0000,0.0000,1531584743,8641,0,3),(56805,0.0000,0.0000,0.0000,1531584743,8641,0,4),(56806,0.0000,0.0000,0.0000,1531584778,8649,0,3),(56807,0.0000,0.0000,0.0000,1531584778,8649,0,4),(56808,0.0000,0.0000,0.0000,1531584783,8655,0,3),(56809,0.0000,0.0000,0.0000,1531584783,8655,0,4),(56810,0.0000,0.0000,0.0000,1531584831,8650,0,3),(56811,0.0000,0.0000,0.0000,1531584831,8650,0,4),(56812,0.0000,0.0000,0.0000,1531584878,8634,0,3),(56813,0.0000,0.0000,0.0000,1531584878,8634,0,4),(56814,0.0000,0.0000,0.0000,1531585644,8668,0,3),(56815,0.0000,0.0000,0.0000,1531585644,8668,0,4),(56816,0.0000,0.0000,0.0000,1531585916,8648,0,3),(56817,0.0000,0.0000,0.0000,1531585916,8648,0,4),(56818,0.0000,0.0000,0.0000,1531586160,8646,0,3),(56819,0.0000,0.0000,0.0000,1531586160,8646,0,4),(56820,0.0000,0.0000,0.0000,1531586243,8615,0,3),(56821,0.0000,0.0000,0.0000,1531586243,8615,0,4),(56822,0.0000,0.0000,0.0000,1531586262,8618,0,3),(56823,0.0000,0.0000,0.0000,1531586262,8618,0,4),(56824,0.0000,0.0000,0.0000,1531587324,8670,0,3),(56825,0.0000,0.0000,0.0000,1531587324,8670,0,4),(56826,0.0000,0.0000,0.0000,1531588306,8632,0,3),(56827,0.0000,0.0000,0.0000,1531588306,8632,0,4),(56828,0.0000,0.0000,0.0000,1531588999,8662,0,3),(56829,0.0000,0.0000,0.0000,1531588999,8662,0,4),(56830,0.0000,0.0000,0.0000,1531606151,8647,0,3),(56831,0.0000,0.0000,0.0000,1531606151,8647,0,4),(56832,0.0000,0.0000,0.0000,1531609984,8621,0,3),(56833,0.0000,0.0000,0.0000,1531609984,8621,0,4),(56834,0.0000,0.0000,0.0000,1531610100,8629,0,3),(56835,0.0000,0.0000,0.0000,1531610100,8629,0,4),(56836,0.0000,0.0000,0.0000,1531612517,8630,0,3),(56837,0.0000,0.0000,0.0000,1531612517,8630,0,4),(56838,0.0000,0.0000,0.0000,1531615070,8658,0,3),(56839,0.0000,0.0000,0.0000,1531615070,8658,0,4),(56840,0.0000,0.0000,0.0000,1531615236,8679,0,3),(56841,0.0000,0.0000,0.0000,1531615236,8679,0,4),(56842,0.0000,0.0000,0.0000,1531615343,8628,0,3),(56843,0.0000,0.0000,0.0000,1531615343,8628,0,4),(56844,0.0000,0.0000,0.0000,1531615609,8635,0,3),(56845,0.0000,0.0000,0.0000,1531615609,8635,0,4),(56846,0.0000,0.0000,0.0000,1531616543,8616,0,3),(56847,0.0000,0.0000,0.0000,1531616543,8616,0,4),(56848,0.0000,0.0000,0.0000,1531616556,8614,0,3),(56849,0.0000,0.0000,0.0000,1531616556,8614,0,4),(56850,0.0000,0.0000,0.0000,1531616565,8613,0,3),(56851,0.0000,0.0000,0.0000,1531616565,8613,0,4),(56852,0.0000,0.0000,0.0000,1531616574,8612,0,3),(56853,0.0000,0.0000,0.0000,1531616574,8612,0,4),(56854,0.0000,0.0000,0.0000,1531616582,8611,0,3),(56855,0.0000,0.0000,0.0000,1531616582,8611,0,4),(56856,0.0000,0.0000,0.0000,1531616592,8610,0,3),(56857,0.0000,0.0000,0.0000,1531616592,8610,0,4),(56858,0.0000,0.0000,0.0000,1531616607,8609,0,3),(56859,0.0000,0.0000,0.0000,1531616607,8609,0,4),(56860,0.0000,0.0000,0.0000,1531616625,8608,0,3),(56861,0.0000,0.0000,0.0000,1531616625,8608,0,4),(56862,0.0000,0.0000,0.0000,1531616636,8607,0,3),(56863,0.0000,0.0000,0.0000,1531616636,8607,0,4),(56864,0.0000,0.0000,0.0000,1531616645,8606,0,3),(56865,0.0000,0.0000,0.0000,1531616645,8606,0,4),(56866,0.0000,0.0000,0.0000,1531616653,8605,0,3),(56867,0.0000,0.0000,0.0000,1531616653,8605,0,4),(56868,0.0000,0.0000,0.0000,1531616662,8604,0,3),(56869,0.0000,0.0000,0.0000,1531616662,8604,0,4),(56870,0.0000,0.0000,0.0000,1531616672,8603,0,3),(56871,0.0000,0.0000,0.0000,1531616672,8603,0,4),(56872,0.0000,0.0000,0.0000,1531616680,8602,0,3),(56873,0.0000,0.0000,0.0000,1531616680,8602,0,4),(56874,0.0000,0.0000,0.0000,1531616703,8600,0,3),(56875,0.0000,0.0000,0.0000,1531616703,8600,0,4),(56876,0.0000,0.0000,0.0000,1531616722,8601,0,3),(56877,0.0000,0.0000,0.0000,1531616722,8601,0,4),(56878,0.0000,0.0000,0.0000,1531617942,8680,0,3),(56879,0.0000,0.0000,0.0000,1531617942,8680,0,4),(56880,0.0000,0.0000,0.0000,1531621654,8617,0,3),(56881,0.0000,0.0000,0.0000,1531621654,8617,0,4),(56882,0.0000,0.0000,0.0000,1531628093,8633,0,3),(56883,0.0000,0.0000,0.0000,1531628093,8633,0,4),(56884,0.0000,0.0000,0.0000,1531628410,8640,0,3),(56885,0.0000,0.0000,0.0000,1531628410,8640,0,4),(56886,0.0000,0.0000,0.0000,1531628524,8643,0,3),(56887,0.0000,0.0000,0.0000,1531628524,8643,0,4),(56888,0.0000,0.0000,0.0000,1531628700,8642,0,3),(56889,0.0000,0.0000,0.0000,1531628700,8642,0,4),(56890,0.0000,0.0000,0.0000,1531631834,8660,0,3),(56891,0.0000,0.0000,0.0000,1531631834,8660,0,4),(56892,0.0000,0.0000,0.0000,1531632016,8659,0,3),(56893,0.0000,0.0000,0.0000,1531632016,8659,0,4),(56894,0.0000,0.0000,0.0000,1531632886,8654,0,3),(56895,0.0000,0.0000,0.0000,1531632886,8654,0,4),(56896,0.0000,0.0000,0.0000,1531634163,8693,0,3),(56897,0.0000,0.0000,0.0000,1531634163,8693,0,4),(56898,0.0000,0.0000,0.0000,1531634290,8639,0,3),(56899,0.0000,0.0000,0.0000,1531634290,8639,0,4),(56900,0.0000,0.0000,0.0000,1531635621,8700,0,3),(56901,0.0000,0.0000,0.0000,1531635621,8700,0,4),(56902,0.0000,0.0000,0.0000,1531639767,8631,0,3),(56903,0.0000,0.0000,0.0000,1531639767,8631,0,4),(56904,0.0000,0.0000,0.0000,1531646766,8645,0,3),(56905,0.0000,0.0000,0.0000,1531646766,8645,0,4),(56906,0.0000,0.0000,0.0000,1531647302,8638,0,3),(56907,0.0000,0.0000,0.0000,1531647302,8638,0,4),(56908,0.0000,0.0000,0.0000,1531648483,8657,0,3),(56909,0.0000,0.0000,0.0000,1531648483,8657,0,4),(56910,0.0000,0.0000,0.0000,1531661837,8624,0,3),(56911,0.0000,0.0000,0.0000,1531661837,8624,0,4),(56912,0.0000,0.0000,0.0000,1531663747,8689,0,3),(56913,0.0000,0.0000,0.0000,1531663747,8689,0,4);
/*!40000 ALTER TABLE `ysk_wbao_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_wentype`
--

DROP TABLE IF EXISTS `ysk_wentype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_wentype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `title` varchar(255) NOT NULL COMMENT '类型名称',
  `addtime` varchar(222) NOT NULL COMMENT '增加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_wentype`
--

LOCK TABLES `ysk_wentype` WRITE;
/*!40000 ALTER TABLE `ysk_wentype` DISABLE KEYS */;
INSERT INTO `ysk_wentype` VALUES (3,'帮助中心','1515470302'),(4,'商城介绍','1515470316'),(5,'介绍','1515470332'),(6,'联系客服','1515850423');
/*!40000 ALTER TABLE `ysk_wentype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_wenzhang`
--

DROP TABLE IF EXISTS `ysk_wenzhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_wenzhang` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) NOT NULL COMMENT '栏目',
  `content` text NOT NULL COMMENT '内容',
  `addtime` varchar(233) NOT NULL COMMENT '上传时间',
  `type` varchar(255) NOT NULL COMMENT '类型',
  `tid` int(22) NOT NULL COMMENT '类型id',
  `linkone` varchar(222) DEFAULT NULL COMMENT '视频连接',
  `linktwo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_wenzhang`
--

LOCK TABLES `ysk_wenzhang` WRITE;
/*!40000 ALTER TABLE `ysk_wenzhang` DISABLE KEYS */;
INSERT INTO `ysk_wenzhang` VALUES (4,'介绍','&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c298596437.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29a988376.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29ba53e13.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29cf97db9.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29db5ddad.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29e86fa24.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c29f55f22b.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a061f5f8.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a131a4cf.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a2657711.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a3328797.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a3f2799c.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a4ac3451.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a5613335.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a62d490b.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a7235fa6.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a7d53f6a.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a89b24df.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-15/5a5c2a94c10e3.jpg&quot; style=&quot;margin:0 auto&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay是一个全面开放的网络支付平台，跟支付宝和微信一样，不同的是，Vpay是基于区块链技术开发的，能顺利实现点对点跨境转账，而且没有任何手续费。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay数字资产总量是多少？&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;Vpay数字资产总量3.65亿&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;如何查询Vpay数字资产开源代码？&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;查询Vpay数字资产开源代码的方法&lt;br /&gt;\r\n第一步，打开百度搜索&amp;ldquo;比特币钱包&amp;rdquo;&lt;br /&gt;\r\n第二步，点击&amp;ldquo;比特币钱包官网下载&amp;rdquo;&lt;br /&gt;\r\n第三步，找到&amp;quot;bitcoin&amp;quot;，点击&amp;ldquo;源代码&amp;rdquo;,这时候我们将跳转到一个国际查询开源代码的网站，&amp;ldquo;github.com&amp;quot;，并显示出来了比特币的开源代码&lt;br /&gt;\r\n第四步，点击左上角的&amp;ldquo;黑白猫&amp;rdquo;图像，回到首页&lt;br /&gt;\r\n第五步，在右上角的灰色框输入&amp;ldquo;Vpay&amp;quot;按回车键&lt;br /&gt;\r\n第六步，把搜索内容拉到最下面，我们就可以看到Vpay的开源代码了，这里还可以直接下载Vpay的PC冷钱包。&lt;br /&gt;\r\nPS：我们也可以直接访问&amp;ldquo;github.com&amp;quot;查找开源代码。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234)&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay运营模式是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;大家都知道，想打造一个全球的跨境支付平台！首要条件是要有大量的粉丝！没有人认可你的东西，就一文不值，跟当初的支付宝一样，几年前，放几百块在里面都怕不见了，到了现在，在支付宝里面十万，百万的人，大有人在吧！&lt;/p&gt;\r\n\r\n&lt;p&gt;既然作为全球支付软件，首先要考虑汇率的问题，Vpay采取区链块技术支持实时人民币，美元，欧元，英镑，日元&amp;hellip;&amp;hellip;等多币种实时兑换功能，秒到，且无损！&lt;/p&gt;\r\n\r\n&lt;p&gt;如何实现汇率之间恒定的问题，那我们需要一个媒介！就是数字资产，现阶段对接的是瑞波币的价格！实现各币种之间的兑换！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay是虚拟货币吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;显而易见，像我们的比特币，采取的是物理挖矿的方式进行挖矿，你的币根本没有挖矿功能，肯定是假的数字资产！&lt;/p&gt;\r\n\r\n&lt;p&gt;我们的Vpay数字资产总量恒定3.65亿，是一个开源的虚拟货币，VpayLabs预挖1000万作为种子资产，用于市场推广和团队激励，剩余3.55亿Vpay数字资产用流通算力挖矿，通过用户参与流通挖矿的方式，让所有用户持有Vpay数字资产，最终达到完全去中心化。或许有人会问，国家现在都关停虚拟币交易平台了！个人的理解是这是个好事，有监管，才可以更好的发展！国家鼓励互联网金融的百花齐放，但是前提是所有脱离是实体经济的互联网金融只是理想中的空中楼阁，是一定要取缔的！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay核心价值观是？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay核心价值观：流通产生价值&lt;br /&gt;\r\n流通：A转账给B的过程为流通&lt;br /&gt;\r\n增值：人与人第一次流通，系统赠送相应的积分，这个也可以说是我们的数字资产，人的价值进行挖矿！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;每天红包封顶吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;每天红包任你点，上不封顶。&lt;br /&gt;\r\nVpay无国界支付&lt;br /&gt;\r\n投多少送600%米：&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投1米6米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投10米60米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投100米600米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投1000米6000米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投10000米60000米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投20000米送120000&lt;br /&gt;\r\n1米起投，上不封顶&lt;br /&gt;\r\n按积分2&amp;permil;每天分红&lt;br /&gt;\r\n今天投米，明天分米&lt;br /&gt;\r\n每天可以提现，点对点交易！ 动态2&amp;permil;～2%～10%推广越多，释放越快&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay几个特性是？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;一：符合六大标准&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1去中心化&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2去中央账户&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3点对点交易&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4有序的进出&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5投资自由&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;6风险自控&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;二：有效规避5大风险&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1政策风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2金流风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3推广风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4网络风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5人脉风险&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;三：符合数字货币的5大属性&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1开源代码&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2恒量发行&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3独立钱包&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4大盘交易&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5商业运用&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay的八大优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;1.拆分(原始发行1000万)&lt;br /&gt;\r\n2.互助(买进卖出点对点匹配打款)&lt;br /&gt;\r\n3.分红(每天最底2&amp;permil;释放)&lt;br /&gt;\r\n4.复利(放大倍增)&lt;br /&gt;\r\n5.虚拟币(区块链挖矿机制)&lt;br /&gt;\r\n6.数字资产(低进高出炒币)&lt;br /&gt;\r\n7.资产证券化(最高释放完再复投)&lt;br /&gt;\r\n8.消费返利（落地商家扫码支付）&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;为什么说Vpay有拆分优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay类似拆分盘，发行原始股1000万，经过市场的繁荣也进行稳定&amp;ldquo;拆分&amp;rdquo;，但Vpay又跟拆分盘不同，基本上所有拆分盘都要半年、一年甚至一年半才能回本，而Vpay投资当天就可以回本80%，最重要的一点是，Vpay对所有的做付出做动态的人很公平，能力越强，分享越多越快，拆得越快。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;为什么说Vpay有互助盘的高利息和良好体验，却没有互助盘的高风险？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay的静态利息可以达到每天1.2%，比国3等互助盘的利息还要高，Vpay也没有排单币、激活码的成本。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;为什么说Vpay有全返优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay不但全返而且返还的速度更快更多，不到3个月就可以回本，回本后还可以继续返还，永不出局。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay有投资门槛吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay就不存在在投资门槛的问题，有钱你可以投10块100块，甚至10万都可以投，钱少些你就投资10块钱，一包烟钱，一单停车费都可以当作一份投资。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;静态怎么赚钱？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;每天1％100天回本，不复投的情况下，你可以选择对冲，或者平台挂卖，对冲，赠送80%积分，平台挂卖不赠送积分，但是你的积分只增不减，所以说，100天到本金收回，接下来的都是赚的，一年撬动3.65倍增值，复投就的话那就更加有魅力了！&lt;/p&gt;\r\n\r\n&lt;p&gt;拥有1万积分=日薪20左右月薪600左右 年薪7200&lt;br /&gt;\r\n拥有5万积分=日薪100左右 月薪3000左右 年薪3.6万&lt;br /&gt;\r\n拥有10万积分=日薪200左右 月薪6000左右 年薪7.2万&lt;br /&gt;\r\n拥有50万积分=日薪1000左右 月薪3万左右 年薪36万&lt;br /&gt;\r\n拥有100万积分=日薪2000左右 月薪6万左右 年薪72万&lt;br /&gt;\r\n拥有500万积分=日薪1万左右 月薪30万左右 年薪360万&lt;br /&gt;\r\n拥有1000万积分=日薪2万左右月薪60万左右 年薪720万&lt;br /&gt;\r\n拥有5000万积分=日薪10万左右 月薪300万左右 年薪3600万&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;动态怎么赚钱？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;动态，直推人数越多越好，你的第一层越多，意味着你15代以内更多，以你为下，后面进来的市场都会加速你的流通，不设任何奖励制度，重点就是加速你的释放速度，市场流通足够快的情况下，最快可以一天释放1%-10%-100%，把原来的100天回本缩短到最快，可能就是几天，Vpay就是这么玩&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay更独特的地方是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;没有资金流，我们的资金自己说了算，相当于自己当老板，没有三级分销，其实他就是一个虚拟货币，我们推广市场，只是作为一个虚拟货币的推广着，不伤人脉，不用担心关网跑路，当你市场有人进入时候再一次加速你的释放速度，专业点来说，我们投资相当于买了一台矿机，推广相当于增加我们的算力。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;Vpay有投资风险吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;市场上所有项目基本上都有政策风险，只要是多层次分销、拉人头的、开公司的运营的，这些都是ZF的重点关注对象， Vpay在各地都有运营中心，在柬埔寨有，香港有，越南有，韩国有，日本有。Vpay没有直推奖，没有对碰奖，没有领导奖，没有管理奖，没有三级分销，没有多层次分销，更不需要拉人头所以不存在人脉风险，只需要流通就能产生价值，就能赚钱，关键是收益还不低，合情合理合法。&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n','2018-06-15 10:14:40','介绍',5,'http://player.youku.com/embed/XMzE0NTM4MDIwMA==','http://player.youku.com/embed/XMzE3MjkxOTAzNg=='),(5,'问题','&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay是一个全面开放的网络支付平台，跟支付宝和微信一样，不同的是，Vpay是基于区块链技术开发的，能顺利实现点对点跨境转账，而且没有任何手续费。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay数字资产总量是多少？&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;Vpay数字资产总量3.65亿&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 如何查询Vpay数字资产开源代码？&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;查询Vpay数字资产开源代码的方法&lt;br /&gt;\r\n第一步，打开百度搜索&amp;ldquo;比特币钱包&amp;rdquo;&lt;br /&gt;\r\n第二步，点击&amp;ldquo;比特币钱包官网下载&amp;rdquo;&lt;br /&gt;\r\n第三步，找到&amp;quot;bitcoin&amp;quot;，点击&amp;ldquo;源代码&amp;rdquo;,这时候我们将跳转到一个国际查询开源代码的网站，&amp;ldquo;github.com&amp;quot;，并显示出来了比特币的开源代码&lt;br /&gt;\r\n第四步，点击左上角的&amp;ldquo;黑白猫&amp;rdquo;图像，回到首页&lt;br /&gt;\r\n第五步，在右上角的灰色框输入&amp;ldquo;Vpay&amp;quot;按回车键&lt;br /&gt;\r\n第六步，把搜索内容拉到最下面，我们就可以看到Vpay的开源代码了，这里还可以直接下载Vpay的PC冷钱包。&lt;br /&gt;\r\nPS：我们也可以直接访问&amp;ldquo;github.com&amp;quot;查找开源代码。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay运营模式是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;\r\n\r\n&lt;p&gt;大家都知道，想打造一个全球的跨境支付平台！首要条件是要有大量的粉丝！没有人认可你的东西，就一文不值，跟当初的支付宝一样，几年前，放几百块在里面都怕不见了，到了现在，在支付宝里面十万，百万的人，大有人在吧！&lt;/p&gt;\r\n\r\n&lt;p&gt;既然作为全球支付软件，首先要考虑汇率的问题，Vpay采取区链块技术支持实时人民币，美元，欧元，英镑，日元&amp;hellip;&amp;hellip;等多币种实时兑换功能，秒到，且无损！&lt;/p&gt;\r\n\r\n&lt;p&gt;如何实现汇率之间恒定的问题，那我们需要一个媒介！就是数字资产，现阶段对接的是瑞波币的价格！实现各币种之间的兑换！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay是虚拟货币吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;显而易见，像我们的比特币，采取的是物理挖矿的方式进行挖矿，你的币根本没有挖矿功能，肯定是假的数字资产！&lt;/p&gt;\r\n\r\n&lt;p&gt;我们的Vpay数字资产总量恒定3.65亿，是一个开源的虚拟货币，VpayLabs预挖1000万作为种子资产，用于市场推广和团队激励，剩余3.55亿Vpay数字资产用流通算力挖矿，通过用户参与流通挖矿的方式，让所有用户持有Vpay数字资产，最终达到完全去中心化。或许有人会问，国家现在都关停虚拟币交易平台了！个人的理解是这是个好事，有监管，才可以更好的发展！国家鼓励互联网金融的百花齐放，但是前提是所有脱离是实体经济的互联网金融只是理想中的空中楼阁，是一定要取缔的！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay核心价值观是？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay核心价值观：流通产生价值&lt;br /&gt;\r\n流通：A转账给B的过程为流通&lt;br /&gt;\r\n增值：人与人第一次流通，系统赠送相应的积分，这个也可以说是我们的数字资产，人的价值进行挖矿！&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 每天红包封顶吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;每天红包任你点，上不封顶。&lt;br /&gt;\r\nVpay无国界支付&lt;br /&gt;\r\n投多少送600%米：&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投1米6米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投10米60米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投100米600米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投1000米6000米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投10000米60000米&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;投20000米送120000&lt;br /&gt;\r\n1米起投，上不封顶&lt;br /&gt;\r\n按积分2&amp;permil;每天分红&lt;br /&gt;\r\n今天投米，明天分米&lt;br /&gt;\r\n每天可以提现，点对点交易！ 动态2&amp;permil;～2%～10%推广越多，释放越快&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay几个特性是？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;一：符合六大标准&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1去中心化&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2去中央账户&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3点对点交易&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4有序的进出&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5投资自由&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;6风险自控&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;二：有效规避5大风险&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1政策风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2金流风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3推广风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4网络风险&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5人脉风险&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;三：符合数字货币的5大属性&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1开源代码&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2恒量发行&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3独立钱包&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4大盘交易&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5商业运用&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay的八大优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;1.拆分(原始发行1000万)&lt;br /&gt;\r\n2.互助(买进卖出点对点匹配打款)&lt;br /&gt;\r\n3.分红(每天最底2&amp;permil;释放)&lt;br /&gt;\r\n4.复利(放大倍增)&lt;br /&gt;\r\n5.虚拟币(区块链挖矿机制)&lt;br /&gt;\r\n6.数字资产(低进高出炒币)&lt;br /&gt;\r\n7.资产证券化(最高释放完再复投)&lt;br /&gt;\r\n8.消费返利（落地商家扫码支付）&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 为什么说Vpay有拆分优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay类似拆分盘，发行原始股1000万，经过市场的繁荣也进行稳定&amp;ldquo;拆分&amp;rdquo;，但Vpay又跟拆分盘不同，基本上所有拆分盘都要半年、一年甚至一年半才能回本，而Vpay投资当天就可以回本80%，最重要的一点是，Vpay对所有的做付出做动态的人很公平，能力越强，分享越多越快，拆得越快。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 为什么说Vpay有互助盘的高利息和良好体验，却没有互助盘的高风险？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay的静态利息可以达到每天1.2%，比国3等互助盘的利息还要高，Vpay也没有排单币、激活码的成本。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 为什么说Vpay有全返优势？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay不但全返而且返还的速度更快更多，不到3个月就可以回本，回本后还可以继续返还，永不出局。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay有投资门槛吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;Vpay就不存在在投资门槛的问题，有钱你可以投10块100块，甚至10万都可以投，钱少些你就投资10块钱，一包烟钱，一单停车费都可以当作一份投资。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 静态怎么赚钱？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;每天1％100天回本，不复投的情况下，你可以选择对冲，或者平台挂卖，对冲，赠送80%积分，平台挂卖不赠送积分，但是你的积分只增不减，所以说，100天到本金收回，接下来的都是赚的，一年撬动3.65倍增值，复投就的话那就更加有魅力了！&lt;/p&gt;\r\n\r\n&lt;p&gt;拥有1万积分=日薪20左右月薪600左右 年薪7200&lt;br /&gt;\r\n拥有5万积分=日薪100左右 月薪3000左右 年薪3.6万&lt;br /&gt;\r\n拥有10万积分=日薪200左右 月薪6000左右 年薪7.2万&lt;br /&gt;\r\n拥有50万积分=日薪1000左右 月薪3万左右 年薪36万&lt;br /&gt;\r\n拥有100万积分=日薪2000左右 月薪6万左右 年薪72万&lt;br /&gt;\r\n拥有500万积分=日薪1万左右 月薪30万左右 年薪360万&lt;br /&gt;\r\n拥有1000万积分=日薪2万左右月薪60万左右 年薪720万&lt;br /&gt;\r\n拥有5000万积分=日薪10万左右 月薪300万左右 年薪3600万&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; 动态怎么赚钱？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;动态，直推人数越多越好，你的第一层越多，意味着你15代以内更多，以你为下，后面进来的市场都会加速你的流通，不设任何奖励制度，重点就是加速你的释放速度，市场流通足够快的情况下，最快可以一天释放1%-10%-100%，把原来的100天回本缩短到最快，可能就是几天，Vpay就是这么玩&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay更独特的地方是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;没有资金流，我们的资金自己说了算，相当于自己当老板，没有三级分销，其实他就是一个虚拟货币，我们推广市场，只是作为一个虚拟货币的推广着，不伤人脉，不用担心关网跑路，当你市场有人进入时候再一次加速你的释放速度，专业点来说，我们投资相当于买了一台矿机，推广相当于增加我们的算力。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt; Vpay有投资风险吗？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;市场上所有项目基本上都有政策风险，只要是多层次分销、拉人头的、开公司的运营的，这些都是ZF的重点关注对象， Vpay在各地都有运营中心，在柬埔寨有，香港有，越南有，韩国有，日本有。Vpay没有直推奖，没有对碰奖，没有领导奖，没有管理奖，没有三级分销，没有多层次分销，更不需要拉人头所以不存在人脉风险，只需要流通就能产生价值，就能赚钱，关键是收益还不低，合情合理合法。&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n','2018-04-20 18:20:15','帮助中心',3,'',''),(6,'商城介绍','&lt;p&gt;&amp;nbsp; 马克.米诺先生创办Vpay的精髓，就是流通产生价值，商城落地是加速实践Vpay全球支付的应用，让入驻商家和消费者通过Vpay数字资产更紧密联系，加速互动，加速流通，加速增值财富，倍增财富。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; 商城所有的商品均接受Vpay余额支付，是一个可以全部接受数字资产流通、购物的综合性商城，为倡导实现人类金融自由理念并付之行动的马克.米诺先生致敬。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; 商城所有商品都禁止高于市场价，每个商家的进驻会经过严格的审核，确保产品是正品，一经发现假冒伪劣的现象，将取消商家的入驻资格并协助消费者追回合法权益。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;h3&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#A52A2A&quot;&gt;消费者在Vpay商城的消费将得到的两项主要消费红利&lt;/span&gt;：&lt;/strong&gt;&lt;/span&gt;&lt;/h3&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;&lt;strong&gt;A&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt; &lt;/span&gt;&lt;/span&gt;如果您是拥有Vpay电子钱包的消费者，您选好商品支付时用您的Vpay余额可直接扫商家的Vpay收款二维码支付，支付成功后你Vpay钱包里的的积分会增加你消费额的80%，然后按每天2&amp;permil;返回到余额账户里，几乎等于免费购买了产品，感受到无痛消费带来的轻松惬意。&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&amp;nbsp;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;B&lt;/span&gt;&lt;/span&gt; &lt;/strong&gt;如果您是现金付款购买的消费者，商家会赠送给您一个Vpay电子钱包，商家会让利一部分充值到您的电子钱包余额里，兑换成积分后，按积分总数的2&amp;permil;以每天红包形式返回到余额账户里，以消费多少返还多少为执行原则。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; &amp;nbsp;总之，所有消费者在Vpay商城，可以做到&amp;ldquo;花本来该花的钱，赚意想不到的财富！&amp;rdquo;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;h3&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:#B22222&quot;&gt;入驻商家在Vpay商城的财富之路&lt;/span&gt;：&lt;/strong&gt;&lt;/span&gt;&lt;/h3&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:20px&quot;&gt;&amp;nbsp;A&lt;/span&gt;&lt;/strong&gt; &lt;/span&gt;全球的Vpay粉丝借助公司的平台，快速地产生庞大而有实力的消费群体，粉丝们使用Vpay余额购买是无痛消费，只要喜欢就尽情买买买，购买力强大。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;&lt;strong&gt;B&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt; 当非Vpay余额购买时，商家收到的是现金，赠送给客户一个Vpay电子钱包， 商家只要让利20%转入到客户的电子钱包余额中，通过平台的杠杆作用，让客户达到消费多少返还多少，客户花出去的钱还能在不太长的时间里返回来，加上因为是商家让利赠送的，客户当然也乐意接受。&lt;/p&gt;\r\n\r\n&lt;p&gt;因此，商家既可以赚到八折价里的利润，同时多了一个Vpay客户，客户在Vpay钱包里获益了就有参与推广的可能性，从而形成商家Vpay事业的良性循环，一段时间积累下来，就会有不断的持续的市场被动收入，最终达成财务自由目标！&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:20px&quot;&gt;C &lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;商家也可以推荐其他商家入驻Vpay商城，你可以获得商城的广告费，重要的是你推荐的商家如果是你的Vpay事业伙伴，他延伸的Vpay客户在消费、流通都会加速您的奖金释放，这应该是长期的可观的财富。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:20px&quot;&gt;&lt;strong&gt;D&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt; Vpay全球支付的应用，让入驻商家和消费者通过Vpay钱包有了更紧密联系，入驻商家与商家有更广泛的合作，每一个在Vpay商城的参与者都将得到双赢或多赢的结果，前进的步伐不可阻挡！&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&amp;nbsp;&lt;strong&gt;&lt;span style=&quot;font-size:18px&quot;&gt;趋势大于优势！&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;h6&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&amp;nbsp;Vpay商城 ，为您生活添色彩！&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/h6&gt;\r\n','2018-02-02 22:11:54','商城介绍',4,'',''),(13,'联系客服','&lt;h1 style=&quot;text-align:justify&quot;&gt;温馨提示&lt;/h1&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;您要充值的信息要准确填写Vpay账号；注册时的昵称；手机号码和充值金额。&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;有必要时请及时联系客服专员。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-22/5a6563438f695.jpeg&quot; style=&quot;height:164px; width:162px&quot; /&gt;&lt;/p&gt;\r\n','2018-01-22 12:14:20','联系客服',6,'','');
/*!40000 ALTER TABLE `ysk_wenzhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_wetrans`
--

DROP TABLE IF EXISTS `ysk_wetrans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_wetrans` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_id` int(10) NOT NULL COMMENT '支付的会员',
  `get_id` int(10) NOT NULL COMMENT '收到转账用户id',
  `get_nums` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '转账总金额',
  `get_time` char(30) NOT NULL DEFAULT '0' COMMENT '转账时间',
  `get_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '转账币种',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_wetrans`
--

LOCK TABLES `ysk_wetrans` WRITE;
/*!40000 ALTER TABLE `ysk_wetrans` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_wetrans` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-15 23:41:36
