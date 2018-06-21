/*
Navicat MySQL Data Transfer

Source Server         : 103.56.17.135
Source Server Version : 50553
Source Host           : 103.56.17.135:3306
Source Database       : cp

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-06-21 10:49:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cp_activity`
-- ----------------------------
DROP TABLE IF EXISTS `cp_activity`;
CREATE TABLE `cp_activity` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_activity
-- ----------------------------
INSERT INTO `cp_activity` VALUES ('1', '17', '0', '推荐会员得佣金', '', '/uploadfile/2018/0614/20180614073854886.png', '', '所有会员', '0', '/index.php?m=content&c=index&a=show&catid=17&id=1', '1', '99', '1', '0', 'any', '1528706015', '1528985469', '推荐会员得佣金');
INSERT INTO `cp_activity` VALUES ('2', '17', '0', '银行存款充值有优惠', '', '/uploadfile/2018/0614/20180614073908598.png', '', '所有会员', '0', '/index.php?m=content&c=index&a=show&catid=17&id=2', '0', '99', '1', '0', 'any', '1528708294', '1528985595', '银行卡充值有优惠');
INSERT INTO `cp_activity` VALUES ('3', '17', '0', '签到送彩金', '', '/uploadfile/2018/0614/20180614073918770.png', '', '所有会员', '0', '/index.php?m=content&c=index&a=show&catid=17&id=3', '0', '99', '1', '0', 'admin', '1528985603', '1528985683', '签到送彩金');

-- ----------------------------
-- Table structure for `cp_activity_data`
-- ----------------------------
DROP TABLE IF EXISTS `cp_activity_data`;
CREATE TABLE `cp_activity_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_activity_data
-- ----------------------------
INSERT INTO `cp_activity_data` VALUES ('1', '会员推荐会员注册购彩，按推荐的会员的流水返0.2%给推荐人。', '0', '0', '', '0', '');
INSERT INTO `cp_activity_data` VALUES ('2', '会员充值选择银行卡转帐可享有1%的优惠。', '0', '0', '', '0', '');
INSERT INTO `cp_activity_data` VALUES ('3', '会员每天签到送相应的彩金，签越多送越多！', '0', '0', '', '0', '');

-- ----------------------------
-- Table structure for `cp_admin`
-- ----------------------------
DROP TABLE IF EXISTS `cp_admin`;
CREATE TABLE `cp_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `card` varchar(255) NOT NULL,
  `lang` varchar(6) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_admin
-- ----------------------------
INSERT INTO `cp_admin` VALUES ('1', 'admin', 'b4f07670fb295c1eea8ec8ffb020f00a', '1', 'J722pP', '61.148.243.34', '1529069431', 'any@qqq.com', '', '', '');

-- ----------------------------
-- Table structure for `cp_admin_panel`
-- ----------------------------
DROP TABLE IF EXISTS `cp_admin_panel`;
CREATE TABLE `cp_admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `datetime` int(10) unsigned DEFAULT '0',
  UNIQUE KEY `userid` (`menuid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_admin_panel
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `cp_admin_role`;
CREATE TABLE `cp_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_admin_role
-- ----------------------------
INSERT INTO `cp_admin_role` VALUES ('1', '超级管理员', '超级管理员', '0', '0');
INSERT INTO `cp_admin_role` VALUES ('2', '站点管理员', '站点管理员', '0', '0');
INSERT INTO `cp_admin_role` VALUES ('3', '运营总监', '运营总监', '1', '0');
INSERT INTO `cp_admin_role` VALUES ('4', '总编', '总编', '5', '0');
INSERT INTO `cp_admin_role` VALUES ('5', '编辑', '编辑', '1', '0');
INSERT INTO `cp_admin_role` VALUES ('7', '发布人员', '发布人员', '0', '0');

-- ----------------------------
-- Table structure for `cp_admin_role_priv`
-- ----------------------------
DROP TABLE IF EXISTS `cp_admin_role_priv`;
CREATE TABLE `cp_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(30) NOT NULL DEFAULT '',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `roleid` (`roleid`,`m`,`c`,`a`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_admin_role_priv
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_announce`
-- ----------------------------
DROP TABLE IF EXISTS `cp_announce`;
CREATE TABLE `cp_announce` (
  `aid` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `content` text NOT NULL,
  `starttime` date NOT NULL DEFAULT '0000-00-00',
  `endtime` date NOT NULL DEFAULT '0000-00-00',
  `username` varchar(40) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `style` char(15) NOT NULL,
  `show_template` char(30) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `siteid` (`siteid`,`passed`,`endtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_announce
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `cp_attachment`;
CREATE TABLE `cp_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_attachment
-- ----------------------------
INSERT INTO `cp_attachment` VALUES ('4', 'content', '15', '15135734747130.png', '2018/0607/20180607111113714.png', '179690', 'png', '1', '0', '0', '1', '1528341072', '127.0.0.1', '1', '8087f2320cdfa146b5832e56dd51e45d', '1');
INSERT INTO `cp_attachment` VALUES ('5', 'content', '15', '15135735158740.png', '2018/0607/20180607111121702.png', '53660', 'png', '1', '0', '0', '1', '1528341081', '127.0.0.1', '1', '13d2bbe2531339f3624fb588a8d7f380', '1');
INSERT INTO `cp_attachment` VALUES ('3', 'content', '7', 'login-href.jpg', '2018/0606/20180606052259107.jpg', '12467', 'jpg', '1', '0', '0', '1', '1528276979', '127.0.0.1', '1', 'ac2ccfabca47a10ac08f046f36b56eb1', '1');
INSERT INTO `cp_attachment` VALUES ('6', 'content', '15', '15176387974470.png', '2018/0607/20180607111129229.png', '101454', 'png', '1', '0', '0', '1', '1528341089', '127.0.0.1', '1', 'c400647909411f57592ac5ea613b8674', '1');
INSERT INTO `cp_attachment` VALUES ('7', 'content', '15', '15216130341030.png', '2018/0607/20180607111136451.png', '737851', 'png', '1', '0', '0', '1', '1528341096', '127.0.0.1', '1', 'f4072ce7493175c7fd1fd46e67cd9b4d', '1');
INSERT INTO `cp_attachment` VALUES ('8', 'content', '19', '14964261246210.png', '2018/0611/20180611055909249.png', '6760', 'png', '1', '0', '0', '1', '1528711149', '127.0.0.1', '1', '7b0e64354594c993fba20f613f45d144', '1');
INSERT INTO `cp_attachment` VALUES ('9', 'content', '20', 'wrap_bg.jpg', '2018/0611/20180611064310508.jpg', '201779', 'jpg', '1', '0', '0', '1', '1528713790', '127.0.0.1', '1', '16af33cc9866c2d9cb7a5083ec667ee2', '1');
INSERT INTO `cp_attachment` VALUES ('10', 'content', '0', '20180613072258249.jpg', '2018/0613/20180613072258249.jpg', '48511', 'jpg', '1', '0', '0', '0', '1528888977', '114.243.112.4', '1', '21a539851315f7d56269b520f73e669a', '1');
INSERT INTO `cp_attachment` VALUES ('11', 'content', '0', '20180613072259384.jpg', '2018/0613/20180613072259384.jpg', '173209', 'jpg', '1', '0', '0', '0', '1528888977', '114.243.112.4', '1', '1330de06f43d8d8d8eadd92fd8474da7', '1');
INSERT INTO `cp_attachment` VALUES ('12', 'content', '0', '20180613072259371.jpg', '2018/0613/20180613072259371.jpg', '52727', 'jpg', '1', '0', '0', '0', '1528888977', '114.243.112.4', '1', '25a5dff991a37c6f8285cdda492256d9', '1');
INSERT INTO `cp_attachment` VALUES ('13', 'content', '23', '1528946351(1).jpg', '2018/0614/20180614111930888.jpg', '9653', 'jpg', '1', '0', '0', '1', '1528946370', '127.0.0.1', '1', '3b9b2115601a5234f1e5148031ff96fc', '1');
INSERT INTO `cp_attachment` VALUES ('14', 'content', '23', '1528946393(1).jpg', '2018/0614/20180614112011945.jpg', '2354', 'jpg', '1', '0', '0', '1', '1528946411', '127.0.0.1', '1', '2c51c844c6049155db8307272ae79cba', '1');
INSERT INTO `cp_attachment` VALUES ('15', 'content', '23', '1528946431(1).jpg', '2018/0614/20180614112047371.jpg', '2390', 'jpg', '1', '0', '0', '1', '1528946447', '127.0.0.1', '1', '9c192007defca8ca1f2e4d16895c0cda', '1');
INSERT INTO `cp_attachment` VALUES ('16', 'content', '23', '1528946468(1).jpg', '2018/0614/20180614112123386.jpg', '2555', 'jpg', '1', '0', '0', '1', '1528946481', '127.0.0.1', '1', 'ede1061327b58342650b1b95d38e1d5d', '1');
INSERT INTO `cp_attachment` VALUES ('17', 'content', '23', '1528946494(1).jpg', '2018/0614/20180614112145613.jpg', '3185', 'jpg', '1', '0', '0', '1', '1528946505', '127.0.0.1', '1', '9b2541c918633f36a622a8872e9a8552', '1');
INSERT INTO `cp_attachment` VALUES ('18', 'content', '0', '20180614093034991.jpg', '2018/0614/20180614093034991.jpg', '20433', 'jpg', '1', '0', '0', '0', '1528983034', '114.243.112.4', '1', '0192fff69d459954d9c62535d2355a78', '1');
INSERT INTO `cp_attachment` VALUES ('19', 'content', '0', '20180614093035494.jpg', '2018/0614/20180614093035494.jpg', '20433', 'jpg', '1', '0', '0', '0', '1528983034', '114.243.112.4', '1', 'e97de1cd611b78c3a39ca6720c335919', '1');
INSERT INTO `cp_attachment` VALUES ('20', 'content', '0', '20180614094502116.png', '2018/0614/20180614094502116.png', '183419', 'png', '1', '0', '0', '0', '1528983901', '114.243.112.4', '1', '77207ca0612c6a0316acd739fb5acd35', '1');
INSERT INTO `cp_attachment` VALUES ('21', 'content', '0', '20180614094503414.png', '2018/0614/20180614094503414.png', '183419', 'png', '1', '0', '0', '0', '1528983901', '114.243.112.4', '1', 'f62289818ea92b0d25328a2fd73c2eda', '1');
INSERT INTO `cp_attachment` VALUES ('22', 'content', '0', '20180614094508769.png', '2018/0614/20180614094508769.png', '211552', 'png', '1', '0', '0', '0', '1528983901', '114.243.112.4', '1', '8110933495a315ef5efa5dfa30eb811b', '1');
INSERT INTO `cp_attachment` VALUES ('23', 'content', '0', '20180614094511710.png', '2018/0614/20180614094511710.png', '211552', 'png', '1', '0', '0', '0', '1528983901', '114.243.112.4', '1', '56b4fb0e3d27c50d4f1d077cf6597406', '1');
INSERT INTO `cp_attachment` VALUES ('24', 'content', '0', '20180614094512249.png', '2018/0614/20180614094512249.png', '188205', 'png', '1', '0', '0', '0', '1528983901', '114.243.112.4', '1', 'ce4a42f5317d2f3921a9c58f2b5bd890', '1');
INSERT INTO `cp_attachment` VALUES ('25', 'content', '0', '20180614094513455.png', '2018/0614/20180614094513455.png', '188205', 'png', '1', '0', '0', '0', '1528983901', '114.243.112.4', '1', '278717427ff3a1133145b806b4a59718', '1');
INSERT INTO `cp_attachment` VALUES ('26', 'content', '0', '20180614094557497.png', '2018/0614/20180614094557497.png', '306104', 'png', '1', '0', '0', '0', '1528983956', '114.243.112.4', '1', '193c3251f2ee59990a36b17883dc62ca', '1');
INSERT INTO `cp_attachment` VALUES ('27', 'content', '0', '20180614094558242.png', '2018/0614/20180614094558242.png', '314345', 'png', '1', '0', '0', '0', '1528983956', '114.243.112.4', '1', '7e0dc9b3f383bac4df341360eb09f758', '1');
INSERT INTO `cp_attachment` VALUES ('28', 'content', '0', '20180614095128803.jpg', '2018/0614/20180614095128803.jpg', '404655', 'jpg', '1', '0', '0', '0', '1528984286', '114.243.112.4', '1', '930fc5be69827063f9c91947560c4696', '1');
INSERT INTO `cp_attachment` VALUES ('29', 'content', '0', '20180614095129285.jpg', '2018/0614/20180614095129285.jpg', '188473', 'jpg', '1', '0', '0', '0', '1528984286', '114.243.112.4', '1', '1acbde81dee4b3f6d4e89081482c39f7', '1');
INSERT INTO `cp_attachment` VALUES ('30', 'content', '0', '20180614095129517.jpg', '2018/0614/20180614095129517.jpg', '108880', 'jpg', '1', '0', '0', '0', '1528984286', '114.243.112.4', '1', '377ed3e8857f189b834faa1612c45b16', '1');
INSERT INTO `cp_attachment` VALUES ('31', 'content', '0', '20180614095130960.jpg', '2018/0614/20180614095130960.jpg', '106646', 'jpg', '1', '0', '0', '0', '1528984286', '114.243.112.4', '1', 'b685b3afba8cf6a44133d34c7af6f2f7', '1');
INSERT INTO `cp_attachment` VALUES ('32', 'content', '0', '20180614095213990.jpg', '2018/0614/20180614095213990.jpg', '80341', 'jpg', '1', '0', '0', '0', '1528984332', '114.243.112.4', '1', 'e050b16721b003deb4b102885cc6096f', '1');
INSERT INTO `cp_attachment` VALUES ('33', 'content', '0', '手机购彩.png', '2018/0614/20180614103811884.png', '734827', 'png', '1', '0', '0', '1', '1528987090', '114.243.112.4', '1', 'c3f5d4d7fe52c88ac4d9b0dedd3edf29', '1');
INSERT INTO `cp_attachment` VALUES ('34', 'content', '30', '20180614103811884.png', '2018/0615/20180615041956470.png', '761564', 'png', '1', '0', '0', '1', '1529050795', '114.243.112.4', '1', '3ec1ec9c87d78d453f8bde91ce2f458b', '1');
INSERT INTO `cp_attachment` VALUES ('35', 'content', '28', '11选五.png', '2018/0615/20180615043541650.png', '23632', 'png', '1', '0', '0', '1', '1529051740', '114.243.112.4', '1', 'e9f19e7e9d91951754859dfb86cd127d', '1');
INSERT INTO `cp_attachment` VALUES ('36', 'content', '28', '115.png', '2018/0615/20180615044028641.png', '6119', 'png', '1', '0', '0', '1', '1529052027', '114.243.112.4', '1', '6b18661b26b4f659f7206c1e46071bf3', '1');
INSERT INTO `cp_attachment` VALUES ('37', 'content', '0', '20180615045048829.jpg', '2018/0615/20180615045048829.jpg', '96456', 'jpg', '1', '0', '0', '0', '1529052647', '114.243.112.4', '1', '125a2c3461185e8804d0ed8751a7183f', '1');
INSERT INTO `cp_attachment` VALUES ('38', 'content', '0', '20180615045049473.jpg', '2018/0615/20180615045049473.jpg', '318662', 'jpg', '1', '0', '0', '0', '1529052647', '114.243.112.4', '1', '24a76ccf509bbed0b59b5cff60bb8913', '1');
INSERT INTO `cp_attachment` VALUES ('39', 'content', '20', '前背景.png', '2018/0615/20180615054028425.png', '576896', 'png', '1', '0', '0', '1', '1529055627', '114.243.112.4', '1', '1b2b2d1d94e2f6b426e48a3e45c91a2a', '1');
INSERT INTO `cp_attachment` VALUES ('40', 'content', '20', '前背景1.png', '2018/0615/20180615055147535.png', '1084492', 'png', '1', '0', '0', '1', '1529056306', '114.243.112.4', '1', 'a5122230a158d6ab38957b3e12b831df', '1');
INSERT INTO `cp_attachment` VALUES ('41', 'content', '23', '认证1.png', '2018/0615/20180615065914676.png', '19903', 'png', '1', '0', '0', '1', '1529060353', '114.243.112.4', '1', '99e780d952b85a531f0d8d680aabc831', '1');
INSERT INTO `cp_attachment` VALUES ('42', 'content', '23', '认证2.png', '2018/0615/20180615065916669.png', '39254', 'png', '1', '0', '0', '1', '1529060355', '114.243.112.4', '1', '0e8a5b6ade0007f62653edffc623f842', '1');
INSERT INTO `cp_attachment` VALUES ('43', 'content', '23', '认证3.png', '2018/0615/20180615065918891.png', '24853', 'png', '1', '0', '0', '1', '1529060357', '114.243.112.4', '1', '93e8056b6002c27916c0b89437da4f6b', '1');
INSERT INTO `cp_attachment` VALUES ('44', 'content', '23', '认证4.png', '2018/0615/20180615065921141.png', '27775', 'png', '1', '0', '0', '1', '1529060360', '114.243.112.4', '1', '2e4cce0ac553034c200639c4e139e6bc', '1');
INSERT INTO `cp_attachment` VALUES ('45', 'content', '23', '认证5.png', '2018/0615/20180615065923973.png', '14151', 'png', '1', '0', '0', '1', '1529060362', '114.243.112.4', '1', '153291597506a18b0c9a1d341c78df62', '1');
INSERT INTO `cp_attachment` VALUES ('46', 'content', '23', '认证1.png', '2018/0615/20180615071311491.png', '20621', 'png', '1', '0', '0', '1', '1529061190', '114.243.112.4', '1', 'b134160005520aada2add23687e3bdce', '1');
INSERT INTO `cp_attachment` VALUES ('47', 'content', '23', '认证2.png', '2018/0615/20180615071315788.png', '35384', 'png', '1', '0', '0', '1', '1529061194', '114.243.112.4', '1', '42d6bd1c780c3faa667d4ec76b2e161f', '1');
INSERT INTO `cp_attachment` VALUES ('48', 'content', '23', '认证3.png', '2018/0615/20180615071317902.png', '21236', 'png', '1', '0', '0', '1', '1529061196', '114.243.112.4', '1', '893ad01d797f490e5f4d0f1d7fc7da10', '1');
INSERT INTO `cp_attachment` VALUES ('49', 'content', '23', '认证4.png', '2018/0615/20180615071320290.png', '13871', 'png', '1', '0', '0', '1', '1529061198', '114.243.112.4', '1', 'cbe2cc55535b09f94bfb9b88a43ebe4b', '1');
INSERT INTO `cp_attachment` VALUES ('50', 'content', '23', '认证5.png', '2018/0615/20180615071322725.png', '28425', 'png', '1', '0', '0', '1', '1529061201', '114.243.112.4', '1', '77b1b7555617a640f9aab3d0b6d97779', '1');
INSERT INTO `cp_attachment` VALUES ('51', 'content', '23', '认证1.png', '2018/0615/20180615072033106.png', '15990', 'png', '1', '0', '0', '1', '1529061632', '114.243.112.4', '1', '576db815aa048bff232c9f68ed5f140b', '1');
INSERT INTO `cp_attachment` VALUES ('52', 'content', '23', '认证2.png', '2018/0615/20180615072037329.png', '24360', 'png', '1', '0', '0', '1', '1529061636', '114.243.112.4', '1', '142d62625b139feb1e8221324f6a20f0', '1');
INSERT INTO `cp_attachment` VALUES ('53', 'content', '23', '认证3.png', '2018/0615/20180615072039457.png', '15696', 'png', '1', '0', '0', '1', '1529061638', '114.243.112.4', '1', '6d77a950eb21f7cfffbd88259d64a031', '1');
INSERT INTO `cp_attachment` VALUES ('54', 'content', '23', '认证4.png', '2018/0615/20180615072042951.png', '11075', 'png', '1', '0', '0', '1', '1529061640', '114.243.112.4', '1', 'ebd66b4545daab7a278a7a40bba1ca0d', '1');
INSERT INTO `cp_attachment` VALUES ('55', 'content', '23', '认证5.png', '2018/0615/20180615072044197.png', '17563', 'png', '1', '0', '0', '1', '1529061643', '114.243.112.4', '1', '8186c30262713b35632ecf84b5f3ff35', '1');

-- ----------------------------
-- Table structure for `cp_attachment_index`
-- ----------------------------
DROP TABLE IF EXISTS `cp_attachment_index`;
CREATE TABLE `cp_attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_attachment_index
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_badword`
-- ----------------------------
DROP TABLE IF EXISTS `cp_badword`;
CREATE TABLE `cp_badword` (
  `badid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL DEFAULT '1',
  `replaceword` char(20) NOT NULL DEFAULT '0',
  `lastusetime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`badid`),
  UNIQUE KEY `badword` (`badword`),
  KEY `usetimes` (`replaceword`,`listorder`),
  KEY `hits` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_badword
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_block`
-- ----------------------------
DROP TABLE IF EXISTS `cp_block`;
CREATE TABLE `cp_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `name` char(50) DEFAULT NULL,
  `pos` char(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `data` text,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`),
  KEY `type` (`type`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_block
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_block_history`
-- ----------------------------
DROP TABLE IF EXISTS `cp_block_history`;
CREATE TABLE `cp_block_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blockid` int(10) unsigned DEFAULT '0',
  `data` text,
  `creat_at` int(10) unsigned DEFAULT '0',
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_block_history
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_block_priv`
-- ----------------------------
DROP TABLE IF EXISTS `cp_block_priv`;
CREATE TABLE `cp_block_priv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `siteid` smallint(5) unsigned DEFAULT '0',
  `blockid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blockid` (`blockid`),
  KEY `roleid` (`roleid`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_block_priv
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_cache`
-- ----------------------------
DROP TABLE IF EXISTS `cp_cache`;
CREATE TABLE `cp_cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`filename`,`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_cache
-- ----------------------------
INSERT INTO `cp_cache` VALUES ('category_content.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  8 => \'1\',\n  27 => \'1\',\n  26 => \'1\',\n  18 => \'1\',\n  17 => \'1\',\n  7 => \'1\',\n  10 => \'1\',\n  11 => \'1\',\n  15 => \'1\',\n  16 => \'1\',\n  19 => \'1\',\n  20 => \'1\',\n  21 => \'1\',\n  22 => \'1\',\n  23 => \'1\',\n  24 => \'1\',\n  25 => \'1\',\n  28 => \'1\',\n  29 => \'1\',\n  30 => \'1\',\n  31 => \'1\',\n);\n?>');
INSERT INTO `cp_cache` VALUES ('category_content_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  8 => \n  array (\n    \'catid\' => \'8\',\n    \'siteid\' => \'1\',\n    \'type\' => \'2\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'\',\n    \'catname\' => \'购彩大厅\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'\',\n    \'url\' => \'http://ag.tt17168.com:81/Member/Login/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'0\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => NULL,\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => NULL,\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  26 => \n  array (\n    \'catid\' => \'26\',\n    \'siteid\' => \'1\',\n    \'type\' => \'2\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'\',\n    \'catname\' => \'免费试玩URL\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'\',\n    \'url\' => \'http://ag.tt17168.com:81/Member/Login/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'0\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => NULL,\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => NULL,\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  27 => \n  array (\n    \'catid\' => \'27\',\n    \'siteid\' => \'1\',\n    \'type\' => \'2\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'\',\n    \'catname\' => \'加入代理URL\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'\',\n    \'url\' => \'http://ag.tt17168.com:81/Member/Login/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'0\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => NULL,\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => NULL,\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  18 => \n  array (\n    \'catid\' => \'18\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'18\',\n    \'catname\' => \'手机购彩\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'phone\',\n    \'url\' => \'/index.php?m=content&c=index&a=lists&catid=18\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"ishtml\":\"0\",\"template_list\":\"cp\",\"page_template\":\"page_phone\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'1\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'shoujigoucai\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  17 => \n  array (\n    \'catid\' => \'17\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'13\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'17\',\n    \'catname\' => \'优惠活动\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'huodong\',\n    \'url\' => \'/index.php?m=content&c=index&a=lists&catid=17\',\n    \'items\' => \'3\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"list_activity\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'3\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'youhuihuodong\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  7 => \n  array (\n    \'catid\' => \'7\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'7\',\n    \'catname\' => \'二维码\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'xitongshezhi/\',\n    \'catdir\' => \'erweima\',\n    \'url\' => \'/index.php?m=content&c=index&a=lists&catid=7\',\n    \'items\' => \'2\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'7\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'erweima\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  10 => \n  array (\n    \'catid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'10,26,27,7,11,15,19,20,23,24,29,30\',\n    \'catname\' => \'系统设置\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'xitongshezhi\',\n    \'url\' => \'/index.php?m=content&c=index&a=lists&catid=10\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"ishtml\":\"0\",\"template_list\":\"cp\",\"page_template\":\"\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'10\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xitongshezhi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  11 => \n  array (\n    \'catid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'11\',\n    \'catname\' => \'首页顶部滚动内容\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'xitongshezhi/\',\n    \'catdir\' => \'shouyedingbugundongneirong\',\n    \'url\' => \'/index.php?m=content&c=index&a=lists&catid=11\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'11\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'shouyedingbugundongneirong\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  15 => \n  array (\n    \'catid\' => \'15\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'15\',\n    \'catname\' => \'首页轮播图\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'xitongshezhi/\',\n    \'catdir\' => \'lunbotu\',\n    \'url\' => \'/index.php?m=content&c=index&a=lists&catid=15\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'15\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'shouyelunbotu\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  16 => \n  array (\n    \'catid\' => \'16\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'16\',\n    \'catname\' => \'新闻\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'xinwen\',\n    \'url\' => \'/index.php?m=content&c=index&a=lists&catid=16\',\n    \'items\' => \'16\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'16\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xinwen\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  19 => \n  array (\n    \'catid\' => \'19\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'19\',\n    \'catname\' => \'首页LOGO\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'xitongshezhi/\',\n    \'catdir\' => \'logo\',\n    \'url\' => \'/index.php?m=content&c=index&a=lists&catid=19\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'19\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'shouyelogo\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  20 => \n  array (\n    \'catid\' => \'20\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'20\',\n    \'catname\' => \'首页背景图\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'xitongshezhi/\',\n    \'catdir\' => \'background\',\n    \'url\' => \'/index.php?m=content&c=index&a=lists&catid=20\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'20\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'shouyebeijingtu\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  21 => \n  array (\n    \'catid\' => \'21\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'21\',\n    \'catname\' => \'帮助中心\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'help\',\n    \'url\' => \'/help/\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"\",\"show_template\":\"show_help\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}\',\n    \'listorder\' => \'21\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'1\',\n    \'letter\' => \'bangzhuzhongxin\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'1\',\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => \'1\',\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'11\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  22 => \n  array (\n    \'catid\' => \'22\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'22\',\n    \'catname\' => \'网站公告\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'wzgg\',\n    \'url\' => \'/index.php?m=content&c=index&a=lists&catid=22\',\n    \'items\' => \'4\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"list_activity\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'22\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'wangzhangonggao\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  23 => \n  array (\n    \'catid\' => \'23\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'12\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'23\',\n    \'catname\' => \'底部认证图片\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'xitongshezhi/\',\n    \'catdir\' => \'dbrztp\',\n    \'url\' => \'/index.php?m=content&c=index&a=lists&catid=23\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'23\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'diburenzhengtupian\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  24 => \n  array (\n    \'catid\' => \'24\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'24\',\n    \'catname\' => \'底部友情提示\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'xitongshezhi/\',\n    \'catdir\' => \'dbyqts\',\n    \'url\' => \'/index.php?m=content&c=index&a=lists&catid=24\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'24\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'dibuyouqingtishi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  25 => \n  array (\n    \'catid\' => \'25\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'14\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'25\',\n    \'catname\' => \'中奖排行榜\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'zjphb\',\n    \'url\' => \'/index.php?m=content&c=index&a=lists&catid=25\',\n    \'items\' => \'13\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'25\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'zhongjiangpaixingbang\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  28 => \n  array (\n    \'catid\' => \'28\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'28\',\n    \'catname\' => \'玩法\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'wanfa\',\n    \'url\' => \'/index.php?m=content&c=index&a=lists&catid=28\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"list_activity\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'28\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'wanfa\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  29 => \n  array (\n    \'catid\' => \'29\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'29\',\n    \'catname\' => \'联系我们\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'xitongshezhi/\',\n    \'catdir\' => \'lxwm\',\n    \'url\' => \'/index.php?m=content&c=index&a=lists&catid=29\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"ishtml\":\"0\",\"template_list\":\"cp\",\"page_template\":\"page_linkme\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'29\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'lianxiwomen\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  30 => \n  array (\n    \'catid\' => \'30\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'10\',\n    \'arrparentid\' => \'0,10\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'30\',\n    \'catname\' => \'手机购彩页面图片\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'xitongshezhi/\',\n    \'catdir\' => \'sjgct\',\n    \'url\' => \'/index.php?m=content&c=index&a=lists&catid=30\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}\',\n    \'listorder\' => \'30\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'shoujigoucaiyemiantupian\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  31 => \n  array (\n    \'catid\' => \'31\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'31\',\n    \'catname\' => \'开奖公告\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'kjgg\',\n    \'url\' => \'/index.php?m=content&c=index&a=lists&catid=31\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"ishtml\":\"0\",\"template_list\":\"cp\",\"page_template\":\"page_linkme\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'31\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'kaijianggonggao\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `cp_cache` VALUES ('sitelist.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'siteid\' => \'1\',\n    \'name\' => \'皇家娱乐\',\n    \'dirname\' => \'\',\n    \'domain\' => \'/\',\n    \'site_title\' => \'\',\n    \'keywords\' => \'\',\n    \'description\' => \'\',\n    \'release_point\' => \'\',\n    \'default_style\' => \'cp\',\n    \'template\' => \'cp\',\n    \'setting\' => \'{\"upload_maxsize\":\"20480\",\"upload_allowext\":\"jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\",\"watermark_enable\":\"0\",\"watermark_minwidth\":\"300\",\"watermark_minheight\":\"300\",\"watermark_img\":\"statics\\\\/images\\\\/water\\\\/\\\\/mark.png\",\"watermark_pct\":\"85\",\"watermark_quality\":\"80\",\"watermark_pos\":\"9\"}\',\n    \'uuid\' => \'c5ac8b3f-695d-11e8-b5ae-deb0d92f5d47\',\n    \'url\' => \'/\',\n  ),\n);\n?>');
INSERT INTO `cp_cache` VALUES ('type_content_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `cp_cache` VALUES ('downservers.cache.php', 'caches_commons/caches_data/', '<?php\nreturn NULL;\n?>');
INSERT INTO `cp_cache` VALUES ('badword.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `cp_cache` VALUES ('ipbanned.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `cp_cache` VALUES ('keylink.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `cp_cache` VALUES ('position.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  2 => \n  array (\n    \'posid\' => \'2\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页头条推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'4\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  1 => \n  array (\n    \'posid\' => \'1\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页焦点图推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'1\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  16 => \n  array (\n    \'posid\' => \'16\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页每日热点\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  15 => \n  array (\n    \'posid\' => \'15\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页头条推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  14 => \n  array (\n    \'posid\' => \'14\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  12 => \n  array (\n    \'posid\' => \'12\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页图片推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  10 => \n  array (\n    \'posid\' => \'10\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'栏目首页推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  9 => \n  array (\n    \'posid\' => \'9\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'网站顶部推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  8 => \n  array (\n    \'posid\' => \'8\',\n    \'modelid\' => \'30\',\n    \'catid\' => \'54\',\n    \'name\' => \'图片频道首页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  5 => \n  array (\n    \'posid\' => \'5\',\n    \'modelid\' => \'69\',\n    \'catid\' => \'0\',\n    \'name\' => \'推荐下载\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  13 => \n  array (\n    \'posid\' => \'13\',\n    \'modelid\' => \'82\',\n    \'catid\' => \'0\',\n    \'name\' => \'栏目页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  17 => \n  array (\n    \'posid\' => \'17\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频栏目精彩推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n);\n?>');
INSERT INTO `cp_cache` VALUES ('role_siteid.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `cp_cache` VALUES ('role.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \'超级管理员\',\n  2 => \'站点管理员\',\n  3 => \'运营总监\',\n  4 => \'总编\',\n  5 => \'编辑\',\n  7 => \'发布人员\',\n);\n?>');
INSERT INTO `cp_cache` VALUES ('urlrules_detail.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'urlruleid\' => \'1\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n    \'example\' => \'news/china/1000.html\',\n  ),\n  6 => \n  array (\n    \'urlruleid\' => \'6\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=lists&catid=1&page=1\',\n  ),\n  11 => \n  array (\n    \'urlruleid\' => \'11\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'2010/catdir_0720/1_2.html\',\n  ),\n  12 => \n  array (\n    \'urlruleid\' => \'12\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'it/product/2010/0720/1_2.html\',\n  ),\n  16 => \n  array (\n    \'urlruleid\' => \'16\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=show&catid=1&id=1\',\n  ),\n  17 => \n  array (\n    \'urlruleid\' => \'17\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'show-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'show-1-2-1.html\',\n  ),\n  18 => \n  array (\n    \'urlruleid\' => \'18\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'content-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'content-1-2-1.html\',\n  ),\n  30 => \n  array (\n    \'urlruleid\' => \'30\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'list-{$catid}-{$page}.html\',\n    \'example\' => \'list-1-1.html\',\n  ),\n);\n?>');
INSERT INTO `cp_cache` VALUES ('urlrules.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n  6 => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n  11 => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n  12 => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n  16 => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n  17 => \'show-{$catid}-{$id}-{$page}.html\',\n  18 => \'content-{$catid}-{$id}-{$page}.html\',\n  30 => \'list-{$catid}-{$page}.html\',\n);\n?>');
INSERT INTO `cp_cache` VALUES ('modules.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  \'admin\' => \n  array (\n    \'module\' => \'admin\',\n    \'name\' => \'admin\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'{\"admin_email\":\"phpcms@phpcms.cn\",\"maxloginfailedtimes\":\"8\",\"minrefreshtime\":\"2\",\"mail_type\":\"1\",\"mail_server\":\"smtp.qq.com\",\"mail_port\":\"25\",\"category_ajax\":\"0\",\"mail_user\":\"phpcms.cn@foxmail.com\",\"mail_auth\":\"1\",\"mail_from\":\"phpcms.cn@foxmail.com\",\"mail_password\":\"\",\"errorlog_size\":\"20\"}\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-18\',\n    \'updatedate\' => \'2010-10-18\',\n  ),\n  \'member\' => \n  array (\n    \'module\' => \'member\',\n    \'name\' => \'会员\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'allowregister\\\' => \\\'1\\\',\n  \\\'choosemodel\\\' => \\\'1\\\',\n  \\\'enablemailcheck\\\' => \\\'0\\\',\n  \\\'registerverify\\\' => \\\'0\\\',\n  \\\'showapppoint\\\' => \\\'0\\\',\n  \\\'rmb_point_rate\\\' => \\\'10\\\',\n  \\\'defualtpoint\\\' => \\\'0\\\',\n  \\\'defualtamount\\\' => \\\'0\\\',\n  \\\'showregprotocol\\\' => \\\'0\\\',\n  \\\'regprotocol\\\' => \\\'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \\\',\n  \\\'registerverifymessage\\\' => \\\' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n  \\\'forgetpassword\\\' => \\\' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'pay\' => \n  array (\n    \'module\' => \'pay\',\n    \'name\' => \'支付\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'digg\' => \n  array (\n    \'module\' => \'digg\',\n    \'name\' => \'顶一下\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'special\' => \n  array (\n    \'module\' => \'special\',\n    \'name\' => \'专题\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'content\' => \n  array (\n    \'module\' => \'content\',\n    \'name\' => \'内容模块\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'search\' => \n  array (\n    \'module\' => \'search\',\n    \'name\' => \'全站搜索\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'fulltextenble\\\' => \\\'1\\\',\n  \\\'relationenble\\\' => \\\'1\\\',\n  \\\'suggestenable\\\' => \\\'1\\\',\n  \\\'sphinxenable\\\' => \\\'0\\\',\n  \\\'sphinxhost\\\' => \\\'10.228.134.102\\\',\n  \\\'sphinxport\\\' => \\\'9312\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'scan\' => \n  array (\n    \'module\' => \'scan\',\n    \'name\' => \'木马扫描\',\n    \'url\' => \'scan\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'attachment\' => \n  array (\n    \'module\' => \'attachment\',\n    \'name\' => \'附件\',\n    \'url\' => \'attachment\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'block\' => \n  array (\n    \'module\' => \'block\',\n    \'name\' => \'碎片\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'collection\' => \n  array (\n    \'module\' => \'collection\',\n    \'name\' => \'采集模块\',\n    \'url\' => \'collection\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'dbsource\' => \n  array (\n    \'module\' => \'dbsource\',\n    \'name\' => \'数据源\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'template\' => \n  array (\n    \'module\' => \'template\',\n    \'name\' => \'模板风格\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'release\' => \n  array (\n    \'module\' => \'release\',\n    \'name\' => \'发布点\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'video\' => \n  array (\n    \'module\' => \'video\',\n    \'name\' => \'视频库\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2012-09-28\',\n    \'updatedate\' => \'2012-09-28\',\n  ),\n  \'announce\' => \n  array (\n    \'module\' => \'announce\',\n    \'name\' => \'公告\',\n    \'url\' => \'announce/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'公告\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2018-06-06\',\n    \'updatedate\' => \'2018-06-06\',\n  ),\n  \'link\' => \n  array (\n    \'module\' => \'link\',\n    \'name\' => \'友情链接\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  1 => \n  array (\n    \\\'is_post\\\' => \\\'1\\\',\n    \\\'enablecheckcode\\\' => \\\'0\\\',\n  ),\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'poster\' => \n  array (\n    \'module\' => \'poster\',\n    \'name\' => \'广告模块\',\n    \'url\' => \'poster/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'广告模块\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2018-06-06\',\n    \'updatedate\' => \'2018-06-06\',\n  ),\n  \'upgrade\' => \n  array (\n    \'module\' => \'upgrade\',\n    \'name\' => \'在线升级\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-05-18\',\n    \'updatedate\' => \'2011-05-18\',\n  ),\n);\n?>');
INSERT INTO `cp_cache` VALUES ('category_items_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  16 => \'16\',\n  21 => \'1\',\n  11 => \'1\',\n  22 => \'4\',\n  24 => \'1\',\n  28 => \'1\',\n);\n?>');
INSERT INTO `cp_cache` VALUES ('category_items_2.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `cp_cache` VALUES ('model.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'modelid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'name\' => \'文章模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'news\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category\',\n    \'list_template\' => \'list\',\n    \'show_template\' => \'show\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  2 => \n  array (\n    \'modelid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'name\' => \'下载模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'download\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_download\',\n    \'list_template\' => \'list_download\',\n    \'show_template\' => \'show_download\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  3 => \n  array (\n    \'modelid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'name\' => \'图片模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'picture\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_picture\',\n    \'list_template\' => \'list_picture\',\n    \'show_template\' => \'show_picture\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  11 => \n  array (\n    \'modelid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'name\' => \'视频模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'video\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_video\',\n    \'list_template\' => \'list_video\',\n    \'show_template\' => \'show_video\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  12 => \n  array (\n    \'modelid\' => \'12\',\n    \'siteid\' => \'1\',\n    \'name\' => \'轮播图\',\n    \'description\' => \'首页轮播图\',\n    \'tablename\' => \'round\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'cp\',\n    \'category_template\' => \'category\',\n    \'list_template\' => \'list\',\n    \'show_template\' => \'show\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'content_list\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  13 => \n  array (\n    \'modelid\' => \'13\',\n    \'siteid\' => \'1\',\n    \'name\' => \'活动专区\',\n    \'description\' => \'活动专区\',\n    \'tablename\' => \'activity\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'\',\n    \'category_template\' => \'\',\n    \'list_template\' => \'\',\n    \'show_template\' => \'\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  14 => \n  array (\n    \'modelid\' => \'14\',\n    \'siteid\' => \'1\',\n    \'name\' => \'中奖\',\n    \'description\' => \'\',\n    \'tablename\' => \'price\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'\',\n    \'category_template\' => \'\',\n    \'list_template\' => \'\',\n    \'show_template\' => \'\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `cp_cache` VALUES ('workflow_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'workflowid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'1\',\n    \'workname\' => \'一级审核\',\n    \'description\' => \'审核一次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  2 => \n  array (\n    \'workflowid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'2\',\n    \'workname\' => \'二级审核\',\n    \'description\' => \'审核两次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  3 => \n  array (\n    \'workflowid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'3\',\n    \'workname\' => \'三级审核\',\n    \'description\' => \'审核三次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  4 => \n  array (\n    \'workflowid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'4\',\n    \'workname\' => \'四级审核\',\n    \'description\' => \'四级审核\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `cp_cache` VALUES ('member_model.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  10 => \n  array (\n    \'modelid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'name\' => \'普通会员\',\n    \'description\' => \'普通会员\',\n    \'tablename\' => \'member_detail\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'\',\n    \'category_template\' => \'\',\n    \'list_template\' => \'\',\n    \'show_template\' => \'\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'2\',\n  ),\n);\n?>');
INSERT INTO `cp_cache` VALUES ('special.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `cp_cache` VALUES ('common.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'category_ajax\' => \'0\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n);\n?>');
INSERT INTO `cp_cache` VALUES ('category_items_3.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  19 => \'1\',\n  7 => \'2\',\n  20 => \'1\',\n  30 => \'1\',\n);\n?>');
INSERT INTO `cp_cache` VALUES ('category_items_11.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `cp_cache` VALUES ('type_.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `cp_cache` VALUES ('category_items_12.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  15 => \'1\',\n  23 => \'1\',\n);\n?>');
INSERT INTO `cp_cache` VALUES ('type_content.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `cp_cache` VALUES ('vote.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `cp_cache` VALUES ('link.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `cp_cache` VALUES ('category_items_13.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  17 => \'3\',\n);\n?>');
INSERT INTO `cp_cache` VALUES ('category_items_14.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  25 => \'13\',\n);\n?>');

-- ----------------------------
-- Table structure for `cp_category`
-- ----------------------------
DROP TABLE IF EXISTS `cp_category`;
CREATE TABLE `cp_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter` varchar(30) NOT NULL,
  `usable_type` varchar(255) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`siteid`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_category
-- ----------------------------
INSERT INTO `cp_category` VALUES ('15', '1', 'content', '0', '12', '10', '0,10', '0', '15', '首页轮播图', '', '', '', 'xitongshezhi/', 'lunbotu', '/index.php?m=content&c=index&a=lists&catid=15', '1', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '15', '0', '0', 'shouyelunbotu', '');
INSERT INTO `cp_category` VALUES ('16', '1', 'content', '0', '1', '0', '0', '0', '16', '新闻', '', '', '', '', 'xinwen', '/index.php?m=content&c=index&a=lists&catid=16', '16', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '16', '0', '0', 'xinwen', '');
INSERT INTO `cp_category` VALUES ('17', '1', 'content', '0', '13', '0', '0', '0', '17', '优惠活动', '', '', '', '', 'huodong', '/index.php?m=content&c=index&a=lists&catid=17', '3', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"list_activity\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '3', '1', '0', 'youhuihuodong', '');
INSERT INTO `cp_category` VALUES ('18', '1', 'content', '1', '0', '0', '0', '0', '18', '手机购彩', '', '', '', '', 'phone', '/index.php?m=content&c=index&a=lists&catid=18', '0', '0', '{\"ishtml\":\"0\",\"template_list\":\"cp\",\"page_template\":\"page_phone\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}', '1', '1', '0', 'shoujigoucai', '');
INSERT INTO `cp_category` VALUES ('19', '1', 'content', '0', '3', '10', '0,10', '0', '19', '首页LOGO', '', '', '', 'xitongshezhi/', 'logo', '/index.php?m=content&c=index&a=lists&catid=19', '1', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '19', '0', '0', 'shouyelogo', '');
INSERT INTO `cp_category` VALUES ('7', '1', 'content', '0', '3', '10', '0,10', '0', '7', '二维码', '', '', '', 'xitongshezhi/', 'erweima', '/index.php?m=content&c=index&a=lists&catid=7', '2', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '7', '0', '0', 'erweima', '');
INSERT INTO `cp_category` VALUES ('8', '1', 'content', '2', '0', '0', '', '0', '', '购彩大厅', '', '', '', '', '', 'http://ag.tt17168.com:81/Member/Login/', '0', '0', '{\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}', '0', '1', '0', '', '');
INSERT INTO `cp_category` VALUES ('21', '1', 'content', '0', '1', '0', '0', '0', '21', '帮助中心', '', '', '', '', 'help', '/help/', '1', '0', '{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"\",\"show_template\":\"show_help\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}', '21', '0', '1', 'bangzhuzhongxin', '');
INSERT INTO `cp_category` VALUES ('10', '1', 'content', '1', '0', '0', '0', '1', '10,26,27,7,11,15,19,20,23,24,29,30', '系统设置', '', '', '', '', 'xitongshezhi', '/index.php?m=content&c=index&a=lists&catid=10', '0', '0', '{\"ishtml\":\"0\",\"template_list\":\"cp\",\"page_template\":\"\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}', '10', '0', '0', 'xitongshezhi', '');
INSERT INTO `cp_category` VALUES ('11', '1', 'content', '0', '1', '10', '0,10', '0', '11', '首页顶部滚动内容', '', '', '', 'xitongshezhi/', 'shouyedingbugundongneirong', '/index.php?m=content&c=index&a=lists&catid=11', '1', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '11', '0', '0', 'shouyedingbugundongneirong', '');
INSERT INTO `cp_category` VALUES ('20', '1', 'content', '0', '3', '10', '0,10', '0', '20', '首页背景图', '', '', '', 'xitongshezhi/', 'background', '/index.php?m=content&c=index&a=lists&catid=20', '1', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '20', '0', '0', 'shouyebeijingtu', '');
INSERT INTO `cp_category` VALUES ('31', '1', 'content', '1', '0', '0', '0', '0', '31', '开奖公告', '', '', '', '', 'kjgg', '/index.php?m=content&c=index&a=lists&catid=31', '0', '0', '{\"ishtml\":\"0\",\"template_list\":\"cp\",\"page_template\":\"page_linkme\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}', '31', '1', '0', 'kaijianggonggao', '');
INSERT INTO `cp_category` VALUES ('22', '1', 'content', '0', '1', '0', '0', '0', '22', '网站公告', '', '', '', '', 'wzgg', '/index.php?m=content&c=index&a=lists&catid=22', '4', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"list_activity\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '22', '0', '0', 'wangzhangonggao', '');
INSERT INTO `cp_category` VALUES ('23', '1', 'content', '0', '12', '10', '0,10', '0', '23', '底部认证图片', '', '', '', 'xitongshezhi/', 'dbrztp', '/index.php?m=content&c=index&a=lists&catid=23', '1', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '23', '0', '0', 'diburenzhengtupian', '');
INSERT INTO `cp_category` VALUES ('24', '1', 'content', '0', '1', '10', '0,10', '0', '24', '底部友情提示', '', '', '', 'xitongshezhi/', 'dbyqts', '/index.php?m=content&c=index&a=lists&catid=24', '1', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '24', '0', '0', 'dibuyouqingtishi', '');
INSERT INTO `cp_category` VALUES ('25', '1', 'content', '0', '14', '0', '0', '0', '25', '中奖排行榜', '', '', '', '', 'zjphb', '/index.php?m=content&c=index&a=lists&catid=25', '13', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '25', '0', '0', 'zhongjiangpaixingbang', '');
INSERT INTO `cp_category` VALUES ('26', '1', 'content', '2', '0', '10', '', '0', '', '免费试玩URL', '', '', '', '', '', 'http://ag.tt17168.com:81/Member/Login/', '0', '0', '{\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}', '0', '1', '0', '', '');
INSERT INTO `cp_category` VALUES ('27', '1', 'content', '2', '0', '10', '', '0', '', '加入代理URL', '', '', '', '', '', 'http://ag.tt17168.com:81/Member/Login/', '0', '0', '{\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}', '0', '1', '0', '', '');
INSERT INTO `cp_category` VALUES ('28', '1', 'content', '0', '1', '0', '0', '0', '28', '玩法', '', '', '', '', 'wanfa', '/index.php?m=content&c=index&a=lists&catid=28', '1', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"list_activity\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '28', '0', '0', 'wanfa', '');
INSERT INTO `cp_category` VALUES ('29', '1', 'content', '1', '0', '10', '0,10', '0', '29', '联系我们', '', '', '', 'xitongshezhi/', 'lxwm', '/index.php?m=content&c=index&a=lists&catid=29', '0', '0', '{\"ishtml\":\"0\",\"template_list\":\"cp\",\"page_template\":\"page_linkme\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}', '29', '0', '0', 'lianxiwomen', '');
INSERT INTO `cp_category` VALUES ('30', '1', 'content', '0', '3', '10', '0,10', '0', '30', '手机购彩页面图片', '', '', '', 'xitongshezhi/', 'sjgct', '/index.php?m=content&c=index&a=lists&catid=30', '1', '0', '{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"cp\",\"category_template\":\"category\",\"list_template\":\"\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"6\",\"show_ruleid\":\"16\"}', '30', '0', '0', 'shoujigoucaiyemiantupian', '');

-- ----------------------------
-- Table structure for `cp_category_priv`
-- ----------------------------
DROP TABLE IF EXISTS `cp_category_priv`;
CREATE TABLE `cp_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_category_priv
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_collection_content`
-- ----------------------------
DROP TABLE IF EXISTS `cp_collection_content`;
CREATE TABLE `cp_collection_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nodeid` (`nodeid`,`siteid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_collection_content
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_collection_history`
-- ----------------------------
DROP TABLE IF EXISTS `cp_collection_history`;
CREATE TABLE `cp_collection_history` (
  `md5` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_collection_history
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_collection_node`
-- ----------------------------
DROP TABLE IF EXISTS `cp_collection_node`;
CREATE TABLE `cp_collection_node` (
  `nodeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagesize_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL DEFAULT '',
  `url_end` char(100) NOT NULL DEFAULT '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `author_rule` char(100) NOT NULL,
  `author_html_rule` text NOT NULL,
  `comeform_rule` char(100) NOT NULL,
  `comeform_html_rule` text NOT NULL,
  `time_rule` char(100) NOT NULL,
  `time_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `coll_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `customize_config` text NOT NULL,
  PRIMARY KEY (`nodeid`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_collection_node
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_collection_program`
-- ----------------------------
DROP TABLE IF EXISTS `cp_collection_program`;
CREATE TABLE `cp_collection_program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `nodeid` (`nodeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_collection_program
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_content_check`
-- ----------------------------
DROP TABLE IF EXISTS `cp_content_check`;
CREATE TABLE `cp_content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `username` (`username`),
  KEY `checkid` (`checkid`),
  KEY `status` (`status`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_content_check
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_copyfrom`
-- ----------------------------
DROP TABLE IF EXISTS `cp_copyfrom`;
CREATE TABLE `cp_copyfrom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_copyfrom
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_datacall`
-- ----------------------------
DROP TABLE IF EXISTS `cp_datacall`;
CREATE TABLE `cp_datacall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `dis_type` tinyint(1) unsigned DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `action` char(20) DEFAULT NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) DEFAULT NULL,
  `num` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_datacall
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_dbsource`
-- ----------------------------
DROP TABLE IF EXISTS `cp_dbsource`;
CREATE TABLE `cp_dbsource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_dbsource
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_download`
-- ----------------------------
DROP TABLE IF EXISTS `cp_download`;
CREATE TABLE `cp_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `systems` varchar(100) NOT NULL DEFAULT 'Win2000/WinXP/Win2003',
  `copytype` varchar(15) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `classtype` varchar(20) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '',
  `filesize` varchar(10) NOT NULL DEFAULT 'Unkown',
  `stars` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_download
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_download_data`
-- ----------------------------
DROP TABLE IF EXISTS `cp_download_data`;
CREATE TABLE `cp_download_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `downfiles` mediumtext NOT NULL,
  `downfile` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_download_data
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_downservers`
-- ----------------------------
DROP TABLE IF EXISTS `cp_downservers`;
CREATE TABLE `cp_downservers` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_downservers
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_extend_setting`
-- ----------------------------
DROP TABLE IF EXISTS `cp_extend_setting`;
CREATE TABLE `cp_extend_setting` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(30) NOT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_extend_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `cp_favorite`;
CREATE TABLE `cp_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_hits`
-- ----------------------------
DROP TABLE IF EXISTS `cp_hits`;
CREATE TABLE `cp_hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `dayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `weekviews` int(10) unsigned NOT NULL DEFAULT '0',
  `monthviews` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hitsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_hits
-- ----------------------------
INSERT INTO `cp_hits` VALUES ('c-3-1', '7', '3', '0', '3', '3', '3', '1528278489');
INSERT INTO `cp_hits` VALUES ('c-3-2', '7', '2', '0', '2', '2', '2', '1528278494');
INSERT INTO `cp_hits` VALUES ('c-1-1', '11', '0', '0', '0', '0', '0', '1528338400');
INSERT INTO `cp_hits` VALUES ('c-12-1', '15', '0', '0', '0', '0', '0', '1528341103');
INSERT INTO `cp_hits` VALUES ('c-1-2', '16', '3', '0', '1', '1', '3', '1528707064');
INSERT INTO `cp_hits` VALUES ('c-13-1', '17', '4', '0', '4', '4', '4', '1528708203');
INSERT INTO `cp_hits` VALUES ('c-13-2', '17', '0', '0', '0', '0', '0', '1528708302');
INSERT INTO `cp_hits` VALUES ('c-3-3', '19', '0', '0', '0', '0', '0', '1528711052');
INSERT INTO `cp_hits` VALUES ('c-3-4', '20', '0', '0', '0', '0', '0', '1528713792');
INSERT INTO `cp_hits` VALUES ('c-1-3', '21', '0', '0', '0', '0', '0', '1528717808');
INSERT INTO `cp_hits` VALUES ('c-1-12', '22', '0', '0', '0', '0', '0', '1528982584');
INSERT INTO `cp_hits` VALUES ('c-14-4', '25', '0', '0', '0', '0', '0', '1528982692');
INSERT INTO `cp_hits` VALUES ('c-14-5', '25', '0', '0', '0', '0', '0', '1528982730');
INSERT INTO `cp_hits` VALUES ('c-1-13', '16', '0', '0', '0', '0', '0', '1528982860');
INSERT INTO `cp_hits` VALUES ('c-12-2', '23', '0', '0', '0', '0', '0', '1528946509');
INSERT INTO `cp_hits` VALUES ('c-1-8', '24', '0', '0', '0', '0', '0', '1528947330');
INSERT INTO `cp_hits` VALUES ('c-14-1', '25', '0', '0', '0', '0', '0', '1528954422');
INSERT INTO `cp_hits` VALUES ('c-14-2', '25', '0', '0', '0', '0', '0', '1528954433');
INSERT INTO `cp_hits` VALUES ('c-14-3', '25', '0', '0', '0', '0', '0', '1528954448');
INSERT INTO `cp_hits` VALUES ('c-1-9', '28', '0', '0', '0', '0', '0', '1528955299');
INSERT INTO `cp_hits` VALUES ('c-1-30', '16', '0', '0', '0', '0', '0', '1529052647');
INSERT INTO `cp_hits` VALUES ('c-3-7', '30', '0', '0', '0', '0', '0', '1528987164');
INSERT INTO `cp_hits` VALUES ('c-1-27', '22', '0', '0', '0', '0', '0', '1529031181');
INSERT INTO `cp_hits` VALUES ('c-1-14', '16', '0', '0', '0', '0', '0', '1528983034');
INSERT INTO `cp_hits` VALUES ('c-14-6', '25', '0', '0', '0', '0', '0', '1528983485');
INSERT INTO `cp_hits` VALUES ('c-14-7', '25', '0', '0', '0', '0', '0', '1528983514');
INSERT INTO `cp_hits` VALUES ('c-14-8', '25', '0', '0', '0', '0', '0', '1528983643');
INSERT INTO `cp_hits` VALUES ('c-14-9', '25', '0', '0', '0', '0', '0', '1528983698');
INSERT INTO `cp_hits` VALUES ('c-14-10', '25', '0', '0', '0', '0', '0', '1528983728');
INSERT INTO `cp_hits` VALUES ('c-14-11', '25', '0', '0', '0', '0', '0', '1528983767');
INSERT INTO `cp_hits` VALUES ('c-14-12', '25', '0', '0', '0', '0', '0', '1528983800');
INSERT INTO `cp_hits` VALUES ('c-14-13', '25', '0', '0', '0', '0', '0', '1528983839');
INSERT INTO `cp_hits` VALUES ('c-1-15', '16', '0', '0', '0', '0', '0', '1528983901');
INSERT INTO `cp_hits` VALUES ('c-1-16', '16', '0', '0', '0', '0', '0', '1528983956');
INSERT INTO `cp_hits` VALUES ('c-1-17', '16', '0', '0', '0', '0', '0', '1528983996');
INSERT INTO `cp_hits` VALUES ('c-1-18', '16', '0', '0', '0', '0', '0', '1528984030');
INSERT INTO `cp_hits` VALUES ('c-1-19', '16', '0', '0', '0', '0', '0', '1528984164');
INSERT INTO `cp_hits` VALUES ('c-1-20', '16', '0', '0', '0', '0', '0', '1528984229');
INSERT INTO `cp_hits` VALUES ('c-1-21', '16', '0', '0', '0', '0', '0', '1528984286');
INSERT INTO `cp_hits` VALUES ('c-1-22', '16', '0', '0', '0', '0', '0', '1528984332');
INSERT INTO `cp_hits` VALUES ('c-1-23', '16', '0', '0', '0', '0', '0', '1528984393');
INSERT INTO `cp_hits` VALUES ('c-1-24', '16', '0', '0', '0', '0', '0', '1528984461');
INSERT INTO `cp_hits` VALUES ('c-1-25', '16', '0', '0', '0', '0', '0', '1528984536');
INSERT INTO `cp_hits` VALUES ('c-1-26', '16', '0', '0', '0', '0', '0', '1528984644');
INSERT INTO `cp_hits` VALUES ('c-13-3', '17', '0', '0', '0', '0', '0', '1528985683');
INSERT INTO `cp_hits` VALUES ('c-1-28', '22', '0', '0', '0', '0', '0', '1529031260');
INSERT INTO `cp_hits` VALUES ('c-1-29', '22', '0', '0', '0', '0', '0', '1529031320');

-- ----------------------------
-- Table structure for `cp_ipbanned`
-- ----------------------------
DROP TABLE IF EXISTS `cp_ipbanned`;
CREATE TABLE `cp_ipbanned` (
  `ipbannedid` smallint(5) NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipbannedid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_ipbanned
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_keylink`
-- ----------------------------
DROP TABLE IF EXISTS `cp_keylink`;
CREATE TABLE `cp_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY (`keylinkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_keylink
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `cp_keyword`;
CREATE TABLE `cp_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyword` char(100) NOT NULL,
  `pinyin` char(100) NOT NULL,
  `videonum` int(11) NOT NULL DEFAULT '0',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_keyword_data`
-- ----------------------------
DROP TABLE IF EXISTS `cp_keyword_data`;
CREATE TABLE `cp_keyword_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagid` (`tagid`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_keyword_data
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_link`
-- ----------------------------
DROP TABLE IF EXISTS `cp_link`;
CREATE TABLE `cp_link` (
  `linkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linktype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `introduce` text NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  KEY `typeid` (`typeid`,`passed`,`listorder`,`linkid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_link
-- ----------------------------
INSERT INTO `cp_link` VALUES ('1', '1', '0', '1', 'PHPCMS', 'http://www.phpcms.cn', 'http://www.phpcms.cn/images/logo_88_31.gif', '', '', '0', '0', '1', '1528271401');
INSERT INTO `cp_link` VALUES ('2', '1', '0', '1', '盛大在线', 'http://www.sdo.com', 'http://www.snda.com/cn/logo/comp_logo_sdo.gif', '', '', '0', '0', '1', '1528271401');

-- ----------------------------
-- Table structure for `cp_linkage`
-- ----------------------------
DROP TABLE IF EXISTS `cp_linkage`;
CREATE TABLE `cp_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `setting` varchar(255) DEFAULT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=3360 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_linkage
-- ----------------------------
INSERT INTO `cp_linkage` VALUES ('1', '中国', '1', '0', '0', '', '0', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2', '北京市', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3', '上海市', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('4', '天津市', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('5', '重庆市', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('6', '河北省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('7', '山西省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('8', '内蒙古', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('9', '辽宁省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('10', '吉林省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('11', '黑龙江省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('12', '江苏省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('13', '浙江省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('14', '安徽省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('15', '福建省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('16', '江西省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('17', '山东省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('18', '河南省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('19', '湖北省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('20', '湖南省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('21', '广东省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('22', '广西', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('23', '海南省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('24', '四川省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('25', '贵州省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('26', '云南省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('27', '西藏', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('28', '陕西省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('29', '甘肃省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('30', '青海省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('31', '宁夏', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('32', '新疆', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('33', '台湾省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('34', '香港', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('35', '澳门', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('36', '东城区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('37', '西城区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('38', '崇文区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('39', '宣武区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('40', '朝阳区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('41', '石景山区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('42', '海淀区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('43', '门头沟区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('44', '房山区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('45', '通州区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('46', '顺义区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('47', '昌平区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('48', '大兴区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('49', '怀柔区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('50', '平谷区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('51', '密云县', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('52', '延庆县', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('53', '黄浦区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('54', '卢湾区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('55', '徐汇区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('56', '长宁区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('57', '静安区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('58', '普陀区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('59', '闸北区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('60', '虹口区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('61', '杨浦区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('62', '闵行区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('63', '宝山区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('64', '嘉定区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('65', '浦东新区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('66', '金山区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('67', '松江区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('68', '青浦区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('69', '南汇区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('70', '奉贤区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('71', '崇明县', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('72', '和平区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('73', '河东区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('74', '河西区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('75', '南开区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('76', '河北区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('77', '红桥区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('78', '塘沽区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('79', '汉沽区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('80', '大港区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('81', '东丽区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('82', '西青区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('83', '津南区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('84', '北辰区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('85', '武清区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('86', '宝坻区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('87', '宁河县', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('88', '静海县', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('89', '蓟县', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('90', '万州区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('91', '涪陵区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('92', '渝中区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('93', '大渡口区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('94', '江北区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('95', '沙坪坝区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('96', '九龙坡区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('97', '南岸区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('98', '北碚区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('99', '万盛区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('100', '双桥区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('101', '渝北区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('102', '巴南区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('103', '黔江区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('104', '长寿区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('105', '綦江县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('106', '潼南县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('107', '铜梁县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('108', '大足县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('109', '荣昌县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('110', '璧山县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('111', '梁平县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('112', '城口县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('113', '丰都县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('114', '垫江县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('115', '武隆县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('116', '忠县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('117', '开县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('118', '云阳县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('119', '奉节县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('120', '巫山县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('121', '巫溪县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('122', '石柱县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('123', '秀山县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('124', '酉阳县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('125', '彭水县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('126', '江津区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('127', '合川区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('128', '永川区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('129', '南川区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('130', '石家庄市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('131', '唐山市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('132', '秦皇岛市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('133', '邯郸市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('134', '邢台市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('135', '保定市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('136', '张家口市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('137', '承德市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('138', '沧州市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('139', '廊坊市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('140', '衡水市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('141', '太原市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('142', '大同市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('143', '阳泉市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('144', '长治市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('145', '晋城市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('146', '朔州市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('147', '晋中市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('148', '运城市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('149', '忻州市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('150', '临汾市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('151', '吕梁市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('152', '呼和浩特市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('153', '包头市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('154', '乌海市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('155', '赤峰市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('156', '通辽市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('157', '鄂尔多斯市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('158', '呼伦贝尔市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('159', '巴彦淖尔市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('160', '乌兰察布市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('161', '兴安盟', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('162', '锡林郭勒盟', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('163', '阿拉善盟', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('164', '沈阳市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('165', '大连市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('166', '鞍山市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('167', '抚顺市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('168', '本溪市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('169', '丹东市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('170', '锦州市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('171', '营口市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('172', '阜新市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('173', '辽阳市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('174', '盘锦市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('175', '铁岭市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('176', '朝阳市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('177', '葫芦岛市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('178', '长春市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('179', '吉林市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('180', '四平市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('181', '辽源市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('182', '通化市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('183', '白山市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('184', '松原市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('185', '白城市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('186', '延边', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('187', '哈尔滨市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('188', '齐齐哈尔市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('189', '鸡西市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('190', '鹤岗市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('191', '双鸭山市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('192', '大庆市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('193', '伊春市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('194', '佳木斯市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('195', '七台河市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('196', '牡丹江市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('197', '黑河市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('198', '绥化市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('199', '大兴安岭地区', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('200', '南京市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('201', '无锡市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('202', '徐州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('203', '常州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('204', '苏州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('205', '南通市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('206', '连云港市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('207', '淮安市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('208', '盐城市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('209', '扬州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('210', '镇江市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('211', '泰州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('212', '宿迁市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('213', '杭州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('214', '宁波市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('215', '温州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('216', '嘉兴市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('217', '湖州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('218', '绍兴市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('219', '金华市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('220', '衢州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('221', '舟山市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('222', '台州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('223', '丽水市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('224', '合肥市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('225', '芜湖市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('226', '蚌埠市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('227', '淮南市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('228', '马鞍山市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('229', '淮北市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('230', '铜陵市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('231', '安庆市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('232', '黄山市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('233', '滁州市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('234', '阜阳市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('235', '宿州市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('236', '巢湖市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('237', '六安市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('238', '亳州市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('239', '池州市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('240', '宣城市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('241', '福州市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('242', '厦门市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('243', '莆田市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('244', '三明市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('245', '泉州市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('246', '漳州市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('247', '南平市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('248', '龙岩市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('249', '宁德市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('250', '南昌市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('251', '景德镇市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('252', '萍乡市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('253', '九江市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('254', '新余市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('255', '鹰潭市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('256', '赣州市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('257', '吉安市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('258', '宜春市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('259', '抚州市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('260', '上饶市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('261', '济南市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('262', '青岛市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('263', '淄博市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('264', '枣庄市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('265', '东营市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('266', '烟台市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('267', '潍坊市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('268', '济宁市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('269', '泰安市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('270', '威海市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('271', '日照市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('272', '莱芜市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('273', '临沂市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('274', '德州市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('275', '聊城市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('276', '滨州市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('277', '荷泽市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('278', '郑州市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('279', '开封市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('280', '洛阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('281', '平顶山市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('282', '安阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('283', '鹤壁市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('284', '新乡市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('285', '焦作市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('286', '濮阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('287', '许昌市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('288', '漯河市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('289', '三门峡市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('290', '南阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('291', '商丘市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('292', '信阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('293', '周口市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('294', '驻马店市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('295', '武汉市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('296', '黄石市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('297', '十堰市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('298', '宜昌市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('299', '襄樊市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('300', '鄂州市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('301', '荆门市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('302', '孝感市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('303', '荆州市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('304', '黄冈市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('305', '咸宁市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('306', '随州市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('307', '恩施土家族苗族自治州', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('308', '仙桃市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('309', '潜江市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('310', '天门市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('311', '神农架林区', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('312', '长沙市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('313', '株洲市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('314', '湘潭市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('315', '衡阳市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('316', '邵阳市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('317', '岳阳市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('318', '常德市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('319', '张家界市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('320', '益阳市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('321', '郴州市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('322', '永州市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('323', '怀化市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('324', '娄底市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('325', '湘西土家族苗族自治州', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('326', '广州市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('327', '韶关市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('328', '深圳市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('329', '珠海市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('330', '汕头市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('331', '佛山市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('332', '江门市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('333', '湛江市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('334', '茂名市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('335', '肇庆市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('336', '惠州市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('337', '梅州市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('338', '汕尾市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('339', '河源市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('340', '阳江市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('341', '清远市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('342', '东莞市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('343', '中山市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('344', '潮州市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('345', '揭阳市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('346', '云浮市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('347', '南宁市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('348', '柳州市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('349', '桂林市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('350', '梧州市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('351', '北海市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('352', '防城港市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('353', '钦州市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('354', '贵港市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('355', '玉林市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('356', '百色市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('357', '贺州市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('358', '河池市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('359', '来宾市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('360', '崇左市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('361', '海口市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('362', '三亚市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('363', '五指山市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('364', '琼海市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('365', '儋州市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('366', '文昌市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('367', '万宁市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('368', '东方市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('369', '定安县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('370', '屯昌县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('371', '澄迈县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('372', '临高县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('373', '白沙黎族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('374', '昌江黎族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('375', '乐东黎族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('376', '陵水黎族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('377', '保亭黎族苗族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('378', '琼中黎族苗族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('379', '西沙群岛', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('380', '南沙群岛', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('381', '中沙群岛的岛礁及其海域', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('382', '成都市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('383', '自贡市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('384', '攀枝花市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('385', '泸州市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('386', '德阳市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('387', '绵阳市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('388', '广元市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('389', '遂宁市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('390', '内江市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('391', '乐山市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('392', '南充市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('393', '眉山市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('394', '宜宾市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('395', '广安市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('396', '达州市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('397', '雅安市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('398', '巴中市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('399', '资阳市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('400', '阿坝州', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('401', '甘孜州', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('402', '凉山州', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('403', '贵阳市', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('404', '六盘水市', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('405', '遵义市', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('406', '安顺市', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('407', '铜仁地区', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('408', '黔西南州', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('409', '毕节地区', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('410', '黔东南州', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('411', '黔南州', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('412', '昆明市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('413', '曲靖市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('414', '玉溪市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('415', '保山市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('416', '昭通市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('417', '丽江市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('418', '思茅市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('419', '临沧市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('420', '楚雄州', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('421', '红河州', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('422', '文山州', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('423', '西双版纳', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('424', '大理', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('425', '德宏', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('426', '怒江', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('427', '迪庆', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('428', '拉萨市', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('429', '昌都', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('430', '山南', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('431', '日喀则', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('432', '那曲', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('433', '阿里', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('434', '林芝', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('435', '西安市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('436', '铜川市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('437', '宝鸡市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('438', '咸阳市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('439', '渭南市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('440', '延安市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('441', '汉中市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('442', '榆林市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('443', '安康市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('444', '商洛市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('445', '兰州市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('446', '嘉峪关市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('447', '金昌市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('448', '白银市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('449', '天水市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('450', '武威市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('451', '张掖市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('452', '平凉市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('453', '酒泉市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('454', '庆阳市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('455', '定西市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('456', '陇南市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('457', '临夏州', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('458', '甘州', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('459', '西宁市', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('460', '海东地区', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('461', '海州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('462', '黄南州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('463', '海南州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('464', '果洛州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('465', '玉树州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('466', '海西州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('467', '银川市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('468', '石嘴山市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('469', '吴忠市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('470', '固原市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('471', '中卫市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('472', '乌鲁木齐市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('473', '克拉玛依市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('474', '吐鲁番地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('475', '哈密地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('476', '昌吉州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('477', '博尔州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('478', '巴音郭楞州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('479', '阿克苏地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('480', '克孜勒苏柯尔克孜自治州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('481', '喀什地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('482', '和田地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('483', '伊犁州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('484', '塔城地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('485', '阿勒泰地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('486', '石河子市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('487', '阿拉尔市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('488', '图木舒克市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('489', '五家渠市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('490', '台北市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('491', '高雄市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('492', '基隆市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('493', '新竹市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('494', '台中市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('495', '嘉义市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('496', '台南市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('497', '台北县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('498', '桃园县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('499', '新竹县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('500', '苗栗县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('501', '台中县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('502', '彰化县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('503', '南投县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('504', '云林县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('505', '嘉义县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('506', '台南县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('507', '高雄县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('508', '屏东县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('509', '宜兰县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('510', '花莲县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('511', '台东县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('512', '澎湖县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('513', '金门县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('514', '连江县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('515', '中西区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('516', '东区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('517', '南区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('518', '湾仔区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('519', '九龙城区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('520', '观塘区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('521', '深水埗区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('522', '黄大仙区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('523', '油尖旺区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('524', '离岛区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('525', '葵青区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('526', '北区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('527', '西贡区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('528', '沙田区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('529', '大埔区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('530', '荃湾区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('531', '屯门区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('532', '元朗区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('533', '花地玛堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('534', '市圣安多尼堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('535', '大堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('536', '望德堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('537', '风顺堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('538', '嘉模堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('539', '圣方济各堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('540', '长安区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('541', '桥东区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('542', '桥西区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('543', '新华区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('544', '井陉矿区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('545', '裕华区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('546', '井陉县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('547', '正定县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('548', '栾城县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('549', '行唐县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('550', '灵寿县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('551', '高邑县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('552', '深泽县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('553', '赞皇县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('554', '无极县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('555', '平山县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('556', '元氏县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('557', '赵县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('558', '辛集市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('559', '藁城市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('560', '晋州市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('561', '新乐市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('562', '鹿泉市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('563', '路南区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('564', '路北区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('565', '古冶区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('566', '开平区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('567', '丰南区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('568', '丰润区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('569', '滦县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('570', '滦南县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('571', '乐亭县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('572', '迁西县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('573', '玉田县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('574', '唐海县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('575', '遵化市', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('576', '迁安市', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('577', '海港区', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('578', '山海关区', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('579', '北戴河区', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('580', '青龙县', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('581', '昌黎县', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('582', '抚宁县', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('583', '卢龙县', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('584', '邯山区', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('585', '丛台区', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('586', '复兴区', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('587', '峰峰矿区', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('588', '邯郸县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('589', '临漳县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('590', '成安县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('591', '大名县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('592', '涉县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('593', '磁县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('594', '肥乡县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('595', '永年县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('596', '邱县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('597', '鸡泽县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('598', '广平县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('599', '馆陶县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('600', '魏县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('601', '曲周县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('602', '武安市', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('603', '桥东区', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('604', '桥西区', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('605', '邢台县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('606', '临城县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('607', '内丘县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('608', '柏乡县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('609', '隆尧县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('610', '任县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('611', '南和县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('612', '宁晋县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('613', '巨鹿县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('614', '新河县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('615', '广宗县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('616', '平乡县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('617', '威县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('618', '清河县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('619', '临西县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('620', '南宫市', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('621', '沙河市', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('622', '新市区', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('623', '北市区', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('624', '南市区', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('625', '满城县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('626', '清苑县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('627', '涞水县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('628', '阜平县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('629', '徐水县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('630', '定兴县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('631', '唐县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('632', '高阳县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('633', '容城县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('634', '涞源县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('635', '望都县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('636', '安新县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('637', '易县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('638', '曲阳县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('639', '蠡县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('640', '顺平县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('641', '博野县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('642', '雄县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('643', '涿州市', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('644', '定州市', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('645', '安国市', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('646', '高碑店市', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('647', '桥东区', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('648', '桥西区', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('649', '宣化区', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('650', '下花园区', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('651', '宣化县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('652', '张北县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('653', '康保县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('654', '沽源县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('655', '尚义县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('656', '蔚县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('657', '阳原县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('658', '怀安县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('659', '万全县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('660', '怀来县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('661', '涿鹿县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('662', '赤城县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('663', '崇礼县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('664', '双桥区', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('665', '双滦区', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('666', '鹰手营子矿区', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('667', '承德县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('668', '兴隆县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('669', '平泉县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('670', '滦平县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('671', '隆化县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('672', '丰宁县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('673', '宽城县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('674', '围场县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('675', '新华区', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('676', '运河区', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('677', '沧县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('678', '青县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('679', '东光县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('680', '海兴县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('681', '盐山县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('682', '肃宁县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('683', '南皮县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('684', '吴桥县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('685', '献县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('686', '孟村县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('687', '泊头市', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('688', '任丘市', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('689', '黄骅市', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('690', '河间市', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('691', '安次区', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('692', '广阳区', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('693', '固安县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('694', '永清县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('695', '香河县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('696', '大城县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('697', '文安县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('698', '大厂县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('699', '霸州市', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('700', '三河市', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('701', '桃城区', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('702', '枣强县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('703', '武邑县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('704', '武强县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('705', '饶阳县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('706', '安平县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('707', '故城县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('708', '景县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('709', '阜城县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('710', '冀州市', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('711', '深州市', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('712', '小店区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('713', '迎泽区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('714', '杏花岭区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('715', '尖草坪区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('716', '万柏林区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('717', '晋源区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('718', '清徐县', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('719', '阳曲县', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('720', '娄烦县', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('721', '古交市', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('722', '城区', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('723', '矿区', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('724', '南郊区', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('725', '新荣区', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('726', '阳高县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('727', '天镇县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('728', '广灵县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('729', '灵丘县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('730', '浑源县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('731', '左云县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('732', '大同县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('733', '城区', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('734', '矿区', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('735', '郊区', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('736', '平定县', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('737', '盂县', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('738', '城区', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('739', '郊区', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('740', '长治县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('741', '襄垣县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('742', '屯留县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('743', '平顺县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('744', '黎城县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('745', '壶关县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('746', '长子县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('747', '武乡县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('748', '沁县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('749', '沁源县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('750', '潞城市', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('751', '城区', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('752', '沁水县', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('753', '阳城县', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('754', '陵川县', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('755', '泽州县', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('756', '高平市', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('757', '朔城区', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('758', '平鲁区', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('759', '山阴县', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('760', '应县', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('761', '右玉县', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('762', '怀仁县', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('763', '榆次区', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('764', '榆社县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('765', '左权县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('766', '和顺县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('767', '昔阳县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('768', '寿阳县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('769', '太谷县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('770', '祁县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('771', '平遥县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('772', '灵石县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('773', '介休市', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('774', '盐湖区', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('775', '临猗县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('776', '万荣县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('777', '闻喜县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('778', '稷山县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('779', '新绛县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('780', '绛县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('781', '垣曲县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('782', '夏县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('783', '平陆县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('784', '芮城县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('785', '永济市', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('786', '河津市', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('787', '忻府区', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('788', '定襄县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('789', '五台县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('790', '代县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('791', '繁峙县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('792', '宁武县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('793', '静乐县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('794', '神池县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('795', '五寨县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('796', '岢岚县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('797', '河曲县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('798', '保德县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('799', '偏关县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('800', '原平市', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('801', '尧都区', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('802', '曲沃县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('803', '翼城县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('804', '襄汾县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('805', '洪洞县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('806', '古县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('807', '安泽县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('808', '浮山县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('809', '吉县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('810', '乡宁县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('811', '大宁县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('812', '隰县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('813', '永和县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('814', '蒲县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('815', '汾西县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('816', '侯马市', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('817', '霍州市', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('818', '离石区', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('819', '文水县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('820', '交城县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('821', '兴县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('822', '临县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('823', '柳林县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('824', '石楼县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('825', '岚县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('826', '方山县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('827', '中阳县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('828', '交口县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('829', '孝义市', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('830', '汾阳市', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('831', '新城区', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('832', '回民区', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('833', '玉泉区', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('834', '赛罕区', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('835', '土默特左旗', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('836', '托克托县', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('837', '和林格尔县', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('838', '清水河县', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('839', '武川县', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('840', '东河区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('841', '昆都仑区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('842', '青山区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('843', '石拐区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('844', '白云矿区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('845', '九原区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('846', '土默特右旗', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('847', '固阳县', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('848', '达尔罕茂明安联合旗', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('849', '海勃湾区', '0', '154', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('850', '海南区', '0', '154', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('851', '乌达区', '0', '154', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('852', '红山区', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('853', '元宝山区', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('854', '松山区', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('855', '阿鲁科尔沁旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('856', '巴林左旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('857', '巴林右旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('858', '林西县', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('859', '克什克腾旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('860', '翁牛特旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('861', '喀喇沁旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('862', '宁城县', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('863', '敖汉旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('864', '科尔沁区', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('865', '科尔沁左翼中旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('866', '科尔沁左翼后旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('867', '开鲁县', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('868', '库伦旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('869', '奈曼旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('870', '扎鲁特旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('871', '霍林郭勒市', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('872', '东胜区', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('873', '达拉特旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('874', '准格尔旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('875', '鄂托克前旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('876', '鄂托克旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('877', '杭锦旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('878', '乌审旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('879', '伊金霍洛旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('880', '海拉尔区', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('881', '阿荣旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('882', '莫力达瓦达斡尔族自治旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('883', '鄂伦春自治旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('884', '鄂温克族自治旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('885', '陈巴尔虎旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('886', '新巴尔虎左旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('887', '新巴尔虎右旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('888', '满洲里市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('889', '牙克石市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('890', '扎兰屯市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('891', '额尔古纳市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('892', '根河市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('893', '临河区', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('894', '五原县', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('895', '磴口县', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('896', '乌拉特前旗', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('897', '乌拉特中旗', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('898', '乌拉特后旗', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('899', '杭锦后旗', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('900', '集宁区', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('901', '卓资县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('902', '化德县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('903', '商都县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('904', '兴和县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('905', '凉城县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('906', '察哈尔右翼前旗', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('907', '察哈尔右翼中旗', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('908', '察哈尔右翼后旗', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('909', '四子王旗', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('910', '丰镇市', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('911', '乌兰浩特市', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('912', '阿尔山市', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('913', '科尔沁右翼前旗', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('914', '科尔沁右翼中旗', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('915', '扎赉特旗', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('916', '突泉县', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('917', '二连浩特市', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('918', '锡林浩特市', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('919', '阿巴嘎旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('920', '苏尼特左旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('921', '苏尼特右旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('922', '东乌珠穆沁旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('923', '西乌珠穆沁旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('924', '太仆寺旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('925', '镶黄旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('926', '正镶白旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('927', '正蓝旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('928', '多伦县', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('929', '阿拉善左旗', '0', '163', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('930', '阿拉善右旗', '0', '163', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('931', '额济纳旗', '0', '163', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('932', '和平区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('933', '沈河区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('934', '大东区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('935', '皇姑区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('936', '铁西区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('937', '苏家屯区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('938', '东陵区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('939', '新城子区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('940', '于洪区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('941', '辽中县', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('942', '康平县', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('943', '法库县', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('944', '新民市', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('945', '中山区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('946', '西岗区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('947', '沙河口区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('948', '甘井子区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('949', '旅顺口区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('950', '金州区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('951', '长海县', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('952', '瓦房店市', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('953', '普兰店市', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('954', '庄河市', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('955', '铁东区', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('956', '铁西区', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('957', '立山区', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('958', '千山区', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('959', '台安县', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('960', '岫岩满族自治县', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('961', '海城市', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('962', '新抚区', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('963', '东洲区', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('964', '望花区', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('965', '顺城区', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('966', '抚顺县', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('967', '新宾满族自治县', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('968', '清原满族自治县', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('969', '平山区', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('970', '溪湖区', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('971', '明山区', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('972', '南芬区', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('973', '本溪满族自治县', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('974', '桓仁满族自治县', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('975', '元宝区', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('976', '振兴区', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('977', '振安区', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('978', '宽甸满族自治县', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('979', '东港市', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('980', '凤城市', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('981', '古塔区', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('982', '凌河区', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('983', '太和区', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('984', '黑山县', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('985', '义县', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('986', '凌海市', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('987', '北镇市', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('988', '站前区', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('989', '西市区', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('990', '鲅鱼圈区', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('991', '老边区', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('992', '盖州市', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('993', '大石桥市', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('994', '海州区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('995', '新邱区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('996', '太平区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('997', '清河门区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('998', '细河区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('999', '阜新蒙古族自治县', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1000', '彰武县', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1001', '白塔区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1002', '文圣区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1003', '宏伟区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1004', '弓长岭区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1005', '太子河区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1006', '辽阳县', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1007', '灯塔市', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1008', '双台子区', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1009', '兴隆台区', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1010', '大洼县', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1011', '盘山县', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1012', '银州区', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1013', '清河区', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1014', '铁岭县', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1015', '西丰县', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1016', '昌图县', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1017', '调兵山市', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1018', '开原市', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1019', '双塔区', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1020', '龙城区', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1021', '朝阳县', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1022', '建平县', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1023', '喀喇沁左翼蒙古族自治县', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1024', '北票市', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1025', '凌源市', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1026', '连山区', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1027', '龙港区', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1028', '南票区', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1029', '绥中县', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1030', '建昌县', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1031', '兴城市', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1032', '南关区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1033', '宽城区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1034', '朝阳区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1035', '二道区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1036', '绿园区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1037', '双阳区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1038', '农安县', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1039', '九台市', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1040', '榆树市', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1041', '德惠市', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1042', '昌邑区', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1043', '龙潭区', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1044', '船营区', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1045', '丰满区', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1046', '永吉县', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1047', '蛟河市', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1048', '桦甸市', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1049', '舒兰市', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1050', '磐石市', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1051', '铁西区', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1052', '铁东区', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1053', '梨树县', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1054', '伊通满族自治县', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1055', '公主岭市', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1056', '双辽市', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1057', '龙山区', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1058', '西安区', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1059', '东丰县', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1060', '东辽县', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1061', '东昌区', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1062', '二道江区', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1063', '通化县', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1064', '辉南县', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1065', '柳河县', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1066', '梅河口市', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1067', '集安市', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1068', '八道江区', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1069', '抚松县', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1070', '靖宇县', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1071', '长白朝鲜族自治县', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1072', '江源县', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1073', '临江市', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1074', '宁江区', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1075', '前郭尔罗斯蒙古族自治县', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1076', '长岭县', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1077', '乾安县', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1078', '扶余县', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1079', '洮北区', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1080', '镇赉县', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1081', '通榆县', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1082', '洮南市', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1083', '大安市', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1084', '延吉市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1085', '图们市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1086', '敦化市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1087', '珲春市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1088', '龙井市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1089', '和龙市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1090', '汪清县', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1091', '安图县', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1092', '道里区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1093', '南岗区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1094', '道外区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1095', '香坊区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1096', '动力区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1097', '平房区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1098', '松北区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1099', '呼兰区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1100', '依兰县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1101', '方正县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1102', '宾县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1103', '巴彦县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1104', '木兰县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1105', '通河县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1106', '延寿县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1107', '阿城市', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1108', '双城市', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1109', '尚志市', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1110', '五常市', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1111', '龙沙区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1112', '建华区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1113', '铁锋区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1114', '昂昂溪区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1115', '富拉尔基区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1116', '碾子山区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1117', '梅里斯达斡尔族区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1118', '龙江县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1119', '依安县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1120', '泰来县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1121', '甘南县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1122', '富裕县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1123', '克山县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1124', '克东县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1125', '拜泉县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1126', '讷河市', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1127', '鸡冠区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1128', '恒山区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1129', '滴道区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1130', '梨树区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1131', '城子河区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1132', '麻山区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1133', '鸡东县', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1134', '虎林市', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1135', '密山市', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1136', '向阳区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1137', '工农区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1138', '南山区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1139', '兴安区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1140', '东山区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1141', '兴山区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1142', '萝北县', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1143', '绥滨县', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1144', '尖山区', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1145', '岭东区', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1146', '四方台区', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1147', '宝山区', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1148', '集贤县', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1149', '友谊县', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1150', '宝清县', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1151', '饶河县', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1152', '萨尔图区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1153', '龙凤区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1154', '让胡路区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1155', '红岗区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1156', '大同区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1157', '肇州县', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1158', '肇源县', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1159', '林甸县', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1160', '杜尔伯特蒙古族自治县', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1161', '伊春区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1162', '南岔区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1163', '友好区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1164', '西林区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1165', '翠峦区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1166', '新青区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1167', '美溪区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1168', '金山屯区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1169', '五营区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1170', '乌马河区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1171', '汤旺河区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1172', '带岭区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1173', '乌伊岭区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1174', '红星区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1175', '上甘岭区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1176', '嘉荫县', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1177', '铁力市', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1178', '永红区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1179', '向阳区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1180', '前进区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1181', '东风区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1182', '郊区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1183', '桦南县', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1184', '桦川县', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1185', '汤原县', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1186', '抚远县', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1187', '同江市', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1188', '富锦市', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1189', '新兴区', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1190', '桃山区', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1191', '茄子河区', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1192', '勃利县', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1193', '东安区', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1194', '阳明区', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1195', '爱民区', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1196', '西安区', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1197', '东宁县', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1198', '林口县', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1199', '绥芬河市', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1200', '海林市', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1201', '宁安市', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1202', '穆棱市', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1203', '爱辉区', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1204', '嫩江县', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1205', '逊克县', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1206', '孙吴县', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1207', '北安市', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1208', '五大连池市', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1209', '北林区', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1210', '望奎县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1211', '兰西县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1212', '青冈县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1213', '庆安县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1214', '明水县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1215', '绥棱县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1216', '安达市', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1217', '肇东市', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1218', '海伦市', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1219', '呼玛县', '0', '199', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1220', '塔河县', '0', '199', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1221', '漠河县', '0', '199', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1222', '玄武区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1223', '白下区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1224', '秦淮区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1225', '建邺区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1226', '鼓楼区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1227', '下关区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1228', '浦口区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1229', '栖霞区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1230', '雨花台区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1231', '江宁区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1232', '六合区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1233', '溧水县', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1234', '高淳县', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1235', '崇安区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1236', '南长区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1237', '北塘区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1238', '锡山区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1239', '惠山区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1240', '滨湖区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1241', '江阴市', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1242', '宜兴市', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1243', '鼓楼区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1244', '云龙区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1245', '九里区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1246', '贾汪区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1247', '泉山区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1248', '丰县', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1249', '沛县', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1250', '铜山县', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1251', '睢宁县', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1252', '新沂市', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1253', '邳州市', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1254', '天宁区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1255', '钟楼区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1256', '戚墅堰区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1257', '新北区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1258', '武进区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1259', '溧阳市', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1260', '金坛市', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1261', '沧浪区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1262', '平江区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1263', '金阊区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1264', '虎丘区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1265', '吴中区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1266', '相城区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1267', '常熟市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1268', '张家港市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1269', '昆山市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1270', '吴江市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1271', '太仓市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1272', '崇川区', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1273', '港闸区', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1274', '海安县', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1275', '如东县', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1276', '启东市', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1277', '如皋市', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1278', '通州市', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1279', '海门市', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1280', '连云区', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1281', '新浦区', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1282', '海州区', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1283', '赣榆县', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1284', '东海县', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1285', '灌云县', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1286', '灌南县', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1287', '清河区', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1288', '楚州区', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1289', '淮阴区', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1290', '清浦区', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1291', '涟水县', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1292', '洪泽县', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1293', '盱眙县', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1294', '金湖县', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1295', '亭湖区', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1296', '盐都区', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1297', '响水县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1298', '滨海县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1299', '阜宁县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1300', '射阳县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1301', '建湖县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1302', '东台市', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1303', '大丰市', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1304', '广陵区', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1305', '邗江区', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1306', '维扬区', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1307', '宝应县', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1308', '仪征市', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1309', '高邮市', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1310', '江都市', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1311', '京口区', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1312', '润州区', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1313', '丹徒区', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1314', '丹阳市', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1315', '扬中市', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1316', '句容市', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1317', '海陵区', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1318', '高港区', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1319', '兴化市', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1320', '靖江市', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1321', '泰兴市', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1322', '姜堰市', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1323', '宿城区', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1324', '宿豫区', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1325', '沭阳县', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1326', '泗阳县', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1327', '泗洪县', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1328', '上城区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1329', '下城区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1330', '江干区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1331', '拱墅区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1332', '西湖区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1333', '滨江区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1334', '萧山区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1335', '余杭区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1336', '桐庐县', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1337', '淳安县', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1338', '建德市', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1339', '富阳市', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1340', '临安市', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1341', '海曙区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1342', '江东区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1343', '江北区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1344', '北仑区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1345', '镇海区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1346', '鄞州区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1347', '象山县', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1348', '宁海县', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1349', '余姚市', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1350', '慈溪市', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1351', '奉化市', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1352', '鹿城区', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1353', '龙湾区', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1354', '瓯海区', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1355', '洞头县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1356', '永嘉县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1357', '平阳县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1358', '苍南县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1359', '文成县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1360', '泰顺县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1361', '瑞安市', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1362', '乐清市', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1363', '秀城区', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1364', '秀洲区', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1365', '嘉善县', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1366', '海盐县', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1367', '海宁市', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1368', '平湖市', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1369', '桐乡市', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1370', '吴兴区', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1371', '南浔区', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1372', '德清县', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1373', '长兴县', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1374', '安吉县', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1375', '越城区', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1376', '绍兴县', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1377', '新昌县', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1378', '诸暨市', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1379', '上虞市', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1380', '嵊州市', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1381', '婺城区', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1382', '金东区', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1383', '武义县', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1384', '浦江县', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1385', '磐安县', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1386', '兰溪市', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1387', '义乌市', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1388', '东阳市', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1389', '永康市', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1390', '柯城区', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1391', '衢江区', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1392', '常山县', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1393', '开化县', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1394', '龙游县', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1395', '江山市', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1396', '定海区', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1397', '普陀区', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1398', '岱山县', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1399', '嵊泗县', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1400', '椒江区', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1401', '黄岩区', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1402', '路桥区', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1403', '玉环县', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1404', '三门县', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1405', '天台县', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1406', '仙居县', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1407', '温岭市', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1408', '临海市', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1409', '莲都区', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1410', '青田县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1411', '缙云县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1412', '遂昌县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1413', '松阳县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1414', '云和县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1415', '庆元县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1416', '景宁畲族自治县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1417', '龙泉市', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1418', '瑶海区', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1419', '庐阳区', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1420', '蜀山区', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1421', '包河区', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1422', '长丰县', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1423', '肥东县', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1424', '肥西县', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1425', '镜湖区', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1426', '弋江区', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1427', '鸠江区', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1428', '三山区', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1429', '芜湖县', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1430', '繁昌县', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1431', '南陵县', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1432', '龙子湖区', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1433', '蚌山区', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1434', '禹会区', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1435', '淮上区', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1436', '怀远县', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1437', '五河县', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1438', '固镇县', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1439', '大通区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1440', '田家庵区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1441', '谢家集区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1442', '八公山区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1443', '潘集区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1444', '凤台县', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1445', '金家庄区', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1446', '花山区', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1447', '雨山区', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1448', '当涂县', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1449', '杜集区', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1450', '相山区', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1451', '烈山区', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1452', '濉溪县', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1453', '铜官山区', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1454', '狮子山区', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1455', '郊区', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1456', '铜陵县', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1457', '迎江区', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1458', '大观区', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1459', '宜秀区', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1460', '怀宁县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1461', '枞阳县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1462', '潜山县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1463', '太湖县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1464', '宿松县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1465', '望江县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1466', '岳西县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1467', '桐城市', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1468', '屯溪区', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1469', '黄山区', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1470', '徽州区', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1471', '歙县', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1472', '休宁县', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1473', '黟县', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1474', '祁门县', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1475', '琅琊区', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1476', '南谯区', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1477', '来安县', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1478', '全椒县', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1479', '定远县', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1480', '凤阳县', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1481', '天长市', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1482', '明光市', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1483', '颍州区', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1484', '颍东区', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1485', '颍泉区', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1486', '临泉县', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1487', '太和县', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1488', '阜南县', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1489', '颍上县', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1490', '界首市', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1491', '埇桥区', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1492', '砀山县', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1493', '萧县', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1494', '灵璧县', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1495', '泗县', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1496', '居巢区', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1497', '庐江县', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1498', '无为县', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1499', '含山县', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1500', '和县', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1501', '金安区', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1502', '裕安区', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1503', '寿县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1504', '霍邱县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1505', '舒城县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1506', '金寨县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1507', '霍山县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1508', '谯城区', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1509', '涡阳县', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1510', '蒙城县', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1511', '利辛县', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1512', '贵池区', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1513', '东至县', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1514', '石台县', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1515', '青阳县', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1516', '宣州区', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1517', '郎溪县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1518', '广德县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1519', '泾县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1520', '绩溪县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1521', '旌德县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1522', '宁国市', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1523', '鼓楼区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1524', '台江区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1525', '仓山区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1526', '马尾区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1527', '晋安区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1528', '闽侯县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1529', '连江县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1530', '罗源县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1531', '闽清县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1532', '永泰县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1533', '平潭县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1534', '福清市', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1535', '长乐市', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1536', '思明区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1537', '海沧区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1538', '湖里区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1539', '集美区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1540', '同安区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1541', '翔安区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1542', '城厢区', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1543', '涵江区', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1544', '荔城区', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1545', '秀屿区', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1546', '仙游县', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1547', '梅列区', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1548', '三元区', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1549', '明溪县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1550', '清流县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1551', '宁化县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1552', '大田县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1553', '尤溪县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1554', '沙县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1555', '将乐县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1556', '泰宁县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1557', '建宁县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1558', '永安市', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1559', '鲤城区', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1560', '丰泽区', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1561', '洛江区', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1562', '泉港区', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1563', '惠安县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1564', '安溪县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1565', '永春县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1566', '德化县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1567', '金门县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1568', '石狮市', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1569', '晋江市', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1570', '南安市', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1571', '芗城区', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1572', '龙文区', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1573', '云霄县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1574', '漳浦县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1575', '诏安县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1576', '长泰县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1577', '东山县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1578', '南靖县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1579', '平和县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1580', '华安县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1581', '龙海市', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1582', '延平区', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1583', '顺昌县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1584', '浦城县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1585', '光泽县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1586', '松溪县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1587', '政和县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1588', '邵武市', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1589', '武夷山市', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1590', '建瓯市', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1591', '建阳市', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1592', '新罗区', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1593', '长汀县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1594', '永定县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1595', '上杭县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1596', '武平县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1597', '连城县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1598', '漳平市', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1599', '蕉城区', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1600', '霞浦县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1601', '古田县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1602', '屏南县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1603', '寿宁县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1604', '周宁县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1605', '柘荣县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1606', '福安市', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1607', '福鼎市', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1608', '东湖区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1609', '西湖区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1610', '青云谱区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1611', '湾里区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1612', '青山湖区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1613', '南昌县', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1614', '新建县', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1615', '安义县', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1616', '进贤县', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1617', '昌江区', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1618', '珠山区', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1619', '浮梁县', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1620', '乐平市', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1621', '安源区', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1622', '湘东区', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1623', '莲花县', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1624', '上栗县', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1625', '芦溪县', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1626', '庐山区', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1627', '浔阳区', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1628', '九江县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1629', '武宁县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1630', '修水县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1631', '永修县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1632', '德安县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1633', '星子县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1634', '都昌县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1635', '湖口县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1636', '彭泽县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1637', '瑞昌市', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1638', '渝水区', '0', '254', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1639', '分宜县', '0', '254', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1640', '月湖区', '0', '255', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1641', '余江县', '0', '255', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1642', '贵溪市', '0', '255', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1643', '章贡区', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1644', '赣县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1645', '信丰县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1646', '大余县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1647', '上犹县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1648', '崇义县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1649', '安远县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1650', '龙南县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1651', '定南县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1652', '全南县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1653', '宁都县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1654', '于都县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1655', '兴国县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1656', '会昌县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1657', '寻乌县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1658', '石城县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1659', '瑞金市', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1660', '南康市', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1661', '吉州区', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1662', '青原区', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1663', '吉安县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1664', '吉水县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1665', '峡江县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1666', '新干县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1667', '永丰县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1668', '泰和县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1669', '遂川县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1670', '万安县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1671', '安福县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1672', '永新县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1673', '井冈山市', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1674', '袁州区', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1675', '奉新县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1676', '万载县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1677', '上高县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1678', '宜丰县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1679', '靖安县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1680', '铜鼓县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1681', '丰城市', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1682', '樟树市', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1683', '高安市', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1684', '临川区', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1685', '南城县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1686', '黎川县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1687', '南丰县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1688', '崇仁县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1689', '乐安县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1690', '宜黄县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1691', '金溪县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1692', '资溪县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1693', '东乡县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1694', '广昌县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1695', '信州区', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1696', '上饶县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1697', '广丰县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1698', '玉山县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1699', '铅山县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1700', '横峰县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1701', '弋阳县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1702', '余干县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1703', '鄱阳县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1704', '万年县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1705', '婺源县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1706', '德兴市', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1707', '历下区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1708', '市中区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1709', '槐荫区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1710', '天桥区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1711', '历城区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1712', '长清区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1713', '平阴县', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1714', '济阳县', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1715', '商河县', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1716', '章丘市', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1717', '市南区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1718', '市北区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1719', '四方区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1720', '黄岛区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1721', '崂山区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1722', '李沧区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1723', '城阳区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1724', '胶州市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1725', '即墨市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1726', '平度市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1727', '胶南市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1728', '莱西市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1729', '淄川区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1730', '张店区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1731', '博山区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1732', '临淄区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1733', '周村区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1734', '桓台县', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1735', '高青县', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1736', '沂源县', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1737', '市中区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1738', '薛城区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1739', '峄城区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1740', '台儿庄区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1741', '山亭区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1742', '滕州市', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1743', '东营区', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1744', '河口区', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1745', '垦利县', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1746', '利津县', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1747', '广饶县', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1748', '芝罘区', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1749', '福山区', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1750', '牟平区', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1751', '莱山区', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1752', '长岛县', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1753', '龙口市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1754', '莱阳市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1755', '莱州市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1756', '蓬莱市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1757', '招远市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1758', '栖霞市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1759', '海阳市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1760', '潍城区', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1761', '寒亭区', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1762', '坊子区', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1763', '奎文区', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1764', '临朐县', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1765', '昌乐县', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1766', '青州市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1767', '诸城市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1768', '寿光市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1769', '安丘市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1770', '高密市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1771', '昌邑市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1772', '市中区', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1773', '任城区', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1774', '微山县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1775', '鱼台县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1776', '金乡县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1777', '嘉祥县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1778', '汶上县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1779', '泗水县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1780', '梁山县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1781', '曲阜市', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1782', '兖州市', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1783', '邹城市', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1784', '泰山区', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1785', '岱岳区', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1786', '宁阳县', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1787', '东平县', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1788', '新泰市', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1789', '肥城市', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1790', '环翠区', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1791', '文登市', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1792', '荣成市', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1793', '乳山市', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1794', '东港区', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1795', '岚山区', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1796', '五莲县', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1797', '莒县', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1798', '莱城区', '0', '272', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1799', '钢城区', '0', '272', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1800', '兰山区', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1801', '罗庄区', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1802', '河东区', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1803', '沂南县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1804', '郯城县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1805', '沂水县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1806', '苍山县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1807', '费县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1808', '平邑县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1809', '莒南县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1810', '蒙阴县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1811', '临沭县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1812', '德城区', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1813', '陵县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1814', '宁津县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1815', '庆云县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1816', '临邑县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1817', '齐河县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1818', '平原县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1819', '夏津县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1820', '武城县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1821', '乐陵市', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1822', '禹城市', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1823', '东昌府区', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1824', '阳谷县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1825', '莘县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1826', '茌平县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1827', '东阿县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1828', '冠县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1829', '高唐县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1830', '临清市', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1831', '滨城区', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1832', '惠民县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1833', '阳信县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1834', '无棣县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1835', '沾化县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1836', '博兴县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1837', '邹平县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1838', '牡丹区', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1839', '曹县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1840', '单县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1841', '成武县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1842', '巨野县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1843', '郓城县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1844', '鄄城县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1845', '定陶县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1846', '东明县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1847', '中原区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1848', '二七区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1849', '管城回族区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1850', '金水区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1851', '上街区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1852', '惠济区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1853', '中牟县', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1854', '巩义市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1855', '荥阳市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1856', '新密市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1857', '新郑市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1858', '登封市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1859', '龙亭区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1860', '顺河回族区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1861', '鼓楼区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1862', '禹王台区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1863', '金明区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1864', '杞县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1865', '通许县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1866', '尉氏县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1867', '开封县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1868', '兰考县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1869', '老城区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1870', '西工区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1871', '廛河回族区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1872', '涧西区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1873', '吉利区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1874', '洛龙区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1875', '孟津县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1876', '新安县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1877', '栾川县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1878', '嵩县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1879', '汝阳县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1880', '宜阳县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1881', '洛宁县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1882', '伊川县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1883', '偃师市', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1884', '新华区', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1885', '卫东区', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1886', '石龙区', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1887', '湛河区', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1888', '宝丰县', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1889', '叶县', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1890', '鲁山县', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1891', '郏县', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1892', '舞钢市', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1893', '汝州市', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1894', '文峰区', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1895', '北关区', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1896', '殷都区', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1897', '龙安区', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1898', '安阳县', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1899', '汤阴县', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1900', '滑县', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1901', '内黄县', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1902', '林州市', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1903', '鹤山区', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1904', '山城区', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1905', '淇滨区', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1906', '浚县', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1907', '淇县', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1908', '红旗区', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1909', '卫滨区', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1910', '凤泉区', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1911', '牧野区', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1912', '新乡县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1913', '获嘉县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1914', '原阳县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1915', '延津县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1916', '封丘县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1917', '长垣县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1918', '卫辉市', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1919', '辉县市', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1920', '解放区', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1921', '中站区', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1922', '马村区', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1923', '山阳区', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1924', '修武县', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1925', '博爱县', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1926', '武陟县', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1927', '温县', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1928', '济源市', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1929', '沁阳市', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1930', '孟州市', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1931', '华龙区', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1932', '清丰县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1933', '南乐县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1934', '范县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1935', '台前县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1936', '濮阳县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1937', '魏都区', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1938', '许昌县', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1939', '鄢陵县', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1940', '襄城县', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1941', '禹州市', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1942', '长葛市', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1943', '源汇区', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1944', '郾城区', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1945', '召陵区', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1946', '舞阳县', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1947', '临颍县', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1948', '湖滨区', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1949', '渑池县', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1950', '陕县', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1951', '卢氏县', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1952', '义马市', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1953', '灵宝市', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1954', '宛城区', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1955', '卧龙区', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1956', '南召县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1957', '方城县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1958', '西峡县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1959', '镇平县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1960', '内乡县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1961', '淅川县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1962', '社旗县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1963', '唐河县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1964', '新野县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1965', '桐柏县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1966', '邓州市', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1967', '梁园区', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1968', '睢阳区', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1969', '民权县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1970', '睢县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1971', '宁陵县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1972', '柘城县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1973', '虞城县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1974', '夏邑县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1975', '永城市', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1976', '浉河区', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1977', '平桥区', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1978', '罗山县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1979', '光山县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1980', '新县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1981', '商城县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1982', '固始县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1983', '潢川县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1984', '淮滨县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1985', '息县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1986', '川汇区', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1987', '扶沟县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1988', '西华县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1989', '商水县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1990', '沈丘县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1991', '郸城县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1992', '淮阳县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1993', '太康县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1994', '鹿邑县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1995', '项城市', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1996', '驿城区', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1997', '西平县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1998', '上蔡县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('1999', '平舆县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2000', '正阳县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2001', '确山县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2002', '泌阳县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2003', '汝南县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2004', '遂平县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2005', '新蔡县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2006', '江岸区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2007', '江汉区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2008', '硚口区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2009', '汉阳区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2010', '武昌区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2011', '青山区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2012', '洪山区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2013', '东西湖区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2014', '汉南区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2015', '蔡甸区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2016', '江夏区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2017', '黄陂区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2018', '新洲区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2019', '黄石港区', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2020', '西塞山区', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2021', '下陆区', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2022', '铁山区', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2023', '阳新县', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2024', '大冶市', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2025', '茅箭区', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2026', '张湾区', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2027', '郧县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2028', '郧西县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2029', '竹山县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2030', '竹溪县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2031', '房县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2032', '丹江口市', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2033', '西陵区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2034', '伍家岗区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2035', '点军区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2036', '猇亭区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2037', '夷陵区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2038', '远安县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2039', '兴山县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2040', '秭归县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2041', '长阳土家族自治县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2042', '五峰土家族自治县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2043', '宜都市', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2044', '当阳市', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2045', '枝江市', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2046', '襄城区', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2047', '樊城区', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2048', '襄阳区', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2049', '南漳县', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2050', '谷城县', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2051', '保康县', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2052', '老河口市', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2053', '枣阳市', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2054', '宜城市', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2055', '梁子湖区', '0', '300', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2056', '华容区', '0', '300', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2057', '鄂城区', '0', '300', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2058', '东宝区', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2059', '掇刀区', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2060', '京山县', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2061', '沙洋县', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2062', '钟祥市', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2063', '孝南区', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2064', '孝昌县', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2065', '大悟县', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2066', '云梦县', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2067', '应城市', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2068', '安陆市', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2069', '汉川市', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2070', '沙市区', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2071', '荆州区', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2072', '公安县', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2073', '监利县', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2074', '江陵县', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2075', '石首市', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2076', '洪湖市', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2077', '松滋市', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2078', '黄州区', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2079', '团风县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2080', '红安县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2081', '罗田县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2082', '英山县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2083', '浠水县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2084', '蕲春县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2085', '黄梅县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2086', '麻城市', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2087', '武穴市', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2088', '咸安区', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2089', '嘉鱼县', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2090', '通城县', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2091', '崇阳县', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2092', '通山县', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2093', '赤壁市', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2094', '曾都区', '0', '306', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2095', '广水市', '0', '306', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2096', '恩施市', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2097', '利川市', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2098', '建始县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2099', '巴东县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2100', '宣恩县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2101', '咸丰县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2102', '来凤县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2103', '鹤峰县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2104', '芙蓉区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2105', '天心区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2106', '岳麓区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2107', '开福区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2108', '雨花区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2109', '长沙县', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2110', '望城县', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2111', '宁乡县', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2112', '浏阳市', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2113', '荷塘区', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2114', '芦淞区', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2115', '石峰区', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2116', '天元区', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2117', '株洲县', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2118', '攸县', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2119', '茶陵县', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2120', '炎陵县', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2121', '醴陵市', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2122', '雨湖区', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2123', '岳塘区', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2124', '湘潭县', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2125', '湘乡市', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2126', '韶山市', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2127', '珠晖区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2128', '雁峰区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2129', '石鼓区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2130', '蒸湘区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2131', '南岳区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2132', '衡阳县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2133', '衡南县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2134', '衡山县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2135', '衡东县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2136', '祁东县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2137', '耒阳市', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2138', '常宁市', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2139', '双清区', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2140', '大祥区', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2141', '北塔区', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2142', '邵东县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2143', '新邵县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2144', '邵阳县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2145', '隆回县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2146', '洞口县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2147', '绥宁县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2148', '新宁县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2149', '城步苗族自治县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2150', '武冈市', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2151', '岳阳楼区', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2152', '云溪区', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2153', '君山区', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2154', '岳阳县', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2155', '华容县', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2156', '湘阴县', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2157', '平江县', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2158', '汨罗市', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2159', '临湘市', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2160', '武陵区', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2161', '鼎城区', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2162', '安乡县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2163', '汉寿县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2164', '澧县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2165', '临澧县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2166', '桃源县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2167', '石门县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2168', '津市市', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2169', '永定区', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2170', '武陵源区', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2171', '慈利县', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2172', '桑植县', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2173', '资阳区', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2174', '赫山区', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2175', '南县', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2176', '桃江县', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2177', '安化县', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2178', '沅江市', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2179', '北湖区', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2180', '苏仙区', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2181', '桂阳县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2182', '宜章县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2183', '永兴县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2184', '嘉禾县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2185', '临武县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2186', '汝城县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2187', '桂东县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2188', '安仁县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2189', '资兴市', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2190', '零陵区', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2191', '冷水滩区', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2192', '祁阳县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2193', '东安县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2194', '双牌县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2195', '道县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2196', '江永县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2197', '宁远县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2198', '蓝山县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2199', '新田县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2200', '江华瑶族自治县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2201', '鹤城区', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2202', '中方县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2203', '沅陵县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2204', '辰溪县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2205', '溆浦县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2206', '会同县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2207', '麻阳苗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2208', '新晃侗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2209', '芷江侗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2210', '靖州苗族侗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2211', '通道侗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2212', '洪江市', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2213', '娄星区', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2214', '双峰县', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2215', '新化县', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2216', '冷水江市', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2217', '涟源市', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2218', '吉首市', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2219', '泸溪县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2220', '凤凰县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2221', '花垣县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2222', '保靖县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2223', '古丈县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2224', '永顺县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2225', '龙山县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2226', '荔湾区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2227', '越秀区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2228', '海珠区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2229', '天河区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2230', '白云区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2231', '黄埔区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2232', '番禺区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2233', '花都区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2234', '南沙区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2235', '萝岗区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2236', '增城市', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2237', '从化市', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2238', '武江区', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2239', '浈江区', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2240', '曲江区', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2241', '始兴县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2242', '仁化县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2243', '翁源县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2244', '乳源瑶族自治县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2245', '新丰县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2246', '乐昌市', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2247', '南雄市', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2248', '罗湖区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2249', '福田区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2250', '南山区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2251', '宝安区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2252', '龙岗区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2253', '盐田区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2254', '香洲区', '0', '329', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2255', '斗门区', '0', '329', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2256', '金湾区', '0', '329', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2257', '龙湖区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2258', '金平区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2259', '濠江区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2260', '潮阳区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2261', '潮南区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2262', '澄海区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2263', '南澳县', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2264', '禅城区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2265', '南海区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2266', '顺德区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2267', '三水区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2268', '高明区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2269', '蓬江区', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2270', '江海区', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2271', '新会区', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2272', '台山市', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2273', '开平市', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2274', '鹤山市', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2275', '恩平市', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2276', '赤坎区', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2277', '霞山区', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2278', '坡头区', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2279', '麻章区', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2280', '遂溪县', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2281', '徐闻县', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2282', '廉江市', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2283', '雷州市', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2284', '吴川市', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2285', '茂南区', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2286', '茂港区', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2287', '电白县', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2288', '高州市', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2289', '化州市', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2290', '信宜市', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2291', '端州区', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2292', '鼎湖区', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2293', '广宁县', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2294', '怀集县', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2295', '封开县', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2296', '德庆县', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2297', '高要市', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2298', '四会市', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2299', '惠城区', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2300', '惠阳区', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2301', '博罗县', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2302', '惠东县', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2303', '龙门县', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2304', '梅江区', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2305', '梅县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2306', '大埔县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2307', '丰顺县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2308', '五华县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2309', '平远县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2310', '蕉岭县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2311', '兴宁市', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2312', '城区', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2313', '海丰县', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2314', '陆河县', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2315', '陆丰市', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2316', '源城区', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2317', '紫金县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2318', '龙川县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2319', '连平县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2320', '和平县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2321', '东源县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2322', '江城区', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2323', '阳西县', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2324', '阳东县', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2325', '阳春市', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2326', '清城区', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2327', '佛冈县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2328', '阳山县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2329', '连山壮族瑶族自治县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2330', '连南瑶族自治县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2331', '清新县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2332', '英德市', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2333', '连州市', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2334', '湘桥区', '0', '344', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2335', '潮安县', '0', '344', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2336', '饶平县', '0', '344', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2337', '榕城区', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2338', '揭东县', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2339', '揭西县', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2340', '惠来县', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2341', '普宁市', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2342', '云城区', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2343', '新兴县', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2344', '郁南县', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2345', '云安县', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2346', '罗定市', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2347', '兴宁区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2348', '青秀区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2349', '江南区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2350', '西乡塘区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2351', '良庆区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2352', '邕宁区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2353', '武鸣县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2354', '隆安县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2355', '马山县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2356', '上林县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2357', '宾阳县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2358', '横县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2359', '城中区', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2360', '鱼峰区', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2361', '柳南区', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2362', '柳北区', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2363', '柳江县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2364', '柳城县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2365', '鹿寨县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2366', '融安县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2367', '融水苗族自治县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2368', '三江侗族自治县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2369', '秀峰区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2370', '叠彩区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2371', '象山区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2372', '七星区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2373', '雁山区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2374', '阳朔县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2375', '临桂县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2376', '灵川县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2377', '全州县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2378', '兴安县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2379', '永福县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2380', '灌阳县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2381', '龙胜各族自治县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2382', '资源县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2383', '平乐县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2384', '荔蒲县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2385', '恭城瑶族自治县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2386', '万秀区', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2387', '蝶山区', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2388', '长洲区', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2389', '苍梧县', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2390', '藤县', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2391', '蒙山县', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2392', '岑溪市', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2393', '海城区', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2394', '银海区', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2395', '铁山港区', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2396', '合浦县', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2397', '港口区', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2398', '防城区', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2399', '上思县', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2400', '东兴市', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2401', '钦南区', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2402', '钦北区', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2403', '灵山县', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2404', '浦北县', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2405', '港北区', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2406', '港南区', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2407', '覃塘区', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2408', '平南县', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2409', '桂平市', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2410', '玉州区', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2411', '容县', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2412', '陆川县', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2413', '博白县', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2414', '兴业县', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2415', '北流市', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2416', '右江区', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2417', '田阳县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2418', '田东县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2419', '平果县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2420', '德保县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2421', '靖西县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2422', '那坡县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2423', '凌云县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2424', '乐业县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2425', '田林县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2426', '西林县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2427', '隆林各族自治县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2428', '八步区', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2429', '昭平县', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2430', '钟山县', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2431', '富川瑶族自治县', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2432', '金城江区', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2433', '南丹县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2434', '天峨县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2435', '凤山县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2436', '东兰县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2437', '罗城仫佬族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2438', '环江毛南族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2439', '巴马瑶族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2440', '都安瑶族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2441', '大化瑶族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2442', '宜州市', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2443', '兴宾区', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2444', '忻城县', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2445', '象州县', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2446', '武宣县', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2447', '金秀瑶族自治县', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2448', '合山市', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2449', '江洲区', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2450', '扶绥县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2451', '宁明县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2452', '龙州县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2453', '大新县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2454', '天等县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2455', '凭祥市', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2456', '秀英区', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2457', '龙华区', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2458', '琼山区', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2459', '美兰区', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2460', '锦江区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2461', '青羊区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2462', '金牛区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2463', '武侯区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2464', '成华区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2465', '龙泉驿区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2466', '青白江区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2467', '新都区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2468', '温江区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2469', '金堂县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2470', '双流县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2471', '郫县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2472', '大邑县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2473', '蒲江县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2474', '新津县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2475', '都江堰市', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2476', '彭州市', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2477', '邛崃市', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2478', '崇州市', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2479', '自流井区', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2480', '贡井区', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2481', '大安区', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2482', '沿滩区', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2483', '荣县', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2484', '富顺县', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2485', '东区', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2486', '西区', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2487', '仁和区', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2488', '米易县', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2489', '盐边县', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2490', '江阳区', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2491', '纳溪区', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2492', '龙马潭区', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2493', '泸县', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2494', '合江县', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2495', '叙永县', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2496', '古蔺县', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2497', '旌阳区', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2498', '中江县', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2499', '罗江县', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2500', '广汉市', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2501', '什邡市', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2502', '绵竹市', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2503', '涪城区', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2504', '游仙区', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2505', '三台县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2506', '盐亭县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2507', '安县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2508', '梓潼县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2509', '北川羌族自治县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2510', '平武县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2511', '江油市', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2512', '市中区', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2513', '元坝区', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2514', '朝天区', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2515', '旺苍县', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2516', '青川县', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2517', '剑阁县', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2518', '苍溪县', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2519', '船山区', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2520', '安居区', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2521', '蓬溪县', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2522', '射洪县', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2523', '大英县', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2524', '市中区', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2525', '东兴区', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2526', '威远县', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2527', '资中县', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2528', '隆昌县', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2529', '市中区', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2530', '沙湾区', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2531', '五通桥区', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2532', '金口河区', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2533', '犍为县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2534', '井研县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2535', '夹江县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2536', '沐川县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2537', '峨边彝族自治县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2538', '马边彝族自治县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2539', '峨眉山市', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2540', '顺庆区', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2541', '高坪区', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2542', '嘉陵区', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2543', '南部县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2544', '营山县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2545', '蓬安县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2546', '仪陇县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2547', '西充县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2548', '阆中市', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2549', '东坡区', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2550', '仁寿县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2551', '彭山县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2552', '洪雅县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2553', '丹棱县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2554', '青神县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2555', '翠屏区', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2556', '宜宾县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2557', '南溪县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2558', '江安县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2559', '长宁县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2560', '高县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2561', '珙县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2562', '筠连县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2563', '兴文县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2564', '屏山县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2565', '广安区', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2566', '岳池县', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2567', '武胜县', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2568', '邻水县', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2569', '华蓥市', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2570', '通川区', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2571', '达县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2572', '宣汉县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2573', '开江县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2574', '大竹县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2575', '渠县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2576', '万源市', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2577', '雨城区', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2578', '名山县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2579', '荥经县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2580', '汉源县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2581', '石棉县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2582', '天全县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2583', '芦山县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2584', '宝兴县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2585', '巴州区', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2586', '通江县', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2587', '南江县', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2588', '平昌县', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2589', '雁江区', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2590', '安岳县', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2591', '乐至县', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2592', '简阳市', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2593', '汶川县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2594', '理县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2595', '茂县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2596', '松潘县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2597', '九寨沟县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2598', '金川县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2599', '小金县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2600', '黑水县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2601', '马尔康县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2602', '壤塘县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2603', '阿坝县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2604', '若尔盖县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2605', '红原县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2606', '康定县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2607', '泸定县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2608', '丹巴县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2609', '九龙县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2610', '雅江县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2611', '道孚县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2612', '炉霍县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2613', '甘孜县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2614', '新龙县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2615', '德格县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2616', '白玉县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2617', '石渠县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2618', '色达县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2619', '理塘县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2620', '巴塘县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2621', '乡城县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2622', '稻城县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2623', '得荣县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2624', '西昌市', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2625', '木里藏族自治县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2626', '盐源县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2627', '德昌县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2628', '会理县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2629', '会东县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2630', '宁南县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2631', '普格县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2632', '布拖县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2633', '金阳县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2634', '昭觉县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2635', '喜德县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2636', '冕宁县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2637', '越西县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2638', '甘洛县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2639', '美姑县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2640', '雷波县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2641', '南明区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2642', '云岩区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2643', '花溪区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2644', '乌当区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2645', '白云区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2646', '小河区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2647', '开阳县', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2648', '息烽县', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2649', '修文县', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2650', '清镇市', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2651', '钟山区', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2652', '六枝特区', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2653', '水城县', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2654', '盘县', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2655', '红花岗区', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2656', '汇川区', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2657', '遵义县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2658', '桐梓县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2659', '绥阳县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2660', '正安县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2661', '道真仡佬族苗族自治县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2662', '务川仡佬族苗族自治县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2663', '凤冈县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2664', '湄潭县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2665', '余庆县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2666', '习水县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2667', '赤水市', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2668', '仁怀市', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2669', '西秀区', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2670', '平坝县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2671', '普定县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2672', '镇宁布依族苗族自治县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2673', '关岭布依族苗族自治县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2674', '紫云苗族布依族自治县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2675', '铜仁市', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2676', '江口县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2677', '玉屏侗族自治县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2678', '石阡县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2679', '思南县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2680', '印江土家族苗族自治县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2681', '德江县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2682', '沿河土家族自治县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2683', '松桃苗族自治县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2684', '万山特区', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2685', '兴义市', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2686', '兴仁县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2687', '普安县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2688', '晴隆县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2689', '贞丰县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2690', '望谟县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2691', '册亨县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2692', '安龙县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2693', '毕节市', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2694', '大方县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2695', '黔西县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2696', '金沙县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2697', '织金县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2698', '纳雍县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2699', '威宁彝族回族苗族自治县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2700', '赫章县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2701', '凯里市', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2702', '黄平县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2703', '施秉县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2704', '三穗县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2705', '镇远县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2706', '岑巩县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2707', '天柱县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2708', '锦屏县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2709', '剑河县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2710', '台江县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2711', '黎平县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2712', '榕江县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2713', '从江县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2714', '雷山县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2715', '麻江县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2716', '丹寨县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2717', '都匀市', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2718', '福泉市', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2719', '荔波县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2720', '贵定县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2721', '瓮安县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2722', '独山县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2723', '平塘县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2724', '罗甸县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2725', '长顺县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2726', '龙里县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2727', '惠水县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2728', '三都水族自治县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2729', '五华区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2730', '盘龙区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2731', '官渡区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2732', '西山区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2733', '东川区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2734', '呈贡县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2735', '晋宁县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2736', '富民县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2737', '宜良县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2738', '石林彝族自治县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2739', '嵩明县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2740', '禄劝彝族苗族自治县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2741', '寻甸回族彝族自治县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2742', '安宁市', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2743', '麒麟区', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2744', '马龙县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2745', '陆良县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2746', '师宗县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2747', '罗平县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2748', '富源县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2749', '会泽县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2750', '沾益县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2751', '宣威市', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2752', '红塔区', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2753', '江川县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2754', '澄江县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2755', '通海县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2756', '华宁县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2757', '易门县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2758', '峨山彝族自治县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2759', '新平彝族傣族自治县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2760', '元江哈尼族彝族傣族自治县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2761', '隆阳区', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2762', '施甸县', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2763', '腾冲县', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2764', '龙陵县', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2765', '昌宁县', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2766', '昭阳区', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2767', '鲁甸县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2768', '巧家县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2769', '盐津县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2770', '大关县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2771', '永善县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2772', '绥江县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2773', '镇雄县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2774', '彝良县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2775', '威信县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2776', '水富县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2777', '古城区', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2778', '玉龙纳西族自治县', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2779', '永胜县', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2780', '华坪县', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2781', '宁蒗彝族自治县', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2782', '翠云区', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2783', '普洱哈尼族彝族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2784', '墨江哈尼族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2785', '景东彝族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2786', '景谷傣族彝族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2787', '镇沅彝族哈尼族拉祜族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2788', '江城哈尼族彝族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2789', '孟连傣族拉祜族佤族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2790', '澜沧拉祜族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2791', '西盟佤族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2792', '临翔区', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2793', '凤庆县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2794', '云县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2795', '永德县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2796', '镇康县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2797', '双江拉祜族佤族布朗族傣族自治县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2798', '耿马傣族佤族自治县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2799', '沧源佤族自治县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2800', '楚雄市', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2801', '双柏县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2802', '牟定县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2803', '南华县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2804', '姚安县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2805', '大姚县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2806', '永仁县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2807', '元谋县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2808', '武定县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2809', '禄丰县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2810', '个旧市', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2811', '开远市', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2812', '蒙自县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2813', '屏边苗族自治县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2814', '建水县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2815', '石屏县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2816', '弥勒县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2817', '泸西县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2818', '元阳县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2819', '红河县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2820', '金平苗族瑶族傣族自治县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2821', '绿春县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2822', '河口瑶族自治县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2823', '文山县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2824', '砚山县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2825', '西畴县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2826', '麻栗坡县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2827', '马关县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2828', '丘北县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2829', '广南县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2830', '富宁县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2831', '景洪市', '0', '423', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2832', '勐海县', '0', '423', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2833', '勐腊县', '0', '423', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2834', '大理市', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2835', '漾濞彝族自治县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2836', '祥云县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2837', '宾川县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2838', '弥渡县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2839', '南涧彝族自治县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2840', '巍山彝族回族自治县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2841', '永平县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2842', '云龙县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2843', '洱源县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2844', '剑川县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2845', '鹤庆县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2846', '瑞丽市', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2847', '潞西市', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2848', '梁河县', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2849', '盈江县', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2850', '陇川县', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2851', '泸水县', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2852', '福贡县', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2853', '贡山独龙族怒族自治县', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2854', '兰坪白族普米族自治县', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2855', '香格里拉县', '0', '427', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2856', '德钦县', '0', '427', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2857', '维西傈僳族自治县', '0', '427', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2858', '城关区', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2859', '林周县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2860', '当雄县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2861', '尼木县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2862', '曲水县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2863', '堆龙德庆县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2864', '达孜县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2865', '墨竹工卡县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2866', '昌都县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2867', '江达县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2868', '贡觉县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2869', '类乌齐县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2870', '丁青县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2871', '察雅县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2872', '八宿县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2873', '左贡县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2874', '芒康县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2875', '洛隆县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2876', '边坝县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2877', '乃东县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2878', '扎囊县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2879', '贡嘎县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2880', '桑日县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2881', '琼结县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2882', '曲松县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2883', '措美县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2884', '洛扎县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2885', '加查县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2886', '隆子县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2887', '错那县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2888', '浪卡子县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2889', '日喀则市', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2890', '南木林县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2891', '江孜县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2892', '定日县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2893', '萨迦县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2894', '拉孜县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2895', '昂仁县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2896', '谢通门县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2897', '白朗县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2898', '仁布县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2899', '康马县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2900', '定结县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2901', '仲巴县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2902', '亚东县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2903', '吉隆县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2904', '聂拉木县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2905', '萨嘎县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2906', '岗巴县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2907', '那曲县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2908', '嘉黎县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2909', '比如县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2910', '聂荣县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2911', '安多县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2912', '申扎县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2913', '索县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2914', '班戈县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2915', '巴青县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2916', '尼玛县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2917', '普兰县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2918', '札达县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2919', '噶尔县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2920', '日土县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2921', '革吉县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2922', '改则县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2923', '措勤县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2924', '林芝县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2925', '工布江达县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2926', '米林县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2927', '墨脱县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2928', '波密县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2929', '察隅县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2930', '朗县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2931', '新城区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2932', '碑林区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2933', '莲湖区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2934', '灞桥区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2935', '未央区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2936', '雁塔区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2937', '阎良区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2938', '临潼区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2939', '长安区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2940', '蓝田县', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2941', '周至县', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2942', '户县', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2943', '高陵县', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2944', '王益区', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2945', '印台区', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2946', '耀州区', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2947', '宜君县', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2948', '渭滨区', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2949', '金台区', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2950', '陈仓区', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2951', '凤翔县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2952', '岐山县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2953', '扶风县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2954', '眉县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2955', '陇县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2956', '千阳县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2957', '麟游县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2958', '凤县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2959', '太白县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2960', '秦都区', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2961', '杨凌区', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2962', '渭城区', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2963', '三原县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2964', '泾阳县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2965', '乾县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2966', '礼泉县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2967', '永寿县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2968', '彬县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2969', '长武县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2970', '旬邑县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2971', '淳化县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2972', '武功县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2973', '兴平市', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2974', '临渭区', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2975', '华县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2976', '潼关县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2977', '大荔县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2978', '合阳县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2979', '澄城县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2980', '蒲城县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2981', '白水县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2982', '富平县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2983', '韩城市', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2984', '华阴市', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2985', '宝塔区', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2986', '延长县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2987', '延川县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2988', '子长县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2989', '安塞县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2990', '志丹县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2991', '吴起县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2992', '甘泉县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2993', '富县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2994', '洛川县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2995', '宜川县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2996', '黄龙县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2997', '黄陵县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2998', '汉台区', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('2999', '南郑县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3000', '城固县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3001', '洋县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3002', '西乡县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3003', '勉县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3004', '宁强县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3005', '略阳县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3006', '镇巴县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3007', '留坝县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3008', '佛坪县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3009', '榆阳区', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3010', '神木县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3011', '府谷县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3012', '横山县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3013', '靖边县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3014', '定边县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3015', '绥德县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3016', '米脂县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3017', '佳县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3018', '吴堡县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3019', '清涧县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3020', '子洲县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3021', '汉滨区', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3022', '汉阴县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3023', '石泉县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3024', '宁陕县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3025', '紫阳县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3026', '岚皋县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3027', '平利县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3028', '镇坪县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3029', '旬阳县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3030', '白河县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3031', '商州区', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3032', '洛南县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3033', '丹凤县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3034', '商南县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3035', '山阳县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3036', '镇安县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3037', '柞水县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3038', '城关区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3039', '七里河区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3040', '西固区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3041', '安宁区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3042', '红古区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3043', '永登县', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3044', '皋兰县', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3045', '榆中县', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3046', '金川区', '0', '447', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3047', '永昌县', '0', '447', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3048', '白银区', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3049', '平川区', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3050', '靖远县', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3051', '会宁县', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3052', '景泰县', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3053', '秦城区', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3054', '北道区', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3055', '清水县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3056', '秦安县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3057', '甘谷县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3058', '武山县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3059', '张家川回族自治县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3060', '凉州区', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3061', '民勤县', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3062', '古浪县', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3063', '天祝藏族自治县', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3064', '甘州区', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3065', '肃南裕固族自治县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3066', '民乐县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3067', '临泽县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3068', '高台县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3069', '山丹县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3070', '崆峒区', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3071', '泾川县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3072', '灵台县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3073', '崇信县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3074', '华亭县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3075', '庄浪县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3076', '静宁县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3077', '肃州区', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3078', '金塔县', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3079', '瓜州县', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3080', '肃北蒙古族自治县', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3081', '阿克塞哈萨克族自治县', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3082', '玉门市', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3083', '敦煌市', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3084', '西峰区', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3085', '庆城县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3086', '环县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3087', '华池县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3088', '合水县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3089', '正宁县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3090', '宁县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3091', '镇原县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3092', '安定区', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3093', '通渭县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3094', '陇西县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3095', '渭源县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3096', '临洮县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3097', '漳县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3098', '岷县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3099', '武都区', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3100', '成县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3101', '文县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3102', '宕昌县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3103', '康县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3104', '西和县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3105', '礼县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3106', '徽县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3107', '两当县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3108', '临夏市', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3109', '临夏县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3110', '康乐县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3111', '永靖县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3112', '广河县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3113', '和政县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3114', '东乡族自治县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3115', '积石山保安族东乡族撒拉族自治县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3116', '合作市', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3117', '临潭县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3118', '卓尼县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3119', '舟曲县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3120', '迭部县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3121', '玛曲县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3122', '碌曲县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3123', '夏河县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3124', '城东区', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3125', '城中区', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3126', '城西区', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3127', '城北区', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3128', '大通回族土族自治县', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3129', '湟中县', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3130', '湟源县', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3131', '平安县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3132', '民和回族土族自治县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3133', '乐都县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3134', '互助土族自治县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3135', '化隆回族自治县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3136', '循化撒拉族自治县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3137', '门源回族自治县', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3138', '祁连县', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3139', '海晏县', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3140', '刚察县', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3141', '同仁县', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3142', '尖扎县', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3143', '泽库县', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3144', '河南蒙古族自治县', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3145', '共和县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3146', '同德县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3147', '贵德县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3148', '兴海县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3149', '贵南县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3150', '玛沁县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3151', '班玛县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3152', '甘德县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3153', '达日县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3154', '久治县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3155', '玛多县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3156', '玉树县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3157', '杂多县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3158', '称多县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3159', '治多县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3160', '囊谦县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3161', '曲麻莱县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3162', '格尔木市', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3163', '德令哈市', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3164', '乌兰县', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3165', '都兰县', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3166', '天峻县', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3167', '兴庆区', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3168', '西夏区', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3169', '金凤区', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3170', '永宁县', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3171', '贺兰县', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3172', '灵武市', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3173', '大武口区', '0', '468', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3174', '惠农区', '0', '468', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3175', '平罗县', '0', '468', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3176', '利通区', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3177', '盐池县', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3178', '同心县', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3179', '青铜峡市', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3180', '原州区', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3181', '西吉县', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3182', '隆德县', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3183', '泾源县', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3184', '彭阳县', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3185', '沙坡头区', '0', '471', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3186', '中宁县', '0', '471', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3187', '海原县', '0', '471', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3188', '天山区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3189', '沙依巴克区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3190', '新市区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3191', '水磨沟区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3192', '头屯河区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3193', '达坂城区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3194', '东山区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3195', '乌鲁木齐县', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3196', '独山子区', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3197', '克拉玛依区', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3198', '白碱滩区', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3199', '乌尔禾区', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3200', '吐鲁番市', '0', '474', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3201', '鄯善县', '0', '474', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3202', '托克逊县', '0', '474', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3203', '哈密市', '0', '475', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3204', '巴里坤哈萨克自治县', '0', '475', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3205', '伊吾县', '0', '475', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3206', '昌吉市', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3207', '阜康市', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3208', '米泉市', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3209', '呼图壁县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3210', '玛纳斯县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3211', '奇台县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3212', '吉木萨尔县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3213', '木垒哈萨克自治县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3214', '博乐市', '0', '477', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3215', '精河县', '0', '477', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3216', '温泉县', '0', '477', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3217', '库尔勒市', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3218', '轮台县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3219', '尉犁县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3220', '若羌县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3221', '且末县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3222', '焉耆回族自治县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3223', '和静县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3224', '和硕县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3225', '博湖县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3226', '阿克苏市', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3227', '温宿县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3228', '库车县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3229', '沙雅县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3230', '新和县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3231', '拜城县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3232', '乌什县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3233', '阿瓦提县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3234', '柯坪县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3235', '阿图什市', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3236', '阿克陶县', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3237', '阿合奇县', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3238', '乌恰县', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3239', '喀什市', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3240', '疏附县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3241', '疏勒县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3242', '英吉沙县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3243', '泽普县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3244', '莎车县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3245', '叶城县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3246', '麦盖提县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3247', '岳普湖县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3248', '伽师县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3249', '巴楚县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3250', '塔什库尔干塔吉克自治县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3251', '和田市', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3252', '和田县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3253', '墨玉县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3254', '皮山县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3255', '洛浦县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3256', '策勒县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3257', '于田县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3258', '民丰县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3259', '伊宁市', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3260', '奎屯市', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3261', '伊宁县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3262', '察布查尔锡伯自治县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3263', '霍城县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3264', '巩留县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3265', '新源县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3266', '昭苏县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3267', '特克斯县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3268', '尼勒克县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3269', '塔城市', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3270', '乌苏市', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3271', '额敏县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3272', '沙湾县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3273', '托里县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3274', '裕民县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3275', '和布克赛尔蒙古自治县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3276', '阿勒泰市', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3277', '布尔津县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3278', '富蕴县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3279', '福海县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3280', '哈巴河县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3281', '青河县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3282', '吉木乃县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3358', '钓鱼岛', '', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `cp_linkage` VALUES ('3359', '钓鱼岛', '', '3358', '0', '', '1', '0', '', null, '0');

-- ----------------------------
-- Table structure for `cp_log`
-- ----------------------------
DROP TABLE IF EXISTS `cp_log`;
CREATE TABLE `cp_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`logid`),
  KEY `module` (`module`,`file`,`action`),
  KEY `username` (`username`,`action`)
) ENGINE=MyISAM AUTO_INCREMENT=1108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_log
-- ----------------------------
INSERT INTO `cp_log` VALUES ('1', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2018-06-06 15:50:27');
INSERT INTO `cp_log` VALUES ('2', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2018-06-06 15:50:40');
INSERT INTO `cp_log` VALUES ('3', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '127.0.0.1', '2018-06-06 15:50:42');
INSERT INTO `cp_log` VALUES ('4', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '127.0.0.1', '2018-06-06 15:51:18');
INSERT INTO `cp_log` VALUES ('5', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '127.0.0.1', '2018-06-06 15:51:38');
INSERT INTO `cp_log` VALUES ('6', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2018-06-06 15:55:27');
INSERT INTO `cp_log` VALUES ('7', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2018-06-06 15:55:27');
INSERT INTO `cp_log` VALUES ('8', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2018-06-06 15:55:41');
INSERT INTO `cp_log` VALUES ('9', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2018-06-06 15:55:43');
INSERT INTO `cp_log` VALUES ('10', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2018-06-06 15:55:43');
INSERT INTO `cp_log` VALUES ('11', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2018-06-06 15:55:50');
INSERT INTO `cp_log` VALUES ('12', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:07:37');
INSERT INTO `cp_log` VALUES ('13', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:07:27');
INSERT INTO `cp_log` VALUES ('14', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:07:50');
INSERT INTO `cp_log` VALUES ('15', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:07:49');
INSERT INTO `cp_log` VALUES ('16', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:07:48');
INSERT INTO `cp_log` VALUES ('17', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:07:49');
INSERT INTO `cp_log` VALUES ('18', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:25:11');
INSERT INTO `cp_log` VALUES ('19', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:25:18');
INSERT INTO `cp_log` VALUES ('20', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:25:27');
INSERT INTO `cp_log` VALUES ('21', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:25:33');
INSERT INTO `cp_log` VALUES ('22', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:25:37');
INSERT INTO `cp_log` VALUES ('23', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:25:38');
INSERT INTO `cp_log` VALUES ('24', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:26:24');
INSERT INTO `cp_log` VALUES ('25', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:26:46');
INSERT INTO `cp_log` VALUES ('26', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:27:04');
INSERT INTO `cp_log` VALUES ('27', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:27:07');
INSERT INTO `cp_log` VALUES ('28', '', '0', 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', '1', 'any', '127.0.0.1', '2018-06-06 16:28:00');
INSERT INTO `cp_log` VALUES ('29', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:28:24');
INSERT INTO `cp_log` VALUES ('30', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:28:27');
INSERT INTO `cp_log` VALUES ('31', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:28:28');
INSERT INTO `cp_log` VALUES ('32', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:28:38');
INSERT INTO `cp_log` VALUES ('33', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:29:58');
INSERT INTO `cp_log` VALUES ('34', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:30:02');
INSERT INTO `cp_log` VALUES ('35', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:30:02');
INSERT INTO `cp_log` VALUES ('36', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:30:04');
INSERT INTO `cp_log` VALUES ('37', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:30:07');
INSERT INTO `cp_log` VALUES ('38', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:30:09');
INSERT INTO `cp_log` VALUES ('39', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:30:10');
INSERT INTO `cp_log` VALUES ('40', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:30:13');
INSERT INTO `cp_log` VALUES ('41', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:30:17');
INSERT INTO `cp_log` VALUES ('42', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:30:25');
INSERT INTO `cp_log` VALUES ('43', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:30:29');
INSERT INTO `cp_log` VALUES ('44', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:30:31');
INSERT INTO `cp_log` VALUES ('45', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:30:32');
INSERT INTO `cp_log` VALUES ('46', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:31:03');
INSERT INTO `cp_log` VALUES ('47', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:31:09');
INSERT INTO `cp_log` VALUES ('48', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:31:13');
INSERT INTO `cp_log` VALUES ('49', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:31:49');
INSERT INTO `cp_log` VALUES ('50', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:31:56');
INSERT INTO `cp_log` VALUES ('51', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:31:59');
INSERT INTO `cp_log` VALUES ('52', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'any', '127.0.0.1', '2018-06-06 16:32:14');
INSERT INTO `cp_log` VALUES ('53', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:32:22');
INSERT INTO `cp_log` VALUES ('54', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:32:29');
INSERT INTO `cp_log` VALUES ('55', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:32:32');
INSERT INTO `cp_log` VALUES ('56', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:32:34');
INSERT INTO `cp_log` VALUES ('57', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:32:41');
INSERT INTO `cp_log` VALUES ('58', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:32:44');
INSERT INTO `cp_log` VALUES ('59', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:33:04');
INSERT INTO `cp_log` VALUES ('60', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:33:07');
INSERT INTO `cp_log` VALUES ('61', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:33:10');
INSERT INTO `cp_log` VALUES ('62', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:33:17');
INSERT INTO `cp_log` VALUES ('63', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:33:23');
INSERT INTO `cp_log` VALUES ('64', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:33:25');
INSERT INTO `cp_log` VALUES ('65', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:33:37');
INSERT INTO `cp_log` VALUES ('66', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:33:44');
INSERT INTO `cp_log` VALUES ('67', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:33:47');
INSERT INTO `cp_log` VALUES ('68', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:33:48');
INSERT INTO `cp_log` VALUES ('69', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:34:06');
INSERT INTO `cp_log` VALUES ('70', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:34:10');
INSERT INTO `cp_log` VALUES ('71', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:34:14');
INSERT INTO `cp_log` VALUES ('72', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:34:18');
INSERT INTO `cp_log` VALUES ('73', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:34:22');
INSERT INTO `cp_log` VALUES ('74', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:34:23');
INSERT INTO `cp_log` VALUES ('75', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'any', '127.0.0.1', '2018-06-06 16:34:27');
INSERT INTO `cp_log` VALUES ('76', '', '0', 'admin', '', 'googlesitemap', '?m=admin&c=googlesitemap&a=set', '', '1', 'any', '127.0.0.1', '2018-06-06 16:34:39');
INSERT INTO `cp_log` VALUES ('77', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:34:59');
INSERT INTO `cp_log` VALUES ('78', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:35:03');
INSERT INTO `cp_log` VALUES ('79', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:35:06');
INSERT INTO `cp_log` VALUES ('80', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:35:20');
INSERT INTO `cp_log` VALUES ('81', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:35:22');
INSERT INTO `cp_log` VALUES ('82', '', '0', 'member', '', 'member_menu', '?m=member&c=member_menu&a=manage', '', '1', 'any', '127.0.0.1', '2018-06-06 16:35:28');
INSERT INTO `cp_log` VALUES ('83', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:35:30');
INSERT INTO `cp_log` VALUES ('84', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:35:36');
INSERT INTO `cp_log` VALUES ('85', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:35:38');
INSERT INTO `cp_log` VALUES ('86', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:35:47');
INSERT INTO `cp_log` VALUES ('87', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:35:52');
INSERT INTO `cp_log` VALUES ('88', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:35:54');
INSERT INTO `cp_log` VALUES ('89', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:36:06');
INSERT INTO `cp_log` VALUES ('90', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:36:12');
INSERT INTO `cp_log` VALUES ('91', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:36:15');
INSERT INTO `cp_log` VALUES ('92', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:36:25');
INSERT INTO `cp_log` VALUES ('93', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:36:31');
INSERT INTO `cp_log` VALUES ('94', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:36:34');
INSERT INTO `cp_log` VALUES ('95', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:36:36');
INSERT INTO `cp_log` VALUES ('96', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:36:45');
INSERT INTO `cp_log` VALUES ('97', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:36:48');
INSERT INTO `cp_log` VALUES ('98', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:37:03');
INSERT INTO `cp_log` VALUES ('99', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:37:12');
INSERT INTO `cp_log` VALUES ('100', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:37:16');
INSERT INTO `cp_log` VALUES ('101', '', '0', 'admin', '', 'urlrule', '?m=admin&c=urlrule&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:37:35');
INSERT INTO `cp_log` VALUES ('102', '', '0', 'admin', '', 'badword', '?m=admin&c=badword&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 16:37:48');
INSERT INTO `cp_log` VALUES ('103', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:37:58');
INSERT INTO `cp_log` VALUES ('104', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:38:03');
INSERT INTO `cp_log` VALUES ('105', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:38:07');
INSERT INTO `cp_log` VALUES ('106', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:38:16');
INSERT INTO `cp_log` VALUES ('107', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:38:22');
INSERT INTO `cp_log` VALUES ('108', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:38:26');
INSERT INTO `cp_log` VALUES ('109', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:38:28');
INSERT INTO `cp_log` VALUES ('110', '', '0', 'admin', '', 'ipbanned', '?m=admin&c=ipbanned&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 16:38:45');
INSERT INTO `cp_log` VALUES ('111', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:39:04');
INSERT INTO `cp_log` VALUES ('112', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:39:07');
INSERT INTO `cp_log` VALUES ('113', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:39:08');
INSERT INTO `cp_log` VALUES ('114', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:39:18');
INSERT INTO `cp_log` VALUES ('115', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:39:27');
INSERT INTO `cp_log` VALUES ('116', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:39:28');
INSERT INTO `cp_log` VALUES ('117', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:39:42');
INSERT INTO `cp_log` VALUES ('118', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:39:46');
INSERT INTO `cp_log` VALUES ('119', '', '0', 'admin', '', 'admin_manage', '?m=admin&c=admin_manage&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:40:23');
INSERT INTO `cp_log` VALUES ('120', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:40:29');
INSERT INTO `cp_log` VALUES ('121', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:40:47');
INSERT INTO `cp_log` VALUES ('122', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 16:40:51');
INSERT INTO `cp_log` VALUES ('123', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:15:44');
INSERT INTO `cp_log` VALUES ('124', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:15:56');
INSERT INTO `cp_log` VALUES ('125', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-06 17:16:05');
INSERT INTO `cp_log` VALUES ('126', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-06 17:16:10');
INSERT INTO `cp_log` VALUES ('127', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-06 17:16:21');
INSERT INTO `cp_log` VALUES ('128', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-06 17:16:29');
INSERT INTO `cp_log` VALUES ('129', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-06 17:16:39');
INSERT INTO `cp_log` VALUES ('130', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-06 17:16:45');
INSERT INTO `cp_log` VALUES ('131', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-06 17:16:50');
INSERT INTO `cp_log` VALUES ('132', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-06 17:16:54');
INSERT INTO `cp_log` VALUES ('133', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-06 17:17:01');
INSERT INTO `cp_log` VALUES ('134', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-06 17:17:12');
INSERT INTO `cp_log` VALUES ('135', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-06 17:17:16');
INSERT INTO `cp_log` VALUES ('136', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-06 17:17:23');
INSERT INTO `cp_log` VALUES ('137', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:17:39');
INSERT INTO `cp_log` VALUES ('138', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:18:20');
INSERT INTO `cp_log` VALUES ('139', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:18:35');
INSERT INTO `cp_log` VALUES ('140', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:19:11');
INSERT INTO `cp_log` VALUES ('141', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:19:13');
INSERT INTO `cp_log` VALUES ('142', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:19:13');
INSERT INTO `cp_log` VALUES ('143', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-06 17:19:58');
INSERT INTO `cp_log` VALUES ('144', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:20:04');
INSERT INTO `cp_log` VALUES ('145', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:20:27');
INSERT INTO `cp_log` VALUES ('146', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:20:35');
INSERT INTO `cp_log` VALUES ('147', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:20:49');
INSERT INTO `cp_log` VALUES ('148', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:20:53');
INSERT INTO `cp_log` VALUES ('149', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:21:01');
INSERT INTO `cp_log` VALUES ('150', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:21:09');
INSERT INTO `cp_log` VALUES ('151', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-06 17:21:24');
INSERT INTO `cp_log` VALUES ('152', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:21:29');
INSERT INTO `cp_log` VALUES ('153', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:21:31');
INSERT INTO `cp_log` VALUES ('154', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:21:35');
INSERT INTO `cp_log` VALUES ('155', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:21:38');
INSERT INTO `cp_log` VALUES ('156', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:21:47');
INSERT INTO `cp_log` VALUES ('157', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:22:04');
INSERT INTO `cp_log` VALUES ('158', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:22:30');
INSERT INTO `cp_log` VALUES ('159', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-06 17:22:37');
INSERT INTO `cp_log` VALUES ('160', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:22:46');
INSERT INTO `cp_log` VALUES ('161', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:22:53');
INSERT INTO `cp_log` VALUES ('162', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-06 17:23:49');
INSERT INTO `cp_log` VALUES ('163', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-06 17:23:53');
INSERT INTO `cp_log` VALUES ('164', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', '1', 'any', '127.0.0.1', '2018-06-06 17:24:07');
INSERT INTO `cp_log` VALUES ('165', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:24:16');
INSERT INTO `cp_log` VALUES ('166', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:24:33');
INSERT INTO `cp_log` VALUES ('167', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:24:54');
INSERT INTO `cp_log` VALUES ('168', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:25:03');
INSERT INTO `cp_log` VALUES ('169', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:25:11');
INSERT INTO `cp_log` VALUES ('170', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:25:19');
INSERT INTO `cp_log` VALUES ('171', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-06 17:25:36');
INSERT INTO `cp_log` VALUES ('172', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:25:39');
INSERT INTO `cp_log` VALUES ('173', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:25:51');
INSERT INTO `cp_log` VALUES ('174', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-06 17:25:54');
INSERT INTO `cp_log` VALUES ('175', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:26:00');
INSERT INTO `cp_log` VALUES ('176', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:26:05');
INSERT INTO `cp_log` VALUES ('177', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:26:09');
INSERT INTO `cp_log` VALUES ('178', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:26:27');
INSERT INTO `cp_log` VALUES ('179', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:26:30');
INSERT INTO `cp_log` VALUES ('180', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:26:43');
INSERT INTO `cp_log` VALUES ('181', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:26:59');
INSERT INTO `cp_log` VALUES ('182', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:27:07');
INSERT INTO `cp_log` VALUES ('183', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:27:26');
INSERT INTO `cp_log` VALUES ('184', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-06 17:27:44');
INSERT INTO `cp_log` VALUES ('185', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-06 17:27:50');
INSERT INTO `cp_log` VALUES ('186', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-06 17:27:58');
INSERT INTO `cp_log` VALUES ('187', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-06 17:28:03');
INSERT INTO `cp_log` VALUES ('188', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-06 17:28:07');
INSERT INTO `cp_log` VALUES ('189', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-06 17:28:11');
INSERT INTO `cp_log` VALUES ('190', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-06 17:28:15');
INSERT INTO `cp_log` VALUES ('191', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-06 17:28:24');
INSERT INTO `cp_log` VALUES ('192', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-06 17:28:28');
INSERT INTO `cp_log` VALUES ('193', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-06 17:28:31');
INSERT INTO `cp_log` VALUES ('194', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=pullic_showthumbs', '', '1', 'any', '127.0.0.1', '2018-06-06 17:32:38');
INSERT INTO `cp_log` VALUES ('195', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=pullic_showthumbs', '', '1', 'any', '127.0.0.1', '2018-06-06 17:32:43');
INSERT INTO `cp_log` VALUES ('196', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=dir', '', '1', 'any', '127.0.0.1', '2018-06-06 17:32:51');
INSERT INTO `cp_log` VALUES ('197', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-06 17:33:03');
INSERT INTO `cp_log` VALUES ('198', '', '0', 'attachment', '', 'manage', '?m=attachment&c=manage&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-06 17:33:07');
INSERT INTO `cp_log` VALUES ('199', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:47:05');
INSERT INTO `cp_log` VALUES ('200', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-06 17:47:17');
INSERT INTO `cp_log` VALUES ('201', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:47:23');
INSERT INTO `cp_log` VALUES ('202', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'any', '127.0.0.1', '2018-06-06 17:47:43');
INSERT INTO `cp_log` VALUES ('203', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:47:51');
INSERT INTO `cp_log` VALUES ('204', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-06 17:47:58');
INSERT INTO `cp_log` VALUES ('205', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', '1', 'any', '127.0.0.1', '2018-06-06 17:48:07');
INSERT INTO `cp_log` VALUES ('206', '', '0', 'admin', '', 'role', '?m=admin&c=role&a=setting_cat_priv', '', '1', 'any', '127.0.0.1', '2018-06-07 09:48:07');
INSERT INTO `cp_log` VALUES ('207', '', '0', 'admin', '', 'role', '?m=admin&c=role&a=role_priv', '', '1', 'any', '127.0.0.1', '2018-06-07 09:48:08');
INSERT INTO `cp_log` VALUES ('208', '', '0', 'admin', '', 'role', '?m=admin&c=role&a=setting_cat_priv', '', '1', 'any', '127.0.0.1', '2018-06-07 09:48:09');
INSERT INTO `cp_log` VALUES ('209', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-07 09:54:24');
INSERT INTO `cp_log` VALUES ('210', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 09:54:48');
INSERT INTO `cp_log` VALUES ('211', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 09:55:21');
INSERT INTO `cp_log` VALUES ('212', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 09:56:25');
INSERT INTO `cp_log` VALUES ('213', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 09:56:39');
INSERT INTO `cp_log` VALUES ('214', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-07 09:58:20');
INSERT INTO `cp_log` VALUES ('215', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-07 09:58:26');
INSERT INTO `cp_log` VALUES ('216', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:23:10');
INSERT INTO `cp_log` VALUES ('217', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:23:14');
INSERT INTO `cp_log` VALUES ('218', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:24:07');
INSERT INTO `cp_log` VALUES ('219', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:24:12');
INSERT INTO `cp_log` VALUES ('220', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-07 10:24:26');
INSERT INTO `cp_log` VALUES ('221', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-07 10:24:43');
INSERT INTO `cp_log` VALUES ('222', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:24:58');
INSERT INTO `cp_log` VALUES ('223', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:25:19');
INSERT INTO `cp_log` VALUES ('224', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:25:55');
INSERT INTO `cp_log` VALUES ('225', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-07 10:26:06');
INSERT INTO `cp_log` VALUES ('226', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-07 10:26:10');
INSERT INTO `cp_log` VALUES ('227', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:26:17');
INSERT INTO `cp_log` VALUES ('228', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:26:40');
INSERT INTO `cp_log` VALUES ('229', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:32:53');
INSERT INTO `cp_log` VALUES ('230', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:35:37');
INSERT INTO `cp_log` VALUES ('231', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-07 10:41:29');
INSERT INTO `cp_log` VALUES ('232', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:55:13');
INSERT INTO `cp_log` VALUES ('233', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:55:32');
INSERT INTO `cp_log` VALUES ('234', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:55:32');
INSERT INTO `cp_log` VALUES ('235', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:55:34');
INSERT INTO `cp_log` VALUES ('236', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:55:48');
INSERT INTO `cp_log` VALUES ('237', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:56:05');
INSERT INTO `cp_log` VALUES ('238', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-07 10:57:52');
INSERT INTO `cp_log` VALUES ('239', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-07 10:58:00');
INSERT INTO `cp_log` VALUES ('240', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-07 10:58:04');
INSERT INTO `cp_log` VALUES ('241', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:58:14');
INSERT INTO `cp_log` VALUES ('242', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:58:27');
INSERT INTO `cp_log` VALUES ('243', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:58:36');
INSERT INTO `cp_log` VALUES ('244', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 10:58:43');
INSERT INTO `cp_log` VALUES ('245', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-07 10:59:44');
INSERT INTO `cp_log` VALUES ('246', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-07 10:59:53');
INSERT INTO `cp_log` VALUES ('247', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-07 11:00:01');
INSERT INTO `cp_log` VALUES ('248', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-07 11:00:07');
INSERT INTO `cp_log` VALUES ('249', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-07 11:00:14');
INSERT INTO `cp_log` VALUES ('250', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 11:00:39');
INSERT INTO `cp_log` VALUES ('251', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 11:01:00');
INSERT INTO `cp_log` VALUES ('252', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-07 11:01:12');
INSERT INTO `cp_log` VALUES ('253', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-07 11:01:18');
INSERT INTO `cp_log` VALUES ('254', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-07 11:01:27');
INSERT INTO `cp_log` VALUES ('255', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-07 11:01:51');
INSERT INTO `cp_log` VALUES ('256', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-07 11:01:57');
INSERT INTO `cp_log` VALUES ('257', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-07 11:02:04');
INSERT INTO `cp_log` VALUES ('258', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-07 11:02:09');
INSERT INTO `cp_log` VALUES ('259', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-07 11:02:13');
INSERT INTO `cp_log` VALUES ('260', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-07 11:02:21');
INSERT INTO `cp_log` VALUES ('261', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-07 11:02:26');
INSERT INTO `cp_log` VALUES ('262', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-07 11:02:33');
INSERT INTO `cp_log` VALUES ('263', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-07 11:02:37');
INSERT INTO `cp_log` VALUES ('264', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 11:08:41');
INSERT INTO `cp_log` VALUES ('265', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 11:09:28');
INSERT INTO `cp_log` VALUES ('266', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 11:09:43');
INSERT INTO `cp_log` VALUES ('267', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 11:10:11');
INSERT INTO `cp_log` VALUES ('268', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 11:10:22');
INSERT INTO `cp_log` VALUES ('269', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 11:11:43');
INSERT INTO `cp_log` VALUES ('270', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-07 11:11:50');
INSERT INTO `cp_log` VALUES ('271', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', '1', 'any', '127.0.0.1', '2018-06-07 11:11:58');
INSERT INTO `cp_log` VALUES ('272', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-07 11:12:04');
INSERT INTO `cp_log` VALUES ('273', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-07 11:20:25');
INSERT INTO `cp_log` VALUES ('274', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 11:26:53');
INSERT INTO `cp_log` VALUES ('275', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 11:27:20');
INSERT INTO `cp_log` VALUES ('276', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 11:27:28');
INSERT INTO `cp_log` VALUES ('277', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-07 11:27:33');
INSERT INTO `cp_log` VALUES ('278', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-07 13:49:29');
INSERT INTO `cp_log` VALUES ('279', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-07 13:49:43');
INSERT INTO `cp_log` VALUES ('280', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 16:29:10');
INSERT INTO `cp_log` VALUES ('281', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 16:29:41');
INSERT INTO `cp_log` VALUES ('282', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-11 16:29:50');
INSERT INTO `cp_log` VALUES ('283', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-11 16:29:55');
INSERT INTO `cp_log` VALUES ('284', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'any', '127.0.0.1', '2018-06-11 16:30:04');
INSERT INTO `cp_log` VALUES ('285', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-11 16:30:08');
INSERT INTO `cp_log` VALUES ('286', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-11 16:30:14');
INSERT INTO `cp_log` VALUES ('287', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-11 16:30:21');
INSERT INTO `cp_log` VALUES ('288', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-11 16:30:25');
INSERT INTO `cp_log` VALUES ('289', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 16:30:33');
INSERT INTO `cp_log` VALUES ('290', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 16:30:59');
INSERT INTO `cp_log` VALUES ('291', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 16:31:12');
INSERT INTO `cp_log` VALUES ('292', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-11 16:31:27');
INSERT INTO `cp_log` VALUES ('293', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'any', '127.0.0.1', '2018-06-11 16:31:32');
INSERT INTO `cp_log` VALUES ('294', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 16:31:36');
INSERT INTO `cp_log` VALUES ('295', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 16:31:56');
INSERT INTO `cp_log` VALUES ('296', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 16:32:10');
INSERT INTO `cp_log` VALUES ('297', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 16:33:24');
INSERT INTO `cp_log` VALUES ('298', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 16:33:26');
INSERT INTO `cp_log` VALUES ('299', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 16:33:35');
INSERT INTO `cp_log` VALUES ('300', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 16:33:56');
INSERT INTO `cp_log` VALUES ('301', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 16:59:26');
INSERT INTO `cp_log` VALUES ('302', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 17:00:05');
INSERT INTO `cp_log` VALUES ('303', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 17:00:12');
INSERT INTO `cp_log` VALUES ('304', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 17:10:45');
INSERT INTO `cp_log` VALUES ('305', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 17:11:00');
INSERT INTO `cp_log` VALUES ('306', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', '1', 'any', '127.0.0.1', '2018-06-11 17:11:12');
INSERT INTO `cp_log` VALUES ('307', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 17:11:19');
INSERT INTO `cp_log` VALUES ('308', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 17:11:26');
INSERT INTO `cp_log` VALUES ('309', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 17:11:34');
INSERT INTO `cp_log` VALUES ('310', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 17:11:42');
INSERT INTO `cp_log` VALUES ('311', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 17:23:49');
INSERT INTO `cp_log` VALUES ('312', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 17:24:53');
INSERT INTO `cp_log` VALUES ('313', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 17:25:07');
INSERT INTO `cp_log` VALUES ('314', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 17:25:08');
INSERT INTO `cp_log` VALUES ('315', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 17:25:40');
INSERT INTO `cp_log` VALUES ('316', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 17:26:10');
INSERT INTO `cp_log` VALUES ('317', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 17:26:20');
INSERT INTO `cp_log` VALUES ('318', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 17:26:27');
INSERT INTO `cp_log` VALUES ('319', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 17:26:34');
INSERT INTO `cp_log` VALUES ('320', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 17:48:03');
INSERT INTO `cp_log` VALUES ('321', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 17:48:11');
INSERT INTO `cp_log` VALUES ('322', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 17:48:28');
INSERT INTO `cp_log` VALUES ('323', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 17:48:31');
INSERT INTO `cp_log` VALUES ('324', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=listorder', '', '1', 'any', '127.0.0.1', '2018-06-11 17:48:54');
INSERT INTO `cp_log` VALUES ('325', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=listorder', '', '1', 'any', '127.0.0.1', '2018-06-11 17:49:49');
INSERT INTO `cp_log` VALUES ('326', '', '0', 'content', '', 'content', '?m=content&c=content&a=listorder', '', '1', 'any', '127.0.0.1', '2018-06-11 17:53:20');
INSERT INTO `cp_log` VALUES ('327', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 17:56:30');
INSERT INTO `cp_log` VALUES ('328', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 17:56:56');
INSERT INTO `cp_log` VALUES ('329', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 17:57:07');
INSERT INTO `cp_log` VALUES ('330', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 17:57:12');
INSERT INTO `cp_log` VALUES ('331', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 17:57:20');
INSERT INTO `cp_log` VALUES ('332', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 17:57:32');
INSERT INTO `cp_log` VALUES ('333', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 17:58:57');
INSERT INTO `cp_log` VALUES ('334', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 17:59:11');
INSERT INTO `cp_log` VALUES ('335', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 17:59:26');
INSERT INTO `cp_log` VALUES ('336', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 18:35:26');
INSERT INTO `cp_log` VALUES ('337', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 18:41:48');
INSERT INTO `cp_log` VALUES ('338', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 18:42:22');
INSERT INTO `cp_log` VALUES ('339', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 18:42:30');
INSERT INTO `cp_log` VALUES ('340', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 18:43:12');
INSERT INTO `cp_log` VALUES ('341', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 18:51:31');
INSERT INTO `cp_log` VALUES ('342', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 19:03:19');
INSERT INTO `cp_log` VALUES ('343', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 19:03:26');
INSERT INTO `cp_log` VALUES ('344', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 19:44:42');
INSERT INTO `cp_log` VALUES ('345', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 19:45:08');
INSERT INTO `cp_log` VALUES ('346', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 19:46:55');
INSERT INTO `cp_log` VALUES ('347', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 19:47:17');
INSERT INTO `cp_log` VALUES ('348', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 19:47:36');
INSERT INTO `cp_log` VALUES ('349', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 19:47:42');
INSERT INTO `cp_log` VALUES ('350', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 19:50:00');
INSERT INTO `cp_log` VALUES ('351', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'any', '127.0.0.1', '2018-06-11 19:50:08');
INSERT INTO `cp_log` VALUES ('352', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 19:50:23');
INSERT INTO `cp_log` VALUES ('353', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 19:50:58');
INSERT INTO `cp_log` VALUES ('354', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 19:51:18');
INSERT INTO `cp_log` VALUES ('355', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 19:51:21');
INSERT INTO `cp_log` VALUES ('356', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 19:55:49');
INSERT INTO `cp_log` VALUES ('357', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 19:56:54');
INSERT INTO `cp_log` VALUES ('358', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-11 19:57:03');
INSERT INTO `cp_log` VALUES ('359', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '121.69.44.230', '2018-06-12 09:36:41');
INSERT INTO `cp_log` VALUES ('360', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '121.69.44.230', '2018-06-12 09:37:16');
INSERT INTO `cp_log` VALUES ('361', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '121.69.44.230', '2018-06-12 09:37:18');
INSERT INTO `cp_log` VALUES ('362', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '121.69.44.230', '2018-06-12 09:37:50');
INSERT INTO `cp_log` VALUES ('363', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'any', '127.0.0.1', '2018-06-12 09:41:36');
INSERT INTO `cp_log` VALUES ('364', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '121.69.44.230', '2018-06-12 09:44:34');
INSERT INTO `cp_log` VALUES ('365', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'any', '127.0.0.1', '2018-06-12 09:54:00');
INSERT INTO `cp_log` VALUES ('366', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '121.69.44.230', '2018-06-12 13:19:14');
INSERT INTO `cp_log` VALUES ('367', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '223.167.152.22', '2018-06-12 13:20:14');
INSERT INTO `cp_log` VALUES ('368', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '121.69.44.230', '2018-06-12 13:21:47');
INSERT INTO `cp_log` VALUES ('369', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '121.69.44.230', '2018-06-12 13:21:48');
INSERT INTO `cp_log` VALUES ('370', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '121.69.44.230', '2018-06-12 13:23:56');
INSERT INTO `cp_log` VALUES ('371', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'any', '127.0.0.1', '2018-06-12 14:30:43');
INSERT INTO `cp_log` VALUES ('372', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'any', '127.0.0.1', '2018-06-12 14:30:53');
INSERT INTO `cp_log` VALUES ('373', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'any', '127.0.0.1', '2018-06-12 14:30:54');
INSERT INTO `cp_log` VALUES ('374', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'any', '127.0.0.1', '2018-06-12 14:30:55');
INSERT INTO `cp_log` VALUES ('375', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'any', '127.0.0.1', '2018-06-12 14:31:06');
INSERT INTO `cp_log` VALUES ('376', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'any', '127.0.0.1', '2018-06-12 14:31:08');
INSERT INTO `cp_log` VALUES ('377', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'any', '127.0.0.1', '2018-06-12 14:31:15');
INSERT INTO `cp_log` VALUES ('378', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'any', '127.0.0.1', '2018-06-12 14:31:17');
INSERT INTO `cp_log` VALUES ('379', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'any', '127.0.0.1', '2018-06-12 14:31:18');
INSERT INTO `cp_log` VALUES ('380', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'any', '127.0.0.1', '2018-06-12 14:31:49');
INSERT INTO `cp_log` VALUES ('381', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 14:31:59');
INSERT INTO `cp_log` VALUES ('382', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 14:32:17');
INSERT INTO `cp_log` VALUES ('383', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 14:32:24');
INSERT INTO `cp_log` VALUES ('384', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 14:32:27');
INSERT INTO `cp_log` VALUES ('385', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 14:32:52');
INSERT INTO `cp_log` VALUES ('386', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 16:46:31');
INSERT INTO `cp_log` VALUES ('387', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 16:46:44');
INSERT INTO `cp_log` VALUES ('388', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 16:46:50');
INSERT INTO `cp_log` VALUES ('389', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 16:46:58');
INSERT INTO `cp_log` VALUES ('390', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 16:47:10');
INSERT INTO `cp_log` VALUES ('391', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 16:47:22');
INSERT INTO `cp_log` VALUES ('392', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 16:47:33');
INSERT INTO `cp_log` VALUES ('393', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 16:47:38');
INSERT INTO `cp_log` VALUES ('394', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 16:49:12');
INSERT INTO `cp_log` VALUES ('395', '', '0', 'content', '', 'content', '?m=content&c=content&a=clear_data', '', '1', 'any', '127.0.0.1', '2018-06-12 16:49:58');
INSERT INTO `cp_log` VALUES ('396', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:00');
INSERT INTO `cp_log` VALUES ('397', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:02');
INSERT INTO `cp_log` VALUES ('398', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:02');
INSERT INTO `cp_log` VALUES ('399', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:03');
INSERT INTO `cp_log` VALUES ('400', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:04');
INSERT INTO `cp_log` VALUES ('401', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:04');
INSERT INTO `cp_log` VALUES ('402', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:05');
INSERT INTO `cp_log` VALUES ('403', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:05');
INSERT INTO `cp_log` VALUES ('404', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:06');
INSERT INTO `cp_log` VALUES ('405', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:07');
INSERT INTO `cp_log` VALUES ('406', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:07');
INSERT INTO `cp_log` VALUES ('407', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:08');
INSERT INTO `cp_log` VALUES ('408', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:11');
INSERT INTO `cp_log` VALUES ('409', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:13');
INSERT INTO `cp_log` VALUES ('410', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:14');
INSERT INTO `cp_log` VALUES ('411', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:15');
INSERT INTO `cp_log` VALUES ('412', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:16');
INSERT INTO `cp_log` VALUES ('413', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:16');
INSERT INTO `cp_log` VALUES ('414', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:17');
INSERT INTO `cp_log` VALUES ('415', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:18');
INSERT INTO `cp_log` VALUES ('416', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:18');
INSERT INTO `cp_log` VALUES ('417', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:19');
INSERT INTO `cp_log` VALUES ('418', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:20');
INSERT INTO `cp_log` VALUES ('419', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:20');
INSERT INTO `cp_log` VALUES ('420', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:21');
INSERT INTO `cp_log` VALUES ('421', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:22');
INSERT INTO `cp_log` VALUES ('422', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 16:50:22');
INSERT INTO `cp_log` VALUES ('423', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 16:51:11');
INSERT INTO `cp_log` VALUES ('424', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 16:51:20');
INSERT INTO `cp_log` VALUES ('425', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:00');
INSERT INTO `cp_log` VALUES ('426', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:07');
INSERT INTO `cp_log` VALUES ('427', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:09');
INSERT INTO `cp_log` VALUES ('428', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:10');
INSERT INTO `cp_log` VALUES ('429', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:11');
INSERT INTO `cp_log` VALUES ('430', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:12');
INSERT INTO `cp_log` VALUES ('431', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:13');
INSERT INTO `cp_log` VALUES ('432', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:13');
INSERT INTO `cp_log` VALUES ('433', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:14');
INSERT INTO `cp_log` VALUES ('434', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:29');
INSERT INTO `cp_log` VALUES ('435', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:31');
INSERT INTO `cp_log` VALUES ('436', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:32');
INSERT INTO `cp_log` VALUES ('437', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:32');
INSERT INTO `cp_log` VALUES ('438', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:33');
INSERT INTO `cp_log` VALUES ('439', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:33');
INSERT INTO `cp_log` VALUES ('440', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:34');
INSERT INTO `cp_log` VALUES ('441', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:34');
INSERT INTO `cp_log` VALUES ('442', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:36');
INSERT INTO `cp_log` VALUES ('443', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:36');
INSERT INTO `cp_log` VALUES ('444', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:37');
INSERT INTO `cp_log` VALUES ('445', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:37');
INSERT INTO `cp_log` VALUES ('446', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:45');
INSERT INTO `cp_log` VALUES ('447', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:46');
INSERT INTO `cp_log` VALUES ('448', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:47');
INSERT INTO `cp_log` VALUES ('449', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:48');
INSERT INTO `cp_log` VALUES ('450', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:48');
INSERT INTO `cp_log` VALUES ('451', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:49');
INSERT INTO `cp_log` VALUES ('452', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 16:52:49');
INSERT INTO `cp_log` VALUES ('453', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:53:12');
INSERT INTO `cp_log` VALUES ('454', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:53:14');
INSERT INTO `cp_log` VALUES ('455', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:53:15');
INSERT INTO `cp_log` VALUES ('456', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:53:16');
INSERT INTO `cp_log` VALUES ('457', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:53:16');
INSERT INTO `cp_log` VALUES ('458', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:53:17');
INSERT INTO `cp_log` VALUES ('459', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:53:17');
INSERT INTO `cp_log` VALUES ('460', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:53:18');
INSERT INTO `cp_log` VALUES ('461', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 16:57:08');
INSERT INTO `cp_log` VALUES ('462', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 16:57:27');
INSERT INTO `cp_log` VALUES ('463', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 16:57:40');
INSERT INTO `cp_log` VALUES ('464', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:57:44');
INSERT INTO `cp_log` VALUES ('465', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:57:49');
INSERT INTO `cp_log` VALUES ('466', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:57:49');
INSERT INTO `cp_log` VALUES ('467', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:57:51');
INSERT INTO `cp_log` VALUES ('468', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:57:54');
INSERT INTO `cp_log` VALUES ('469', '', '0', 'content', '', 'content', '?m=content&c=content&a=clear_data', '', '1', 'any', '127.0.0.1', '2018-06-12 16:58:45');
INSERT INTO `cp_log` VALUES ('470', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:58:49');
INSERT INTO `cp_log` VALUES ('471', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:58:52');
INSERT INTO `cp_log` VALUES ('472', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:58:54');
INSERT INTO `cp_log` VALUES ('473', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:58:56');
INSERT INTO `cp_log` VALUES ('474', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:58:57');
INSERT INTO `cp_log` VALUES ('475', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 16:59:21');
INSERT INTO `cp_log` VALUES ('476', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 16:59:41');
INSERT INTO `cp_log` VALUES ('477', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 16:59:48');
INSERT INTO `cp_log` VALUES ('478', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:59:51');
INSERT INTO `cp_log` VALUES ('479', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:59:52');
INSERT INTO `cp_log` VALUES ('480', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:59:53');
INSERT INTO `cp_log` VALUES ('481', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:59:54');
INSERT INTO `cp_log` VALUES ('482', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:59:54');
INSERT INTO `cp_log` VALUES ('483', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:59:55');
INSERT INTO `cp_log` VALUES ('484', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:59:56');
INSERT INTO `cp_log` VALUES ('485', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:59:56');
INSERT INTO `cp_log` VALUES ('486', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:59:57');
INSERT INTO `cp_log` VALUES ('487', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:59:57');
INSERT INTO `cp_log` VALUES ('488', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:59:58');
INSERT INTO `cp_log` VALUES ('489', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 16:59:59');
INSERT INTO `cp_log` VALUES ('490', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:00:03');
INSERT INTO `cp_log` VALUES ('491', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 17:00:14');
INSERT INTO `cp_log` VALUES ('492', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:00:19');
INSERT INTO `cp_log` VALUES ('493', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:00:23');
INSERT INTO `cp_log` VALUES ('494', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:00:24');
INSERT INTO `cp_log` VALUES ('495', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:00:24');
INSERT INTO `cp_log` VALUES ('496', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:00:25');
INSERT INTO `cp_log` VALUES ('497', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:00:25');
INSERT INTO `cp_log` VALUES ('498', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:00:26');
INSERT INTO `cp_log` VALUES ('499', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:00:26');
INSERT INTO `cp_log` VALUES ('500', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:00:27');
INSERT INTO `cp_log` VALUES ('501', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:00:28');
INSERT INTO `cp_log` VALUES ('502', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:00:28');
INSERT INTO `cp_log` VALUES ('503', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:00:29');
INSERT INTO `cp_log` VALUES ('504', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:00:36');
INSERT INTO `cp_log` VALUES ('505', '', '0', 'content', '', 'content', '?m=content&c=content&a=clear_data', '', '1', 'any', '127.0.0.1', '2018-06-12 17:02:01');
INSERT INTO `cp_log` VALUES ('506', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:02:03');
INSERT INTO `cp_log` VALUES ('507', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:02:06');
INSERT INTO `cp_log` VALUES ('508', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:02:07');
INSERT INTO `cp_log` VALUES ('509', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:02:08');
INSERT INTO `cp_log` VALUES ('510', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:02:09');
INSERT INTO `cp_log` VALUES ('511', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:02:09');
INSERT INTO `cp_log` VALUES ('512', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:02:10');
INSERT INTO `cp_log` VALUES ('513', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:02:10');
INSERT INTO `cp_log` VALUES ('514', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:03:07');
INSERT INTO `cp_log` VALUES ('515', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:03:08');
INSERT INTO `cp_log` VALUES ('516', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:03:09');
INSERT INTO `cp_log` VALUES ('517', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:03:10');
INSERT INTO `cp_log` VALUES ('518', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:03:10');
INSERT INTO `cp_log` VALUES ('519', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:03:11');
INSERT INTO `cp_log` VALUES ('520', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:03:12');
INSERT INTO `cp_log` VALUES ('521', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:03:13');
INSERT INTO `cp_log` VALUES ('522', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:03:14');
INSERT INTO `cp_log` VALUES ('523', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:03:14');
INSERT INTO `cp_log` VALUES ('524', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:03:15');
INSERT INTO `cp_log` VALUES ('525', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:03:15');
INSERT INTO `cp_log` VALUES ('526', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 17:04:18');
INSERT INTO `cp_log` VALUES ('527', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 17:04:43');
INSERT INTO `cp_log` VALUES ('528', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 17:05:12');
INSERT INTO `cp_log` VALUES ('529', '', '0', 'content', '', 'content', '?m=content&c=content&a=clear_data', '', '1', 'any', '127.0.0.1', '2018-06-12 17:05:34');
INSERT INTO `cp_log` VALUES ('530', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:05:37');
INSERT INTO `cp_log` VALUES ('531', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:05:38');
INSERT INTO `cp_log` VALUES ('532', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:05:40');
INSERT INTO `cp_log` VALUES ('533', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:05:40');
INSERT INTO `cp_log` VALUES ('534', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:05:41');
INSERT INTO `cp_log` VALUES ('535', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:05:42');
INSERT INTO `cp_log` VALUES ('536', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:05:42');
INSERT INTO `cp_log` VALUES ('537', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:05:43');
INSERT INTO `cp_log` VALUES ('538', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 17:06:21');
INSERT INTO `cp_log` VALUES ('539', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'any', '127.0.0.1', '2018-06-12 17:06:25');
INSERT INTO `cp_log` VALUES ('540', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:29');
INSERT INTO `cp_log` VALUES ('541', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:30');
INSERT INTO `cp_log` VALUES ('542', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:31');
INSERT INTO `cp_log` VALUES ('543', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:31');
INSERT INTO `cp_log` VALUES ('544', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:32');
INSERT INTO `cp_log` VALUES ('545', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:33');
INSERT INTO `cp_log` VALUES ('546', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:34');
INSERT INTO `cp_log` VALUES ('547', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:35');
INSERT INTO `cp_log` VALUES ('548', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:35');
INSERT INTO `cp_log` VALUES ('549', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:36');
INSERT INTO `cp_log` VALUES ('550', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:37');
INSERT INTO `cp_log` VALUES ('551', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:38');
INSERT INTO `cp_log` VALUES ('552', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:48');
INSERT INTO `cp_log` VALUES ('553', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:51');
INSERT INTO `cp_log` VALUES ('554', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:52');
INSERT INTO `cp_log` VALUES ('555', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:55');
INSERT INTO `cp_log` VALUES ('556', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:56');
INSERT INTO `cp_log` VALUES ('557', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:56');
INSERT INTO `cp_log` VALUES ('558', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:57');
INSERT INTO `cp_log` VALUES ('559', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:58');
INSERT INTO `cp_log` VALUES ('560', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'any', '127.0.0.1', '2018-06-12 17:07:58');
INSERT INTO `cp_log` VALUES ('561', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 17:08:00');
INSERT INTO `cp_log` VALUES ('562', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 17:08:02');
INSERT INTO `cp_log` VALUES ('563', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 17:08:02');
INSERT INTO `cp_log` VALUES ('564', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 17:08:03');
INSERT INTO `cp_log` VALUES ('565', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 17:08:04');
INSERT INTO `cp_log` VALUES ('566', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 17:08:05');
INSERT INTO `cp_log` VALUES ('567', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 17:08:05');
INSERT INTO `cp_log` VALUES ('568', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'any', '127.0.0.1', '2018-06-12 17:08:08');
INSERT INTO `cp_log` VALUES ('569', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2018-06-13 17:36:04');
INSERT INTO `cp_log` VALUES ('570', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2018-06-13 17:36:18');
INSERT INTO `cp_log` VALUES ('571', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2018-06-13 17:36:21');
INSERT INTO `cp_log` VALUES ('572', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2018-06-13 17:36:23');
INSERT INTO `cp_log` VALUES ('573', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2018-06-13 17:36:53');
INSERT INTO `cp_log` VALUES ('574', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '118.144.141.157', '2018-06-13 18:01:03');
INSERT INTO `cp_log` VALUES ('575', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '118.144.141.157', '2018-06-13 18:01:04');
INSERT INTO `cp_log` VALUES ('576', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '118.144.141.157', '2018-06-13 18:01:14');
INSERT INTO `cp_log` VALUES ('577', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '116.213.171.157', '2018-06-13 18:15:28');
INSERT INTO `cp_log` VALUES ('578', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '116.213.171.157', '2018-06-13 18:15:49');
INSERT INTO `cp_log` VALUES ('579', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '116.213.171.157', '2018-06-13 18:25:48');
INSERT INTO `cp_log` VALUES ('580', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '116.213.171.157', '2018-06-13 18:26:07');
INSERT INTO `cp_log` VALUES ('581', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '116.213.171.157', '2018-06-13 18:26:11');
INSERT INTO `cp_log` VALUES ('582', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '116.213.171.157', '2018-06-13 18:26:13');
INSERT INTO `cp_log` VALUES ('583', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '116.213.171.157', '2018-06-13 18:26:44');
INSERT INTO `cp_log` VALUES ('584', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '114.243.112.4', '2018-06-13 18:35:03');
INSERT INTO `cp_log` VALUES ('585', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '114.243.112.4', '2018-06-13 18:35:41');
INSERT INTO `cp_log` VALUES ('586', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-13 18:36:39');
INSERT INTO `cp_log` VALUES ('587', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-13 18:37:16');
INSERT INTO `cp_log` VALUES ('588', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-13 18:37:19');
INSERT INTO `cp_log` VALUES ('589', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-13 18:38:34');
INSERT INTO `cp_log` VALUES ('590', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-13 18:39:59');
INSERT INTO `cp_log` VALUES ('591', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '114.243.112.4', '2018-06-13 18:40:05');
INSERT INTO `cp_log` VALUES ('592', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '114.243.112.4', '2018-06-13 18:41:26');
INSERT INTO `cp_log` VALUES ('593', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-13 18:41:59');
INSERT INTO `cp_log` VALUES ('594', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-13 18:42:12');
INSERT INTO `cp_log` VALUES ('595', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '114.243.112.4', '2018-06-13 19:01:46');
INSERT INTO `cp_log` VALUES ('596', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '114.243.112.4', '2018-06-13 19:02:06');
INSERT INTO `cp_log` VALUES ('597', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-13 19:04:25');
INSERT INTO `cp_log` VALUES ('598', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '114.243.112.4', '2018-06-13 19:06:16');
INSERT INTO `cp_log` VALUES ('599', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-13 19:07:00');
INSERT INTO `cp_log` VALUES ('600', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '124.64.16.133', '2018-06-13 19:13:37');
INSERT INTO `cp_log` VALUES ('601', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '124.64.16.133', '2018-06-13 19:13:39');
INSERT INTO `cp_log` VALUES ('602', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '124.64.16.133', '2018-06-13 19:14:01');
INSERT INTO `cp_log` VALUES ('603', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-13 19:14:33');
INSERT INTO `cp_log` VALUES ('604', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-13 19:15:14');
INSERT INTO `cp_log` VALUES ('605', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-13 19:16:15');
INSERT INTO `cp_log` VALUES ('606', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-13 19:18:04');
INSERT INTO `cp_log` VALUES ('607', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-13 19:21:41');
INSERT INTO `cp_log` VALUES ('608', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-13 19:22:57');
INSERT INTO `cp_log` VALUES ('609', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-13 19:26:08');
INSERT INTO `cp_log` VALUES ('610', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-13 19:26:31');
INSERT INTO `cp_log` VALUES ('611', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-13 19:27:17');
INSERT INTO `cp_log` VALUES ('612', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-13 19:27:33');
INSERT INTO `cp_log` VALUES ('613', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-13 19:28:41');
INSERT INTO `cp_log` VALUES ('614', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-13 19:29:17');
INSERT INTO `cp_log` VALUES ('615', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-13 19:29:26');
INSERT INTO `cp_log` VALUES ('616', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '39.155.134.197', '2018-06-13 19:42:11');
INSERT INTO `cp_log` VALUES ('617', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-13 19:42:27');
INSERT INTO `cp_log` VALUES ('618', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-13 19:42:29');
INSERT INTO `cp_log` VALUES ('619', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-13 19:42:32');
INSERT INTO `cp_log` VALUES ('620', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-13 19:42:35');
INSERT INTO `cp_log` VALUES ('621', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-13 19:42:38');
INSERT INTO `cp_log` VALUES ('622', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-13 19:42:39');
INSERT INTO `cp_log` VALUES ('623', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-13 19:42:42');
INSERT INTO `cp_log` VALUES ('624', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-13 19:42:44');
INSERT INTO `cp_log` VALUES ('625', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-13 19:42:47');
INSERT INTO `cp_log` VALUES ('626', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-13 19:42:49');
INSERT INTO `cp_log` VALUES ('627', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-13 19:42:52');
INSERT INTO `cp_log` VALUES ('628', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-13 19:42:54');
INSERT INTO `cp_log` VALUES ('629', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'any', '127.0.0.1', '2018-06-14 11:01:11');
INSERT INTO `cp_log` VALUES ('630', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'any', '127.0.0.1', '2018-06-14 11:01:12');
INSERT INTO `cp_log` VALUES ('631', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'any', '127.0.0.1', '2018-06-14 11:01:19');
INSERT INTO `cp_log` VALUES ('632', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:02:31');
INSERT INTO `cp_log` VALUES ('633', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:03:02');
INSERT INTO `cp_log` VALUES ('634', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:03:13');
INSERT INTO `cp_log` VALUES ('635', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:03:21');
INSERT INTO `cp_log` VALUES ('636', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:09:48');
INSERT INTO `cp_log` VALUES ('637', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:09:59');
INSERT INTO `cp_log` VALUES ('638', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:10:03');
INSERT INTO `cp_log` VALUES ('639', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:10:08');
INSERT INTO `cp_log` VALUES ('640', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:10:09');
INSERT INTO `cp_log` VALUES ('641', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:10:13');
INSERT INTO `cp_log` VALUES ('642', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:14:04');
INSERT INTO `cp_log` VALUES ('643', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:14:42');
INSERT INTO `cp_log` VALUES ('644', '', '0', 'link', '', 'link', '?m=link&c=link&a=setting', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:14:52');
INSERT INTO `cp_log` VALUES ('645', '', '0', 'link', '', 'link', '?m=link&c=link&a=add_type', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:14:54');
INSERT INTO `cp_log` VALUES ('646', '', '0', 'link', '', 'link', '?m=link&c=link&a=list_type', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:14:55');
INSERT INTO `cp_log` VALUES ('647', '', '0', 'link', '', 'link', '?m=link&c=link&a=check_register', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:14:57');
INSERT INTO `cp_log` VALUES ('648', '', '0', 'link', '', 'link', '?m=link&c=link&a=add_type', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:14:59');
INSERT INTO `cp_log` VALUES ('649', '', '0', 'link', '', 'link', '?m=link&c=link&a=setting', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:15:02');
INSERT INTO `cp_log` VALUES ('650', '', '0', 'link', '', 'link', '?m=link&c=link&a=add_type', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:15:07');
INSERT INTO `cp_log` VALUES ('651', '', '0', 'link', '', 'link', '?m=link&c=link&a=list_type', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:15:09');
INSERT INTO `cp_log` VALUES ('652', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:15:12');
INSERT INTO `cp_log` VALUES ('653', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:16:42');
INSERT INTO `cp_log` VALUES ('654', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:16:46');
INSERT INTO `cp_log` VALUES ('655', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:16:55');
INSERT INTO `cp_log` VALUES ('656', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:17:52');
INSERT INTO `cp_log` VALUES ('657', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:17:58');
INSERT INTO `cp_log` VALUES ('658', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:19:21');
INSERT INTO `cp_log` VALUES ('659', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:21:49');
INSERT INTO `cp_log` VALUES ('660', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:26:51');
INSERT INTO `cp_log` VALUES ('661', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:32:46');
INSERT INTO `cp_log` VALUES ('662', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:33:04');
INSERT INTO `cp_log` VALUES ('663', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:34:14');
INSERT INTO `cp_log` VALUES ('664', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:34:20');
INSERT INTO `cp_log` VALUES ('665', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 11:35:30');
INSERT INTO `cp_log` VALUES ('666', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:29:33');
INSERT INTO `cp_log` VALUES ('667', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:29:53');
INSERT INTO `cp_log` VALUES ('668', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:30:00');
INSERT INTO `cp_log` VALUES ('669', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:30:04');
INSERT INTO `cp_log` VALUES ('670', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:30:07');
INSERT INTO `cp_log` VALUES ('671', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:30:13');
INSERT INTO `cp_log` VALUES ('672', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:30:21');
INSERT INTO `cp_log` VALUES ('673', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:30:26');
INSERT INTO `cp_log` VALUES ('674', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:30:30');
INSERT INTO `cp_log` VALUES ('675', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:30:33');
INSERT INTO `cp_log` VALUES ('676', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:30:36');
INSERT INTO `cp_log` VALUES ('677', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:30:39');
INSERT INTO `cp_log` VALUES ('678', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:30:44');
INSERT INTO `cp_log` VALUES ('679', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:30:47');
INSERT INTO `cp_log` VALUES ('680', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:30:57');
INSERT INTO `cp_log` VALUES ('681', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:31:14');
INSERT INTO `cp_log` VALUES ('682', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:31:27');
INSERT INTO `cp_log` VALUES ('683', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:32:07');
INSERT INTO `cp_log` VALUES ('684', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:32:33');
INSERT INTO `cp_log` VALUES ('685', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:32:40');
INSERT INTO `cp_log` VALUES ('686', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:33:04');
INSERT INTO `cp_log` VALUES ('687', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:33:20');
INSERT INTO `cp_log` VALUES ('688', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:33:31');
INSERT INTO `cp_log` VALUES ('689', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:33:42');
INSERT INTO `cp_log` VALUES ('690', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:33:44');
INSERT INTO `cp_log` VALUES ('691', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:33:53');
INSERT INTO `cp_log` VALUES ('692', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:33:55');
INSERT INTO `cp_log` VALUES ('693', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:33:55');
INSERT INTO `cp_log` VALUES ('694', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:34:08');
INSERT INTO `cp_log` VALUES ('695', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:39:09');
INSERT INTO `cp_log` VALUES ('696', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:39:32');
INSERT INTO `cp_log` VALUES ('697', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:39:35');
INSERT INTO `cp_log` VALUES ('698', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:39:45');
INSERT INTO `cp_log` VALUES ('699', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:40:00');
INSERT INTO `cp_log` VALUES ('700', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:40:01');
INSERT INTO `cp_log` VALUES ('701', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:40:11');
INSERT INTO `cp_log` VALUES ('702', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:46:34');
INSERT INTO `cp_log` VALUES ('703', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:46:41');
INSERT INTO `cp_log` VALUES ('704', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:46:48');
INSERT INTO `cp_log` VALUES ('705', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:46:54');
INSERT INTO `cp_log` VALUES ('706', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:47:26');
INSERT INTO `cp_log` VALUES ('707', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:47:58');
INSERT INTO `cp_log` VALUES ('708', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:48:06');
INSERT INTO `cp_log` VALUES ('709', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:48:19');
INSERT INTO `cp_log` VALUES ('710', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:48:22');
INSERT INTO `cp_log` VALUES ('711', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:48:29');
INSERT INTO `cp_log` VALUES ('712', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:48:31');
INSERT INTO `cp_log` VALUES ('713', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:48:31');
INSERT INTO `cp_log` VALUES ('714', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:48:38');
INSERT INTO `cp_log` VALUES ('715', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:52:02');
INSERT INTO `cp_log` VALUES ('716', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:53:22');
INSERT INTO `cp_log` VALUES ('717', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:53:23');
INSERT INTO `cp_log` VALUES ('718', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:53:48');
INSERT INTO `cp_log` VALUES ('719', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:53:54');
INSERT INTO `cp_log` VALUES ('720', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:54:43');
INSERT INTO `cp_log` VALUES ('721', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:54:49');
INSERT INTO `cp_log` VALUES ('722', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:54:51');
INSERT INTO `cp_log` VALUES ('723', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 13:54:53');
INSERT INTO `cp_log` VALUES ('724', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 14:02:29');
INSERT INTO `cp_log` VALUES ('725', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 14:02:31');
INSERT INTO `cp_log` VALUES ('726', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 14:31:37');
INSERT INTO `cp_log` VALUES ('727', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 14:31:48');
INSERT INTO `cp_log` VALUES ('728', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 14:39:49');
INSERT INTO `cp_log` VALUES ('729', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 14:45:01');
INSERT INTO `cp_log` VALUES ('730', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:06:03');
INSERT INTO `cp_log` VALUES ('731', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:06:10');
INSERT INTO `cp_log` VALUES ('732', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:06:15');
INSERT INTO `cp_log` VALUES ('733', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:06:24');
INSERT INTO `cp_log` VALUES ('734', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:06:27');
INSERT INTO `cp_log` VALUES ('735', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:15:44');
INSERT INTO `cp_log` VALUES ('736', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:15:52');
INSERT INTO `cp_log` VALUES ('737', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:16:37');
INSERT INTO `cp_log` VALUES ('738', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:16:52');
INSERT INTO `cp_log` VALUES ('739', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:17:23');
INSERT INTO `cp_log` VALUES ('740', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:17:26');
INSERT INTO `cp_log` VALUES ('741', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:17:42');
INSERT INTO `cp_log` VALUES ('742', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:35');
INSERT INTO `cp_log` VALUES ('743', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:41');
INSERT INTO `cp_log` VALUES ('744', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:41');
INSERT INTO `cp_log` VALUES ('745', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:45');
INSERT INTO `cp_log` VALUES ('746', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:46');
INSERT INTO `cp_log` VALUES ('747', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:47');
INSERT INTO `cp_log` VALUES ('748', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:47');
INSERT INTO `cp_log` VALUES ('749', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:48');
INSERT INTO `cp_log` VALUES ('750', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:49');
INSERT INTO `cp_log` VALUES ('751', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:49');
INSERT INTO `cp_log` VALUES ('752', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:50');
INSERT INTO `cp_log` VALUES ('753', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:51');
INSERT INTO `cp_log` VALUES ('754', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:51');
INSERT INTO `cp_log` VALUES ('755', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:52');
INSERT INTO `cp_log` VALUES ('756', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:52');
INSERT INTO `cp_log` VALUES ('757', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:53');
INSERT INTO `cp_log` VALUES ('758', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:54');
INSERT INTO `cp_log` VALUES ('759', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:56');
INSERT INTO `cp_log` VALUES ('760', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:56');
INSERT INTO `cp_log` VALUES ('761', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:57');
INSERT INTO `cp_log` VALUES ('762', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2018-06-14 15:19:58');
INSERT INTO `cp_log` VALUES ('763', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '124.64.16.133', '2018-06-14 20:51:10');
INSERT INTO `cp_log` VALUES ('764', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '124.64.16.133', '2018-06-14 20:51:11');
INSERT INTO `cp_log` VALUES ('765', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '124.64.16.133', '2018-06-14 20:51:13');
INSERT INTO `cp_log` VALUES ('766', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '124.64.16.133', '2018-06-14 20:51:22');
INSERT INTO `cp_log` VALUES ('767', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:02');
INSERT INTO `cp_log` VALUES ('768', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:04');
INSERT INTO `cp_log` VALUES ('769', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:05');
INSERT INTO `cp_log` VALUES ('770', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:07');
INSERT INTO `cp_log` VALUES ('771', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:08');
INSERT INTO `cp_log` VALUES ('772', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:10');
INSERT INTO `cp_log` VALUES ('773', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:11');
INSERT INTO `cp_log` VALUES ('774', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:12');
INSERT INTO `cp_log` VALUES ('775', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:13');
INSERT INTO `cp_log` VALUES ('776', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:14');
INSERT INTO `cp_log` VALUES ('777', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:15');
INSERT INTO `cp_log` VALUES ('778', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:17');
INSERT INTO `cp_log` VALUES ('779', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:18');
INSERT INTO `cp_log` VALUES ('780', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:19');
INSERT INTO `cp_log` VALUES ('781', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:20');
INSERT INTO `cp_log` VALUES ('782', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:21');
INSERT INTO `cp_log` VALUES ('783', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:22');
INSERT INTO `cp_log` VALUES ('784', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:24');
INSERT INTO `cp_log` VALUES ('785', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:27');
INSERT INTO `cp_log` VALUES ('786', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:29');
INSERT INTO `cp_log` VALUES ('787', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:30');
INSERT INTO `cp_log` VALUES ('788', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:31');
INSERT INTO `cp_log` VALUES ('789', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:32');
INSERT INTO `cp_log` VALUES ('790', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:34');
INSERT INTO `cp_log` VALUES ('791', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:35');
INSERT INTO `cp_log` VALUES ('792', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:36');
INSERT INTO `cp_log` VALUES ('793', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:38');
INSERT INTO `cp_log` VALUES ('794', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:39');
INSERT INTO `cp_log` VALUES ('795', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:40');
INSERT INTO `cp_log` VALUES ('796', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:41');
INSERT INTO `cp_log` VALUES ('797', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:42');
INSERT INTO `cp_log` VALUES ('798', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:44');
INSERT INTO `cp_log` VALUES ('799', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:45');
INSERT INTO `cp_log` VALUES ('800', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:47');
INSERT INTO `cp_log` VALUES ('801', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:48');
INSERT INTO `cp_log` VALUES ('802', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:55:49');
INSERT INTO `cp_log` VALUES ('803', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:56:11');
INSERT INTO `cp_log` VALUES ('804', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:56:13');
INSERT INTO `cp_log` VALUES ('805', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:56:15');
INSERT INTO `cp_log` VALUES ('806', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:56:18');
INSERT INTO `cp_log` VALUES ('807', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:56:20');
INSERT INTO `cp_log` VALUES ('808', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:56:22');
INSERT INTO `cp_log` VALUES ('809', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:56:24');
INSERT INTO `cp_log` VALUES ('810', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:56:32');
INSERT INTO `cp_log` VALUES ('811', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:56:37');
INSERT INTO `cp_log` VALUES ('812', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:56:39');
INSERT INTO `cp_log` VALUES ('813', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:56:41');
INSERT INTO `cp_log` VALUES ('814', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:56:58');
INSERT INTO `cp_log` VALUES ('815', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:57:00');
INSERT INTO `cp_log` VALUES ('816', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:57:00');
INSERT INTO `cp_log` VALUES ('817', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:57:01');
INSERT INTO `cp_log` VALUES ('818', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:57:14');
INSERT INTO `cp_log` VALUES ('819', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:57:26');
INSERT INTO `cp_log` VALUES ('820', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:57:29');
INSERT INTO `cp_log` VALUES ('821', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:57:40');
INSERT INTO `cp_log` VALUES ('822', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:57:53');
INSERT INTO `cp_log` VALUES ('823', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:14');
INSERT INTO `cp_log` VALUES ('824', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:16');
INSERT INTO `cp_log` VALUES ('825', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:17');
INSERT INTO `cp_log` VALUES ('826', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:18');
INSERT INTO `cp_log` VALUES ('827', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:19');
INSERT INTO `cp_log` VALUES ('828', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:20');
INSERT INTO `cp_log` VALUES ('829', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:21');
INSERT INTO `cp_log` VALUES ('830', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:23');
INSERT INTO `cp_log` VALUES ('831', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:24');
INSERT INTO `cp_log` VALUES ('832', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:25');
INSERT INTO `cp_log` VALUES ('833', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:26');
INSERT INTO `cp_log` VALUES ('834', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:28');
INSERT INTO `cp_log` VALUES ('835', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:29');
INSERT INTO `cp_log` VALUES ('836', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:30');
INSERT INTO `cp_log` VALUES ('837', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:31');
INSERT INTO `cp_log` VALUES ('838', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:33');
INSERT INTO `cp_log` VALUES ('839', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:34');
INSERT INTO `cp_log` VALUES ('840', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:35');
INSERT INTO `cp_log` VALUES ('841', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:40');
INSERT INTO `cp_log` VALUES ('842', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:41');
INSERT INTO `cp_log` VALUES ('843', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:42');
INSERT INTO `cp_log` VALUES ('844', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:45');
INSERT INTO `cp_log` VALUES ('845', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:47');
INSERT INTO `cp_log` VALUES ('846', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:49');
INSERT INTO `cp_log` VALUES ('847', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:51');
INSERT INTO `cp_log` VALUES ('848', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:51');
INSERT INTO `cp_log` VALUES ('849', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:53');
INSERT INTO `cp_log` VALUES ('850', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:54');
INSERT INTO `cp_log` VALUES ('851', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:55');
INSERT INTO `cp_log` VALUES ('852', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:57');
INSERT INTO `cp_log` VALUES ('853', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:58:59');
INSERT INTO `cp_log` VALUES ('854', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:01');
INSERT INTO `cp_log` VALUES ('855', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:01');
INSERT INTO `cp_log` VALUES ('856', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:02');
INSERT INTO `cp_log` VALUES ('857', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:02');
INSERT INTO `cp_log` VALUES ('858', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:03');
INSERT INTO `cp_log` VALUES ('859', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:05');
INSERT INTO `cp_log` VALUES ('860', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:05');
INSERT INTO `cp_log` VALUES ('861', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:06');
INSERT INTO `cp_log` VALUES ('862', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:07');
INSERT INTO `cp_log` VALUES ('863', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:07');
INSERT INTO `cp_log` VALUES ('864', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:08');
INSERT INTO `cp_log` VALUES ('865', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:10');
INSERT INTO `cp_log` VALUES ('866', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:10');
INSERT INTO `cp_log` VALUES ('867', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:11');
INSERT INTO `cp_log` VALUES ('868', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:12');
INSERT INTO `cp_log` VALUES ('869', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:12');
INSERT INTO `cp_log` VALUES ('870', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:13');
INSERT INTO `cp_log` VALUES ('871', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 20:59:14');
INSERT INTO `cp_log` VALUES ('872', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:01:20');
INSERT INTO `cp_log` VALUES ('873', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:01:27');
INSERT INTO `cp_log` VALUES ('874', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:01:32');
INSERT INTO `cp_log` VALUES ('875', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:01:33');
INSERT INTO `cp_log` VALUES ('876', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:01:35');
INSERT INTO `cp_log` VALUES ('877', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:01:36');
INSERT INTO `cp_log` VALUES ('878', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:01:38');
INSERT INTO `cp_log` VALUES ('879', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:01:40');
INSERT INTO `cp_log` VALUES ('880', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:01:42');
INSERT INTO `cp_log` VALUES ('881', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:01:44');
INSERT INTO `cp_log` VALUES ('882', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:01:46');
INSERT INTO `cp_log` VALUES ('883', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:01:48');
INSERT INTO `cp_log` VALUES ('884', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:01:50');
INSERT INTO `cp_log` VALUES ('885', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:01:52');
INSERT INTO `cp_log` VALUES ('886', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:01:54');
INSERT INTO `cp_log` VALUES ('887', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:01:56');
INSERT INTO `cp_log` VALUES ('888', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:01:58');
INSERT INTO `cp_log` VALUES ('889', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:02:00');
INSERT INTO `cp_log` VALUES ('890', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:02:02');
INSERT INTO `cp_log` VALUES ('891', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '124.64.16.133', '2018-06-14 21:02:04');
INSERT INTO `cp_log` VALUES ('892', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '114.243.112.4', '2018-06-14 21:16:12');
INSERT INTO `cp_log` VALUES ('893', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '114.243.112.4', '2018-06-14 21:16:14');
INSERT INTO `cp_log` VALUES ('894', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '114.243.112.4', '2018-06-14 21:16:35');
INSERT INTO `cp_log` VALUES ('895', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:16:58');
INSERT INTO `cp_log` VALUES ('896', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:17:16');
INSERT INTO `cp_log` VALUES ('897', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:17:23');
INSERT INTO `cp_log` VALUES ('898', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:17:32');
INSERT INTO `cp_log` VALUES ('899', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:17:47');
INSERT INTO `cp_log` VALUES ('900', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:17:58');
INSERT INTO `cp_log` VALUES ('901', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:18:11');
INSERT INTO `cp_log` VALUES ('902', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:18:30');
INSERT INTO `cp_log` VALUES ('903', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:18:42');
INSERT INTO `cp_log` VALUES ('904', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:18:51');
INSERT INTO `cp_log` VALUES ('905', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:19:10');
INSERT INTO `cp_log` VALUES ('906', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:19:47');
INSERT INTO `cp_log` VALUES ('907', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:19:53');
INSERT INTO `cp_log` VALUES ('908', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:20:15');
INSERT INTO `cp_log` VALUES ('909', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:20:17');
INSERT INTO `cp_log` VALUES ('910', '', '0', 'content', '', 'content', '?m=content&c=content&a=delete', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:20:39');
INSERT INTO `cp_log` VALUES ('911', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:20:46');
INSERT INTO `cp_log` VALUES ('912', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:23:04');
INSERT INTO `cp_log` VALUES ('913', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:23:18');
INSERT INTO `cp_log` VALUES ('914', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:23:35');
INSERT INTO `cp_log` VALUES ('915', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:23:42');
INSERT INTO `cp_log` VALUES ('916', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:23:56');
INSERT INTO `cp_log` VALUES ('917', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:24:03');
INSERT INTO `cp_log` VALUES ('918', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:24:20');
INSERT INTO `cp_log` VALUES ('919', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:24:27');
INSERT INTO `cp_log` VALUES ('920', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:24:52');
INSERT INTO `cp_log` VALUES ('921', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:24:57');
INSERT INTO `cp_log` VALUES ('922', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:25:30');
INSERT INTO `cp_log` VALUES ('923', '', '0', 'content', '', 'content', '?m=content&c=content&a=listorder', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:25:38');
INSERT INTO `cp_log` VALUES ('924', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:27:02');
INSERT INTO `cp_log` VALUES ('925', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:27:40');
INSERT INTO `cp_log` VALUES ('926', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:29:42');
INSERT INTO `cp_log` VALUES ('927', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:30:34');
INSERT INTO `cp_log` VALUES ('928', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:36:10');
INSERT INTO `cp_log` VALUES ('929', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:36:47');
INSERT INTO `cp_log` VALUES ('930', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:37:25');
INSERT INTO `cp_log` VALUES ('931', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:38:05');
INSERT INTO `cp_log` VALUES ('932', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:38:14');
INSERT INTO `cp_log` VALUES ('933', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:38:34');
INSERT INTO `cp_log` VALUES ('934', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:39:03');
INSERT INTO `cp_log` VALUES ('935', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:39:32');
INSERT INTO `cp_log` VALUES ('936', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:40:05');
INSERT INTO `cp_log` VALUES ('937', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:40:43');
INSERT INTO `cp_log` VALUES ('938', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:40:57');
INSERT INTO `cp_log` VALUES ('939', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:41:38');
INSERT INTO `cp_log` VALUES ('940', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:41:47');
INSERT INTO `cp_log` VALUES ('941', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:42:08');
INSERT INTO `cp_log` VALUES ('942', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:42:24');
INSERT INTO `cp_log` VALUES ('943', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:42:47');
INSERT INTO `cp_log` VALUES ('944', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:42:56');
INSERT INTO `cp_log` VALUES ('945', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:43:20');
INSERT INTO `cp_log` VALUES ('946', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:43:29');
INSERT INTO `cp_log` VALUES ('947', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:43:59');
INSERT INTO `cp_log` VALUES ('948', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:44:35');
INSERT INTO `cp_log` VALUES ('949', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:45:01');
INSERT INTO `cp_log` VALUES ('950', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:45:20');
INSERT INTO `cp_log` VALUES ('951', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:45:56');
INSERT INTO `cp_log` VALUES ('952', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:46:12');
INSERT INTO `cp_log` VALUES ('953', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:46:36');
INSERT INTO `cp_log` VALUES ('954', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:46:50');
INSERT INTO `cp_log` VALUES ('955', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:47:10');
INSERT INTO `cp_log` VALUES ('956', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:48:42');
INSERT INTO `cp_log` VALUES ('957', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:49:24');
INSERT INTO `cp_log` VALUES ('958', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:50:00');
INSERT INTO `cp_log` VALUES ('959', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:50:29');
INSERT INTO `cp_log` VALUES ('960', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:50:52');
INSERT INTO `cp_log` VALUES ('961', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:51:26');
INSERT INTO `cp_log` VALUES ('962', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:51:46');
INSERT INTO `cp_log` VALUES ('963', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:52:12');
INSERT INTO `cp_log` VALUES ('964', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:52:55');
INSERT INTO `cp_log` VALUES ('965', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:53:13');
INSERT INTO `cp_log` VALUES ('966', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:53:58');
INSERT INTO `cp_log` VALUES ('967', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:54:21');
INSERT INTO `cp_log` VALUES ('968', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:55:16');
INSERT INTO `cp_log` VALUES ('969', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:55:36');
INSERT INTO `cp_log` VALUES ('970', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:57:01');
INSERT INTO `cp_log` VALUES ('971', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 21:57:24');
INSERT INTO `cp_log` VALUES ('972', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 22:07:40');
INSERT INTO `cp_log` VALUES ('973', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 22:11:09');
INSERT INTO `cp_log` VALUES ('974', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 22:11:20');
INSERT INTO `cp_log` VALUES ('975', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 22:13:15');
INSERT INTO `cp_log` VALUES ('976', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 22:13:23');
INSERT INTO `cp_log` VALUES ('977', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 22:14:43');
INSERT INTO `cp_log` VALUES ('978', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 22:14:58');
INSERT INTO `cp_log` VALUES ('979', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 22:38:20');
INSERT INTO `cp_log` VALUES ('980', '', '0', 'content', '', 'content', '?m=content&c=content&a=delete', '', '1', 'admin', '114.243.112.4', '2018-06-14 22:38:53');
INSERT INTO `cp_log` VALUES ('981', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 22:39:01');
INSERT INTO `cp_log` VALUES ('982', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-14 22:39:24');
INSERT INTO `cp_log` VALUES ('983', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-14 22:40:33');
INSERT INTO `cp_log` VALUES ('984', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '114.243.112.4', '2018-06-15 10:50:23');
INSERT INTO `cp_log` VALUES ('985', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '114.243.112.4', '2018-06-15 10:50:41');
INSERT INTO `cp_log` VALUES ('986', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-15 10:51:31');
INSERT INTO `cp_log` VALUES ('987', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-15 10:53:01');
INSERT INTO `cp_log` VALUES ('988', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-15 10:53:13');
INSERT INTO `cp_log` VALUES ('989', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-15 10:54:20');
INSERT INTO `cp_log` VALUES ('990', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-15 10:54:26');
INSERT INTO `cp_log` VALUES ('991', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-15 10:55:20');
INSERT INTO `cp_log` VALUES ('992', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '114.243.112.4', '2018-06-15 10:55:33');
INSERT INTO `cp_log` VALUES ('993', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '114.243.112.4', '2018-06-15 10:55:45');
INSERT INTO `cp_log` VALUES ('994', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '114.243.112.4', '2018-06-15 11:10:58');
INSERT INTO `cp_log` VALUES ('995', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '114.243.112.4', '2018-06-15 11:11:16');
INSERT INTO `cp_log` VALUES ('996', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 11:11:51');
INSERT INTO `cp_log` VALUES ('997', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 11:12:01');
INSERT INTO `cp_log` VALUES ('998', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '114.243.112.4', '2018-06-15 11:12:21');
INSERT INTO `cp_log` VALUES ('999', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '118.144.141.157', '2018-06-15 13:24:19');
INSERT INTO `cp_log` VALUES ('1000', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '118.144.141.157', '2018-06-15 13:24:20');
INSERT INTO `cp_log` VALUES ('1001', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '118.144.141.157', '2018-06-15 13:24:30');
INSERT INTO `cp_log` VALUES ('1002', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '61.148.243.34', '2018-06-15 13:51:34');
INSERT INTO `cp_log` VALUES ('1003', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'admin', '61.148.243.34', '2018-06-15 13:51:56');
INSERT INTO `cp_log` VALUES ('1004', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 13:52:03');
INSERT INTO `cp_log` VALUES ('1005', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 13:52:26');
INSERT INTO `cp_log` VALUES ('1006', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 13:53:01');
INSERT INTO `cp_log` VALUES ('1007', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 13:53:15');
INSERT INTO `cp_log` VALUES ('1008', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 13:53:18');
INSERT INTO `cp_log` VALUES ('1009', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 13:53:18');
INSERT INTO `cp_log` VALUES ('1010', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 13:53:50');
INSERT INTO `cp_log` VALUES ('1011', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 13:54:11');
INSERT INTO `cp_log` VALUES ('1012', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 13:54:16');
INSERT INTO `cp_log` VALUES ('1013', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '61.148.243.34', '2018-06-15 13:54:46');
INSERT INTO `cp_log` VALUES ('1014', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 13:57:14');
INSERT INTO `cp_log` VALUES ('1015', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '61.148.243.34', '2018-06-15 13:57:33');
INSERT INTO `cp_log` VALUES ('1016', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '61.148.243.34', '2018-06-15 13:57:39');
INSERT INTO `cp_log` VALUES ('1017', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 14:22:08');
INSERT INTO `cp_log` VALUES ('1018', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 14:22:25');
INSERT INTO `cp_log` VALUES ('1019', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 14:22:29');
INSERT INTO `cp_log` VALUES ('1020', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 14:24:01');
INSERT INTO `cp_log` VALUES ('1021', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 14:24:05');
INSERT INTO `cp_log` VALUES ('1022', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 14:25:47');
INSERT INTO `cp_log` VALUES ('1023', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 14:25:51');
INSERT INTO `cp_log` VALUES ('1024', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '103.56.17.135', '2018-06-15 14:50:30');
INSERT INTO `cp_log` VALUES ('1025', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '103.56.17.135', '2018-06-15 14:50:32');
INSERT INTO `cp_log` VALUES ('1026', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '61.148.243.34', '2018-06-15 14:51:47');
INSERT INTO `cp_log` VALUES ('1027', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '61.148.243.34', '2018-06-15 14:51:47');
INSERT INTO `cp_log` VALUES ('1028', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '61.148.243.34', '2018-06-15 14:52:02');
INSERT INTO `cp_log` VALUES ('1029', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 14:52:26');
INSERT INTO `cp_log` VALUES ('1030', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 14:52:42');
INSERT INTO `cp_log` VALUES ('1031', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 14:52:46');
INSERT INTO `cp_log` VALUES ('1032', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 15:01:22');
INSERT INTO `cp_log` VALUES ('1033', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 15:01:26');
INSERT INTO `cp_log` VALUES ('1034', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 15:02:12');
INSERT INTO `cp_log` VALUES ('1035', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 15:02:17');
INSERT INTO `cp_log` VALUES ('1036', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 15:02:38');
INSERT INTO `cp_log` VALUES ('1037', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 15:02:42');
INSERT INTO `cp_log` VALUES ('1038', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 15:03:11');
INSERT INTO `cp_log` VALUES ('1039', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 15:03:15');
INSERT INTO `cp_log` VALUES ('1040', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 15:05:13');
INSERT INTO `cp_log` VALUES ('1041', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '61.148.243.34', '2018-06-15 15:05:17');
INSERT INTO `cp_log` VALUES ('1042', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '61.148.243.34', '2018-06-15 15:05:50');
INSERT INTO `cp_log` VALUES ('1043', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '61.148.243.34', '2018-06-15 15:05:50');
INSERT INTO `cp_log` VALUES ('1044', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '61.148.243.34', '2018-06-15 15:05:55');
INSERT INTO `cp_log` VALUES ('1045', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '61.148.243.34', '2018-06-15 15:06:04');
INSERT INTO `cp_log` VALUES ('1046', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '61.148.243.34', '2018-06-15 15:06:09');
INSERT INTO `cp_log` VALUES ('1047', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:03:34');
INSERT INTO `cp_log` VALUES ('1048', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:03:41');
INSERT INTO `cp_log` VALUES ('1049', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:03:47');
INSERT INTO `cp_log` VALUES ('1050', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:03:50');
INSERT INTO `cp_log` VALUES ('1051', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:03:53');
INSERT INTO `cp_log` VALUES ('1052', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:03:56');
INSERT INTO `cp_log` VALUES ('1053', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:03:59');
INSERT INTO `cp_log` VALUES ('1054', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:04:02');
INSERT INTO `cp_log` VALUES ('1055', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:04:05');
INSERT INTO `cp_log` VALUES ('1056', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:04:08');
INSERT INTO `cp_log` VALUES ('1057', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:04:11');
INSERT INTO `cp_log` VALUES ('1058', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:04:14');
INSERT INTO `cp_log` VALUES ('1059', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:04:17');
INSERT INTO `cp_log` VALUES ('1060', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:04:20');
INSERT INTO `cp_log` VALUES ('1061', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:04:23');
INSERT INTO `cp_log` VALUES ('1062', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:04:26');
INSERT INTO `cp_log` VALUES ('1063', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:04:29');
INSERT INTO `cp_log` VALUES ('1064', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:04:32');
INSERT INTO `cp_log` VALUES ('1065', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:04:35');
INSERT INTO `cp_log` VALUES ('1066', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '61.148.243.34', '2018-06-15 16:04:38');
INSERT INTO `cp_log` VALUES ('1067', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '114.243.112.4', '2018-06-15 16:18:19');
INSERT INTO `cp_log` VALUES ('1068', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '114.243.112.4', '2018-06-15 16:18:42');
INSERT INTO `cp_log` VALUES ('1069', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 16:19:14');
INSERT INTO `cp_log` VALUES ('1070', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 16:20:04');
INSERT INTO `cp_log` VALUES ('1071', '', '0', 'content', '', 'content', '?m=content&c=content&a=delete', '', '1', 'admin', '114.243.112.4', '2018-06-15 16:20:39');
INSERT INTO `cp_log` VALUES ('1072', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 16:34:41');
INSERT INTO `cp_log` VALUES ('1073', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 16:40:35');
INSERT INTO `cp_log` VALUES ('1074', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-15 16:50:15');
INSERT INTO `cp_log` VALUES ('1075', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '114.243.112.4', '2018-06-15 16:50:47');
INSERT INTO `cp_log` VALUES ('1076', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '114.243.112.4', '2018-06-15 17:06:30');
INSERT INTO `cp_log` VALUES ('1077', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '114.243.112.4', '2018-06-15 17:06:50');
INSERT INTO `cp_log` VALUES ('1078', '', '0', 'content', '', 'content', '?m=content&c=content&a=listorder', '', '1', 'admin', '114.243.112.4', '2018-06-15 17:09:49');
INSERT INTO `cp_log` VALUES ('1079', '', '0', 'content', '', 'content', '?m=content&c=content&a=listorder', '', '1', 'admin', '114.243.112.4', '2018-06-15 17:09:50');
INSERT INTO `cp_log` VALUES ('1080', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '61.148.243.34', '2018-06-15 17:13:58');
INSERT INTO `cp_log` VALUES ('1081', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '61.148.243.34', '2018-06-15 17:14:12');
INSERT INTO `cp_log` VALUES ('1082', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '61.148.243.34', '2018-06-15 17:14:13');
INSERT INTO `cp_log` VALUES ('1083', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '61.148.243.34', '2018-06-15 17:14:24');
INSERT INTO `cp_log` VALUES ('1084', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '114.243.112.4', '2018-06-15 17:18:56');
INSERT INTO `cp_log` VALUES ('1085', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '114.243.112.4', '2018-06-15 17:38:54');
INSERT INTO `cp_log` VALUES ('1086', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '114.243.112.4', '2018-06-15 17:39:17');
INSERT INTO `cp_log` VALUES ('1087', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 17:40:00');
INSERT INTO `cp_log` VALUES ('1088', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 17:40:36');
INSERT INTO `cp_log` VALUES ('1089', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 17:41:44');
INSERT INTO `cp_log` VALUES ('1090', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 17:41:59');
INSERT INTO `cp_log` VALUES ('1091', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 17:51:26');
INSERT INTO `cp_log` VALUES ('1092', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 17:51:53');
INSERT INTO `cp_log` VALUES ('1093', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '61.148.243.34', '2018-06-15 18:17:50');
INSERT INTO `cp_log` VALUES ('1094', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '61.148.243.34', '2018-06-15 18:17:59');
INSERT INTO `cp_log` VALUES ('1095', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '114.243.112.4', '2018-06-15 18:57:01');
INSERT INTO `cp_log` VALUES ('1096', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '114.243.112.4', '2018-06-15 18:57:04');
INSERT INTO `cp_log` VALUES ('1097', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '114.243.112.4', '2018-06-15 18:57:21');
INSERT INTO `cp_log` VALUES ('1098', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 18:58:37');
INSERT INTO `cp_log` VALUES ('1099', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 18:59:30');
INSERT INTO `cp_log` VALUES ('1100', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 19:12:41');
INSERT INTO `cp_log` VALUES ('1101', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 19:13:28');
INSERT INTO `cp_log` VALUES ('1102', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 19:19:59');
INSERT INTO `cp_log` VALUES ('1103', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '114.243.112.4', '2018-06-15 19:20:50');
INSERT INTO `cp_log` VALUES ('1104', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '114.243.112.4', '2018-06-15 19:22:17');
INSERT INTO `cp_log` VALUES ('1105', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '61.148.243.34', '2018-06-15 21:30:15');
INSERT INTO `cp_log` VALUES ('1106', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '61.148.243.34', '2018-06-15 21:30:15');
INSERT INTO `cp_log` VALUES ('1107', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '61.148.243.34', '2018-06-15 21:30:31');

-- ----------------------------
-- Table structure for `cp_member`
-- ----------------------------
DROP TABLE IF EXISTS `cp_member`;
CREATE TABLE `cp_member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `phpssouid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` char(32) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `connectid` char(40) NOT NULL DEFAULT '',
  `from` char(10) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20)),
  KEY `phpssouid` (`phpssouid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_member
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_member_detail`
-- ----------------------------
DROP TABLE IF EXISTS `cp_member_detail`;
CREATE TABLE `cp_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_member_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_member_group`
-- ----------------------------
DROP TABLE IF EXISTS `cp_member_group`;
CREATE TABLE `cp_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `allowmessage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowvisit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_member_group
-- ----------------------------
INSERT INTO `cp_member_group` VALUES ('8', '游客', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '', '0', '0');
INSERT INTO `cp_member_group` VALUES ('2', '新手上路', '1', '1', '50', '100', '1', '1', '0', '0', '0', '1', '0', '0', '50.00', '10.00', '1.00', '', '', '', '2', '0');
INSERT INTO `cp_member_group` VALUES ('6', '注册会员', '1', '2', '100', '150', '0', '1', '0', '0', '1', '1', '0', '0', '300.00', '30.00', '1.00', '', '', '', '6', '0');
INSERT INTO `cp_member_group` VALUES ('4', '中级会员', '1', '3', '150', '500', '1', '1', '0', '1', '1', '1', '0', '0', '500.00', '60.00', '1.00', '', '', '', '4', '0');
INSERT INTO `cp_member_group` VALUES ('5', '高级会员', '1', '5', '300', '999', '1', '1', '0', '1', '1', '1', '0', '0', '360.00', '90.00', '5.00', '', '', '', '5', '0');
INSERT INTO `cp_member_group` VALUES ('1', '禁止访问', '1', '0', '0', '0', '1', '1', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '0', '0', '0');
INSERT INTO `cp_member_group` VALUES ('7', '邮件认证', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', 'images/group/vip.jpg', '#000000', '', '7', '0');

-- ----------------------------
-- Table structure for `cp_member_menu`
-- ----------------------------
DROP TABLE IF EXISTS `cp_member_menu`;
CREATE TABLE `cp_member_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `isurl` enum('1','0') NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_member_menu
-- ----------------------------
INSERT INTO `cp_member_menu` VALUES ('1', 'member_init', '0', 'member', 'index', 'init', 't=0', '0', '1', '', '');
INSERT INTO `cp_member_menu` VALUES ('2', 'account_manage', '0', 'member', 'index', 'account_manage', 't=1', '0', '1', '', '');
INSERT INTO `cp_member_menu` VALUES ('3', 'favorite', '0', 'member', 'index', 'favorite', 't=2', '0', '1', '', '');

-- ----------------------------
-- Table structure for `cp_member_verify`
-- ----------------------------
DROP TABLE IF EXISTS `cp_member_verify`;
CREATE TABLE `cp_member_verify` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `modelinfo` char(255) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message` char(100) DEFAULT NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_member_verify
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_member_vip`
-- ----------------------------
DROP TABLE IF EXISTS `cp_member_vip`;
CREATE TABLE `cp_member_vip` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_member_vip
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_menu`
-- ----------------------------
DROP TABLE IF EXISTS `cp_menu`;
CREATE TABLE `cp_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `project1` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project3` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project4` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project5` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=1530 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_menu
-- ----------------------------
INSERT INTO `cp_menu` VALUES ('1', 'sys_setting', '0', 'admin', 'setting', 'init', '', '1', '1', '0', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('2', 'module', '0', 'admin', 'module', 'init', '', '2', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('872', 'sync_release_point', '873', 'release', 'index', 'init', '', '3', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('4', 'content', '0', 'content', 'content', 'init', '', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('5', 'members', '0', 'member', 'member', 'init', '', '5', '0', '0', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('6', 'userinterface', '0', 'template', 'style', 'init', '', '6', '0', '0', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('30', 'correlative_setting', '1', 'admin', 'admin', 'admin', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('31', 'menu_manage', '977', 'admin', 'menu', 'init', '', '8', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('32', 'posid_manage', '975', 'admin', 'position', 'init', '', '7', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('29', 'module_list', '2', 'admin', 'module', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('82', 'module_manage', '2', 'admin', 'module', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('10', 'panel', '0', 'admin', 'index', 'public_main', '', '0', '0', '0', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('35', 'menu_add', '31', 'admin', 'menu', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('826', 'template_manager', '6', '', '', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('54', 'admin_manage', '49', 'admin', 'admin_manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('43', 'category_manage', '975', 'admin', 'category', 'init', 'module=admin', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('42', 'add_category', '43', 'admin', 'category', 'add', 's=0', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('44', 'edit_category', '43', 'admin', 'category', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('45', 'badword_manage', '977', 'admin', 'badword', 'init', '', '10', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('46', 'posid_add', '32', 'admin', 'position', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('49', 'admin_setting', '1', 'admin', '', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('50', 'role_manage', '49', 'admin', 'role', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('51', 'role_add', '50', 'admin', 'role', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('52', 'category_cache', '43', 'admin', 'category', 'public_cache', 'module=admin', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('55', 'manage_member', '5', 'member', 'member', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('58', 'admin_add', '54', 'admin', 'admin_manage', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('59', 'model_manage', '975', 'content', 'sitemodel', 'init', '', '5', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('64', 'site_management', '30', 'admin', 'site', 'init', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('81', 'member_add', '72', 'member', 'member', 'add', '', '2', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('62', 'add_model', '59', 'content', 'sitemodel', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('65', 'release_point_management', '30', 'admin', 'release_point', 'init', '', '3', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('66', 'badword_export', '45', 'admin', 'badword', 'export', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('67', 'add_site', '64', 'admin', 'site', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('68', 'badword_import', '45', 'admin', 'badword', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('812', 'member_group_manage', '76', 'member', 'member_group', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('74', 'member_verify', '55', 'member', 'member_verify', 'manage', 's=0', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('76', 'manage_member_group', '5', 'member', 'member_group', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('77', 'manage_member_model', '5', 'member', 'member_model', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('78', 'member_group_add', '812', 'member', 'member_group', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('79', 'member_model_add', '813', 'member', 'member_model', 'add', '', '1', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('80', 'member_model_import', '77', 'member', 'member_model', 'import', '', '2', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('72', 'member_manage', '55', 'member', 'member', 'manage', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('813', 'member_model_manage', '77', 'member', 'member_model', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('814', 'site_edit', '64', 'admin', 'site', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('815', 'site_del', '64', 'admin', 'site', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('816', 'release_point_add', '65', 'admin', 'release_point', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('817', 'release_point_del', '65', 'admin', 'release_point', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('818', 'release_point_edit', '65', 'admin', 'release_point', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('821', 'content_publish', '4', 'content', 'content', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('822', 'content_manage', '821', 'content', 'content', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('867', 'linkage', '977', 'admin', 'linkage', 'init', '', '13', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('827', 'template_style', '826', 'template', 'style', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('828', 'import_style', '827', 'template', 'style', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('831', 'template_export', '827', 'template', 'style', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('830', 'template_file', '827', 'template', 'file', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('832', 'template_onoff', '827', 'template', 'style', 'disable', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('833', 'template_updatename', '827', 'template', 'style', 'updatename', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('834', 'member_lock', '72', 'member', 'member', 'lock', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('835', 'member_unlock', '72', 'member', 'member', 'unlock', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('836', 'member_move', '72', 'member', 'member', 'move', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('837', 'member_delete', '72', 'member', 'member', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('842', 'verify_ignore', '74', 'member', 'member_verify', 'manage', 's=2', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('839', 'member_setting', '55', 'member', 'member_setting', 'manage', '', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('841', 'verify_pass', '74', 'member', 'member_verify', 'manage', 's=1', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('843', 'verify_delete', '74', 'member', 'member_verify', 'manage', 's=3', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('844', 'verify_deny', '74', 'member', 'member_verify', 'manage', 's=4', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('845', 'never_pass', '74', 'member', 'member_verify', 'manage', 's=5', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('846', 'template_file_list', '827', 'template', 'file', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('847', 'template_file_edit', '827', 'template', 'file', 'edit_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('848', 'file_add_file', '827', 'template', 'file', 'add_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('850', 'listorder', '76', 'member', 'member_group', 'sort', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('852', 'priv_setting', '50', 'admin', 'role', 'priv_setting', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('853', 'role_priv', '50', 'admin', 'role', 'role_priv', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('857', 'attachment_manage', '821', 'attachment', 'manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('868', 'special', '821', 'special', 'special', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('869', 'template_editor', '827', 'template', 'file', 'edit_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('870', 'template_visualization', '827', 'template', 'file', 'visualization', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('871', 'pc_tag_edit', '827', 'template', 'file', 'edit_pc_tag', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('873', 'release_manage', '4', 'release', 'html', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('874', 'type_manage', '975', 'content', 'type_manage', 'init', '', '6', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('875', 'add_type', '874', 'content', 'type_manage', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('876', 'linkageadd', '867', 'admin', 'linkage', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('877', 'failure_list', '872', 'release', 'index', 'failed', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('879', 'member_search', '72', 'member', 'member', 'search', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('880', 'queue_del', '872', 'release', 'index', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('881', 'member_model_delete', '813', 'member', 'member_model', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('882', 'member_model_edit', '813', 'member', 'member_model', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('885', 'workflow', '977', 'content', 'workflow', 'init', '', '15', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('888', 'add_workflow', '885', 'content', 'workflow', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('889', 'member_modelfield_add', '813', 'member', 'member_modelfield', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('890', 'member_modelfield_edit', '813', 'member', 'member_modelfield', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('891', 'member_modelfield_delete', '813', 'member', 'member_modelfield', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('892', 'member_modelfield_manage', '813', 'member', 'member_modelfield', 'manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('895', 'sitemodel_import', '59', 'content', 'sitemodel', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('896', 'pay', '29', 'pay', 'payment', 'pay_list', 's=3', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('897', 'payments', '896', 'pay', 'payment', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('898', 'paylist', '896', 'pay', 'payment', 'pay_list', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('899', 'add_content', '822', 'content', 'content', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('900', 'modify_deposit', '896', 'pay', 'payment', 'modify_deposit', 's=1', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('901', 'check_content', '822', 'content', 'content', 'pass', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('902', 'dbsource', '29', 'dbsource', 'data', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('905', 'create_content_html', '873', 'content', 'create_html', 'show', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('904', 'external_data_sources', '902', 'dbsource', 'dbsource_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('906', 'update_urls', '873', 'content', 'create_html', 'update_urls', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('960', 'node_add', '957', 'collection', 'node', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('909', 'fulltext_search', '29', 'search', 'search_type', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('910', 'manage_type', '909', 'search', 'search_type', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('911', 'search_setting', '909', 'search', 'search_admin', 'setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('912', 'createindex', '909', 'search', 'search_admin', 'createindex', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('913', 'add_search_type', '909', 'search', 'search_type', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('914', 'database_toos', '977', 'admin', 'database', 'export', '', '6', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('915', 'database_export', '914', 'admin', 'database', 'export', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('916', 'database_import', '914', 'admin', 'database', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('917', 'dbsource_add', '902', 'dbsource', 'dbsource_admin', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('918', 'dbsource_edit', '902', 'dbsource', 'dbsource_admin', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('919', 'dbsource_del', '902', 'dbsource', 'dbsource_admin', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('920', 'dbsource_data_add', '902', 'dbsource', 'data', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('921', 'dbsource_data_edit', '902', 'dbsource', 'data', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('922', 'dbsource_data_del', '902', 'dbsource', 'data', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('926', 'add_special', '868', 'special', 'special', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('927', 'edit_special', '868', 'special', 'special', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('928', 'special_list', '868', 'special', 'special', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('929', 'special_elite', '868', 'special', 'special', 'elite', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('930', 'delete_special', '868', 'special', 'special', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('931', 'badword_add', '45', 'admin', 'badword', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('932', 'badword_edit', '45', 'admin', 'badword', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('933', 'badword_delete', '45', 'admin', 'badword', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('934', 'special_listorder', '868', 'special', 'special', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('935', 'special_content_list', '868', 'special', 'content', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('936', 'special_content_add', '935', 'special', 'content', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('937', 'special_content_list', '935', 'special', 'content', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('938', 'special_content_edit', '935', 'special', 'content', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('939', 'special_content_delete', '935', 'special', 'content', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('940', 'special_content_listorder', '935', 'special', 'content', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('941', 'special_content_import', '935', 'special', 'special', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('942', 'history_version', '827', 'template', 'template_bak', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('943', 'restore_version', '827', 'template', 'template_bak', 'restore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('944', 'del_history_version', '827', 'template', 'template_bak', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('945', 'block', '821', 'block', 'block_admin', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('946', 'block_add', '945', 'block', 'block_admin', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('950', 'block_edit', '945', 'block', 'block_admin', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('951', 'block_del', '945', 'block', 'block_admin', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('952', 'block_update', '945', 'block', 'block_admin', 'block_update', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('953', 'block_restore', '945', 'block', 'block_admin', 'history_restore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('954', 'history_del', '945', 'block', 'block_admin', 'history_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('978', 'urlrule_manage', '977', 'admin', 'urlrule', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('957', 'collection_node', '821', 'collection', 'node', 'manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('979', 'safe_config', '30', 'admin', 'setting', 'init', '&tab=2', '11', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('959', 'basic_config', '30', 'admin', 'setting', 'init', '', '10', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('961', 'position_edit', '32', 'admin', 'position', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('962', 'collection_node_edit', '957', 'collection', 'node', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('963', 'collection_node_delete', '957', 'collection', 'node', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('990', 'col_url_list', '957', 'collection', 'node', 'col_url_list', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('965', 'collection_node_publish', '957', 'collection', 'node', 'publist', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('966', 'collection_node_import', '957', 'collection', 'node', 'node_import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('967', 'collection_node_export', '957', 'collection', 'node', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('968', 'collection_node_collection_content', '957', 'collection', 'node', 'col_content', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('969', 'googlesitemap', '977', 'admin', 'googlesitemap', 'set', '', '11', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('970', 'admininfo', '10', 'admin', 'admin_manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('971', 'editpwd', '970', 'admin', 'admin_manage', 'public_edit_pwd', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('972', 'editinfo', '970', 'admin', 'admin_manage', 'public_edit_info', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('973', 'keylink', '977', 'admin', 'keylink', 'init', '', '12', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('974', 'add_keylink', '973', 'admin', 'keylink', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('975', 'content_settings', '4', 'content', 'content_settings', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('7', 'extend', '0', 'admin', 'extend', 'init_extend', '', '7', '1', '0', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('977', 'extend_all', '7', 'admin', 'extend_all', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('980', 'sso_config', '30', 'admin', 'setting', 'init', '&tab=3', '12', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('981', 'email_config', '30', 'admin', 'setting', 'init', '&tab=4', '13', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('982', 'module_manage', '82', 'admin', 'module', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('983', 'ipbanned', '977', 'admin', 'ipbanned', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('984', 'add_ipbanned', '983', 'admin', 'ipbanned', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('993', 'collection_content_import', '957', 'collection', 'node', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('991', 'copy_node', '957', 'collection', 'node', 'copy', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('992', 'content_del', '957', 'collection', 'node', 'content_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('989', 'downsites', '977', 'admin', 'downservers', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('994', 'import_program_add', '957', 'collection', 'node', 'import_program_add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('995', 'import_program_del', '957', 'collection', 'node', 'import_program_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('996', 'import_content', '957', 'collection', 'node', 'import_content', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('997', 'log', '977', 'admin', 'log', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('998', 'add_page', '43', 'admin', 'category', 'add', 's=1', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('999', 'add_cat_link', '43', 'admin', 'category', 'add', 's=2', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1000', 'count_items', '43', 'admin', 'category', 'count_items', '', '5', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1001', 'cache_all', '977', 'admin', 'cache_all', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1002', 'create_list_html', '873', 'content', 'create_html', 'category', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1003', 'create_html_quick', '10', 'content', 'create_html_opt', 'index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1004', 'create_index', '1003', 'content', 'create_html', 'public_index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1005', 'scan', '977', 'scan', 'index', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1006', 'scan_report', '1005', 'scan', 'index', 'scan_report', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1007', 'md5_creat', '1005', 'scan', 'index', 'md5_creat', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1008', 'album_import', '868', 'special', 'album', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('8', 'phpsso', '0', 'admin', 'phpsso', 'menu', '', '7', '0', '0', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1011', 'edit_content', '822', 'content', 'content', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1012', 'push_to_special', '822', 'content', 'push', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1023', 'delete_log', '997', 'admin', 'log', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1024', 'delete_ip', '983', 'admin', 'ipbanned', 'delete', '', '0', '0', '0', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1026', 'delete_keylink', '973', 'admin', 'keylink', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1027', 'edit_keylink', '973', 'admin', 'keylink', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1034', 'operation_pass', '74', 'member', 'member_verify', 'pass', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1035', 'operation_delete', '74', 'member', 'member_verify', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1039', 'operation_ignore', '74', 'member', 'member_verify', 'ignore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1038', 'settingsave', '30', 'admin', 'setting', 'save', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1040', 'admin_edit', '54', 'admin', 'admin_manage', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1041', 'operation_reject', '74', 'member', 'member_verify', 'reject', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1042', 'admin_delete', '54', 'admin', 'admin_manage', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1043', 'card', '54', 'admin', 'admin_manage', 'card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1044', 'creat_card', '54', 'admin', 'admin_manage', 'creat_card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1045', 'remove_card', '54', 'admin', 'admin_manage', 'remove_card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1049', 'member_group_edit', '812', 'member', 'member_group', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1048', 'member_edit', '72', 'member', 'member', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1050', 'role_edit', '50', 'admin', 'role', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1051', 'member_group_delete', '812', 'member', 'member_group', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1052', 'member_manage', '50', 'admin', 'role', 'member_manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1053', 'role_delete', '50', 'admin', 'role', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1054', 'member_model_export', '77', 'member', 'member_model', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1055', 'member_model_sort', '77', 'member', 'member_model', 'sort', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1056', 'member_model_move', '77', 'member', 'member_model', 'move', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1057', 'payment_add', '897', 'pay', 'payment', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1058', 'payment_delete', '897', 'pay', 'payment', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1059', 'payment_edit', '897', 'pay', 'payment', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1060', 'spend_record', '896', 'pay', 'spend', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1061', 'pay_stat', '896', 'pay', 'payment', 'pay_stat', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1062', 'fields_manage', '59', 'content', 'sitemodel_field', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1063', 'edit_model_content', '59', 'content', 'sitemodel', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1064', 'disabled_model', '59', 'content', 'sitemodel', 'disabled', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1065', 'delete_model', '59', 'content', 'sitemodel', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1066', 'export_model', '59', 'content', 'sitemodel', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1067', 'delete', '874', 'content', 'type_manage', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1068', 'edit', '874', 'content', 'type_manage', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1069', 'add_urlrule', '978', 'admin', 'urlrule', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1070', 'edit_urlrule', '978', 'admin', 'urlrule', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1071', 'delete_urlrule', '978', 'admin', 'urlrule', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1072', 'edit_menu', '31', 'admin', 'menu', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1073', 'delete_menu', '31', 'admin', 'menu', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1074', 'edit_workflow', '885', 'content', 'workflow', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1075', 'delete_workflow', '885', 'content', 'workflow', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1076', 'creat_html', '868', 'special', 'special', 'html', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1093', 'connect_config', '30', 'admin', 'setting', 'init', '&tab=5', '14', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1102', 'view_modelinfo', '74', 'member', 'member_verify', 'modelinfo', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1202', 'create_special_list', '868', 'special', 'special', 'create_special_list', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1240', 'view_memberlinfo', '72', 'member', 'member', 'memberinfo', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1239', 'copyfrom_manage', '977', 'admin', 'copyfrom', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1241', 'move_content', '822', 'content', 'content', 'remove', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1242', 'poster_template', '56', 'poster', 'space', 'poster_template', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1243', 'create_index', '873', 'content', 'create_html', 'public_index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1244', 'add_othors', '822', 'content', 'content', 'add_othors', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1295', 'attachment_manager_dir', '857', 'attachment', 'manage', 'dir', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1296', 'attachment_manager_db', '857', 'attachment', 'manage', 'init', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1346', 'attachment_address_replace', '857', 'attachment', 'address', 'init', '', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1347', 'attachment_address_update', '857', 'attachment', 'address', 'update', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1348', 'delete_content', '822', 'content', 'content', 'delete', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1349', 'member_menu_manage', '977', 'member', 'member_menu', 'manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1350', 'member_menu_add', '1349', 'member', 'member_menu', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1351', 'member_menu_edit', '1349', 'member', 'member_menu', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1352', 'member_menu_delete', '1349', 'member', 'member_menu', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1353', 'batch_show', '822', 'content', 'create_html', 'batch_show', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1354', 'pay_delete', '898', 'pay', 'payment', 'pay_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1355', 'pay_cancel', '898', 'pay', 'payment', 'pay_cancel', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1356', 'discount', '898', 'pay', 'payment', 'discount', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1360', 'category_batch_edit', '43', 'admin', 'category', 'batch_edit', '', '6', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1500', 'listorder', '822', 'content', 'content', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1501', 'a_clean_data', '873', 'content', 'content', 'clear_data', '', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `cp_menu` VALUES ('1502', 'announce', '29', 'announce', 'admin_announce', 'init', 's=1', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1503', 'announce_add', '1502', 'announce', 'admin_announce', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1504', 'edit_announce', '1502', 'announce', 'admin_announce', 'edit', 's=1', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1505', 'check_announce', '1502', 'announce', 'admin_announce', 'init', 's=2', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1506', 'overdue', '1502', 'announce', 'admin_announce', 'init', 's=3', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1507', 'del_announce', '1502', 'announce', 'admin_announce', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1508', 'link', '4', 'link', 'link', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1509', 'add_link', '1508', 'link', 'link', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1510', 'edit_link', '1508', 'link', 'link', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1511', 'delete_link', '1508', 'link', 'link', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1512', 'link_setting', '1508', 'link', 'link', 'setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1513', 'add_type', '1508', 'link', 'link', 'add_type', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1514', 'list_type', '1508', 'link', 'link', 'list_type', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1515', 'check_register', '1508', 'link', 'link', 'check_register', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1516', 'poster', '29', 'poster', 'space', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1517', 'add_space', '1516', 'poster', 'space', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1518', 'edit_space', '1516', 'poster', 'space', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1519', 'del_space', '1516', 'poster', 'space', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1520', 'poster_list', '1516', 'poster', 'poster', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1521', 'add_poster', '1516', 'poster', 'poster', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1522', 'edit_poster', '1516', 'poster', 'poster', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1523', 'del_poster', '1516', 'poster', 'poster', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1524', 'poster_stat', '1516', 'poster', 'poster', 'stat', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1525', 'poster_setting', '1516', 'poster', 'space', 'setting', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1526', 'create_poster_js', '1516', 'poster', 'space', 'create_js', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1527', 'poster_template', '1516', 'poster', 'space', 'poster_template', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1528', 'upgrade', '977', 'upgrade', 'index', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `cp_menu` VALUES ('1529', 'checkfile', '1528', 'upgrade', 'index', 'checkfile', '', '0', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `cp_model`
-- ----------------------------
DROP TABLE IF EXISTS `cp_model`;
CREATE TABLE `cp_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `items` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_style` char(30) NOT NULL,
  `category_template` char(30) NOT NULL,
  `list_template` char(30) NOT NULL,
  `show_template` char(30) NOT NULL,
  `js_template` varchar(30) NOT NULL,
  `admin_list_template` char(30) NOT NULL,
  `member_add_template` varchar(30) NOT NULL,
  `member_list_template` varchar(30) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_model
-- ----------------------------
INSERT INTO `cp_model` VALUES ('1', '1', '文章模型', '', 'news', '', '0', '0', '1', '0', 'default', 'category', 'list', 'show', '', '', '', '', '0', '0');
INSERT INTO `cp_model` VALUES ('2', '1', '下载模型', '', 'download', '', '0', '0', '1', '0', 'default', 'category_download', 'list_download', 'show_download', '', '', '', '', '0', '0');
INSERT INTO `cp_model` VALUES ('3', '1', '图片模型', '', 'picture', '', '0', '0', '1', '0', 'default', 'category_picture', 'list_picture', 'show_picture', '', '', '', '', '0', '0');
INSERT INTO `cp_model` VALUES ('10', '1', '普通会员', '普通会员', 'member_detail', '', '0', '0', '1', '0', '', '', '', '', '', '', '', '', '0', '2');
INSERT INTO `cp_model` VALUES ('11', '1', '视频模型', '', 'video', '', '0', '0', '1', '0', 'default', 'category_video', 'list_video', 'show_video', '', '', '', '', '0', '0');
INSERT INTO `cp_model` VALUES ('12', '1', '轮播图', '首页轮播图', 'round', '', '0', '0', '1', '0', 'cp', 'category', 'list', 'show', '', 'content_list', '', '', '0', '0');
INSERT INTO `cp_model` VALUES ('13', '1', '活动专区', '活动专区', 'activity', '', '0', '0', '1', '0', '', '', '', '', '', '', '', '', '0', '0');
INSERT INTO `cp_model` VALUES ('14', '1', '中奖', '', 'price', '', '0', '0', '1', '0', '', '', '', '', '', '', '', '', '0', '0');

-- ----------------------------
-- Table structure for `cp_model_field`
-- ----------------------------
DROP TABLE IF EXISTS `cp_model_field`;
CREATE TABLE `cp_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_model_field
-- ----------------------------
INSERT INTO `cp_model_field` VALUES ('1', '1', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `cp_model_field` VALUES ('2', '1', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '1', '0');
INSERT INTO `cp_model_field` VALUES ('3', '1', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `cp_model_field` VALUES ('4', '1', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `cp_model_field` VALUES ('5', '1', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '1', '0');
INSERT INTO `cp_model_field` VALUES ('6', '1', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `cp_model_field` VALUES ('7', '1', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `cp_model_field` VALUES ('8', '1', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `cp_model_field` VALUES ('9', '1', '1', 'voteid', '添加投票', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'text\\\' name=\\\'info[voteid]\\\' id=\\\'voteid\\\' value=\\\'{FIELD_VALUE}\\\' size=\\\'3\\\'> \r\n<input type=\\\'button\\\' value=\"选择已有投票\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=vote&c=vote&a=public_get_votelist&from_api=1\\\',\\\'选择已有投票\\\')\" class=\"button\">\r\n<input type=\\\'button\\\' value=\"新增投票\" onclick=\"omnipotent(\\\'addvote\\\',\\\'?m=vote&c=vote&a=add&from_api=1\\\',\\\'添加投票\\\',0)\" class=\"button\">\',\n  \'fieldtype\' => \'mediumint\',\n  \'minnumber\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '1', '0', '21', '1', '0');
INSERT INTO `cp_model_field` VALUES ('10', '1', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '1', '0');
INSERT INTO `cp_model_field` VALUES ('11', '1', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `cp_model_field` VALUES ('12', '1', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '1', '0');
INSERT INTO `cp_model_field` VALUES ('13', '1', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `cp_model_field` VALUES ('14', '1', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `cp_model_field` VALUES ('15', '1', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `cp_model_field` VALUES ('16', '1', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `cp_model_field` VALUES ('17', '1', '1', 'groupids_view', '阅读权限', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '1', '0');
INSERT INTO `cp_model_field` VALUES ('19', '1', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '1', '0');
INSERT INTO `cp_model_field` VALUES ('20', '1', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '1', '0');
INSERT INTO `cp_model_field` VALUES ('21', '1', '1', 'copyfrom', '来源', '', '', '0', '100', '', '', 'copyfrom', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '1', '0');
INSERT INTO `cp_model_field` VALUES ('80', '1', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `cp_model_field` VALUES ('22', '2', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `cp_model_field` VALUES ('23', '2', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '1', '0');
INSERT INTO `cp_model_field` VALUES ('24', '2', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `cp_model_field` VALUES ('25', '2', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `cp_model_field` VALUES ('26', '2', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `cp_model_field` VALUES ('27', '2', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `cp_model_field` VALUES ('28', '2', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `cp_model_field` VALUES ('29', '2', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `cp_model_field` VALUES ('30', '2', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `cp_model_field` VALUES ('31', '2', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '1', '0');
INSERT INTO `cp_model_field` VALUES ('32', '2', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `cp_model_field` VALUES ('33', '2', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `cp_model_field` VALUES ('34', '2', '1', 'groupids_view', '阅读权限', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `cp_model_field` VALUES ('35', '2', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `cp_model_field` VALUES ('36', '2', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `cp_model_field` VALUES ('37', '2', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `cp_model_field` VALUES ('38', '2', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `cp_model_field` VALUES ('39', '2', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `cp_model_field` VALUES ('40', '2', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `cp_model_field` VALUES ('41', '2', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `cp_model_field` VALUES ('42', '2', '1', 'downfiles', '本地下载', '', '', '0', '0', '', '', 'downfiles', 'array (\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'10\',\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `cp_model_field` VALUES ('43', '2', '1', 'downfile', '镜像下载', '', '', '0', '0', '', '', 'downfile', 'array (\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `cp_model_field` VALUES ('44', '2', '1', 'systems', '软件平台', '<select name=\'selectSystem\' onchange=\"ChangeInput(this,document.myform.systems,\'/\')\">\r\n	<option value=\'WinXP\'>WinXP</option>\r\n	<option value=\'Vista\'>Windows 7</option>\r\n	<option value=\'Win2000\'>Win2000</option>\r\n	<option value=\'Win2003\'>Win2003</option>\r\n	<option value=\'Unix\'>Unix</option>\r\n	<option value=\'Linux\'>Linux</option>\r\n	<option value=\'MacOS\'>MacOS</option>\r\n</select>', '', '0', '100', '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'Win2000/WinXP/Win2003\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '0', '14', '0', '0');
INSERT INTO `cp_model_field` VALUES ('45', '2', '1', 'copytype', '软件授权形式', '', '', '0', '15', '', '', 'box', 'array (\n  \'options\' => \'免费版|免费版\r\n共享版|共享版\r\n试用版|试用版\r\n演示版|演示版\r\n注册版|注册版\r\n破解版|破解版\r\n零售版|零售版\r\nOEM版|OEM版\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'免费版\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '12', '0', '0');
INSERT INTO `cp_model_field` VALUES ('46', '2', '1', 'language', '软件语言', '', '', '0', '16', '', '', 'box', 'array (\n  \'options\' => \'英文|英文\r\n简体中文|简体中文\r\n繁体中文|繁体中文\r\n简繁中文|简繁中文\r\n多国语言|多国语言\r\n其他语言|其他语言\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'简体中文\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '13', '0', '0');
INSERT INTO `cp_model_field` VALUES ('47', '2', '1', 'classtype', '软件类型', '', '', '0', '20', '', '', 'box', 'array (\n  \'options\' => \'国产软件|国产软件\r\n国外软件|国外软件\r\n汉化补丁|汉化补丁\r\n程序源码|程序源码\r\n其他|其他\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'国产软件\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '17', '0', '0');
INSERT INTO `cp_model_field` VALUES ('48', '2', '1', 'version', '版本号', '', '', '0', '20', '', '', 'text', 'array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `cp_model_field` VALUES ('49', '2', '1', 'filesize', '文件大小', '', '', '0', '10', '', '', 'text', 'array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'未知\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '1', '0', '14', '0', '0');
INSERT INTO `cp_model_field` VALUES ('50', '2', '1', 'stars', '评分等级', '', '', '0', '20', '', '', 'box', 'array (\n  \'options\' => \'★☆☆☆☆|★☆☆☆☆\r\n★★☆☆☆|★★☆☆☆\r\n★★★☆☆|★★★☆☆\r\n★★★★☆|★★★★☆\r\n★★★★★|★★★★★\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'★★★☆☆\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '17', '0', '0');
INSERT INTO `cp_model_field` VALUES ('52', '3', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `cp_model_field` VALUES ('53', '3', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `cp_model_field` VALUES ('54', '3', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `cp_model_field` VALUES ('55', '3', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '1', '0');
INSERT INTO `cp_model_field` VALUES ('57', '3', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `cp_model_field` VALUES ('111', '3', '1', 'img', '上传二维码', '', '', '0', '0', '', '', 'image', '{\"size\":\"\",\"defaultvalue\":\"\",\"show_type\":\"1\",\"upload_allowext\":\"gif|jpg|jpeg|png|bmp\",\"watermark\":\"0\",\"isselectimage\":\"1\",\"images_width\":\"\",\"images_height\":\"\"}', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '5', '0', '0');
INSERT INTO `cp_model_field` VALUES ('112', '12', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `cp_model_field` VALUES ('113', '12', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '1', '0');
INSERT INTO `cp_model_field` VALUES ('114', '12', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `cp_model_field` VALUES ('115', '12', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '1', '0');
INSERT INTO `cp_model_field` VALUES ('60', '3', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '1', '0');
INSERT INTO `cp_model_field` VALUES ('110', '3', '1', 'description', '安德森', '', '', '0', '0', '', '', 'text', '{\"size\":\"50\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}', '', '', '', '0', '1', '0', '1', '0', '1', '1', '0', '0', '1', '0');
INSERT INTO `cp_model_field` VALUES ('117', '12', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `cp_model_field` VALUES ('118', '12', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '1', '0');
INSERT INTO `cp_model_field` VALUES ('62', '3', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `cp_model_field` VALUES ('64', '3', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `cp_model_field` VALUES ('65', '3', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '1', '0');
INSERT INTO `cp_model_field` VALUES ('66', '3', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '1', '0');
INSERT INTO `cp_model_field` VALUES ('67', '3', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `cp_model_field` VALUES ('68', '3', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `cp_model_field` VALUES ('137', '13', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '1', '0');
INSERT INTO `cp_model_field` VALUES ('70', '3', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `cp_model_field` VALUES ('116', '12', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '1', '0');
INSERT INTO `cp_model_field` VALUES ('73', '1', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `cp_model_field` VALUES ('74', '2', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `cp_model_field` VALUES ('119', '12', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '1', '0');
INSERT INTO `cp_model_field` VALUES ('83', '10', '1', 'birthday', '生日', '', '', '0', '0', '', '生日格式错误', 'datetime', 'array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0');
INSERT INTO `cp_model_field` VALUES ('84', '11', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `cp_model_field` VALUES ('85', '11', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `cp_model_field` VALUES ('86', '11', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', 'array (\n)', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `cp_model_field` VALUES ('87', '11', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\n  \'size\' => \'100\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `cp_model_field` VALUES ('88', '11', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\n  \'width\' => \'98\',\n  \'height\' => \'46\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `cp_model_field` VALUES ('89', '11', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'dateformat\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'1\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `cp_model_field` VALUES ('90', '11', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '0', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'0\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `cp_model_field` VALUES ('91', '11', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `cp_model_field` VALUES ('92', '11', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `cp_model_field` VALUES ('93', '11', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', 'array (\n)', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `cp_model_field` VALUES ('94', '11', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `cp_model_field` VALUES ('95', '11', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `cp_model_field` VALUES ('96', '11', '1', 'groupids_view', '阅读权限', '', '', '0', '100', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `cp_model_field` VALUES ('97', '11', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `cp_model_field` VALUES ('98', '11', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `cp_model_field` VALUES ('99', '11', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `cp_model_field` VALUES ('100', '11', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `cp_model_field` VALUES ('101', '11', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `cp_model_field` VALUES ('102', '11', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `cp_model_field` VALUES ('103', '11', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `cp_model_field` VALUES ('104', '11', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', 'array (\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '20', '0', '0');
INSERT INTO `cp_model_field` VALUES ('105', '11', '1', 'video', '视频上传', '', '', '0', '0', '', '', 'video', 'array (\n  \'upload_allowext\' => \'flv|rm|mp4|rmv\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `cp_model_field` VALUES ('106', '11', '1', 'vision', '画质', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'高清|1\r\n普通|2\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'0\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `cp_model_field` VALUES ('107', '11', '1', 'video_category', '视频分类', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'喜剧|1\r\n爱情|2\r\n科幻|3\r\n剧情|4\r\n动作|5\r\n伦理|6\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `cp_model_field` VALUES ('133', '12', '1', 'images', '首页轮播图', '首页轮播图', '', '0', '0', '', '', 'images', '{\"upload_allowext\":\"gif|jpg|jpeg|png|bmp\",\"isselectimage\":\"0\",\"upload_number\":\"10\"}', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '5', '0', '0');
INSERT INTO `cp_model_field` VALUES ('134', '13', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `cp_model_field` VALUES ('135', '13', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '1', '0');
INSERT INTO `cp_model_field` VALUES ('136', '13', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `cp_model_field` VALUES ('122', '12', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `cp_model_field` VALUES ('123', '12', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '1', '0');
INSERT INTO `cp_model_field` VALUES ('138', '13', '1', 'description', '活动对象', '', '', '0', '255', '', '', 'textarea', '{\"width\":\"98\",\"height\":\"46\",\"defaultvalue\":\"\",\"enablehtml\":\"0\"}', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `cp_model_field` VALUES ('125', '12', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `cp_model_field` VALUES ('126', '12', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `cp_model_field` VALUES ('127', '12', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `cp_model_field` VALUES ('155', '13', '1', 'info', '活动内容', '', '', '0', '0', '', '', 'text', '{\"size\":\"50\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}', '', '', '', '0', '1', '0', '1', '0', '1', '1', '0', '11', '0', '0');
INSERT INTO `cp_model_field` VALUES ('139', '13', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `cp_model_field` VALUES ('140', '13', '1', 'content', '活动详情', '', '', '1', '999999', '', '内容不能为空', 'editor', '{\"toolbar\":\"full\",\"defaultvalue\":\"\",\"enablekeylink\":\"1\",\"replacenum\":\"2\",\"link_mode\":\"0\",\"enablesaveimage\":\"1\",\"height\":\"\",\"disabled_page\":\"0\"}', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `cp_model_field` VALUES ('129', '12', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `cp_model_field` VALUES ('131', '12', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `cp_model_field` VALUES ('141', '13', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `cp_model_field` VALUES ('142', '13', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '1', '0');
INSERT INTO `cp_model_field` VALUES ('143', '13', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '1', '0');
INSERT INTO `cp_model_field` VALUES ('144', '13', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `cp_model_field` VALUES ('145', '13', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '1', '0');
INSERT INTO `cp_model_field` VALUES ('147', '13', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `cp_model_field` VALUES ('148', '13', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `cp_model_field` VALUES ('149', '13', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `cp_model_field` VALUES ('151', '13', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `cp_model_field` VALUES ('153', '13', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `cp_model_field` VALUES ('154', '13', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '20', '1', '0');
INSERT INTO `cp_model_field` VALUES ('156', '14', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `cp_model_field` VALUES ('157', '14', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '1', '0');
INSERT INTO `cp_model_field` VALUES ('158', '14', '1', 'title', '用户名', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `cp_model_field` VALUES ('159', '14', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '1', '0');
INSERT INTO `cp_model_field` VALUES ('160', '14', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '1', '0');
INSERT INTO `cp_model_field` VALUES ('161', '14', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `cp_model_field` VALUES ('162', '14', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '1', '0');
INSERT INTO `cp_model_field` VALUES ('163', '14', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '1', '0');
INSERT INTO `cp_model_field` VALUES ('164', '14', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '1', '0');
INSERT INTO `cp_model_field` VALUES ('165', '14', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '1', '0');
INSERT INTO `cp_model_field` VALUES ('166', '14', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `cp_model_field` VALUES ('167', '14', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '1', '0');
INSERT INTO `cp_model_field` VALUES ('177', '14', '1', 'price', '奖金', '', '', '0', '0', '', '', 'number', '{\"minnumber\":\"1\",\"maxnumber\":\"9999999\",\"decimaldigits\":\"0\",\"defaultvalue\":\"\",\"rangetype\":\"0\"}', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '5', '0', '0');
INSERT INTO `cp_model_field` VALUES ('169', '14', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `cp_model_field` VALUES ('170', '14', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `cp_model_field` VALUES ('171', '14', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `cp_model_field` VALUES ('173', '14', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `cp_model_field` VALUES ('175', '14', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');

-- ----------------------------
-- Table structure for `cp_module`
-- ----------------------------
DROP TABLE IF EXISTS `cp_module`;
CREATE TABLE `cp_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `installdate` date NOT NULL DEFAULT '0000-00-00',
  `updatedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_module
-- ----------------------------
INSERT INTO `cp_module` VALUES ('admin', 'admin', '', '1', '1.0', '', '{\"admin_email\":\"phpcms@phpcms.cn\",\"maxloginfailedtimes\":\"8\",\"minrefreshtime\":\"2\",\"mail_type\":\"1\",\"mail_server\":\"smtp.qq.com\",\"mail_port\":\"25\",\"category_ajax\":\"0\",\"mail_user\":\"phpcms.cn@foxmail.com\",\"mail_auth\":\"1\",\"mail_from\":\"phpcms.cn@foxmail.com\",\"mail_password\":\"\",\"errorlog_size\":\"20\"}', '0', '0', '2010-10-18', '2010-10-18');
INSERT INTO `cp_module` VALUES ('member', '会员', '', '1', '1.0', '', 'array (\n  \'allowregister\' => \'1\',\n  \'choosemodel\' => \'1\',\n  \'enablemailcheck\' => \'0\',\n  \'registerverify\' => \'0\',\n  \'showapppoint\' => \'0\',\n  \'rmb_point_rate\' => \'10\',\n  \'defualtpoint\' => \'0\',\n  \'defualtamount\' => \'0\',\n  \'showregprotocol\' => \'0\',\n  \'regprotocol\' => \'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \',\n  \'registerverifymessage\' => \' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\',\n  \'forgetpassword\' => \' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\',\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `cp_module` VALUES ('pay', '支付', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `cp_module` VALUES ('digg', '顶一下', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `cp_module` VALUES ('special', '专题', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `cp_module` VALUES ('content', '内容模块', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `cp_module` VALUES ('search', '全站搜索', '', '0', '1.0', '', 'array (\n  \'fulltextenble\' => \'1\',\n  \'relationenble\' => \'1\',\n  \'suggestenable\' => \'1\',\n  \'sphinxenable\' => \'0\',\n  \'sphinxhost\' => \'10.228.134.102\',\n  \'sphinxport\' => \'9312\',\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `cp_module` VALUES ('scan', '木马扫描', 'scan', '0', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `cp_module` VALUES ('attachment', '附件', 'attachment', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `cp_module` VALUES ('block', '碎片', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `cp_module` VALUES ('collection', '采集模块', 'collection', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `cp_module` VALUES ('dbsource', '数据源', '', '1', '', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `cp_module` VALUES ('template', '模板风格', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `cp_module` VALUES ('release', '发布点', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `cp_module` VALUES ('video', '视频库', '', '0', '1.0', '', '', '0', '0', '2012-09-28', '2012-09-28');
INSERT INTO `cp_module` VALUES ('announce', '公告', 'announce/', '0', '1.0', '公告', '', '0', '0', '2018-06-06', '2018-06-06');
INSERT INTO `cp_module` VALUES ('link', '友情链接', '', '0', '1.0', '', 'array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `cp_module` VALUES ('poster', '广告模块', 'poster/', '0', '1.0', '广告模块', '', '0', '0', '2018-06-06', '2018-06-06');
INSERT INTO `cp_module` VALUES ('upgrade', '在线升级', '', '0', '1.0', '', '', '0', '0', '2011-05-18', '2011-05-18');

-- ----------------------------
-- Table structure for `cp_news`
-- ----------------------------
DROP TABLE IF EXISTS `cp_news`;
CREATE TABLE `cp_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_news
-- ----------------------------
INSERT INTO `cp_news` VALUES ('1', '11', '0', '首页顶部滚动内容', '', '', '', '首页顶部滚动内容', '0', '/index.php?m=content&c=index&a=show&catid=11&id=1', '0', '99', '1', '0', 'any', '1528338377', '1528982278');
INSERT INTO `cp_news` VALUES ('2', '16', '0', '“倍投”出手！三人各擒百万奖', '', '/uploadfile/2018/0613/20180613072258249.jpg', '', '众所周知，买彩票倍投奖金高。近日江苏苏州266万、河北邯郸250万以及江苏宿迁150万元得主现身领奖。这三个大奖出自体彩大乐透或排列5。幸运   ', '0', '/index.php?m=content&c=index&a=show&catid=16&id=2', '0', '99', '1', '0', 'any', '1528342048', '1528888977');
INSERT INTO `cp_news` VALUES ('3', '21', '0', '帮助中心', '', '', '', '帮助中心', '0', 'http://www.5117188.com/2018/help_0611/3.html', '0', '99', '1', '0', 'any', '1528717800', '1528718223');
INSERT INTO `cp_news` VALUES ('12', '22', '0', '正式试运行！', '', '', '', '在大家都在为世界杯狂欢之际，皇家彩票平台也正式步入了试运营阶段，在些祝各位彩民朋友们手气佳佳发大财！', '0', '/index.php?m=content&c=index&a=show&catid=22&id=12', '0', '99', '1', '0', 'admin', '1528982446', '1528982584');
INSERT INTO `cp_news` VALUES ('13', '16', '0', '世界杯今日开锣 竞彩之旅即刻启程', '', 'http://www.lottery.gov.cn/upload/20180614/20180614074503173.jpg', '', '北京时间6月14日23:00，2018世界杯揭幕战将在莫斯科卢日尼基体育场开战，东道主俄罗斯主场对阵沙特。未来一个月里，32支国家队在俄罗斯激情   ', '0', '/index.php?m=content&c=index&a=show&catid=16&id=13', '0', '99', '1', '0', 'admin', '1528982822', '1528982860');
INSERT INTO `cp_news` VALUES ('8', '24', '0', '底部友情提示', '', '', '', '底部友情提示', '0', '/index.php?m=content&c=index&a=show&catid=24&id=8', '0', '99', '1', '0', 'admin', '1528947260', '1528982387');
INSERT INTO `cp_news` VALUES ('9', '28', '0', '北京11选5', '', '/uploadfile/2018/0615/20180615044028641.png', '', '', '0', '/index.php?m=content&c=index&a=show&catid=28&id=9', '0', '99', '1', '0', 'admin', '1528955286', '1529052035');
INSERT INTO `cp_news` VALUES ('30', '16', '0', '体彩公益金护航竞技体育 助力全国体操赛', '', '/uploadfile/2018/0615/20180615045048829.jpg', '', '体彩公益金对于《奥运争光计划》的支持源于1995年，20多年来，为我国体育健儿改善了训练条件，帮助他们提高运动成绩，在国际赛事上为国争光   ', '0', '/index.php?m=content&c=index&a=show&catid=16&id=30', '0', '99', '1', '0', 'admin', '1529052615', '1529052647');
INSERT INTO `cp_news` VALUES ('14', '16', '0', '急寻：义乌双色球738万元大奖得主', '', '/uploadfile/2018/0614/20180614093035494.jpg', '', '4月17日晚，中国福利彩票双色球游戏进行第2018043期开奖，当期全国中出6注一等奖，单注奖金为738万多元，浙江义乌彩民喜中1注一等奖，出自   ', '0', '/index.php?m=content&c=index&a=show&catid=16&id=14', '0', '99', '1', '0', 'admin', '1528982982', '1528983034');
INSERT INTO `cp_news` VALUES ('15', '16', '0', '辽宁盘锦彩民从垃圾中找回中奖彩票', '', '/uploadfile/2018/0614/20180614094503414.png', '', '彩票是兑奖的重要凭证，辽宁盘锦曾有彩民因彩票丢失而发生750万元大奖弃领的事件。最近，这样的事情又差点重演。任先生（化名）是位老彩民   ', '0', '/index.php?m=content&c=index&a=show&catid=16&id=15', '0', '99', '1', '0', 'admin', '1528983875', '1528983901');
INSERT INTO `cp_news` VALUES ('16', '16', '0', '1058万元大奖得主：洗衣服前一定要翻裤兜', '', '/uploadfile/2018/0614/20180614094558242.png', '', '6月3日晚，福彩双色球第18063期，全国开出27注一等奖，单注奖金529万元。武汉市硚口区中出一注一等奖、青山区中出两注一等奖。6月4日一大早   ', '0', '/index.php?m=content&c=index&a=show&catid=16&id=16', '0', '99', '1', '0', 'admin', '1528983920', '1528983956');
INSERT INTO `cp_news` VALUES ('17', '16', '0', '这群江津孩子的六一礼物就是一场普通行走', '', 'http://www.cwl.gov.cn/upload/resources/image/2018/06/08/295884_500x500.jpg', '', '向阳儿童发展中心创始人之一的李宝珍老师孩子们现场表演击鼓六一儿童节，一个让众多孩子收到各种祝福和礼物的日子，但有一群江津孩子的六一   ', '0', '/index.php?m=content&c=index&a=show&catid=16&id=17', '0', '99', '1', '0', 'admin', '1528983972', '1528983996');
INSERT INTO `cp_news` VALUES ('18', '16', '0', '广州福彩今年征召100家投注站', '', '', '', '日前，广州市福彩中心发布公告：经广州市民政局和广东省福彩中心批准，向全社会公开征召100家投注站，代销电脑型（不含快乐十分玩法）和即   ', '0', '/index.php?m=content&c=index&a=show&catid=16&id=18', '0', '99', '1', '0', 'admin', '1528984010', '1528984030');
INSERT INTO `cp_news` VALUES ('19', '16', '0', '世界杯足彩来了，猜不猜，怎么猜，全看你的了！', '', '', '', '　世界杯来了，怎么能不玩竞彩呢？　　根据竞彩游戏销售安排，本届世界杯赛的全部64场比赛均可进行胜平负（或让球胜平负）单场投注，也可进   ', '0', '/index.php?m=content&c=index&a=show&catid=16&id=19', '0', '99', '1', '0', 'admin', '1528984122', '1528984164');
INSERT INTO `cp_news` VALUES ('20', '16', '0', '砍下916万大奖 这一回露脸的不是单式票', '', '', '', '6月2日，体彩大乐透第18063期开奖后，1注916万元头奖喜降京城。值得一提的是，这注大奖的诞生是拜一张双区胆拖复式票所赐。这也是北京地区   ', '0', '/index.php?m=content&c=index&a=show&catid=16&id=20', '0', '99', '1', '0', 'admin', '1528984200', '1528984229');
INSERT INTO `cp_news` VALUES ('21', '16', '0', '京城彩站晒红单：北单9串1惊现1574倍回报', '', '/uploadfile/2018/0614/20180614095128803.jpg', '', '本期京城彩站晒红单栏目一共展示四张票，分别出自北单、竞彩和排列3（两张）。　　中奖25187元 回报1574倍。这是一张北单足球胜平负9串1高   ', '0', '/index.php?m=content&c=index&a=show&catid=16&id=21', '0', '99', '1', '0', 'admin', '1528984252', '1528984286');
INSERT INTO `cp_news` VALUES ('22', '16', '0', '豪取1.25亿！三个大乐透大奖暗藏“关键词”', '', '/uploadfile/2018/0614/20180614095213990.jpg', '', '　他们擒获三个大奖，一共只花了57元，累计夺奖金额却高达1 25亿元！是的，这样的剧情就发生在北京，发生在不久前刚刚结束的体彩大乐透6亿   ', '0', '/index.php?m=content&c=index&a=show&catid=16&id=22', '0', '99', '1', '0', 'admin', '1528984306', '1528984332');
INSERT INTO `cp_news` VALUES ('23', '16', '0', '头奖空开 7星彩奖池金额662万元', '', '', '', '2018年6月12日，体育彩票7星彩玩法第18067期开奖，本期7星彩头奖空开，当期开奖过后，7星彩奖池金额为662万元。据开奖公告显示，本期7星彩   ', '0', '/index.php?m=content&c=index&a=show&catid=16&id=23', '0', '99', '1', '0', 'admin', '1528984375', '1528984393');
INSERT INTO `cp_news` VALUES ('24', '16', '0', '6-15周五足球重点赛事推荐', '', '', '', '周五002 世界杯 埃及VS乌拉圭 比赛时间：2018-06-15 20:00 投注提点：埃及近期6场比赛不胜，球队核心萨拉赫因伤出战成疑；乌拉圭热身   ', '0', '/index.php?m=content&c=index&a=show&catid=16&id=24', '0', '99', '1', '0', 'admin', '1528984438', '1528984461');
INSERT INTO `cp_news` VALUES ('25', '16', '0', '奖池升至58.74亿 体彩大乐透开2注1000万', '', '', '', '6月13日，体彩大乐透第18068期前区开出号码08、12、16、26、33，后区开出号码05、06。河南购彩者包揽2注头奖本期全国共开出2注头奖，单注奖   ', '0', '/index.php?m=content&c=index&a=show&catid=16&id=25', '0', '99', '1', '0', 'admin', '1528984516', '1528984536');
INSERT INTO `cp_news` VALUES ('26', '16', '0', '彩市新语：竞彩游戏即将接过世界杯第三棒', '', '', '', '世界杯四年一届。每隔四年，足球的天空都会掠过一道万众瞩目的彩虹。从2010年开始，这道彩虹中多了一抹叫作竞彩的亮色。　　如果把每届世界   ', '0', '/index.php?m=content&c=index&a=show&catid=16&id=26', '0', '99', '1', '0', 'admin', '1528984621', '1528984644');
INSERT INTO `cp_news` VALUES ('27', '22', '0', '推荐注册有返利', '', '', '', '推荐注册会员后，推荐的会员的流水返推荐人0 2%的佣金。详情请联系客服。', '0', '/index.php?m=content&c=index&a=show&catid=22&id=27', '0', '99', '1', '0', 'admin', '1529031091', '1529031181');
INSERT INTO `cp_news` VALUES ('28', '22', '0', '注册送好礼', '', '', '', '从今日起，凡注册成为会员就送18元礼金！了解详情请联系客服人员。', '0', '/index.php?m=content&c=index&a=show&catid=22&id=28', '0', '99', '1', '0', 'admin', '1529031193', '1529031260');
INSERT INTO `cp_news` VALUES ('29', '22', '0', '签到得礼金', '', '', '', '注册会员后，每天签到都可得到相应的礼金！详情请咨询客服人员。', '0', '/index.php?m=content&c=index&a=show&catid=22&id=29', '0', '99', '1', '0', 'admin', '1529031266', '1529031320');

-- ----------------------------
-- Table structure for `cp_news_data`
-- ----------------------------
DROP TABLE IF EXISTS `cp_news_data`;
CREATE TABLE `cp_news_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `copyfrom` varchar(100) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_news_data
-- ----------------------------
INSERT INTO `cp_news_data` VALUES ('1', '皇家彩票，欢迎您！下载彩票APP及完善个人资料，即送18元并可提升尊享VIP高级服务，六合彩、时时彩赔率业界最高。', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('2', '<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">众所周知，买彩票倍投奖金高。近日江苏苏州266万、河北邯郸250万以及江苏宿迁150万元得主现身领奖。这三个大奖出自体彩大乐透或排列5。幸运得得主均采用了倍投方式，使得奖金翻倍，超过百万元。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　10倍投+追加</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　苏州彩友擒大乐透266万</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　&ldquo;如果我后区都对了，这张票就达到了亿元了！&rdquo;前不久，苏州彩友石先生手持体彩大乐透18059期二等奖彩票来到省体彩中心兑奖时，说了这样一番话。</div>\r\n<p style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); padding-bottom: 0px; font-style: normal; text-align: center; padding-top: 0px; padding-left: 10px; orphans: 2; widows: 2; margin: 0px; letter-spacing: normal; padding-right: 10px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><img alt=\"\" data-bd-imgshare-binded=\"1\" src=\"/uploadfile/2018/0613/20180613072258249.jpg\" style=\"border-top: 0px; height: 372px; border-right: 0px; width: 300px; border-bottom: 0px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; margin: 0px; padding-right: 0px\" /></p>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　5月23日，体彩大乐透第18059期开奖。二等奖开出64注，每注奖金为16.59万元；其中33注采用追加投注，每注多得奖金9.95万元。追加后，二等奖单个总奖金为26.54万元。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　再看他这张票，虽然是一张6+2小复式，但几乎涵盖了大乐透所有的投注技能，投注号码上方赫然写着&ldquo;追加投注10倍&rdquo;。最终这张票斩获10注追加二等奖、50注追加四等奖，总奖金达到266万余元。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　玩彩多年的石先生还透露，平常投的倍数还要多，这次投得算少的了，没想到这次反而中了百万元以上的大奖，以后还得多努力，争取中更大的奖项。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　25倍投、100元投入</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　邯郸彩友中&ldquo;排列5&rdquo;250万</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　6月4日，河北邯郸07060网点业主小徐受到大奖得主的委托，现身体彩中心领取&ldquo;排列5&rdquo;250万元大奖。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　6月1日，体彩排列5第18145期开奖，该网点一幸运彩友凭借一张100元投入、2组号码、25倍投的单式倍投票，拿下25注一等奖，合计收获奖金250万元。当期的中奖号码为&ldquo;52318&rdquo;。</div>\r\n<p style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); padding-bottom: 0px; font-style: normal; text-align: center; padding-top: 0px; padding-left: 10px; orphans: 2; widows: 2; margin: 0px; letter-spacing: normal; padding-right: 10px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><img alt=\"\" data-bd-imgshare-binded=\"1\" src=\"/uploadfile/2018/0613/20180613072259384.jpg\" style=\"border-top: 0px; height: 400px; border-right: 0px; width: 300px; border-bottom: 0px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; margin: 0px; padding-right: 0px\" /></p>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　据小徐介绍，250万元大奖得主是忠实的老购彩者，喜爱玩排列3、排列5，选号既不看走势图也不看历史记录，凭感觉或者看车牌号码投注，他一般只守直选号，如果开出组选号，他就再换一组号码守。在排列3玩法上，他中奖率很高，前两天中了50倍排列3直选奖，前一段时间还中过80倍排列3直选奖；排列5玩法上，他总是差一个号码。这次他守号一个月，终于收获排列5大奖，且一下奖金就是250万元。不过，大奖得主也略有些遗憾，因为他一般是50倍投，这次打得少，仅25倍，少中了200多万元。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　谈起代领奖原因，小徐说：&ldquo;他比较忙，也非常信任我们两口子，就让我来代领了。&rdquo;</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　1注号码15倍投</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　宿迁彩友中 &ldquo;排列5&rdquo;150万</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　6月6日，江苏宿迁彩友何先生时隔中奖一个多月后，终于现身省体彩中心，领走排列5大奖150万元。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　4月28日，在体彩排列5第18111期开奖中，何先生凭借一张1组号码、15倍投、30元投入的单式倍投票，拿下15注10万元一等奖，合计收获奖金150万元。</div>\r\n<p style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); padding-bottom: 0px; font-style: normal; text-align: center; padding-top: 0px; padding-left: 10px; orphans: 2; widows: 2; margin: 0px; letter-spacing: normal; padding-right: 10px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><img alt=\"\" data-bd-imgshare-binded=\"1\" src=\"/uploadfile/2018/0613/20180613072259371.jpg\" style=\"border-top: 0px; height: 326px; border-right: 0px; width: 300px; border-bottom: 0px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; margin: 0px; padding-right: 0px\" /></p>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　从何先生出示的彩票来看，票面上只有一注号码&ldquo;81707&rdquo;，准确命中当晚的开奖号码。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　谈及购彩经历，何先生说：&ldquo;我买体彩很长时间了，一般都是自选号。除了买排列5，前一段时间大乐透派奖，我也买了不少，小奖也中了不少。&rdquo;</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　谈及为什么选择倍投，何先生言简意赅，&ldquo;倍投奖金高啊。&rdquo;至于为什么隔了一个多月才来领奖，何先生解释说，&ldquo;我购彩时间也不固定，一般都是十几天才去一次体彩店，最近杂务比较多，很长时间没去买彩。&rdquo;</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　说到中奖后的心情，何先生这才露出笑容：&ldquo;高兴，争取下次再来。&rdquo; （陈敏/整理）</div>\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('3', '<div class=\"help-wrap\">\r\n<h3 id=\"help-tit1\">常见问题</h3>\r\n<div class=\"help-wrap-tit\" id=\"help-1\">1、如何注册成为会员？</div>\r\n<p>&middot; 用户进入彩票网站首页，在首页右侧点击&quot;注册&quot;，进入用户注册页面。<br />\r\n&middot; 在注册页面阅读并同意《彩票网络服务协议》。<br />\r\n&middot; 在注册页面填写相关信息并提交。<br />\r\n&middot; 系统返回成功信息，恭喜注册成功。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-2\">2、在彩票网站注册要收费吗？</div>\r\n<p>&middot; 注册新用户是免费的，不收取任何费用。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-3\">3、忘记了登录密码怎么办？</div>\r\n<p>&middot; 请及时提供相应信息给客服。系统将重置一个新密码，并把新密码发送到用户注册时提交的电子邮箱中，为保障账户安全，建议用户登录后立即修改密码。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-4\">4、有银行卡就可以充值了吗？</div>\r\n<p>用户拥有了银行卡后，即有多种充值方式可以充值：<br />\r\n&middot; 已开通网上银行，使用第三方支付平台进行充值，方便、快捷。<br />\r\n&middot; 未开通网银，可以使用银行转账、微信或支付宝等方式进行充值。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-5\">5、如何开通网上支付？</div>\r\n<p>开通银行卡网上支付功能，包括网上开通和现场开通两种方式：<br />\r\n&middot; 网上开通：登录各大银行的官方网站在线开通。<br />\r\n&middot; 现场开通：前往各大银行的营业网点现场开通。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-6\">6、如何进行充值？</div>\r\n<p>有多种充值方式供您选择，包括：银行转账、第三方支付、微信与支付宝等。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-7\">7、充值要手续费吗？</div>\r\n<p>充值安全、方便、快捷，不收取任何手续费。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-8\">8、如何查看是否中奖？</div>\r\n<p>登录后，点击首页右侧的&quot;会员中心&quot;，点击交易记录，然后勾选&quot;奖金派送&quot;，即可查看中奖记录。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-9\">9、如何查询购买彩票的记录？</div>\r\n<p>在&quot;用户中心&quot;左侧选择&quot;交易记录&quot;，即可查看购买彩票的记录。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-10\">10、中奖后如何返奖？</div>\r\n<p>本彩票&quot;自动兑奖，自动返奖&quot;，所有奖金均由网站系统自动开兑，并自动返还到用户的会员账户中。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-11\">11、如何查询中奖详情？</div>\r\n<p>1、用户登录后点击首页顶部的&quot;用户中心&quot;。<br />\r\n2、在&quot;用户中心&quot;左侧选择&quot;交易记录&quot;，再选择&ldquo;交易明细&rdquo;，即可查看中奖详情。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-12\">12、如何提款？</div>\r\n<p>&middot; 用户登录后点击首页右侧的&quot;提款&quot;进入提款页面，在提款页面输入提款金额及提款密码并确认。<br />\r\n&middot; 您的提款申请成功并经核对无误后，将通过银行转账方式提款，3到5分钟实时到账。支持全国所有大小银行。<br />\r\n&middot; 为了保障您的资金安全，公司提供7X24小时一对一服务。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-13\">13、提款需要手续费吗？</div>\r\n<p>&middot; 达到提款条件才能取款。<br />\r\n&middot; 提款不限次数，手续费根据网站设定。<br />\r\n&middot; 提款时所产生的银行手续费将全部由本网站为您承担。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-14\">14、提款次数有没有限制？</div>\r\n<p>本公司不限制提款次数。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-15\">15、提款时需要注意哪些事项？</div>\r\n<p>&middot; 确认提款时提交的的银行信息的正确性。<br />\r\n&middot; 为了防止少数用户利用信用卡套现和洗钱的行为，保护正常用户的资金安全，本站针对提款做出如下规定：<br />\r\n1、用户需要达到一定的打码量，才能正常办理提款。<br />\r\n2、发现异常的提款，要经过审核。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-16\">16、提款不成功怎么办？</div>\r\n<p>提款不成功分两种情况：<br />\r\n&middot; 提款申请未成功：<br />\r\n1、提款金额大于账户实有金额。<br />\r\n2、提款时填写的提款密码与用账户信息设置的密码不一致。<br />\r\n3、银行卡信息不符合规定格式。<br />\r\n&middot; 申请提款成功，但款项没有到达指定账户：<br />\r\n1、银行卡卡号填写错误，与用户姓名不符，银行退单。<br />\r\n一旦发生上述现象，请及时联系客服，由客服人员为您服务。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-17\">17、网上投注的优势有哪些？</div>\r\n<p>&middot; 安全便捷：安全、方便、快捷，足不出户，轻松购彩。<br />\r\n&middot; 永无弃奖：大奖人工通知并自动返还，小奖自动返还。<br />\r\n&middot; 随时随地：无地域限制，除开奖时间外24小时投注。<br />\r\n&middot; 信息服务：提供全方位、多样化的彩票信息服务。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-18\">18、网上投注如何保证彩民利益？</div>\r\n<p>&middot; 自动返奖：&quot;自动兑奖，自动返奖&quot;，所有奖金均由网站系统自动开兑并自动返还到用户的账户中。<br />\r\n&middot; 公开查询：用户可以查询自己的投注记录、中奖记录以及资金明细记录，一切做到有据可查，数据公开。<br />\r\n&middot; 数据安全：投注数据及相关资料时时备份，网络系统独立设置、隔离并安装有大型硬、软防火墙，安全级别高，确保数据绝对安全。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-19\">19、对于用户使用本站投注服务的约定</div>\r\n<p>&middot; 用户根据自愿的原则，使用本站投注业务，并自己对自己提供的注册信息的真实性负责；<br />\r\n&middot; 国家明令禁止一切洗钱行为，本站积极响应国家政策，严格控制。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-20\">20、在本站购彩安全吗？</div>\r\n<p>&middot; 本站是福彩中心与体彩中心授权的合法的网上投注平台，所售彩票都是福彩中心与体彩中心正规发行的彩票。 &middot; 本站彩票已在工信部备案，是真实有效合法的网上投注平台。<br />\r\n&middot; 本站彩票与多家网站达成购彩合作伙伴关系，比如百度、搜狐、搜狗、腾讯微信、支付宝等。</p>\r\n<div class=\"help-wrap-tit\" id=\"help-21\">21、如何对网站服务进行投诉？</div>\r\n<p>&middot; 如有需要及时处理的事务，请点击页面右侧的在线客服。<br />\r\n&middot; 工作时间：7X24，永不间断</p>\r\n</div>\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('12', '在大家都在为世界杯狂欢之际，皇家彩票平台也正式步入了试运营阶段，在些祝各位彩民朋友们手气佳佳发大财！', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('13', '<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">北京时间6月14日23:00，2018世界杯揭幕战将在莫斯科卢日尼基体育场开战，东道主俄罗斯主场对阵沙特。未来一个月里，32支国家队在俄罗斯激情碰撞，剑指大力神杯。虽然赛场远在欧洲大陆，但是中国的球迷同样可以感受到来自世界杯的气息。在世界杯期间，中国体育彩票竞彩游戏将开售世界杯全部64场比赛，以及冠军、冠亚军球队竞猜，为广大球迷和购彩者搭建了一个参与世界杯，感受世界杯激情的平台。</span></div>\r\n<p style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); padding-bottom: 0px; font-style: normal; text-align: center; padding-top: 0px; padding-left: 10px; orphans: 2; widows: 2; margin: 0px; letter-spacing: normal; padding-right: 10px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><img alt=\"\" data-bd-imgshare-binded=\"1\" src=\"http://www.lottery.gov.cn/upload/20180614/20180614074503173.jpg\" style=\"border-top: 0px; height: 306px; border-right: 0px; width: 550px; border-bottom: 0px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; margin: 0px; padding-right: 0px\" /></span></p>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　东道主揭幕战力争开门红</strong></span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　本届世界杯终于要拉开帷幕，&ldquo;竞彩之旅&rdquo;也正式启程。这届揭幕战被视为历届世界杯最弱的揭幕战，两队在最新公布的国际足联排名中位居本届世界杯的倒数两名，其中东道主俄罗斯更是32强中排名最低的。</span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　东道主俄罗斯世界杯前进行了两场热身赛，分别0比1输给奥地利、1比1战平土耳其，至此俄罗斯在热身赛中已经连续7场不胜，糟糕的战绩也让他们在新一期的国际足联排名中下降了4位。沙特阿拉伯世界杯前进行了三场热身赛全败，分别1比2意大利、0比3秘鲁、1比2德国队。俄罗斯近期热身赛连战不胜，相对低迷的状态加上缺少实力派球星，出线前景多少令人担忧，球队的底线是避免再现2010年世界杯东道主南非未能出线的尴尬，为此小组赛对手设计、赛程安排都下足了功夫。揭幕战对手沙特阿拉伯是32强中公认实力最弱的，作为欧洲球队，俄罗斯毕竟各方面都占据一定优势，加上东道主的便利，俄罗斯一定会力争开门红，相信这次比赛也能让更多购彩者取得开门红。</span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　64场比赛全程单场竞猜</strong></span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　根据竞彩游戏销售安排，本届世界杯全部64场比赛均可进行胜平负（或让球胜平负）单场竞猜，也可进行总进球数、半全场胜平负、比分等玩法的单场投注，其中世界杯前两轮小组赛的32场比赛6月7日便可以进行投注，第三轮小组赛将从6月21日起陆续开始陆续接收投注。</span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　传统足彩6月期间共有4期胜负游戏（第18075期-18078期）、9期6场半全场游戏（第18075期-18083期）和14期4场进球游戏（第18075期-18088期）奖期含有世界杯比赛，其中14场胜负游戏第18075期、第18076期和第18077期全部由世界杯小组赛组成，第18078期预计由世界杯与挪超混搭组成。</span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　世界杯期间竞彩足球游戏将大幅延长销售时间，保证购彩者有充足的购彩时间。根据初步安排，世界杯期间（2018年6月14日-7月15日），各比赛日竞彩游戏停售时间将延后至次日凌晨最后一场世界杯比赛开赛时间（次日凌晨02:00或03:00），若当日最后一场世界杯比赛开赛时间早于24:00，则停售时间为当日24:00。世界杯休赛日停售时间为当日24:00，遇周末不再延后停售竞彩足球、篮球各游戏。</span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　玩竞彩，感受世界杯</strong></span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　竞彩是一种以竞猜足球、篮球等赛事为主的体育彩票。2009年，竞彩率先把国际先进的固定奖金引入到足球和篮球游戏当中，既增加了游戏的吸引力，也更加符合体育竞赛和彩票竞猜的完美结合。自诞生以来，竞彩连续8年销量大幅增长，2017年销量突破800亿元，助力中国体育彩票年度总销量首次突破2000亿元大关，筹集体彩公益金500多亿元。</span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　竞彩的最大特点是趣味性强，玩法多样，技术性强，不论是新、老购彩者还是体育爱好者，都能从中找到属于自己乐趣。竞彩的竞猜对象以国际足球和篮球赛事为主，包括猜胜平负、猜比分、猜进球数等多种游戏方法，本届世界杯期间，还开售了冠军竞猜和冠亚军竞猜游戏，既挑战球迷的智慧，也让比赛更加悬念迭生。</span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　竞彩游戏在全国31个省区市的10万多家体育彩票竞彩网点销售，世界杯期间各地还会在部分酒吧、商业设施、社区等增加临时销售终端。参与竞彩游戏，带给球迷和购彩者的不仅是智力比拼的舞台，更是一种&ldquo;乐活&rdquo;的生活方式。这将让越来越多的购彩者和球迷在享受足球盛宴的同时，体验到花样翻新的竞彩乐趣。作为中国体育彩票的独有产品，竞彩在给购彩者带来竞猜趣味的同时，也履行着国家公益彩票的职能，将筹集更多的公益金用于全民健身等各类社会公益事业。</span></div>\r\n<p><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&nbsp;</span></p>\r\n<div class=\"main_content_edit\" style=\"font-size: 14px; height: 60px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: bold; color: rgb(48,48,48); padding-bottom: 10px; font-style: normal; text-align: right; orphans: 2; widows: 2; letter-spacing: normal; line-height: 60px; padding-right: 20px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">(编辑：郭晨曦)</span></div>\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('8', '<p>2009-2018&copy; 皇家<span>彩票</span><br />\r\n<span class=\"c-grey\">皇家彩票郑重提示：彩票有风险，投注需谨慎。 不向未满18周岁的青少年出售彩。</span></p>\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('9', '<img src=\"/uploadfile/2018/0615/20180615043541650.png\" /><br />\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('14', '<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">4月17日晚，中国福利彩票双色球游戏进行第2018043期开奖，当期全国中出6注一等奖，单注奖金为738万多元，浙江义乌彩民喜中1注一等奖，出自义乌市大陈镇镇中南路39号第33175423彩票投注站，中奖彩票是一张10元机选票。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; max-width: 600px; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: center; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 0em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><a href=\"/uploadfile/2018/0614/20180614093034991.jpg\" style=\"box-sizing: border-box; font-size: 15px; text-decoration: none; max-width: 600px; background-color: transparent; text-indent: 0em\" target=\"_blank\"><img alt=\"急寻：738万大奖得主\" src=\"/uploadfile/2018/0614/20180614093035494.jpg\" style=\"box-sizing: border-box; max-width: 600px; border-top: medium none; height: auto; border-right: medium none; vertical-align: top; border-bottom: medium none; border-left: medium none\" suffix=\"jpg\" title=\"急寻：738万大奖得主\" /></a></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">中了双色球738万大奖，令人羡慕。然而，眼看着兑奖截止日越来越近，大奖得主却如此沉得住气，迟迟未现身，让大家担心。请义乌喜爱购买双色球的彩民，特别是在第33175423彩票投注站购买过2018043期双色球彩票的彩民们，赶紧拿出自己的彩票核对一下，这738万大奖是不是属于您的特别礼物？</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">特别提醒，6月19日是738万大奖的最后领奖期限，请中奖彩民赶紧到浙江省福彩中心（杭州市余杭区荆长路539号）领取，切莫让弃奖憾事发生。</p>\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('15', '<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">彩票是兑奖的重要凭证，辽宁盘锦曾有彩民因彩票丢失而发生750万元大奖弃领的事件。最近，这样的事情又差点重演。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">任先生（化名）是位老彩民，对各种彩票玩法都很熟悉，虽然没中过大奖，但是收获的小奖可不少。5月28日中午，任先生到位于盘锦市兴隆台区欧式小区步行街的盘锦福彩第193号投注站，分别投注了50倍的单选&ldquo;536&rdquo;、50倍的单选&ldquo;653&rdquo;和20倍的组六&ldquo;356&rdquo;。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; max-width: 600px; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: center; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 0em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><a href=\"/uploadfile/2018/0614/20180614094502116.png\" style=\"box-sizing: border-box; font-size: 15px; text-decoration: none; max-width: 600px; background-color: transparent; text-indent: 0em\" target=\"_blank\"><img alt=\"盘锦3D大奖彩票\" src=\"/uploadfile/2018/0614/20180614094503414.png\" style=\"box-sizing: border-box; max-width: 600px; border-top: medium none; height: auto; border-right: medium none; vertical-align: top; border-bottom: medium none; border-left: medium none\" suffix=\"png\" title=\"盘锦3D大奖彩票\" /></a></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">当天下午一点半左右，任先生又到位于盘锦市兴隆台区振兴公司花卉一条街的盘锦福彩第277号站打了一张彩票。当晚下班后，任先生路过中午买票的盘锦福彩第193号站，又买了一张彩票：对单选&ldquo;365&rdquo;、单选&ldquo;653&rdquo;和单选&ldquo;536&rdquo;分别投注了30倍。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; max-width: 600px; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: center; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 0em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><a href=\"/uploadfile/2018/0614/20180614094508769.png\" style=\"box-sizing: border-box; font-size: 15px; text-decoration: none; max-width: 600px; background-color: transparent; text-indent: 0em\" target=\"_blank\"><img alt=\"盘锦3D大奖彩票1\" src=\"/uploadfile/2018/0614/20180614094511710.png\" style=\"box-sizing: border-box; max-width: 600px; border-top: medium none; height: auto; border-right: medium none; vertical-align: top; border-bottom: medium none; border-left: medium none\" suffix=\"png\" title=\"盘锦3D大奖彩票1\" /></a></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; max-width: 600px; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: center; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 0em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><a href=\"/uploadfile/2018/0614/20180614094512249.png\" style=\"box-sizing: border-box; font-size: 15px; text-decoration: none; max-width: 600px; background-color: transparent; text-indent: 0em\" target=\"_blank\"><img alt=\"盘锦3D大奖彩票2\" src=\"/uploadfile/2018/0614/20180614094513455.png\" style=\"box-sizing: border-box; max-width: 600px; border-top: medium none; height: auto; border-right: medium none; vertical-align: top; border-bottom: medium none; border-left: medium none\" suffix=\"png\" title=\"盘锦3D大奖彩票2\" /></a></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">终于盼到了晚上开奖，当看到开奖号码是&ldquo;536&rdquo;的时候，任先生非常兴奋，但随后他发现中午打的那张240元的彩票不见了，而那张是中奖金额最多的，奖金5.5万元。他仔细回想，觉得彩票应该是落在投注站了，于是他马上联系了盘锦福彩第193号投注站的业主孙健，孙健立即告诉服务员不要将当天的垃圾和废票扔掉，并把所有的垃圾都收集在箱子里封存起来。第二天一大早，任先生到盘锦福彩第193号投注站，和站内的服务员一点一点地清点垃圾，终于找到了那张失而复得的彩票。任先生十分感谢盘锦福彩第193号投注站的业主和服务员。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">在此提醒广大彩民：请妥善保管好自己购买的彩票，中奖后请及时兑奖。</p>\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('16', '<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; max-width: 600px; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: center; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 0em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><a href=\"/uploadfile/2018/0614/20180614094557497.png\" style=\"box-sizing: border-box; font-size: 15px; text-decoration: none; max-width: 600px; background-color: transparent; text-indent: 0em\" target=\"_blank\"><img alt=\"1058万彩票\" src=\"/uploadfile/2018/0614/20180614094558242.png\" style=\"box-sizing: border-box; max-width: 600px; border-top: medium none; height: auto; border-right: medium none; vertical-align: top; border-bottom: medium none; border-left: medium none\" suffix=\"png\" title=\"1058万彩票\" /></a></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">6月3日晚，福彩双色球第18063期，全国开出27注一等奖，单注奖金529万元。武汉市硚口区中出一注一等奖、青山区中出两注一等奖。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">6月4日一大早，硚口区彩民便来到湖北省福彩中心兑领了奖金，而收获两注头奖的青山区彩民却迟迟不见踪影。直到6月11日中午，彩民小陆（化姓）才终于来到湖北省福彩中心兑奖室兑奖，并讲述了自己&ldquo;迟到&rdquo;的原因。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong style=\"box-sizing: border-box; font-size: 15px; font-weight: bold\">彩票睡在裤兜里</strong></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">小陆是一名95后，大学毕业后留在武汉工作，现在在青山区某公司做技术员。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">小陆每次买彩票后，都不及时核对，而是等彩票积累得比较多了，才去看看是否有奖。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">6月10日晚，小陆准备洗衣服，他先把裤兜里的好几张彩票拿出来放在一边，再把衣服塞进洗衣机。在洗衣机的嗡嗡声中，他拿出手机，一张一张核对彩票上的号码。&ldquo;当发现其中一张彩票与大奖号码一模一样时，我的心一下子扑通扑通跳个不停。&rdquo;小陆承认，自己的确是个马虎人。6月2日买完彩票后，他还到同一家投注站买了彩票，也知道该投注站中出了千万元大奖，但就是没想到中奖人可能是自己。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">就这样，他裤兜里装着价值千万元的彩票，一如既往地过着自己的日子。回想起大奖彩票放在裤兜里近10天，真是又喜悦又后怕。小陆幽默地总结说：&ldquo;洗衣服前，一定要翻一翻裤兜。&rdquo;</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong style=\"box-sizing: border-box; font-size: 15px; font-weight: bold\">小额投注 一举三得</strong></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">小陆是个福彩新兵，每次投入不多，总是机选，而且习惯于机选两注，分别两倍倍投，一共8元钱。小陆觉得，这样做不仅体现了&ldquo;要想发，不离8&rdquo;的好彩头，又有博取大奖的希望，还不影响生活，是一举三得。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong style=\"box-sizing: border-box; font-size: 15px; font-weight: bold\">给父母买套房</strong></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">对于奖金的使用，小陆说：&ldquo;我刚刚进入社会时间不长，就中了一千多万元的一等奖，这要感谢福彩给我的第一桶金。我还年轻，不能因为这笔意外之财就放松努力。回去后，该干嘛还干嘛，只当此事没发生过。如果以后有好项目，我也可能自己出来创业。&rdquo;直到兑奖的时候，他还没来得及把这件大事告诉父母亲，但小陆说，准备用奖金给父母亲买一套房。</p>\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('17', '<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; max-width: 600px; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: center; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 0em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><a href=\"http://www.cwl.gov.cn/upload/resources/image/2018/06/08/295884.jpg\" style=\"box-sizing: border-box; font-size: 15px; text-decoration: none; max-width: 600px; background-color: transparent; text-indent: 0em\" target=\"_blank\"><img alt=\"向阳儿童发展中心创始人之一的李宝珍老师\" src=\"http://www.cwl.gov.cn/upload/resources/image/2018/06/08/295884_500x500.jpg\" style=\"box-sizing: border-box; max-width: 600px; border-top: medium none; height: auto; border-right: medium none; vertical-align: top; border-bottom: medium none; border-left: medium none\" suffix=\"jpg\" title=\"向阳儿童发展中心创始人之一的李宝珍老师\" /></a></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: center; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">向阳儿童发展中心创始人之一的李宝珍老师</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; max-width: 600px; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: center; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 0em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><a href=\"http://www.cwl.gov.cn/upload/resources/image/2018/06/08/295885.jpg\" style=\"box-sizing: border-box; font-size: 15px; text-decoration: none; max-width: 600px; background-color: transparent; text-indent: 0em\" target=\"_blank\"><img alt=\"孩子们现场表演击鼓。\" src=\"http://www.cwl.gov.cn/upload/resources/image/2018/06/08/295885_500x500.jpg\" style=\"box-sizing: border-box; max-width: 600px; border-top: medium none; height: auto; border-right: medium none; vertical-align: top; border-bottom: medium none; border-left: medium none\" suffix=\"jpg\" title=\"孩子们现场表演击鼓。\" /></a></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: center; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">孩子们现场表演击鼓</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&ldquo;六一&rdquo;儿童节，一个让众多孩子收到各种祝福和礼物的日子，但有一群江津孩子的&ldquo;六一&rdquo;礼物很特别&mdash;&mdash;在家长和爱心人士的共同扶持下完成普通行走。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">这些孩子，全部是江津向阳儿童发展中心的特殊孩子，他们当中，有脑瘫患者、唐氏儿、自闭症孩子&hellip;&hellip;当天，这些特殊孩子从江津时代广场出发，完成了自己的第十三届&ldquo;快乐自由行健走比赛&rdquo;。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; max-width: 600px; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: center; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 0em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><a href=\"http://www.cwl.gov.cn/upload/resources/image/2018/06/08/295886.jpg\" style=\"box-sizing: border-box; font-size: 15px; text-decoration: none; max-width: 600px; background-color: transparent; text-indent: 0em\" target=\"_blank\"><img alt=\"整队出发\" src=\"http://www.cwl.gov.cn/upload/resources/image/2018/06/08/295886_500x500.jpg\" style=\"box-sizing: border-box; max-width: 600px; border-top: medium none; height: auto; border-right: medium none; vertical-align: top; border-bottom: medium none; border-left: medium none\" suffix=\"jpg\" title=\"整队出发\" /></a></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: center; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">整队出发</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">20年来，江津向阳儿童发展中心发展规模由小到大，已先后为包括脑瘫儿、唐氏儿、智力障碍、发育迟缓、自闭症等不同特殊孩子的数百户家庭提供服务。这些特殊孩子通过长期、系统的康复教育，不仅生活可以自理，还能学习文化知识，并掌握一定的绘画、舞蹈等技能。与同类机构有所不同，该中心对绝大多数特殊孩子进行的是免费康复教育。此举为众多特殊孩子家庭缓解了巨大的经济压力。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; max-width: 600px; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: center; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 0em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><a href=\"http://www.cwl.gov.cn/upload/resources/image/2018/06/08/295887.jpg\" style=\"box-sizing: border-box; font-size: 15px; text-decoration: none; max-width: 600px; background-color: transparent; text-indent: 0em\" target=\"_blank\"><img alt=\"爱心捐赠\" src=\"http://www.cwl.gov.cn/upload/resources/image/2018/06/08/295887_500x500.jpg\" style=\"box-sizing: border-box; max-width: 600px; border-top: medium none; height: auto; border-right: medium none; vertical-align: top; border-bottom: medium none; border-left: medium none\" suffix=\"jpg\" title=\"爱心捐赠\" /></a></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: center; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">爱心捐赠</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">为了让这123名特殊孩子感受到更多的来自社会大家庭的温暖，江津福彩还在此次活动中进行了捐赠慰问，以实际行动践行&ldquo;扶老、助残、救孤、济困&rdquo;的发行宗旨，通过关爱活动，帮助孩子们健康、快乐成长。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; max-width: 600px; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: center; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 0em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><a href=\"http://www.cwl.gov.cn/upload/resources/image/2018/06/08/295888.jpg\" style=\"box-sizing: border-box; font-size: 15px; text-decoration: none; max-width: 600px; background-color: transparent; text-indent: 0em\" target=\"_blank\"><img alt=\"特殊孩子同样拥有灿烂的笑容\" src=\"http://www.cwl.gov.cn/upload/resources/image/2018/06/08/295888_500x500.jpg\" style=\"box-sizing: border-box; max-width: 600px; border-top: medium none; height: auto; border-right: medium none; vertical-align: top; border-bottom: medium none; border-left: medium none\" suffix=\"jpg\" title=\"特殊孩子同样拥有灿烂的笑容\" /></a></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: center; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">特殊孩子同样拥有灿烂的笑容</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&ldquo;每个孩子的情况都有所不同，但他们同样能通过自己的努力拥有五彩缤纷的生活。&rdquo;与往年有所不同，参与孩子们到达终点后，将会在老师和工作人员指引下，脱下身上的白色T恤，用双手在上面绘出图画，用这一方式寄寓对未来的美好期望：用双手营造美好的未来。</p>\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('18', '<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">日前，广州市福彩中心发布公告：经广州市民政局和广东省福彩中心批准，向全社会公开征召100家投注站，代销电脑型（不含&ldquo;快乐十分&rdquo;玩法）和即开型福利彩票。有意申请办理投注站的朋友，即日起可递交申请材料。本次征召截至日期为2018年12月31日，额满即止。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong style=\"box-sizing: border-box; font-size: 15px; font-weight: bold\">哪些人可以申请？</strong></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong style=\"box-sizing: border-box; font-size: 15px; font-weight: bold\">&mdash;&mdash;向非穗籍个人开放，遵循&ldquo;一人一站&rdquo;原则</strong></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">据悉，本次征召投注站的申请人必须同时具备以下资格条件：一是持有有效的广州市常住户口或广州市居住证、年满18周岁且小于60周岁具有完全民事行为能力、有高中以上学历的个人，近五年内无刑事处罚记录和不良商业信用记录，非现有福彩投注站代销者或党政机关、事业单位公职人员；二是申请者必须直接参与投注站经营管理，必须配有销售福利彩票的专职人员，必须明确投注站的经营方式为专营福利彩票；三是有从事代销福利彩票业务相适应的资金（不少于5万元），在广州市内有满足福利彩票销售所需场所的所有权或使用权。需要特别注意的是，一个有效身份证只能提交一次申请（不含审核未通过者），同一申请人只能申请一个地址，投注站设立后一年后不得办理迁移。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong style=\"box-sizing: border-box; font-size: 15px; font-weight: bold\">如何进行申请？</strong></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong style=\"box-sizing: border-box; font-size: 15px; font-weight: bold\">&mdash;&mdash;先审核后公示，公示结束即可设站</strong></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">有意申请设站的朋友，可于工作日正常上班时间内前往广州市福彩中心电脑票销售部（西湖路99号17楼1706室）提交申请资料。申请人需提交有效身份证、户口本或居住证、学历证书等材料的原件和复印件，本人存折原件和复印件或银行出具的资金证明（可用资金量须在5万元以上），并提交中国福利彩票代销申请书、设立福利彩票投注站可行性分析报告，以及拟设投注站场所的铺位照片、详细地址和铺位所在百度地图上的标注图示等材料。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">广州市福彩中心提醒，申请人只有提交的材料齐备后才予以受理，获得受理流水号的先后即为审核办站地址优先次序的依据，受理情况每周汇总办理。广州市福彩中心将在受理之日起15个工作日内，对申请人提交的材料进行初审，并派专人对申请人申报站点地址进行实地考察，审核建筑规格、店铺面积、周边环境等是否达标，拟设投注站地址与其它福彩投注站距离是否达到500米以上等。申请地址与实际地址不一致或申请材料有不真实情况，视为无效申请，不通过审核。根据实地考察情况，确定入围资格名单，并在广州福彩网公示7天。公示期内如发现不符合设站条件的，取消设站资格。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong style=\"box-sizing: border-box; font-size: 15px; font-weight: bold\">对经营场所有什么要求？</strong></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong style=\"box-sizing: border-box; font-size: 15px; font-weight: bold\">&mdash;&mdash;500米内无福彩站点，面积不少于15平米</strong></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">据介绍，本次征召不指定区域，申请者可综合考虑地区经济状况、人口数量、市场发展程度、投注便利等因素，在广州市全市范围内自由选址，经营场所需同时具备以下条件：实际经营面积原则上不得小于15 平方米；选址500米范围内无其它福彩投注站（与其他先获得受理的申请人所提交的投注站地址同样适用500米距离限制）；不得使用临时搭建的房屋、铁皮屋及租赁拆迁屋等作为投注站专用场所；可安装中国电信福彩ADSL VPDN专线。值得一提的是，如果申请人所指定的经营场所符合《广州市福利彩票发行中心关于高标准福彩投注站增设&ldquo;快乐十分&rdquo;销售终端的通知》的，还可以申请增设&ldquo;快乐十分&rdquo;投注终端。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">本次征召活动相关公告已公布在&ldquo;广州福彩网&rdquo;（www.gzflcp.org.cn），有志于投身福利彩票公益事业的朋友，可上网查询或致电020-83366743咨询本次福彩投注站征召详情。</p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong style=\"box-sizing: border-box; font-size: 15px; font-weight: bold\">友情提醒：经营有风险，投资需谨慎</strong></p>\r\n<p style=\"box-sizing: border-box; font-size: 15px; word-wrap: break-word; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(51,51,51); padding-bottom: 12px; font-style: normal; text-align: justify; padding-top: 12px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 2px; line-height: 30px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">本次征召活动规定，投注站设立后一年内不得办理迁移，并在一年后纳入彩票销售区域淘汰制度管理。按广东省统一规定，广州市福彩中心将按9%向投注站计发电脑票代销费，按9%计发即开票代销费。在此，广州市福彩中心提醒有意申请办理投注站的朋友：申请前一定要充分调研拟设投注站场所的周边环境，做好投资可行性分析，认真评估经营风险，做到谨慎投资。</p>\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('19', '<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　世界杯来了，怎么能不玩竞彩呢？</strong></span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　根据竞彩游戏销售安排，本届世界杯赛的全部64场比赛均可进行胜平负（或让球胜平负）单场投注，也可进行总进球数、半全场胜平负、比分等玩法的单场投注。单场竞猜将显著增加购彩者中奖体验，尤其进入世界杯淘汰赛阶段，单场竞猜将让购彩者尽享&ldquo;一击制胜&rdquo;的竞猜乐趣。</span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　事实上，早在本届世界杯开幕前一周的6月7日，竞彩足球游戏就已经正式开售了俄罗斯世界杯小组赛前两轮共计32场比赛的投注，胜平负（或让球胜平负）、总进球数、半全场胜平负、比分等玩法均可接受单场投注。</span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　由于开售时间较早，京城购彩者有了更大的选择空间，可以选择最喜爱的球队进行投注，也可以选择最有把握的赛事参与竞猜。比如，钟情于阿根廷队的球迷可以把阿根廷队对阵冰岛队以及阿根廷队对阵克罗地亚队的前2场小组赛串在一起，进行竞彩2串1过关投注，胆大者可以单选阿根廷获胜，用两场胜利为这支南美劲旅订制一份竞彩专属的&ldquo;提前出线套餐&rdquo;。</span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　除小组赛前两轮32场比赛在6月7日就开始接受投注之外，对于世界杯小组赛第三轮对阵，竞彩游戏将于6月21日起开售。对于淘汰赛阶段的对阵，竞彩游戏将在小组赛全部结束、淘汰赛对阵揭晓之后的第一时间开售。</span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　玩北单！京城彩站尽享嘉年华</strong></span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　对于喜爱单场竞猜的京城彩友来说，欢度世界杯怎么能少了北单（北京单场）这道&ldquo;横菜&rdquo;？</span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　在北京、天津、广东等三个联网销售地区，北单的拥趸阵容十分强大。由于最高串关场次可达15场，因此对于喜欢投注高串关的购彩者来说，玩北单无疑需要一颗大心脏，考验着&ldquo;勇敢的心&rdquo;。世界杯期间，北单足球胜平负、比分、总进球、半全场等游戏将开售全部64场对阵，在京城各家体彩店日常频频中出的&ldquo;高串关红单&rdquo;将重出江湖，挑逗人们的眼球。</span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　世界杯期间，以&ldquo;世界杯，该你上场&rdquo;为主题的体彩嘉年华系列活动还将在全国各地精彩上演，彩友们可以通过参与户外路演、花车巡游、足球宝贝走秀等方式投身嘉年华，与体彩一起助阵世界杯。据《中国体彩报》了解，北京地区很多体彩店都有计划在世界杯期间推出&ldquo;聚会+交流+购彩&rdquo;的一条龙服务举措，为京城彩友搭建世界杯&ldquo;京味嘉年华&rdquo;。</span></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><span style=\"font-size: 16px; font-family: 微软雅黑; white-space: normal; word-spacing: 0px; text-transform: none; float: none; font-weight: 400; color: rgb(203,1,0); font-style: normal; text-align: center; orphans: 2; widows: 2; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　说时迟那时快，世界杯来了！对于皇城根下的购彩者来说，不论是玩足彩还是竞彩，不论是玩北单还是去彩站狂欢，都得记住那句话&mdash;&mdash;心动不如行动，麻利儿的您呐！（顾寒枫）</span></div>\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('20', '<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">6月2日，体彩大乐透第18063期开奖后，1注916万元头奖喜降京城。值得一提的是，这注大奖的诞生是拜一张&ldquo;双区胆拖复式票&rdquo;所赐。这也是北京地区在经历了&ldquo;6亿元大派奖&rdquo;期间的连续三个&ldquo;单式票头奖&rdquo;之后，大乐透大奖首次迎来&ldquo;脱单&rdquo;之旅，而将2018年京城大乐透大奖的复式票与单式票的对决局势扳成了&ldquo;三比三平局&rdquo;。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　单式票暂时&ldquo;休养生息&rdquo;，胆拖票重出江湖。一时间，京城彩市再迎体彩大乐透的新话题：单式，复式，胆拖，您到底最爱哪一款？</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　&ldquo;双区胆拖&rdquo;发威</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　京城彩友夺奖916万</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　6月2日晚，体彩大乐透第18063期开奖，开奖号码为：前区05、14、15、32、34，后区03、10。当期大乐透全国销售2.45亿元，为社会筹集体彩公益金8842万元。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　据开奖公告显示，当期全国共计中出4注一等奖&mdash;&mdash;其中，2注为单注1466万元（含550万元追加奖金）的追加投注一等奖，全部出自四川；另外两注为单注916万元的基本投注头奖，分别出自北京和广东。北京中出的916万元头奖出自海淀区第50040体彩销售网点，中奖彩票为一张&ldquo;前区2胆11拖+后区1胆5拖&rdquo;的胆拖票，单票擒奖971万元。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　从国家体彩中心提供的当期大乐透开奖数据中不难看出，京城916万元大奖中奖者是在当期开奖的前一天在第50040体彩店进行投注的，具体投注时间为6月1日傍晚18点02分。从投注内容上看，这位购彩者选择了前区的15和34为胆码、03、05、08、13、14、21、23、27、28、31、32为拖码，后区03为胆码、01、02、08、09、10为拖码，单票投入1650元。开奖后，这张&ldquo;双区胆拖复式票&rdquo;一举命中一等奖1注、二等奖4注、三等奖24注、四等奖180注、五等奖392注、六等奖224注，可谓在各个奖项弹无虚发、皆有斩获，单票各奖级总揽971万余元奖金，单票中奖回报高达5887倍。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　&ldquo;单式&rdquo;三连发</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　 &ldquo;胆拖复式&rdquo;收复失地</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　需要注意的是，北京地区大奖得主命中916万元头奖的&ldquo;双区胆拖票&rdquo;，是一种在购彩者中通常被认为&ldquo;技术含量&rdquo;较高的投注方式。胆拖投注也是复式投注中的一种。在胆拖投注中，胆码是不容错的投注号码，而拖码是可容错的投注号码。由于胆拖投注的号码覆盖面广，因而一旦命中高奖级奖金，很可能会连带中出多个其它奖级的奖金。有趣的是，在第18063期916万元大奖爆出之前，北京地区中出的最近3个大乐透大奖并非出自此种投注方式，而是全部源于单式投注方式。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　5月12日晚，大乐透第18054期开奖后，北京市朝阳区第35217体彩店中出1注1244万元追加投注头奖，连同二等奖在内总揽奖1259万元。中奖票是一张单式4注追加投注单，单票投入仅有12元。5月15日，中奖者孙先生现身领走大奖。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　4月23日晚，大乐透第18046期开奖后，北京市朝阳区第35114体彩店中出1注1391万元大奖。中奖票是一张5注单式追加投注单，单票投入15元。5月7日，中奖者现身领走大奖。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　4月16日晚，大乐透第18043期开奖后，北京市门头沟区第39004体彩店中出9921万元巨奖。中奖者凭借合计投入30元的两张投注单独揽12注（其中6注采用追加投注）一等奖，总夺额9921万元。4月20日，一对退休夫妇现身北京市体彩中心领走了这个北京体彩史上一人独中的最高奖金。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　请注意，在经历了单式票&ldquo;大奖三连发&rdquo;之后，胆拖复式票终于发威&mdash;&mdash;在第18063期开奖后，胆拖投注票为京城彩友擒下1注916万元大奖，不但为购彩者中的&ldquo;胆拖复式派&rdquo;收复失地，而且也再次丰富了京城购彩者&ldquo;围捕&rdquo;大乐透大奖的&ldquo;预期选择&rdquo;。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　今年六个大奖</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　单式复式战成&ldquo;三比三&rdquo;</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　也许是巧合，在6月2日晚第18063期大乐透中出的4注一等奖中，胆拖投注占据了半壁江山，与单式票形成分庭抗礼之势。除北京中出的头奖出自胆拖票之外，当期广东中出的1注916万元头奖出自汕头市，中奖彩票也是一张胆拖复式票，为一张&ldquo;前区3胆6拖+后区2&rdquo;的前区胆拖投注单，单票擒奖919万元。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　此外，当期四川中出的2注单注1466万元的追加大奖则是出自一张投入仅有6元的2倍单式追加倍投票，全部落户于成都市同一体彩销售网点，单票擒奖高达2933万元。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　据统计，截至第18063期开奖，北京地区2018年已中出六个（累计17注）大乐透大奖，其中包括一个9921万元的近亿巨奖。在这六个大奖中，单式票与复式票战成&ldquo;三比三&rdquo;，难分高下。</div>\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('21', '<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">本期&ldquo;京城彩站晒红单&rdquo;栏目一共展示四张票，分别出自北单、竞彩和排列3（两张）。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　中奖25187元/回报1574倍。这是一张北单足球胜平负9串1高串关&ldquo;红单&rdquo;，出自位于昌平区天通苑北一区2号楼110底商的I智慧竞彩店天通苑店，投入仅有16元，命中25187元。</div>\r\n<p style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); padding-bottom: 0px; font-style: normal; text-align: center; padding-top: 0px; padding-left: 10px; orphans: 2; widows: 2; margin: 0px; letter-spacing: normal; padding-right: 10px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><img alt=\"\" data-bd-imgshare-binded=\"1\" src=\"/uploadfile/2018/0614/20180614095128803.jpg\" style=\"border-top: 0px; height: 500px; border-right: 0px; width: 406px; border-bottom: 0px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; margin: 0px; padding-right: 0px\" /></p>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　中奖2413元/回报12倍。这是一竞彩足球胜平负2串1倍投票，出自位于西城区交大南门附近的第50097体彩店，经99倍投注后花费198元，揽奖2413元。</div>\r\n<p style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); padding-bottom: 0px; font-style: normal; text-align: center; padding-top: 0px; padding-left: 10px; orphans: 2; widows: 2; margin: 0px; letter-spacing: normal; padding-right: 10px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><img alt=\"\" data-bd-imgshare-binded=\"1\" src=\"/uploadfile/2018/0614/20180614095129285.jpg\" style=\"border-top: 0px; height: 500px; border-right: 0px; width: 360px; border-bottom: 0px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; margin: 0px; padding-right: 0px\" /></p>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　中奖1040元/回报4.3倍。这是一张排列3直选中奖票，出自位于丰台区晓月苑沸城7号楼的第37050体彩店。中奖者选择直选组合复式方式，花240元中奖1040元。</div>\r\n<p style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); padding-bottom: 0px; font-style: normal; text-align: center; padding-top: 0px; padding-left: 10px; orphans: 2; widows: 2; margin: 0px; letter-spacing: normal; padding-right: 10px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><img alt=\"\" data-bd-imgshare-binded=\"1\" src=\"/uploadfile/2018/0614/20180614095129517.jpg\" style=\"border-top: 0px; height: 281px; border-right: 0px; width: 400px; border-bottom: 0px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; margin: 0px; padding-right: 0px\" /></p>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　中奖4160元/回报6.9倍。这是一张排列3直选中奖票，出自丰台区第37050体彩店。中奖者采用&ldquo;和值&rdquo;投注，选择和值&ldquo;13&rdquo;，倍投4倍，投入600元，命中4160元。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: center; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><img alt=\"\" data-bd-imgshare-binded=\"1\" src=\"/uploadfile/2018/0614/20180614095130960.jpg\" style=\"border-top: 0px; height: 281px; border-right: 0px; width: 400px; border-bottom: 0px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; margin: 0px; padding-right: 0px\" /></div>\r\n<div class=\"main_content_edit\" style=\"font-size: 14px; height: 60px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: bold; color: rgb(48,48,48); padding-bottom: 10px; font-style: normal; text-align: right; orphans: 2; widows: 2; letter-spacing: normal; line-height: 60px; padding-right: 20px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">(编辑：郭晨曦)</div>\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('22', '<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　他们擒获三个大奖，一共只花了57元，累计夺奖金额却高达1.25亿元！是的，这样的剧情就发生在北京，发生在不久前刚刚结束的体彩大乐透&ldquo;6亿大派奖&rdquo;活动期间。巧的是，派奖期间眷顾京城的三个大乐透大奖，无一例外全部出自单式票。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　三个大奖豪取1.25亿元，各有各的机缘。从这三个大奖的中出过程来看，它们也各有值得把玩的&ldquo;关键词&rdquo;。</div>\r\n<p style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); padding-bottom: 0px; font-style: normal; text-align: center; padding-top: 0px; padding-left: 10px; orphans: 2; widows: 2; margin: 0px; letter-spacing: normal; padding-right: 10px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><img alt=\"\" data-bd-imgshare-binded=\"1\" src=\"/uploadfile/2018/0614/20180614095213990.jpg\" style=\"border-top: 0px; height: 300px; border-right: 0px; width: 349px; border-bottom: 0px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; margin: 0px; padding-right: 0px\" /></p>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　关键词：守号！凑整！等公交！</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　投入30元 &nbsp;退休夫妇豪取9921万</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　4月16日晚，体彩大乐透第18043期（&ldquo;6亿大派奖&rdquo;第3期）开奖后，北京市门头沟区第39004体彩店中出一个9921万元巨奖，中奖者凭借两张合计投入30元的小票独中12注（其中6注追加）一等奖，总夺额9921万元。4月20日，一对退休夫妇现身北京市体彩中心领走了这个北京体彩史上一人独中的最高奖金。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　据中奖老人介绍，4月15日上午，他与老伴去超市买食品，乘公交车来到双峪环岛准备换车时，老人到附近的39004体彩店买了两张相同号码的自选6倍单式大乐透票，一张追加投注花了18元，另一张没有追加花了12元&mdash;&mdash;就是这两张彩票合力击中了9921万元大奖。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　近亿元巨奖的来临，源自&ldquo;守号&rdquo;。中奖老人介绍，他平时都是自己选号，&ldquo;看着顺眼就选了，没有一定之规。&rdquo;他说：&ldquo;大乐透第18039期时我自选了这注号码，以后几期一直守号，中奖的这期是守号第5期了。&rdquo;当问及为什么有6注没有追加投注时，老人笑了笑：&ldquo;我也看到了这两天有彩友议论说这种买法比较特别。其实我就是为了凑整钱数，省得找零钱了，没有其他特别想法。&rdquo;</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　中奖老人介绍，他买体彩已经坚持了20年，&ldquo;我买彩票就是图个乐呵，中奖了当然高兴，没中也无所谓，下期接着买就是了。现在买彩票是我唯一爱好，早成为我的生活习惯了。&rdquo;沉吟片刻，他认真地说：&ldquo;体育彩票是国家彩票，是公益彩票，买彩票也是作公益吧。&rdquo;</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　关键词：5注！追加！老套路！</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　只投15元 &nbsp;&ldquo;鼠标垫&rdquo;彩友邂逅1391万</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　4月23日晚，体彩大乐透第18046期（派奖第6期）开奖之后，北京市朝阳区第35114体彩店中出1注1391万元大奖。两周之后的5月7日，大奖得主在朋友陪同下现身领奖。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　这位彩友的中奖彩票是一张5注单式票，5注号码均选择了追加投注，投入仅为15元，开奖后，票面上的第2注号码命中大乐透一等奖。他介绍，采用15元5注单式追加投注的方式购买大乐透，对自己来说已是轻车熟路，是个惯用的&ldquo;老套路&rdquo;。他说：&ldquo;一般我都是很随机地进行投注，机选5注进行追加，每期花15元，算是给生活注入一点点小小的希望。连买彩票的网点，我也是很随机的，遇到就买，遇不到也不强求。&rdquo;</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　在说到为何中奖后时隔两周才来领奖时，这位中奖者说：&ldquo;一开始我并不相信自己中奖，彩票压在鼠标垫下面，我对着电脑反复确认了好几次。&rdquo;他介绍，在家人和朋友&ldquo;劝说&rdquo;下，他终于叫上了一个好朋友，来到北京市体彩中心&ldquo;兑奖试一试&rdquo;。不试不知道，一试吓一跳，&ldquo;这1000多万元的奖金真是我的！&rdquo;他激动地说。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　值得一提的是，中出大奖的第35114体彩店开业还不到一年时间。该店业主吴征表示，大乐透派奖活动非常好，非常惠民，彩友都很乐意参与，&ldquo;这个1391万元大奖，就是因为正值派奖期间，幸运彩友多得了170万元派奖奖金。&rdquo;</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　关键词：聚餐！吉利！吃出来！</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　只花12元 &nbsp;&ldquo;生意人&rdquo;捧走1259万</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　5月12日晚，体彩大乐透第18054期（派奖第14期）开奖后，北京市朝阳区第35217体彩店中出1注1244万元追加投注头奖，连同二等奖在内总揽奖1259万元。三天后，5月15日，彩友孙先生现身领走大奖。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　从中奖票面显示，孙先生的这注大奖出自一张单式追加票，投入只有12元，票面上一共有4注号码，在命中1注一等奖的同时，票面上的第2注号码还命中1注二等奖，单票各奖级总揽奖1259万元。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　从某种意义上说，孙先生的这个大奖是&ldquo;吃出来&rdquo;的。此话怎讲？且听孙先生道来&mdash;&mdash;&ldquo;那天正好约了朋友一起聚餐，在餐厅附近见到了这家彩票店。&rdquo;孙先生说，&ldquo;店里购彩氛围很好，墙上贴着大乐透派奖海报和中奖喜报，我觉得很吉利，就打了几注大乐透，没想到真中奖了。&rdquo;&nbsp;</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　孙先生介绍，他来北京两年左右，一直在做小生意，以前在老家的时候经常买彩票，从大乐透上市后就钟情于它，&ldquo;几乎期期不落，投入不多，一期十几块钱。&rdquo;将大奖收入囊中之后，孙先生表示，在北京打拼的压力太大了，自己想从此告别在京城闯荡的生活，&ldquo;我打算不再当北漂了，回家跟老婆一起开个小店，踏踏实实过日子。&rdquo;（顾寒枫）</div>\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('23', '<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">2018年6月12日，体育彩票7星彩玩法第18067期开奖，本期7星彩头奖空开，当期开奖过后，7星彩奖池金额为662万元。</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&nbsp;</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">据开奖公告显示，本期7星彩开奖号码为&ldquo;7547356&rdquo;，全国共中出一等奖0注；共中出二等奖5注，单注奖金56281元；此外全国还中出三等奖123注，四等奖1432注。</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&nbsp;</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">从当期7星彩开奖号码来看，本期号码主要集中在中间号段，当期最大码为&ldquo;7&rdquo;，最小码为&ldquo;3&rdquo;，和值为37，数值偏大。当期号码的奇偶比为5：2，奇数号占绝对优势。最近几期开奖奇数号状态走强，彩民朋友可继续关注。从号码冷热来看，当期中奖数字冷热兼备，出现在第6位的数字&ldquo;5&rdquo;在近20期开奖中出现过5次，是近期的活跃号码；而出现在第4位的数字&ldquo;7&rdquo;在近20期仅出现1次，成为本期最冷门号码。</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&nbsp;</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">据开奖公告显示，7星彩第18067期的销售额为1001.4万元，当期头奖空开之后，7星彩奖池金额为662.8万元。希望彩民朋友们再接再厉，争取早日收获7星彩大奖。</p>\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('24', '<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">周五002 世界杯&nbsp; 埃及VS乌拉圭&nbsp;&nbsp;&nbsp; 比赛时间：2018-06-15 20:00 投注提点：埃及近期6场比赛不胜，球队核心萨拉赫因伤出战成疑；乌拉圭热身赛取得3连胜，状态尚佳，此役志在赢得开门红。</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&nbsp;</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">周五003 世界杯&nbsp; 摩洛哥VS伊朗&nbsp;&nbsp;&nbsp; 比赛时间：2018-06-15 23:00 投注提点：摩洛哥在法国人雷纳尔的率领下，近10场比赛保持不败，球队防守实力强劲；伊朗队受政治因素影响热身备战，球员状态成疑。</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&nbsp;</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">周五004 世界杯&nbsp; 葡萄牙VS西班牙&nbsp; 比赛时间：2018-06-16 2:00&nbsp; 投注提点：葡萄牙队热身赛状态良好，球队氛围融洽；西班牙队临时换帅，球队状态难以预料，首战面对葡萄牙难言乐观。</p>\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('25', '<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">6月13日，体彩大乐透第18068期前区开出号码08、12、16、26、33，后区开出号码05、06。</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&nbsp;</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>河南购彩者包揽2注头奖</strong></p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&nbsp;</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">本期全国共开出2注头奖，单注奖金为1000万元，全部落于河南。</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&nbsp;</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">数据显示，河南中出的2注头奖分落郑州和商丘。其中，郑州购彩者中出的是一张5注10元投入的单式票；商丘购彩者中出的是一张6+3复式票，投入36元，共中出一等奖1注、二等奖2注、三等奖5注、四等奖10注，单票擒奖1023万元。</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&nbsp;</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">稍显遗憾的是，由于未采用追加投注，两位幸运购彩者，每人在头奖方面要少拿了600万元追加奖金，从而无缘单个1600万元封顶头奖。</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&nbsp;</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">本期二三等奖的中奖数量较多。二等奖开出72注，每注奖金为10.53万元；其中32注采用追加投注，每注多得奖金6.32万元。追加后，二等奖单注总奖金为16.85万元。三等奖开出576注，每注奖金为5063元；其中270注采用追加投注，每注多得奖金3037元。追加后，三等奖单注总奖金为8100元。</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&nbsp;</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>前区奖号分布范围广</strong></p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&nbsp;</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">奖号方面，前区08、12、16、26、33的分布范围较广，各个号段上均有号码开出。最小号码开出0号段上的08；1号段上开出12、16；其中12复制上期（第18067期）奖号；2号段上开出26；3号段上开出33；该号为隔期开出号码，同时是前区最大号码。</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&nbsp;</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">后区开出05、06一对小号、连号组合。最近5期，后区奖号的大小号码数量比为4比6，小号略占优。</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&nbsp;</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>58.74亿元滚存至&ldquo;世界杯&rdquo;期间</strong></p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&nbsp;</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">奖池方面，本期开奖结束后，58.74亿元滚存至6月16日（周六）晚开奖的第18069期，这一水位较上期继续上涨，再次刷新历史最高纪录。届时，世界杯狂欢已经开启，提醒购彩者观看精彩足球赛事的同时，别忘了买上几注大乐透。</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">&nbsp;</p>\r\n<p style=\"font-size: 14px; font-family: 宋体, sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(102,102,102); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px 0px 3px; letter-spacing: normal; line-height: 24px; padding-right: 0px; background-color: rgb(255,255,255); text-indent: 28px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">据统计，体彩大乐透近4期累计开出8注头奖，清一色为千万元大奖，包括1注1600万元和7注1000万元，奖金成色十足。</p>\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('26', '<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">世界杯四年一届。每隔四年，足球的天空都会掠过一道万众瞩目的彩虹。从2010年开始，这道彩虹中多了一抹叫作&ldquo;竞彩&rdquo;的亮色。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　如果把每届世界杯当作接力赛中的一棒，那么到2018年，于2009年5月上市的体育彩票竞彩游戏刚好接过自己与世界杯比肩而跑的第三棒。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　第一棒，南非世界杯期间，竞彩游戏销量为13.5亿。这，大约相当于全中国每个人在世界杯期间买了一元的竞彩。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　这个数字在2014年的第二棒期间发生了巨大变化。2014年巴西世界杯期间，有三件事是不能忘记的。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　第一件，2014世界杯期间竞彩游戏销量高达129亿，几乎是四年前的十倍，单日销量峰值逾10亿，被媒体誉为&ldquo;创造了中国彩票史的奇迹&rdquo;。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　第二件，竞彩游戏在当年10月推出单场固定奖。此举被舆论公认为代表着竞彩游戏与国际的深度接轨。四年后的今天，&ldquo;单固&rdquo;的旋律历经光阴流转，正在被竞彩玩家传唱为耳熟能详、高潮迭起的一段经典名曲。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　第三件，竞彩游戏的整体返奖率从69%提升至73%，也发生在2014年，竞彩也因此成为中国彩市首个返奖率突破70%的游戏，至今稳坐中国彩票单品游戏返奖的头把交椅。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　销量高，返奖高，令竞彩成为彩市的&ldquo;双高游戏&rdquo;。而对于投注者来说，竞猜世界杯，&ldquo;猜得准&rdquo;才是王道。要说&ldquo;猜得准&rdquo;，有一位名叫&ldquo;保罗&rdquo;的已故&ldquo;名宿&rdquo;不得不提。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　保罗，一只章鱼，无脊椎软体动物。它生于英国，长于德国，出道于2008欧洲杯，火爆于2010世界杯。在那两届杯赛上，保罗一共预测14次，命中13次，成功率高达92%，被誉为&ldquo;预测帝&rdquo;。2010年10月，它在德国奥伯豪森水族馆去世时，不到三岁。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　水族馆里的&ldquo;预言帝&rdquo;能够准确预言92%的足球对阵，但对于中国体育彩票、特别是竞彩游戏在三届世界杯期间天翻地覆的表现，恐怕也很难洞见。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　6月14日，俄罗斯世界杯登场，竞彩游戏即将接过第三棒。未来一个月，竞彩及其竞猜者们又会划出怎样的彩虹，演绎何种传奇？</div>\r\n<br style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\" />\r\n<div class=\"main_content_edit\" style=\"font-size: 14px; height: 60px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: bold; color: rgb(48,48,48); padding-bottom: 10px; font-style: normal; text-align: right; orphans: 2; widows: 2; letter-spacing: normal; line-height: 60px; padding-right: 20px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">(编辑：郭晨曦)</div>\r\n', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('27', '推荐注册会员后，推荐的会员的流水返推荐人0.2%的佣金。详情请联系客服。', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('28', '从今日起，凡注册成为会员就送18元礼金！了解详情请联系客服人员。', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('29', '注册会员后，每天签到都可得到相应的礼金！详情请咨询客服人员。', '', '0', '0', '', '0', '', '0', '1', '');
INSERT INTO `cp_news_data` VALUES ('30', '<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">体彩公益金对于《奥运争光计划》的支持源于1995年，20多年来，为我国体育健儿改善了训练条件，帮助他们提高运动成绩，在国际赛事上为国争光。近日，体育彩票的身影又出现在全国体操锦标赛和羽毛球热身赛的场地上，为运动员呐喊助威。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　助力全国体操赛</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　5月7日至13日，由国家体育总局体操运动管理中心、中国体操协会主办，广东省体育局、肇庆市政府承办的2018年全国体操锦标赛暨亚运会选拔赛在肇庆新区体育中心举行。全国锦标赛是体操项目规模最大、水平最高的国内赛事，本次赛事共有21支队伍参赛，同时也是亚运会的选拔赛。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　体育馆入口和通道处，设置了体彩大乐透派奖活动宣传展板；在场馆通道，开展了顶呱刮即开票营销活动，引来不少行人驻足、购买。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　比赛场地上悬挂的&ldquo;中国体育彩票&rdquo;横幅，更是给现场和电视机前的观众留下了深刻印象。肇庆体彩还向观众派发了印有&ldquo;中国体育彩票&rdquo;字样的加油棒，让观众们为比赛选手加油助威。</div>\r\n<p style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); padding-bottom: 0px; font-style: normal; text-align: center; padding-top: 0px; padding-left: 10px; orphans: 2; widows: 2; margin: 0px; letter-spacing: normal; padding-right: 10px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><img alt=\"\" data-bd-imgshare-binded=\"1\" src=\"/uploadfile/2018/0615/20180615045048829.jpg\" style=\"border-top: 0px; height: 500px; border-right: 0px; width: 500px; border-bottom: 0px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; margin: 0px; padding-right: 0px\" /></p>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　羽球国手为体彩&ldquo;代言&rdquo;</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　在近日结束的汤姆斯杯比赛中，中国羽毛球队捧杯。出征本次比赛之前，国家羽毛球队在湖北华中师范大学佑铭体育馆进行了一场热身赛，体育彩票出现在比赛场地，众多羽毛球国手为体彩&ldquo;代言&rdquo;</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　5月13日晚，国家羽毛球队出征汤姆斯杯、尤伯杯热身赛在华中师范大学佑铭体育馆举行。国家羽毛球队教练员、运动员共30余人到场，林丹、谌龙、张楠、李雪芮等明星球员为现场观众献上了一场精彩的&ldquo;羽球盛宴&rdquo;。现场30多块&ldquo;公益体彩 乐善人生&rdquo;中国体育彩票宣传展板，吸引了观众们的眼球。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　李雪芮是重庆体彩的形象大使，她曾多次参与体彩的助学活动，鼓励孩子们参加体育运动并为他们送去体育器材。她克服伤病、顽强拼搏、不言放弃，也是对体彩精神的最好诠释。</div>\r\n<p style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); padding-bottom: 0px; font-style: normal; text-align: center; padding-top: 0px; padding-left: 10px; orphans: 2; widows: 2; margin: 0px; letter-spacing: normal; padding-right: 10px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><img alt=\"\" data-bd-imgshare-binded=\"1\" src=\"/uploadfile/2018/0615/20180615045049473.jpg\" style=\"border-top: 0px; height: 333px; border-right: 0px; width: 500px; border-bottom: 0px; padding-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; margin: 0px; padding-right: 0px\" /></p>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　链接</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\"><strong>　　支持《奥运争光计划》</strong></div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　《奥运争光计划》于1995年7月6日发布，体彩公益金是其主要的资金来源。在国家体育总局本级彩票公益金中，用于《奥运争光计划》和《全民健身计划》的比例为4比6。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　该计划是一项系统工程，是滚动式计划，根据需要不断添加新的内容。比如，今年3月，国家体育总局人力中心启动为国家队送课服务，即向国家队提供综合素质课程服务，以提升运动员整体素质和综合实力。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　3月7日，在江苏昆山，为国家女子水球队送上了时间管理、职业形象与礼仪、公共演讲与表达等课程，同时送上《国际奥委会运动员成长工具包》《运动员职业发展读本》等学习资料，助力国家女子水球队运动员的成长发展。目前，人力中心已收到18家单位的52支国家队提出的200余次送课需求。</div>\r\n<div style=\"font-size: 14px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(48,48,48); font-style: normal; text-align: justify; orphans: 2; widows: 2; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">　　《奥运争光计划》的内容仍在不断丰富，这些都离不开体彩公益金的全力支持。</div>\r\n<div class=\"main_content_edit\" style=\"font-size: 14px; height: 60px; font-family: 宋体; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: bold; color: rgb(48,48,48); padding-bottom: 10px; font-style: normal; text-align: right; orphans: 2; widows: 2; letter-spacing: normal; line-height: 60px; padding-right: 20px; background-color: rgb(255,255,255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial\">(编辑：严娇)</div>\r\n', '', '0', '0', '', '0', '', '0', '1', '');

-- ----------------------------
-- Table structure for `cp_page`
-- ----------------------------
DROP TABLE IF EXISTS `cp_page`;
CREATE TABLE `cp_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_page
-- ----------------------------
INSERT INTO `cp_page` VALUES ('6', '安卓二维码', ';', '二维码 安卓', '<img alt=\"\" src=\"/uploadfile/2018/0606/20180606051905103.jpg\" style=\"width: 1920px; height: 1080px;\" />', '', '0');
INSERT INTO `cp_page` VALUES ('29', '联系我们', ';', '联系我们', '微信：<br />\r\n&nbsp;QQ ：<br />\r\n', '', '0');
INSERT INTO `cp_page` VALUES ('31', '开奖公告', ';', '开奖公告开奖公告', '<script type=\"text/javascript\">\r\n    function changeSrc(index) {\r\n        document.getElementById(\"myframe\").src = \"http://58.221.44.99:81/Member/Mesg/kaijiang.aspx?gameIndex=\"+index+\"&page=1\";\r\n    }\r\n</script>\r\n<link href=\"./assets/statics/css/home.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<link href=\"./assets/statics/css/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<link href=\"./assets/statics/css/draw.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<div class=\"wrap-bg\">\r\n<div class=\"wrapper\">\r\n<div class=\"main\">\r\n<ul class=\"cz_nav\">\r\n<li class=\"on\" data-type=\"all\"><a>全部彩种</a></li>\r\n</ul>\r\n<div>\r\n<div class=\"cz_menu\" style=\"height:120px\">\r\n<div id=\"_games_1\" style=\"position:relative\">\r\n<p id=\"tabList\" name=\"list\"><a href=\"javascript:void(0);\" onclick=\"changeSrc(3)\"><span>重慶時時彩</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(2)\">| <span>廣東快樂十分</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(4)\">| <span>北京賽車</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(5)\">| <span>江蘇骰寶</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(6)\">| <span>北京快樂8</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(7)\">| <span>重慶幸運農場</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(8)\">| <span>幸運飛艇</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(9)\">| <span>廣東十一選五</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(10)\">| <span>廣西快樂十分</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(11)\">| <span>PC蛋蛋(北京28)</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(12)\"> <span>加拿大pc28</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(13)\">| <span>天津时时彩</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(14)\">| <span>新疆时时彩</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(15)\">| <span>极速时时彩</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(16)\">| <span>幸运时时彩</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(17)\">| <span>极速赛车</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(18)\">| <span>幸运赛车</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(19)\">| <span>幸运快三</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(20)\">| <span>安微快三</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(21)\">| <span>福建快三</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(22)\">| <span>吉林快三</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(23)\"> <span>上海快三</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(24)\">| <span>广西快三</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(25)\">| <span>河北快三</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(26)\">| <span>湖北快三</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(27)\">| <span>北京快三</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(28)\">| <span>内蒙古快三</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(29)\">| <span>极速六合彩</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(30)\">| <span>腾讯分分彩</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(31)\">| <span>上海十一选五</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(32)\">| <span>北京十一选五</span></a> <a href=\"javascript:void(0);\" onclick=\"changeSrc(1)\">| <span>香港六合彩</span></a></p>\r\n</div>\r\n<div class=\"clear\">&nbsp;</div>\r\n</div>\r\n<div id=\"_iframe_divs\">\r\n<div class=\"cz-box\" id=\"_games_2\" style=\"display:block\">\r\n<div class=\"kj_box\">\r\n<h1>最新彩票开奖结果</h1>\r\n<iframe frameborder=\"0\" height=\"2800\" id=\"myframe\" name=\"myframe\" scrolling=\"no\" src=\"http://58.221.44.99:81/Member/Mesg/kaijiang.aspx?gameIndex=3&amp;page=1\" width=\"1000\"></iframe>\r\n<table cellpadding=\"0\" cellspacing=\"0\" class=\"kj_tab\"></table>\r\n</div>\r\n</div>\r\n<div class=\"div_iframe\" name=\"iframe_div\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<br />\r\n', '', '0');

-- ----------------------------
-- Table structure for `cp_pay_account`
-- ----------------------------
DROP TABLE IF EXISTS `cp_pay_account`;
CREATE TABLE `cp_pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_pay_account
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_pay_payment`
-- ----------------------------
DROP TABLE IF EXISTS `cp_pay_payment`;
CREATE TABLE `cp_pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) DEFAULT NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_pay_payment
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_pay_spend`
-- ----------------------------
DROP TABLE IF EXISTS `cp_pay_spend`;
CREATE TABLE `cp_pay_spend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `creat_at` (`creat_at`),
  KEY `logo` (`logo`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_pay_spend
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_picture`
-- ----------------------------
DROP TABLE IF EXISTS `cp_picture`;
CREATE TABLE `cp_picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `img` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_picture
-- ----------------------------
INSERT INTO `cp_picture` VALUES ('1', '7', '0', '安卓二维码', '', '2018/0606/20180606051905103.jpg', '', '0', '/index.php?m=content&c=index&a=show&catid=7&id=1', '0', '99', '1', 'any', '1528276835', '1528982252', '', '/uploadfile/2018/0614/20180614061058772.png');
INSERT INTO `cp_picture` VALUES ('2', '7', '0', '苹果二维码', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=7&id=2', '0', '99', '1', 'any', '1528276898', '1528982236', '', '/uploadfile/2018/0614/20180614061058772.png');
INSERT INTO `cp_picture` VALUES ('3', '19', '0', '首页LOGO', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=19&id=3', '0', '99', '1', 'any', '1528711040', '1528982331', '', '/uploadfile/2018/0614/20180614061551982.png');
INSERT INTO `cp_picture` VALUES ('4', '20', '0', '首页背景图', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=20&id=4', '0', '99', '1', 'any', '1528713750', '1529056313', '', '/uploadfile/2018/0615/20180615055147535.png');
INSERT INTO `cp_picture` VALUES ('7', '30', '0', '手机购彩', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=30&id=7', '0', '99', '1', 'admin', '1528987141', '1529050804', '', '/uploadfile/2018/0615/20180615041956470.png');

-- ----------------------------
-- Table structure for `cp_picture_data`
-- ----------------------------
DROP TABLE IF EXISTS `cp_picture_data`;
CREATE TABLE `cp_picture_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_picture_data
-- ----------------------------
INSERT INTO `cp_picture_data` VALUES ('1', '0', '0', '', '0');
INSERT INTO `cp_picture_data` VALUES ('2', '0', '0', '', '0');
INSERT INTO `cp_picture_data` VALUES ('3', '0', '0', '', '0');
INSERT INTO `cp_picture_data` VALUES ('4', '0', '0', '', '0');
INSERT INTO `cp_picture_data` VALUES ('7', '0', '0', '', '0');

-- ----------------------------
-- Table structure for `cp_position`
-- ----------------------------
DROP TABLE IF EXISTS `cp_position`;
CREATE TABLE `cp_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned DEFAULT '0',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  `extention` char(100) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_position
-- ----------------------------
INSERT INTO `cp_position` VALUES ('1', '0', '0', '首页焦点图推荐', '20', null, '1', '1', '');
INSERT INTO `cp_position` VALUES ('2', '0', '0', '首页头条推荐', '20', null, '4', '1', '');
INSERT INTO `cp_position` VALUES ('13', '82', '0', '栏目页焦点图', '20', null, '0', '1', '');
INSERT INTO `cp_position` VALUES ('5', '69', '0', '推荐下载', '20', null, '0', '1', '');
INSERT INTO `cp_position` VALUES ('8', '30', '54', '图片频道首页焦点图', '20', null, '0', '1', '');
INSERT INTO `cp_position` VALUES ('9', '0', '0', '网站顶部推荐', '20', null, '0', '1', '');
INSERT INTO `cp_position` VALUES ('10', '0', '0', '栏目首页推荐', '20', null, '0', '1', '');
INSERT INTO `cp_position` VALUES ('12', '0', '0', '首页图片推荐', '20', null, '0', '1', '');
INSERT INTO `cp_position` VALUES ('14', '0', '0', '视频首页焦点图', '20', '', '0', '1', '');
INSERT INTO `cp_position` VALUES ('15', '0', '0', '视频首页头条推荐', '20', '', '0', '1', '');
INSERT INTO `cp_position` VALUES ('16', '0', '0', '视频首页每日热点', '20', '', '0', '1', '');
INSERT INTO `cp_position` VALUES ('17', '0', '0', '视频栏目精彩推荐', '20', '', '0', '1', '');

-- ----------------------------
-- Table structure for `cp_position_data`
-- ----------------------------
DROP TABLE IF EXISTS `cp_position_data`;
CREATE TABLE `cp_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `modelid` smallint(6) unsigned DEFAULT '0',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `data` mediumtext,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `listorder` mediumint(8) DEFAULT '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) DEFAULT NULL,
  `synedit` tinyint(1) DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_position_data
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_poster`
-- ----------------------------
DROP TABLE IF EXISTS `cp_poster`;
CREATE TABLE `cp_poster` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `setting` text NOT NULL,
  `startdate` int(10) unsigned NOT NULL DEFAULT '0',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clicks` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `spaceid` (`spaceid`,`siteid`,`disabled`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_poster
-- ----------------------------
INSERT INTO `cp_poster` VALUES ('1', '1', 'banner', '1', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://cp.com/uploadfile/poster/2.png\',\n    \'alt\' => \'\',\n  ),\n)', '1285813808', '1446249600', '1285813833', '0', '1', '0', '0');
INSERT INTO `cp_poster` VALUES ('2', '1', 'phpcmsv9', '2', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://cp.com/statics/images/v9/ad_login.jpg\',\n    \'alt\' => \'phpcms专业建站系统\',\n  ),\n)', '1285816298', '1446249600', '1285816310', '0', '1', '0', '0');
INSERT INTO `cp_poster` VALUES ('3', '1', 'phpcms下载推荐', '3', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://cp.com/uploadfile/poster/3.png\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)', '1286504815', '1446249600', '1286504865', '0', '1', '0', '0');
INSERT INTO `cp_poster` VALUES ('4', '1', 'phpcms广告', '4', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://cp.com/uploadfile/poster/4.gif\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)', '1286505141', '1446249600', '1286505178', '0', '0', '0', '0');
INSERT INTO `cp_poster` VALUES ('5', '1', 'phpcms下载', '5', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://cp.com/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)', '1286509363', '1446249600', '1286509401', '0', '0', '0', '0');
INSERT INTO `cp_poster` VALUES ('6', '1', 'phpcms下载推荐1', '6', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://cp.com/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)', '1286510183', '1446249600', '1286510227', '0', '0', '0', '0');
INSERT INTO `cp_poster` VALUES ('7', '1', 'phpcms下载详情', '7', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://cp.com/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)', '1286510314', '1446249600', '1286510341', '0', '0', '0', '0');
INSERT INTO `cp_poster` VALUES ('8', '1', 'phpcms下载页', '8', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://cp.com/uploadfile/poster/1.jpg\',\n    \'alt\' => \'官方站\',\n  ),\n)', '1286522084', '1446249600', '1286522125', '0', '0', '0', '0');
INSERT INTO `cp_poster` VALUES ('9', '1', 'phpcms v9广告', '9', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://cp.com/uploadfile/poster/4.gif\',\n    \'alt\' => \'\',\n  ),\n)', '1287041759', '1446249600', '1287041804', '0', '0', '0', '0');
INSERT INTO `cp_poster` VALUES ('10', '1', 'phpcms', '10', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://cp.com/uploadfile/poster/6.jpg\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)', '1289270509', '1446249600', '1289270541', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for `cp_poster_201806`
-- ----------------------------
DROP TABLE IF EXISTS `cp_poster_201806`;
CREATE TABLE `cp_poster_201806` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_poster_201806
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_poster_space`
-- ----------------------------
DROP TABLE IF EXISTS `cp_poster_space`;
CREATE TABLE `cp_poster_space` (
  `spaceid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(50) NOT NULL,
  `type` char(30) NOT NULL,
  `path` char(40) NOT NULL,
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `setting` char(100) NOT NULL,
  `description` char(100) NOT NULL,
  `items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spaceid`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_poster_space
-- ----------------------------
INSERT INTO `cp_poster_space` VALUES ('1', '1', '顶部搜索右侧广告位', 'banner', 'poster_js/1.js', '430', '63', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `cp_poster_space` VALUES ('2', '1', '会员登陆页广告', 'banner', 'poster_js/2.js', '310', '304', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '会员登陆页广告右侧代替外部通行证广告', '1', '0');
INSERT INTO `cp_poster_space` VALUES ('3', '1', '图片频道图片排行下方', 'banner', 'poster_js/3.js', '249', '87', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `cp_poster_space` VALUES ('4', '1', '新闻中心推荐链接左侧', 'banner', 'poster_js/4.js', '748', '91', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `cp_poster_space` VALUES ('5', '1', '下载列表页右侧顶部', 'banner', 'poster_js/5.js', '248', '162', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `cp_poster_space` VALUES ('6', '1', '下载详情页右侧顶部', 'banner', 'poster_js/6.js', '248', '162', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `cp_poster_space` VALUES ('7', '1', '下载详情页右侧下部', 'banner', 'poster_js/7.js', '248', '162', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `cp_poster_space` VALUES ('8', '1', '下载频道首页', 'banner', 'poster_js/8.js', '698', '80', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `cp_poster_space` VALUES ('9', '1', '下载详情页地址列表右侧', 'banner', 'poster_js/12.js', '330', '50', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `cp_poster_space` VALUES ('10', '1', '首页关注下方广告', 'banner', 'poster_js/10.js', '307', '60', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');

-- ----------------------------
-- Table structure for `cp_price`
-- ----------------------------
DROP TABLE IF EXISTS `cp_price`;
CREATE TABLE `cp_price` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_price
-- ----------------------------
INSERT INTO `cp_price` VALUES ('1', '25', '0', '我来了', '', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=25&id=1', '0', '99', '1', 'admin', '1528954411', '1528982615', '1980');
INSERT INTO `cp_price` VALUES ('2', '25', '0', '爱上彩票', '', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=25&id=2', '0', '99', '1', 'admin', '1528954424', '1528982636', '570');
INSERT INTO `cp_price` VALUES ('3', '25', '0', '快三之王', '', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=25&id=3', '0', '99', '1', 'admin', '1528954435', '1528982660', '980');
INSERT INTO `cp_price` VALUES ('4', '25', '0', '擒百万', '', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=25&id=4', '0', '99', '1', 'admin', '1528982667', '1528982692', '1070');
INSERT INTO `cp_price` VALUES ('5', '25', '0', '天天开锣', '', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=25&id=5', '0', '99', '1', 'admin', '1528982697', '1528982730', '98');
INSERT INTO `cp_price` VALUES ('6', '25', '0', '六合王', '', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=25&id=6', '0', '99', '1', 'admin', '1528983445', '1528983485', '4880');
INSERT INTO `cp_price` VALUES ('7', '25', '0', '白小姐', '', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=25&id=7', '0', '99', '1', 'admin', '1528983494', '1528983514', '2440');
INSERT INTO `cp_price` VALUES ('8', '25', '0', '彩神到', '', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=25&id=8', '0', '99', '1', 'admin', '1528983605', '1528983643', '960');
INSERT INTO `cp_price` VALUES ('9', '25', '0', '吃鸡', '', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=25&id=9', '0', '99', '1', 'admin', '1528983657', '1528983698', '3840');
INSERT INTO `cp_price` VALUES ('10', '25', '0', '好彩头', '', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=25&id=10', '0', '99', '1', 'admin', '1528983707', '1528983728', '1080');
INSERT INTO `cp_price` VALUES ('11', '25', '0', '同花顺', '', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=25&id=11', '0', '99', '1', 'admin', '1528983744', '1528983767', '2680');
INSERT INTO `cp_price` VALUES ('12', '25', '0', '招弟', '', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=25&id=12', '0', '99', '1', 'admin', '1528983776', '1528983800', '9600');
INSERT INTO `cp_price` VALUES ('13', '25', '0', '大圣', '', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=25&id=13', '0', '99', '1', 'admin', '1528983809', '1528983839', '10400');

-- ----------------------------
-- Table structure for `cp_price_data`
-- ----------------------------
DROP TABLE IF EXISTS `cp_price_data`;
CREATE TABLE `cp_price_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_price_data
-- ----------------------------
INSERT INTO `cp_price_data` VALUES ('1', '', '0', '0', '', '0', '');
INSERT INTO `cp_price_data` VALUES ('2', '', '0', '0', '', '0', '');
INSERT INTO `cp_price_data` VALUES ('3', '', '0', '0', '', '0', '');
INSERT INTO `cp_price_data` VALUES ('4', '', '0', '0', '', '0', '');
INSERT INTO `cp_price_data` VALUES ('5', '', '0', '0', '', '0', '');
INSERT INTO `cp_price_data` VALUES ('6', '', '0', '0', '', '0', '');
INSERT INTO `cp_price_data` VALUES ('7', '', '0', '0', '', '0', '');
INSERT INTO `cp_price_data` VALUES ('8', '', '0', '0', '', '0', '');
INSERT INTO `cp_price_data` VALUES ('9', '', '0', '0', '', '0', '');
INSERT INTO `cp_price_data` VALUES ('10', '', '0', '0', '', '0', '');
INSERT INTO `cp_price_data` VALUES ('11', '', '0', '0', '', '0', '');
INSERT INTO `cp_price_data` VALUES ('12', '', '0', '0', '', '0', '');
INSERT INTO `cp_price_data` VALUES ('13', '', '0', '0', '', '0', '');

-- ----------------------------
-- Table structure for `cp_queue`
-- ----------------------------
DROP TABLE IF EXISTS `cp_queue`;
CREATE TABLE `cp_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` char(5) DEFAULT NULL,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `path` varchar(100) DEFAULT NULL,
  `status1` tinyint(1) DEFAULT '0',
  `status2` tinyint(1) DEFAULT '0',
  `status3` tinyint(1) DEFAULT '0',
  `status4` tinyint(1) DEFAULT '0',
  `times` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `times` (`times`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_release_point`
-- ----------------------------
DROP TABLE IF EXISTS `cp_release_point`;
CREATE TABLE `cp_release_point` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `port` varchar(10) DEFAULT '21',
  `pasv` tinyint(1) DEFAULT '0',
  `ssl` tinyint(1) DEFAULT '0',
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_release_point
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_round`
-- ----------------------------
DROP TABLE IF EXISTS `cp_round`;
CREATE TABLE `cp_round` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_round
-- ----------------------------
INSERT INTO `cp_round` VALUES ('1', '15', '0', '首页楼内博图', '', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=15&id=1', '0', '99', '1', 'any', '1528341022', '1528982310');
INSERT INTO `cp_round` VALUES ('2', '23', '0', '底部认证图片', '', '', '', '', '0', '/index.php?m=content&c=index&a=show&catid=23&id=2', '0', '99', '1', 'admin', '1528946278', '1529061650');

-- ----------------------------
-- Table structure for `cp_round_data`
-- ----------------------------
DROP TABLE IF EXISTS `cp_round_data`;
CREATE TABLE `cp_round_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `images` mediumtext NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_round_data
-- ----------------------------
INSERT INTO `cp_round_data` VALUES ('1', '', '0', '0', '', '0', '{\"0\":{\"url\":\"\\/uploadfile\\/2018\\/0614\\/20180614073854886.png\",\"alt\":\"2\"},\"1\":{\"url\":\"\\/uploadfile\\/2018\\/0614\\/20180614073908598.png\",\"alt\":\"3\"},\"2\":{\"url\":\"\\/uploadfile\\/2018\\/0614\\/20180614073918770.png\",\"alt\":\"4\"}}');
INSERT INTO `cp_round_data` VALUES ('2', '', '0', '0', '', '0', '{\"0\":{\"url\":\"\\/uploadfile\\/2018\\/0615\\/20180615072033106.png\",\"alt\":\"\\u8ba4\\u8bc11\"},\"1\":{\"url\":\"\\/uploadfile\\/2018\\/0615\\/20180615072037329.png\",\"alt\":\"\\u8ba4\\u8bc12\"},\"2\":{\"url\":\"\\/uploadfile\\/2018\\/0615\\/20180615072039457.png\",\"alt\":\"\\u8ba4\\u8bc13\"},\"3\":{\"url\":\"\\/uploadfile\\/2018\\/0615\\/20180615072042951.png\",\"alt\":\"\\u8ba4\\u8bc14\"},\"4\":{\"url\":\"\\/uploadfile\\/2018\\/0615\\/20180615072044197.png\",\"alt\":\"\\u8ba4\\u8bc15\"}}');

-- ----------------------------
-- Table structure for `cp_search`
-- ----------------------------
DROP TABLE IF EXISTS `cp_search`;
CREATE TABLE `cp_search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`searchid`),
  KEY `typeid` (`typeid`,`id`),
  KEY `siteid` (`siteid`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_search
-- ----------------------------
INSERT INTO `cp_search` VALUES ('1', '3', '1', '1528276835', '安卓二维码  ', '1');
INSERT INTO `cp_search` VALUES ('2', '3', '2', '1528276898', '苹果二维码  苹果', '1');
INSERT INTO `cp_search` VALUES ('3', '1', '1', '1528338377', '首页顶部滚动内容  首页 内容 彩票 滚动 顶部 服务 时时 赔率 最高 高级 业界 完善 欢迎 皇家 下载 提升 个人资料', '1');
INSERT INTO `cp_search` VALUES ('4', '53', '1', '1528341022', '首页楼内博图  首页', '1');
INSERT INTO `cp_search` VALUES ('5', '1', '2', '1528342048', '“倍投”出手！三人各擒百万奖  宋体 排列 万元 体彩 奖金 号码 先生 大奖 得主 江苏 时间 宿迁 一个 彩票 开奖 这次 中奖 苏州 一般 现身 投入 收获 中心 幸运 一等奖 争取 投票 凭借 不少 终于 比较 网点 众所周知 三个 如果 为什么 达到 以及 出自 开出 近日 解释 至于 就是 记录 有些 不过 高兴 总是 天才 心情 或者 感觉 笑容 十几 一次 最近 固定 因为 准确 只有 除了 自选 经历 来看 整理 选择 非常 原因 多万元 信任 我们 遗憾 采用 其中 单个 出手 涵盖 所有 几乎 虽然 一番 方式 使得 采用了 百万 超过 来到 这样 亿元 技能 委托 领取 受到 业主 喜爱 忠实 介绍 奖项 努力 透露 平常 多年 万余 最终 还要 以后 以上 反而 没想到 历史', '1');
INSERT INTO `cp_search` VALUES ('6', '54', '1', '1528706015', '推荐会员得佣金  会员 推荐 佣金 所有 注册 流水', '1');
INSERT INTO `cp_search` VALUES ('7', '54', '2', '1528708294', '银行存款充值有优惠  充值 优惠 银行卡 会员 享有 选择 所有 存款 银行', '1');
INSERT INTO `cp_search` VALUES ('8', '3', '3', '1528711040', '首页LOGO  首页', '1');
INSERT INTO `cp_search` VALUES ('9', '3', '4', '1528713750', '首页背景图  背景 首页', '1');
INSERT INTO `cp_search` VALUES ('10', '1', '3', '1528717800', '帮助中心  用户 彩票 自动 如何 安全 开通 中心 信息 充值 记录 本站 注册 密码 网站 成功 登录 账户 页面 中奖 网上 点击 支付 服务 方式 银行卡 银行 选择 使用 需要 首页 查看 查询 返还 数据 交易 系统 可以 进行 提供 右侧 资金 申请 金额 快捷 奖金 即可 进入 自己 现场 填写 提交 次数 及时 平台 限制 方便 左侧 购买 才能 设置 规定 正常 行为 时间 公开 合法 体彩 福彩 一切 哪些 为了 确认 详情 公司 的银行 根据 达到 帮助 所有 小时 大银行 用户注册 第三方 包括 网上支付 相关 多种 保障 收取 任何 会员 在线 怎么办 利益 成为 保证 多样化 以及 时时 独立 隔离 安装 大型 备份 做到 常见问题 资料 现象 联系 人员 上述 发生 错误 姓名 不符 一旦 网站首页 通知 防火墙 地域 开奖 人工 大奖 优势 便捷 轻松 全方位 达成 合作伙伴 关系 比如 多家 有效 发行的 工信部 备案 真实 百度 搜狐 事务 工作 永不 处理 投诉 搜狗 腾讯 正规 原则 业务 真实性 负责 自愿 约定 确保 绝对 对于 国家 禁止 授权 控制 严格 积极 响应 国家政策 级别 一致 通过 分钟 实时 发送 输入 电子邮箱 支持 全国所有 费用 忘记 相应 大小 一个 建议 是否 功能 然后 官方网站 网点 前往 修改 立即 顶部 拥有 条件 免费 办理 发现 异常 经过 一定 阅读 同意 针对 做出 如下 审核 格式 没有 到达 符合 营业 情况 大于 网络服务 保护 承担 有没有 全部 收费 设定 产生 注意 利用 信用卡 套现 协议 少数 防止 返回 事项 指定', '1');
INSERT INTO `cp_search` VALUES ('25', '1', '12', '1528982446', '正式试运行！  正式 阶段 运营 各位 朋友 步入 彩票 世界杯 大家 平台 狂欢 之际 皇家', '1');
INSERT INTO `cp_search` VALUES ('15', '53', '2', '1528946278', '底部认证图片  图片 认证 底部', '1');
INSERT INTO `cp_search` VALUES ('16', '1', '8', '1528947260', '底部友情提示  提示 彩票 友情 底部 皇家 周岁 谨慎 青少年 出售 风险', '1');
INSERT INTO `cp_search` VALUES ('17', '55', '1', '1528954411', '我来了  ', '1');
INSERT INTO `cp_search` VALUES ('18', '55', '2', '1528954424', '爱上彩票  彩票 爱上', '1');
INSERT INTO `cp_search` VALUES ('19', '55', '3', '1528954435', '快三之王  ', '1');
INSERT INTO `cp_search` VALUES ('20', '1', '9', '1528955286', '北京11选5  北京', '1');
INSERT INTO `cp_search` VALUES ('55', '1', '30', '1529052615', '体彩公益金护航竞技体育 助力全国体操赛  宋体 体彩 国家 计划 体育 体操 公益 球队 奥运 运动员 观众 体育彩票 比赛 羽毛 中心 赛事 支持 全国 总局 肇庆 现场 锦标赛 运动 国家队 他们 人力 不断 女子 师范大学 同时 加油 通道 活动 宣传 多年来 综合 内容 服务 素质 课程 改善了 我国 源于 对于 代言 本次 形象 成绩 国际 现在 羽毛球 近日 条件 地上 成长 帮助 提高 举行 训练 诠释 链接 日发布 主要 最好 放弃 精神 资金 来源 系统工程 滚动 根据 需要 该计划 比例 彩票 用于 添加 工具 提出 需求 丰富 单位 收到 发展 目前 这些 全力 编辑 职业发展 整体 实力 江苏 提升 提供 今年 启动 昆山 表达 国际奥委会 演讲 公共 职业 礼仪 比如 选手 参赛 入口 设置 队伍 共有 水平 最高 国内 开展 购买 不少 营销活动 最大 规模 日至 管理 协会 主办 年全国 新区 项目 承办 市政府 广东省 更是 人生 吸引 精彩 明星 球员 眼球 大使 参加 体育运动 器材 孩子 鼓励 参与 助学 余人 印象 深刻 电视机 留下 结束 众多 日晚 教练 场地 进行 之前 克服', '1');
INSERT INTO `cp_search` VALUES ('51', '3', '7', '1528987141', '手机购彩  手机', '1');
INSERT INTO `cp_search` VALUES ('52', '1', '27', '1529031091', '推荐注册有返利  推荐 佣金 详情 联系 注册会员 会员 流水 注册', '1');
INSERT INTO `cp_search` VALUES ('26', '55', '4', '1528982667', '擒百万  百万', '1');
INSERT INTO `cp_search` VALUES ('27', '55', '5', '1528982697', '天天开锣  天天', '1');
INSERT INTO `cp_search` VALUES ('28', '1', '13', '1528982822', '世界杯今日开锣 竞彩之旅即刻启程  世界杯 游戏 宋体 比赛 罗斯 竞猜 时间 期间 球迷 体育彩票 足球 进行 篮球 销售 公益 球队 国际 排名 全部 其中 销量 进球 亿元 安排 当日 开门红 一个 激情 对手 主场 筹集 作为 突破 莫斯科 实力 分别 未来 更是 国家队 连续 不胜 一定 加上 乐趣 出线 北京 为主 大幅 组成 胜负 赛事 最后 更加 体育 全场 根据 比分 陆续 彩票 之旅 更多 阿拉 同时 感受 参与 力争 可以 冠军 完美 以来 年度 体验 花样 独有 诞生 增长 结合 产品 先进 固定 趣味 率先 用于 职能 编辑 履行 奖金 带来 竞赛 各类 符合 吸引力 引入 当中 增加了 社会 越来越 全国 多家 网点 多种 方法 挑战 智慧 不仅 商业 设施 社区 增加 酒吧 带给 各地 终端 部分 包括 国家 多样 技术性 不论 特点 最大 体彩 临时 生活方式 舞台 还是 比拼 属于 自己 对象 找到 智力 爱好者 从中 享受 前景 终于 拉开 正式 视为 地利 战平 已经 最低 最新 公布 位居 赛场 虽然 大陆 但是 大力 碰撞 今日 中国的 同样 平台 搭建 广大 受到 来自 气息 以及 全程 取得 第三轮 日起 开始 这次 相信 方面 占据 优势 便利 接收 传统 保证 充足 初步 周末 延长 预计 足彩 月期 共有 含有 毕竟 公认 相对 低迷 状态 缺少 连战 近期 他们 新一 下降了 球星 多少 为此 设计 赛程 功夫 尴尬 未能 底线 避免 再现 不再', '1');
INSERT INTO `cp_search` VALUES ('29', '1', '14', '1528982982', '急寻：义乌双色球738万元大奖得主  大奖 双色球 义乌 彩票 得主 一等奖 特别 中奖 购买 进行 开奖 多元 奖金 游戏 出自 全国 日晚 福利彩票 喜爱 拿出 担心 如此 看着 越来越 自己 现身 大家 礼物 中心 福彩 杭州市 领取 发生 浙江省 期限 属于 是不是 然而 提醒 最后 万元 南路 令人', '1');
INSERT INTO `cp_search` VALUES ('30', '55', '6', '1528983445', '六合王  ', '1');
INSERT INTO `cp_search` VALUES ('31', '55', '7', '1528983494', '白小姐  小姐', '1');
INSERT INTO `cp_search` VALUES ('32', '55', '8', '1528983605', '彩神到  ', '1');
INSERT INTO `cp_search` VALUES ('33', '55', '9', '1528983657', '吃鸡  ', '1');
INSERT INTO `cp_search` VALUES ('34', '55', '10', '1528983707', '好彩头  ', '1');
INSERT INTO `cp_search` VALUES ('35', '55', '11', '1528983744', '同花顺  同花顺', '1');
INSERT INTO `cp_search` VALUES ('36', '55', '12', '1528983776', '招弟  ', '1');
INSERT INTO `cp_search` VALUES ('37', '55', '13', '1528983809', '大圣  ', '1');
INSERT INTO `cp_search` VALUES ('38', '1', '15', '1528983875', '辽宁盘锦彩民从垃圾中找回中奖彩票  盘锦 彩票 大奖 先生 福彩 垃圾 辽宁 万元 中奖 事件 最近 发生 重要 凭证 丢失 事情 终于 开奖 中午 业主 当天 服务员 这样 位于 分别 于是 马上 联系 告诉 立即 应该 购买的 金额 不见 奖金 自己 及时 仔细 觉得 所有 和服 服务 提醒 感谢 十分 一大 广大 发现 收集 找到 起来 保管 第二 不要 找回 各种 一点 下午 熟悉 虽然 小区 日中 不少 但是 收获 左右 振兴 晚上 看到 号码 兴奋 非常 时候 花卉 公司 随后', '1');
INSERT INTO `cp_search` VALUES ('39', '1', '16', '1528983920', '1058万元大奖得主：洗衣服前一定要翻裤兜  彩票 一等奖 福彩 万元 大奖 奖金 自己 山区 衣服 日晚 双色球 全国 出来 放在 准备 每次 一定 洗衣机 直到 湖北省 中心 来到 一举 开出 武汉市 可能 这样 一大 号码 母亲 不仅 价值 中奖 没想到 元钱 觉得 而且 投入 陆幽 体现 总结 真是 总是 日子 想起 分别 买套房 发生 如果 努力 意外 放松 以后 项目 大事 告诉 这件 来得 创业 时候 因为 就是 对于 使用 父母 生活 希望 影响 刚刚 进入 第一 年轻 不能 感谢 多万元 社会 时间 日中 终于 不见 收获 迟到 手机 发现 拿出 一边 有奖 好几 其中 一样 一家 的确 承认 一下子 不停 是否 看看 留在 工作 毕业 大学 得主 原因 现在 某公司 积累 比较 而是 及时 知道', '1');
INSERT INTO `cp_search` VALUES ('40', '1', '17', '1528983972', '这群江津孩子的六一礼物就是一场普通行走  孩子 特殊 中心 发展 儿童 老师 现场 表演 拥有 之一 同样 创始人 爱心 礼物 出发 六一 通过 有所不同 这些 众多 灿烂 笑容 生活 美好 他们 教育 快乐 康复 活动 进行 家庭 自己 完成 普通 各种 日子 收到 一个 祝福 行动 实际 发行 关爱 健康 帮助 慰问 宗旨 福彩 受到 为了 更多 来自 成长 温暖 社会 此次 上面 白色 身上 指引 方式 未来的 未来 营造 期望 就是 工作人员 情况 每个 压力 的努力 到达 参与 缤纷 巨大 先后 包括 规模 年来 智力 障碍 提供 不同 发育 比赛 患者 人士 当中 共同 扶持 当天 时代广场 自由行 特别 第十三届 家长 服务 同类 机构 技能 舞蹈 绘画 大多数 全部 缓解了 免费 一定 掌握 不仅 系统 长期 可以 知识 文化 学习 经济', '1');
INSERT INTO `cp_search` VALUES ('41', '1', '18', '1528984010', '广州福彩今年征召100家投注站  福彩 申请 广州市 中心 福利彩票 地址 提交 申请人 本次 经营 场所 材料 办理 受理 销售 广州 公示 审核 必须 不得 电脑 朋友 快乐 十分 投资 有效 情况 条件 广东省 资格 以上 面积 设立 进行 有意 公告 提醒 资金 年后 身份证 终端 活动 公开 不少 万元 只能 发布 全社会 批准 范围 周边 考察 环境 是否 距离 其它 实际 站点 符合 日前 可行性 获得 指定 区域 迁移 一个 个人 学历 具备 户口 规定 小于 以下 谨慎 周岁 的申请 日起 可以 同时 人员 综合 考虑 市场 一定 便利 因素 全市 自由 程度 发展 经济状况 人口 数量 介绍 地区 取消 真实 视为无效 分析 做好 一致 认真 做到 经营风险 评估 通过审核 根据 调研 充分 所有 要求 发现 确定 名单 平米 其他 风险 发行 关于 友情 如果 达到 专线 详情 咨询 公布 相关 上网 标准 查询 通知 一年内 中国电信 使用 临时 搭建 房屋 限制 适用 平方米 将按 同样 租赁 拆迁 彩票 纳入 专用 安装 淘汰 制度 作为 统一 管理 原则上 予以 经营管理 专职 明确 方式 参与 直接 现有 事业单位 专营 从事 需要 特别 注意 一次 使用权 所有权 业务 适应 满足 信用记录 商业 原则 据悉 持有 遵循 开放 截至 日期 哪些 具有 刑事 处罚 记录 不良 年内 高中 完全 民事 行为 能力 通过 同一 今年 流水 先后 优先 地图 只有 依据 申报 建筑 规格 每周 汇总 工作 日内 百度 所在 时间 前往 销售部 资料 上班 正常 如何 结束 即可 工作日 证书 本人 分析报告 以及 照片 详细 可用 银行 出具 证明', '1');
INSERT INTO `cp_search` VALUES ('42', '1', '19', '1528984122', '世界杯足彩来了，猜不猜，怎么猜，全看你的了！  世界杯 宋体 游戏 体彩 竞猜 对于 进行 比赛 可以 怎么 全部 阿根 嘉年华 北京 期间 来说 选择 淘汰 进球 比分 全场 销售 安排 接受 小组 一起 参与 喜爱 世界 由于 不论 还是 阶段 根据 地区 足彩 足球 人们 因此 眼球 活动 系列 主题 喜欢 需要 心脏 全国 考验 勇敢 日常 无疑 频频 江湖 行动 服务 举措 一条龙 交流 聚会 搭建 那时 心动 记住 狂欢 推出 计划 户外 可以通过 上演 精彩 不如 了解 方式 各地 比如 空间 球队 时间 共计 罗斯 赛事 过关 以及 球迷 正式 已经 中奖 体验 增加 显著 尤其 进入 开幕 事实上 乐趣 获胜 第一 一时 之后 揭晓 结束 广东 三个 强大 十分 阵容 联网 日起 将于 南美 胜利 提前 出线 第三轮 之外 开始 套餐 最高', '1');
INSERT INTO `cp_search` VALUES ('43', '1', '20', '1528984200', '砍下916万大奖 这一回露脸的不是单式票  万元 大奖 宋体 体彩 开奖 北京 中奖 出自 奖金 地区 一等奖 日晚 投入 北京市 号码 全部 方式 现身 销售 其中 高达 注意 全国 选择 广东 网点 中心 四川 彩票 亿元 经历 诞生 之后 先生 在内 不是 凭借 夫妇 这个 退休 采用 单独 源于 而是 多个 可能 中高 一旦 其它 有趣 并非 此种 最近 之前 最高 终于 落户 成都市 投票 此外 同一 统计 一个 其中包括 累计 截至 汕头 丰富 预期 再次 而且 不但 今年 也许 形成 之外 占据 因而 国家 迎来 之旅 对决 提供 数据 进行 具体 看出 不难 分别 话题 到底 最爱 共计 江湖 另外 基本 暂时 养生 时间 社会 得主 需要 筹集 通常 认为 不容 由于 含量 技术 回报 万余 三个 连续 这位 上看 内容 一举 期间 各个 奖项 可谓 公益 显示', '1');
INSERT INTO `cp_search` VALUES ('44', '1', '21', '1528984252', '京城彩站晒红单：北单9串1惊现1574倍回报  宋体 中奖 回报 出自 这是 排列 足球 体彩 位于 投入 选择 号楼 展示 栏目 本期 分别 编辑 方式 采用 智慧 投票 城区 组合 花费 附近', '1');
INSERT INTO `cp_search` VALUES ('45', '1', '22', '1528984306', '豪取1.25亿！三个大乐透大奖暗藏“关键词”  宋体 大奖 体彩 中奖 彩票 万元 先生 三个 介绍 号码 就是 北京市 关键词 投入 北京 老人 开奖 自己 发生 朋友 亿元 没有 奖金 一等奖 日晚 这个 期间 生活 现身 之后 一起 来到 中心 生意 这位 不到 随机 表示 公益 进行 非常 一直 自选 特别 吉利 出来 附近 一个 剧情 这样 高达 刚刚 结束 累计 金额 他们 出自 退休 夫妇 活动 多万元 幸运 时间 因为 激动 开业 参与 业主 真是 人和 为何 开始 相信 日子 希望 网点 遇到 下面 电脑 终于 在家 好几 反复 确认 知道 不再 一期 几乎 氛围 这家 十几 餐厅 上市 没想到 以前 左右 觉得 海报 经常 时候 正好 那天 天后 告别 从中 打算 在内 回家 显示 只有 意义 收入 压力 某种 共有 从此 同时 老婆 其中 最高 日上午 超市 凭借 公交 食品 公交车 来临 源自 平时 相同 准备 过程 来看 它们 值得 全部 看着 国家 得主 体育彩票 认真 成为 习惯 选择 中大 一般 算是 注入 来说 采用 的方式 购买 爱好 唯一 这种 比较 其实 为了 议论 看到 一定 以后 为什么 其他 想法 接着 现在 无所谓 高兴 已经 坚持 当然', '1');
INSERT INTO `cp_search` VALUES ('46', '1', '23', '1528984375', '头奖空开 7星彩奖池金额662万元  开奖 号码 宋体 本期 万元 金额 数字 显示 体育彩票 现在 出现 来看 过后 朋友 全国 活跃 近期 中奖 争取 收获 大奖 希望 销售额 关注 之后 成为 状态 此外 主要 集中 奖金 一等奖 中间 最大 最近 走强 优势 绝对 最小 数值 继续', '1');
INSERT INTO `cp_search` VALUES ('47', '1', '24', '1528984438', '6-15周五足球重点赛事推荐  比赛 周五 球队 宋体 时间 状态 世界杯 葡萄 近期 热身 核心 不胜 氛围 影响 良好 备战 球员 临时 因素 面对 难以 乐观 取得 赢得 重点 赛事 推荐 开门红 足球 防守 实力 强劲 保持 政治', '1');
INSERT INTO `cp_search` VALUES ('48', '1', '25', '1528984516', '奖池升至58.74亿 体彩大乐透开2注1000万  宋体 开出 万元 奖金 号码 体彩 本期 其中 采用 方面 分布 数量 范围 开奖 世界杯 亿元 全国 同时 投入 刷新 再次 历史 最高 纪录 继续上涨 期间 数据 结束 周六 届时 狂欢 累计 统计 大奖 包括 十足 赛事 足球 开启 已经 提醒 观看 精彩 显示 遗憾 中奖 单个 每人 幸运 由于 从而 无缘 升至 一等奖 大小 最近 组合 最大 最小 各个 复制 全部 两位', '1');
INSERT INTO `cp_search` VALUES ('49', '1', '26', '1528984621', '彩市新语：竞彩游戏即将接过世界杯第三棒  宋体 世界杯 游戏 期间 彩虹 销量 第三 足球 第一 体育彩票 预测 高达 发生 第二 彩票 竞猜 一道 如果 年开始 目的 成为 天空 即将 对于 预言 去世 成功率 国奥 不到 要说 不得不 能够 来说 动物 生于 火爆 编辑 传奇 何种 恐怕 罗斯 表现 特别 登场 未来 怎样 演绎 及其 一个 准确 推出 不能 忘记 变化 巨大 数字 几乎 年前 奇迹 当年 创造 媒体 这个 个人 那么 当作 世界 上市 相当于 大约 自己 固定 经典 高潮迭起 玩家 正在 整体 突破 因此 升至 流转 代表 国际 认为 舆论 深度 接轨 历经 今天 年后 至今', '1');
INSERT INTO `cp_search` VALUES ('50', '54', '3', '1528985603', '签到送彩金  会员 相应 每天 所有', '1');
INSERT INTO `cp_search` VALUES ('53', '1', '28', '1529031193', '注册送好礼  注册 联系 人员 详情 了解 今日起 成为 会员', '1');
INSERT INTO `cp_search` VALUES ('54', '1', '29', '1529031266', '签到得礼金  咨询 人员 详情 相应 每天 得到 注册会员', '1');

-- ----------------------------
-- Table structure for `cp_search_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `cp_search_keyword`;
CREATE TABLE `cp_search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_search_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_session`
-- ----------------------------
DROP TABLE IF EXISTS `cp_session`;
CREATE TABLE `cp_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_session
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_site`
-- ----------------------------
DROP TABLE IF EXISTS `cp_site`;
CREATE TABLE `cp_site` (
  `siteid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '',
  `dirname` char(255) DEFAULT '',
  `domain` char(255) DEFAULT '',
  `site_title` char(255) DEFAULT '',
  `keywords` char(255) DEFAULT '',
  `description` char(255) DEFAULT '',
  `release_point` text,
  `default_style` char(50) DEFAULT NULL,
  `template` text,
  `setting` mediumtext,
  `uuid` char(40) DEFAULT '',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_site
-- ----------------------------
INSERT INTO `cp_site` VALUES ('1', '皇家娱乐', '', '/', '', '', '', '', 'cp', 'cp', '{\"upload_maxsize\":\"20480\",\"upload_allowext\":\"jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\",\"watermark_enable\":\"0\",\"watermark_minwidth\":\"300\",\"watermark_minheight\":\"300\",\"watermark_img\":\"statics\\/images\\/water\\/\\/mark.png\",\"watermark_pct\":\"85\",\"watermark_quality\":\"80\",\"watermark_pos\":\"9\"}', 'c5ac8b3f-695d-11e8-b5ae-deb0d92f5d47');

-- ----------------------------
-- Table structure for `cp_special`
-- ----------------------------
DROP TABLE IF EXISTS `cp_special`;
CREATE TABLE `cp_special` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL,
  `typeids` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `banner` char(100) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispage` tinyint(1) unsigned NOT NULL,
  `filename` char(40) NOT NULL,
  `pics` char(100) NOT NULL,
  `voteid` char(60) NOT NULL,
  `style` char(20) NOT NULL,
  `index_template` char(40) NOT NULL,
  `list_template` char(40) NOT NULL,
  `show_template` char(60) NOT NULL,
  `css` text NOT NULL,
  `username` char(40) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL,
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isvideo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_special
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_special_content`
-- ----------------------------
DROP TABLE IF EXISTS `cp_special_content`;
CREATE TABLE `cp_special_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `specialid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `style` char(24) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `curl` char(15) NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `searchid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `specialid` (`specialid`,`typeid`,`isdata`),
  KEY `typeid` (`typeid`,`isdata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_special_content
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_special_c_data`
-- ----------------------------
DROP TABLE IF EXISTS `cp_special_c_data`;
CREATE TABLE `cp_special_c_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `paginationtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `show_template` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_special_c_data
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_sphinx_counter`
-- ----------------------------
DROP TABLE IF EXISTS `cp_sphinx_counter`;
CREATE TABLE `cp_sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`counter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_sphinx_counter
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_sso_admin`
-- ----------------------------
DROP TABLE IF EXISTS `cp_sso_admin`;
CREATE TABLE `cp_sso_admin` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) DEFAULT NULL,
  `issuper` tinyint(1) DEFAULT '0',
  `lastlogin` int(10) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_sso_admin
-- ----------------------------
INSERT INTO `cp_sso_admin` VALUES ('1', 'any', '3595f6bef1c2a35ee2eb7be067364c5d', 'ldexHz', '1', '0', '');

-- ----------------------------
-- Table structure for `cp_sso_applications`
-- ----------------------------
DROP TABLE IF EXISTS `cp_sso_applications`;
CREATE TABLE `cp_sso_applications` (
  `appid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(16) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL DEFAULT '',
  `url` char(255) NOT NULL DEFAULT '',
  `authkey` char(255) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `apifilename` char(30) NOT NULL DEFAULT 'phpsso.php',
  `charset` char(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`appid`),
  KEY `synlogin` (`synlogin`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_sso_applications
-- ----------------------------
INSERT INTO `cp_sso_applications` VALUES ('1', 'phpcms_v9', 'phpcms v9', 'http://cp.com/', 'yCpwKgckYIyLHClQ8yUzgfMMHkbq9Gzg', '', 'api.php?op=phpsso', 'utf-8', '1');

-- ----------------------------
-- Table structure for `cp_sso_members`
-- ----------------------------
DROP TABLE IF EXISTS `cp_sso_members`;
CREATE TABLE `cp_sso_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `random` char(8) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` char(15) NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `appname` char(15) NOT NULL,
  `type` enum('app','connect') DEFAULT NULL,
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  `ucuserid` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `ucuserid` (`ucuserid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_sso_members
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_sso_messagequeue`
-- ----------------------------
DROP TABLE IF EXISTS `cp_sso_messagequeue`;
CREATE TABLE `cp_sso_messagequeue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation` char(32) NOT NULL,
  `succeed` tinyint(1) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `noticedata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `appstatus` mediumtext,
  PRIMARY KEY (`id`),
  KEY `dateline` (`dateline`),
  KEY `succeed` (`succeed`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_sso_messagequeue
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_sso_session`
-- ----------------------------
DROP TABLE IF EXISTS `cp_sso_session`;
CREATE TABLE `cp_sso_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_sso_session
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_sso_settings`
-- ----------------------------
DROP TABLE IF EXISTS `cp_sso_settings`;
CREATE TABLE `cp_sso_settings` (
  `name` varchar(32) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_sso_settings
-- ----------------------------
INSERT INTO `cp_sso_settings` VALUES ('denyemail', '');
INSERT INTO `cp_sso_settings` VALUES ('denyusername', '');
INSERT INTO `cp_sso_settings` VALUES ('creditrate', '');
INSERT INTO `cp_sso_settings` VALUES ('sp4', '');
INSERT INTO `cp_sso_settings` VALUES ('ucenter', '');

-- ----------------------------
-- Table structure for `cp_template_bak`
-- ----------------------------
DROP TABLE IF EXISTS `cp_template_bak`;
CREATE TABLE `cp_template_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned DEFAULT '0',
  `fileid` char(50) DEFAULT NULL,
  `userid` mediumint(8) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `fileid` (`fileid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_template_bak
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_times`
-- ----------------------------
DROP TABLE IF EXISTS `cp_times`;
CREATE TABLE `cp_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`isadmin`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_times
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_type`
-- ----------------------------
DROP TABLE IF EXISTS `cp_type`;
CREATE TABLE `cp_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typedir` char(20) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(30) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`),
  KEY `module` (`module`,`parentid`,`siteid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_type
-- ----------------------------
INSERT INTO `cp_type` VALUES ('52', '1', 'search', '0', '专题', '0', 'special', '', '', '4', '专题');
INSERT INTO `cp_type` VALUES ('1', '1', 'search', '1', '新闻', '0', '', '', '', '1', '新闻模型搜索');
INSERT INTO `cp_type` VALUES ('2', '1', 'search', '2', '下载', '0', '', '', '', '3', '下载模型搜索');
INSERT INTO `cp_type` VALUES ('3', '1', 'search', '3', '图片', '0', '', '', '', '2', '图片模型搜索');
INSERT INTO `cp_type` VALUES ('53', '1', 'search', '12', '轮播图', '0', '', '', '', '0', '');
INSERT INTO `cp_type` VALUES ('54', '1', 'search', '13', '活动专区', '0', '', '', '', '0', '');
INSERT INTO `cp_type` VALUES ('55', '1', 'search', '14', '中奖', '0', '', '', '', '0', '');

-- ----------------------------
-- Table structure for `cp_urlrule`
-- ----------------------------
DROP TABLE IF EXISTS `cp_urlrule`;
CREATE TABLE `cp_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_urlrule
-- ----------------------------
INSERT INTO `cp_urlrule` VALUES ('1', 'content', 'category', '1', '{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html', 'news/china/1000.html');
INSERT INTO `cp_urlrule` VALUES ('6', 'content', 'category', '0', 'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}', 'index.php?m=content&c=index&a=lists&catid=1&page=1');
INSERT INTO `cp_urlrule` VALUES ('11', 'content', 'show', '1', '{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html', '2010/catdir_0720/1_2.html');
INSERT INTO `cp_urlrule` VALUES ('12', 'content', 'show', '1', '{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html', 'it/product/2010/0720/1_2.html');
INSERT INTO `cp_urlrule` VALUES ('16', 'content', 'show', '0', 'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}', 'index.php?m=content&c=index&a=show&catid=1&id=1');
INSERT INTO `cp_urlrule` VALUES ('17', 'content', 'show', '0', 'show-{$catid}-{$id}-{$page}.html', 'show-1-2-1.html');
INSERT INTO `cp_urlrule` VALUES ('18', 'content', 'show', '0', 'content-{$catid}-{$id}-{$page}.html', 'content-1-2-1.html');
INSERT INTO `cp_urlrule` VALUES ('30', 'content', 'category', '0', 'list-{$catid}-{$page}.html', 'list-1-1.html');

-- ----------------------------
-- Table structure for `cp_video`
-- ----------------------------
DROP TABLE IF EXISTS `cp_video`;
CREATE TABLE `cp_video` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `vision` varchar(255) NOT NULL DEFAULT '',
  `video_category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_video
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_video_content`
-- ----------------------------
DROP TABLE IF EXISTS `cp_video_content`;
CREATE TABLE `cp_video_content` (
  `contentid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `videoid` (`videoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_video_content
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_video_data`
-- ----------------------------
DROP TABLE IF EXISTS `cp_video_data`;
CREATE TABLE `cp_video_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `video` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_video_data
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_video_store`
-- ----------------------------
DROP TABLE IF EXISTS `cp_video_store`;
CREATE TABLE `cp_video_store` (
  `videoid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(60) NOT NULL,
  `vid` char(40) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `picpath` char(120) NOT NULL,
  `size` char(20) NOT NULL,
  `timelen` mediumint(9) NOT NULL DEFAULT '0',
  `userupload` tinyint(1) NOT NULL DEFAULT '0',
  `channelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`videoid`),
  KEY `videoid` (`videoid`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_video_store
-- ----------------------------

-- ----------------------------
-- Table structure for `cp_workflow`
-- ----------------------------
DROP TABLE IF EXISTS `cp_workflow`;
CREATE TABLE `cp_workflow` (
  `workflowid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `steps` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflowid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_workflow
-- ----------------------------
INSERT INTO `cp_workflow` VALUES ('1', '1', '1', '一级审核', '审核一次', '', '0');
INSERT INTO `cp_workflow` VALUES ('2', '1', '2', '二级审核', '审核两次', '', '0');
INSERT INTO `cp_workflow` VALUES ('3', '1', '3', '三级审核', '审核三次', '', '0');
INSERT INTO `cp_workflow` VALUES ('4', '1', '4', '四级审核', '四级审核', '', '0');
