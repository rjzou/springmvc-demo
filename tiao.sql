/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50541
Source Host           : localhost:8889
Source Database       : tiao

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2015-08-07 17:26:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_checkin
-- ----------------------------
DROP TABLE IF EXISTS `t_checkin`;
CREATE TABLE `t_checkin` (
  `houseid` int(8) NOT NULL,
  `roomno` int(8) NOT NULL,
  `customname` varchar(32) NOT NULL,
  `iphone` varchar(16) NOT NULL,
  `cardid` varchar(32) NOT NULL,
  `monthmoney` int(8) DEFAULT '0',
  `pressmoney` int(8) DEFAULT '0',
  `water` int(8) DEFAULT '0',
  `elect` int(8) DEFAULT '0',
  `internet` int(8) DEFAULT '0',
  `ip` varchar(16) DEFAULT NULL,
  `trash` int(8) DEFAULT '0',
  `keycount` int(8) DEFAULT NULL,
  `keyprice` int(8) DEFAULT NULL,
  `year` int(8) DEFAULT NULL,
  `month` int(8) DEFAULT NULL,
  `day` int(8) DEFAULT NULL,
  `created` bigint(32) NOT NULL,
  `updated` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`roomno`,`houseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_checkin
-- ----------------------------
INSERT INTO `t_checkin` VALUES ('2', '100', '张三', '17722677569', '362203198611176818', '100', '50', '120', '236', '40', '', '10', '2', '10', null, null, null, '1438829145409', null);
INSERT INTO `t_checkin` VALUES ('2', '102', '李四', '17722677569', '362203198611176819', '200', '100', '10', '20', '40', '', '10', '2', '10', null, null, null, '1438829342888', null);
INSERT INTO `t_checkin` VALUES ('2', '103', '王五', '17722677564', '362203198611176811', '220', '200', '215', '630', '40', '', '10', '2', '10', null, null, null, '1438830240154', null);
INSERT INTO `t_checkin` VALUES ('2', '104', '马伟', '17722677559', '362203198611176801', '180', '120', '20', '17', '40', '', '10', '2', '10', '0', '0', '0', '1438830589700', '0');
INSERT INTO `t_checkin` VALUES ('2', '131', '马文', '17722677501', '362203198611176812', '201', '150', '23001', '55639', '40', '', '10', '2', '10', '2015', '7', '6', '1438843096827', '1438843695538');

-- ----------------------------
-- Table structure for t_checkout
-- ----------------------------
DROP TABLE IF EXISTS `t_checkout`;
CREATE TABLE `t_checkout` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `houseid` int(8) NOT NULL,
  `roomno` int(8) NOT NULL,
  `username` varchar(32) NOT NULL,
  `iphone` varchar(16) NOT NULL,
  `userid` varchar(32) NOT NULL,
  `monthmoney` int(8) DEFAULT '0',
  `pressmoney` int(8) DEFAULT '0',
  `water` int(8) DEFAULT '0',
  `elect` int(8) DEFAULT '0',
  `internet` int(8) DEFAULT '0',
  `ip` varchar(16) DEFAULT NULL,
  `trash` int(8) DEFAULT '0',
  `paymoney` int(8) NOT NULL,
  `keycount` int(8) DEFAULT NULL,
  `keyprice` int(8) DEFAULT NULL,
  `year` int(8) NOT NULL,
  `month` int(8) NOT NULL,
  `day` int(8) NOT NULL,
  `created` bigint(32) NOT NULL,
  `updated` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_checkout
-- ----------------------------
INSERT INTO `t_checkout` VALUES ('1', '2', '100', '邹瑞金', '17722677560', '362203198611176811', '200', '100', '1024', '563', '40', '192.168.10.130', '10', '0', null, null, '0', '0', '0', '1438678546956', null);
INSERT INTO `t_checkout` VALUES ('2', '2', '102', '邹瑞金2', '17722677561', '362203198611176812', '220', '100', '123', '101', '40', '192.168.10.131', '10', '0', null, null, '0', '0', '0', '1438679785978', null);
INSERT INTO `t_checkout` VALUES ('3', '2', '103', '邹瑞金3', '17722677562', '362203198611176813', '300', '200', '10', '50', '40', '192.168.10.132', '10', '0', null, null, '0', '0', '0', '1438680745097', null);
INSERT INTO `t_checkout` VALUES ('4', '2', '100', '邹瑞金', '17722677560', '362203198611176811', '200', '100', '1024', '563', '40', 'null', '10', '-323', '2', '10', '2015', '7', '5', '1438768069009', null);
INSERT INTO `t_checkout` VALUES ('5', '2', '102', 'null', '17722677561', 'null', '220', '100', '123', '101', '40', 'null', '10', '-15', '2', '10', '2015', '7', '6', '1438825621336', null);
INSERT INTO `t_checkout` VALUES ('6', '2', '103', 'null', '17722677562', 'null', '300', '200', '10', '50', '40', 'null', '10', '94', '2', '10', '2015', '7', '6', '1438826749122', null);

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `housename` varchar(32) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  `created` bigint(32) NOT NULL,
  `updated` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES ('2', '1栋', '', '0', '1438669854854');
INSERT INTO `t_house` VALUES ('3', '2栋', '', '0', '1438669863920');
INSERT INTO `t_house` VALUES ('4', '3栋', '', '0', '1438669870767');
INSERT INTO `t_house` VALUES ('5', '5栋', 'a', '1438659314656', '1438669878771');

-- ----------------------------
-- Table structure for t_net_cfg
-- ----------------------------
DROP TABLE IF EXISTS `t_net_cfg`;
CREATE TABLE `t_net_cfg` (
  `houseid` int(8) NOT NULL,
  `roomno` int(8) NOT NULL,
  `ip` varchar(16) DEFAULT NULL,
  `usr` varchar(16) DEFAULT NULL,
  `pwd` varchar(16) DEFAULT NULL,
  `netprice` int(8) NOT NULL,
  `year` int(8) NOT NULL,
  `month` int(8) NOT NULL,
  `day` int(8) NOT NULL,
  `created` bigint(32) NOT NULL,
  `updated` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`houseid`,`roomno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_net_cfg
-- ----------------------------
INSERT INTO `t_net_cfg` VALUES ('2', '100', null, '', '', '40', '2015', '8', '7', '1438931028001', null);
INSERT INTO `t_net_cfg` VALUES ('2', '102', null, 'usr2', 'pwd2', '40', '2015', '8', '7', '1438931130382', null);

-- ----------------------------
-- Table structure for t_room
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room` (
  `houseid` int(8) NOT NULL,
  `roomno` int(8) NOT NULL,
  `monthmoney` int(8) NOT NULL,
  `pressmoney` int(8) NOT NULL,
  `typecode` varchar(32) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created` bigint(32) NOT NULL,
  `updated` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`houseid`,`roomno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room
-- ----------------------------
INSERT INTO `t_room` VALUES ('2', '100', '90', '50', 'danjian', '', '1438669454344', '1438669570536');
INSERT INTO `t_room` VALUES ('2', '102', '200', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '103', '220', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '104', '180', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '131', '201', '0', 'danjian', 'abcde', '1438656389780', '1438669579794');
INSERT INTO `t_room` VALUES ('2', '201', '200', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '202', '200', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '203', '230', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '204', '240', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '205', '200', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '206', '200', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '301', '300', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '302', '300', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '303', '300', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '304', '300', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '305', '300', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '306', '310', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '307', '320', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '308', '310', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '309', '300', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '401', '310', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '402', '320', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '403', '330', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '404', '300', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('2', '907', '210', '0', 'danjian', null, '1438591469784', null);
INSERT INTO `t_room` VALUES ('2', '908', '200', '0', 'danjian', null, '1438591324338', null);
INSERT INTO `t_room` VALUES ('2', '909', '200', '0', 'danjian', null, '1438591164091', null);
INSERT INTO `t_room` VALUES ('3', '101', '200', '100', 'danjian', null, '1438670675014', null);
INSERT INTO `t_room` VALUES ('4', '101', '100', '100', 'liangfangyiting', '', '1438739872793', null);
INSERT INTO `t_room` VALUES ('4', '102', '300', '200', 'yifangyiting', '', '1438739982295', null);
INSERT INTO `t_room` VALUES ('4', '201', '300', '100', 'danjian', '', '1438740386808', null);

-- ----------------------------
-- Table structure for t_room_type
-- ----------------------------
DROP TABLE IF EXISTS `t_room_type`;
CREATE TABLE `t_room_type` (
  `typecode` varchar(32) NOT NULL,
  `typename` varchar(32) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  `created` bigint(32) NOT NULL,
  `updated` bigint(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room_type
-- ----------------------------
INSERT INTO `t_room_type` VALUES ('danjian', '单间', null, '0', null);
INSERT INTO `t_room_type` VALUES ('yifangyiting', '一房一厅', null, '0', null);
INSERT INTO `t_room_type` VALUES ('liangfangyiting', '两房一厅', null, '0', null);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `email` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('zourinet@gmail.com', '123456');

-- ----------------------------
-- Table structure for t_waterelect
-- ----------------------------
DROP TABLE IF EXISTS `t_waterelect`;
CREATE TABLE `t_waterelect` (
  `houseid` int(8) NOT NULL,
  `roomno` int(8) NOT NULL,
  `water` int(8) NOT NULL,
  `waterprice` decimal(8,2) NOT NULL,
  `elect` int(8) NOT NULL,
  `electprice` decimal(8,2) NOT NULL,
  `year` int(8) NOT NULL,
  `month` int(8) NOT NULL,
  `day` int(8) NOT NULL,
  `created` bigint(32) NOT NULL,
  `updated` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`houseid`,`roomno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_waterelect
-- ----------------------------
INSERT INTO `t_waterelect` VALUES ('2', '100', '1109', '4.50', '610', '1.50', '2015', '7', '5', '1438757277392', '2');
INSERT INTO `t_waterelect` VALUES ('2', '102', '130', '4.50', '110', '1.50', '2015', '7', '6', '1438822812308', null);
INSERT INTO `t_waterelect` VALUES ('2', '103', '13', '4.50', '65', '1.50', '2015', '7', '6', '1438826400066', null);
INSERT INTO `t_waterelect` VALUES ('2', '104', '25', '4.50', '27', '1.50', '2015', '8', '7', '1438914952810', null);

-- ----------------------------
-- Table structure for t_waterelectout
-- ----------------------------
DROP TABLE IF EXISTS `t_waterelectout`;
CREATE TABLE `t_waterelectout` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `houseid` int(8) NOT NULL,
  `roomno` int(8) NOT NULL,
  `water` int(8) DEFAULT NULL,
  `waterprice` decimal(8,2) NOT NULL,
  `elect` int(8) NOT NULL,
  `electprice` decimal(8,2) NOT NULL,
  `year` int(8) DEFAULT NULL,
  `month` int(8) DEFAULT NULL,
  `day` int(8) DEFAULT NULL,
  `created` bigint(32) NOT NULL,
  `updated` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_waterelectout
-- ----------------------------

-- ----------------------------
-- Table structure for t_waterelect_cfg
-- ----------------------------
DROP TABLE IF EXISTS `t_waterelect_cfg`;
CREATE TABLE `t_waterelect_cfg` (
  `year` int(8) NOT NULL,
  `month` int(8) NOT NULL,
  `waterprice` decimal(8,2) NOT NULL,
  `electprice` decimal(8,2) DEFAULT NULL,
  `created` bigint(32) NOT NULL,
  `updated` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`year`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_waterelect_cfg
-- ----------------------------
INSERT INTO `t_waterelect_cfg` VALUES ('2014', '12', '4.50', '1.50', '0', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2015', '1', '4.50', '1.60', '1438910815936', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2015', '2', '4.50', '1.50', '1438910815936', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2015', '3', '4.50', '1.50', '1438910815936', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2015', '4', '4.50', '1.50', '1438910815936', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2015', '5', '4.50', '1.50', '1438910815936', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2015', '6', '4.50', '1.50', '1438910815936', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2015', '7', '4.50', '1.50', '1438910815936', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2015', '8', '4.50', '1.50', '1438910815936', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2015', '9', '4.50', '1.50', '1438910815936', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2015', '10', '4.50', '1.50', '1438910815936', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2015', '11', '4.50', '1.50', '1438910815936', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2015', '12', '4.50', '1.50', '1438910815936', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2016', '1', '4.50', '1.50', '1438910833006', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2016', '2', '4.50', '1.50', '1438910833006', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2016', '3', '4.50', '1.50', '1438910833006', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2016', '4', '4.50', '1.50', '1438910833006', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2016', '5', '4.50', '1.50', '1438910833006', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2016', '6', '4.50', '1.50', '1438910833006', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2016', '7', '4.50', '1.50', '1438910833006', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2016', '8', '4.50', '1.50', '1438910833006', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2016', '9', '4.50', '1.50', '1438910833006', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2016', '10', '4.50', '1.50', '1438910833006', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2016', '11', '4.50', '1.50', '1438910833006', '0');
INSERT INTO `t_waterelect_cfg` VALUES ('2016', '12', '4.50', '1.50', '1438910833006', '0');
