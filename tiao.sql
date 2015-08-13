/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50541
Source Host           : localhost:8889
Source Database       : tiao

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2015-08-13 17:57:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------
INSERT INTO `persistent_logins` VALUES ('zouruijin', 'C9HVktqnNm6BMym58EL9bQ==', 'HdoftvtqTW/nUUEGwpY3pQ==', '2015-08-13 17:56:33');

-- ----------------------------
-- Table structure for t_checkin
-- ----------------------------
DROP TABLE IF EXISTS `t_checkin`;
CREATE TABLE `t_checkin` (
  `houseid` varchar(45) NOT NULL,
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
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '100', '张三', '17722677569', '362203198611176818', '100', '50', '120', '236', '40', '', '10', '2', '10', '2015', '7', '6', '1438829145409', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '102', '李四', '17722677569', '362203198611176819', '200', '100', '10', '20', '40', '', '10', '2', '10', '2015', '7', '6', '1438829342888', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '103', '王五', '17722677564', '362203198611176811', '220', '200', '215', '630', '40', '', '10', '2', '10', '2015', '7', '6', '1438830240154', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '104', '马伟', '17722677559', '362203198611176801', '180', '120', '20', '17', '40', '', '10', '2', '10', '2015', '7', '6', '1438830589700', '0');
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '131', '美容', '1311224503', '33333333', '201', '200', '0', '0', '40', '', '10', '2', '10', '2015', '8', '9', '1439109899689', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '201', '美国', '1311224501', '111111111', '200', '100', '0', '0', '40', '', '10', '2', '10', '2015', '7', '9', '1439108791914', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '202', '美丽', '1311224502', '22222222222', '200', '200', '0', '0', '40', '', '10', '2', '10', '2015', '8', '9', '1439109578301', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '203', '美发', '1311224504', '44444444444', '230', '100', '0', '0', '40', '', '10', '2', '10', '2015', '7', '9', '1439111196107', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '204', '小丁', '1311224505', '555555555', '240', '200', '0', '0', '40', '', '10', '2', '10', '2015', '8', '9', '1439111698142', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '205', '小金子', '1311224506', '555555', '200', '100', '0', '0', '40', '', '10', '2', '10', '2015', '7', '9', '1439112144459', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '206', 'maven', '17722677509', '362203198611176821', '200', '100', '0', '0', '40', '', '10', '2', '10', '2015', '8', '10', '1439214842253', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '301', 'spring', '17722677555', '362203198611176112', '0', '0', '0', '0', '40', '', '10', '2', '10', '2015', '6', '11', '1439258258440', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '302', 'eclipse', '17722677502', '362203198611176822', '0', '0', '0', '0', '0', null, '10', '2', '10', '2015', '8', '11', '1439264606747', '1439264798286');

-- ----------------------------
-- Table structure for t_checkout
-- ----------------------------
DROP TABLE IF EXISTS `t_checkout`;
CREATE TABLE `t_checkout` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `houseid` varchar(45) NOT NULL,
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
INSERT INTO `t_checkout` VALUES ('1', '89635a0e-418a-11e5-9172-fdf195657018', '100', '邹瑞金', '17722677560', '362203198611176811', '200', '100', '1024', '563', '40', '192.168.10.130', '10', '0', null, null, '0', '0', '0', '1438678546956', null);
INSERT INTO `t_checkout` VALUES ('2', '89635a0e-418a-11e5-9172-fdf195657018', '102', '邹瑞金2', '17722677561', '362203198611176812', '220', '100', '123', '101', '40', '192.168.10.131', '10', '0', null, null, '0', '0', '0', '1438679785978', null);
INSERT INTO `t_checkout` VALUES ('3', '89635a0e-418a-11e5-9172-fdf195657018', '103', '邹瑞金3', '17722677562', '362203198611176813', '300', '200', '10', '50', '40', '192.168.10.132', '10', '0', null, null, '0', '0', '0', '1438680745097', null);
INSERT INTO `t_checkout` VALUES ('4', '89635a0e-418a-11e5-9172-fdf195657018', '100', '邹瑞金', '17722677560', '362203198611176811', '200', '100', '1024', '563', '40', 'null', '10', '-323', '2', '10', '2015', '7', '5', '1438768069009', null);
INSERT INTO `t_checkout` VALUES ('5', '89635a0e-418a-11e5-9172-fdf195657018', '102', 'null', '17722677561', 'null', '220', '100', '123', '101', '40', 'null', '10', '-15', '2', '10', '2015', '7', '6', '1438825621336', null);
INSERT INTO `t_checkout` VALUES ('6', '89635a0e-418a-11e5-9172-fdf195657018', '103', 'null', '17722677562', 'null', '300', '200', '10', '50', '40', 'null', '10', '94', '2', '10', '2015', '7', '6', '1438826749122', null);

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house` (
  `id` varchar(45) NOT NULL,
  `housename` varchar(32) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  `created` bigint(32) NOT NULL,
  `updated` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES ('3d023159-419e-11e5-9dd8-bbf8b2aae6dc', '新楼', '', '1439458359', '0');
INSERT INTO `t_house` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '1栋楼', '', '1439449897', null);
INSERT INTO `t_house` VALUES ('97c2b41f-418a-11e5-9172-ade6bde32708', '2栋楼', '', '1439449921', '1439449933885');

-- ----------------------------
-- Table structure for t_net_cfg
-- ----------------------------
DROP TABLE IF EXISTS `t_net_cfg`;
CREATE TABLE `t_net_cfg` (
  `houseid` varchar(45) NOT NULL,
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
INSERT INTO `t_net_cfg` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '100', null, '', '', '40', '2015', '8', '7', '1438931028001', null);
INSERT INTO `t_net_cfg` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '102', null, 'usr2', 'pwd2', '40', '2015', '8', '7', '1438931130382', null);
INSERT INTO `t_net_cfg` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '301', null, null, null, '40', '2015', '8', '11', '1439273671882', null);
INSERT INTO `t_net_cfg` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '302', '192.168.10.136', null, null, '40', '2015', '8', '11', '1439264798292', null);

-- ----------------------------
-- Table structure for t_room
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room` (
  `houseid` varchar(45) NOT NULL,
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
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '100', '90', '50', 'danjian', '', '1438669454344', '1438669570536');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '102', '200', '150', 'yifangyiting', 'abc', '0', '1439196731501');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '103', '220', '150', 'danjian', '', '0', '1439196757788');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '104', '180', '100', 'danjian', '', '0', '1439365267702');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '131', '201', '0', 'danjian', 'abcde', '1438656389780', '1438669579794');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '201', '200', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '202', '200', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '203', '230', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '204', '240', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '205', '200', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '206', '200', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '301', '300', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '302', '300', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '303', '300', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '304', '300', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '305', '300', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '306', '310', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '307', '320', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '308', '310', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '309', '300', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '401', '310', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '402', '320', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '403', '330', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '404', '300', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '907', '210', '0', 'danjian', null, '1438591469784', null);
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '908', '200', '0', 'danjian', null, '1438591324338', null);
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '909', '200', '0', 'danjian', null, '1438591164091', null);
INSERT INTO `t_room` VALUES ('97c2b41f-418a-11e5-9172-ade6bde32708', '101', '500', '300', 'yifangyiting', '', '1439451032862', null);

-- ----------------------------
-- Table structure for t_room_money
-- ----------------------------
DROP TABLE IF EXISTS `t_room_money`;
CREATE TABLE `t_room_money` (
  `houseid` int(8) NOT NULL,
  `roomno` int(8) NOT NULL,
  `monthmoney` int(8) DEFAULT '0',
  `pressmoney` int(8) DEFAULT '0',
  `roommoney` decimal(8,2) NOT NULL,
  `year` int(8) NOT NULL,
  `month` int(8) NOT NULL,
  `day` int(8) NOT NULL,
  `created` bigint(32) NOT NULL,
  `updated` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`houseid`,`roomno`,`year`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room_money
-- ----------------------------
INSERT INTO `t_room_money` VALUES ('89635', '100', '0', '0', '195.00', '2015', '8', '9', '1439102589022', null);
INSERT INTO `t_room_money` VALUES ('89635', '203', '0', '0', '400.00', '2015', '7', '9', '1439111196112', null);
INSERT INTO `t_room_money` VALUES ('89635', '203', '0', '0', '343.00', '2015', '8', '9', '1439111339646', null);
INSERT INTO `t_room_money` VALUES ('89635', '204', '0', '0', '510.00', '2015', '7', '9', '1439111698146', null);
INSERT INTO `t_room_money` VALUES ('89635', '204', '0', '0', '302.00', '2015', '8', '9', '1439111803452', null);
INSERT INTO `t_room_money` VALUES ('89635', '205', '0', '0', '370.00', '2015', '7', '9', '1439112144464', null);
INSERT INTO `t_room_money` VALUES ('89635', '205', '0', '0', '256.00', '2015', '8', '9', '1439112214263', null);
INSERT INTO `t_room_money` VALUES ('89635', '206', '0', '0', '370.00', '2015', '8', '10', '1439214842257', null);
INSERT INTO `t_room_money` VALUES ('89635', '301', '300', '200', '570.00', '2015', '6', '11', '1439258258451', null);
INSERT INTO `t_room_money` VALUES ('89635', '301', '300', '200', '580.00', '2015', '7', '11', '1439258258452', null);
INSERT INTO `t_room_money` VALUES ('89635', '301', '310', '200', '340.00', '2015', '8', '11', '1439273671882', null);
INSERT INTO `t_room_money` VALUES ('89635', '302', '300', '150', '520.00', '2015', '8', '11', '1439264798292', null);

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
  PRIMARY KEY (`houseid`,`roomno`,`year`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_waterelect
-- ----------------------------
INSERT INTO `t_waterelect` VALUES ('89635', '100', '120', '4.50', '236', '1.50', '2015', '7', '6', '0', null);
INSERT INTO `t_waterelect` VALUES ('89635', '100', '125', '4.50', '251', '1.50', '2015', '8', '9', '1438757277392', '2');
INSERT INTO `t_waterelect` VALUES ('89635', '102', '15', '4.50', '28', '1.50', '2015', '8', '9', '1438822812308', '2');
INSERT INTO `t_waterelect` VALUES ('89635', '103', '13', '4.50', '65', '1.50', '2015', '7', '6', '1438826400066', null);
INSERT INTO `t_waterelect` VALUES ('89635', '103', '16', '4.50', '70', '1.50', '2015', '8', '9', '1439108279520', null);
INSERT INTO `t_waterelect` VALUES ('89635', '104', '25', '4.50', '27', '1.50', '2015', '8', '7', '1438914952810', null);
INSERT INTO `t_waterelect` VALUES ('89635', '131', '20', '4.50', '20', '1.50', '2015', '8', '9', '1439109899694', null);
INSERT INTO `t_waterelect` VALUES ('89635', '201', '0', '4.50', '0', '1.50', '2015', '7', '9', '0', null);
INSERT INTO `t_waterelect` VALUES ('89635', '201', '1', '4.50', '1', '1.50', '2015', '8', '9', '1439112287286', null);
INSERT INTO `t_waterelect` VALUES ('89635', '202', '10', '4.50', '10', '1.50', '2015', '8', '9', '1439109578307', null);
INSERT INTO `t_waterelect` VALUES ('89635', '203', '10', '4.50', '10', '1.50', '2015', '7', '9', '1439111196112', null);
INSERT INTO `t_waterelect` VALUES ('89635', '203', '20', '4.50', '22', '1.50', '2015', '8', '9', '1439111316830', null);
INSERT INTO `t_waterelect` VALUES ('89635', '204', '10', '4.50', '10', '1.50', '2015', '7', '9', '1439111698146', null);
INSERT INTO `t_waterelect` VALUES ('89635', '204', '11', '4.50', '15', '1.50', '2015', '8', '9', '1439111793186', null);
INSERT INTO `t_waterelect` VALUES ('89635', '205', '1', '4.50', '1', '1.50', '2015', '7', '9', '1439112144464', null);
INSERT INTO `t_waterelect` VALUES ('89635', '205', '2', '4.50', '2', '1.50', '2015', '8', '9', '1439112189602', null);
INSERT INTO `t_waterelect` VALUES ('89635', '206', '1', '4.50', '1', '1.50', '2015', '8', '10', '1439214842257', null);
INSERT INTO `t_waterelect` VALUES ('89635', '301', '20', '4.50', '20', '1.50', '2015', '5', '11', '1439262171675', null);
INSERT INTO `t_waterelect` VALUES ('89635', '301', '10', '4.50', '10', '1.50', '2015', '6', '11', '1439258258450', null);
INSERT INTO `t_waterelect` VALUES ('89635', '301', '15', '4.50', '15', '1.50', '2015', '7', '11', '1439258258451', null);
INSERT INTO `t_waterelect` VALUES ('89635', '301', '25', '4.50', '25', '1.50', '2015', '8', '12', '1439365187281', null);
INSERT INTO `t_waterelect` VALUES ('89635', '302', '0', '4.50', '0', '1.50', '2015', '8', '11', '1439264606756', '1439264798292');

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

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('alex', '123456', '1');
INSERT INTO `users` VALUES ('mkyong', '654321', '1');
INSERT INTO `users` VALUES ('zouruijin', '654321', '1');

-- ----------------------------
-- Table structure for user_houses
-- ----------------------------
DROP TABLE IF EXISTS `user_houses`;
CREATE TABLE `user_houses` (
  `username` varchar(45) DEFAULT NULL,
  `houseid` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_houses
-- ----------------------------
INSERT INTO `user_houses` VALUES ('zouruijin', '89635a0e-418a-11e5-9172-fdf195657018');
INSERT INTO `user_houses` VALUES ('zouruijin', '97c2b41f-418a-11e5-9172-ade6bde32708');
INSERT INTO `user_houses` VALUES ('mkyong', '3d023159-419e-11e5-9dd8-bbf8b2aae6dc');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `uni_username_role` (`role`,`username`),
  KEY `fk_username_idx` (`username`),
  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES ('2', 'mkyong', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('5', 'zouruijin', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('3', 'alex', 'ROLE_USER');
INSERT INTO `user_roles` VALUES ('1', 'mkyong', 'ROLE_USER');
INSERT INTO `user_roles` VALUES ('6', 'zouruijin', 'ROLE_USER');

-- ----------------------------
-- Procedure structure for p_insert_houses
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_insert_houses`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insert_houses`(in v_id varchar(45),in v_username varchar(45),in v_housename varchar(45),in v_description varchar(45))
BEGIN
		declare result int default 0;
		DECLARE EXIT HANDLER FOR SQLEXCEPTION  ROLLBACK;
		DECLARE EXIT HANDLER FOR SQLWARNING  ROLLBACK;
		
		START TRANSACTION;
			insert into t_house(id,housename,description,created) values(v_id,v_housename,v_description,UNIX_TIMESTAMP(now()));
			insert into user_houses(username,houseid) values(v_username,v_id);
			set result = 1;
		COMMIT;
		select result;
END
;;
DELIMITER ;
