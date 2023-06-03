/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : love_pet_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2018-03-16 11:59:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword` (
  `leaveWordId` int(11) NOT NULL auto_increment COMMENT '留言id',
  `leaveTitle` varchar(80) NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000) NOT NULL COMMENT '留言内容',
  `userObj` varchar(30) NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20) default NULL COMMENT '留言时间',
  `replyContent` varchar(1000) default NULL COMMENT '管理回复',
  `replyTime` varchar(20) default NULL COMMENT '回复时间',
  PRIMARY KEY  (`leaveWordId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES ('1', '太好了，买宠物无忧了', '有了这个平台，以后可以淘到好的宠物了', 'user1', '2018-03-14 23:50:45', '很好！', '2018-03-16 11:57:59');
INSERT INTO `t_leaveword` VALUES ('2', '111', '222', 'user1', '2018-03-14 05:16:45', 'test', '2018-03-16 11:58:05');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '爱宠物交易平台开通了', '<h2>同学们以后来这里交易宠物信息吧！</h2>', '2018-03-14 23:38:35');

-- ----------------------------
-- Table structure for `t_productclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_productclass`;
CREATE TABLE `t_productclass` (
  `productClassId` int(11) NOT NULL auto_increment COMMENT '类别编号',
  `productClassName` varchar(20) NOT NULL COMMENT '类别名称',
  PRIMARY KEY  (`productClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_productclass
-- ----------------------------
INSERT INTO `t_productclass` VALUES ('1', '宠物狗');
INSERT INTO `t_productclass` VALUES ('2', '宠物猫');
INSERT INTO `t_productclass` VALUES ('3', '乌龟');
INSERT INTO `t_productclass` VALUES ('4', '仓鼠');
INSERT INTO `t_productclass` VALUES ('5', '宠物鱼');

-- ----------------------------
-- Table structure for `t_productorder`
-- ----------------------------
DROP TABLE IF EXISTS `t_productorder`;
CREATE TABLE `t_productorder` (
  `orderId` int(11) NOT NULL auto_increment COMMENT '订单id',
  `productSellObj` int(11) NOT NULL COMMENT '图书信息',
  `userObj` varchar(30) NOT NULL COMMENT '意向用户',
  `price` float NOT NULL COMMENT '意向出价',
  `orderMemo` varchar(500) default NULL COMMENT '用户备注',
  `addTime` varchar(20) default NULL COMMENT '下单时间',
  PRIMARY KEY  (`orderId`),
  KEY `productSellObj` (`productSellObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_productorder_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`),
  CONSTRAINT `t_productorder_ibfk_1` FOREIGN KEY (`productSellObj`) REFERENCES `t_productsell` (`sellId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_productorder
-- ----------------------------
INSERT INTO `t_productorder` VALUES ('1', '1', 'user1', '80', '我需要这个，给我吧！', '2018-03-14 14:15:16');
INSERT INTO `t_productorder` VALUES ('3', '1', 'user2', '75', '我也喜欢这种狗啊，给我吧，马上交易', '2018-03-14 06:20:48');

-- ----------------------------
-- Table structure for `t_productseek`
-- ----------------------------
DROP TABLE IF EXISTS `t_productseek`;
CREATE TABLE `t_productseek` (
  `seekId` int(11) NOT NULL auto_increment COMMENT '求购id',
  `productPhoto` varchar(60) NOT NULL COMMENT '图书主图',
  `productName` varchar(20) NOT NULL COMMENT '图书名称',
  `productClassObj` int(11) NOT NULL COMMENT '图书类别',
  `publish` varchar(50) NOT NULL COMMENT '出版社',
  `author` varchar(20) NOT NULL COMMENT '作者',
  `price` float NOT NULL COMMENT '求购价格',
  `xjcd` varchar(20) NOT NULL COMMENT '新旧程度',
  `seekDesc` varchar(5000) NOT NULL COMMENT '求购说明',
  `userObj` varchar(30) NOT NULL COMMENT '发布用户',
  `addTime` varchar(20) default NULL COMMENT '用户发布时间',
  PRIMARY KEY  (`seekId`),
  KEY `productClassObj` (`productClassObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_productseek_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`),
  CONSTRAINT `t_productseek_ibfk_1` FOREIGN KEY (`productClassObj`) REFERENCES `t_productclass` (`productClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_productseek
-- ----------------------------
INSERT INTO `t_productseek` VALUES ('1', 'upload/d12f2767-537f-4d17-8791-e68949f771d0.jpg', '纯种宠物猫咪加菲布偶猫1', '2', '四川成都', '蓝白猫', '100', '2岁内', '<p>我想养一只猫咪!我想养一只猫咪!</p><p>我想养一只猫咪!我想养一只猫咪!</p><p>我想养一只猫咪!我想养一只猫咪!</p><p>我想养一只猫咪!我想养一只猫咪!</p><p>我想养一只猫咪!我想养一只猫咪!</p><p>我想养一只猫咪!我想养一只猫咪!</p>', 'user1', '2018-03-14 23:43:11');
INSERT INTO `t_productseek` VALUES ('2', 'upload/d12f2767-537f-4d17-8791-e68949f771d0.jpg', '纯种宠物猫咪加菲布偶猫2', '2', '四川成都', '蓝白猫', '100', '2岁内', '<p>我想养一只猫咪!我想养一只猫咪!</p><p>我想养一只猫咪!我想养一只猫咪!</p><p>我想养一只猫咪!我想养一只猫咪!</p><p>我想养一只猫咪!我想养一只猫咪!</p><p>我想养一只猫咪!我想养一只猫咪!</p><p>我想养一只猫咪!我想养一只猫咪!</p>', 'user1', '2018-03-14 04:12:11');

-- ----------------------------
-- Table structure for `t_productsell`
-- ----------------------------
DROP TABLE IF EXISTS `t_productsell`;
CREATE TABLE `t_productsell` (
  `sellId` int(11) NOT NULL auto_increment COMMENT '出售id',
  `productPhoto` varchar(60) NOT NULL COMMENT '图书主图',
  `productName` varchar(20) NOT NULL COMMENT '图书名称',
  `productClassObj` int(11) NOT NULL COMMENT '图书类别',
  `publish` varchar(20) NOT NULL COMMENT '出版社',
  `author` varchar(20) NOT NULL COMMENT '作者',
  `sellPrice` float NOT NULL COMMENT '出售价格',
  `xjcd` varchar(20) NOT NULL COMMENT '新旧程度',
  `sellDesc` varchar(5000) NOT NULL COMMENT '出售说明',
  `userObj` varchar(30) NOT NULL COMMENT '发布用户',
  `addTime` varchar(20) default NULL COMMENT '用户发布时间',
  PRIMARY KEY  (`sellId`),
  KEY `productClassObj` (`productClassObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_productsell_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`),
  CONSTRAINT `t_productsell_ibfk_1` FOREIGN KEY (`productClassObj`) REFERENCES `t_productclass` (`productClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_productsell
-- ----------------------------
INSERT INTO `t_productsell` VALUES ('1', 'upload/0d8328b8-6f18-4ba3-a258-7391c8b2239d.jpg', '出售纯种泰迪幼犬1', '1', '四川达州', '达达宠物公司', '86', '1岁', '<h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">需要的联系我：</h3><h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></h3><h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">出售纯种泰迪幼犬</h3><h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">出售纯种泰迪幼犬</h3><p><br/></p><h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">出售纯种泰迪幼犬</h3><h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">出售纯种泰迪幼犬</h3><p><br/></p><h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">出售纯种泰迪幼犬</h3><p><br/></p><h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">出售纯种泰迪幼犬</h3><p><br/></p>', 'user1', '2018-03-14 23:48:11');
INSERT INTO `t_productsell` VALUES ('2', 'upload/0d8328b8-6f18-4ba3-a258-7391c8b2239d.jpg', '出售纯种泰迪幼犬2', '1', '四川成都', '达达宠物公司', '44', '1岁', '<h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">需要的联系我：</h3><h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></h3><h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">出售纯种泰迪幼犬</h3><h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">出售纯种泰迪幼犬</h3><p><br/></p><h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">出售纯种泰迪幼犬</h3><h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">出售纯种泰迪幼犬</h3><p><br/></p><h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">出售纯种泰迪幼犬</h3><p><br/></p><h3 class=\"tb-main-title\" style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; line-height: 21px; color: rgb(60, 60, 60); font-family: tahoma, arial, &quot;Hiragino Sans GB&quot;, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">出售纯种泰迪幼犬</h3><p><br/></p>', 'user1', '2018-03-14 04:27:019');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(100) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '$2a$10$FxAcoHcbrexH6Lq61O3jAe41LhgGw7QF2jiemXmc451vRxngfQd7m', '双鱼林', '男', '2018-03-14', 'upload/fc4c7dc8-c2d5-4527-8ba7-bb83e2c090e4.jpg', '13589834234', 'syl@163.com', '四川成都红星路', '2018-03-14 23:39:38');
INSERT INTO `t_userinfo` VALUES ('user2', '$2a$10$Q3p5vhW0vZO3ihn8bFJThOnb6hiTaT32f8b/9RYP6MhH2HdSDizEy', '李倩', '女', '2017-12-14', 'upload/NoImage.jpg', '13573598343', 'liqian@163.com', '四川成都广元市', '2018-03-14 05:26:17');
