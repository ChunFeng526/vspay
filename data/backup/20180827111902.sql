-- MySQL database dump
-- 主机: 
-- 生成日期: 2018 年  08 月 27 日 11:19
-- MySQL版本: 
-- PHP 版本: 5.5.38
-- 数据库: `youhui`
-- ---------------------------------------------------------
-- 表的结构nc_admin
--
DROP TABLE IF EXISTS `nc_admin`;
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

--
-- 转存表中的数据 nc_admin

INSERT INTO `nc_admin` VALUES('1','admin','','','admin@admin.com','MDAwMDAwMDAwMIuNg9fHiGhntKaacw','1088','163.125.49.74','','1470304751','1535259182','1');
--
-- 表的结构nc_menu
--
DROP TABLE IF EXISTS `nc_menu`;
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

--
-- 转存表中的数据 nc_menu

INSERT INTO `nc_menu` VALUES('1','0','系统信息','','icon-book','7');
INSERT INTO `nc_menu` VALUES('29','28','商品管理','Goods/index','','2');
INSERT INTO `nc_menu` VALUES('36','35','订单管理','Order/index','','1');
INSERT INTO `nc_menu` VALUES('38','37','基本信息','settings/general','','1');
INSERT INTO `nc_menu` VALUES('40','37','邮件配置','settings/smtp_mail','','3');
INSERT INTO `nc_menu` VALUES('43','0','用户','','icon-user-md','0');
INSERT INTO `nc_menu` VALUES('46','37','配置管理','Config/index','','5');
INSERT INTO `nc_menu` VALUES('47','43','后台用户','AdminUser/index','','3');
INSERT INTO `nc_menu` VALUES('51','1','基本信息','settings/general','','1');
INSERT INTO `nc_menu` VALUES('54','53','文章分类','BlogCategory/index','','0');
INSERT INTO `nc_menu` VALUES('55','53','文章列表','Blog/index','','3');
INSERT INTO `nc_menu` VALUES('56','28','商品分类','GoodsCategory/index','','1');
INSERT INTO `nc_menu` VALUES('66','65','充值管理','member/chongzhi','','2');
INSERT INTO `nc_menu` VALUES('68','65','资金充值','Member/rmb','','1');
INSERT INTO `nc_menu` VALUES('69','65','资金记录','Member/zijing','','5');
INSERT INTO `nc_menu` VALUES('75','74','投诉列表','/Form/bdlist/bd_id/8','','0');
INSERT INTO `nc_menu` VALUES('83','82','投诉列表','Form/bdlist/bd_id/8','','0');
INSERT INTO `nc_menu` VALUES('85','84','分润记录','Record/fenrun','','1');
INSERT INTO `nc_menu` VALUES('88','84','赠送记录','Record/transaction','','4');
INSERT INTO `nc_menu` VALUES('140','107','总后台店铺','Goods/dianpu','','1');
INSERT INTO `nc_menu` VALUES('93','84','交易记录','Record/sell','','3');
INSERT INTO `nc_menu` VALUES('94','84','团队分红','Record/tuandui','','0');
INSERT INTO `nc_menu` VALUES('97','96','商品管理','Goods/index','','0');
INSERT INTO `nc_menu` VALUES('99','96','商城订单','Goods/shoporder','','0');
INSERT INTO `nc_menu` VALUES('102','101','道具管理','Gpgoods/index','','0');
INSERT INTO `nc_menu` VALUES('106','0','订单','','icon-book','3');
INSERT INTO `nc_menu` VALUES('107','0','商城','','icon-gift','2');
INSERT INTO `nc_menu` VALUES('108','106','订单管理','Order/index','','0');
INSERT INTO `nc_menu` VALUES('109','107','商品管理','Goods/index','','5');
INSERT INTO `nc_menu` VALUES('115','110','其他配置','Gameconfigs/Othersconfig','','16');
INSERT INTO `nc_menu` VALUES('116','0','提现管理','','icon-book','5');
INSERT INTO `nc_menu` VALUES('117','116','提现订单','Tixian/tixian','','0');
INSERT INTO `nc_menu` VALUES('118','116','转账订单','Tixian/Transfers','','0');
INSERT INTO `nc_menu` VALUES('119','1','公告','settings/notice','','3');
INSERT INTO `nc_menu` VALUES('121','107','分类管理','Goods/cate','','3');
INSERT INTO `nc_menu` VALUES('123','122','普通会员三级','Gameconfigs/sanjione','','20');
INSERT INTO `nc_menu` VALUES('124','122','中级会员三级','Gameconfigs/sanjitwo','','21');
INSERT INTO `nc_menu` VALUES('125','122','高级会员三级','Gameconfigs/sanjithree','','22');
INSERT INTO `nc_menu` VALUES('126','122','三级达成条件','Gameconfigs/sanjiconditions','','18');
INSERT INTO `nc_menu` VALUES('131','90','充值联索记录','Member/chongzhibiao','icon-dashboard','55');
INSERT INTO `nc_menu` VALUES('132','90','出售联索记录','Member/chushoubiao','icon-dashboard','44');
INSERT INTO `nc_menu` VALUES('133','1','文章列表','settings/wenzhang','icon-dashboard','33');
INSERT INTO `nc_menu` VALUES('134','1','文章类型','settings/wentype','icon-dashboard','32');
INSERT INTO `nc_menu` VALUES('135','0','商家入驻','','icon-gift','3');
INSERT INTO `nc_menu` VALUES('136','135','个人店铺','Goods/ggshop','icon-dashboard','0');
INSERT INTO `nc_menu` VALUES('137','135','认证列表','Goods/verify','icon-dashboard','2');
INSERT INTO `nc_menu` VALUES('139','138','升级列表','Goods/level','icon-dashboard','10');
INSERT INTO `nc_menu` VALUES('141','1','短信设置','settings/msgs','icon-dashboard','0');
--
-- 表的结构ncconfig
--
DROP TABLE IF EXISTS `ncconfig`;
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

--
-- 转存表中的数据 ncconfig

INSERT INTO `ncconfig` VALUES('7','SMTP_HOST','smtp','1448266020','smtp.ym.163.com','','0');
INSERT INTO `ncconfig` VALUES('8','SMTP_PORT','smtp','1448266020','25','','0');
INSERT INTO `ncconfig` VALUES('9','SMTP_USER','smtp','1448266020','','','0');
INSERT INTO `ncconfig` VALUES('10','SMTP_PASS','smtp','1448266020','','','0');
INSERT INTO `ncconfig` VALUES('11','FROM_EMAIL','smtp','1448266020','','','0');
INSERT INTO `ncconfig` VALUES('12','FROM_NAME','smtp','1448266020','','','0');
INSERT INTO `ncconfig` VALUES('13','SITE_TITLE','site','1448285156','vspay商城','','0');
INSERT INTO `ncconfig` VALUES('14','SITE_NAME','site','1448285156','vspay','','0');
INSERT INTO `ncconfig` VALUES('15','SITE_DESCRIPTION','site','1448285156','《LESO商城》协议《LESO商城》协议《LESO商城》协议《LESO商城》协议《LESO商城》协议《cctoken商城》协议《cctoken商城》协议','','0');
INSERT INTO `ncconfig` VALUES('16','SITE_KEYWORDS','site','1448285156','vspay商城','','0');
INSERT INTO `ncconfig` VALUES('17','SITE_URL','site','1448285156','','','0');
INSERT INTO `ncconfig` VALUES('18','SHORT_URL','site','1448285156','','','0');
INSERT INTO `ncconfig` VALUES('19','SITE_ICP','site','1448285156','','ICP备案号','0');
INSERT INTO `ncconfig` VALUES('20','EMAIL','site','1448285156','123456','','0');
INSERT INTO `ncconfig` VALUES('21','TELEPHONE','site','1448285156','','','0');
INSERT INTO `ncconfig` VALUES('22','WEB_SITE_CLOSE','site','1448285156','1','','0');
INSERT INTO `ncconfig` VALUES('23','common_image_thumb_width','image','1448293183','255','','0');
INSERT INTO `ncconfig` VALUES('24','common_image_thumb_height','image','1448293183','255','','0');
INSERT INTO `ncconfig` VALUES('25','gallery_thumb_width','image','1448293183','127','','0');
INSERT INTO `ncconfig` VALUES('26','gallery_thumb_height','image','1448293183','127','','0');
INSERT INTO `ncconfig` VALUES('27','gallery_related_thumb_width','image','1448293183','150','','0');
INSERT INTO `ncconfig` VALUES('28','gallery_related_thumb_height','image','1448293183','150','','0');
INSERT INTO `ncconfig` VALUES('29','blog_list_thumb_width','image','1448293183','280','','0');
INSERT INTO `ncconfig` VALUES('30','blog_list_thumb_height','image','1448293183','140','','0');
INSERT INTO `ncconfig` VALUES('31','goods_thumb_width','image','1448293183','360','','0');
INSERT INTO `ncconfig` VALUES('32','goods_thumb_height','image','1448293183','360','','0');
INSERT INTO `ncconfig` VALUES('33','goods_gallery_thumb_width','image','1448293183','75','','0');
INSERT INTO `ncconfig` VALUES('34','goods_gallery_thumb_height','image','1448293183','75','','0');
INSERT INTO `ncconfig` VALUES('35','goods_cart_thumb_width','image','1448293183','80','','0');
INSERT INTO `ncconfig` VALUES('36','goods_cart_thumb_height','image','1448293183','80','','0');
INSERT INTO `ncconfig` VALUES('39','length_clasisz_id','other','1448588459','2','','0');
INSERT INTO `ncconfig` VALUES('40','WEIGHT_ID','other','1448588459','1','','0');
INSERT INTO `ncconfig` VALUES('41','FRONT_PAGE_NUM','other','1448588459','8','','0');
INSERT INTO `ncconfig` VALUES('42','BACK_PAGE_NUM','other','1448588459','10','','0');
INSERT INTO `ncconfig` VALUES('43','default_order_status_id','other','1448588459','3','','0');
INSERT INTO `ncconfig` VALUES('44','paid_order_status_id','other','1448588459','1','','0');
INSERT INTO `ncconfig` VALUES('45','complete_order_status_id','other','1448588459','4','','0');
INSERT INTO `ncconfig` VALUES('47','URL_ID','other','1448588459','10','','0');
INSERT INTO `ncconfig` VALUES('48','SITE_SLOGAN','site','1448285156','','','0');
INSERT INTO `ncconfig` VALUES('51','cancel_order_status_id','other','0','5','','0');
INSERT INTO `ncconfig` VALUES('52','BLOG_TITLE','other','0','博客','','0');
INSERT INTO `ncconfig` VALUES('53','SITE_ICON','site','0','product/57a654b160dd9.png','网站图标','0');
INSERT INTO `ncconfig` VALUES('54','goods_related_thumb_width','image','0','280','','0');
INSERT INTO `ncconfig` VALUES('55','goods_related_thumb_height','image','0','280','','0');
INSERT INTO `ncconfig` VALUES('59','PWD_KEY','site','1470304751','.O&4893h99s-pXf~F9(H4xZ@8NqsP#A3r','','0');
INSERT INTO `ncconfig` VALUES('60','ewm','site','0','/ewm.jpg','','0');
INSERT INTO `ncconfig` VALUES('61','gg','site','0','','公告','0');
INSERT INTO `ncconfig` VALUES('72','payid','site','0','d4m7xoorsaomtjw3shpzu2tq','商户ID','0');
INSERT INTO `ncconfig` VALUES('73','paymi','site','0','t2iiufvwcky4nvn5tsek4janfmmvmt4x','商户密钥','0');
INSERT INTO `ncconfig` VALUES('74','KM_KEY','site','0','','','0');
INSERT INTO `ncconfig` VALUES('110','phone','site','0','88888888888888','电话','0');
INSERT INTO `ncconfig` VALUES('113','chandan_time','site','0','8','','0');
INSERT INTO `ncconfig` VALUES('115','add_hy','site','0','30','','0');
INSERT INTO `ncconfig` VALUES('116','default_tx','site','0','shop/597314adc65d4.jpg','','0');
INSERT INTO `ncconfig` VALUES('117','kefu','site','0','product/59812e9c2b24b.png','','0');
INSERT INTO `ncconfig` VALUES('118','shuoming','site','0','&lt;h3&gt;奖励说明：&lt;/h3&gt;\r\n\r\n&lt;p&gt;直推10人，团队业绩150万，奖励每天团队新增业绩0.5%.&lt;/p&gt;\r\n\r\n&lt;p&gt;直推15人，团队业绩350万，奖励每天团队新增业绩1%.&lt;/p&gt;\r\n\r\n&lt;p&gt;直推20人，团队业绩800万，奖励每天团队新增业绩1.5%&lt;/p&gt;\r\n','','0');
INSERT INTO `ncconfig` VALUES('119','sxf','site','0','0.1','手续费','0');
INSERT INTO `ncconfig` VALUES('124','btd','site','0','2','每次被偷蛋数','0');
INSERT INTO `ncconfig` VALUES('125','ydd','site','0','2','被狗咬掉蛋','0');
INSERT INTO `ncconfig` VALUES('126','sd_one','site','0','0.1','收蛋一代10%','0');
INSERT INTO `ncconfig` VALUES('127','sd_two','site','0','0.03','收蛋二代3%','0');
INSERT INTO `ncconfig` VALUES('128','sd_three','site','0','0.02','收蛋三代2%','0');
INSERT INTO `ncconfig` VALUES('129','mai_one','site','0','0.1','买动物一代10%','0');
INSERT INTO `ncconfig` VALUES('130','mai_two','site','0','0.03','买动物二代3%','0');
INSERT INTO `ncconfig` VALUES('131','mai_three','site','0','0.02','买动物三代2%','0');
INSERT INTO `ncconfig` VALUES('132','qq','site','0','123456','','0');
INSERT INTO `ncconfig` VALUES('133','m_sms_id','site','0','yakrNoOUFiat3qTJRu5F9We9rXAVgz','accessKeyId','0');
INSERT INTO `ncconfig` VALUES('134','m_sms_user','site','0','LTAIeVSBAFgHdKuK','accessKeySecret','0');
INSERT INTO `ncconfig` VALUES('135','m_sms_pwd','site','0','SMS_78790147','SMS_77505064','0');
INSERT INTO `ncconfig` VALUES('136','m_sms_name','site','0','全民养殖','name','0');
INSERT INTO `ncconfig` VALUES('137','tui_one','site','0','0.005','直推20人,150万','0');
INSERT INTO `ncconfig` VALUES('138','tui_two','site','0','0.01','直推15人,350万','0');
INSERT INTO `ncconfig` VALUES('139','tui_three','site','0','0.015','直推20人,800万','0');
INSERT INTO `ncconfig` VALUES('140','tui_one_rmb','site','0','1500000','直推20人,150万','0');
INSERT INTO `ncconfig` VALUES('141','tui_two_rmb','site','0','3500000','直推15人,350万','0');
INSERT INTO `ncconfig` VALUES('142','tui_three_rmb','site','0','8000000','直推20人,800万','0');
INSERT INTO `ncconfig` VALUES('144','MSG_password','site','0','86819','短信接口密码','0');
INSERT INTO `ncconfig` VALUES('145','MSG_account','site','0','92708b93b2dcfad1263437ad5f889e95','短信接口','0');
INSERT INTO `ncconfig` VALUES('146','MSG','site','0','&quot;你的验证码是&quot;.$code.&quot;，如非本人操作，请忽略本短信&quot;','短信模板','0');
--
-- 表的结构ysk_activate_num
--
DROP TABLE IF EXISTS `ysk_activate_num`;
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

--
-- 转存表中的数据 ysk_activate_num

--
-- 表的结构ysk_address
--
DROP TABLE IF EXISTS `ysk_address`;
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

--
-- 转存表中的数据 ysk_address

INSERT INTO `ysk_address` VALUES('9','1688','李生','13713882780','楼村新村17巷7号','深圳市','光明新区','广东','1');
INSERT INTO `ysk_address` VALUES('10','1697','郭','15989408882','布吉启迪科技','深圳市','龙岗区','广东','1');
INSERT INTO `ysk_address` VALUES('11','1736','刘文焕','17620420588','深圳','广州市','越秀区','广东','1');
INSERT INTO `ysk_address` VALUES('12','1746','杨永恒','15343827588','人民路22号','广州市','越秀区','广东','0');
INSERT INTO `ysk_address` VALUES('18','2084','李智明','15672204998','金石镇大兴路512号','邵阳市','新宁县','湖南','0');
INSERT INTO `ysk_address` VALUES('19','2096','倪小华','15873945803','金石镇解放街9号','邵阳市','新宁县','湖南','0');
INSERT INTO `ysk_address` VALUES('20','1878','aa','15575566666','某某某木木木木木','泸州市','泸　县','四川','0');
INSERT INTO `ysk_address` VALUES('21','1878','解决','15573256276','啊啊啊啊啊啊','广州市','天河区','广东','1');
INSERT INTO `ysk_address` VALUES('22','2080','啊啊','15732562764','啊啊','广州市','海珠区','广东','1');
INSERT INTO `ysk_address` VALUES('23','1745','retr','15124853648','布沙路玉玲花园a1栋1245','深圳市','龙岗区','广东','0');
INSERT INTO `ysk_address` VALUES('27','1710','环境规划','15170788826','大幅度发给','县','蓟　县','天津','1');
INSERT INTO `ysk_address` VALUES('28','1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南','0');
INSERT INTO `ysk_address` VALUES('29','1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南','0');
INSERT INTO `ysk_address` VALUES('30','1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南','0');
INSERT INTO `ysk_address` VALUES('31','1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南','0');
INSERT INTO `ysk_address` VALUES('32','1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南','0');
INSERT INTO `ysk_address` VALUES('33','1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南','0');
INSERT INTO `ysk_address` VALUES('34','1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南','0');
INSERT INTO `ysk_address` VALUES('35','1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南','0');
INSERT INTO `ysk_address` VALUES('36','1870','阮先生','18975978788','城东南工业园高速公路桥底顺风洗车','邵阳市','隆回县','湖南','1');
INSERT INTO `ysk_address` VALUES('37','1821','卢小龙','13713963037','吧呃呃呃额额','深圳市','龙岗区','广东','1');
INSERT INTO `ysk_address` VALUES('38','1689','李生','13713882780','楼村','深圳市','光明新区','广东','0');
INSERT INTO `ysk_address` VALUES('39','1689','李','13713882780','新村','深圳市','光明新区','广东','1');
INSERT INTO `ysk_address` VALUES('40','3053','dfg','15170788826','dfg ','市辖区','河北区','天津','1');
INSERT INTO `ysk_address` VALUES('41','1715','风格化','15170788826','对方回合','安顺市','平坝县','贵州','1');
INSERT INTO `ysk_address` VALUES('42','4184','刘芳华','13517375551','橡胶厂小区','益阳市','南　县','湖南','1');
INSERT INTO `ysk_address` VALUES('43','5892','周鸿逦','18173121063','东二环一段1055号','长沙市','芙蓉区','湖南','1');
INSERT INTO `ysk_address` VALUES('44','5497','尚君展','13810284400','绿地老街三期19号楼1单元402','郑州市','金水区','河南','1');
INSERT INTO `ysk_address` VALUES('45','5533','张三','13123456762','你们都是这样的','广州市','荔湾区','广东','1');
INSERT INTO `ysk_address` VALUES('46','5912','周元新','18008465847','荷花园街道万家丽中路一段42号湘运新村7-4-514','长沙市','芙蓉区','湖南','1');
INSERT INTO `ysk_address` VALUES('47','8536','王成明','13500000000','辉煌家园','淮安市','淮阴区','江苏','1');
INSERT INTO `ysk_address` VALUES('48','4125','朱','13478987503','我是来测试的','郑州市','金水区','河南','1');
INSERT INTO `ysk_address` VALUES('49','4124','111111','13007516318','111111','市辖区','西城区','北京','1');
INSERT INTO `ysk_address` VALUES('50','8546','刘广志','13088888696','hhjj？？？？？？？？？','广州市','海珠区','广东','1');
INSERT INTO `ysk_address` VALUES('51','8550','张飞','15698530661','槐东花园南门新兴巷13号','运城市','盐湖区','山西','1');
INSERT INTO `ysk_address` VALUES('52','8547','666','13011111156','？？？？？？，，，，，，1111','广州市','荔湾区','广东','1');
INSERT INTO `ysk_address` VALUES('53','8553','张杰','17791517166','虹口足球场商务大厦','市辖区','卢湾区','上海','1');
INSERT INTO `ysk_address` VALUES('54','8552','213','13243253232','1321','县','密云县','北京','1');
INSERT INTO `ysk_address` VALUES('55','8545','小猪','13478987503','我是来测试的','市辖区','长宁区','上海','1');
INSERT INTO `ysk_address` VALUES('56','8555','才华','13478954569','郑州','广州市','荔湾区','广东','1');
INSERT INTO `ysk_address` VALUES('57','8570','546456','13145847891','上课电话卡很少看到','广州市','越秀区','广东','1');
--
-- 表的结构ysk_admin
--
DROP TABLE IF EXISTS `ysk_admin`;
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
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账号表';

--
-- 转存表中的数据 ysk_admin

INSERT INTO `ysk_admin` VALUES('1','1','超级管理员','superadmin','09f385fe82d51f291a2db5e8a78b7db5','','0','1438651748','1531130774','1','');
INSERT INTO `ysk_admin` VALUES('5','1','超级管理1','admin','611fd61468729d297328a05cb48f9a86','','1902173178','1526153248','1531655335','1','');
INSERT INTO `ysk_admin` VALUES('115','1','张恒源','ABC13691944319','5efebe3eac284241b62ce2f0f3b8fdac','13691944319','1971857617','1535192131','1535192131','1','');
--
-- 表的结构ysk_admin_kucun
--
DROP TABLE IF EXISTS `ysk_admin_kucun`;
CREATE TABLE `ysk_admin_kucun` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '平台仓库',
  `total_num` decimal(15,2) NOT NULL COMMENT '累计添加总数',
  `less_num` decimal(15,2) NOT NULL COMMENT '库存余量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 ysk_admin_kucun

--
-- 表的结构ysk_admin_zhuangz
--
DROP TABLE IF EXISTS `ysk_admin_zhuangz`;
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

--
-- 转存表中的数据 ysk_admin_zhuangz

INSERT INTO `ysk_admin_zhuangz` VALUES('51','1','1718','2','1523534817','121.33.33.195','0','2','1','转给用户','肥肥鱼','13316098335','admin');
--
-- 表的结构ysk_baner
--
DROP TABLE IF EXISTS `ysk_baner`;
CREATE TABLE `ysk_baner` (
  `baner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `baner_px` int(11) DEFAULT '0' COMMENT '排序序号',
  `baner_url` varchar(250) NOT NULL COMMENT '图片路径',
  `baner_name` varchar(250) DEFAULT NULL COMMENT '点击链接',
  `baner_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`baner_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_baner

INSERT INTO `ysk_baner` VALUES('5','1','2017-08-25/599ffda5edb9c.jpg','###','0');
INSERT INTO `ysk_baner` VALUES('8','19','2017-08-25/599ffd8c46b57.jpg','###','0');
INSERT INTO `ysk_baner` VALUES('9','3','2017-08-25/599ffd9920d0b.jpg','###','0');
INSERT INTO `ysk_baner` VALUES('10','0','2017-08-25/599ffdc415550.jpg','###','1');
INSERT INTO `ysk_baner` VALUES('11','0','2017-08-25/599ffdd60ab76.jpg','###','1');
--
-- 表的结构ysk_bank_name
--
DROP TABLE IF EXISTS `ysk_bank_name`;
CREATE TABLE `ysk_bank_name` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int(11) NOT NULL COMMENT '外键',
  `banq_genre` varchar(20) NOT NULL COMMENT '银行类型',
  `banq_img` varchar(150) NOT NULL COMMENT '银行卡类型图片',
  PRIMARY KEY (`q_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='银行卡类型表';

--
-- 转存表中的数据 ysk_bank_name

INSERT INTO `ysk_bank_name` VALUES('1','1','广州市农村信用合作社','ncxys.png');
INSERT INTO `ysk_bank_name` VALUES('2','2','中国农业银行','zgnyyh.png');
INSERT INTO `ysk_bank_name` VALUES('3','3','中国工商银行','zggsyh.png');
INSERT INTO `ysk_bank_name` VALUES('4','4','中国招商银行','zsyh.png');
INSERT INTO `ysk_bank_name` VALUES('5','5','中国邮政储蓄银行','zgyz.png');
INSERT INTO `ysk_bank_name` VALUES('6','6','中国建设银行','zgjsyh.png');
INSERT INTO `ysk_bank_name` VALUES('7','7','中国银行','zgyh.png');
INSERT INTO `ysk_bank_name` VALUES('8','8','交通银行','jtyh.png');
INSERT INTO `ysk_bank_name` VALUES('9','9','广州市商业银行','fjxyyh.png');
INSERT INTO `ysk_bank_name` VALUES('10','10','中国民生银行','zgmsyh.png');
INSERT INTO `ysk_bank_name` VALUES('11','11','深圳发展银行','szfzyh.png');
INSERT INTO `ysk_bank_name` VALUES('12','12','上海浦东发展银行','shpdfzyh.png');
INSERT INTO `ysk_bank_name` VALUES('13','13','华夏银行','hxyh.png');
INSERT INTO `ysk_bank_name` VALUES('14','14','兴业银行','fjxyyh.png');
INSERT INTO `ysk_bank_name` VALUES('15','15','广东发展银行','fjxyyh.png');
INSERT INTO `ysk_bank_name` VALUES('16','16','中国光大银行','gdyh.jpg');
INSERT INTO `ysk_bank_name` VALUES('17','17','支付宝','zfb.png');
--
-- 表的结构ysk_banner
--
DROP TABLE IF EXISTS `ysk_banner`;
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

--
-- 转存表中的数据 ysk_banner

INSERT INTO `ysk_banner` VALUES('9','炫彩轮播','','123','1','2018-08-24/5b80081a00000.png','1535117338');
INSERT INTO `ysk_banner` VALUES('11','华丽轮播','','456','1','2018-08-24/5b80080403d09.png','1535117316');
INSERT INTO `ysk_banner` VALUES('13','多彩轮播','','0','1','2018-08-24/5b80074f44aa2.png','1535117135');
--
-- 表的结构ysk_bofamx
--
DROP TABLE IF EXISTS `ysk_bofamx`;
CREATE TABLE `ysk_bofamx` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '拨发果子到平台表的id',
  `manage_id` int(11) NOT NULL COMMENT '管理员id',
  `bofa_num` decimal(15,2) NOT NULL COMMENT '拨发的果子数量',
  `create_time` int(11) NOT NULL COMMENT '拨发时间',
  `note` tinytext NOT NULL COMMENT '备注',
  `manage_name` varchar(20) NOT NULL COMMENT '管理员账号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_bofamx

INSERT INTO `ysk_bofamx` VALUES('1','1','50000.00','1506487943','','admin');
--
-- 表的结构ysk_caimi
--
DROP TABLE IF EXISTS `ysk_caimi`;
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

--
-- 转存表中的数据 ysk_caimi

--
-- 表的结构ysk_childcoop_configs
--
DROP TABLE IF EXISTS `ysk_childcoop_configs`;
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

--
-- 转存表中的数据 ysk_childcoop_configs

INSERT INTO `ysk_childcoop_configs` VALUES('1','360.00','3600.00','1440.00','14440.00','400.00','800.00','1200.00','1600.00','399.000','800.000','6','0.0500','0.0001','0.0000','0.00','0.000','0.010','0.001','0.150','0.10','0.25','60','0.100','0.00','80','40.00','3','1','3.00','0.0050','0.0002','0.0100','48000.000','96000.000','154','154','0.00','0.00','0.10','0.10','0.10','0.25','0.25','0.00','0.00','50000.00','100000.00');
--
-- 表的结构ysk_chongzhi
--
DROP TABLE IF EXISTS `ysk_chongzhi`;
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

--
-- 转存表中的数据 ysk_chongzhi

--
-- 表的结构ysk_chushou
--
DROP TABLE IF EXISTS `ysk_chushou`;
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

--
-- 转存表中的数据 ysk_chushou

--
-- 表的结构ysk_coindets
--
DROP TABLE IF EXISTS `ysk_coindets`;
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

--
-- 转存表中的数据 ysk_coindets

INSERT INTO `ysk_coindets` VALUES('20881','2','比特币','43994.7354','1531128424','48394.2070','39595.2617');
INSERT INTO `ysk_coindets` VALUES('20882','3','莱特币','536.2700','1531128424','589.8970','482.6430');
INSERT INTO `ysk_coindets` VALUES('20883','4','以太坊','3169.5202','1531128424','3486.4722','2852.5681');
INSERT INTO `ysk_coindets` VALUES('20884','5','狗狗币','0.0170','1531128424','0.0187','0.0153');
INSERT INTO `ysk_coindets` VALUES('20885','1','LESO','0.0000','1531128426','0.0000','0.0000');
INSERT INTO `ysk_coindets` VALUES('20886','2','比特币','43994.7354','1531128426','48394.2070','39595.2617');
INSERT INTO `ysk_coindets` VALUES('20887','3','莱特币','536.1384','1531128426','589.7522','482.5246');
INSERT INTO `ysk_coindets` VALUES('20888','4','以太坊','3169.5202','1531128426','3486.4722','2852.5681');
INSERT INTO `ysk_coindets` VALUES('20889','5','狗狗币','0.0170','1531128426','0.0187','0.0153');
INSERT INTO `ysk_coindets` VALUES('20890','1','LESO','1.0000','1531148072','2.0000','0.5000');
INSERT INTO `ysk_coindets` VALUES('20891','2','比特币','43994.7354','1531148072','48394.2070','39595.2617');
INSERT INTO `ysk_coindets` VALUES('20892','3','莱特币','536.1384','1531148072','589.7522','482.5246');
INSERT INTO `ysk_coindets` VALUES('20893','4','以太坊','3169.5202','1531148072','3486.4722','2852.5681');
INSERT INTO `ysk_coindets` VALUES('20894','5','狗狗币','0.0170','1531148072','0.0187','0.0153');
INSERT INTO `ysk_coindets` VALUES('20895','1','LESO','0.0000','1531200875','0.0000','0.0000');
INSERT INTO `ysk_coindets` VALUES('20896','2','比特币','43994.7354','1531200875','48394.2070','39595.2617');
INSERT INTO `ysk_coindets` VALUES('20897','3','莱特币','536.1384','1531200875','589.7522','482.5246');
INSERT INTO `ysk_coindets` VALUES('20898','4','以太坊','3169.5202','1531200875','3486.4722','2852.5681');
INSERT INTO `ysk_coindets` VALUES('20899','5','狗狗币','0.0170','1531200875','0.0187','0.0153');
INSERT INTO `ysk_coindets` VALUES('20900','1','LESO','0.0000','1531448699','0.0000','0.0000');
INSERT INTO `ysk_coindets` VALUES('20901','2','比特币','41458.0000','1531448699','43265.0000','40895.0000');
INSERT INTO `ysk_coindets` VALUES('20902','3','莱特币','513.2400','1531448699','520.1700','500.2900');
INSERT INTO `ysk_coindets` VALUES('20903','4','以太坊','2885.0000','1531448699','3390.0000','2831.0000');
INSERT INTO `ysk_coindets` VALUES('20904','5','狗狗币','0.0153','1531448699','0.0233','0.0149');
--
-- 表的结构ysk_coindets_copy
--
DROP TABLE IF EXISTS `ysk_coindets_copy`;
CREATE TABLE `ysk_coindets_copy` (
  `cid` int(10) NOT NULL AUTO_INCREMENT COMMENT '币价格表',
  `coin_name` char(40) NOT NULL COMMENT '币名称',
  `coin_price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '币价格',
  `coin_addtime` char(40) NOT NULL COMMENT '币添加时间',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 ysk_coindets_copy

INSERT INTO `ysk_coindets_copy` VALUES('1','cctoken资产','1.1857','1522825163');
INSERT INTO `ysk_coindets_copy` VALUES('2','比特币','42604.9263','1522825163');
INSERT INTO `ysk_coindets_copy` VALUES('3','莱特币','709.1594','1522825163');
INSERT INTO `ysk_coindets_copy` VALUES('4','以太坊','2390.0137','1522825163');
INSERT INTO `ysk_coindets_copy` VALUES('5','狗狗币','0.0175','1522825163');
--
-- 表的结构ysk_collect
--
DROP TABLE IF EXISTS `ysk_collect`;
CREATE TABLE `ysk_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `type` int(1) DEFAULT NULL COMMENT '收藏类型',
  `proid` int(11) NOT NULL COMMENT 'ID',
  `time` int(11) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 ysk_collect

--
-- 表的结构ysk_complaint
--
DROP TABLE IF EXISTS `ysk_complaint`;
CREATE TABLE `ysk_complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '投诉人id',
  `content` text COMMENT '投诉内容',
  `imgs` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `status` tinyint(1) DEFAULT '0' COMMENT '0 未查看 1 已查看',
  `create_time` int(10) DEFAULT NULL COMMENT '投诉时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_complaint

INSERT INTO `ysk_complaint` VALUES('7','8545','99999','blob:http://pay.rzdrj.cn/05d861f6-f8ae-4c39-b16d-09820ac25e69','1','1529550487');
INSERT INTO `ysk_complaint` VALUES('9','8545','我是来测试的','','1','1529572796');
INSERT INTO `ysk_complaint` VALUES('10','8545','54564815656','','1','1529572889');
INSERT INTO `ysk_complaint` VALUES('11','8570','sddsdsd','','1','1530328333');
INSERT INTO `ysk_complaint` VALUES('12','8580','000000','','1','1531145782');
INSERT INTO `ysk_complaint` VALUES('13','8582','在吗？','','1','1531146092');
--
-- 表的结构ysk_config
--
DROP TABLE IF EXISTS `ysk_config`;
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

--
-- 转存表中的数据 ysk_config

INSERT INTO `ysk_config` VALUES('1','站点开关','TOGGLE_WEB_SITE','1','3','0','0:关闭\r\n1:开启','','1378898976','1406992386','1','1');
INSERT INTO `ysk_config` VALUES('2','网站标题','WEB_SITE_TITLE','','1','0','','网站标题前台显示标题','1378898976','1379235274','2','1');
INSERT INTO `ysk_config` VALUES('3','网站LOGO','WEB_SITE_LOGO','','1','0','','网站LOGO','1407003397','1407004692','3','1');
INSERT INTO `ysk_config` VALUES('4','网站描述','WEB_SITE_DESCRIPTION','','1','0','','网站搜索引擎描述','1378898976','1379235841','4','1');
INSERT INTO `ysk_config` VALUES('5','网站关键字','WEB_SITE_KEYWORD','','1','0','','网站搜索引擎关键字','1378898976','1381390100','5','1');
INSERT INTO `ysk_config` VALUES('6','版权信息','WEB_SITE_COPYRIGHT','','1','0','','设置在网站底部显示的版权信息，如“版权所有 (c) 2014-2015 科斯克网络科技”','1406991855','1406992583','6','1');
INSERT INTO `ysk_config` VALUES('7','网站备案号','WEB_SITE_ICP','','1','0','','设置在网站底部显示的备案号，如“苏ICP备1502009号\"','1378900335','1415983236','9','1');
INSERT INTO `ysk_config` VALUES('8','黄土地最小值','huang_min','300','2','1','','','0','0','20','1');
INSERT INTO `ysk_config` VALUES('9','黄土地最大值','huang_max','600','2','1','','','0','0','21','1');
INSERT INTO `ysk_config` VALUES('10','红土地最小值','hong_min','1000','2','2','','','0','0','21','1');
INSERT INTO `ysk_config` VALUES('11','红土地最大值','hong_max','2000','2','2','','','0','0','30','1');
INSERT INTO `ysk_config` VALUES('12','黑土地最小值','hei_min','2000','2','3','','','0','0','31','1');
INSERT INTO `ysk_config` VALUES('13','黑土地最大值','hei_max','4000','2','3','','','0','0','31','1');
INSERT INTO `ysk_config` VALUES('14','积分基础释放率','sell_fee','0.2','4','','','','0','0','23','1');
INSERT INTO `ysk_config` VALUES('15','1代积分加速放率','direct_fee','5','4','','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('16','2-15代积分加速放率','shop_fee','1','4','','','','0','0','33','1');
INSERT INTO `ysk_config` VALUES('29','2代Vip增加积分率','vadd_lv','8','4','','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('30','2-15代Vip增加积分率','morevadd_lv','5','4','0','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('31','总要扣比例','des_lv','0.4','2','5','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('27','基础拆分倍数','base_lv','2.5','2','5','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('28','哈士奇拆分倍数','hashiqi_lv','0.05','2','5','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('24','一级好友采矿拆分','friends_one','10','2','','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('25','二级好友采矿拆分','friends_two','0','2','','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('26','微信二维码','WEB_SITE_WX','','1','','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('32','注册开关','close_reg','1','3','','0:关闭1:开启','关闭注册功能说明','0','0','12','1');
INSERT INTO `ysk_config` VALUES('33','交易开关','close_trading','1','3','','0:关闭1:开启','交易暂时关闭，16:00后开启','0','0','13','0');
INSERT INTO `ysk_config` VALUES('34','果子转出开关','close_sellnum','0','3','','0:关闭1:开启','关闭果子转出说明11','0','0','0','0');
INSERT INTO `ysk_config` VALUES('35','三级好友采矿拆分','friends_tree','0','2','','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('36','体验地最小值','tiyan_min','66','2','4','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('37','体验地最大值','tiyan_max','130','2','4','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('38','鸡拆分倍数','ji_lv','0.05','2','5','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('39','鸟拆分倍数','niao_lv','0.15','2','5','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('40','猫拆分倍数','mao_lv','0.1','2','5','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('41','实时价格每分钟增长','growem','10','2','','','','0','0','12','1');
INSERT INTO `ysk_config` VALUES('42','商城开关','TOGGLE_MALL_SITE','1','3','0','0:关闭\r\n1:开启','商城暂未开放','1378898976','1406992386','1','1');
INSERT INTO `ysk_config` VALUES('43','注册送积分数','jifen','50','1','0','','','1407003397','1407004692','3','1');
INSERT INTO `ysk_config` VALUES('44','奖励开关','regjifen','0','1','0','','','1407003397','1407004692','3','1');
INSERT INTO `ysk_config` VALUES('45','直推奖条件','zhitui1','8','6','','','500','0','0','0','1');
INSERT INTO `ysk_config` VALUES('46','直推奖条件','zhitui2','','6','','','','0','0','33','1');
INSERT INTO `ysk_config` VALUES('47','直推奖条件','zhitui3','','6','','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('48','直推奖条件','zhitui4','','6','','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('49','管理奖条件','guanli1','0','7','','','0','0','0','0','1');
INSERT INTO `ysk_config` VALUES('50','管理奖条件','guanli2','0','7','','','0','0','0','33','1');
INSERT INTO `ysk_config` VALUES('51','管理奖条件','guanli3','0','7','','','0','0','0','0','1');
INSERT INTO `ysk_config` VALUES('52','联索转动奖条件','zhuand1','1','8','','','500','0','0','0','1');
INSERT INTO `ysk_config` VALUES('53','联索转动奖条件','zhuand2','','8','','','','0','0','33','1');
INSERT INTO `ysk_config` VALUES('54','联索转动奖条件','zhuand3','','8','','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('55','联索转动奖条件','zhuand4','','8','','','','0','0','0','1');
INSERT INTO `ysk_config` VALUES('56','区块奖条件','qukuai1','0.8','9','','','1','0','0','0','1');
INSERT INTO `ysk_config` VALUES('57','区块奖条件','qukuai2','0.8','9','','','2','0','0','33','1');
INSERT INTO `ysk_config` VALUES('58','区块奖条件','qukuai3','0.8','9','','','3','0','0','0','1');
INSERT INTO `ysk_config` VALUES('59','区块奖条件','qukuai4','0.5','9','','','4','0','0','0','1');
INSERT INTO `ysk_config` VALUES('60','区块奖条件','qukuai5','0.5','9','','','5','0','0','0','1');
INSERT INTO `ysk_config` VALUES('61','VIP1加速放率','vip1','8','10','','','1000000','0','0','33','1');
INSERT INTO `ysk_config` VALUES('62','VIP2加速放率','vip2','2','10','','','1','0','0','0','1');
INSERT INTO `ysk_config` VALUES('63','推荐一个人赠送积分数','jifens','','1','0','','','1407003397','1407004692','3','1');
INSERT INTO `ysk_config` VALUES('64','赠送积分最大推荐人数','rens','','1','0','','','1407003397','1407004692','3','1');
--
-- 表的结构ysk_crowds
--
DROP TABLE IF EXISTS `ysk_crowds`;
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

--
-- 转存表中的数据 ysk_crowds

--
-- 表的结构ysk_crowds_detail
--
DROP TABLE IF EXISTS `ysk_crowds_detail`;
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

--
-- 转存表中的数据 ysk_crowds_detail

--
-- 表的结构ysk_daojudets
--
DROP TABLE IF EXISTS `ysk_daojudets`;
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

--
-- 转存表中的数据 ysk_daojudets

--
-- 表的结构ysk_daojugoods
--
DROP TABLE IF EXISTS `ysk_daojugoods`;
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

--
-- 转存表中的数据 ysk_daojugoods

--
-- 表的结构ysk_date_sell_limit
--
DROP TABLE IF EXISTS `ysk_date_sell_limit`;
CREATE TABLE `ysk_date_sell_limit` (
  `uid` int(11) NOT NULL COMMENT '每天出售限制',
  `num` int(11) NOT NULL DEFAULT '0',
  `datestr` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 ysk_date_sell_limit

--
-- 表的结构ysk_deal
--
DROP TABLE IF EXISTS `ysk_deal`;
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

--
-- 转存表中的数据 ysk_deal

--
-- 表的结构ysk_deals
--
DROP TABLE IF EXISTS `ysk_deals`;
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

--
-- 转存表中的数据 ysk_deals

--
-- 表的结构ysk_earnsrecords
--
DROP TABLE IF EXISTS `ysk_earnsrecords`;
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

--
-- 转存表中的数据 ysk_earnsrecords

--
-- 表的结构ysk_farmgoods
--
DROP TABLE IF EXISTS `ysk_farmgoods`;
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

--
-- 转存表中的数据 ysk_farmgoods

--
-- 表的结构ysk_feedtimes
--
DROP TABLE IF EXISTS `ysk_feedtimes`;
CREATE TABLE `ysk_feedtimes` (
  `id` int(11) NOT NULL COMMENT '渔场可喂养时间点',
  `feed_time` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_feedtimes

--
-- 表的结构ysk_fengche
--
DROP TABLE IF EXISTS `ysk_fengche`;
CREATE TABLE `ysk_fengche` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `f_uid` int(11) NOT NULL COMMENT '用户UID',
  `f_time` date NOT NULL COMMENT '获得用时间',
  `f_end_time` date NOT NULL COMMENT '到期时间',
  `f_state` tinyint(1) NOT NULL COMMENT '状态 1使用中   2未使用  3已过期 ',
  `f_type` tinyint(1) NOT NULL COMMENT '1风车',
  PRIMARY KEY (`f_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_fengche

--
-- 表的结构ysk_fenxiaojiang
--
DROP TABLE IF EXISTS `ysk_fenxiaojiang`;
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

--
-- 转存表中的数据 ysk_fenxiaojiang

--
-- 表的结构ysk_fruit_in
--
DROP TABLE IF EXISTS `ysk_fruit_in`;
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

--
-- 转存表中的数据 ysk_fruit_in

--
-- 表的结构ysk_fruitdetail
--
DROP TABLE IF EXISTS `ysk_fruitdetail`;
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

--
-- 转存表中的数据 ysk_fruitdetail

INSERT INTO `ysk_fruitdetail` VALUES('62','1718','1','2.00','0','平台播发','平台播发金钱2','1523534817');
--
-- 表的结构ysk_gerenshangpu
--
DROP TABLE IF EXISTS `ysk_gerenshangpu`;
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

--
-- 转存表中的数据 ysk_gerenshangpu

INSERT INTO `ysk_gerenshangpu` VALUES('1','后台商店','/Uploads/image/product/5ad83a4b9c41c.jpg','8','','','/Uploads/image/product/5a9669c45b4f3.jpg','/Uploads/image/product/5a9669bf09789.jpg','','','','0','','','','','500','1','','深圳北海');
--
-- 表的结构ysk_goods
--
DROP TABLE IF EXISTS `ysk_goods`;
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

--
-- 转存表中的数据 ysk_goods

INSERT INTO `ysk_goods` VALUES('1','11111111111','product/59a91f7fb7fa6.jpg','111.00','1','1','0','1','2017-09-01 16:51:31','','0');
--
-- 表的结构ysk_goods_discount
--
DROP TABLE IF EXISTS `ysk_goods_discount`;
CREATE TABLE `ysk_goods_discount` (
  `product_discount_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='数量折扣';

--
-- 转存表中的数据 ysk_goods_discount

--
-- 表的结构ysk_group
--
DROP TABLE IF EXISTS `ysk_group`;
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

--
-- 转存表中的数据 ysk_group

INSERT INTO `ysk_group` VALUES('1','0','超级管理员','','','1426881003','1427552428','0','1','1','0');
INSERT INTO `ysk_group` VALUES('2','0','财务查看','','1,7,8,322,323','1498324367','1527084992','0','0','2','5');
INSERT INTO `ysk_group` VALUES('7','0','超级管理','','1,3,4,6,327,7,8,9,316,318,322,323','1526152893','1528963727','0','0','0','');
INSERT INTO `ysk_group` VALUES('8','0','数据管理','','1,3,4,327,7,8,10,11,315,324,325,334,329,328','1527085184','1527140823','0','0','0','0');
INSERT INTO `ysk_group` VALUES('9','0','数据管理1','','3,4,327,7,8','1527140086','1527140086','0','-1','0','0');
INSERT INTO `ysk_group` VALUES('10','0','测试','','1,3,4,327,7,8,9,316,318,322,323','1529227955','1530002816','0','-1','','2,3,5');
--
-- 表的结构ysk_growth
--
DROP TABLE IF EXISTS `ysk_growth`;
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

--
-- 转存表中的数据 ysk_growth

--
-- 表的结构ysk_harvdets
--
DROP TABLE IF EXISTS `ysk_harvdets`;
CREATE TABLE `ysk_harvdets` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '增养记录表',
  `har_nums` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '增氧数量',
  `har_landid` int(11) NOT NULL COMMENT '增养地id',
  `uid` int(11) NOT NULL COMMENT '增养用户id',
  `har_time` date NOT NULL COMMENT '增氧时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 ysk_harvdets

--
-- 表的结构ysk_jiaoyiorder
--
DROP TABLE IF EXISTS `ysk_jiaoyiorder`;
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

--
-- 转存表中的数据 ysk_jiaoyiorder

--
-- 表的结构ysk_kaidi
--
DROP TABLE IF EXISTS `ysk_kaidi`;
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

--
-- 转存表中的数据 ysk_kaidi

--
-- 表的结构ysk_layerneeds
--
DROP TABLE IF EXISTS `ysk_layerneeds`;
CREATE TABLE `ysk_layerneeds` (
  `id` int(11) NOT NULL COMMENT '等级设置表',
  `direct_pers` int(11) NOT NULL DEFAULT '0' COMMENT '所需直推人数',
  `member_jifen` int(11) NOT NULL DEFAULT '0' COMMENT '所需要积分',
  `member_grade` int(11) NOT NULL DEFAULT '1' COMMENT '对应用户等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_layerneeds

INSERT INTO `ysk_layerneeds` VALUES('1','0','0','1');
INSERT INTO `ysk_layerneeds` VALUES('2','10','10','2');
INSERT INTO `ysk_layerneeds` VALUES('3','20','12','3');
INSERT INTO `ysk_layerneeds` VALUES('4','30','16','4');
INSERT INTO `ysk_layerneeds` VALUES('5','40','20','5');
INSERT INTO `ysk_layerneeds` VALUES('6','50','30','6');
INSERT INTO `ysk_layerneeds` VALUES('7','60','400','7');
--
-- 表的结构ysk_level_list
--
DROP TABLE IF EXISTS `ysk_level_list`;
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

--
-- 转存表中的数据 ysk_level_list

--
-- 表的结构ysk_limit
--
DROP TABLE IF EXISTS `ysk_limit`;
CREATE TABLE `ysk_limit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `limit_num` int(11) NOT NULL COMMENT '限制数量',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '按稻草人还是直推会员推荐',
  `level_name` varchar(20) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_limit

INSERT INTO `ysk_limit` VALUES('1','50','0','普通用户','');
INSERT INTO `ysk_limit` VALUES('2','500','1','青铜农主','');
INSERT INTO `ysk_limit` VALUES('3','500','2','白金农主','');
INSERT INTO `ysk_limit` VALUES('4','500','3','水晶农主','');
INSERT INTO `ysk_limit` VALUES('5','1000','4','宝石农主','');
INSERT INTO `ysk_limit` VALUES('6','1500','5','钻石农主','');
INSERT INTO `ysk_limit` VALUES('7','2000','6','皇冠农主','');
--
-- 表的结构ysk_love_shop
--
DROP TABLE IF EXISTS `ysk_love_shop`;
CREATE TABLE `ysk_love_shop` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '收藏店铺id',
  `user_id` int(5) NOT NULL COMMENT '用户id',
  `shop_id` int(5) NOT NULL COMMENT '店铺id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 ysk_love_shop

--
-- 表的结构ysk_love_shoping
--
DROP TABLE IF EXISTS `ysk_love_shoping`;
CREATE TABLE `ysk_love_shoping` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '收藏商品id',
  `user_id` int(5) NOT NULL COMMENT '用户id',
  `shop_id` int(5) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 ysk_love_shoping

--
-- 表的结构ysk_member
--
DROP TABLE IF EXISTS `ysk_member`;
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

--
-- 转存表中的数据 ysk_member

--
-- 表的结构ysk_member_jifens
--
DROP TABLE IF EXISTS `ysk_member_jifens`;
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

--
-- 转存表中的数据 ysk_member_jifens

--
-- 表的结构ysk_menu
--
DROP TABLE IF EXISTS `ysk_menu`;
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

--
-- 转存表中的数据 ysk_menu

INSERT INTO `ysk_menu` VALUES('4','系统配置','3','1','Config','group4','','2','fa-wrench','11','1');
INSERT INTO `ysk_menu` VALUES('6','管理员管理','3','1','Manage','index','','2','fa fa-cog','13','1');
INSERT INTO `ysk_menu` VALUES('3','统用功能','1','1','','','','1','fa-folder-open-o','1','1');
INSERT INTO `ysk_menu` VALUES('5','角色管理','3','1','Group','index','','2','fa-sitemap','12','1');
INSERT INTO `ysk_menu` VALUES('7','会员管理','1','1','','','','1','fa-folder-open-o','2','1');
INSERT INTO `ysk_menu` VALUES('8','会员列表','7','1','User','index','','2','fa-user','21','1');
INSERT INTO `ysk_menu` VALUES('9','推荐结构','7','1','Tree','index','','2','fa-th-large','22','1');
INSERT INTO `ysk_menu` VALUES('1','系统','0','0','','','','0','fa-cog','0','1');
INSERT INTO `ysk_menu` VALUES('10','系统记录','0','0','','','','0','fa-tasks','0','0');
INSERT INTO `ysk_menu` VALUES('11','商品管理','10','10','','','','1','fa-folder-open-o','3','1');
INSERT INTO `ysk_menu` VALUES('315','商品列表','11','10','Good','index','','2','','31','1');
INSERT INTO `ysk_menu` VALUES('316','反馈管理','1','1','','','','1','fa-folder-open-o','3','1');
INSERT INTO `ysk_menu` VALUES('331','游戏币转入','319','1','BuyNum','index','','2','fa-list','43','0');
INSERT INTO `ysk_menu` VALUES('318','反馈列表','316','1','Recyling','index','','2','fa-file-text','32','1');
INSERT INTO `ysk_menu` VALUES('319','平台充值管理','1','1','','','','1','fa-folder-open-o','4','0');
INSERT INTO `ysk_menu` VALUES('320','平台充值','319','1','FruitsManage','index','','2','fa-jpy','41','0');
INSERT INTO `ysk_menu` VALUES('321','充值流水','319','1','FruitsDetail','index','','2','fa-list','42','0');
INSERT INTO `ysk_menu` VALUES('322','公告管理','1','1','','','','1','fa-folder-open-o','5','1');
INSERT INTO `ysk_menu` VALUES('323','系统公告','322','1','News','index','','2','fa-twitter-square','51','1');
INSERT INTO `ysk_menu` VALUES('324','交易管理','10','10','','','','1','fa-folder-open-o','6','1');
INSERT INTO `ysk_menu` VALUES('325','定向交易记录','324','10','Traing','index','','2','fa-list','61','1');
INSERT INTO `ysk_menu` VALUES('327','数据库管理','3','1','Database','index','','2','fa fa-lock','14','1');
INSERT INTO `ysk_menu` VALUES('328','转盘记录','324','10','Traing','turntable','','2','fa-list','67','1');
INSERT INTO `ysk_menu` VALUES('329','施肥记录','324','10','Traing','growth','','2','fa-list','66','1');
INSERT INTO `ysk_menu` VALUES('330','果子转聚宝盆','319','1','SellNum','index','','2','fa-list','45','0');
INSERT INTO `ysk_menu` VALUES('332','激活码管理','1','1','','','','1','fa-folder-open-o','7','0');
INSERT INTO `ysk_menu` VALUES('333','激活码列表','332','1','ActivateNum','index','','2','fa-list','71','0');
INSERT INTO `ysk_menu` VALUES('334','自由交易记录','324','10','Traing','tradingfree','','2','fa-list','62','1');
INSERT INTO `ysk_menu` VALUES('335','轮播管理','1','1','','','','1','fa-folder-open-o','6','1');
INSERT INTO `ysk_menu` VALUES('336','系统轮播','335','1','Banner','index','','2','fa-twitter-square','51','1');
INSERT INTO `ysk_menu` VALUES('337','投诉列表','316','1','Complaint','index','','2','fa-file-text','33','1');
INSERT INTO `ysk_menu` VALUES('338','短信配置','3','1','Config','msgs','','2','fa fa-twitter-square','88','1');
INSERT INTO `ysk_menu` VALUES('339','后台充值记录','7','1','User','recharge','','2','fa-list','99','1');
INSERT INTO `ysk_menu` VALUES('340','众筹记录','7','1','Crowdsd','index','','2','fa-list','68','1');
--
-- 表的结构ysk_moneyils
--
DROP TABLE IF EXISTS `ysk_moneyils`;
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

--
-- 转存表中的数据 ysk_moneyils

INSERT INTO `ysk_moneyils` VALUES('53','6000125','6000028','40.00','1','1','1521624882');
INSERT INTO `ysk_moneyils` VALUES('54','6000114','6000110','16.00','1','1','1521777204');
INSERT INTO `ysk_moneyils` VALUES('55','6000114','6000110','16.00','1','1','1521783962');
INSERT INTO `ysk_moneyils` VALUES('56','6000032','6000016','500.00','1','1','1521789857');
INSERT INTO `ysk_moneyils` VALUES('33','6000138','6000104','8.00','1','2','1520679221');
INSERT INTO `ysk_moneyils` VALUES('34','6000138','6000005','3.00','2','2','1520679221');
INSERT INTO `ysk_moneyils` VALUES('35','6000138','6000004','3.00','3','2','1520679221');
INSERT INTO `ysk_moneyils` VALUES('36','6000138','6000001','3.00','4','2','1520679221');
INSERT INTO `ysk_moneyils` VALUES('37','6000138','6000104','8.00','1','2','1520679238');
INSERT INTO `ysk_moneyils` VALUES('38','6000138','6000005','3.00','2','2','1520679238');
INSERT INTO `ysk_moneyils` VALUES('39','6000138','6000004','3.00','3','2','1520679238');
INSERT INTO `ysk_moneyils` VALUES('40','6000138','6000001','3.00','4','2','1520679238');
INSERT INTO `ysk_moneyils` VALUES('41','6000138','6000104','8.00','1','2','1520679271');
INSERT INTO `ysk_moneyils` VALUES('42','6000138','6000005','3.00','2','2','1520679271');
INSERT INTO `ysk_moneyils` VALUES('43','6000138','6000004','3.00','3','2','1520679271');
INSERT INTO `ysk_moneyils` VALUES('44','6000138','6000001','3.00','4','2','1520679271');
INSERT INTO `ysk_moneyils` VALUES('45','6000138','6000104','8.00','1','2','1520679351');
INSERT INTO `ysk_moneyils` VALUES('46','6000138','6000104','16.00','1','2','1520680159');
INSERT INTO `ysk_moneyils` VALUES('47','6000138','6000104','1.60','1','1','1520680588');
INSERT INTO `ysk_moneyils` VALUES('48','6000138','6000104','16.00','1','2','1520680601');
INSERT INTO `ysk_moneyils` VALUES('49','6000138','6000104','8.00','1','2','1521027562');
INSERT INTO `ysk_moneyils` VALUES('50','6000138','6000104','8.00','1','2','1521027577');
INSERT INTO `ysk_moneyils` VALUES('51','6000138','6000104','1.60','1','1','1521027608');
INSERT INTO `ysk_moneyils` VALUES('52','6000125','6000028','40.00','1','1','1521624561');
INSERT INTO `ysk_moneyils` VALUES('57','6000164','6000163','8.00','1','2','1522218777');
INSERT INTO `ysk_moneyils` VALUES('58','6000149','6000148','8.00','1','1','1522635230');
INSERT INTO `ysk_moneyils` VALUES('59','6000149','6000148','8.00','1','1','1522635676');
INSERT INTO `ysk_moneyils` VALUES('60','6000158','6000148','8.00','1','1','1522635939');
INSERT INTO `ysk_moneyils` VALUES('61','6000158','6000148','8.00','1','1','1522635987');
INSERT INTO `ysk_moneyils` VALUES('62','6000190','6000148','3.00','3','1','1522661923');
INSERT INTO `ysk_moneyils` VALUES('63','6000165','6000163','8.00','1','2','1522725079');
INSERT INTO `ysk_moneyils` VALUES('64','6000164','6000163','16.00','1','1','1522727205');
INSERT INTO `ysk_moneyils` VALUES('65','6000164','6000163','16.00','1','1','1522727252');
INSERT INTO `ysk_moneyils` VALUES('66','6000164','6000163','16.00','1','1','1522727804');
INSERT INTO `ysk_moneyils` VALUES('67','6000164','6000163','16.00','1','1','1522727859');
INSERT INTO `ysk_moneyils` VALUES('68','6000201','6000163','4.80','2','1','1522727981');
INSERT INTO `ysk_moneyils` VALUES('69','6000201','6000163','3.00','2','2','1522728015');
INSERT INTO `ysk_moneyils` VALUES('70','6000164','6000163','16.00','1','1','1522728472');
INSERT INTO `ysk_moneyils` VALUES('71','6000201','6000163','6.00','2','2','1522728629');
INSERT INTO `ysk_moneyils` VALUES('72','6000164','6000163','16.00','1','1','1522745092');
INSERT INTO `ysk_moneyils` VALUES('73','6000164','6000163','16.00','1','1','1522745167');
INSERT INTO `ysk_moneyils` VALUES('74','6000164','6000163','16.00','1','1','1522745442');
INSERT INTO `ysk_moneyils` VALUES('75','6000164','6000163','16.00','1','1','1522760114');
INSERT INTO `ysk_moneyils` VALUES('76','6000164','6000163','16.00','1','1','1522764359');
INSERT INTO `ysk_moneyils` VALUES('77','6000164','6000163','16.00','1','1','1522764404');
INSERT INTO `ysk_moneyils` VALUES('78','6000164','6000163','16.00','1','1','1522764451');
INSERT INTO `ysk_moneyils` VALUES('79','6000164','6000163','16.00','1','1','1522764506');
INSERT INTO `ysk_moneyils` VALUES('80','6000164','6000163','16.00','1','1','1522764572');
INSERT INTO `ysk_moneyils` VALUES('81','6000164','6000163','16.00','1','1','1522764611');
INSERT INTO `ysk_moneyils` VALUES('82','6000203','6000202','4160.00','1','2','1522765147');
INSERT INTO `ysk_moneyils` VALUES('83','6000208','6000203','1200.00','3','2','1522767980');
INSERT INTO `ysk_moneyils` VALUES('84','6000164','6000163','16.00','1','1','1522798157');
INSERT INTO `ysk_moneyils` VALUES('85','6000209','6000165','8.00','1','2','1522802639');
INSERT INTO `ysk_moneyils` VALUES('86','6000164','6000163','16.00','1','1','1522815470');
INSERT INTO `ysk_moneyils` VALUES('87','6000164','6000163','800.00','1','1','1522817875');
INSERT INTO `ysk_moneyils` VALUES('88','6000214','6000163','3.00','2','2','1522818440');
INSERT INTO `ysk_moneyils` VALUES('89','6000215','6000163','240.00','2','2','1522818700');
INSERT INTO `ysk_moneyils` VALUES('90','6000207','6000203','3.00','3','2','1522822146');
INSERT INTO `ysk_moneyils` VALUES('91','6000197','6000148','0.06','2','1','1522839800');
INSERT INTO `ysk_moneyils` VALUES('92','6000215','6000163','3.00','2','2','1522891806');
INSERT INTO `ysk_moneyils` VALUES('93','6000164','6000163','1600.00','1','2','1522959750');
INSERT INTO `ysk_moneyils` VALUES('94','6000198','6000165','8.00','1','2','1523009432');
INSERT INTO `ysk_moneyils` VALUES('95','6000200','6000165','8.00','1','2','1523009951');
INSERT INTO `ysk_moneyils` VALUES('96','6000200','6000165','320.00','1','2','1523024676');
INSERT INTO `ysk_moneyils` VALUES('97','6000200','6000165','8.00','1','2','1523030629');
INSERT INTO `ysk_moneyils` VALUES('98','6000199','6000165','8.00','1','2','1523060320');
INSERT INTO `ysk_moneyils` VALUES('99','6000197','6000148','30.00','2','1','1523071387');
INSERT INTO `ysk_moneyils` VALUES('100','6000197','6000148','3.00','2','1','1523072806');
INSERT INTO `ysk_moneyils` VALUES('101','6000158','6000148','4.00','1','1','1523072856');
INSERT INTO `ysk_moneyils` VALUES('102','6000199','6000165','4.80','1','1','1523080029');
INSERT INTO `ysk_moneyils` VALUES('103','6000200','6000165','8.00','1','2','1523080605');
INSERT INTO `ysk_moneyils` VALUES('104','6000210','6000208','80.00','1','1','1523090260');
INSERT INTO `ysk_moneyils` VALUES('105','6000210','6000208','80.00','1','1','1523090261');
INSERT INTO `ysk_moneyils` VALUES('106','6000210','6000208','80.00','1','1','1523091013');
INSERT INTO `ysk_moneyils` VALUES('107','6000210','6000208','80.00','1','1','1523091035');
INSERT INTO `ysk_moneyils` VALUES('108','6000210','6000208','80.00','1','1','1523091101');
INSERT INTO `ysk_moneyils` VALUES('109','6000210','6000208','80.00','1','1','1523091474');
INSERT INTO `ysk_moneyils` VALUES('110','6000210','6000203','30.00','4','1','1523091495');
INSERT INTO `ysk_moneyils` VALUES('111','6000210','6000203','30.00','4','1','1523092504');
INSERT INTO `ysk_moneyils` VALUES('112','6000210','6000203','30.00','4','1','1523093986');
INSERT INTO `ysk_moneyils` VALUES('113','6000210','6000203','30.00','4','1','1523096440');
INSERT INTO `ysk_moneyils` VALUES('114','6000210','6000203','30.00','4','1','1523096641');
INSERT INTO `ysk_moneyils` VALUES('115','6000200','6000165','8.00','1','2','1523102777');
INSERT INTO `ysk_moneyils` VALUES('116','6000200','6000165','3.20','1','1','1523103873');
INSERT INTO `ysk_moneyils` VALUES('117','6000199','6000165','0.15','1','1','1523104036');
INSERT INTO `ysk_moneyils` VALUES('118','6000225','6000165','1.00','2','1','1523104111');
INSERT INTO `ysk_moneyils` VALUES('119','6000167','6000163','704.00','1','2','1523116623');
INSERT INTO `ysk_moneyils` VALUES('120','6000227','6000165','4.80','2','1','1523142634');
INSERT INTO `ysk_moneyils` VALUES('121','6000198','6000165','8.00','1','2','1523142868');
INSERT INTO `ysk_moneyils` VALUES('122','6000226','6000165','4.80','2','1','1523143673');
INSERT INTO `ysk_moneyils` VALUES('123','6000200','6000165','8.00','1','2','1523144390');
INSERT INTO `ysk_moneyils` VALUES('124','6000225','6000165','4.80','2','1','1523148709');
INSERT INTO `ysk_moneyils` VALUES('125','6000199','6000165','8.00','1','2','1523148777');
INSERT INTO `ysk_moneyils` VALUES('126','6000198','6000165','1.20','1','1','1523149856');
INSERT INTO `ysk_moneyils` VALUES('127','6000200','6000165','8.00','1','2','1523149911');
INSERT INTO `ysk_moneyils` VALUES('128','6000208','6000203','300.00','3','1','1523151612');
INSERT INTO `ysk_moneyils` VALUES('129','6000207','6000203','90.00','3','2','1523151980');
INSERT INTO `ysk_moneyils` VALUES('130','6000206','6000203','6.00','2','2','1523155711');
INSERT INTO `ysk_moneyils` VALUES('131','6000204','6000203','16.00','1','2','1523163938');
INSERT INTO `ysk_moneyils` VALUES('132','6000204','6000203','16.00','1','2','1523164061');
INSERT INTO `ysk_moneyils` VALUES('133','6000207','6000203','3.00','3','2','1523170267');
INSERT INTO `ysk_moneyils` VALUES('134','6000223','6000203','3.00','4','2','1523171748');
INSERT INTO `ysk_moneyils` VALUES('135','6000224','6000165','3.00','2','2','1523184365');
INSERT INTO `ysk_moneyils` VALUES('136','6000206','6000203','15.00','2','2','1523185934');
INSERT INTO `ysk_moneyils` VALUES('137','6000199','6000165','8.00','1','2','1523203489');
INSERT INTO `ysk_moneyils` VALUES('138','6000237','6000163','16.00','1','2','1523239938');
INSERT INTO `ysk_moneyils` VALUES('139','6000213','6000203','3.00','4','2','1523240011');
INSERT INTO `ysk_moneyils` VALUES('140','6000219','6000203','8.00','1','2','1523245529');
INSERT INTO `ysk_moneyils` VALUES('141','6000208','6000203','150.00','3','2','1523250004');
INSERT INTO `ysk_moneyils` VALUES('142','6000207','6000203','60.00','3','2','1523250138');
INSERT INTO `ysk_moneyils` VALUES('143','6000248','6000245','30.00','3','1','1523257214');
INSERT INTO `ysk_moneyils` VALUES('144','6000207','6000203','60.00','3','2','1523259418');
INSERT INTO `ysk_moneyils` VALUES('145','6000206','6000203','27.00','2','2','1523269820');
INSERT INTO `ysk_moneyils` VALUES('146','6000204','6000203','80.00','1','2','1523277659');
INSERT INTO `ysk_moneyils` VALUES('147','6000206','6000203','30.00','2','2','1523278178');
INSERT INTO `ysk_moneyils` VALUES('148','6000207','6000203','30.00','3','2','1523283310');
INSERT INTO `ysk_moneyils` VALUES('149','6000208','6000203','150.00','3','2','1523285514');
INSERT INTO `ysk_moneyils` VALUES('150','6000257','6000163','640.00','1','2','1523327207');
INSERT INTO `ysk_moneyils` VALUES('151','1689','1688','3840.00','1','2','1523376180');
INSERT INTO `ysk_moneyils` VALUES('152','1691','1688','20.80','1','1','1523421614');
INSERT INTO `ysk_moneyils` VALUES('153','1697','1688','1600.00','1','1','1523442339');
INSERT INTO `ysk_moneyils` VALUES('154','1689','1688','16000.00','1','1','1523446694');
INSERT INTO `ysk_moneyils` VALUES('155','1690','1688','28800.00','2','2','1523448593');
INSERT INTO `ysk_moneyils` VALUES('156','1692','1688','8250.00','2','1','1523448894');
INSERT INTO `ysk_moneyils` VALUES('157','1689','1688','57600.00','1','2','1523449923');
INSERT INTO `ysk_moneyils` VALUES('158','1698','1688','171.00','3','1','1523453285');
INSERT INTO `ysk_moneyils` VALUES('159','1695','1688','450.00','3','2','1523453448');
INSERT INTO `ysk_moneyils` VALUES('160','1695','1688','360.00','3','2','1523457004');
INSERT INTO `ysk_moneyils` VALUES('161','1695','1688','18.00','3','2','1523491415');
INSERT INTO `ysk_moneyils` VALUES('162','1691','1688','0.08','1','1','1523521899');
INSERT INTO `ysk_moneyils` VALUES('163','1691','1688','0.08','1','1','1523522578');
INSERT INTO `ysk_moneyils` VALUES('164','1691','1688','0.08','1','1','1523522610');
INSERT INTO `ysk_moneyils` VALUES('165','1691','1688','0.08','1','1','1523522641');
INSERT INTO `ysk_moneyils` VALUES('166','1691','1688','0.08','1','1','1523522710');
INSERT INTO `ysk_moneyils` VALUES('167','1691','1688','0.08','1','1','1523522797');
INSERT INTO `ysk_moneyils` VALUES('168','1691','1688','0.08','1','1','1523522823');
INSERT INTO `ysk_moneyils` VALUES('169','1691','1688','0.08','1','1','1523522855');
INSERT INTO `ysk_moneyils` VALUES('170','1691','1688','0.08','1','1','1523522977');
INSERT INTO `ysk_moneyils` VALUES('171','1716','1688','0.08','1','1','1523526916');
INSERT INTO `ysk_moneyils` VALUES('172','1715','1688','0.08','1','1','1523527009');
INSERT INTO `ysk_moneyils` VALUES('173','1716','1688','0.08','1','1','1523527146');
INSERT INTO `ysk_moneyils` VALUES('174','1716','1688','0.03','2','1','1523527493');
INSERT INTO `ysk_moneyils` VALUES('175','1716','1688','0.03','2','1','1523527493');
INSERT INTO `ysk_moneyils` VALUES('176','1716','1688','0.03','2','1','1523527790');
INSERT INTO `ysk_moneyils` VALUES('177','1716','1688','8.00','2','1','1523531684');
INSERT INTO `ysk_moneyils` VALUES('178','1716','1688','8.00','2','1','1523531693');
INSERT INTO `ysk_moneyils` VALUES('179','1716','1688','8.00','2','1','1523531783');
INSERT INTO `ysk_moneyils` VALUES('180','1716','1688','8.00','2','1','1523531835');
INSERT INTO `ysk_moneyils` VALUES('181','1690','1688','800.00','2','1','1523538796');
INSERT INTO `ysk_moneyils` VALUES('182','1690','1688','800.00','2','1','1523538827');
INSERT INTO `ysk_moneyils` VALUES('183','1690','1688','500.00','2','1','1523539042');
INSERT INTO `ysk_moneyils` VALUES('184','1690','1688','500.00','2','1','1523539052');
INSERT INTO `ysk_moneyils` VALUES('185','1690','1688','500.00','2','1','1523539107');
INSERT INTO `ysk_moneyils` VALUES('186','1690','1688','500.00','2','1','1523539108');
INSERT INTO `ysk_moneyils` VALUES('187','1690','1688','500.00','2','1','1523539178');
INSERT INTO `ysk_moneyils` VALUES('188','1690','1688','500.00','2','1','1523539219');
INSERT INTO `ysk_moneyils` VALUES('189','1690','1688','500.00','2','1','1523539241');
INSERT INTO `ysk_moneyils` VALUES('190','1690','1688','500.00','2','1','1523539297');
INSERT INTO `ysk_moneyils` VALUES('191','1690','1688','500.00','2','1','1523539310');
INSERT INTO `ysk_moneyils` VALUES('192','1690','1688','500.00','2','1','1523539361');
INSERT INTO `ysk_moneyils` VALUES('193','1690','1688','500.00','2','1','1523539442');
INSERT INTO `ysk_moneyils` VALUES('194','1690','1688','500.00','2','1','1523539481');
INSERT INTO `ysk_moneyils` VALUES('195','1690','1688','500.00','2','1','1523539506');
INSERT INTO `ysk_moneyils` VALUES('196','1690','1688','500.00','2','1','1523539580');
INSERT INTO `ysk_moneyils` VALUES('197','1690','1688','500.00','2','1','1523539834');
INSERT INTO `ysk_moneyils` VALUES('198','1690','1688','500.00','2','1','1523541045');
INSERT INTO `ysk_moneyils` VALUES('199','1690','1688','50.00','2','1','1523542071');
INSERT INTO `ysk_moneyils` VALUES('200','1701','1688','48.00','4','2','1523544820');
INSERT INTO `ysk_moneyils` VALUES('201','1705','1688','48.00','8','2','1523545289');
INSERT INTO `ysk_moneyils` VALUES('202','1704','1688','48.00','7','2','1523545416');
INSERT INTO `ysk_moneyils` VALUES('203','1691','1688','16.00','1','1','1523545522');
INSERT INTO `ysk_moneyils` VALUES('204','1691','1688','16.00','1','1','1523545569');
INSERT INTO `ysk_moneyils` VALUES('205','1691','1688','16.00','1','1','1523545627');
INSERT INTO `ysk_moneyils` VALUES('206','1691','1688','16.00','1','1','1523545705');
INSERT INTO `ysk_moneyils` VALUES('207','1691','1688','16.00','1','1','1523545753');
INSERT INTO `ysk_moneyils` VALUES('208','1691','1688','16.00','1','1','1523545794');
INSERT INTO `ysk_moneyils` VALUES('209','1691','1688','16.00','1','1','1523545831');
INSERT INTO `ysk_moneyils` VALUES('210','1691','1688','16.00','1','1','1523545864');
INSERT INTO `ysk_moneyils` VALUES('211','1691','1688','16.00','1','1','1523545897');
INSERT INTO `ysk_moneyils` VALUES('212','1722','1688','48.00','3','2','1523567644');
INSERT INTO `ysk_moneyils` VALUES('213','1698','1688','48.00','3','2','1523571884');
INSERT INTO `ysk_moneyils` VALUES('214','1692','1688','192.00','2','2','1523572027');
INSERT INTO `ysk_moneyils` VALUES('215','1693','1688','48.00','3','2','1523573337');
INSERT INTO `ysk_moneyils` VALUES('216','1717','1688','48.00','7','2','1523577942');
INSERT INTO `ysk_moneyils` VALUES('217','1702','1688','48.00','5','2','1523578652');
INSERT INTO `ysk_moneyils` VALUES('218','1704','1688','96.00','7','2','1523579536');
INSERT INTO `ysk_moneyils` VALUES('219','1689','1688','76800.00','1','2','1523595464');
INSERT INTO `ysk_moneyils` VALUES('220','1707','1688','48.00','4','2','1523595942');
INSERT INTO `ysk_moneyils` VALUES('221','1690','1689','76800.00','1','2','1523596046');
INSERT INTO `ysk_moneyils` VALUES('222','1690','1688','80.00','2','1','1523599807');
INSERT INTO `ysk_moneyils` VALUES('223','1690','1688','1600.00','2','1','1523600415');
INSERT INTO `ysk_moneyils` VALUES('224','1690','1688','80.00','2','1','1523600771');
INSERT INTO `ysk_moneyils` VALUES('225','1689','1688','160.00','1','1','1523600857');
INSERT INTO `ysk_moneyils` VALUES('226','1712','1688','48.00','9','2','1523602260');
INSERT INTO `ysk_moneyils` VALUES('227','1690','1688','640.00','2','1','1523604216');
INSERT INTO `ysk_moneyils` VALUES('228','1689','1688','2880.00','1','2','1523606322');
INSERT INTO `ysk_moneyils` VALUES('229','1690','1688','1.60','2','1','1523629793');
INSERT INTO `ysk_moneyils` VALUES('230','1690','1688','1.60','2','1','1523629821');
INSERT INTO `ysk_moneyils` VALUES('231','1705','1688','1.60','8','1','1523629877');
INSERT INTO `ysk_moneyils` VALUES('232','1705','1688','1.60','8','1','1523630029');
INSERT INTO `ysk_moneyils` VALUES('233','1705','1691','1.60','7','1','1523630094');
INSERT INTO `ysk_moneyils` VALUES('234','1744','1688','160.00','2','1','1523635052');
INSERT INTO `ysk_moneyils` VALUES('235','1744','1688','160.00','2','2','1523635379');
INSERT INTO `ysk_moneyils` VALUES('236','1690','1688','640.00','2','1','1523638681');
INSERT INTO `ysk_moneyils` VALUES('237','1690','1688','2560.00','2','2','1523639058');
INSERT INTO `ysk_moneyils` VALUES('238','1692','1688','40.00','2','2','1523639423');
INSERT INTO `ysk_moneyils` VALUES('239','1738','1688','3.20','7','1','1523639701');
INSERT INTO `ysk_moneyils` VALUES('240','1737','1688','3.20','7','1','1523639739');
INSERT INTO `ysk_moneyils` VALUES('241','1697','1688','16.00','1','1','1523639782');
INSERT INTO `ysk_moneyils` VALUES('242','1697','1688','80.00','1','2','1523640194');
INSERT INTO `ysk_moneyils` VALUES('243','1733','1688','3.20','7','1','1523640826');
INSERT INTO `ysk_moneyils` VALUES('244','1728','1688','3.20','7','1','1523640875');
INSERT INTO `ysk_moneyils` VALUES('245','1735','1688','3.20','8','1','1523640920');
INSERT INTO `ysk_moneyils` VALUES('246','1731','1688','3.20','10','1','1523640971');
INSERT INTO `ysk_moneyils` VALUES('247','1730','1688','3.20','10','1','1523641015');
INSERT INTO `ysk_moneyils` VALUES('248','1740','1688','3.20','7','1','1523641066');
INSERT INTO `ysk_moneyils` VALUES('249','1724','1688','3.20','9','1','1523641200');
INSERT INTO `ysk_moneyils` VALUES('250','1723','1688','3.20','9','1','1523641247');
INSERT INTO `ysk_moneyils` VALUES('251','1726','1688','3.20','9','1','1523641294');
INSERT INTO `ysk_moneyils` VALUES('252','1730','1688','8.00','10','2','1523659046');
INSERT INTO `ysk_moneyils` VALUES('253','1734','1688','3.20','7','1','1523660929');
INSERT INTO `ysk_moneyils` VALUES('254','1703','1688','0.96','6','1','1523661995');
INSERT INTO `ysk_moneyils` VALUES('255','1703','1688','8.00','6','2','1523662058');
INSERT INTO `ysk_moneyils` VALUES('256','1724','1688','8.00','9','2','1523665751');
INSERT INTO `ysk_moneyils` VALUES('257','1731','1688','8.00','10','2','1523667020');
INSERT INTO `ysk_moneyils` VALUES('258','1742','1688','3.20','7','1','1523668180');
INSERT INTO `ysk_moneyils` VALUES('259','1743','1688','3.20','7','1','1523668221');
INSERT INTO `ysk_moneyils` VALUES('260','1700','1688','960.00','3','1','1523668667');
INSERT INTO `ysk_moneyils` VALUES('261','1700','1688','3840.00','3','2','1523669537');
INSERT INTO `ysk_moneyils` VALUES('262','1745','1688','3.20','3','1','1523672467');
INSERT INTO `ysk_moneyils` VALUES('263','1689','1688','16000.00','1','2','1523672935');
INSERT INTO `ysk_moneyils` VALUES('264','1702','1688','2000.00','5','1','1523679204');
INSERT INTO `ysk_moneyils` VALUES('265','1702','1688','8000.00','5','2','1523679275');
INSERT INTO `ysk_moneyils` VALUES('266','1726','1688','8.00','9','2','1523681838');
INSERT INTO `ysk_moneyils` VALUES('267','1709','1688','8.00','7','2','1523688845');
INSERT INTO `ysk_moneyils` VALUES('268','1735','1688','8.00','8','2','1523698217');
INSERT INTO `ysk_moneyils` VALUES('269','1694','1688','4.16','3','1','1523703933');
INSERT INTO `ysk_moneyils` VALUES('270','1692','1688','400.00','2','1','1523704039');
INSERT INTO `ysk_moneyils` VALUES('271','1692','1688','1200.00','2','1','1523704209');
INSERT INTO `ysk_moneyils` VALUES('272','1708','1688','8.00','4','2','1523704861');
INSERT INTO `ysk_moneyils` VALUES('273','1695','1688','8.00','3','2','1523705446');
INSERT INTO `ysk_moneyils` VALUES('274','1723','1688','8.00','9','2','1523707879');
INSERT INTO `ysk_moneyils` VALUES('275','1702','1688','1200.00','5','1','1523711000');
INSERT INTO `ysk_moneyils` VALUES('276','1753','1688','3.20','4','1','1523713023');
INSERT INTO `ysk_moneyils` VALUES('277','1754','1688','3.20','4','1','1523713056');
INSERT INTO `ysk_moneyils` VALUES('278','1757','1688','3.20','9','1','1523713106');
INSERT INTO `ysk_moneyils` VALUES('279','1755','1688','3.20','9','1','1523713152');
INSERT INTO `ysk_moneyils` VALUES('280','1748','1688','3.20','9','1','1523713185');
INSERT INTO `ysk_moneyils` VALUES('281','1740','1688','8.00','7','2','1523719557');
INSERT INTO `ysk_moneyils` VALUES('282','1736','1688','8.00','2','2','1523723709');
INSERT INTO `ysk_moneyils` VALUES('283','1762','1688','3.20','5','1','1523746675');
INSERT INTO `ysk_moneyils` VALUES('284','1694','1688','8.00','3','2','1523747175');
INSERT INTO `ysk_moneyils` VALUES('285','1695','1688','8.00','3','2','1523747212');
INSERT INTO `ysk_moneyils` VALUES('286','1756','1688','3.20','10','1','1523749305');
INSERT INTO `ysk_moneyils` VALUES('287','1717','1688','3.20','7','1','1523749334');
INSERT INTO `ysk_moneyils` VALUES('288','1702','1688','4888.00','5','2','1523749469');
INSERT INTO `ysk_moneyils` VALUES('289','1769','1688','3.20','4','1','1523749620');
INSERT INTO `ysk_moneyils` VALUES('290','1759','1688','3.20','2','1','1523751493');
INSERT INTO `ysk_moneyils` VALUES('291','1759','1688','8.00','2','2','1523752740');
INSERT INTO `ysk_moneyils` VALUES('292','1763','1702','3.20','4','1','1523754155');
INSERT INTO `ysk_moneyils` VALUES('293','1717','1702','16.00','2','2','1523755650');
INSERT INTO `ysk_moneyils` VALUES('294','1737','1702','8.00','2','2','1523755831');
INSERT INTO `ysk_moneyils` VALUES('295','1762','1688','8.00','5','2','1523761332');
INSERT INTO `ysk_moneyils` VALUES('296','1755','1702','8.00','4','2','1523762655');
INSERT INTO `ysk_moneyils` VALUES('297','1756','1702','8.00','5','2','1523764817');
INSERT INTO `ysk_moneyils` VALUES('298','1764','1702','3.20','3','1','1523771308');
INSERT INTO `ysk_moneyils` VALUES('299','1765','1702','3.20','3','1','1523771343');
INSERT INTO `ysk_moneyils` VALUES('300','1766','1702','3.20','3','1','1523771380');
INSERT INTO `ysk_moneyils` VALUES('301','1767','1702','3.20','3','1','1523771426');
INSERT INTO `ysk_moneyils` VALUES('302','1768','1702','3.20','3','1','1523771458');
INSERT INTO `ysk_moneyils` VALUES('303','1770','1702','3.20','3','1','1523771571');
INSERT INTO `ysk_moneyils` VALUES('304','1771','1702','3.20','3','1','1523771611');
INSERT INTO `ysk_moneyils` VALUES('305','1772','1702','3.20','3','1','1523771714');
INSERT INTO `ysk_moneyils` VALUES('306','1773','1702','3.20','3','1','1523771751');
INSERT INTO `ysk_moneyils` VALUES('307','1777','1702','3.20','3','1','1523771797');
INSERT INTO `ysk_moneyils` VALUES('308','1778','1702','3.20','4','1','1523771859');
INSERT INTO `ysk_moneyils` VALUES('309','1775','1702','3.20','3','1','1523772112');
INSERT INTO `ysk_moneyils` VALUES('310','1757','1702','8.00','4','2','1523773537');
INSERT INTO `ysk_moneyils` VALUES('311','1777','1702','8.00','3','2','1523775233');
INSERT INTO `ysk_moneyils` VALUES('312','1775','1702','8.00','3','2','1523782668');
INSERT INTO `ysk_moneyils` VALUES('313','1754','1688','8.00','4','2','1523786160');
INSERT INTO `ysk_moneyils` VALUES('314','1785','1702','3.20','4','1','1523786314');
INSERT INTO `ysk_moneyils` VALUES('315','1779','1702','3.20','4','1','1523786344');
INSERT INTO `ysk_moneyils` VALUES('316','1782','1702','3.20','4','1','1523786385');
INSERT INTO `ysk_moneyils` VALUES('317','1786','1702','3.20','4','1','1523786428');
INSERT INTO `ysk_moneyils` VALUES('318','1789','1702','3.20','4','1','1523786473');
INSERT INTO `ysk_moneyils` VALUES('319','1774','1702','3.20','5','1','1523786563');
INSERT INTO `ysk_moneyils` VALUES('320','1790','1702','3.20','5','1','1523786596');
INSERT INTO `ysk_moneyils` VALUES('321','1787','1702','3.20','5','1','1523786627');
INSERT INTO `ysk_moneyils` VALUES('322','1741','1702','3.20','5','1','1523786738');
INSERT INTO `ysk_moneyils` VALUES('323','1792','1702','3.20','5','1','1523786771');
INSERT INTO `ysk_moneyils` VALUES('324','1782','1702','8.00','4','2','1523786858');
INSERT INTO `ysk_moneyils` VALUES('325','1701','1688','3.20','4','1','1523787701');
INSERT INTO `ysk_moneyils` VALUES('326','1789','1702','8.00','4','2','1523789734');
INSERT INTO `ysk_moneyils` VALUES('327','1792','1702','8.00','5','2','1523794516');
INSERT INTO `ysk_moneyils` VALUES('328','1753','1688','8.00','4','2','1523798031');
INSERT INTO `ysk_moneyils` VALUES('329','1779','1702','8.00','4','2','1523799280');
INSERT INTO `ysk_moneyils` VALUES('330','1701','1688','8.00','4','2','1523805141');
INSERT INTO `ysk_moneyils` VALUES('331','1807','1702','3.20','3','1','1523831887');
INSERT INTO `ysk_moneyils` VALUES('332','1808','1702','3.20','3','1','1523831920');
INSERT INTO `ysk_moneyils` VALUES('333','1809','1702','3.20','3','1','1523831961');
INSERT INTO `ysk_moneyils` VALUES('334','1797','1702','3.20','5','1','1523833085');
INSERT INTO `ysk_moneyils` VALUES('335','1796','1702','3.20','5','1','1523833114');
INSERT INTO `ysk_moneyils` VALUES('336','1791','1702','3.20','6','1','1523833153');
INSERT INTO `ysk_moneyils` VALUES('337','1803','1702','3.20','4','1','1523833185');
INSERT INTO `ysk_moneyils` VALUES('338','1774','1702','8.00','5','2','1523833294');
INSERT INTO `ysk_moneyils` VALUES('339','1701','1688','8.00','4','1','1523833620');
INSERT INTO `ysk_moneyils` VALUES('340','1775','1702','1.14','3','1','1523833645');
INSERT INTO `ysk_moneyils` VALUES('341','1717','1702','1.89','2','1','1523833856');
INSERT INTO `ysk_moneyils` VALUES('342','1694','1688','8.00','3','2','1523835508');
INSERT INTO `ysk_moneyils` VALUES('343','1800','1702','2.57','4','1','1523837179');
INSERT INTO `ysk_moneyils` VALUES('344','1796','1702','8.00','5','2','1523839191');
INSERT INTO `ysk_moneyils` VALUES('345','1797','1702','8.00','5','2','1523839350');
INSERT INTO `ysk_moneyils` VALUES('346','1705','1702','2.40','3','1','1523839908');
INSERT INTO `ysk_moneyils` VALUES('347','1790','1702','8.00','5','2','1523839965');
INSERT INTO `ysk_moneyils` VALUES('348','1791','1702','8.00','6','2','1523840174');
INSERT INTO `ysk_moneyils` VALUES('349','1816','1702','3.20','2','1','1523845666');
INSERT INTO `ysk_moneyils` VALUES('350','1799','1702','3.20','6','1','1523845710');
INSERT INTO `ysk_moneyils` VALUES('351','1806','1702','3.20','6','1','1523845746');
INSERT INTO `ysk_moneyils` VALUES('352','1818','1702','3.20','7','1','1523845803');
INSERT INTO `ysk_moneyils` VALUES('353','1819','1702','3.20','7','1','1523845861');
INSERT INTO `ysk_moneyils` VALUES('354','1800','1702','3.20','4','1','1523846062');
INSERT INTO `ysk_moneyils` VALUES('355','1801','1702','3.20','4','1','1523846093');
INSERT INTO `ysk_moneyils` VALUES('356','1802','1702','3.20','4','1','1523846136');
INSERT INTO `ysk_moneyils` VALUES('357','1804','1702','3.20','4','1','1523846167');
INSERT INTO `ysk_moneyils` VALUES('358','1805','1702','3.20','4','1','1523846213');
INSERT INTO `ysk_moneyils` VALUES('359','1785','1702','8.00','4','2','1523857125');
INSERT INTO `ysk_moneyils` VALUES('360','1786','1702','8.00','4','2','1523857872');
INSERT INTO `ysk_moneyils` VALUES('361','1787','1702','8.00','5','2','1523860775');
INSERT INTO `ysk_moneyils` VALUES('362','1831','1689','4.16','1','1','1523871420');
INSERT INTO `ysk_moneyils` VALUES('363','1831','1689','8.00','1','2','1523871494');
INSERT INTO `ysk_moneyils` VALUES('364','1831','1689','8.00','1','2','1523871512');
INSERT INTO `ysk_moneyils` VALUES('365','1705','1702','16.00','3','2','1523877627');
INSERT INTO `ysk_moneyils` VALUES('366','1757','1702','8.00','4','1','1523881188');
INSERT INTO `ysk_moneyils` VALUES('367','1818','1702','8.00','7','2','1523886300');
INSERT INTO `ysk_moneyils` VALUES('368','1803','1702','8.00','4','2','1523886360');
INSERT INTO `ysk_moneyils` VALUES('369','1799','1702','8.00','6','2','1523891696');
INSERT INTO `ysk_moneyils` VALUES('370','1750','1688','16.00','2','1','1523895352');
INSERT INTO `ysk_moneyils` VALUES('371','1825','1702','3.20','6','1','1523895670');
INSERT INTO `ysk_moneyils` VALUES('372','1837','1702','3.20','7','1','1523895710');
INSERT INTO `ysk_moneyils` VALUES('373','1822','1702','3.20','3','1','1523895898');
INSERT INTO `ysk_moneyils` VALUES('374','1794','1702','3.20','6','1','1523895934');
INSERT INTO `ysk_moneyils` VALUES('375','1812','1702','3.20','3','1','1523895974');
INSERT INTO `ysk_moneyils` VALUES('376','1827','1702','3.20','1','1','1523896143');
INSERT INTO `ysk_moneyils` VALUES('377','1841','1689','4.16','2','1','1523896721');
INSERT INTO `ysk_moneyils` VALUES('378','1841','1689','16.00','2','2','1523897196');
INSERT INTO `ysk_moneyils` VALUES('379','1712','1702','0.61','4','1','1523916232');
INSERT INTO `ysk_moneyils` VALUES('380','1712','1702','0.32','4','1','1523916449');
INSERT INTO `ysk_moneyils` VALUES('381','1712','1702','8.00','4','2','1523916538');
INSERT INTO `ysk_moneyils` VALUES('382','1695','1688','8.00','3','2','1523917874');
INSERT INTO `ysk_moneyils` VALUES('383','1843','1702','3.20','4','1','1523918325');
INSERT INTO `ysk_moneyils` VALUES('384','1839','1702','3.20','4','1','1523918371');
INSERT INTO `ysk_moneyils` VALUES('385','1811','1702','3.20','4','1','1523918413');
INSERT INTO `ysk_moneyils` VALUES('386','1810','1702','3.20','4','1','1523918466');
INSERT INTO `ysk_moneyils` VALUES('387','1798','1702','3.20','4','1','1523918580');
INSERT INTO `ysk_moneyils` VALUES('388','1784','1702','3.20','4','1','1523918645');
INSERT INTO `ysk_moneyils` VALUES('389','1781','1702','3.20','4','1','1523918698');
INSERT INTO `ysk_moneyils` VALUES('390','1780','1702','3.20','4','1','1523918746');
INSERT INTO `ysk_moneyils` VALUES('391','1847','1702','3.20','4','1','1523918815');
INSERT INTO `ysk_moneyils` VALUES('392','1836','1702','3.20','4','1','1523918880');
INSERT INTO `ysk_moneyils` VALUES('393','1835','1702','3.20','4','1','1523918926');
INSERT INTO `ysk_moneyils` VALUES('394','1834','1702','3.20','4','1','1523918981');
INSERT INTO `ysk_moneyils` VALUES('395','1833','1702','3.20','4','1','1523919031');
INSERT INTO `ysk_moneyils` VALUES('396','1824','1702','3.20','4','1','1523919076');
INSERT INTO `ysk_moneyils` VALUES('397','1799','1702','8.80','6','1','1523919168');
INSERT INTO `ysk_moneyils` VALUES('398','1774','1702','16.80','5','1','1523919236');
INSERT INTO `ysk_moneyils` VALUES('399','1797','1702','0.96','5','1','1523921225');
INSERT INTO `ysk_moneyils` VALUES('400','1797','1702','8.00','5','2','1523921326');
INSERT INTO `ysk_moneyils` VALUES('401','1736','1688','8.00','2','2','1523922196');
INSERT INTO `ysk_moneyils` VALUES('402','1712','1702','8.00','4','1','1523924465');
INSERT INTO `ysk_moneyils` VALUES('403','1731','1702','0.18','5','1','1523926298');
INSERT INTO `ysk_moneyils` VALUES('404','1730','1702','1.15','5','1','1523926456');
INSERT INTO `ysk_moneyils` VALUES('405','1819','1702','8.00','7','2','1523928882');
INSERT INTO `ysk_moneyils` VALUES('406','1709','1702','2.56','2','1','1523937238');
INSERT INTO `ysk_moneyils` VALUES('407','1837','1702','8.00','7','2','1523938152');
INSERT INTO `ysk_moneyils` VALUES('408','1851','1702','3.20','2','1','1523939411');
INSERT INTO `ysk_moneyils` VALUES('409','1853','1702','3.20','4','1','1523939461');
INSERT INTO `ysk_moneyils` VALUES('410','1709','1702','0.48','2','1','1523939684');
INSERT INTO `ysk_moneyils` VALUES('411','1709','1702','2.08','2','1','1523940937');
INSERT INTO `ysk_moneyils` VALUES('412','1780','1702','8.00','4','2','1523943209');
INSERT INTO `ysk_moneyils` VALUES('413','1706','1702','0.64','4','1','1523953896');
INSERT INTO `ysk_moneyils` VALUES('414','1706','1702','8.00','4','2','1523953941');
INSERT INTO `ysk_moneyils` VALUES('415','1854','1702','3.20','8','1','1523956040');
INSERT INTO `ysk_moneyils` VALUES('416','1850','1702','3.20','6','1','1523956076');
INSERT INTO `ysk_moneyils` VALUES('417','1855','1702','3.20','8','1','1523956109');
INSERT INTO `ysk_moneyils` VALUES('418','1842','1702','3.20','4','1','1523956151');
INSERT INTO `ysk_moneyils` VALUES('419','1852','1702','3.20','4','1','1523956185');
INSERT INTO `ysk_moneyils` VALUES('420','1862','1702','3.20','5','1','1523956225');
INSERT INTO `ysk_moneyils` VALUES('421','1815','1702','3.20','4','1','1523956258');
INSERT INTO `ysk_moneyils` VALUES('422','1694','1688','3.20','3','1','1523956305');
INSERT INTO `ysk_moneyils` VALUES('423','1693','1688','2.08','3','1','1523956366');
INSERT INTO `ysk_moneyils` VALUES('424','1787','1702','8.80','5','1','1523956507');
INSERT INTO `ysk_moneyils` VALUES('425','1791','1702','8.00','6','1','1523957543');
INSERT INTO `ysk_moneyils` VALUES('426','1850','1702','8.00','6','2','1523958593');
INSERT INTO `ysk_moneyils` VALUES('427','1741','1702','8.00','5','2','1523966772');
INSERT INTO `ysk_moneyils` VALUES('428','1730','1702','0.96','5','1','1523966840');
INSERT INTO `ysk_moneyils` VALUES('429','1695','1688','0.24','3','1','1523967817');
INSERT INTO `ysk_moneyils` VALUES('430','1693','1688','0.13','3','1','1523972519');
INSERT INTO `ysk_moneyils` VALUES('431','1822','1702','2.56','3','1','1523973998');
INSERT INTO `ysk_moneyils` VALUES('432','1822','1702','2.56','3','1','1523974297');
INSERT INTO `ysk_moneyils` VALUES('433','1693','1688','8.00','3','2','1523974404');
INSERT INTO `ysk_moneyils` VALUES('434','1822','1702','2.56','3','1','1523974525');
INSERT INTO `ysk_moneyils` VALUES('435','1822','1702','2.56','3','1','1523974641');
INSERT INTO `ysk_moneyils` VALUES('436','1822','1702','2.56','3','1','1523974732');
INSERT INTO `ysk_moneyils` VALUES('437','2088','1689','3200.00','2','1','1523976236');
INSERT INTO `ysk_moneyils` VALUES('438','2088','1689','12800.00','2','2','1523976328');
INSERT INTO `ysk_moneyils` VALUES('439','1718','1702','8.00','2','2','1523977119');
INSERT INTO `ysk_moneyils` VALUES('440','1848','1702','1.60','6','1','1523978520');
INSERT INTO `ysk_moneyils` VALUES('441','1757','1702','1.60','4','1','1523979331');
INSERT INTO `ysk_moneyils` VALUES('442','2088','1689','160.00','2','2','1523981780');
INSERT INTO `ysk_moneyils` VALUES('443','1860','1702','3.20','4','1','1523985143');
INSERT INTO `ysk_moneyils` VALUES('444','1865','1702','3.20','2','1','1523985217');
INSERT INTO `ysk_moneyils` VALUES('445','1867','1702','3.20','2','1','1523985256');
INSERT INTO `ysk_moneyils` VALUES('446','1872','1702','3.20','2','1','1523985297');
INSERT INTO `ysk_moneyils` VALUES('447','1877','1702','3.20','2','1','1523985341');
INSERT INTO `ysk_moneyils` VALUES('448','1866','1702','3.20','3','1','1523985382');
INSERT INTO `ysk_moneyils` VALUES('449','1873','1702','3.20','2','1','1523985417');
INSERT INTO `ysk_moneyils` VALUES('450','1870','1702','3.20','2','1','1523985451');
INSERT INTO `ysk_moneyils` VALUES('451','1869','1702','3.20','3','1','1523985503');
INSERT INTO `ysk_moneyils` VALUES('452','1874','1702','3.20','2','1','1523985537');
INSERT INTO `ysk_moneyils` VALUES('453','1868','1702','3.20','2','1','1523985578');
INSERT INTO `ysk_moneyils` VALUES('454','1879','1702','3.20','3','1','1523985652');
INSERT INTO `ysk_moneyils` VALUES('455','1856','1702','3.20','3','1','1523985690');
INSERT INTO `ysk_moneyils` VALUES('456','1788','1702','3.20','3','1','1523985740');
INSERT INTO `ysk_moneyils` VALUES('457','2084','1702','3.20','2','1','1523985784');
INSERT INTO `ysk_moneyils` VALUES('458','1863','1702','3.20','9','1','1523986163');
INSERT INTO `ysk_moneyils` VALUES('459','1864','1702','3.20','6','1','1523986206');
INSERT INTO `ysk_moneyils` VALUES('460','1871','1702','3.20','8','1','1523986243');
INSERT INTO `ysk_moneyils` VALUES('461','2082','1702','3.20','5','1','1523986288');
INSERT INTO `ysk_moneyils` VALUES('462','1853','1702','8.00','4','2','1523994143');
INSERT INTO `ysk_moneyils` VALUES('463','1730','1702','0.24','5','1','1524007123');
INSERT INTO `ysk_moneyils` VALUES('464','1731','1702','0.38','5','1','1524007203');
INSERT INTO `ysk_moneyils` VALUES('465','1712','1702','0.34','4','1','1524007313');
INSERT INTO `ysk_moneyils` VALUES('466','1731','1702','0.27','5','1','1524007418');
INSERT INTO `ysk_moneyils` VALUES('467','1797','1702','0.03','5','1','1524007675');
INSERT INTO `ysk_moneyils` VALUES('468','1796','1702','0.21','5','1','1524007760');
INSERT INTO `ysk_moneyils` VALUES('469','1815','1702','8.00','4','2','1524009795');
INSERT INTO `ysk_moneyils` VALUES('470','1704','1702','8.00','2','2','1524012443');
INSERT INTO `ysk_moneyils` VALUES('471','1774','1702','0.80','5','1','1524013920');
INSERT INTO `ysk_moneyils` VALUES('472','1848','1702','3.20','6','1','1524027092');
INSERT INTO `ysk_moneyils` VALUES('473','1846','1702','3.20','6','1','1524027120');
INSERT INTO `ysk_moneyils` VALUES('474','1844','1702','3.20','5','1','1524027155');
INSERT INTO `ysk_moneyils` VALUES('475','1845','1702','3.20','5','1','1524027190');
INSERT INTO `ysk_moneyils` VALUES('476','1825','1702','3.20','6','1','1524027219');
INSERT INTO `ysk_moneyils` VALUES('477','2086','1702','3.20','5','1','1524027317');
INSERT INTO `ysk_moneyils` VALUES('478','2085','1702','3.20','5','1','1524027353');
INSERT INTO `ysk_moneyils` VALUES('479','2081','1702','3.20','5','1','1524027384');
INSERT INTO `ysk_moneyils` VALUES('480','2099','1702','3.20','3','1','1524027443');
INSERT INTO `ysk_moneyils` VALUES('481','2098','1702','3.20','3','1','1524027518');
INSERT INTO `ysk_moneyils` VALUES('482','2095','1702','3.20','5','1','1524027586');
INSERT INTO `ysk_moneyils` VALUES('483','1817','1702','3.20','5','1','1524027637');
INSERT INTO `ysk_moneyils` VALUES('484','2091','1702','3.20','2','1','1524027694');
INSERT INTO `ysk_moneyils` VALUES('485','2096','1702','3.20','2','1','1524027751');
INSERT INTO `ysk_moneyils` VALUES('486','2105','1702','3.20','3','1','1524028375');
INSERT INTO `ysk_moneyils` VALUES('487','2103','1702','3.20','3','1','1524028435');
INSERT INTO `ysk_moneyils` VALUES('488','1879','1702','3.20','3','1','1524028481');
INSERT INTO `ysk_moneyils` VALUES('489','1709','1702','2.56','2','1','1524030885');
INSERT INTO `ysk_moneyils` VALUES('490','2104','1702','3.20','5','1','1524042397');
INSERT INTO `ysk_moneyils` VALUES('491','2102','1702','3.20','5','1','1524042470');
INSERT INTO `ysk_moneyils` VALUES('492','2106','1702','3.20','4','1','1524042877');
INSERT INTO `ysk_moneyils` VALUES('493','2109','1702','3.20','3','1','1524042906');
INSERT INTO `ysk_moneyils` VALUES('494','2110','1702','3.20','3','1','1524042940');
INSERT INTO `ysk_moneyils` VALUES('495','2107','1702','3.20','2','1','1524043023');
INSERT INTO `ysk_moneyils` VALUES('496','2111','1702','3.20','3','1','1524043925');
INSERT INTO `ysk_moneyils` VALUES('497','2113','1702','3.20','5','1','1524046155');
INSERT INTO `ysk_moneyils` VALUES('498','1859','1702','3.20','4','1','1524047630');
INSERT INTO `ysk_moneyils` VALUES('499','1711','1688','8.00','2','2','1524048097');
INSERT INTO `ysk_moneyils` VALUES('500','1693','1688','1.60','3','1','1524051927');
INSERT INTO `ysk_moneyils` VALUES('501','1706','1702','4.00','4','1','1524052077');
INSERT INTO `ysk_moneyils` VALUES('502','1693','1688','0.48','3','1','1524052476');
INSERT INTO `ysk_moneyils` VALUES('503','1693','1688','8.00','3','2','1524052518');
INSERT INTO `ysk_moneyils` VALUES('504','1705','1702','28.00','3','1','1524052923');
INSERT INTO `ysk_moneyils` VALUES('505','1861','1702','3.20','4','1','1524057048');
INSERT INTO `ysk_moneyils` VALUES('506','1730','1702','0.21','5','1','1524059173');
INSERT INTO `ysk_moneyils` VALUES('507','1712','1702','0.18','4','1','1524059266');
INSERT INTO `ysk_moneyils` VALUES('508','1741','1702','0.13','5','1','1524059353');
INSERT INTO `ysk_moneyils` VALUES('509','1731','1702','0.13','5','1','1524059485');
INSERT INTO `ysk_moneyils` VALUES('510','1712','1702','0.11','4','1','1524059618');
INSERT INTO `ysk_moneyils` VALUES('511','1701','1688','16.00','4','2','1524060089');
INSERT INTO `ysk_moneyils` VALUES('512','1704','1702','1.60','2','1','1524060227');
INSERT INTO `ysk_moneyils` VALUES('513','1704','1702','0.48','2','1','1524060893');
INSERT INTO `ysk_moneyils` VALUES('514','1704','1702','8.00','2','2','1524060944');
INSERT INTO `ysk_moneyils` VALUES('515','1757','1702','8.00','4','2','1524063141');
INSERT INTO `ysk_moneyils` VALUES('516','1774','1702','0.96','5','1','1524063417');
INSERT INTO `ysk_moneyils` VALUES('517','1774','1702','8.00','5','2','1524063682');
INSERT INTO `ysk_moneyils` VALUES('518','1848','1702','2.56','6','1','1524064328');
INSERT INTO `ysk_moneyils` VALUES('519','2124','1702','3.20','3','1','1524064934');
INSERT INTO `ysk_moneyils` VALUES('520','2123','1702','3.20','3','1','1524064965');
INSERT INTO `ysk_moneyils` VALUES('521','2122','1702','3.20','3','1','1524064994');
INSERT INTO `ysk_moneyils` VALUES('522','2120','1702','3.20','3','1','1524065029');
INSERT INTO `ysk_moneyils` VALUES('523','2118','1702','3.20','3','1','1524065094');
INSERT INTO `ysk_moneyils` VALUES('524','2116','1702','3.20','3','1','1524065150');
INSERT INTO `ysk_moneyils` VALUES('525','1876','1702','3.20','7','1','1524065397');
INSERT INTO `ysk_moneyils` VALUES('526','2128','1702','3.20','2','1','1524065478');
INSERT INTO `ysk_moneyils` VALUES('527','2129','1702','3.20','3','1','1524065511');
INSERT INTO `ysk_moneyils` VALUES('528','2130','1702','3.20','5','1','1524065558');
INSERT INTO `ysk_moneyils` VALUES('529','2132','1702','3.20','5','1','1524065602');
INSERT INTO `ysk_moneyils` VALUES('530','2114','1702','3.20','7','1','1524065759');
INSERT INTO `ysk_moneyils` VALUES('531','2112','1702','3.20','7','1','1524065792');
INSERT INTO `ysk_moneyils` VALUES('532','2094','1702','3.20','5','1','1524065873');
INSERT INTO `ysk_moneyils` VALUES('533','2119','1702','3.20','5','1','1524065907');
INSERT INTO `ysk_moneyils` VALUES('534','2117','1688','3.20','5','1','1524065955');
INSERT INTO `ysk_moneyils` VALUES('535','2121','1688','3.20','5','1','1524066046');
INSERT INTO `ysk_moneyils` VALUES('536','2127','1688','3.20','5','1','1524066086');
INSERT INTO `ysk_moneyils` VALUES('537','2126','1702','3.20','5','1','1524066114');
INSERT INTO `ysk_moneyils` VALUES('538','2125','1702','3.20','5','1','1524066145');
INSERT INTO `ysk_moneyils` VALUES('539','1848','1702','3.20','6','1','1524066449');
INSERT INTO `ysk_moneyils` VALUES('540','1846','1702','3.20','6','1','1524066482');
INSERT INTO `ysk_moneyils` VALUES('541','1848','1702','2.56','6','1','1524066581');
INSERT INTO `ysk_moneyils` VALUES('542','1784','1702','8.00','4','2','1524082647');
INSERT INTO `ysk_moneyils` VALUES('543','1736','1688','8.00','2','2','1524088614');
INSERT INTO `ysk_moneyils` VALUES('544','1702','1688','320.00','5','1','1524088620');
INSERT INTO `ysk_moneyils` VALUES('545','1797','1702','0.19','5','1','1524094111');
INSERT INTO `ysk_moneyils` VALUES('546','2102','1702','1.60','5','1','1524098133');
INSERT INTO `ysk_moneyils` VALUES('547','2102','1702','8.00','5','2','1524098471');
INSERT INTO `ysk_moneyils` VALUES('548','2102','1702','8.00','5','2','1524098729');
INSERT INTO `ysk_moneyils` VALUES('549','2104','1702','0.64','5','1','1524098829');
INSERT INTO `ysk_moneyils` VALUES('550','1709','1702','2.56','2','1','1524105432');
INSERT INTO `ysk_moneyils` VALUES('551','2108','1702','3.20','4','1','1524112133');
INSERT INTO `ysk_moneyils` VALUES('552','2131','1702','3.20','4','1','1524112160');
INSERT INTO `ysk_moneyils` VALUES('553','2133','1702','3.20','3','1','1524112203');
INSERT INTO `ysk_moneyils` VALUES('554','1861','1702','3.20','4','1','1524112238');
INSERT INTO `ysk_moneyils` VALUES('555','1829','1702','3.20','3','1','1524112284');
INSERT INTO `ysk_moneyils` VALUES('556','2138','1702','3.20','4','1','1524112313');
INSERT INTO `ysk_moneyils` VALUES('557','2142','1702','3.20','4','1','1524112346');
INSERT INTO `ysk_moneyils` VALUES('558','2143','1702','3.20','3','1','1524112388');
INSERT INTO `ysk_moneyils` VALUES('559','2144','1702','3.20','4','1','1524112421');
INSERT INTO `ysk_moneyils` VALUES('560','1709','1702','2.56','2','1','1524115410');
INSERT INTO `ysk_moneyils` VALUES('561','1709','1702','2.56','2','1','1524115551');
INSERT INTO `ysk_moneyils` VALUES('562','2147','1702','3.20','3','1','1524116970');
INSERT INTO `ysk_moneyils` VALUES('563','2148','1702','3.20','3','1','1524117006');
INSERT INTO `ysk_moneyils` VALUES('564','2149','1702','3.20','4','1','1524117052');
INSERT INTO `ysk_moneyils` VALUES('565','2151','1702','3.20','4','1','1524117086');
INSERT INTO `ysk_moneyils` VALUES('566','2146','1702','3.20','3','1','1524117124');
INSERT INTO `ysk_moneyils` VALUES('567','2150','1702','3.20','3','1','1524117155');
INSERT INTO `ysk_moneyils` VALUES('568','2153','1702','3.20','3','1','1524117192');
INSERT INTO `ysk_moneyils` VALUES('569','1709','1702','2.56','2','1','1524117212');
INSERT INTO `ysk_moneyils` VALUES('570','2150','1702','3.20','3','1','1524117229');
INSERT INTO `ysk_moneyils` VALUES('571','1709','1702','2.56','2','1','1524117323');
INSERT INTO `ysk_moneyils` VALUES('572','2152','1702','3.20','4','1','1524117337');
INSERT INTO `ysk_moneyils` VALUES('573','2154','1702','3.20','4','1','1524117375');
INSERT INTO `ysk_moneyils` VALUES('574','2155','1702','3.20','3','1','1524117405');
INSERT INTO `ysk_moneyils` VALUES('575','1853','1702','2.56','4','1','1524117410');
INSERT INTO `ysk_moneyils` VALUES('576','2150','1702','8.00','3','1','1524117512');
INSERT INTO `ysk_moneyils` VALUES('577','1853','1702','2.56','4','1','1524117531');
INSERT INTO `ysk_moneyils` VALUES('578','2152','1702','8.00','4','1','1524117579');
INSERT INTO `ysk_moneyils` VALUES('579','1853','1702','2.56','4','1','1524117630');
INSERT INTO `ysk_moneyils` VALUES('580','1853','1702','2.56','4','1','1524117711');
INSERT INTO `ysk_moneyils` VALUES('581','1773','1702','2.56','3','1','1524117769');
INSERT INTO `ysk_moneyils` VALUES('582','1773','1702','2.56','3','1','1524117834');
INSERT INTO `ysk_moneyils` VALUES('583','1773','1702','2.56','3','1','1524117969');
INSERT INTO `ysk_moneyils` VALUES('584','2154','1702','8.00','4','1','1524118059');
INSERT INTO `ysk_moneyils` VALUES('585','2138','1702','8.00','4','2','1524123409');
INSERT INTO `ysk_moneyils` VALUES('586','1731','1702','0.22','5','1','1524124126');
INSERT INTO `ysk_moneyils` VALUES('587','1730','1702','0.19','5','1','1524124218');
INSERT INTO `ysk_moneyils` VALUES('588','1712','1702','0.18','4','1','1524124752');
INSERT INTO `ysk_moneyils` VALUES('589','1730','1702','0.14','5','1','1524125465');
INSERT INTO `ysk_moneyils` VALUES('590','1741','1702','0.11','5','1','1524125561');
INSERT INTO `ysk_moneyils` VALUES('591','1731','1702','0.10','5','1','1524125681');
INSERT INTO `ysk_moneyils` VALUES('592','2143','1702','2.56','3','1','1524130122');
INSERT INTO `ysk_moneyils` VALUES('593','2143','1702','2.56','3','1','1524130897');
INSERT INTO `ysk_moneyils` VALUES('594','2143','1702','1.44','3','1','1524131652');
INSERT INTO `ysk_moneyils` VALUES('595','2143','1702','0.70','3','1','1524131795');
INSERT INTO `ysk_moneyils` VALUES('596','1777','1702','5.12','3','1','1524132065');
INSERT INTO `ysk_moneyils` VALUES('597','1709','1702','1.60','2','1','1524132196');
INSERT INTO `ysk_moneyils` VALUES('598','2143','1702','0.74','3','1','1524132282');
INSERT INTO `ysk_moneyils` VALUES('599','1870','1702','2.56','2','1','1524133335');
INSERT INTO `ysk_moneyils` VALUES('600','2133','1702','2.56','3','1','1524133383');
INSERT INTO `ysk_moneyils` VALUES('601','1848','1702','8.00','6','2','1524138307');
INSERT INTO `ysk_moneyils` VALUES('602','1695','1688','8.00','3','1','1524143645');
INSERT INTO `ysk_moneyils` VALUES('603','1689','1688','80.00','1','2','1524145670');
INSERT INTO `ysk_moneyils` VALUES('604','1709','1702','16.00','2','1','1524146025');
INSERT INTO `ysk_moneyils` VALUES('605','1718','1702','8.00','2','1','1524146463');
INSERT INTO `ysk_moneyils` VALUES('606','1745','1688','8.00','3','1','1524146631');
INSERT INTO `ysk_moneyils` VALUES('607','2142','1702','8.00','4','2','1524147125');
INSERT INTO `ysk_moneyils` VALUES('608','1740','1702','16.00','2','1','1524147608');
INSERT INTO `ysk_moneyils` VALUES('609','2519','1689','4.16','1','1','1524149767');
INSERT INTO `ysk_moneyils` VALUES('610','2519','1689','16.00','1','2','1524149822');
INSERT INTO `ysk_moneyils` VALUES('611','2520','1689','4.16','2','1','1524149916');
INSERT INTO `ysk_moneyils` VALUES('612','2520','1689','16.00','2','2','1524150007');
INSERT INTO `ysk_moneyils` VALUES('613','2090','1688','4.16','1','1','1524150053');
INSERT INTO `ysk_moneyils` VALUES('614','2090','1688','16.00','1','2','1524150658');
INSERT INTO `ysk_moneyils` VALUES('615','2156','1702','3.20','3','1','1524152278');
INSERT INTO `ysk_moneyils` VALUES('616','2158','1702','3.20','4','1','1524152342');
INSERT INTO `ysk_moneyils` VALUES('617','2160','1702','3.20','3','1','1524152387');
INSERT INTO `ysk_moneyils` VALUES('618','2157','1702','3.20','4','1','1524152440');
INSERT INTO `ysk_moneyils` VALUES('619','2159','1702','3.20','4','1','1524152485');
INSERT INTO `ysk_moneyils` VALUES('620','2161','1702','3.20','4','1','1524152557');
INSERT INTO `ysk_moneyils` VALUES('621','2164','1702','3.20','5','1','1524152598');
INSERT INTO `ysk_moneyils` VALUES('622','2168','1702','3.20','5','1','1524152632');
INSERT INTO `ysk_moneyils` VALUES('623','2169','1702','3.20','3','1','1524152666');
INSERT INTO `ysk_moneyils` VALUES('624','2170','1702','3.20','3','1','1524152705');
INSERT INTO `ysk_moneyils` VALUES('625','2171','1702','3.20','3','1','1524152739');
INSERT INTO `ysk_moneyils` VALUES('626','2176','1702','3.20','3','1','1524152775');
INSERT INTO `ysk_moneyils` VALUES('627','2175','1702','3.20','4','1','1524152811');
INSERT INTO `ysk_moneyils` VALUES('628','2177','1702','3.20','4','1','1524152865');
INSERT INTO `ysk_moneyils` VALUES('629','2179','1702','3.20','4','1','1524152904');
INSERT INTO `ysk_moneyils` VALUES('630','2181','1702','3.20','4','1','1524152949');
INSERT INTO `ysk_moneyils` VALUES('631','2184','1702','3.20','4','1','1524152988');
INSERT INTO `ysk_moneyils` VALUES('632','2185','1702','3.20','4','1','1524153038');
INSERT INTO `ysk_moneyils` VALUES('633','2186','1702','3.20','4','1','1524153124');
INSERT INTO `ysk_moneyils` VALUES('634','2188','1702','3.20','4','1','1524153159');
INSERT INTO `ysk_moneyils` VALUES('635','2189','1702','3.20','4','1','1524153192');
INSERT INTO `ysk_moneyils` VALUES('636','2190','1702','3.20','4','1','1524153226');
INSERT INTO `ysk_moneyils` VALUES('637','2193','1702','3.20','3','1','1524153355');
INSERT INTO `ysk_moneyils` VALUES('638','2210','1702','3.20','4','1','1524153536');
INSERT INTO `ysk_moneyils` VALUES('639','2211','1702','3.20','3','1','1524153635');
INSERT INTO `ysk_moneyils` VALUES('640','2209','1702','3.20','5','1','1524153693');
INSERT INTO `ysk_moneyils` VALUES('641','2208','1702','3.20','5','1','1524153729');
INSERT INTO `ysk_moneyils` VALUES('642','2207','1702','3.20','5','1','1524153765');
INSERT INTO `ysk_moneyils` VALUES('643','2206','1702','3.20','5','1','1524153816');
INSERT INTO `ysk_moneyils` VALUES('644','2205','1702','3.20','5','1','1524153850');
INSERT INTO `ysk_moneyils` VALUES('645','2204','1702','3.20','5','1','1524153892');
INSERT INTO `ysk_moneyils` VALUES('646','2203','1702','3.20','5','1','1524153967');
INSERT INTO `ysk_moneyils` VALUES('647','2202','1702','3.20','5','1','1524153998');
INSERT INTO `ysk_moneyils` VALUES('648','2201','1702','3.20','5','1','1524154038');
INSERT INTO `ysk_moneyils` VALUES('649','2200','1702','3.20','5','1','1524154075');
INSERT INTO `ysk_moneyils` VALUES('650','2198','1702','3.20','5','1','1524154111');
INSERT INTO `ysk_moneyils` VALUES('651','2197','1702','3.20','5','1','1524154209');
INSERT INTO `ysk_moneyils` VALUES('652','2196','1702','3.20','5','1','1524154247');
INSERT INTO `ysk_moneyils` VALUES('653','2195','1702','3.20','5','1','1524154349');
INSERT INTO `ysk_moneyils` VALUES('654','2192','1702','3.20','5','1','1524154475');
INSERT INTO `ysk_moneyils` VALUES('655','2191','1702','3.20','5','1','1524154513');
INSERT INTO `ysk_moneyils` VALUES('656','2168','1702','3.20','5','1','1524154560');
INSERT INTO `ysk_moneyils` VALUES('657','2517','1702','3.20','3','1','1524154677');
INSERT INTO `ysk_moneyils` VALUES('658','1875','1702','3.20','8','1','1524154711');
INSERT INTO `ysk_moneyils` VALUES('659','2214','1702','3.20','8','1','1524154800');
INSERT INTO `ysk_moneyils` VALUES('660','2515','1702','3.20','4','1','1524154846');
INSERT INTO `ysk_moneyils` VALUES('661','2215','1702','3.20','5','1','1524154890');
INSERT INTO `ysk_moneyils` VALUES('662','2141','1702','3.20','3','1','1524154941');
INSERT INTO `ysk_moneyils` VALUES('663','2167','1702','3.20','7','1','1524155530');
INSERT INTO `ysk_moneyils` VALUES('664','2215','1702','8.00','5','2','1524176850');
INSERT INTO `ysk_moneyils` VALUES('665','1794','1702','8.00','6','2','1524177020');
INSERT INTO `ysk_moneyils` VALUES('666','1775','1702','1.60','3','1','1524177041');
INSERT INTO `ysk_moneyils` VALUES('667','1775','1702','2.56','3','1','1524177375');
INSERT INTO `ysk_moneyils` VALUES('668','1775','1702','8.00','3','2','1524177429');
INSERT INTO `ysk_moneyils` VALUES('669','1702','1688','160.00','5','1','1524177833');
INSERT INTO `ysk_moneyils` VALUES('670','2161','1702','2.56','4','1','1524182846');
INSERT INTO `ysk_moneyils` VALUES('671','1709','1702','2.56','2','1','1524183220');
INSERT INTO `ysk_moneyils` VALUES('672','1709','1702','2.56','2','1','1524187216');
INSERT INTO `ysk_moneyils` VALUES('673','1709','1702','2.56','2','1','1524187407');
INSERT INTO `ysk_moneyils` VALUES('674','2161','1702','2.56','4','1','1524192070');
INSERT INTO `ysk_moneyils` VALUES('675','2161','1702','2.56','4','1','1524192225');
INSERT INTO `ysk_moneyils` VALUES('676','2161','1702','2.56','4','1','1524192380');
INSERT INTO `ysk_moneyils` VALUES('677','2161','1702','2.56','4','1','1524192542');
INSERT INTO `ysk_moneyils` VALUES('678','2161','1702','2.56','4','1','1524192621');
INSERT INTO `ysk_moneyils` VALUES('679','2161','1702','2.56','4','1','1524192896');
INSERT INTO `ysk_moneyils` VALUES('680','2161','1702','2.56','4','1','1524192984');
INSERT INTO `ysk_moneyils` VALUES('681','2161','1702','2.56','4','1','1524193057');
INSERT INTO `ysk_moneyils` VALUES('682','2161','1702','2.56','4','1','1524193132');
INSERT INTO `ysk_moneyils` VALUES('683','2161','1702','2.56','4','1','1524193198');
INSERT INTO `ysk_moneyils` VALUES('684','2161','1702','2.56','4','1','1524193347');
INSERT INTO `ysk_moneyils` VALUES('685','2161','1702','2.56','4','1','1524193423');
INSERT INTO `ysk_moneyils` VALUES('686','2161','1702','2.56','4','1','1524193535');
INSERT INTO `ysk_moneyils` VALUES('687','2161','1702','2.56','4','1','1524193618');
INSERT INTO `ysk_moneyils` VALUES('688','2161','1702','2.56','4','1','1524196061');
INSERT INTO `ysk_moneyils` VALUES('689','1693','1688','2.56','3','1','1524197046');
INSERT INTO `ysk_moneyils` VALUES('690','1693','1688','2.56','3','1','1524197361');
INSERT INTO `ysk_moneyils` VALUES('691','2161','1702','2.56','4','1','1524197419');
INSERT INTO `ysk_moneyils` VALUES('692','1800','1702','2.56','4','1','1524197605');
INSERT INTO `ysk_moneyils` VALUES('693','1703','1702','2.56','1','1','1524197949');
INSERT INTO `ysk_moneyils` VALUES('694','1717','1702','2.56','2','1','1524198052');
INSERT INTO `ysk_moneyils` VALUES('695','1693','1688','2.56','3','1','1524198130');
INSERT INTO `ysk_moneyils` VALUES('696','1706','1702','2.56','4','1','1524198495');
INSERT INTO `ysk_moneyils` VALUES('697','1693','1688','2.56','3','1','1524198667');
INSERT INTO `ysk_moneyils` VALUES('698','1800','1702','2.56','4','1','1524198857');
INSERT INTO `ysk_moneyils` VALUES('699','1693','1688','16.00','3','2','1524199061');
INSERT INTO `ysk_moneyils` VALUES('700','1693','1688','32.00','3','2','1524199083');
INSERT INTO `ysk_moneyils` VALUES('701','1693','1688','4.00','3','1','1524199187');
INSERT INTO `ysk_moneyils` VALUES('702','1747','1688','35.20','2','1','1524200681');
INSERT INTO `ysk_moneyils` VALUES('703','1729','1688','24.96','1','1','1524201005');
INSERT INTO `ysk_moneyils` VALUES('704','1747','1688','16.00','2','2','1524201026');
INSERT INTO `ysk_moneyils` VALUES('705','1729','1688','96.00','1','2','1524201411');
INSERT INTO `ysk_moneyils` VALUES('706','1693','1688','2.56','3','1','1524201420');
INSERT INTO `ysk_moneyils` VALUES('707','2161','1702','5.12','4','1','1524201884');
INSERT INTO `ysk_moneyils` VALUES('708','1703','1702','2.56','1','1','1524201896');
INSERT INTO `ysk_moneyils` VALUES('709','1717','1702','2.56','2','1','1524201975');
INSERT INTO `ysk_moneyils` VALUES('710','2524','1702','4.80','3','1','1524204236');
INSERT INTO `ysk_moneyils` VALUES('711','2161','1702','2.56','4','1','1524205196');
INSERT INTO `ysk_moneyils` VALUES('712','2524','1702','16.00','3','2','1524206191');
INSERT INTO `ysk_moneyils` VALUES('713','2088','1689','3200.00','2','1','1524207964');
INSERT INTO `ysk_moneyils` VALUES('714','2097','1689','1600.00','1','1','1524208111');
INSERT INTO `ysk_moneyils` VALUES('715','2097','1689','6400.00','1','2','1524208219');
INSERT INTO `ysk_moneyils` VALUES('716','1730','1702','0.11','5','1','1524213236');
INSERT INTO `ysk_moneyils` VALUES('717','1706','1702','2.56','4','1','1524217837');
INSERT INTO `ysk_moneyils` VALUES('718','1709','1702','2.56','2','1','1524218471');
INSERT INTO `ysk_moneyils` VALUES('719','1706','1702','2.56','4','1','1524218664');
INSERT INTO `ysk_moneyils` VALUES('720','1709','1702','2.56','2','1','1524218870');
INSERT INTO `ysk_moneyils` VALUES('721','1709','1702','2.56','2','1','1524218934');
INSERT INTO `ysk_moneyils` VALUES('722','1709','1702','2.56','2','1','1524219078');
INSERT INTO `ysk_moneyils` VALUES('723','1709','1702','2.56','2','1','1524219175');
INSERT INTO `ysk_moneyils` VALUES('724','1709','1702','2.56','2','1','1524219227');
INSERT INTO `ysk_moneyils` VALUES('725','1709','1702','2.56','2','1','1524219308');
INSERT INTO `ysk_moneyils` VALUES('726','1709','1702','2.56','2','1','1524219425');
INSERT INTO `ysk_moneyils` VALUES('727','1709','1702','2.56','2','1','1524219475');
INSERT INTO `ysk_moneyils` VALUES('728','1709','1702','2.56','2','1','1524219519');
INSERT INTO `ysk_moneyils` VALUES('729','1709','1702','2.56','2','1','1524219589');
INSERT INTO `ysk_moneyils` VALUES('730','1709','1702','2.56','2','1','1524219652');
INSERT INTO `ysk_moneyils` VALUES('731','1709','1702','2.56','2','1','1524219705');
INSERT INTO `ysk_moneyils` VALUES('732','1709','1702','2.56','2','1','1524220073');
INSERT INTO `ysk_moneyils` VALUES('733','1709','1702','2.56','2','1','1524220569');
INSERT INTO `ysk_moneyils` VALUES('734','2102','1702','1.47','5','1','1524225209');
INSERT INTO `ysk_moneyils` VALUES('735','1693','1688','24.00','3','2','1524230931');
INSERT INTO `ysk_moneyils` VALUES('736','2530','1689','4.16','3','1','1524233725');
INSERT INTO `ysk_moneyils` VALUES('737','2530','1689','16.00','3','2','1524235632');
INSERT INTO `ysk_moneyils` VALUES('738','1690','1689','960.00','1','1','1524240389');
INSERT INTO `ysk_moneyils` VALUES('739','1690','1689','4800.00','1','2','1524240467');
INSERT INTO `ysk_moneyils` VALUES('740','1690','1689','1280.00','1','1','1524240560');
INSERT INTO `ysk_moneyils` VALUES('741','1690','1689','4800.00','1','2','1524240645');
INSERT INTO `ysk_moneyils` VALUES('742','1690','1689','320.00','1','1','1524240703');
INSERT INTO `ysk_moneyils` VALUES('743','1690','1689','1600.00','1','2','1524240741');
INSERT INTO `ysk_moneyils` VALUES('744','1736','1688','8.00','2','2','1524265832');
INSERT INTO `ysk_moneyils` VALUES('745','1709','1702','2.56','2','1','1524274700');
INSERT INTO `ysk_moneyils` VALUES('746','1773','1702','1.60','3','1','1524284427');
INSERT INTO `ysk_moneyils` VALUES('747','1773','1702','0.80','3','1','1524284514');
INSERT INTO `ysk_moneyils` VALUES('748','1773','1702','8.00','3','2','1524284532');
INSERT INTO `ysk_moneyils` VALUES('749','1765','1702','3.20','3','1','1524284903');
INSERT INTO `ysk_moneyils` VALUES('750','1765','1702','0.96','3','1','1524284945');
INSERT INTO `ysk_moneyils` VALUES('751','1765','1702','16.00','3','2','1524284977');
INSERT INTO `ysk_moneyils` VALUES('752','1766','1702','4.16','3','1','1524285183');
INSERT INTO `ysk_moneyils` VALUES('753','1766','1702','16.00','3','2','1524285200');
INSERT INTO `ysk_moneyils` VALUES('754','1771','1702','4.16','3','1','1524285380');
INSERT INTO `ysk_moneyils` VALUES('755','1771','1702','16.00','3','2','1524285422');
INSERT INTO `ysk_moneyils` VALUES('756','1709','1702','0.35','2','1','1524286034');
INSERT INTO `ysk_moneyils` VALUES('757','1709','1702','168.00','2','2','1524286071');
INSERT INTO `ysk_moneyils` VALUES('758','1709','1702','0.01','2','1','1524286509');
INSERT INTO `ysk_moneyils` VALUES('759','1709','1702','0.00','2','1','1524286537');
INSERT INTO `ysk_moneyils` VALUES('760','1709','1702','0.01','2','1','1524286593');
INSERT INTO `ysk_moneyils` VALUES('761','1709','1702','0.01','2','1','1524286869');
INSERT INTO `ysk_moneyils` VALUES('762','1709','1702','0.01','2','1','1524286938');
INSERT INTO `ysk_moneyils` VALUES('763','1709','1702','0.01','2','1','1524286990');
INSERT INTO `ysk_moneyils` VALUES('764','1709','1702','0.01','2','1','1524287036');
INSERT INTO `ysk_moneyils` VALUES('765','1709','1702','0.01','2','1','1524287085');
INSERT INTO `ysk_moneyils` VALUES('766','1709','1702','0.01','2','1','1524287133');
INSERT INTO `ysk_moneyils` VALUES('767','1709','1702','0.01','2','1','1524287278');
INSERT INTO `ysk_moneyils` VALUES('768','2161','1702','216.00','4','2','1524288190');
INSERT INTO `ysk_moneyils` VALUES('769','1777','1702','24.00','3','2','1524292617');
INSERT INTO `ysk_moneyils` VALUES('770','1709','1702','0.01','2','1','1524298621');
INSERT INTO `ysk_moneyils` VALUES('771','1730','1702','8.00','5','2','1524299327');
INSERT INTO `ysk_moneyils` VALUES('772','1712','1702','32.00','4','2','1524299375');
INSERT INTO `ysk_moneyils` VALUES('773','3036','1702','4.00','1','1','1524309693');
INSERT INTO `ysk_moneyils` VALUES('774','3036','1702','16.00','1','2','1524309765');
INSERT INTO `ysk_moneyils` VALUES('775','3037','1702','4.00','1','1','1524311452');
INSERT INTO `ysk_moneyils` VALUES('776','3035','1702','4.00','1','1','1524311492');
INSERT INTO `ysk_moneyils` VALUES('777','3038','1702','4.00','1','1','1524311672');
INSERT INTO `ysk_moneyils` VALUES('778','3036','1702','4.00','1','1','1524311701');
INSERT INTO `ysk_moneyils` VALUES('779','3037','1702','16.00','1','2','1524311764');
INSERT INTO `ysk_moneyils` VALUES('780','3038','1702','16.00','1','2','1524311877');
INSERT INTO `ysk_moneyils` VALUES('781','3035','1702','16.00','1','2','1524311972');
INSERT INTO `ysk_moneyils` VALUES('782','1705','1702','3.20','3','1','1524315647');
INSERT INTO `ysk_moneyils` VALUES('783','1705','1702','0.96','3','1','1524315760');
INSERT INTO `ysk_moneyils` VALUES('784','1717','1702','1.92','2','1','1524315843');
INSERT INTO `ysk_moneyils` VALUES('785','1705','1702','8.80','3','1','1524315852');
INSERT INTO `ysk_moneyils` VALUES('786','1717','1702','3.31','2','1','1524315936');
INSERT INTO `ysk_moneyils` VALUES('787','1717','1702','2.40','2','1','1524316013');
INSERT INTO `ysk_moneyils` VALUES('788','1705','1702','2.56','3','1','1524316054');
INSERT INTO `ysk_moneyils` VALUES('789','1717','1702','7.12','2','1','1524316087');
INSERT INTO `ysk_moneyils` VALUES('790','1705','1702','2.56','3','1','1524316145');
INSERT INTO `ysk_moneyils` VALUES('791','1705','1702','2.56','3','1','1524316233');
INSERT INTO `ysk_moneyils` VALUES('792','1691','1688','160.00','1','1','1524316369');
INSERT INTO `ysk_moneyils` VALUES('793','1712','1702','0.14','4','1','1524316371');
INSERT INTO `ysk_moneyils` VALUES('794','1691','1688','32.00','1','1','1524316449');
INSERT INTO `ysk_moneyils` VALUES('795','1705','1702','2.56','3','1','1524316632');
INSERT INTO `ysk_moneyils` VALUES('796','3034','1689','160.00','1','1','1524316747');
INSERT INTO `ysk_moneyils` VALUES('797','1705','1702','2.56','3','1','1524316878');
INSERT INTO `ysk_moneyils` VALUES('798','3034','1689','1.60','1','1','1524316909');
INSERT INTO `ysk_moneyils` VALUES('799','3039','1689','160.00','2','1','1524317070');
INSERT INTO `ysk_moneyils` VALUES('800','1712','1702','0.05','4','1','1524317579');
INSERT INTO `ysk_moneyils` VALUES('801','1703','1702','2.56','1','1','1524317749');
INSERT INTO `ysk_moneyils` VALUES('802','1703','1702','2.56','1','1','1524317811');
INSERT INTO `ysk_moneyils` VALUES('803','1703','1702','2.56','1','1','1524317872');
INSERT INTO `ysk_moneyils` VALUES('804','1703','1702','2.56','1','1','1524317921');
INSERT INTO `ysk_moneyils` VALUES('805','1703','1702','2.56','1','1','1524317990');
INSERT INTO `ysk_moneyils` VALUES('806','1703','1702','2.56','1','1','1524318041');
INSERT INTO `ysk_moneyils` VALUES('807','1791','1702','32.00','6','2','1524323021');
INSERT INTO `ysk_moneyils` VALUES('808','1848','1702','8.00','6','2','1524323534');
INSERT INTO `ysk_moneyils` VALUES('809','1846','1702','8.00','6','2','1524323610');
INSERT INTO `ysk_moneyils` VALUES('810','2517','1702','0.08','3','1','1524324319');
INSERT INTO `ysk_moneyils` VALUES('811','1799','1702','40.00','6','2','1524326325');
INSERT INTO `ysk_moneyils` VALUES('812','1773','1702','1.92','3','1','1524326629');
INSERT INTO `ysk_moneyils` VALUES('813','1709','1702','1.58','2','1','1524326807');
INSERT INTO `ysk_moneyils` VALUES('814','3034','1689','8.00','1','2','1524328261');
INSERT INTO `ysk_moneyils` VALUES('815','3034','1689','32.00','1','1','1524329523');
INSERT INTO `ysk_moneyils` VALUES('816','1692','1688','1600.00','2','1','1524340733');
INSERT INTO `ysk_moneyils` VALUES('817','1692','1688','6488.00','2','2','1524340837');
INSERT INTO `ysk_moneyils` VALUES('818','1731','1702','0.21','5','1','1524349256');
INSERT INTO `ysk_moneyils` VALUES('819','1730','1702','0.21','5','1','1524349335');
INSERT INTO `ysk_moneyils` VALUES('820','1712','1702','0.21','4','1','1524349652');
INSERT INTO `ysk_moneyils` VALUES('821','1730','1702','0.16','5','1','1524349797');
INSERT INTO `ysk_moneyils` VALUES('822','1731','1702','0.13','5','1','1524349873');
INSERT INTO `ysk_moneyils` VALUES('823','1741','1702','0.11','5','1','1524349966');
INSERT INTO `ysk_moneyils` VALUES('824','1712','1702','0.11','4','1','1524350044');
INSERT INTO `ysk_moneyils` VALUES('825','1731','1702','0.10','5','1','1524350163');
INSERT INTO `ysk_moneyils` VALUES('826','1741','1702','0.08','5','1','1524350248');
INSERT INTO `ysk_moneyils` VALUES('827','1730','1702','0.06','5','1','1524350313');
INSERT INTO `ysk_moneyils` VALUES('828','1712','1702','0.06','4','1','1524350398');
INSERT INTO `ysk_moneyils` VALUES('829','1741','1702','0.05','5','1','1524350455');
INSERT INTO `ysk_moneyils` VALUES('830','2141','1702','8.00','3','2','1524350492');
INSERT INTO `ysk_moneyils` VALUES('831','2091','1702','8.00','2','2','1524354725');
INSERT INTO `ysk_moneyils` VALUES('832','1742','1702','8.00','2','2','1524355590');
INSERT INTO `ysk_moneyils` VALUES('833','2517','1702','8.00','3','2','1524355910');
INSERT INTO `ysk_moneyils` VALUES('834','1879','1702','24.00','3','2','1524356647');
INSERT INTO `ysk_moneyils` VALUES('835','1767','1702','8.00','3','1','1524357596');
INSERT INTO `ysk_moneyils` VALUES('836','1745','1692','8.00','1','2','1524359799');
INSERT INTO `ysk_moneyils` VALUES('837','1740','1702','64.00','2','2','1524360756');
INSERT INTO `ysk_moneyils` VALUES('838','1791','1702','0.96','6','1','1524362042');
INSERT INTO `ysk_moneyils` VALUES('839','1818','1702','2.56','7','1','1524362712');
INSERT INTO `ysk_moneyils` VALUES('840','1706','1702','0.03','4','1','1524363745');
INSERT INTO `ysk_moneyils` VALUES('841','1773','1702','32.00','3','1','1524363894');
INSERT INTO `ysk_moneyils` VALUES('842','1706','1702','0.03','4','1','1524363903');
INSERT INTO `ysk_moneyils` VALUES('843','1773','1702','128.00','3','2','1524364009');
INSERT INTO `ysk_moneyils` VALUES('844','1703','1702','32.00','1','2','1524364664');
INSERT INTO `ysk_moneyils` VALUES('845','1791','1702','2.56','6','1','1524364699');
INSERT INTO `ysk_moneyils` VALUES('846','1693','1692','8.00','1','2','1524364736');
INSERT INTO `ysk_moneyils` VALUES('847','1693','1692','2.70','1','1','1524364914');
INSERT INTO `ysk_moneyils` VALUES('848','1693','1692','8.00','1','2','1524364957');
INSERT INTO `ysk_moneyils` VALUES('849','2094','1702','0.11','5','1','1524364974');
INSERT INTO `ysk_moneyils` VALUES('850','1791','1702','16.00','6','2','1524365253');
INSERT INTO `ysk_moneyils` VALUES('851','1822','1702','64.00','3','2','1524366489');
INSERT INTO `ysk_moneyils` VALUES('852','1824','1702','8.00','4','2','1524368115');
INSERT INTO `ysk_moneyils` VALUES('853','1811','1702','8.00','4','2','1524371127');
INSERT INTO `ysk_moneyils` VALUES('854','1718','1702','32.00','2','2','1524371465');
INSERT INTO `ysk_moneyils` VALUES('855','1701','1692','8.00','2','2','1524378041');
INSERT INTO `ysk_moneyils` VALUES('856','1705','1702','0.69','3','1','1524378306');
INSERT INTO `ysk_moneyils` VALUES('857','1705','1702','8.00','3','2','1524378355');
INSERT INTO `ysk_moneyils` VALUES('858','1842','1702','8.00','4','2','1524378519');
INSERT INTO `ysk_moneyils` VALUES('859','1852','1702','8.00','4','2','1524378761');
INSERT INTO `ysk_moneyils` VALUES('860','1842','1702','0.96','4','1','1524379558');
INSERT INTO `ysk_moneyils` VALUES('861','1842','1702','8.00','4','2','1524379636');
INSERT INTO `ysk_moneyils` VALUES('862','1819','1702','2.56','7','1','1524381802');
INSERT INTO `ysk_moneyils` VALUES('863','2143','1702','40.00','3','2','1524382407');
INSERT INTO `ysk_moneyils` VALUES('864','1819','1702','2.56','7','1','1524382570');
INSERT INTO `ysk_moneyils` VALUES('865','1853','1702','8.00','4','2','1524382584');
INSERT INTO `ysk_moneyils` VALUES('866','1819','1702','24.00','7','2','1524382699');
INSERT INTO `ysk_moneyils` VALUES('867','2192','1702','0.88','5','1','1524382822');
INSERT INTO `ysk_moneyils` VALUES('868','1818','1702','8.00','7','2','1524383203');
INSERT INTO `ysk_moneyils` VALUES('869','1796','1702','0.21','5','1','1524383577');
INSERT INTO `ysk_moneyils` VALUES('870','1777','1702','0.03','3','1','1524386230');
INSERT INTO `ysk_moneyils` VALUES('871','1709','1702','0.19','2','1','1524387229');
INSERT INTO `ysk_moneyils` VALUES('872','1709','1702','0.18','2','1','1524387289');
INSERT INTO `ysk_moneyils` VALUES('873','1709','1702','0.18','2','1','1524387337');
INSERT INTO `ysk_moneyils` VALUES('874','1709','1702','0.01','2','1','1524387396');
INSERT INTO `ysk_moneyils` VALUES('875','1709','1702','0.01','2','1','1524387440');
INSERT INTO `ysk_moneyils` VALUES('876','1709','1702','0.01','2','1','1524387485');
INSERT INTO `ysk_moneyils` VALUES('877','1709','1702','0.01','2','1','1524387625');
INSERT INTO `ysk_moneyils` VALUES('878','1709','1702','0.01','2','1','1524387671');
INSERT INTO `ysk_moneyils` VALUES('879','1709','1702','0.01','2','1','1524387724');
INSERT INTO `ysk_moneyils` VALUES('880','1709','1702','0.01','2','1','1524387771');
INSERT INTO `ysk_moneyils` VALUES('881','1709','1702','0.01','2','1','1524387826');
INSERT INTO `ysk_moneyils` VALUES('882','1709','1702','0.01','2','1','1524387873');
INSERT INTO `ysk_moneyils` VALUES('883','1709','1702','0.01','2','1','1524387990');
INSERT INTO `ysk_moneyils` VALUES('884','1709','1702','0.01','2','1','1524388077');
INSERT INTO `ysk_moneyils` VALUES('885','1709','1702','0.01','2','1','1524388125');
INSERT INTO `ysk_moneyils` VALUES('886','1709','1702','0.01','2','1','1524388322');
INSERT INTO `ysk_moneyils` VALUES('887','1709','1702','0.01','2','1','1524388373');
INSERT INTO `ysk_moneyils` VALUES('888','1709','1702','8.00','2','2','1524389126');
INSERT INTO `ysk_moneyils` VALUES('889','1877','1702','8.00','2','2','1524391385');
INSERT INTO `ysk_moneyils` VALUES('890','2150','1702','56.00','3','2','1524391397');
INSERT INTO `ysk_moneyils` VALUES('891','2152','1702','40.00','4','2','1524391479');
INSERT INTO `ysk_moneyils` VALUES('892','2154','1702','40.00','4','2','1524391533');
INSERT INTO `ysk_moneyils` VALUES('893','2158','1702','8.00','4','2','1524391596');
INSERT INTO `ysk_moneyils` VALUES('894','1757','1702','32.00','4','2','1524393030');
INSERT INTO `ysk_moneyils` VALUES('895','1774','1702','0.96','5','1','1524393269');
INSERT INTO `ysk_moneyils` VALUES('896','1848','1702','32.00','6','2','1524393589');
INSERT INTO `ysk_moneyils` VALUES('897','1855','1702','2.56','8','1','1524398290');
INSERT INTO `ysk_moneyils` VALUES('898','1855','1702','16.00','8','2','1524399565');
INSERT INTO `ysk_moneyils` VALUES('899','1774','1702','64.00','5','2','1524411583');
INSERT INTO `ysk_moneyils` VALUES('900','1709','1702','16.00','2','2','1524413048');
INSERT INTO `ysk_moneyils` VALUES('901','1773','1702','0.05','3','1','1524413249');
INSERT INTO `ysk_moneyils` VALUES('902','1773','1702','0.05','3','1','1524413320');
INSERT INTO `ysk_moneyils` VALUES('903','1773','1702','0.05','3','1','1524413383');
INSERT INTO `ysk_moneyils` VALUES('904','1773','1702','0.01','3','1','1524413592');
INSERT INTO `ysk_moneyils` VALUES('905','1773','1702','0.01','3','1','1524413706');
INSERT INTO `ysk_moneyils` VALUES('906','1773','1702','0.01','3','1','1524413771');
INSERT INTO `ysk_moneyils` VALUES('907','1818','1702','8.00','7','2','1524425487');
INSERT INTO `ysk_moneyils` VALUES('908','1712','1702','0.02','4','1','1524434207');
INSERT INTO `ysk_moneyils` VALUES('909','1712','1702','0.04','4','1','1524434279');
INSERT INTO `ysk_moneyils` VALUES('910','1730','1702','0.18','5','1','1524434360');
INSERT INTO `ysk_moneyils` VALUES('911','1731','1702','0.14','5','1','1524434457');
INSERT INTO `ysk_moneyils` VALUES('912','1712','1702','0.12','4','1','1524434752');
INSERT INTO `ysk_moneyils` VALUES('913','2094','1702','0.03','5','1','1524434798');
INSERT INTO `ysk_moneyils` VALUES('914','1730','1702','0.11','5','1','1524434830');
INSERT INTO `ysk_moneyils` VALUES('915','1731','1702','0.09','5','1','1524434947');
INSERT INTO `ysk_moneyils` VALUES('916','2094','1702','0.02','5','1','1524434996');
INSERT INTO `ysk_moneyils` VALUES('917','2094','1702','0.05','5','1','1524435144');
INSERT INTO `ysk_moneyils` VALUES('918','1703','1702','16.00','1','2','1524435290');
INSERT INTO `ysk_moneyils` VALUES('919','1693','1692','8.00','1','2','1524435396');
INSERT INTO `ysk_moneyils` VALUES('920','1693','1692','2.56','1','1','1524437581');
INSERT INTO `ysk_moneyils` VALUES('921','1693','1692','2.56','1','1','1524437681');
INSERT INTO `ysk_moneyils` VALUES('922','1693','1692','24.00','1','2','1524437820');
INSERT INTO `ysk_moneyils` VALUES('923','2192','1702','0.54','5','1','1524438806');
INSERT INTO `ysk_moneyils` VALUES('924','1736','1688','8.00','2','2','1524439613');
INSERT INTO `ysk_moneyils` VALUES('925','1745','1692','16.00','1','2','1524443645');
INSERT INTO `ysk_moneyils` VALUES('926','1797','1702','0.24','5','1','1524445709');
INSERT INTO `ysk_moneyils` VALUES('927','2125','1702','8.00','5','2','1524450504');
INSERT INTO `ysk_moneyils` VALUES('928','2192','1702','0.02','5','1','1524450596');
INSERT INTO `ysk_moneyils` VALUES('929','1777','1702','16.00','3','1','1524450910');
INSERT INTO `ysk_moneyils` VALUES('930','1748','1702','8.00','4','2','1524451257');
INSERT INTO `ysk_moneyils` VALUES('931','1701','1692','8.00','2','2','1524451484');
INSERT INTO `ysk_moneyils` VALUES('932','1705','1702','0.64','3','1','1524451605');
INSERT INTO `ysk_moneyils` VALUES('933','1705','1702','8.00','3','2','1524451655');
INSERT INTO `ysk_moneyils` VALUES('934','1740','1702','2.56','2','1','1524451881');
INSERT INTO `ysk_moneyils` VALUES('935','1740','1702','2.56','2','1','1524451960');
INSERT INTO `ysk_moneyils` VALUES('936','2147','1702','2.56','3','1','1524454186');
INSERT INTO `ysk_moneyils` VALUES('937','2192','1702','0.01','5','1','1524457579');
INSERT INTO `ysk_moneyils` VALUES('938','2192','1702','0.02','5','1','1524457683');
INSERT INTO `ysk_moneyils` VALUES('939','2192','1702','0.02','5','1','1524457755');
INSERT INTO `ysk_moneyils` VALUES('940','2192','1702','0.02','5','1','1524457816');
INSERT INTO `ysk_moneyils` VALUES('941','2192','1702','0.02','5','1','1524457871');
INSERT INTO `ysk_moneyils` VALUES('942','2192','1702','0.02','5','1','1524457926');
INSERT INTO `ysk_moneyils` VALUES('943','2192','1702','0.02','5','1','1524457976');
INSERT INTO `ysk_moneyils` VALUES('944','1740','1702','2.56','2','1','1524458858');
INSERT INTO `ysk_moneyils` VALUES('945','1717','1702','17.60','2','1','1524461853');
INSERT INTO `ysk_moneyils` VALUES('946','1717','1702','72.00','2','2','1524461928');
INSERT INTO `ysk_moneyils` VALUES('947','2192','1702','0.02','5','1','1524462383');
INSERT INTO `ysk_moneyils` VALUES('948','2192','1702','0.02','5','1','1524462441');
INSERT INTO `ysk_moneyils` VALUES('949','2192','1702','0.02','5','1','1524462500');
INSERT INTO `ysk_moneyils` VALUES('950','2192','1702','0.02','5','1','1524462658');
INSERT INTO `ysk_moneyils` VALUES('951','2192','1702','0.02','5','1','1524462750');
INSERT INTO `ysk_moneyils` VALUES('952','2192','1702','0.01','5','1','1524462989');
INSERT INTO `ysk_moneyils` VALUES('953','1773','1702','0.01','3','1','1524476804');
INSERT INTO `ysk_moneyils` VALUES('954','1773','1702','0.01','3','1','1524477003');
INSERT INTO `ysk_moneyils` VALUES('955','1773','1702','0.01','3','1','1524477049');
INSERT INTO `ysk_moneyils` VALUES('956','1773','1702','0.01','3','1','1524477145');
INSERT INTO `ysk_moneyils` VALUES('957','1773','1702','0.01','3','1','1524477200');
INSERT INTO `ysk_moneyils` VALUES('958','1773','1702','0.01','3','1','1524477257');
INSERT INTO `ysk_moneyils` VALUES('959','1773','1702','0.01','3','1','1524477332');
INSERT INTO `ysk_moneyils` VALUES('960','1773','1702','0.01','3','1','1524477386');
INSERT INTO `ysk_moneyils` VALUES('961','1773','1702','0.01','3','1','1524477432');
INSERT INTO `ysk_moneyils` VALUES('962','1773','1702','0.01','3','1','1524477483');
INSERT INTO `ysk_moneyils` VALUES('963','1773','1702','0.01','3','1','1524477528');
INSERT INTO `ysk_moneyils` VALUES('964','1773','1702','0.01','3','1','1524477575');
INSERT INTO `ysk_moneyils` VALUES('965','1773','1702','0.01','3','1','1524477680');
INSERT INTO `ysk_moneyils` VALUES('966','3056','1689','1600.00','1','1','1524479818');
INSERT INTO `ysk_moneyils` VALUES('967','3056','1689','6400.00','1','2','1524480206');
INSERT INTO `ysk_moneyils` VALUES('968','1781','1702','8.00','4','2','1524480673');
INSERT INTO `ysk_moneyils` VALUES('969','3053','1689','32.00','1','2','1524483591');
INSERT INTO `ysk_moneyils` VALUES('970','3053','1689','800.00','1','2','1524483755');
INSERT INTO `ysk_moneyils` VALUES('971','3053','1689','520.00','1','2','1524483906');
INSERT INTO `ysk_moneyils` VALUES('972','3044','1692','8.00','1','1','1524485329');
INSERT INTO `ysk_moneyils` VALUES('973','3045','1692','800.00','1','1','1524485439');
INSERT INTO `ysk_moneyils` VALUES('974','3046','1692','800.00','1','1','1524485544');
INSERT INTO `ysk_moneyils` VALUES('975','3047','1692','800.00','1','1','1524485594');
INSERT INTO `ysk_moneyils` VALUES('976','3044','1692','800.00','1','1','1524485634');
INSERT INTO `ysk_moneyils` VALUES('977','1740','1702','2.56','2','1','1524487547');
INSERT INTO `ysk_moneyils` VALUES('978','3042','1689','48.00','2','1','1524490358');
INSERT INTO `ysk_moneyils` VALUES('979','3040','1689','16.00','1','1','1524490681');
INSERT INTO `ysk_moneyils` VALUES('980','3040','1689','8.00','1','2','1524491318');
INSERT INTO `ysk_moneyils` VALUES('981','3040','1689','8.00','1','2','1524494887');
INSERT INTO `ysk_moneyils` VALUES('982','1705','1702','0.08','3','1','1524494892');
INSERT INTO `ysk_moneyils` VALUES('983','1705','1702','0.16','3','1','1524495107');
INSERT INTO `ysk_moneyils` VALUES('984','1705','1702','0.32','3','1','1524495398');
INSERT INTO `ysk_moneyils` VALUES('985','1717','1702','0.54','2','1','1524495521');
INSERT INTO `ysk_moneyils` VALUES('986','1717','1702','0.27','2','1','1524495588');
INSERT INTO `ysk_moneyils` VALUES('987','1717','1702','0.18','2','1','1524495638');
INSERT INTO `ysk_moneyils` VALUES('988','1717','1702','0.04','2','1','1524495698');
INSERT INTO `ysk_moneyils` VALUES('989','1702','1692','294.40','3','1','1524496033');
INSERT INTO `ysk_moneyils` VALUES('990','1721','1702','48.00','5','1','1524496344');
INSERT INTO `ysk_moneyils` VALUES('991','1718','1702','16.00','2','1','1524497533');
INSERT INTO `ysk_moneyils` VALUES('992','1706','1702','0.18','4','1','1524497706');
INSERT INTO `ysk_moneyils` VALUES('993','2095','1702','8.00','5','1','1524498155');
INSERT INTO `ysk_moneyils` VALUES('994','3053','1689','400.00','1','2','1524498665');
INSERT INTO `ysk_moneyils` VALUES('995','1740','1702','32.00','2','1','1524498693');
INSERT INTO `ysk_moneyils` VALUES('996','1853','1702','8.00','4','1','1524498758');
INSERT INTO `ysk_moneyils` VALUES('997','1799','1702','32.00','6','1','1524499123');
INSERT INTO `ysk_moneyils` VALUES('998','1693','1692','48.00','1','1','1524499319');
INSERT INTO `ysk_moneyils` VALUES('999','1712','1702','0.04','4','1','1524499333');
INSERT INTO `ysk_moneyils` VALUES('1000','3042','1689','56.00','2','2','1524499386');
INSERT INTO `ysk_moneyils` VALUES('1001','1705','1702','0.40','3','1','1524499624');
INSERT INTO `ysk_moneyils` VALUES('1002','1705','1702','3.74','3','1','1524499764');
INSERT INTO `ysk_moneyils` VALUES('1003','1705','1702','0.05','3','1','1524500026');
INSERT INTO `ysk_moneyils` VALUES('1004','1740','1702','32.00','2','1','1524500072');
INSERT INTO `ysk_moneyils` VALUES('1005','1705','1702','0.05','3','1','1524500155');
INSERT INTO `ysk_moneyils` VALUES('1006','2192','1702','0.01','5','1','1524500292');
INSERT INTO `ysk_moneyils` VALUES('1007','2192','1702','0.25','5','1','1524500512');
INSERT INTO `ysk_moneyils` VALUES('1008','2192','1702','0.06','5','1','1524500608');
INSERT INTO `ysk_moneyils` VALUES('1009','2192','1702','8.00','5','2','1524500663');
INSERT INTO `ysk_moneyils` VALUES('1010','2161','1702','0.01','4','1','1524500894');
INSERT INTO `ysk_moneyils` VALUES('1011','1705','1702','32.00','3','1','1524501019');
INSERT INTO `ysk_moneyils` VALUES('1012','2161','1702','0.01','4','1','1524501065');
INSERT INTO `ysk_moneyils` VALUES('1013','1730','1702','8.00','5','1','1524501114');
INSERT INTO `ysk_moneyils` VALUES('1014','2161','1702','0.01','4','1','1524501141');
INSERT INTO `ysk_moneyils` VALUES('1015','2161','1702','0.01','4','1','1524501208');
INSERT INTO `ysk_moneyils` VALUES('1016','2161','1702','0.01','4','1','1524501270');
INSERT INTO `ysk_moneyils` VALUES('1017','2161','1702','0.01','4','1','1524501335');
INSERT INTO `ysk_moneyils` VALUES('1018','1730','1702','0.04','5','1','1524501366');
INSERT INTO `ysk_moneyils` VALUES('1019','2161','1702','0.01','4','1','1524501396');
INSERT INTO `ysk_moneyils` VALUES('1020','2161','1702','0.01','4','1','1524501507');
INSERT INTO `ysk_moneyils` VALUES('1021','2161','1702','0.01','4','1','1524501568');
INSERT INTO `ysk_moneyils` VALUES('1022','2161','1702','0.01','4','1','1524501642');
INSERT INTO `ysk_moneyils` VALUES('1023','2161','1702','0.01','4','1','1524501713');
INSERT INTO `ysk_moneyils` VALUES('1024','2161','1702','0.01','4','1','1524501771');
INSERT INTO `ysk_moneyils` VALUES('1025','3053','1689','16.00','1','2','1524509790');
INSERT INTO `ysk_moneyils` VALUES('1026','3053','1689','8.00','1','2','1524509809');
INSERT INTO `ysk_moneyils` VALUES('1027','3060','1689','80.00','1','1','1524533990');
INSERT INTO `ysk_moneyils` VALUES('1028','1843','1702','8.00','4','2','1524534428');
INSERT INTO `ysk_moneyils` VALUES('1029','3060','1689','320.00','1','2','1524534478');
INSERT INTO `ysk_moneyils` VALUES('1030','1777','1702','0.96','3','1','1524535283');
INSERT INTO `ysk_moneyils` VALUES('1031','1729','1688','8.00','1','2','1524537998');
INSERT INTO `ysk_moneyils` VALUES('1032','1811','1702','8.00','4','1','1524540826');
INSERT INTO `ysk_moneyils` VALUES('1033','2147','1702','4.80','3','1','1524541322');
INSERT INTO `ysk_moneyils` VALUES('1034','1822','1702','0.98','3','1','1524544269');
INSERT INTO `ysk_moneyils` VALUES('1035','3034','1689','8.00','1','2','1524547511');
--
-- 表的结构ysk_news
--
DROP TABLE IF EXISTS `ysk_news`;
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

--
-- 转存表中的数据 ysk_news

INSERT INTO `ysk_news` VALUES('100','恭贺','','0','','1535020732','0','&lt;br /&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n&lt;pre id=&quot;line1&quot;&gt;&lt;span&gt;Youhui Union&lt;/span&gt;公告&lt;/pre&gt;\r\n&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	全球\r\n&lt;pre id=&quot;line1&quot;&gt;&lt;span&gt;Youhui Union&lt;/span&gt;资产用户:大家好！自美国、新加坡、马来西亚、中国社区七月十二正式启动，陆续有台湾、香港、老挝等社区开始进入，为了保证前期平台平稳良性发展，望各玩家积极推动分享，其余事宜敬请关注后续公告。进一步推动财富新起点！谢谢！&lt;/pre&gt;\r\n&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n&lt;pre id=&quot;line1&quot;&gt;&lt;span&gt;Youhui Union&lt;/span&gt;马来西亚运营总部&lt;/pre&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p align=&quot;center&quot;&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-indent:2em;&quot;&gt;\r\n	&lt;span&gt;&lt;/span&gt; \r\n&lt;/p&gt;','','0','0','0');
--
-- 表的结构ysk_notice
--
DROP TABLE IF EXISTS `ysk_notice`;
CREATE TABLE `ysk_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_tittle` varchar(80) NOT NULL COMMENT '公告标题',
  `notice_content` varchar(600) NOT NULL COMMENT '公告详情',
  `notice_addtime` varchar(20) NOT NULL COMMENT '公告添加时间',
  `notice_read` text NOT NULL COMMENT '看过公告会员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_notice

--
-- 表的结构ysk_nzbill
--
DROP TABLE IF EXISTS `ysk_nzbill`;
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

--
-- 转存表中的数据 ysk_nzbill

--
-- 表的结构ysk_nzletter
--
DROP TABLE IF EXISTS `ysk_nzletter`;
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

--
-- 转存表中的数据 ysk_nzletter

--
-- 表的结构ysk_nzusfarm
--
DROP TABLE IF EXISTS `ysk_nzusfarm`;
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

--
-- 转存表中的数据 ysk_nzusfarm

--
-- 表的结构ysk_opesfarms
--
DROP TABLE IF EXISTS `ysk_opesfarms`;
CREATE TABLE `ysk_opesfarms` (
  `id` varchar(11) NOT NULL COMMENT '系统土地操作表',
  `farm_type` tinyint(1) NOT NULL COMMENT '1->鸡窝 2->果园 3->渔场',
  `from_uid` varchar(0) NOT NULL COMMENT '被操作id',
  `ope_uid` varchar(0) NOT NULL COMMENT '操作id',
  `ope_nums` decimal(11,3) NOT NULL COMMENT '操作数量',
  `ope_types` int(2) NOT NULL COMMENT '具体操作',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_opesfarms

--
-- 表的结构ysk_opetypes
--
DROP TABLE IF EXISTS `ysk_opetypes`;
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

--
-- 转存表中的数据 ysk_opetypes

--
-- 表的结构ysk_opinions
--
DROP TABLE IF EXISTS `ysk_opinions`;
CREATE TABLE `ysk_opinions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `contents` text NOT NULL,
  `plansimg` char(50) NOT NULL,
  `add_time` datetime NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '意见处理状态默认是0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_opinions

--
-- 表的结构ysk_order
--
DROP TABLE IF EXISTS `ysk_order`;
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

--
-- 转存表中的数据 ysk_order

--
-- 表的结构ysk_order_detail
--
DROP TABLE IF EXISTS `ysk_order_detail`;
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

--
-- 转存表中的数据 ysk_order_detail

--
-- 表的结构ysk_platforms
--
DROP TABLE IF EXISTS `ysk_platforms`;
CREATE TABLE `ysk_platforms` (
  `id` int(11) NOT NULL COMMENT '平台每天所有积分总和',
  `count_time` date NOT NULL COMMENT '计算时间',
  `platform_nums` decimal(20,2) NOT NULL COMMENT '平台每天所有积分总和(鸡场)',
  `chaifenbili_all` float(11,5) NOT NULL DEFAULT '0.00000' COMMENT '平台基础拆分率（鸡场）',
  `platform_yuchangnums` decimal(20,5) NOT NULL DEFAULT '0.00000' COMMENT '渔场建窝总积分',
  `yuchangchaifenbili_all` float(11,5) NOT NULL DEFAULT '0.00000' COMMENT '渔场基础拆分率',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_platforms

INSERT INTO `ysk_platforms` VALUES('1','2017-11-04','8467578.24','0.00044','575120.00000','0.00000');
--
-- 表的结构ysk_preventip
--
DROP TABLE IF EXISTS `ysk_preventip`;
CREATE TABLE `ysk_preventip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `time` varchar(30) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5897 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_preventip

INSERT INTO `ysk_preventip` VALUES('5786','123.149.113.226','1530240656');
INSERT INTO `ysk_preventip` VALUES('5787','115.199.251.73','1530359733');
INSERT INTO `ysk_preventip` VALUES('5788','123.52.72.162','1530499110');
INSERT INTO `ysk_preventip` VALUES('5789','1.192.82.124','1530599353');
INSERT INTO `ysk_preventip` VALUES('5790','117.136.100.114','1530839156');
INSERT INTO `ysk_preventip` VALUES('5791','123.52.75.168','1531127483');
INSERT INTO `ysk_preventip` VALUES('5792','58.22.114.64','1531139367');
INSERT INTO `ysk_preventip` VALUES('5793','223.104.6.5','1531486479');
INSERT INTO `ysk_preventip` VALUES('5794','58.22.113.126','1531149367');
INSERT INTO `ysk_preventip` VALUES('5795','223.104.6.60','1531477872');
INSERT INTO `ysk_preventip` VALUES('5796','223.104.6.17','1531479709');
INSERT INTO `ysk_preventip` VALUES('5797','112.5.202.158','1531276899');
INSERT INTO `ysk_preventip` VALUES('5798','223.104.6.49','1531553172');
INSERT INTO `ysk_preventip` VALUES('5799','112.5.202.85','1531409893');
INSERT INTO `ysk_preventip` VALUES('5800','117.30.152.200','1531391099');
INSERT INTO `ysk_preventip` VALUES('5801','140.243.160.248','1531404293');
INSERT INTO `ysk_preventip` VALUES('5802','140.243.25.175','1531457911');
INSERT INTO `ysk_preventip` VALUES('5803','223.104.6.63','1531550903');
INSERT INTO `ysk_preventip` VALUES('5804','207.244.149.5','1531458754');
INSERT INTO `ysk_preventip` VALUES('5805','117.30.145.17','1531472821');
INSERT INTO `ysk_preventip` VALUES('5806','112.5.202.21','1531465429');
INSERT INTO `ysk_preventip` VALUES('5807','223.104.6.10','1531586923');
INSERT INTO `ysk_preventip` VALUES('5808','202.109.239.122','1531473431');
INSERT INTO `ysk_preventip` VALUES('5809','58.23.19.145','1531657710');
INSERT INTO `ysk_preventip` VALUES('5810','140.243.224.65','1531473507');
INSERT INTO `ysk_preventip` VALUES('5811','211.97.128.252','1531473867');
INSERT INTO `ysk_preventip` VALUES('5812','140.243.228.166','1531474965');
INSERT INTO `ysk_preventip` VALUES('5813','140.243.184.164','1531480197');
INSERT INTO `ysk_preventip` VALUES('5814','117.30.147.255','1531477898');
INSERT INTO `ysk_preventip` VALUES('5815','140.243.226.151','1531478250');
INSERT INTO `ysk_preventip` VALUES('5816','110.87.15.103','1531638977');
INSERT INTO `ysk_preventip` VALUES('5817','223.104.6.55','1531478549');
INSERT INTO `ysk_preventip` VALUES('5818','223.104.6.61','1531649253');
INSERT INTO `ysk_preventip` VALUES('5819','223.104.6.2','1531479149');
INSERT INTO `ysk_preventip` VALUES('5820','140.243.101.206','1531480085');
INSERT INTO `ysk_preventip` VALUES('5821','183.251.22.61','1531575215');
INSERT INTO `ysk_preventip` VALUES('5822','223.167.142.60','1531481363');
INSERT INTO `ysk_preventip` VALUES('5823','211.97.131.21','1531481760');
INSERT INTO `ysk_preventip` VALUES('5824','106.122.5.93','1531481868');
INSERT INTO `ysk_preventip` VALUES('5825','211.97.128.134','1531482497');
INSERT INTO `ysk_preventip` VALUES('5826','117.30.139.133','1531485666');
INSERT INTO `ysk_preventip` VALUES('5827','117.136.11.1','1531485673');
INSERT INTO `ysk_preventip` VALUES('5828','117.30.146.153','1531486840');
INSERT INTO `ysk_preventip` VALUES('5829','58.23.232.58','1531499420');
INSERT INTO `ysk_preventip` VALUES('5830','183.253.7.125','1531523620');
INSERT INTO `ysk_preventip` VALUES('5831','211.97.128.87','1531544047');
INSERT INTO `ysk_preventip` VALUES('5832','182.106.221.198','1531534547');
INSERT INTO `ysk_preventip` VALUES('5833','117.30.141.85','1531534656');
INSERT INTO `ysk_preventip` VALUES('5834','140.243.218.60','1531543023');
INSERT INTO `ysk_preventip` VALUES('5835','223.104.6.38','1531543736');
INSERT INTO `ysk_preventip` VALUES('5836','223.104.6.14','1531551568');
INSERT INTO `ysk_preventip` VALUES('5837','211.97.130.125','1531553302');
INSERT INTO `ysk_preventip` VALUES('5838','117.30.147.172','1531554505');
INSERT INTO `ysk_preventip` VALUES('5839','211.97.130.239','1531557106');
INSERT INTO `ysk_preventip` VALUES('5840','117.136.38.128','1531557413');
INSERT INTO `ysk_preventip` VALUES('5841','211.97.130.33','1531557809');
INSERT INTO `ysk_preventip` VALUES('5842','223.104.6.4','1531557894');
INSERT INTO `ysk_preventip` VALUES('5843','211.97.130.160','1531559998');
INSERT INTO `ysk_preventip` VALUES('5844','223.104.6.40','1531560119');
INSERT INTO `ysk_preventip` VALUES('5845','117.30.147.28','1531561327');
INSERT INTO `ysk_preventip` VALUES('5846','106.122.4.220','1531565305');
INSERT INTO `ysk_preventip` VALUES('5847','140.243.137.135','1531565452');
INSERT INTO `ysk_preventip` VALUES('5848','140.243.231.88','1531571111');
INSERT INTO `ysk_preventip` VALUES('5849','111.128.184.77','1531582161');
INSERT INTO `ysk_preventip` VALUES('5850','112.5.202.133','1531586355');
INSERT INTO `ysk_preventip` VALUES('5851','112.40.90.165','1531621521');
INSERT INTO `ysk_preventip` VALUES('5852','223.104.6.11','1531631693');
INSERT INTO `ysk_preventip` VALUES('5853','223.104.6.54','1531625442');
INSERT INTO `ysk_preventip` VALUES('5854','211.97.129.134','1531628479');
INSERT INTO `ysk_preventip` VALUES('5855','140.243.166.152','1531629331');
INSERT INTO `ysk_preventip` VALUES('5856','223.104.6.27','1531631954');
INSERT INTO `ysk_preventip` VALUES('5857','110.87.114.31','1531633475');
INSERT INTO `ysk_preventip` VALUES('5858','140.243.59.50','1531649388');
INSERT INTO `ysk_preventip` VALUES('5859','140.243.188.14','1531634069');
INSERT INTO `ysk_preventip` VALUES('5860','59.60.94.120','1531634801');
INSERT INTO `ysk_preventip` VALUES('5861','211.97.128.131','1531635270');
INSERT INTO `ysk_preventip` VALUES('5862','223.104.6.19','1531637992');
INSERT INTO `ysk_preventip` VALUES('5863','27.152.74.89','1531639330');
INSERT INTO `ysk_preventip` VALUES('5864','27.154.132.92','1531640156');
INSERT INTO `ysk_preventip` VALUES('5865','223.104.6.57','1531643077');
INSERT INTO `ysk_preventip` VALUES('5866','117.136.11.174','1531647386');
INSERT INTO `ysk_preventip` VALUES('5867','223.104.169.254','1531648376');
INSERT INTO `ysk_preventip` VALUES('5868','223.104.6.15','1531662265');
INSERT INTO `ysk_preventip` VALUES('5869','223.104.6.1','1531652560');
INSERT INTO `ysk_preventip` VALUES('5870','183.253.38.223','1531665235');
INSERT INTO `ysk_preventip` VALUES('5871','117.136.64.110','1531660119');
INSERT INTO `ysk_preventip` VALUES('5872','183.149.74.95','1531661276');
INSERT INTO `ysk_preventip` VALUES('5873','211.97.129.156','1531661030');
INSERT INTO `ysk_preventip` VALUES('5874','223.104.6.24','1531664935');
INSERT INTO `ysk_preventip` VALUES('5875','183.236.41.149','1534930304');
INSERT INTO `ysk_preventip` VALUES('5876','183.11.36.10','1535083826');
INSERT INTO `ysk_preventip` VALUES('5877','117.136.40.209','1535195069');
INSERT INTO `ysk_preventip` VALUES('5878','223.104.63.1','1535194203');
INSERT INTO `ysk_preventip` VALUES('5879','60.219.226.253','1535199023');
INSERT INTO `ysk_preventip` VALUES('5880','183.37.41.130','1535195511');
INSERT INTO `ysk_preventip` VALUES('5881','112.96.109.70','1535203235');
INSERT INTO `ysk_preventip` VALUES('5882','117.136.39.221','1535197474');
INSERT INTO `ysk_preventip` VALUES('5883','223.104.64.131','1535194249');
INSERT INTO `ysk_preventip` VALUES('5884','183.37.52.103','1535195051');
INSERT INTO `ysk_preventip` VALUES('5885','117.136.40.221','1535200281');
INSERT INTO `ysk_preventip` VALUES('5886','112.97.55.204','1535196810');
INSERT INTO `ysk_preventip` VALUES('5887','113.118.198.36','1535199696');
INSERT INTO `ysk_preventip` VALUES('5888','120.229.64.93','1535204830');
INSERT INTO `ysk_preventip` VALUES('5889','222.248.43.10','1535207136');
INSERT INTO `ysk_preventip` VALUES('5890','113.116.119.208','1535239666');
INSERT INTO `ysk_preventip` VALUES('5891','223.104.63.189','1535249672');
INSERT INTO `ysk_preventip` VALUES('5892','223.104.63.198','1535265486');
INSERT INTO `ysk_preventip` VALUES('5893','223.104.64.129','1535265741');
INSERT INTO `ysk_preventip` VALUES('5894','223.104.64.148','1535265958');
INSERT INTO `ysk_preventip` VALUES('5895','117.136.40.249','1535267500');
INSERT INTO `ysk_preventip` VALUES('5896','223.104.64.152','1535335100');
--
-- 表的结构ysk_product_cate
--
DROP TABLE IF EXISTS `ysk_product_cate`;
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

--
-- 转存表中的数据 ysk_product_cate

INSERT INTO `ysk_product_cate` VALUES('5','0','服饰','test','/Uploads/image/touxiang/2017-12-27/5a43124b316c1.png','0','0','0','','','','','','1508125176','0','','1','1');
INSERT INTO `ysk_product_cate` VALUES('8','0','餐饮','test','/Uploads/image/touxiang/2017-12-27/5a43126bd052b.png','0','0','0','','','','','','1508125567','0','','1','2');
INSERT INTO `ysk_product_cate` VALUES('15','0','酒店','test','/Uploads/image/touxiang/2017-12-27/5a43128769fdb.png','0','0','0','','','','','','1508513711','0','','1','3');
INSERT INTO `ysk_product_cate` VALUES('16','0','旅游','test','/Uploads/image/touxiang/2017-12-27/5a4312a06ba97.png','0','0','0','','','','','','1508513760','0','','1','4');
INSERT INTO `ysk_product_cate` VALUES('22','0','科技','test','/Uploads/image/touxiang/2017-12-27/5a4312b7ba490.png','0','0','0','','','','','','1508515392','0','','1','5');
INSERT INTO `ysk_product_cate` VALUES('23','0','养生','test','/Uploads/image/touxiang/2017-12-27/5a4312d6381f6.png','0','0','0','','','','','','1508515569','0','','1','6');
INSERT INTO `ysk_product_cate` VALUES('24','0','美容','test','/Uploads/image/touxiang/2017-12-27/5a4312e50c2f0.png','0','0','0','','','','','','1508515811','0','','1','7');
INSERT INTO `ysk_product_cate` VALUES('25','0','特产','test','/Uploads/image/touxiang/2017-12-27/5a4312f3c526a.png','0','0','0','','','','','','1508516000','0','','1','8');
INSERT INTO `ysk_product_cate` VALUES('35','0','生鲜','','/Uploads/image/touxiang/2017-12-27/5a43131342991.png','0','0','0','','','','','','1510280398','0','','1','9');
INSERT INTO `ysk_product_cate` VALUES('36','0','其它','','/Uploads/image/touxiang/2017-12-27/5a431328ed687.png','0','0','0','','','','','','1510280422','0','','1','10');
--
-- 表的结构ysk_product_detail
--
DROP TABLE IF EXISTS `ysk_product_detail`;
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

--
-- 转存表中的数据 ysk_product_detail

--
-- 表的结构ysk_proxy
--
DROP TABLE IF EXISTS `ysk_proxy`;
CREATE TABLE `ysk_proxy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `province` int(11) NOT NULL COMMENT '省份',
  `city` int(11) NOT NULL COMMENT '城市',
  `time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 ysk_proxy

--
-- 表的结构ysk_qingsaonums
--
DROP TABLE IF EXISTS `ysk_qingsaonums`;
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

--
-- 转存表中的数据 ysk_qingsaonums

--
-- 表的结构ysk_qingsaorecord
--
DROP TABLE IF EXISTS `ysk_qingsaorecord`;
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

--
-- 转存表中的数据 ysk_qingsaorecord

--
-- 表的结构ysk_sanjione
--
DROP TABLE IF EXISTS `ysk_sanjione`;
CREATE TABLE `ysk_sanjione` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '三级分销',
  `first` float(8,2) NOT NULL COMMENT '一级比例',
  `second` float(8,2) NOT NULL COMMENT '二级比例',
  `third` float(8,2) NOT NULL COMMENT '三级比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_sanjione

INSERT INTO `ysk_sanjione` VALUES('1','0.30','0.20','0.10');
--
-- 表的结构ysk_sanjithree
--
DROP TABLE IF EXISTS `ysk_sanjithree`;
CREATE TABLE `ysk_sanjithree` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '三级分销',
  `first` float(8,2) NOT NULL COMMENT '一级比例',
  `second` float(8,2) NOT NULL COMMENT '二级比例',
  `third` float(8,2) NOT NULL COMMENT '三级比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_sanjithree

INSERT INTO `ysk_sanjithree` VALUES('1','0.30','0.20','0.10');
--
-- 表的结构ysk_sanjitwo
--
DROP TABLE IF EXISTS `ysk_sanjitwo`;
CREATE TABLE `ysk_sanjitwo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '三级分销',
  `first` float(8,2) NOT NULL COMMENT '一级比例',
  `second` float(8,2) NOT NULL COMMENT '二级比例',
  `third` float(8,2) NOT NULL COMMENT '三级比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_sanjitwo

INSERT INTO `ysk_sanjitwo` VALUES('1','0.30','0.20','0.12');
--
-- 表的结构ysk_seed_to_fruit
--
DROP TABLE IF EXISTS `ysk_seed_to_fruit`;
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

--
-- 转存表中的数据 ysk_seed_to_fruit

--
-- 表的结构ysk_shifeijl
--
DROP TABLE IF EXISTS `ysk_shifeijl`;
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

--
-- 转存表中的数据 ysk_shifeijl

--
-- 表的结构ysk_shop_banner
--
DROP TABLE IF EXISTS `ysk_shop_banner`;
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

--
-- 转存表中的数据 ysk_shop_banner

INSERT INTO `ysk_shop_banner` VALUES('1','夏装新时尚','/Themes/Shop/Public/images/banner.jpg','#','1506350099','0','描述');
INSERT INTO `ysk_shop_banner` VALUES('2','夏装新时尚','/Themes/Shop/Public/images/banner.jpg','#','1506350099','0','描述');
INSERT INTO `ysk_shop_banner` VALUES('3','夏装新时尚','/Themes/Shop/Public/images/banner.jpg','#','1506350099','0','描述');
INSERT INTO `ysk_shop_banner` VALUES('4','夏装新时尚','/Themes/Shop/Public/images/banner.jpg','#','1506350099','0','描述');
INSERT INTO `ysk_shop_banner` VALUES('5','夏装新时尚','/Themes/Shop/Public/images/banner.jpg','#','1506350099','0','描述');
--
-- 表的结构ysk_shouge
--
DROP TABLE IF EXISTS `ysk_shouge`;
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

--
-- 转存表中的数据 ysk_shouge

--
-- 表的结构ysk_sow
--
DROP TABLE IF EXISTS `ysk_sow`;
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

--
-- 转存表中的数据 ysk_sow

--
-- 表的结构ysk_steal_detail
--
DROP TABLE IF EXISTS `ysk_steal_detail`;
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

--
-- 转存表中的数据 ysk_steal_detail

--
-- 表的结构ysk_store
--
DROP TABLE IF EXISTS `ysk_store`;
CREATE TABLE `ysk_store` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `cangku_num` decimal(13,5) NOT NULL DEFAULT '0.00000' COMMENT '钱包余额',
  `fengmi_num` decimal(13,5) NOT NULL DEFAULT '0.00000' COMMENT '积分',
  `plant_num` decimal(13,4) NOT NULL DEFAULT '0.0000' COMMENT '播种总数',
  `huafei_total` decimal(13,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '施肥累计',
  `vip_grade` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 ysk_store

INSERT INTO `ysk_store` VALUES('2','635298.69206','555101.30794','0.0000','0.00','0');
INSERT INTO `ysk_store` VALUES('3','800.79920','199.20080','0.0000','0.00','0');
INSERT INTO `ysk_store` VALUES('4','0.00000','0.00000','0.0000','0.00','0');
INSERT INTO `ysk_store` VALUES('5','9600.00000','2400.00000','0.0000','0.00','0');
INSERT INTO `ysk_store` VALUES('6','805.99920','2794.00080','0.0000','0.00','0');
INSERT INTO `ysk_store` VALUES('7','5600.40000','7799.60000','0.0000','0.00','0');
INSERT INTO `ysk_store` VALUES('8','78404.00000','30396.00000','0.0000','0.00','0');
INSERT INTO `ysk_store` VALUES('9','8004.00000','1996.00000','0.0000','0.00','0');
INSERT INTO `ysk_store` VALUES('10','996.40000','983.60000','0.0000','0.00','0');
INSERT INTO `ysk_store` VALUES('11','2682.00000','4994.00000','0.0000','0.00','0');
INSERT INTO `ysk_store` VALUES('12','6204.00000','6476.00000','0.0000','0.00','0');
INSERT INTO `ysk_store` VALUES('13','1341.71920','658.28080','0.0000','0.00','0');
INSERT INTO `ysk_store` VALUES('14','30020.00000','39980.00000','0.0000','0.00','0');
--
-- 表的结构ysk_tcp_config
--
DROP TABLE IF EXISTS `ysk_tcp_config`;
CREATE TABLE `ysk_tcp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '挑粪/采蜜/扑鱼设置表',
  `farm_type` tinyint(1) NOT NULL COMMENT '1->鸡窝挑粪设置,2->渔场扑鱼设置,3->果园好友',
  `dai_dets` int(2) NOT NULL COMMENT '对应第几代',
  `earns_bili` float(10,2) NOT NULL COMMENT '可拿收益比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_tcp_config

INSERT INTO `ysk_tcp_config` VALUES('1','1','1','0.07');
INSERT INTO `ysk_tcp_config` VALUES('2','1','2','0.05');
INSERT INTO `ysk_tcp_config` VALUES('3','1','3','0.03');
INSERT INTO `ysk_tcp_config` VALUES('4','3','3','0.05');
INSERT INTO `ysk_tcp_config` VALUES('5','3','4','0.03');
--
-- 表的结构ysk_tiaofen
--
DROP TABLE IF EXISTS `ysk_tiaofen`;
CREATE TABLE `ysk_tiaofen` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '挑粪/采蜜/捕鱼',
  `type` tinyint(1) NOT NULL COMMENT '1 挑粪 2采蜜 3 捕鱼',
  `tf_date` datetime NOT NULL COMMENT '挑粪时间',
  `tf_id` int(11) NOT NULL COMMENT '从谁身上获取的',
  `tf_nums` decimal(11,2) NOT NULL COMMENT '挑粪数量',
  `fiaofen_uid` varchar(30) NOT NULL COMMENT '挑过我粪的上级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_tiaofen

--
-- 表的结构ysk_tixian
--
DROP TABLE IF EXISTS `ysk_tixian`;
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

--
-- 转存表中的数据 ysk_tixian

--
-- 表的结构ysk_tool
--
DROP TABLE IF EXISTS `ysk_tool`;
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

--
-- 转存表中的数据 ysk_tool

INSERT INTO `ysk_tool` VALUES('1','狗粮','16','1','1','','0','/Public/home/wap/images/ck2.jpg');
INSERT INTO `ysk_tool` VALUES('2','一键采蜜','12','1','1','','0','/Public/home/wap/images/ck3.jpg');
INSERT INTO `ysk_tool` VALUES('3','农夫','128','2','0','nongfu_num','1','/Public/home/wap/images/ck10.jpg');
INSERT INTO `ysk_tool` VALUES('4','鸟','108','2','0','niao_num','1','/Public/home/wap/images/ck4.jpg');
INSERT INTO `ysk_tool` VALUES('5','小鸡','88','2','0','ji_num','1','/Public/home/wap/images/ck8.jpg');
INSERT INTO `ysk_tool` VALUES('6','猫','98','2','0','mao_num','1','/Public/home/wap/images/ck9.jpg');
INSERT INTO `ysk_tool` VALUES('7','泰迪','68','2','0','zangao_num','1','/Public/home/wap/images/ck6.jpg');
INSERT INTO `ysk_tool` VALUES('8','哈士奇','98','2','0','zangao_num','2','/Public/home/wap/images/ck5.jpg');
INSERT INTO `ysk_tool` VALUES('9','藏獒','128','2','0','zangao_num','3','/Public/home/wap/images/ck7.jpg');
--
-- 表的结构ysk_trading
--
DROP TABLE IF EXISTS `ysk_trading`;
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

--
-- 转存表中的数据 ysk_trading

--
-- 表的结构ysk_trading_free
--
DROP TABLE IF EXISTS `ysk_trading_free`;
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

--
-- 转存表中的数据 ysk_trading_free

--
-- 表的结构ysk_tranmoney
--
DROP TABLE IF EXISTS `ysk_tranmoney`;
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
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 ysk_tranmoney

INSERT INTO `ysk_tranmoney` VALUES('1','0','2','1000000.00','1535196945','11','1000000.00','1000000.00','1');
INSERT INTO `ysk_tranmoney` VALUES('2','2','2','300.00','1535197086','13','999700.00','999700.00','1');
INSERT INTO `ysk_tranmoney` VALUES('3','2','2','900.00','1535197086','1','900.00','900.00','1');
INSERT INTO `ysk_tranmoney` VALUES('4','2','2','1.80','1535197132','2','999701.80','999701.80','1');
INSERT INTO `ysk_tranmoney` VALUES('5','2','2','-1.80','1535197132','1','898.20','898.20','1');
INSERT INTO `ysk_tranmoney` VALUES('6','2','2','1.80','1535197484','2','999703.60','999703.60','1');
INSERT INTO `ysk_tranmoney` VALUES('7','2','2','-1.80','1535197484','1','896.40','896.40','1');
INSERT INTO `ysk_tranmoney` VALUES('8','2','2','1.79','1535197598','2','999705.39','999705.39','1');
INSERT INTO `ysk_tranmoney` VALUES('9','2','2','-1.79','1535197598','1','894.61','894.61','1');
INSERT INTO `ysk_tranmoney` VALUES('10','2','2','10000.00','1535199468','13','989705.39','989705.39','1');
INSERT INTO `ysk_tranmoney` VALUES('11','2','2','30000.00','1535199468','1','30894.61','30894.61','1');
INSERT INTO `ysk_tranmoney` VALUES('12','2','2','10000.00','1535199500','13','979705.39','979705.39','1');
INSERT INTO `ysk_tranmoney` VALUES('13','2','2','30000.00','1535199500','1','60894.61','60894.61','1');
INSERT INTO `ysk_tranmoney` VALUES('14','2','5','2000.00','1535200461','1','68894.61','2000.00','1');
INSERT INTO `ysk_tranmoney` VALUES('15','2','5','10000.00','1535200461','0','969705.39','8000.00','1');
INSERT INTO `ysk_tranmoney` VALUES('16','2','0','10100.00','1535203015','9','959605.39','959605.39','1');
INSERT INTO `ysk_tranmoney` VALUES('17','2','2','137.79','1535237862','2','959743.18','959743.18','1');
INSERT INTO `ysk_tranmoney` VALUES('18','2','2','-137.79','1535237862','1','68756.82','68756.82','1');
INSERT INTO `ysk_tranmoney` VALUES('19','2','0','10100.00','1535238031','9','949643.18','949643.18','1');
INSERT INTO `ysk_tranmoney` VALUES('20','2','2','10000.00','1535238290','13','939643.18','939643.18','1');
INSERT INTO `ysk_tranmoney` VALUES('21','2','2','30000.00','1535238290','1','98756.82','98756.82','1');
INSERT INTO `ysk_tranmoney` VALUES('22','2','2','100000.00','1535238364','13','839643.18','839643.18','1');
INSERT INTO `ysk_tranmoney` VALUES('23','2','2','300000.00','1535238364','1','398756.82','398756.82','1');
INSERT INTO `ysk_tranmoney` VALUES('24','2','8','2000.00','1535239951','1','406756.82','2000.00','1');
INSERT INTO `ysk_tranmoney` VALUES('25','2','8','10000.00','1535239951','0','829643.18','8000.00','1');
INSERT INTO `ysk_tranmoney` VALUES('26','8','8','4.00','1535240019','2','8004.00','8004.00','1');
INSERT INTO `ysk_tranmoney` VALUES('27','8','8','-4.00','1535240019','1','1996.00','1996.00','1');
INSERT INTO `ysk_tranmoney` VALUES('28','2','8','20000.00','1535240268','1','486756.82','21996.00','1');
INSERT INTO `ysk_tranmoney` VALUES('29','2','8','100000.00','1535240268','0','729643.18','88004.00','1');
INSERT INTO `ysk_tranmoney` VALUES('30','2','3','200.00','1535240611','1','487556.82','200.00','1');
INSERT INTO `ysk_tranmoney` VALUES('31','2','3','1000.00','1535240611','0','728643.18','800.00','1');
INSERT INTO `ysk_tranmoney` VALUES('32','3','3','0.40','1535247035','2','800.40','800.40','1');
INSERT INTO `ysk_tranmoney` VALUES('33','3','3','-0.40','1535247035','1','199.60','199.60','1');
INSERT INTO `ysk_tranmoney` VALUES('34','8','5','200.00','1535248704','1','22796.00','2200.00','1');
INSERT INTO `ysk_tranmoney` VALUES('35','8','5','1000.00','1535248704','0','87004.00','8800.00','1');
INSERT INTO `ysk_tranmoney` VALUES('36','8','6','200.00','1535248754','1','23596.00','200.00','1');
INSERT INTO `ysk_tranmoney` VALUES('37','8','6','1000.00','1535248754','0','86004.00','800.00','1');
INSERT INTO `ysk_tranmoney` VALUES('38','8','7','200.00','1535248816','1','24396.00','200.00','1');
INSERT INTO `ysk_tranmoney` VALUES('39','8','7','1000.00','1535248816','0','85004.00','800.00','1');
INSERT INTO `ysk_tranmoney` VALUES('40','6','6','0.40','1535248878','2','800.40','800.40','1');
INSERT INTO `ysk_tranmoney` VALUES('41','6','6','-0.40','1535248878','1','199.60','199.60','1');
INSERT INTO `ysk_tranmoney` VALUES('42','7','7','0.40','1535248889','2','800.40','800.40','1');
INSERT INTO `ysk_tranmoney` VALUES('43','7','7','-0.40','1535248889','1','199.60','199.60','1');
INSERT INTO `ysk_tranmoney` VALUES('44','6','6','800.00','1535248907','13','0.40','0.40','1');
INSERT INTO `ysk_tranmoney` VALUES('45','6','6','2400.00','1535248907','1','2599.60','2599.60','1');
INSERT INTO `ysk_tranmoney` VALUES('46','2','9','2000.00','1535251439','1','495556.82','2000.00','1');
INSERT INTO `ysk_tranmoney` VALUES('47','2','9','10000.00','1535251439','0','718643.18','8000.00','1');
INSERT INTO `ysk_tranmoney` VALUES('48','2','7','2000.00','1535265674','1','503556.82','2199.60','1');
INSERT INTO `ysk_tranmoney` VALUES('49','2','7','10000.00','1535265674','0','708643.18','8800.40','1');
INSERT INTO `ysk_tranmoney` VALUES('50','2','11','1000.00','1535265887','1','507556.82','1000.00','1');
INSERT INTO `ysk_tranmoney` VALUES('51','2','11','5000.00','1535265887','0','703643.18','4000.00','1');
INSERT INTO `ysk_tranmoney` VALUES('52','11','11','2.00','1535265892','2','4002.00','4002.00','1');
INSERT INTO `ysk_tranmoney` VALUES('53','11','11','-2.00','1535265892','1','998.00','998.00','1');
INSERT INTO `ysk_tranmoney` VALUES('54','11','10','200.00','1535265984','1','1798.00','200.00','1');
INSERT INTO `ysk_tranmoney` VALUES('55','11','10','1000.00','1535265984','0','3002.00','800.00','1');
INSERT INTO `ysk_tranmoney` VALUES('56','10','10','0.40','1535265999','2','800.40','800.40','1');
INSERT INTO `ysk_tranmoney` VALUES('57','10','10','-0.40','1535265999','1','199.60','199.60','1');
INSERT INTO `ysk_tranmoney` VALUES('58','7','2','200.00','1535266000','1','2999.60','507756.82','1');
INSERT INTO `ysk_tranmoney` VALUES('59','7','2','1000.00','1535266000','0','7800.40','704443.18','1');
INSERT INTO `ysk_tranmoney` VALUES('60','2','12','2000.00','1535266153','1','515756.82','2000.00','1');
INSERT INTO `ysk_tranmoney` VALUES('61','2','12','10000.00','1535266153','0','694443.18','8000.00','1');
INSERT INTO `ysk_tranmoney` VALUES('62','12','12','4.00','1535266174','2','8004.00','8004.00','1');
INSERT INTO `ysk_tranmoney` VALUES('63','12','12','-4.00','1535266174','1','1996.00','1996.00','1');
INSERT INTO `ysk_tranmoney` VALUES('64','8','11','200.00','1535266201','1','25196.00','1998.00','1');
INSERT INTO `ysk_tranmoney` VALUES('65','8','11','1000.00','1535266201','0','84004.00','3802.00','1');
INSERT INTO `ysk_tranmoney` VALUES('66','8','7','200.00','1535266235','1','25996.00','3199.60','1');
INSERT INTO `ysk_tranmoney` VALUES('67','8','7','1000.00','1535266235','0','83004.00','8600.40','1');
INSERT INTO `ysk_tranmoney` VALUES('68','8','5','200.00','1535266290','1','26796.00','2400.00','1');
INSERT INTO `ysk_tranmoney` VALUES('69','8','5','1000.00','1535266290','0','82004.00','9600.00','1');
INSERT INTO `ysk_tranmoney` VALUES('70','8','6','200.00','1535266318','1','27596.00','2799.60','1');
INSERT INTO `ysk_tranmoney` VALUES('71','8','6','1000.00','1535266318','0','81004.00','800.40','1');
INSERT INTO `ysk_tranmoney` VALUES('72','8','10','200.00','1535266352','1','28396.00','399.60','1');
INSERT INTO `ysk_tranmoney` VALUES('73','8','10','1000.00','1535266352','0','80004.00','1600.40','1');
INSERT INTO `ysk_tranmoney` VALUES('74','12','12','1000.00','1535266370','13','7004.00','7004.00','1');
INSERT INTO `ysk_tranmoney` VALUES('75','12','12','3000.00','1535266370','1','4996.00','4996.00','1');
INSERT INTO `ysk_tranmoney` VALUES('76','7','7','1000.00','1535266427','13','7600.40','7600.40','1');
INSERT INTO `ysk_tranmoney` VALUES('77','7','7','3000.00','1535266427','1','6199.60','6199.60','1');
INSERT INTO `ysk_tranmoney` VALUES('78','2','0','1100.00','1535266463','9','693343.18','693343.18','1');
INSERT INTO `ysk_tranmoney` VALUES('79','8','2','200.00','1535266974','1','29196.00','515956.82','1');
INSERT INTO `ysk_tranmoney` VALUES('80','8','2','1000.00','1535266974','0','79004.00','694143.18','1');
INSERT INTO `ysk_tranmoney` VALUES('81','8','12','200.00','1535267603','1','29996.00','5196.00','1');
INSERT INTO `ysk_tranmoney` VALUES('82','8','12','1000.00','1535267603','0','78004.00','7804.00','1');
INSERT INTO `ysk_tranmoney` VALUES('83','11','13','200.00','1535267674','1','2798.00','200.00','1');
INSERT INTO `ysk_tranmoney` VALUES('84','11','13','1000.00','1535267674','0','2802.00','800.00','1');
INSERT INTO `ysk_tranmoney` VALUES('85','13','13','0.40','1535267696','2','800.40','800.40','1');
INSERT INTO `ysk_tranmoney` VALUES('86','13','13','-0.40','1535267696','1','199.60','199.60','1');
INSERT INTO `ysk_tranmoney` VALUES('87','12','11','160.00','1535267772','1','5836.00','2958.00','1');
INSERT INTO `ysk_tranmoney` VALUES('88','12','11','800.00','1535267772','0','7004.00','3442.00','1');
INSERT INTO `ysk_tranmoney` VALUES('89','10','11','120.00','1535267839','1','879.60','3078.00','1');
INSERT INTO `ysk_tranmoney` VALUES('90','10','11','600.00','1535267839','0','1000.40','3922.00','1');
INSERT INTO `ysk_tranmoney` VALUES('91','11','8','200.00','1535267846','1','3878.00','30196.00','1');
INSERT INTO `ysk_tranmoney` VALUES('92','11','8','1000.00','1535267846','0','2922.00','78804.00','1');
INSERT INTO `ysk_tranmoney` VALUES('93','12','13','160.00','1535267867','1','6476.00','359.60','1');
INSERT INTO `ysk_tranmoney` VALUES('94','12','13','800.00','1535267867','0','6204.00','1440.40','1');
INSERT INTO `ysk_tranmoney` VALUES('95','8','0','600.00','1535267942','9','78204.00','78204.00','1');
INSERT INTO `ysk_tranmoney` VALUES('96','7','11','200.00','1535267954','1','6999.60','4078.00','1');
INSERT INTO `ysk_tranmoney` VALUES('97','7','11','1000.00','1535267954','0','6600.40','3722.00','1');
INSERT INTO `ysk_tranmoney` VALUES('98','7','8','200.00','1535268009','1','7799.60','30396.00','1');
INSERT INTO `ysk_tranmoney` VALUES('99','7','8','1000.00','1535268009','0','5600.40','79004.00','1');
INSERT INTO `ysk_tranmoney` VALUES('100','11','2','200.00','1535268019','1','4878.00','516156.82','1');
INSERT INTO `ysk_tranmoney` VALUES('101','11','2','1000.00','1535268019','0','2722.00','694943.18','1');
INSERT INTO `ysk_tranmoney` VALUES('102','8','0','600.00','1535268093','9','78404.00','78404.00','1');
INSERT INTO `ysk_tranmoney` VALUES('103','2','0','10100.00','1535268132','9','684843.18','684843.18','1');
INSERT INTO `ysk_tranmoney` VALUES('104','2','0','600.00','1535268160','9','684243.18','684243.18','1');
INSERT INTO `ysk_tranmoney` VALUES('105','13','13','100.00','1535268243','13','1340.40','1340.40','1');
INSERT INTO `ysk_tranmoney` VALUES('106','13','13','300.00','1535268243','1','659.60','659.60','1');
INSERT INTO `ysk_tranmoney` VALUES('107','10','11','20.00','1535278184','1','959.60','4898.00','1');
INSERT INTO `ysk_tranmoney` VALUES('108','10','11','100.00','1535278184','0','900.40','2802.00','1');
INSERT INTO `ysk_tranmoney` VALUES('109','11','10','24.00','1535278238','1','4994.00','983.60','1');
INSERT INTO `ysk_tranmoney` VALUES('110','11','10','120.00','1535278238','0','2682.00','996.40','1');
INSERT INTO `ysk_tranmoney` VALUES('111','9','9','4.00','1535301520','2','8004.00','8004.00','1');
INSERT INTO `ysk_tranmoney` VALUES('112','9','9','-4.00','1535301520','1','1996.00','1996.00','1');
INSERT INTO `ysk_tranmoney` VALUES('113','6','6','5.60','1535305874','2','806.00','806.00','1');
INSERT INTO `ysk_tranmoney` VALUES('114','6','6','-5.60','1535305874','1','2794.00','2794.00','1');
INSERT INTO `ysk_tranmoney` VALUES('115','13','13','1.32','1535325814','2','1341.72','1341.72','1');
INSERT INTO `ysk_tranmoney` VALUES('116','13','13','-1.32','1535325814','1','658.28','658.28','1');
INSERT INTO `ysk_tranmoney` VALUES('117','3','3','0.40','1535333415','2','800.80','800.80','1');
INSERT INTO `ysk_tranmoney` VALUES('118','3','3','-0.40','1535333415','1','199.20','199.20','1');
INSERT INTO `ysk_tranmoney` VALUES('119','2','2','1055.51','1535335233','2','685298.69','685298.69','1');
INSERT INTO `ysk_tranmoney` VALUES('120','2','2','-1055.51','1535335233','1','515101.31','515101.31','1');
INSERT INTO `ysk_tranmoney` VALUES('121','2','14','10000.00','1535335292','1','555101.31','10000.00','1');
INSERT INTO `ysk_tranmoney` VALUES('122','2','14','50000.00','1535335292','0','635298.69','40000.00','1');
INSERT INTO `ysk_tranmoney` VALUES('123','14','14','20.00','1535335303','2','40020.00','40020.00','1');
INSERT INTO `ysk_tranmoney` VALUES('124','14','14','-20.00','1535335303','1','9980.00','9980.00','1');
INSERT INTO `ysk_tranmoney` VALUES('125','14','14','10000.00','1535335442','13','30020.00','30020.00','1');
INSERT INTO `ysk_tranmoney` VALUES('126','14','14','30000.00','1535335442','1','39980.00','39980.00','1');
--
-- 表的结构ysk_trans
--
DROP TABLE IF EXISTS `ysk_trans`;
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
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_trans

INSERT INTO `ysk_trans` VALUES('167','0','2','500.00','0','1535197684','PAY2018082552100535','','','1','','','0.00','355');
INSERT INTO `ysk_trans` VALUES('168','2','0','10000.00','0','1535203015','PAY2018082555549799','355','','0','','','100.00','');
INSERT INTO `ysk_trans` VALUES('169','2','0','10000.00','0','1535238031','PAY2018082610257529','355','','0','','','100.00','');
INSERT INTO `ysk_trans` VALUES('170','0','2','10000.00','0','1535238111','PAY2018082610210156','','','1','','','0.00','355');
INSERT INTO `ysk_trans` VALUES('171','2','0','1000.00','0','1535266463','PAY2018082610257481','355','','0','','','100.00','');
INSERT INTO `ysk_trans` VALUES('172','0','8','1000.00','0','1535266706','PAY2018082650501009','','','1','','','0.00','356');
INSERT INTO `ysk_trans` VALUES('173','8','0','500.00','0','1535267942','PAY2018082654495410','356','','0','','','100.00','');
INSERT INTO `ysk_trans` VALUES('174','8','0','500.00','0','1535268093','PAY2018082610010057','356','','0','','','100.00','');
INSERT INTO `ysk_trans` VALUES('175','2','0','10000.00','0','1535268132','PAY2018082652999750','355','','0','','','100.00','');
INSERT INTO `ysk_trans` VALUES('176','2','0','500.00','0','1535268160','PAY2018082648551001','355','','0','','','100.00','');
INSERT INTO `ysk_trans` VALUES('177','0','8','500.00','0','1535268303','PAY2018082610252995','','','1','','','0.00','356');
--
-- 表的结构ysk_trans_quxiao
--
DROP TABLE IF EXISTS `ysk_trans_quxiao`;
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

--
-- 转存表中的数据 ysk_trans_quxiao

INSERT INTO `ysk_trans_quxiao` VALUES('132','0','8574','500.00','0','1530495303','PAY2018070255505751','','','1','','','0.00','339');
INSERT INTO `ysk_trans_quxiao` VALUES('127','0','8573','500.00','0','1530240894','PAY2018062910197499','','','1','','','0.00','335');
INSERT INTO `ysk_trans_quxiao` VALUES('126','8573','8545','500.00','1','1530007597','PAY2018062610050974','2','','1','','','100.00','328');
INSERT INTO `ysk_trans_quxiao` VALUES('143','0','8569','500.00','0','1530612770','PAY2018070350555148','','','1','','','0.00','338');
INSERT INTO `ysk_trans_quxiao` VALUES('131','0','8569','500.00','0','1530341088','PAY2018063048514999','','','1','','','0.00','338');
INSERT INTO `ysk_trans_quxiao` VALUES('136','0','8579','500.00','0','1530513859','PAY2018070251535757','','','1','','','0.00','340');
INSERT INTO `ysk_trans_quxiao` VALUES('150','0','8579','500.00','0','1530688235','PAY2018070498519749','','','1','','','0.00','347');
INSERT INTO `ysk_trans_quxiao` VALUES('151','0','8579','500.00','0','1530688559','PAY2018070410249531','','','1','','','0.00','347');
--
-- 表的结构ysk_tuandui
--
DROP TABLE IF EXISTS `ysk_tuandui`;
CREATE TABLE `ysk_tuandui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id_2` (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_tuandui

--
-- 表的结构ysk_turntable_lv
--
DROP TABLE IF EXISTS `ysk_turntable_lv`;
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

--
-- 转存表中的数据 ysk_turntable_lv

INSERT INTO `ysk_turntable_lv` VALUES('6000001','0','0','1','1','1','1','30','70');
--
-- 表的结构ysk_ubanks
--
DROP TABLE IF EXISTS `ysk_ubanks`;
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
) ENGINE=MyISAM AUTO_INCREMENT=357 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 ysk_ubanks

INSERT INTO `ysk_ubanks` VALUES('353','6','8671','0','1531562091','陈景德','6217001930010128115','厦门集美区杏林支行');
INSERT INTO `ysk_ubanks` VALUES('354','4','8725','0','1535020461','123','131351','165156');
INSERT INTO `ysk_ubanks` VALUES('355','2','2','0','1535197678','123','123','123');
INSERT INTO `ysk_ubanks` VALUES('356','3','8','0','1535266678','蒋颖','9558804000165294212','深圳水榭春天花园支行');
--
-- 表的结构ysk_ucoins
--
DROP TABLE IF EXISTS `ysk_ucoins`;
CREATE TABLE `ysk_ucoins` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '每个人账户对应币',
  `cid` int(10) NOT NULL COMMENT '币对应id',
  `c_nums` decimal(11,4) NOT NULL DEFAULT '0.0000' COMMENT '对应币数量',
  `c_uid` int(10) NOT NULL COMMENT '对应的会员id',
  `djie_nums` decimal(11,4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 ysk_ucoins

--
-- 表的结构ysk_uesources
--
DROP TABLE IF EXISTS `ysk_uesources`;
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

--
-- 转存表中的数据 ysk_uesources

--
-- 表的结构ysk_upgoods
--
DROP TABLE IF EXISTS `ysk_upgoods`;
CREATE TABLE `ysk_upgoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商户产品表',
  `uid` int(11) NOT NULL COMMENT '商户id',
  `goods_id` int(11) NOT NULL COMMENT '产品id',
  `uptime` int(20) NOT NULL COMMENT '产品上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=276 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 ysk_upgoods

INSERT INTO `ysk_upgoods` VALUES('161','1','120','1523524539');
INSERT INTO `ysk_upgoods` VALUES('162','1','1','1523524892');
INSERT INTO `ysk_upgoods` VALUES('163','1','121','1523527487');
INSERT INTO `ysk_upgoods` VALUES('164','1','122','1523527893');
INSERT INTO `ysk_upgoods` VALUES('165','1','123','1523528164');
INSERT INTO `ysk_upgoods` VALUES('166','1','124','1523585146');
INSERT INTO `ysk_upgoods` VALUES('167','1','1','1523585999');
INSERT INTO `ysk_upgoods` VALUES('168','1','1','1523590787');
INSERT INTO `ysk_upgoods` VALUES('169','1','1','1523590805');
INSERT INTO `ysk_upgoods` VALUES('170','1','125','1523591034');
INSERT INTO `ysk_upgoods` VALUES('171','1','1','1523591062');
INSERT INTO `ysk_upgoods` VALUES('172','1','1','1523591084');
INSERT INTO `ysk_upgoods` VALUES('173','1','1','1523591691');
INSERT INTO `ysk_upgoods` VALUES('174','1','1','1523591706');
INSERT INTO `ysk_upgoods` VALUES('175','1','126','1523591905');
INSERT INTO `ysk_upgoods` VALUES('176','1','127','1523592170');
INSERT INTO `ysk_upgoods` VALUES('177','1','1','1523592183');
INSERT INTO `ysk_upgoods` VALUES('178','1','128','1523599780');
INSERT INTO `ysk_upgoods` VALUES('179','1','129','1523600007');
INSERT INTO `ysk_upgoods` VALUES('180','1','130','1523600332');
INSERT INTO `ysk_upgoods` VALUES('181','1','131','1523600487');
INSERT INTO `ysk_upgoods` VALUES('182','1','1','1523600643');
INSERT INTO `ysk_upgoods` VALUES('183','1','1','1523600994');
INSERT INTO `ysk_upgoods` VALUES('184','1','1','1523601000');
INSERT INTO `ysk_upgoods` VALUES('185','1','134','1523601233');
INSERT INTO `ysk_upgoods` VALUES('186','1','1','1523601368');
INSERT INTO `ysk_upgoods` VALUES('187','1','1','1523601669');
INSERT INTO `ysk_upgoods` VALUES('188','1','1','1523601939');
INSERT INTO `ysk_upgoods` VALUES('189','1','1','1523602635');
INSERT INTO `ysk_upgoods` VALUES('190','1','1','1523602922');
INSERT INTO `ysk_upgoods` VALUES('191','1','1','1523602954');
INSERT INTO `ysk_upgoods` VALUES('192','1','1','1523603192');
INSERT INTO `ysk_upgoods` VALUES('193','1','1','1523603229');
INSERT INTO `ysk_upgoods` VALUES('194','1','1','1523603236');
INSERT INTO `ysk_upgoods` VALUES('195','1','1','1523603247');
INSERT INTO `ysk_upgoods` VALUES('196','1','1','1523603254');
INSERT INTO `ysk_upgoods` VALUES('197','1','1','1523603264');
INSERT INTO `ysk_upgoods` VALUES('198','1','1','1523603272');
INSERT INTO `ysk_upgoods` VALUES('199','1','1','1523603281');
INSERT INTO `ysk_upgoods` VALUES('200','1','1','1523603288');
INSERT INTO `ysk_upgoods` VALUES('201','1','1','1523603297');
INSERT INTO `ysk_upgoods` VALUES('202','1','139','1523678159');
INSERT INTO `ysk_upgoods` VALUES('203','1','140','1523681996');
INSERT INTO `ysk_upgoods` VALUES('204','1','141','1523682082');
INSERT INTO `ysk_upgoods` VALUES('205','1','142','1523682186');
INSERT INTO `ysk_upgoods` VALUES('206','1','143','1523682266');
INSERT INTO `ysk_upgoods` VALUES('207','1','144','1523682359');
INSERT INTO `ysk_upgoods` VALUES('208','1','145','1523682452');
INSERT INTO `ysk_upgoods` VALUES('209','1','146','1523682580');
INSERT INTO `ysk_upgoods` VALUES('210','1','147','1523682632');
INSERT INTO `ysk_upgoods` VALUES('211','1','148','1523682759');
INSERT INTO `ysk_upgoods` VALUES('212','1','149','1523682825');
INSERT INTO `ysk_upgoods` VALUES('213','1','150','1523682902');
INSERT INTO `ysk_upgoods` VALUES('214','1','151','1523682999');
INSERT INTO `ysk_upgoods` VALUES('215','1','152','1523683071');
INSERT INTO `ysk_upgoods` VALUES('216','1','153','1523683148');
INSERT INTO `ysk_upgoods` VALUES('217','1','154','1523683209');
INSERT INTO `ysk_upgoods` VALUES('218','1','155','1523683285');
INSERT INTO `ysk_upgoods` VALUES('219','1','156','1523683378');
INSERT INTO `ysk_upgoods` VALUES('220','1','157','1523683444');
INSERT INTO `ysk_upgoods` VALUES('221','1','158','1523683515');
INSERT INTO `ysk_upgoods` VALUES('222','1','159','1523683570');
INSERT INTO `ysk_upgoods` VALUES('223','1','160','1523683659');
INSERT INTO `ysk_upgoods` VALUES('224','1','161','1523683725');
INSERT INTO `ysk_upgoods` VALUES('225','1','162','1523683804');
INSERT INTO `ysk_upgoods` VALUES('226','1','163','1523683860');
INSERT INTO `ysk_upgoods` VALUES('227','1','164','1523683977');
INSERT INTO `ysk_upgoods` VALUES('228','1','165','1523684050');
INSERT INTO `ysk_upgoods` VALUES('229','1','166','1523684121');
INSERT INTO `ysk_upgoods` VALUES('230','1','1','1523684189');
INSERT INTO `ysk_upgoods` VALUES('231','1','1','1523684211');
INSERT INTO `ysk_upgoods` VALUES('232','1','1','1523684226');
INSERT INTO `ysk_upgoods` VALUES('233','1','1','1523690932');
INSERT INTO `ysk_upgoods` VALUES('234','1','1','1523690943');
INSERT INTO `ysk_upgoods` VALUES('235','1','1','1523690951');
INSERT INTO `ysk_upgoods` VALUES('236','1','1','1523690960');
INSERT INTO `ysk_upgoods` VALUES('237','1','1','1523690978');
INSERT INTO `ysk_upgoods` VALUES('238','1','1','1523690994');
INSERT INTO `ysk_upgoods` VALUES('239','1','1','1523691012');
INSERT INTO `ysk_upgoods` VALUES('240','1','1','1523691022');
INSERT INTO `ysk_upgoods` VALUES('241','1','1','1523691032');
INSERT INTO `ysk_upgoods` VALUES('242','1','1','1523691569');
INSERT INTO `ysk_upgoods` VALUES('243','1','1','1523691731');
INSERT INTO `ysk_upgoods` VALUES('244','1','1','1523692218');
INSERT INTO `ysk_upgoods` VALUES('245','1','1','1523694090');
INSERT INTO `ysk_upgoods` VALUES('246','1','1','1523694440');
INSERT INTO `ysk_upgoods` VALUES('247','1','1','1523694539');
INSERT INTO `ysk_upgoods` VALUES('248','1','1','1523694665');
INSERT INTO `ysk_upgoods` VALUES('249','1','1','1523694727');
INSERT INTO `ysk_upgoods` VALUES('250','1','1','1523695077');
INSERT INTO `ysk_upgoods` VALUES('251','1','1','1523695326');
INSERT INTO `ysk_upgoods` VALUES('252','1','1','1523695512');
INSERT INTO `ysk_upgoods` VALUES('253','1','1','1523695722');
INSERT INTO `ysk_upgoods` VALUES('254','1','1','1523695930');
INSERT INTO `ysk_upgoods` VALUES('255','1','1','1523696092');
INSERT INTO `ysk_upgoods` VALUES('256','1','1','1523696221');
INSERT INTO `ysk_upgoods` VALUES('257','1','1','1523696271');
INSERT INTO `ysk_upgoods` VALUES('258','1','1','1523696343');
INSERT INTO `ysk_upgoods` VALUES('259','1','1','1523696374');
INSERT INTO `ysk_upgoods` VALUES('260','1','1','1523696409');
INSERT INTO `ysk_upgoods` VALUES('261','1','1','1523697334');
INSERT INTO `ysk_upgoods` VALUES('262','1','1','1524195965');
INSERT INTO `ysk_upgoods` VALUES('263','0','171','1524204208');
INSERT INTO `ysk_upgoods` VALUES('264','0','172','1524204245');
INSERT INTO `ysk_upgoods` VALUES('265','24','1','1524204574');
INSERT INTO `ysk_upgoods` VALUES('266','24','173','1524205395');
INSERT INTO `ysk_upgoods` VALUES('267','24','1','1524205408');
INSERT INTO `ysk_upgoods` VALUES('268','25','174','1524449398');
INSERT INTO `ysk_upgoods` VALUES('269','26','175','1524741955');
INSERT INTO `ysk_upgoods` VALUES('270','27','176','1529046933');
INSERT INTO `ysk_upgoods` VALUES('271','28','177','1529047274');
INSERT INTO `ysk_upgoods` VALUES('272','27','178','1529059391');
INSERT INTO `ysk_upgoods` VALUES('273','27','179','1529059631');
INSERT INTO `ysk_upgoods` VALUES('274','27','180','1529059814');
INSERT INTO `ysk_upgoods` VALUES('275','29','181','1529565644');
--
-- 表的结构ysk_upload
--
DROP TABLE IF EXISTS `ysk_upload`;
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

--
-- 转存表中的数据 ysk_upload

--
-- 表的结构ysk_user
--
DROP TABLE IF EXISTS `ysk_user`;
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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_user

INSERT INTO `ysk_user` VALUES('1','0','0','0','0','123','','','','','','','0','0','','0','0','','0','','','0','','5','0','toux-icon.png','','80.0000','1535299204','0','903.2000','0','','0','0','');
INSERT INTO `ysk_user` VALUES('2','1','0','0','13691944319','13691944319','张恒源','','4eec83a4a369cd999ec73754fbd02e6a','35f','f9f3ffc7a61310698e56a7cce3aaa898','35f','0','1535196892','112.97.55.204','1','1','l8is4spns8n00k9ll94dmejj30','0','','','1','-1-','5','4','toux-icon.png','123','80.0000','1535335233','1','0.0000','0','OuPD3S6SfTzSNSZyebe2jwcTcz4lAOd2bv','0','0','');
INSERT INTO `ysk_user` VALUES('3','2','1','0','18686860529','18686860529','吴博文','','7154ec3baa3a35154499cf6a42e4e059','3e8','a4a0f1dc8989bd3e88d97dc1f2c28049','3e8','0','1535199114','60.219.226.253','1','1','h1nl6gvk1d6d4qcq0tj5bi5hv1','0','','','2','-1-2-','5','0','toux-icon.png','','0.0000','1535333415','1','0.0000','0','AejAlhX0z05PUVZxfUuy2kwWXXb64zkhNW','0','0','');
INSERT INTO `ysk_user` VALUES('4','2','1','0','15118115078','15118115078','ceshi1','','ff9d9bc10765172581bb5a1915f2549c','21e','ff9d9bc10765172581bb5a1915f2549c','21e','0','1535199822','14.116.133.170','1','1','86sro1hodka4bjncji1luiris1','0','','','2','-1-2-','5','0','toux-icon.png','','0.0000','1','0','0.0000','0','kfgydyAwh2eOZb0vgxAheCfbxlcmSxxZ62','0','0','');
INSERT INTO `ysk_user` VALUES('5','2','1','0','13724338770','13724338770','王亚欣','','9acb30d7d5cf820aecfd9737d174ca20','471','402ab14ef019a8fda34bff2a9ebb6739','471','0','1535200363','117.136.40.221','1','1','anoqfv252mtr16nfrh5jq9kp15','0','','','2','-1-2-','5','4','toux-icon.png','','0.0000','1','0','0.0000','0','','0','0','');
INSERT INTO `ysk_user` VALUES('6','2','1','0','18680265265','18680265265','Karen杜','','2c9b9c8f067bc3477fb5882cb0356b44','097','0b9a2fb06f77881bc21efdb698b6e906','097','0','1535204898','120.229.64.93','1','1','vdcmtesf7sulh9s1hr0pg2hd52','0','','','2','-1-2-','5','4','toux-icon.png','','0.0000','1535305874','1','0.0000','0','QRXuiDyDWZkPCCONbmyvVUSD1RxXSCl3mx','0','0','');
INSERT INTO `ysk_user` VALUES('7','2','1','0','18620341739','18620341739','张莉','','365b631a639fca1340822cce85d721f8','fc8','55398dc5c3a95e79007eac407e15d101','fc8','0','1535207288','222.248.43.10','1','1','i61l5eqdui5im5frbrhmep59q7','0','','','2','-1-2-','5','4','toux-icon.png','','0.0000','1535299204','0','0.0000','0','','0','0','');
INSERT INTO `ysk_user` VALUES('8','2','1','0','13802283855','13802283855','joy','','27b29457f6b3646b40a5742e5d54db9a','9ea','a68342104de989ee980a77db50ac0f31','9ea','0','1535239734','14.116.137.166','1','1','3qav3vd7hiqpjuc5oj2v7o7m82','0','','','2','-1-2-','5','4','toux-icon.png','蒋颖','0.0000','1535299204','0','0.0000','0','zkBRDPXQ1uZ6xc3hkP0yNUAyRYbDglmyaj','0','0','');
INSERT INTO `ysk_user` VALUES('9','2','1','0','15999553014','15999553014','一岚','','47ce5f8cefb31c364b4fbaa2c548735e','396','47ce5f8cefb31c364b4fbaa2c548735e','396','0','1535249743','223.104.63.189','1','1','1fp6mpd6pst807nnaja2vti3d3','0','','','2','-1-2-','5','4','toux-icon.png','','0.0000','1535301520','1','0.0000','0','Zxg4lfxakQjWgUbCVzdkwgd6uhYZyPv0CD','0','0','');
INSERT INTO `ysk_user` VALUES('10','2','1','0','15017917030','15017917030','唐莉群','','b19c858a9221a3f17ec98e673ba0ff96','a90','3b9e3782544067a1d7957cf09fd500bb','a90','0','1535265548','223.104.63.198','1','1','ub5it4cej5tilhrdk3a2dd7id4','0','','','2','-1-2-','5','4','toux-icon.png','','0.0000','1535299204','0','0.0000','0','fmVdwxf6CwTgRaWPZWxXizT5eNu3ibmiWx','0','0','');
INSERT INTO `ysk_user` VALUES('11','2','1','0','15816855713','15816855713','叶珍','','462653b30b1a9977a9fc669de74f1fb5','79e','462653b30b1a9977a9fc669de74f1fb5','79e','0','1535265796','223.104.64.129','1','1','369esa4miss34c0ec6hqfmisl1','0','','','2','-1-2-','5','4','toux-icon.png','','0.0000','1535299204','0','0.0000','0','','0','0','');
INSERT INTO `ysk_user` VALUES('12','2','1','0','13480936761','13480936761','鞠凤瑜','','2f0351ce5b182a0a1114d2feefb17e60','cce','8f6c4cb78c6d927c24392b742cd34000','cce','0','1535266046','183.3.226.234','1','1','gbiltnt05hheecus6s4jp88eo7','0','','','2','-1-2-','5','4','toux-icon.png','','0.0000','1535299204','0','0.0000','0','','0','0','');
INSERT INTO `ysk_user` VALUES('13','2','1','0','13927461131','13927461131','王金峰','','3fdaa8709dae8fba3b20d75a61a53c20','3b2','aa2c9ce6a419ed43e48969409f97c921','3b2','0','1535267561','157.255.172.16','1','1','kssc2sspcm6tcbq3h0f01vubo5','0','','','2','-1-2-','5','4','toux-icon.png','','0.0000','1535325814','1','0.0000','0','RvX6OfDaggR3l1umfVOg4NP2jhCzgxBZWk','0','0','');
INSERT INTO `ysk_user` VALUES('14','2','1','0','13537690898','13537690898','陈惠娟','','8ce0b50a86578997b0ffd5205106d857','299','8ce0b50a86578997b0ffd5205106d857','299','0','1535335154','223.104.64.152','1','1','a8pesmk9u1o1vvtrplhgnvh5m2','0','','','2','-1-2-','5','4','toux-icon.png','','0.0000','1535335303','1','0.0000','0','','0','0','');
--
-- 表的结构ysk_user_action
--
DROP TABLE IF EXISTS `ysk_user_action`;
CREATE TABLE `ysk_user_action` (
  `ua_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(40) NOT NULL COMMENT 'frontend,backend',
  `user_id` int(11) NOT NULL,
  `uname` varchar(40) NOT NULL COMMENT '用户名',
  `add_time` varchar(40) NOT NULL COMMENT '加入时间',
  `info` varchar(255) NOT NULL COMMENT '行为描述',
  PRIMARY KEY (`ua_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=239 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户行为';

--
-- 转存表中的数据 ysk_user_action

INSERT INTO `ysk_user_action` VALUES('207','后台系统用户','1','admin','2018-06-17 18:09:56','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('208','后台系统用户','1','admin','2018-06-17 21:18:20','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('209','后台系统用户','1','admin','2018-06-19 09:51:33','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('210','后台系统用户','1','admin','2018-06-19 10:56:10','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('211','后台系统用户','1','admin','2018-06-19 16:52:35','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('212','后台系统用户','1','admin','2018-06-19 16:52:38','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('213','后台系统用户','1','admin','2018-06-20 16:04:45','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('214','后台系统用户','1','admin','2018-06-20 16:56:41','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('215','后台系统用户','1','admin','2018-06-20 17:46:56','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('216','后台系统用户','1','admin','2018-06-20 18:17:50','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('217','后台系统用户','1','admin','2018-06-20 19:05:45','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('218','后台系统用户','1','admin','2018-06-21 15:16:20','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('219','后台系统用户','1','admin','2018-06-21 16:21:08','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('220','后台系统用户','1','admin','2018-06-22 18:53:48','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('221','后台系统用户','1','admin','2018-06-22 18:53:56','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('222','后台系统用户','1','admin','2018-06-22 19:01:46','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('223','后台系统用户','1','admin','2018-06-22 19:37:44','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('224','后台系统用户','1','admin','2018-06-23 14:46:44','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('225','后台系统用户','1','admin','2018-06-25 09:59:30','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('226','后台系统用户','1','admin','2018-06-26 10:07:24','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('227','后台系统用户','1','admin','2018-06-26 18:03:01','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('228','后台系统用户','1','admin','2018-06-26 18:58:17','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('229','后台系统用户','1','admin','2018-07-06 14:44:26','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('230','后台系统用户','1','admin','2018-07-09 17:58:44','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('231','后台系统用户','1','admin','2018-07-10 13:08:28','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('232','后台系统用户','1','admin','2018-07-11 21:29:25','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('233','后台系统用户','1','admin','2018-08-23 09:16:14','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('234','后台系统用户','1','admin','2018-08-26 08:16:10','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('235','后台系统用户','1','admin','2018-08-26 09:18:38','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('236','后台系统用户','1','admin','2018-08-26 09:29:46','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('237','后台系统用户','1','admin','2018-08-26 11:09:46','登录了后台系统');
INSERT INTO `ysk_user_action` VALUES('238','后台系统用户','1','admin','2018-08-26 12:53:02','登录了后台系统');
--
-- 表的结构ysk_user_caimi
--
DROP TABLE IF EXISTS `ysk_user_caimi`;
CREATE TABLE `ysk_user_caimi` (
  `uid` int(11) unsigned NOT NULL COMMENT '采蜜表',
  `num` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `datestr` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 ysk_user_caimi

--
-- 表的结构ysk_user_copy
--
DROP TABLE IF EXISTS `ysk_user_copy`;
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

--
-- 转存表中的数据 ysk_user_copy

--
-- 表的结构ysk_user_dogeat
--
DROP TABLE IF EXISTS `ysk_user_dogeat`;
CREATE TABLE `ysk_user_dogeat` (
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(11) NOT NULL COMMENT '总种子数量',
  `create_time` int(11) NOT NULL,
  `datestr` varchar(11) NOT NULL DEFAULT '0.00' COMMENT '扣除手续费后的数量',
  PRIMARY KEY (`uid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_user_dogeat

--
-- 表的结构ysk_user_huafei
--
DROP TABLE IF EXISTS `ysk_user_huafei`;
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

--
-- 转存表中的数据 ysk_user_huafei

--
-- 表的结构ysk_user_level
--
DROP TABLE IF EXISTS `ysk_user_level`;
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

--
-- 转存表中的数据 ysk_user_level

--
-- 表的结构ysk_user_seed
--
DROP TABLE IF EXISTS `ysk_user_seed`;
CREATE TABLE `ysk_user_seed` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户种子',
  `zhongzi_num` decimal(11,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 ysk_user_seed

INSERT INTO `ysk_user_seed` VALUES('1','0.00');
--
-- 表的结构ysk_user_tool_month
--
DROP TABLE IF EXISTS `ysk_user_tool_month`;
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

--
-- 转存表中的数据 ysk_user_tool_month

--
-- 表的结构ysk_verify_list
--
DROP TABLE IF EXISTS `ysk_verify_list`;
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

--
-- 转存表中的数据 ysk_verify_list

INSERT INTO `ysk_verify_list` VALUES('43','3060','13728686350','多多','1','牛玉淑','430528198107135889','13728686350','/Uploads/image/shop/2018-04-24/5ade9bc779eae.jpg','/Uploads/image/shop/2018-04-24/5ade9bc784afc.jpg','','','2','1524538311','20180424');
INSERT INTO `ysk_verify_list` VALUES('42','1710','15170788825','定时','2','速度更','360731199106230088','15170788829','','','/Uploads/image/shop/2018-04-21/5adb33764df1d.png','/Uploads/image/shop/2018-04-21/5adb33764efb6.png','1','1524314998','20180421');
INSERT INTO `ysk_verify_list` VALUES('36','1710','15170788825','定时','1','是大法官','360731199106230055','15170788824','/Uploads/image/shop/2018-04-21/5adb2d5810d0f.png','/Uploads/image/shop/2018-04-21/5adb2d58121ff.jpg','','','2','1524313432','20180421');
INSERT INTO `ysk_verify_list` VALUES('41','1710','15170788825','定时','1','东方红','360731199106230077','15170788828','/Uploads/image/shop/2018-04-21/5adb335cca048.JPG','/Uploads/image/shop/2018-04-21/5adb335ccb11c.png','','','1','1524314972','20180421');
INSERT INTO `ysk_verify_list` VALUES('38','1710','15170788825','定时','2','法国','360731199106230088','15170788829','','','/Uploads/image/shop/2018-04-21/5adb2d9d10a7c.JPG','/Uploads/image/shop/2018-04-21/5adb2d9d11f20.jpg','2','1524313501','20180421');
INSERT INTO `ysk_verify_list` VALUES('39','1710','15170788825','定时','1','速度更','360731199106230055','15170788824','/Uploads/image/shop/2018-04-21/5adb2e865df94.png','/Uploads/image/shop/2018-04-21/5adb2e865ecb0.png','','','2','1524313734','20180421');
INSERT INTO `ysk_verify_list` VALUES('44','1715','13243824326','Heres','2','gsadhg','360731199106230055','15170788825','/Uploads/image/shop/2018-04-26/5ae1b696253b7.png','/Uploads/image/shop/2018-04-26/5ae1b6962b7fd.png','/Uploads/image/shop/2018-04-26/5ae1b6962d52b.png','/Uploads/image/shop/2018-04-26/5ae1b6962f3a0.png','1','1524741782','20180426');
INSERT INTO `ysk_verify_list` VALUES('45','5163','13574158038','lzc8899','1','廖仲常','430124196511058399','13574158038','/Uploads/image/shop/2018-05-29/5b0cdaa40b606.jpg','/Uploads/image/shop/2018-05-29/5b0cdaa40da75.jpg','','','0','1527569060','20180529');
INSERT INTO `ysk_verify_list` VALUES('46','5878','13684898397','陈钢山','1','陈钢山','360313196409170011','13684898397','/Uploads/image/shop/2018-05-29/5b0cf44d0c038.jpg','/Uploads/image/shop/2018-05-29/5b0cf44d19aeb.jpg','','','0','1527575629','20180529');
INSERT INTO `ysk_verify_list` VALUES('47','5747','18871487589','拼博','1','商银','420117198710176340','18871487589','/Uploads/image/shop/2018-05-29/5b0d1671b9472.jpg','/Uploads/image/shop/2018-05-29/5b0d1671ba92a.jpg','','','0','1527584369','20180529');
INSERT INTO `ysk_verify_list` VALUES('48','4184','13517375551','刘芳华','1','刘芳华','432322195503150879','13517375551','/Uploads/image/shop/2018-05-29/5b0d4a2413773.jpg','/Uploads/image/shop/2018-05-29/5b0d4a2418434.jpg','','','0','1527597604','20180529');
INSERT INTO `ysk_verify_list` VALUES('49','5874','15854096590','秀林','1','孔秀林','372901196510280654','15854096590','/Uploads/image/shop/2018-05-30/5b0d8ec297f16.jpg','/Uploads/image/shop/2018-05-30/5b0d8ec29912e.jpg','','','0','1527615170','20180530');
INSERT INTO `ysk_verify_list` VALUES('50','5892','18173121063','王朝公益基金','2','周顺华','432625196111269424','18173121063','','','/Uploads/image/shop/2018-05-30/5b0d959326955.jpg','/Uploads/image/shop/2018-05-30/5b0d959327d8d.jpg','0','1527616915','20180530');
INSERT INTO `ysk_verify_list` VALUES('51','4125','13977209588','ycj999','1','朱','412722199402133513','13478987503','/Uploads/image/shop/2018-06-15/5b234e7d928d5.jpg','/Uploads/image/shop/2018-06-15/5b234e7d92dc9.jpg','','','1','1529040509','20180615');
INSERT INTO `ysk_verify_list` VALUES('52','8537','18300693527','董雄飞','2','dongxongfei','411282199507142811','18300693527','','','/Uploads/image/shop/2018-06-15/5b235db3011ba.jpg','/Uploads/image/shop/2018-06-15/5b235db3015e2.jpg','0','1529044403','20180615');
INSERT INTO `ysk_verify_list` VALUES('53','4125','13977209588','ycj999','1','朱','412722199402133513','13478987503','/Uploads/image/shop/2018-06-15/5b2360358042d.jpg','/Uploads/image/shop/2018-06-15/5b236035806d4.jpg','','','1','1529045045','20180615');
INSERT INTO `ysk_verify_list` VALUES('54','8539','15824876380','魔女','1','0111','411522199601196322','17596528302','/Uploads/image/shop/2018-06-15/5b23625b0dab2.jpg','/Uploads/image/shop/2018-06-15/5b23625b0dc32.jpg','','','1','1529045595','20180615');
INSERT INTO `ysk_verify_list` VALUES('55','8553','17791517166','张杰','1','张杰','688888888888888888','17791517166','/Uploads/image/shop/2018-06-18/5b27bc87c8afb.jpg','/Uploads/image/shop/2018-06-18/5b27bc87c92a1.jpg','','','1','1529330823','20180618');
INSERT INTO `ysk_verify_list` VALUES('56','8545','13478987503','小猪','1','xiaozhu','412722199502133513','13478987503','/Uploads/image/shop/2018-06-21/5b2b04b991e71.jpg','/Uploads/image/shop/2018-06-21/5b2b04b9920c2.jpg','','','1','1529545913','20180621');
--
-- 表的结构ysk_wbao_detail
--
DROP TABLE IF EXISTS `ysk_wbao_detail`;
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
) ENGINE=MyISAM AUTO_INCREMENT=56970 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 ysk_wbao_detail

INSERT INTO `ysk_wbao_detail` VALUES('56612','0.0000','0.0000','0.0000','1531405842','8600','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56613','0.0000','0.0000','0.0000','1531405842','8600','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56614','0.0000','0.0000','0.0000','1531405896','8601','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56615','0.0000','0.0000','0.0000','1531405896','8601','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56616','0.0000','0.0000','0.0000','1531410234','8602','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56617','0.0000','0.0000','0.0000','1531410234','8602','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56618','0.0000','0.0000','0.0000','1531410277','8616','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56619','0.0000','0.0000','0.0000','1531410277','8616','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56620','0.0000','0.0000','0.0000','1531410444','8604','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56621','0.0000','0.0000','0.0000','1531410444','8604','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56622','0.0000','0.0000','0.0000','1531410623','8606','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56623','0.0000','0.0000','0.0000','1531410623','8606','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56624','0.0000','0.0000','0.0000','1531410661','8607','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56625','0.0000','0.0000','0.0000','1531410661','8607','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56626','0.0000','0.0000','0.0000','1531410708','8608','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56627','0.0000','0.0000','0.0000','1531410708','8608','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56628','0.0000','0.0000','0.0000','1531410752','8609','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56629','0.0000','0.0000','0.0000','1531410752','8609','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56630','0.0000','0.0000','0.0000','1531410802','8610','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56631','0.0000','0.0000','0.0000','1531410802','8610','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56632','0.0000','0.0000','0.0000','1531410840','8611','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56633','0.0000','0.0000','0.0000','1531410840','8611','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56634','0.0000','0.0000','0.0000','1531410894','8613','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56635','0.0000','0.0000','0.0000','1531410894','8613','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56636','0.0000','0.0000','0.0000','1531410971','8615','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56637','0.0000','0.0000','0.0000','1531410971','8615','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56638','0.0000','0.0000','0.0000','1531411063','8617','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56639','0.0000','0.0000','0.0000','1531411063','8617','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56640','0.0000','0.0000','0.0000','1531411119','8618','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56641','0.0000','0.0000','0.0000','1531411119','8618','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56642','0.0000','0.0000','0.0000','1531411207','8616','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56643','0.0000','0.0000','0.0000','1531411207','8616','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56644','0.0000','0.0000','0.0000','1531411503','8600','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56645','0.0000','0.0000','0.0000','1531411503','8600','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56646','0.0000','0.0000','0.0000','1531411732','8617','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56647','0.0000','0.0000','0.0000','1531411732','8617','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56648','0.0000','0.0000','0.0000','1531411778','8618','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56649','0.0000','0.0000','0.0000','1531411778','8618','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56650','0.0000','0.0000','0.0000','1531411827','8614','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56651','0.0000','0.0000','0.0000','1531411827','8614','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56652','0.0000','0.0000','0.0000','1531412095','8613','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56653','0.0000','0.0000','0.0000','1531412095','8613','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56654','0.0000','0.0000','0.0000','1531412135','8612','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56655','0.0000','0.0000','0.0000','1531412135','8612','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56656','0.0000','0.0000','0.0000','1531412160','8611','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56657','0.0000','0.0000','0.0000','1531412160','8611','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56658','0.0000','0.0000','0.0000','1531412173','8610','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56659','0.0000','0.0000','0.0000','1531412173','8610','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56660','0.0000','0.0000','0.0000','1531412189','8609','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56661','0.0000','0.0000','0.0000','1531412189','8609','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56662','0.0000','0.0000','0.0000','1531412201','8608','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56663','0.0000','0.0000','0.0000','1531412201','8608','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56664','0.0000','0.0000','0.0000','1531412212','8607','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56665','0.0000','0.0000','0.0000','1531412212','8607','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56666','0.0000','0.0000','0.0000','1531412221','8606','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56667','0.0000','0.0000','0.0000','1531412221','8606','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56668','0.0000','0.0000','0.0000','1531412230','8605','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56669','0.0000','0.0000','0.0000','1531412230','8605','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56670','0.0000','0.0000','0.0000','1531412240','8604','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56671','0.0000','0.0000','0.0000','1531412240','8604','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56672','0.0000','0.0000','0.0000','1531412248','8603','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56673','0.0000','0.0000','0.0000','1531412248','8603','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56674','0.0000','0.0000','0.0000','1531412268','8602','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56675','0.0000','0.0000','0.0000','1531412268','8602','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56676','0.0000','0.0000','0.0000','1531412301','8601','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56677','0.0000','0.0000','0.0000','1531412301','8601','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56678','0.0000','0.0000','0.0000','1531465962','8630','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56679','0.0000','0.0000','0.0000','1531465962','8630','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56680','0.0000','0.0000','0.0000','1531469336','8621','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56681','0.0000','0.0000','0.0000','1531469336','8621','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56682','0.0000','0.0000','0.0000','1531471085','8622','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56683','0.0000','0.0000','0.0000','1531471085','8622','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56684','0.0000','0.0000','0.0000','1531471115','8623','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56685','0.0000','0.0000','0.0000','1531471115','8623','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56686','0.0000','0.0000','0.0000','1531471506','8626','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56687','0.0000','0.0000','0.0000','1531471506','8626','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56688','0.0000','0.0000','0.0000','1531471541','8627','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56689','0.0000','0.0000','0.0000','1531471541','8627','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56690','0.0000','0.0000','0.0000','1531471572','8628','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56691','0.0000','0.0000','0.0000','1531471572','8628','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56692','0.0000','0.0000','0.0000','1531471620','8629','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56693','0.0000','0.0000','0.0000','1531471620','8629','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56694','0.0000','0.0000','0.0000','1531472397','8615','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56695','0.0000','0.0000','0.0000','1531472397','8615','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56696','0.0000','0.0000','0.0000','1531477817','8632','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56697','0.0000','0.0000','0.0000','1531477817','8632','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56698','0.0000','0.0000','0.0000','1531478424','8645','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56699','0.0000','0.0000','0.0000','1531478424','8645','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56700','0.0000','0.0000','0.0000','1531485458','8599','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56701','0.0000','0.0000','0.0000','1531485458','8599','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56702','0.0000','0.0000','0.0000','1531497935','8621','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56703','0.0000','0.0000','0.0000','1531497935','8621','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56704','0.0000','0.0000','0.0000','1531498316','8632','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56705','0.0000','0.0000','0.0000','1531498316','8632','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56706','0.0000','0.0000','0.0000','1531498387','8617','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56707','0.0000','0.0000','0.0000','1531498387','8617','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56708','0.0000','0.0000','0.0000','1531498766','8599','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56709','0.0000','0.0000','0.0000','1531498766','8599','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56710','0.0000','0.0000','0.0000','1531500511','8601','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56711','0.0000','0.0000','0.0000','1531500511','8601','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56712','0.0000','0.0000','0.0000','1531519185','8635','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56713','0.0000','0.0000','0.0000','1531519185','8635','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56714','0.0000','0.0000','0.0000','1531523187','8647','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56715','0.0000','0.0000','0.0000','1531523187','8647','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56716','0.0000','0.0000','0.0000','1531523490','8644','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56717','0.0000','0.0000','0.0000','1531523490','8644','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56718','0.0000','0.0000','0.0000','1531525170','8658','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56719','0.0000','0.0000','0.0000','1531525170','8658','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56720','0.0000','0.0000','0.0000','1531528550','8643','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56721','0.0000','0.0000','0.0000','1531528550','8643','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56722','0.0000','0.0000','0.0000','1531531960','8654','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56723','0.0000','0.0000','0.0000','1531531960','8654','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56724','0.0000','0.0000','0.0000','1531532872','8642','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56725','0.0000','0.0000','0.0000','1531532872','8642','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56726','0.0000','0.0000','0.0000','1531532942','8646','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56727','0.0000','0.0000','0.0000','1531532942','8646','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56728','0.0000','0.0000','0.0000','1531533314','8634','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56729','0.0000','0.0000','0.0000','1531533314','8634','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56730','0.0000','0.0000','0.0000','1531533547','8640','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56731','0.0000','0.0000','0.0000','1531533547','8640','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56732','0.0000','0.0000','0.0000','1531533614','8641','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56733','0.0000','0.0000','0.0000','1531533614','8641','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56734','0.0000','0.0000','0.0000','1531533686','8633','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56735','0.0000','0.0000','0.0000','1531533686','8633','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56736','0.0000','0.0000','0.0000','1531533975','8618','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56737','0.0000','0.0000','0.0000','1531533975','8618','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56738','0.0000','0.0000','0.0000','1531533976','8649','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56739','0.0000','0.0000','0.0000','1531533976','8649','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56740','0.0000','0.0000','0.0000','1531534657','8657','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56741','0.0000','0.0000','0.0000','1531534657','8657','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56742','0.0000','0.0000','0.0000','1531535659','8655','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56743','0.0000','0.0000','0.0000','1531535659','8655','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56744','0.0000','0.0000','0.0000','1531536562','8648','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56745','0.0000','0.0000','0.0000','1531536562','8648','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56746','0.0000','0.0000','0.0000','1531551095','8670','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56747','0.0000','0.0000','0.0000','1531551095','8670','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56748','0.0000','0.0000','0.0000','1531552053','8630','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56749','0.0000','0.0000','0.0000','1531552053','8630','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56750','0.0000','0.0000','0.0000','1531552184','8629','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56751','0.0000','0.0000','0.0000','1531552184','8629','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56752','0.0000','0.0000','0.0000','1531552454','8638','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56753','0.0000','0.0000','0.0000','1531552454','8638','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56754','0.0000','0.0000','0.0000','1531553072','8645','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56755','0.0000','0.0000','0.0000','1531553072','8645','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56756','0.0000','0.0000','0.0000','1531553540','8631','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56757','0.0000','0.0000','0.0000','1531553540','8631','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56758','0.0000','0.0000','0.0000','1531556043','8628','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56759','0.0000','0.0000','0.0000','1531556043','8628','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56760','0.0000','0.0000','0.0000','1531558238','8662','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56761','0.0000','0.0000','0.0000','1531558238','8662','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56762','0.0000','0.0000','0.0000','1531560494','8651','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56763','0.0000','0.0000','0.0000','1531560494','8651','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56764','0.0000','0.0000','0.0000','1531561322','8680','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56765','0.0000','0.0000','0.0000','1531561322','8680','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56766','0.0000','0.0000','0.0000','1531562407','8616','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56767','0.0000','0.0000','0.0000','1531562407','8616','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56768','0.0000','0.0000','0.0000','1531562448','8614','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56769','0.0000','0.0000','0.0000','1531562448','8614','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56770','0.0000','0.0000','0.0000','1531582324','8600','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56771','0.0000','0.0000','0.0000','1531582324','8600','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56772','0.0000','0.0000','0.0000','1531582340','8602','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56773','0.0000','0.0000','0.0000','1531582340','8602','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56774','0.0000','0.0000','0.0000','1531582350','8603','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56775','0.0000','0.0000','0.0000','1531582350','8603','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56776','0.0000','0.0000','0.0000','1531582688','8604','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56777','0.0000','0.0000','0.0000','1531582688','8604','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56778','0.0000','0.0000','0.0000','1531582699','8605','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56779','0.0000','0.0000','0.0000','1531582699','8605','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56780','0.0000','0.0000','0.0000','1531582709','8606','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56781','0.0000','0.0000','0.0000','1531582709','8606','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56782','0.0000','0.0000','0.0000','1531582719','8607','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56783','0.0000','0.0000','0.0000','1531582719','8607','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56784','0.0000','0.0000','0.0000','1531582731','8608','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56785','0.0000','0.0000','0.0000','1531582731','8608','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56786','0.0000','0.0000','0.0000','1531582741','8609','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56787','0.0000','0.0000','0.0000','1531582741','8609','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56788','0.0000','0.0000','0.0000','1531582751','8610','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56789','0.0000','0.0000','0.0000','1531582751','8610','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56790','0.0000','0.0000','0.0000','1531582760','8611','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56791','0.0000','0.0000','0.0000','1531582760','8611','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56792','0.0000','0.0000','0.0000','1531582771','8612','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56793','0.0000','0.0000','0.0000','1531582771','8612','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56794','0.0000','0.0000','0.0000','1531582781','8613','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56795','0.0000','0.0000','0.0000','1531582781','8613','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56796','0.0000','0.0000','0.0000','1531582868','8615','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56797','0.0000','0.0000','0.0000','1531582868','8615','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56798','0.0000','0.0000','0.0000','1531584242','8644','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56799','0.0000','0.0000','0.0000','1531584242','8644','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56800','0.0000','0.0000','0.0000','1531584496','8651','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56801','0.0000','0.0000','0.0000','1531584496','8651','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56802','0.0000','0.0000','0.0000','1531584652','8599','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56803','0.0000','0.0000','0.0000','1531584652','8599','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56804','0.0000','0.0000','0.0000','1531584743','8641','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56805','0.0000','0.0000','0.0000','1531584743','8641','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56806','0.0000','0.0000','0.0000','1531584778','8649','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56807','0.0000','0.0000','0.0000','1531584778','8649','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56808','0.0000','0.0000','0.0000','1531584783','8655','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56809','0.0000','0.0000','0.0000','1531584783','8655','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56810','0.0000','0.0000','0.0000','1531584831','8650','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56811','0.0000','0.0000','0.0000','1531584831','8650','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56812','0.0000','0.0000','0.0000','1531584878','8634','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56813','0.0000','0.0000','0.0000','1531584878','8634','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56814','0.0000','0.0000','0.0000','1531585644','8668','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56815','0.0000','0.0000','0.0000','1531585644','8668','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56816','0.0000','0.0000','0.0000','1531585916','8648','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56817','0.0000','0.0000','0.0000','1531585916','8648','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56818','0.0000','0.0000','0.0000','1531586160','8646','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56819','0.0000','0.0000','0.0000','1531586160','8646','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56820','0.0000','0.0000','0.0000','1531586243','8615','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56821','0.0000','0.0000','0.0000','1531586243','8615','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56822','0.0000','0.0000','0.0000','1531586262','8618','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56823','0.0000','0.0000','0.0000','1531586262','8618','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56824','0.0000','0.0000','0.0000','1531587324','8670','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56825','0.0000','0.0000','0.0000','1531587324','8670','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56826','0.0000','0.0000','0.0000','1531588306','8632','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56827','0.0000','0.0000','0.0000','1531588306','8632','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56828','0.0000','0.0000','0.0000','1531588999','8662','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56829','0.0000','0.0000','0.0000','1531588999','8662','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56830','0.0000','0.0000','0.0000','1531606151','8647','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56831','0.0000','0.0000','0.0000','1531606151','8647','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56832','0.0000','0.0000','0.0000','1531609984','8621','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56833','0.0000','0.0000','0.0000','1531609984','8621','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56834','0.0000','0.0000','0.0000','1531610100','8629','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56835','0.0000','0.0000','0.0000','1531610100','8629','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56836','0.0000','0.0000','0.0000','1531612517','8630','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56837','0.0000','0.0000','0.0000','1531612517','8630','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56838','0.0000','0.0000','0.0000','1531615070','8658','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56839','0.0000','0.0000','0.0000','1531615070','8658','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56840','0.0000','0.0000','0.0000','1531615236','8679','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56841','0.0000','0.0000','0.0000','1531615236','8679','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56842','0.0000','0.0000','0.0000','1531615343','8628','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56843','0.0000','0.0000','0.0000','1531615343','8628','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56844','0.0000','0.0000','0.0000','1531615609','8635','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56845','0.0000','0.0000','0.0000','1531615609','8635','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56846','0.0000','0.0000','0.0000','1531616543','8616','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56847','0.0000','0.0000','0.0000','1531616543','8616','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56848','0.0000','0.0000','0.0000','1531616556','8614','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56849','0.0000','0.0000','0.0000','1531616556','8614','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56850','0.0000','0.0000','0.0000','1531616565','8613','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56851','0.0000','0.0000','0.0000','1531616565','8613','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56852','0.0000','0.0000','0.0000','1531616574','8612','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56853','0.0000','0.0000','0.0000','1531616574','8612','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56854','0.0000','0.0000','0.0000','1531616582','8611','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56855','0.0000','0.0000','0.0000','1531616582','8611','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56856','0.0000','0.0000','0.0000','1531616592','8610','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56857','0.0000','0.0000','0.0000','1531616592','8610','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56858','0.0000','0.0000','0.0000','1531616607','8609','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56859','0.0000','0.0000','0.0000','1531616607','8609','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56860','0.0000','0.0000','0.0000','1531616625','8608','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56861','0.0000','0.0000','0.0000','1531616625','8608','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56862','0.0000','0.0000','0.0000','1531616636','8607','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56863','0.0000','0.0000','0.0000','1531616636','8607','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56864','0.0000','0.0000','0.0000','1531616645','8606','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56865','0.0000','0.0000','0.0000','1531616645','8606','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56866','0.0000','0.0000','0.0000','1531616653','8605','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56867','0.0000','0.0000','0.0000','1531616653','8605','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56868','0.0000','0.0000','0.0000','1531616662','8604','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56869','0.0000','0.0000','0.0000','1531616662','8604','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56870','0.0000','0.0000','0.0000','1531616672','8603','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56871','0.0000','0.0000','0.0000','1531616672','8603','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56872','0.0000','0.0000','0.0000','1531616680','8602','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56873','0.0000','0.0000','0.0000','1531616680','8602','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56874','0.0000','0.0000','0.0000','1531616703','8600','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56875','0.0000','0.0000','0.0000','1531616703','8600','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56876','0.0000','0.0000','0.0000','1531616722','8601','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56877','0.0000','0.0000','0.0000','1531616722','8601','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56878','0.0000','0.0000','0.0000','1531617942','8680','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56879','0.0000','0.0000','0.0000','1531617942','8680','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56880','0.0000','0.0000','0.0000','1531621654','8617','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56881','0.0000','0.0000','0.0000','1531621654','8617','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56882','0.0000','0.0000','0.0000','1531628093','8633','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56883','0.0000','0.0000','0.0000','1531628093','8633','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56884','0.0000','0.0000','0.0000','1531628410','8640','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56885','0.0000','0.0000','0.0000','1531628410','8640','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56886','0.0000','0.0000','0.0000','1531628524','8643','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56887','0.0000','0.0000','0.0000','1531628524','8643','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56888','0.0000','0.0000','0.0000','1531628700','8642','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56889','0.0000','0.0000','0.0000','1531628700','8642','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56890','0.0000','0.0000','0.0000','1531631834','8660','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56891','0.0000','0.0000','0.0000','1531631834','8660','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56892','0.0000','0.0000','0.0000','1531632016','8659','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56893','0.0000','0.0000','0.0000','1531632016','8659','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56894','0.0000','0.0000','0.0000','1531632886','8654','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56895','0.0000','0.0000','0.0000','1531632886','8654','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56896','0.0000','0.0000','0.0000','1531634163','8693','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56897','0.0000','0.0000','0.0000','1531634163','8693','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56898','0.0000','0.0000','0.0000','1531634290','8639','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56899','0.0000','0.0000','0.0000','1531634290','8639','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56900','0.0000','0.0000','0.0000','1531635621','8700','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56901','0.0000','0.0000','0.0000','1531635621','8700','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56902','0.0000','0.0000','0.0000','1531639767','8631','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56903','0.0000','0.0000','0.0000','1531639767','8631','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56904','0.0000','0.0000','0.0000','1531646766','8645','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56905','0.0000','0.0000','0.0000','1531646766','8645','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56906','0.0000','0.0000','0.0000','1531647302','8638','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56907','0.0000','0.0000','0.0000','1531647302','8638','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56908','0.0000','0.0000','0.0000','1531648483','8657','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56909','0.0000','0.0000','0.0000','1531648483','8657','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56910','0.0000','0.0000','0.0000','1531661837','8624','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56911','0.0000','0.0000','0.0000','1531661837','8624','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56912','0.0000','0.0000','0.0000','1531663747','8689','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56913','0.0000','0.0000','0.0000','1531663747','8689','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56914','0.0000','0.0000','0.0000','1535184484','8726','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56915','0.0000','0.0000','0.0000','1535184484','8726','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56916','0.0000','0.0000','0.0000','1535194348','8569','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56917','0.0000','0.0000','0.0000','1535194348','8569','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56918','0.0000','0.0000','0.0000','1535194493','8728','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56919','0.0000','0.0000','0.0000','1535194493','8728','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56920','0.0000','0.0000','0.0000','1535194598','8732','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56921','0.0000','0.0000','0.0000','1535194598','8732','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56922','0.0000','0.0000','0.0000','1535195568','8730','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56923','0.0000','0.0000','0.0000','1535195568','8730','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56924','0.0000','0.0000','0.0000','1535195626','8729','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56925','0.0000','0.0000','0.0000','1535195626','8729','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56926','0.0000','0.0000','0.0000','1535195636','8733','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56927','0.0000','0.0000','0.0000','1535195636','8733','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56928','0.0000','0.0000','0.0000','1535195766','8731','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56929','0.0000','0.0000','0.0000','1535195766','8731','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56930','0.0000','0.0000','0.0000','1535195846','8727','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56931','0.0000','0.0000','0.0000','1535195846','8727','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56932','0.0000','0.0000','0.0000','1535195882','8734','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56933','0.0000','0.0000','0.0000','1535195882','8734','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56934','0.0000','0.0000','0.0000','1535197132','2','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56935','0.0000','0.0000','0.0000','1535197132','2','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56936','0.0000','0.0000','0.0000','1535197484','2','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56937','0.0000','0.0000','0.0000','1535197484','2','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56938','0.0000','0.0000','0.0000','1535197598','2','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56939','0.0000','0.0000','0.0000','1535197598','2','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56940','0.0000','0.0000','0.0000','1535237862','2','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56941','0.0000','0.0000','0.0000','1535237862','2','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56942','0.0000','0.0000','0.0000','1535240019','8','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56943','0.0000','0.0000','0.0000','1535240019','8','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56944','0.0000','0.0000','0.0000','1535247035','3','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56945','0.0000','0.0000','0.0000','1535247035','3','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56946','0.0000','0.0000','0.0000','1535248878','6','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56947','0.0000','0.0000','0.0000','1535248878','6','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56948','0.0000','0.0000','0.0000','1535248889','7','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56949','0.0000','0.0000','0.0000','1535248889','7','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56950','0.0000','0.0000','0.0000','1535265892','11','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56951','0.0000','0.0000','0.0000','1535265892','11','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56952','0.0000','0.0000','0.0000','1535265999','10','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56953','0.0000','0.0000','0.0000','1535265999','10','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56954','0.0000','0.0000','0.0000','1535266174','12','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56955','0.0000','0.0000','0.0000','1535266174','12','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56956','0.0000','0.0000','0.0000','1535267696','13','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56957','0.0000','0.0000','0.0000','1535267696','13','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56958','0.0000','0.0000','0.0000','1535301520','9','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56959','0.0000','0.0000','0.0000','1535301520','9','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56960','0.0000','0.0000','0.0000','1535305874','6','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56961','0.0000','0.0000','0.0000','1535305874','6','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56962','0.0000','0.0000','0.0000','1535325814','13','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56963','0.0000','0.0000','0.0000','1535325814','13','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56964','0.0000','0.0000','0.0000','1535333415','3','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56965','0.0000','0.0000','0.0000','1535333415','3','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56966','0.0000','0.0000','0.0000','1535335233','2','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56967','0.0000','0.0000','0.0000','1535335233','2','0','4');
INSERT INTO `ysk_wbao_detail` VALUES('56968','0.0000','0.0000','0.0000','1535335303','14','0','3');
INSERT INTO `ysk_wbao_detail` VALUES('56969','0.0000','0.0000','0.0000','1535335303','14','0','4');
--
-- 表的结构ysk_wentype
--
DROP TABLE IF EXISTS `ysk_wentype`;
CREATE TABLE `ysk_wentype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `title` varchar(255) NOT NULL COMMENT '类型名称',
  `addtime` varchar(222) NOT NULL COMMENT '增加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 ysk_wentype

INSERT INTO `ysk_wentype` VALUES('3','帮助中心','1515470302');
INSERT INTO `ysk_wentype` VALUES('4','商城介绍','1515470316');
INSERT INTO `ysk_wentype` VALUES('5','介绍','1515470332');
INSERT INTO `ysk_wentype` VALUES('6','联系客服','1515850423');
--
-- 表的结构ysk_wenzhang
--
DROP TABLE IF EXISTS `ysk_wenzhang`;
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

--
-- 转存表中的数据 ysk_wenzhang

INSERT INTO `ysk_wenzhang` VALUES('4','介绍','&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:12px&quot;&gt;&lt;span style=&quot;background-color:rgb(0, 150, 234)&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:rgb(0, 150, 234); font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;LESO是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;LESO是一个全面开放的网络支付平台，跟支付宝和微信一样，不同的是，LESO是基于区块链技术开发的，能顺利实现点对点跨境转账，而且没有任何手续费。&lt;/p&gt;\r\n','2018-08-26 09:36:40','介绍','5','','');
INSERT INTO `ysk_wenzhang` VALUES('5','问题','&lt;div style=&quot;margin-right:4px&quot;&gt;&lt;span style=&quot;color:#0096ea; font-size:12px&quot;&gt;&lt;span style=&quot;background-color:#0096ea&quot;&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;color:#0096ea; font-size:16px&quot;&gt;&lt;strong&gt;&amp;nbsp;LESO是什么？&lt;/strong&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n&lt;p&gt;LESO是一个全面开放的网络支付平台，跟支付宝和微信一样，不同的是，LESO是基于区块链技术开发的，能顺利实现点对点跨境转账，而且没有任何手续费。&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin-right:4px&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n','2018-08-26 09:34:19','帮助中心','3','','');
INSERT INTO `ysk_wenzhang` VALUES('6','商城介绍','&lt;p&gt;&lt;strong style=&quot;color:rgb(255, 0, 0); font-size:14px&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&amp;nbsp;趋势大于优势！&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;h6&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;span style=&quot;color:#FF0000&quot;&gt;&amp;nbsp;LESO商城 ，为您生活添色彩！&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/h6&gt;\r\n','2018-08-26 09:33:27','商城介绍','4','','');
INSERT INTO `ysk_wenzhang` VALUES('13','联系客服','&lt;h1 style=&quot;text-align:justify&quot;&gt;温馨提示&lt;/h1&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;您要充值的信息要准确填写LESO账号；注册时的昵称；手机号码和充值金额。&lt;/p&gt;\n\n&lt;p style=&quot;text-align:justify&quot;&gt;有必要时请及时联系客服专员。&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;/Uploads/image/goods_description/2018-01-22/5a6563438f695.jpeg&quot; style=&quot;height:164px; width:162px&quot; /&gt;&lt;/p&gt;\n','2018-01-22 12:14:20','联系客服','6','','');
--
-- 表的结构ysk_wetrans
--
DROP TABLE IF EXISTS `ysk_wetrans`;
CREATE TABLE `ysk_wetrans` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_id` int(10) NOT NULL COMMENT '支付的会员',
  `get_id` int(10) NOT NULL COMMENT '收到转账用户id',
  `get_nums` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '转账总金额',
  `get_time` char(30) NOT NULL DEFAULT '0' COMMENT '转账时间',
  `get_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '转账币种',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 ysk_wetrans

