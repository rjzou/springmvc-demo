/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50541
Source Host           : localhost:8889
Source Database       : tiao

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001
 
Date: 2015-08-26 15:42:37
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
INSERT INTO `persistent_logins` VALUES ('zouleihui', 'BLhZcixUyAYrG/c3jJmhmQ==', 'Q9qtThOpraPUx2BjbunAAg==', '2015-08-25 15:14:00');
INSERT INTO `persistent_logins` VALUES ('zouleihui', 'GQOFntoC5LS8GU2i99DkUg==', 'uThORBEIVkyfncuyrFtAGQ==', '2015-08-25 13:49:28');
INSERT INTO `persistent_logins` VALUES ('zouleihui', 'JeQ1fy06y6LjIg3PxwsCTg==', 'DCpxwU7fIRyigtearkhVQg==', '2015-08-26 06:55:18');
INSERT INTO `persistent_logins` VALUES ('zouleihui', 'oYbG7F5qJe+94rW3AphWVQ==', '1GVS/soG3t/HmLDLOVZ6rA==', '2015-08-26 15:15:35');
INSERT INTO `persistent_logins` VALUES ('zouruijin', 'xsAzrFb8qSCou+XoCwR+OQ==', 'fcc77HlgaCTDw+/VR1+g5Q==', '2015-08-25 15:21:14');

-- ----------------------------
-- Table structure for t_checkin
-- ----------------------------
DROP TABLE IF EXISTS `t_checkin`;
CREATE TABLE `t_checkin` (
  `houseid` varchar(45) NOT NULL,
  `roomno` int(8) NOT NULL,
  `customid` varchar(45) DEFAULT NULL,
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
INSERT INTO `t_checkin` VALUES ('', '0', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', null, '0', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '100', 'e7c15f16-4420-11e5-8d33-c99804c20755', '10', '2', '10', '2015', '8', '16', '1439734382', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '102', 'd6d5e54a-473c-11e5-a8bf-65d97750a0b6', '10', '1', '10', '2015', '8', '20', '1440076322', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '103', '1f0a5b28-4421-11e5-8d33-57e68146edd9', '10', '2', '10', '2015', '8', '16', '1439734475', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '104', '1e77384d-4420-11e5-8d33-6b7661b5d536', '10', '2', '10', '2015', '8', '16', '1439734235', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '131', '959593ae-4423-11e5-ae2a-b164ef721007', '10', '2', '10', '2015', '8', '16', '1439735593', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '201', 'e24c66c1-4423-11e5-ae2a-8fe22c727244', '10', '2', '10', '2015', '8', '16', '1439735661', '1439736157');
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '201', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '40', '2015', '7', '1', '1440151526', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '202', '69f376e6-4425-11e5-8dbc-135e963d3b8c', '10', '2', '10', '2015', '8', '16', '1439736318', '1439736420');
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '203', 'e53c361e-45ba-11e5-90c7-8f68044e1257', '10', '2', '10', '2015', '8', '18', '1439910483', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '305', 'new305', '10', '2', '10', '2015', '8', '24', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '306', 'new306', '10', '2', '10', '2015', '6', '1', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '350', 'new350', '10', '2', '10', '2015', '8', '12', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '401', 'new401', '10', '2', '10', '2015', '8', '26', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '402', 'new402', '10', '2', '10', '2015', '8', '10', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '403', 'new403', '10', '2', '10', '2015', '8', '11', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '405', 'new405', '10', '2', '10', '2015', '8', '15', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '406', 'new406', '10', '2', '10', '2015', '8', '15', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '407', 'new407', '10', '2', '10', '2015', '8', '15', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '408', 'new408', '10', '2', '10', '2015', '8', '10', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '409', 'new409', '10', '2', '10', '2015', '8', '12', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '410', 'new410', '10', '2', '10', '2015', '8', '14', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '501', 'new501', '10', '2', '10', '2015', '8', '15', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '502', 'new502', '10', '2', '10', '2015', '8', '16', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '503', 'new503', '10', '2', '10', '2015', '8', '14', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '505', 'new505', '10', '2', '10', '2015', '8', '10', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '507', 'new507', '10', '2', '10', '2015', '8', '10', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '508', 'new508', '10', '2', '10', '2015', '8', '9', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '509', 'new509', '10', '2', '10', '2015', '8', '20', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '510', 'new510', '10', '2', '10', '2015', '8', '8', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '601', 'new601', '10', '2', '10', '2015', '6', '10', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '603', 'new603', '10', '2', '10', '2015', '8', '21', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '605', 'new605', '10', '2', '10', '2015', '8', '30', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '606', 'new606', '10', '2', '10', '2015', '8', '10', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '607', 'new607', '10', '2', '10', '2015', '8', '8', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '608', 'new608', '10', '2', '10', '2015', '8', '20', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '609', 'new609', '10', '2', '10', '2015', '8', '6', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '610', 'new610', '10', '2', '10', '2015', '8', '20', '0', null);

-- ----------------------------
-- Table structure for t_checkout
-- ----------------------------
DROP TABLE IF EXISTS `t_checkout`;
CREATE TABLE `t_checkout` (
  `id` varchar(45) NOT NULL,
  `houseid` varchar(45) NOT NULL,
  `roomno` int(8) NOT NULL,
  `customid` varchar(45) NOT NULL,
  `trash` int(8) DEFAULT '0',
  `keycount` int(8) DEFAULT NULL,
  `keyprice` int(8) DEFAULT NULL,
  `inyear` int(8) DEFAULT NULL,
  `inmonth` int(8) DEFAULT NULL,
  `inday` int(8) DEFAULT NULL,
  `year` int(8) NOT NULL,
  `month` int(8) NOT NULL,
  `day` int(8) NOT NULL,
  `coutmoney` decimal(8,2) NOT NULL,
  `created` bigint(32) NOT NULL,
  `updated` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_checkout
-- ----------------------------
INSERT INTO `t_checkout` VALUES ('a877b814-5cf1-11e5-ae11-dbbb5d8d7461', '89635a0e-418a-11e5-9172-fdf195657018', '203', 'b4b2e92e-447e-11e5-999c-0f50d57e5b1e', '10', '2', '10', '2015', '8', '17', '2015', '9', '17', '-468.50', '1442462868', null);

-- ----------------------------
-- Table structure for t_custom
-- ----------------------------
DROP TABLE IF EXISTS `t_custom`;
CREATE TABLE `t_custom` (
  `id` varchar(45) NOT NULL,
  `customname` varchar(32) DEFAULT NULL,
  `iphone` varchar(16) DEFAULT NULL,
  `cardid` varchar(32) DEFAULT NULL,
  `year` int(8) DEFAULT NULL,
  `month` int(8) DEFAULT NULL,
  `day` int(8) DEFAULT NULL,
  `created` bigint(32) NOT NULL,
  `updated` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_custom
-- ----------------------------
INSERT INTO `t_custom` VALUES ('1d57f743-42a1-11e5-a693-73e8fed79601', 'eclipse', '17722677503', '362203198611176811', '2015', '8', '15', '1439569545420', null);
INSERT INTO `t_custom` VALUES ('1e77384d-4420-11e5-8d33-6b7661b5d536', 'test3', '1311224507', '362203198611176825', '2015', '8', '16', '1439734235', null);
INSERT INTO `t_custom` VALUES ('1f0a5b28-4421-11e5-8d33-57e68146edd9', '美丽', '1311224503', '362203198611176826', '2015', '8', '16', '1439734475', null);
INSERT INTO `t_custom` VALUES ('24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '陈志新', '00000', '441421198311232419', '2015', '8', '21', '1440151526', null);
INSERT INTO `t_custom` VALUES ('45fd1634-42a1-11e5-a693-f7a807b3b745', 'eclipse2', '17722671560', '362203198611176812', '2015', '8', '15', '1439569623718', null);
INSERT INTO `t_custom` VALUES ('4d04d1d2-42a0-11e5-a693-e1398864253a', 'anguler', '17722677503', '362203198611171122', '2015', '8', '15', '1439569201399', null);
INSERT INTO `t_custom` VALUES ('69f376e6-4425-11e5-8dbc-135e963d3b8c', 'china', '1331224506', '363203198611176825', '2015', '8', '16', '1439736318', '1439736420');
INSERT INTO `t_custom` VALUES ('959593ae-4423-11e5-ae2a-b164ef721007', 'test34', '1311229903', '362202298611176825', '2015', '8', '16', '1439735593', null);
INSERT INTO `t_custom` VALUES ('b4b2e92e-447e-11e5-999c-0f50d57e5b1e', '邹瑞金', '17722677560', '362203198611176827', '2015', '8', '17', '1439774679', null);
INSERT INTO `t_custom` VALUES ('d6d5e54a-473c-11e5-a8bf-65d97750a0b6', '陈酿', '13245809755', '445121199707074567', '2015', '8', '20', '1440076322', null);
INSERT INTO `t_custom` VALUES ('e24c66c1-4423-11e5-ae2a-8fe22c727244', '美发', '1311224504', '362213198611176826', '2015', '8', '16', '1439735661', null);
INSERT INTO `t_custom` VALUES ('e53c361e-45ba-11e5-90c7-8f68044e1257', '丁美容', '1311224599', '362203198611175525', '2015', '8', '18', '1439910483', null);
INSERT INTO `t_custom` VALUES ('e7c15f16-4420-11e5-8d33-c99804c20755', '美国', '1311224507', '362203198611176823', '2015', '8', '16', '1439734382', '1');
INSERT INTO `t_custom` VALUES ('new201', '201租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new305', '305租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new306', '306租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new401', '401租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new402', '402租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new403', '403租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new405', '405租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new406', '406租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new407', '407租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new408', '408租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new409', '409租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new410', '410租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new501', '501租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new502', '502租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new503', '503租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new505', '505租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new506', '506租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new507', '507租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new509', '509租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new510', '510租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new601', '601租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new602', '602租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new603', '603租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new605', '605租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new606', '606租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new607', '607租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new608', '608租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new609', '609租客', '000000', '000000', '2015', '8', '26', '0', null);
INSERT INTO `t_custom` VALUES ('new610', '610租客', '000000', '000000', '2015', '8', '26', '0', null);

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
INSERT INTO `t_house` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '新房', '', '1439806029', null);
INSERT INTO `t_house` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '老房', '', '1439806041', null);

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
INSERT INTO `t_net_cfg` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '100', '', '', '', '40', '2015', '8', '16', '1439734382', '1442464173785');
INSERT INTO `t_net_cfg` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '102', '', '', '', '40', '2015', '8', '20', '1440076322', null);
INSERT INTO `t_net_cfg` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '103', '', '', '', '40', '2015', '8', '16', '1439734475', null);
INSERT INTO `t_net_cfg` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '104', '', '', '', '40', '2015', '8', '16', '1439734235', null);
INSERT INTO `t_net_cfg` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '131', '', '', '', '40', '2015', '8', '16', '1439735593', null);
INSERT INTO `t_net_cfg` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '201', '', '', '', '40', '2015', '8', '16', '1439735661', null);
INSERT INTO `t_net_cfg` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '202', '', '', '', '40', '2015', '8', '16', '1439736318', '1439736420');
INSERT INTO `t_net_cfg` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '203', '', '', '', '40', '2015', '8', '18', '1439910483', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '201', '', '', '', '40', '2015', '8', '21', '1440151526', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '305', '192.168.10.106', null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '306', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '401', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '402', '192.168.10.104', null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '403', '192.168.10.105', null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '405', '192.168.10.107', null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '406', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '407', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '408', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '409', '192.168.10.103', null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '410', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '501', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '502', '192.168.10.112', null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '503', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '505', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '506', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '507', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '508', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '509', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '510', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '601', null, null, null, '0', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '602', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '603', '192.168.10.111', null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '605', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '606', '192.168.10.110', null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '607', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '608', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '609', null, null, null, '40', '2015', '8', '1', '0', null);
INSERT INTO `t_net_cfg` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '610', null, null, null, '40', '2015', '8', '1', '0', '1440481855077');

-- ----------------------------
-- Table structure for t_net_cfg_out
-- ----------------------------
DROP TABLE IF EXISTS `t_net_cfg_out`;
CREATE TABLE `t_net_cfg_out` (
  `coutid` varchar(45) NOT NULL,
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
  PRIMARY KEY (`coutid`,`houseid`,`roomno`,`year`,`month`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_net_cfg_out
-- ----------------------------
INSERT INTO `t_net_cfg_out` VALUES ('1e8798db-425e-11e5-94a1-c500579d0a7a', '89635a0e-418a-11e5-9172-fdf195657018', '303', '', null, null, '40', '2015', '8', '14', '1439540771', null);
INSERT INTO `t_net_cfg_out` VALUES ('3e7911de-4265-11e5-af19-ef176a2ffcbc', '89635a0e-418a-11e5-9172-fdf195657018', '100', '', null, null, '40', '2015', '8', '14', '1439543831', null);
INSERT INTO `t_net_cfg_out` VALUES ('4cb01c40-4268-11e5-a456-612d91f37c48', '89635a0e-418a-11e5-9172-fdf195657018', '131', '', null, null, '40', '2015', '8', '14', '1439545143', null);
INSERT INTO `t_net_cfg_out` VALUES ('a877b814-5cf1-11e5-ae11-dbbb5d8d7461', '89635a0e-418a-11e5-9172-fdf195657018', '203', null, null, null, '40', '2015', '8', '17', '1442462868', null);

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
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '131', '320', '200', 'danjian', 'abcde', '1438656389780', '1439544093435');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '201', '200', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '202', '200', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '203', '230', '0', 'danjian', null, '0', '0');
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '204', '240', '0', 'danjian', '房间水表坏了', '0', '1440054013866');
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
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '201', '360', '360', 'danjian', '', '1439806082518', '1440151425881');
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '305', '300', '300', 'danjian', '', '1440468018792', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '306', '330', '330', 'danjian', '', '1440467601801', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '401', '330', '330', 'danjian', '', '1440467907920', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '402', '320', '320', 'danjian', '', '1440467710746', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '403', '300', '300', 'danjian', '', '1440467773434', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '405', '300', '300', 'danjian', '', '1440467852094', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '406', '340', '340', 'danjian', '', '1440467864928', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '407', '300', '300', 'danjian', '', '1440467876873', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '408', '310', '310', 'danjian', '', '1440467722564', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '409', '310', '310', 'danjian', '', '1440467784987', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '410', '350', '350', 'danjian', '', '1440467829069', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '501', '320', '320', 'danjian', '', '1440467893908', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '502', '300', '300', 'danjian', '', '1440467918274', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '503', '350', '350', 'danjian', '', '1440467841625', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '505', '290', '290', 'danjian', '', '1440467737445', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '506', '350', '350', 'danjian', '', '1440467813701', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '507', '300', '300', 'danjian', '', '1440467750868', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '508', '320', '320', 'danjian', '', '1440467682682', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '509', '300', '300', 'danjian', '', '1440467929804', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '510', '300', '300', 'danjian', '', '1440467653733', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '601', '300', '300', 'danjian', '', '1440467695044', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '602', '280', '280', 'danjian', '', '1440467626808', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '603', '280', '280', 'danjian', '', '1440468008852', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '605', '280', '280', 'danjian', '', '1440468028928', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '606', '300', '300', 'danjian', '', '1440467762153', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '607', '280', '280', 'danjian', '', '1440467670951', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '608', '280', '280', 'danjian', '', '1440467984366', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '609', '270', '270', 'danjian', '', '1440467641544', null);
INSERT INTO `t_room` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '610', '280', '280', 'danjian', '', '1440467997576', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '101', '350', '350', 'danjian', '', '1440468157592', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '201', '210', '210', 'danjian', '', '1440468315120', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '202', '250', '250', 'danjian', '', '1440468254196', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '205', '250', '250', 'danjian', '', '1440468104437', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '206', '260', '260', 'danjian', '', '1440468242938', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '207', '360', '360', 'danjian', '', '1440468191613', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '208', '220', '220', 'danjian', '', '1440468205321', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '301', '250', '250', 'danjian', '', '1440468180701', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '302', '240', '240', 'danjian', '', '1440468145523', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '305', '240', '240', 'danjian', '', '1440468265529', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '306', '260', '260', 'danjian', '', '1440468122881', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '307', '380', '380', 'danjian', '', '1440468219107', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '308', '220', '220', 'danjian', '', '1440468168392', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '401', '240', '240', 'danjian', '', '1440468416357', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '402', '210', '210', 'danjian', '', '1440468334412', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '405', '250', '250', 'danjian', '', '1440468430711', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '406', '240', '240', 'danjian', '', '1440468277911', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '407', '350', '350', 'danjian', '', '1440468231107', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '408', '210', '210', 'danjian', '', '1440468401201', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '501', '370', '370', 'danjian', '', '1440468134654', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '502', '220', '220', 'danjian', '', '1440468289899', null);
INSERT INTO `t_room` VALUES ('bff47e03-44c7-11e5-b983-9376a22d97c1', '10000', '1550', '1550', 'dianpu', '店铺', '1440468090450', null);

-- ----------------------------
-- Table structure for t_room_money
-- ----------------------------
DROP TABLE IF EXISTS `t_room_money`;
CREATE TABLE `t_room_money` (
  `houseid` varchar(45) NOT NULL,
  `roomno` int(8) NOT NULL,
  `monthmoney` int(8) DEFAULT '0',
  `pressmoney` int(8) DEFAULT '0',
  `roommoney` decimal(8,2) NOT NULL,
  `year` int(8) NOT NULL,
  `month` int(8) NOT NULL,
  `day` int(8) DEFAULT NULL,
  `created` bigint(32) NOT NULL,
  `updated` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`houseid`,`roomno`,`year`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room_money
-- ----------------------------
INSERT INTO `t_room_money` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '100', '90', '50', '210.00', '2015', '8', '16', '1439734382', null);
INSERT INTO `t_room_money` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '100', '90', '50', '200.00', '2015', '9', '17', '1442464173785', null);
INSERT INTO `t_room_money` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '102', '220', '150', '390.00', '2015', '8', '20', '1440076322', null);
INSERT INTO `t_room_money` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '103', '220', '150', '440.00', '2015', '8', '16', '1439734475', null);
INSERT INTO `t_room_money` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '104', '180', '100', '350.00', '2015', '8', '16', '1439734235', null);
INSERT INTO `t_room_money` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '131', '320', '200', '590.00', '2015', '8', '16', '1439735593', null);
INSERT INTO `t_room_money` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '201', '200', '100', '370.00', '2015', '8', '16', '1439735661', null);
INSERT INTO `t_room_money` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '202', '200', '100', '370.00', '2015', '8', '16', '1439736318', '1439736420');
INSERT INTO `t_room_money` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '203', '230', '150', '410.00', '2015', '8', '18', '1439910483', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '201', '360', '360', '577.00', '2015', '7', '1', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '201', '360', '360', '628.50', '2015', '8', '1', '1440151526', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '305', '300', '300', '653.70', '2015', '7', '24', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '306', '330', '330', '577.00', '2015', '7', '1', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '306', '330', '330', '377.50', '2015', '8', '1', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '401', '330', '330', '340.00', '2015', '7', '15', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '402', '320', '320', '403.00', '2015', '7', '10', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '402', '300', '300', '392.50', '2015', '8', '10', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '403', '300', '300', '408.50', '2015', '7', '11', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '403', '300', '300', '422.00', '2015', '8', '11', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '405', '300', '300', '495.50', '2015', '7', '15', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '405', '300', '300', '443.00', '2015', '8', '15', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '406', '340', '340', '402.50', '2015', '7', '15', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '406', '340', '340', '396.50', '2015', '8', '15', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '407', '300', '300', '386.00', '2015', '7', '15', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '407', '300', '300', '326.50', '2015', '8', '15', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '408', '310', '310', '468.00', '2015', '7', '10', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '408', '310', '310', '350.00', '2015', '8', '10', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '409', '310', '310', '351.50', '2015', '7', '12', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '409', '320', '320', '330.00', '2015', '8', '12', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '410', '350', '350', '460.70', '2015', '7', '14', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '410', '350', '350', '449.60', '2015', '8', '14', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '501', '320', '320', '484.50', '2015', '7', '15', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '501', '320', '320', '537.00', '2015', '8', '15', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '502', '300', '300', '414.50', '2015', '7', '20', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '502', '300', '300', '462.50', '2015', '8', '16', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '503', '350', '350', '432.00', '2015', '7', '14', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '503', '350', '350', '408.00', '2015', '8', '14', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '505', '2920', '290', '336.00', '2015', '7', '10', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '505', '290', '290', '328.50', '2015', '8', '10', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '506', '350', '350', '444.00', '2015', '7', '12', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '506', '350', '350', '393.00', '2015', '8', '12', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '507', '300', '300', '344.50', '2015', '7', '10', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '507', '300', '300', '346.00', '2015', '8', '10', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '508', '320', '320', '372.00', '2015', '7', '9', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '508', '320', '320', '375.00', '2015', '8', '9', '9', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '509', '300', '300', '356.50', '2015', '7', '20', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '509', '300', '300', '346.00', '2015', '8', '20', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '510', '300', '300', '390.00', '2015', '7', '8', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '510', '300', '300', '594.00', '2015', '8', '8', '8', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '601', '300', '300', '347.50', '2015', '6', '10', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '601', '300', '300', '338.50', '2015', '7', '10', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '601', '300', '300', '338.50', '2015', '8', '25', '1440482000856', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '602', '280', '280', '348.50', '2015', '7', '2', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '602', '280', '280', '332.00', '2015', '8', '1', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '603', '280', '280', '357.00', '2015', '7', '21', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '603', '280', '280', '526.50', '2015', '8', '21', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '605', '280', '280', '465.00', '2015', '7', '30', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '606', '300', '300', '407.00', '2015', '7', '10', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '606', '300', '300', '467.00', '2015', '8', '10', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '607', '280', '280', '330.50', '2015', '7', '8', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '607', '280', '280', '318.50', '2015', '8', '8', '8', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '608', '280', '280', '344.00', '2015', '7', '20', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '608', '280', '280', '330.50', '2015', '8', '20', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '609', '270', '270', '335.50', '2015', '7', '6', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '609', '270', '270', '322.00', '2015', '8', '6', '6', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '610', '280', '280', '351.50', '2015', '7', '20', '0', null);
INSERT INTO `t_room_money` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '610', '280', '280', '370.50', '2015', '8', '25', '1440481855077', null);

-- ----------------------------
-- Table structure for t_room_money_out
-- ----------------------------
DROP TABLE IF EXISTS `t_room_money_out`;
CREATE TABLE `t_room_money_out` (
  `coutid` varchar(45) NOT NULL,
  `houseid` varchar(45) NOT NULL,
  `roomno` int(8) NOT NULL,
  `monthmoney` int(8) NOT NULL DEFAULT '0',
  `pressmoney` int(8) NOT NULL DEFAULT '0',
  `roommoney` decimal(8,2) NOT NULL,
  `year` int(8) NOT NULL,
  `month` int(8) NOT NULL,
  `day` int(8) NOT NULL,
  `created` bigint(32) NOT NULL,
  `updated` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`coutid`,`houseid`,`roomno`,`year`,`month`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room_money_out
-- ----------------------------
INSERT INTO `t_room_money_out` VALUES ('1e8798db-425e-11e5-94a1-c500579d0a7a', '89635a0e-418a-11e5-9172-fdf195657018', '303', '300', '200', '570.00', '2015', '8', '14', '1439540771', null);
INSERT INTO `t_room_money_out` VALUES ('3e7911de-4265-11e5-af19-ef176a2ffcbc', '89635a0e-418a-11e5-9172-fdf195657018', '100', '90', '50', '210.00', '2015', '8', '9', '1439543831', null);
INSERT INTO `t_room_money_out` VALUES ('4cb01c40-4268-11e5-a456-612d91f37c48', '89635a0e-418a-11e5-9172-fdf195657018', '131', '320', '200', '590.00', '2015', '8', '14', '1439545143', null);
INSERT INTO `t_room_money_out` VALUES ('a877b814-5cf1-11e5-ae11-dbbb5d8d7461', '89635a0e-418a-11e5-9172-fdf195657018', '203', '230', '200', '500.00', '2015', '8', '17', '1442462868', null);

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
INSERT INTO `t_room_type` VALUES ('dianpu', '店铺', null, '0', null);

-- ----------------------------
-- Table structure for t_waterelect
-- ----------------------------
DROP TABLE IF EXISTS `t_waterelect`;
CREATE TABLE `t_waterelect` (
  `houseid` varchar(45) NOT NULL,
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
INSERT INTO `t_waterelect` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '100', '10', '4.50', '10', '1.50', '2015', '8', '16', '1439734382', null);
INSERT INTO `t_waterelect` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '100', '20', '4.50', '20', '1.50', '2015', '9', '17', '1442464153281', null);
INSERT INTO `t_waterelect` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '102', '123', '4.50', '345', '1.50', '2015', '8', '20', '1440076322', null);
INSERT INTO `t_waterelect` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '103', '1', '4.50', '1', '1.50', '2015', '8', '16', '1439734475', null);
INSERT INTO `t_waterelect` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '104', '1', '4.50', '1', '1.50', '2015', '8', '16', '1439734235', null);
INSERT INTO `t_waterelect` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '131', '1', '4.50', '1', '1.50', '2015', '8', '16', '1439735593', null);
INSERT INTO `t_waterelect` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '201', '1', '4.50', '1', '1.50', '2015', '8', '16', '1439735661', null);
INSERT INTO `t_waterelect` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '202', '1', '4.50', '1', '1.50', '2015', '8', '16', '1439736318', '1439736420');
INSERT INTO `t_waterelect` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '203', '1', '4.50', '1', '1.50', '2015', '8', '18', '1439910483', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '201', '134', '4.50', '2506', '1.50', '2015', '6', '1', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '201', '138', '4.50', '2632', '1.50', '2015', '7', '1', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '201', '142', '4.50', '2817', '1.50', '2015', '8', '21', '1440151526', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '305', '135', '4.50', '1960', '1.50', '2015', '6', '24', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '305', '145', '4.50', '2159', '1.50', '2015', '7', '24', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '305', '149', '4.50', '2262', '1.50', '2015', '8', '25', '1440552596272', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '306', '100', '4.50', '1502', '1.50', '2015', '6', '1', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '306', '103', '4.50', '1538', '1.50', '2015', '7', '1', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '306', '105', '4.50', '1683', '1.50', '2015', '8', '1', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '401', '132', '4.50', '1538', '1.50', '2015', '6', '26', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '401', '132', '4.50', '1538', '1.50', '2015', '7', '26', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '402', '90', '4.50', '846', '1.50', '2015', '6', '10', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '402', '94', '4.50', '856', '1.50', '2015', '7', '10', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '402', '96', '4.50', '865', '1.50', '2015', '8', '10', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '403', '100', '4.50', '1530', '1.50', '2015', '6', '11', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '403', '102', '4.50', '1563', '1.50', '2015', '7', '11', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '403', '104', '4.50', '1605', '1.50', '2015', '8', '11', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '405', '95', '4.50', '1212', '1.50', '2015', '6', '15', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '405', '97', '4.50', '1303', '1.50', '2015', '7', '15', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '405', '100', '4.50', '1356', '1.50', '2015', '8', '15', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '406', '158', '4.50', '2339', '1.50', '2015', '6', '15', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '406', '160', '4.50', '2339', '1.50', '2015', '7', '15', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '406', '162', '4.50', '2393', '1.50', '2015', '8', '15', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '407', '103', '4.50', '1052', '1.50', '2015', '6', '15', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '407', '105', '4.50', '1070', '1.50', '2015', '7', '15', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '407', '114', '4.50', '1081', '1.50', '2015', '8', '15', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '408', '107', '4.50', '194', '1.50', '2015', '6', '10', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '408', '110', '4.50', '1987', '1.50', '2015', '7', '10', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '408', '109', '4.50', '2048', '1.50', '2015', '8', '10', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '409', '110', '4.50', '1370', '1.50', '2015', '6', '12', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '409', '112', '4.50', '1385', '1.50', '2015', '7', '12', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '409', '112', '4.50', '1410', '1.50', '2015', '8', '12', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '410', '95', '4.50', '299', '1.50', '2015', '6', '14', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '410', '96', '4.50', '373', '1.50', '2015', '7', '14', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '410', '98', '4.50', '435', '1.50', '2015', '8', '14', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '501', '99', '4.50', '2260', '1.50', '2015', '6', '15', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '501', '101', '4.50', '2357', '1.50', '2015', '7', '15', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '501', '105', '4.50', '2483', '1.50', '2015', '8', '15', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '502', '111', '4.50', '1810', '1.50', '2015', '6', '16', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '502', '113', '4.50', '1847', '1.50', '2015', '7', '16', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '502', '115', '4.50', '1916', '1.50', '2015', '8', '16', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '503', '135', '4.50', '1470', '1.50', '2015', '6', '14', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '503', '137', '4.50', '1512', '1.50', '2015', '7', '14', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '503', '139', '4.50', '1538', '1.50', '2015', '8', '14', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '505', '122', '4.50', '1782', '1.50', '2015', '6', '10', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '505', '124', '4.50', '1800', '1.50', '2015', '7', '10', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '505', '126', '4.50', '1813', '1.50', '2015', '8', '10', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '506', '150', '4.50', '1548', '1.50', '2015', '6', '12', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '506', '152', '4.50', '1598', '1.50', '2015', '7', '12', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '507', '132', '4.50', '1267', '1.50', '2015', '6', '10', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '507', '134', '4.50', '1284', '1.50', '2015', '7', '10', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '507', '136', '4.50', '1302', '1.50', '2015', '8', '10', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '508', '84', '4.50', '1384', '1.50', '2015', '6', '9', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '508', '86', '4.50', '1406', '1.50', '2015', '7', '9', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '509', '142', '4.50', '1351', '1.50', '2015', '6', '20', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '509', '144', '4.50', '1376', '1.50', '2015', '7', '20', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '509', '146', '4.50', '1394', '1.50', '2015', '8', '20', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '510', '126', '4.50', '760', '1.50', '2015', '6', '8', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '510', '129', '4.50', '811', '1.50', '2015', '7', '8', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '510', '133', '4.50', '995', '1.50', '2015', '8', '8', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '601', '109', '4.50', '379', '1.50', '2015', '6', '10', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '601', '111', '4.50', '398', '1.50', '2015', '7', '10', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '601', '113', '4.50', '411', '1.50', '2015', '8', '25', '1440481924364', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '602', '79', '4.50', '1204', '1.50', '2015', '6', '1', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '602', '82', '4.50', '1234', '1.50', '2015', '7', '2', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '603', '79', '4.50', '1188', '1.50', '2015', '6', '21', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '603', '81', '4.50', '1200', '1.50', '2015', '7', '21', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '603', '85', '4.50', '1319', '1.50', '2015', '8', '21', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '605', '94', '4.50', '1583', '1.50', '2015', '6', '30', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '605', '98', '4.50', '1661', '1.50', '2015', '7', '30', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '605', '100', '4.50', '1724', '1.50', '2015', '8', '25', '1440476489801', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '606', '122', '4.50', '1906', '1.50', '2015', '6', '10', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '606', '126', '4.50', '1932', '1.50', '2015', '7', '10', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '606', '138', '4.50', '1974', '1.50', '2015', '8', '10', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '607', '180', '4.50', '4918', '1.50', '2015', '6', '8', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '607', '182', '4.50', '4939', '1.50', '2015', '7', '8', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '607', '184', '4.50', '4952', '1.50', '2015', '8', '8', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '608', '114', '4.50', '1051', '1.50', '2015', '6', '20', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '608', '116', '4.50', '1081', '1.50', '2015', '7', '20', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '608', '118', '4.50', '1102', '1.50', '2015', '8', '20', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '609', '101', '4.50', '1630', '1.50', '2015', '6', '6', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '609', '103', '4.50', '1661', '1.50', '2015', '7', '6', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '609', '105', '4.50', '1683', '1.50', '2015', '8', '6', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '610', '124', '4.50', '1150', '1.50', '2015', '6', '20', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '610', '126', '4.50', '1165', '1.50', '2015', '7', '20', '0', null);
INSERT INTO `t_waterelect` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '610', '128', '4.50', '1186', '1.50', '2015', '8', '25', '1440481832077', null);

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
INSERT INTO `t_waterelect_cfg` VALUES ('2015', '1', '4.50', '1.50', '1438910815936', '0');
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
-- Table structure for t_waterelect_out
-- ----------------------------
DROP TABLE IF EXISTS `t_waterelect_out`;
CREATE TABLE `t_waterelect_out` (
  `coutid` varchar(45) NOT NULL,
  `houseid` varchar(45) NOT NULL,
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
  PRIMARY KEY (`coutid`,`houseid`,`roomno`,`year`,`month`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_waterelect_out
-- ----------------------------
INSERT INTO `t_waterelect_out` VALUES ('1e8798db-425e-11e5-94a1-c500579d0a7a', '89635a0e-418a-11e5-9172-fdf195657018', '303', '20', '4.50', '30', '1.50', '2015', '8', '14', '1439540771', null);
INSERT INTO `t_waterelect_out` VALUES ('3e7911de-4265-11e5-af19-ef176a2ffcbc', '89635a0e-418a-11e5-9172-fdf195657018', '100', '100', '4.50', '100', '1.50', '2015', '8', '14', '1439543831', null);
INSERT INTO `t_waterelect_out` VALUES ('4cb01c40-4268-11e5-a456-612d91f37c48', '89635a0e-418a-11e5-9172-fdf195657018', '131', '100', '4.50', '100', '1.50', '2015', '8', '14', '1439545143', null);
INSERT INTO `t_waterelect_out` VALUES ('a877b814-5cf1-11e5-ae11-dbbb5d8d7461', '89635a0e-418a-11e5-9172-fdf195657018', '203', '100', '4.50', '101', '1.50', '2015', '8', '17', '1442462868', null);
INSERT INTO `t_waterelect_out` VALUES ('a877b814-5cf1-11e5-ae11-dbbb5d8d7461', '89635a0e-418a-11e5-9172-fdf195657018', '203', '200', '4.50', '200', '1.50', '2015', '9', '17', '1442462868', null);

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
INSERT INTO `users` VALUES ('alex', '654321!abc', '1');
INSERT INTO `users` VALUES ('mkyong', '654321!abc', '1');
INSERT INTO `users` VALUES ('zouleihui', 'a123456', '1');
INSERT INTO `users` VALUES ('zouruijin', 'Rjzou123', '1');

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
INSERT INTO `user_houses` VALUES ('zouleihui', 'b8dadd82-44c7-11e5-b983-e3f00749665c');
INSERT INTO `user_houses` VALUES ('zouleihui', 'bff47e03-44c7-11e5-b983-9376a22d97c1');

-- ----------------------------
-- Table structure for user_profile
-- ----------------------------
DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE `user_profile` (
  `username` varchar(45) NOT NULL,
  `usermail` varchar(45) DEFAULT NULL,
  `expired` bigint(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created` bigint(32) NOT NULL,
  `updated` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_profile
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES ('2', 'mkyong', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('5', 'zouruijin', 'ROLE_ADMIN');
INSERT INTO `user_roles` VALUES ('3', 'alex', 'ROLE_USER');
INSERT INTO `user_roles` VALUES ('1', 'mkyong', 'ROLE_USER');
INSERT INTO `user_roles` VALUES ('7', 'zouleihui', 'ROLE_USER');
INSERT INTO `user_roles` VALUES ('6', 'zouruijin', 'ROLE_USER');

-- ----------------------------
-- View structure for v_room_money_last
-- ----------------------------
DROP VIEW IF EXISTS `v_room_money_last`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_room_money_last` AS select `t_room_money`.`houseid` AS `houseid`,`t_room_money`.`roomno` AS `roomno`,max(`t_room_money`.`year`) AS `last_year`,max(`t_room_money`.`month`) AS `last_month`,`t_room_money`.`day` AS `last_day` from `t_room_money` group by `t_room_money`.`houseid`,`t_room_money`.`roomno` ; ;

-- ----------------------------
-- View structure for v_room_money_out_last
-- ----------------------------
DROP VIEW IF EXISTS `v_room_money_out_last`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_room_money_out_last` AS select `t_room_money_out`.`houseid` AS `houseid`,`t_room_money_out`.`roomno` AS `roomno`,max(`t_room_money_out`.`year`) AS `last_year`,max(`t_room_money_out`.`month`) AS `last_month`,`t_room_money_out`.`day` AS `lastday` from `t_room_money_out` group by `t_room_money_out`.`houseid`,`t_room_money_out`.`roomno` ; ;

-- ----------------------------
-- View structure for v_waterelect_last
-- ----------------------------
DROP VIEW IF EXISTS `v_waterelect_last`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_waterelect_last` AS select `t_waterelect`.`houseid` AS `houseid`,`t_waterelect`.`roomno` AS `roomno`,max(`t_waterelect`.`year`) AS `last_year`,max(`t_waterelect`.`month`) AS `last_month`,`t_waterelect`.`day` AS `lastday` from `t_waterelect` group by `t_waterelect`.`houseid`,`t_waterelect`.`roomno` ; ;

-- ----------------------------
-- Procedure structure for p_checkin
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_checkin`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_checkin`(in v_houseid varchar(45),in v_roomno int,in v_customid varchar(45),in v_customname varchar(32),in v_iphone varchar(16),in v_cardid varchar(32),in v_monthmoney int,in v_pressmoney int,in v_roommoney int,in v_water int,in v_elect int,in v_ip varchar(16),in v_trash int,in v_keycount int,in v_keyprice int)
BEGIN
		declare result int default 0;
		declare v_waterprice decimal(8,2) default 0;
		declare v_electprice decimal(8,2) default 0;
		DECLARE EXIT HANDLER FOR SQLEXCEPTION  ROLLBACK;
		DECLARE EXIT HANDLER FOR SQLWARNING  ROLLBACK;
		set result = 0 ;
		START TRANSACTION;
		    
		    select waterprice,electprice into v_waterprice,v_electprice from t_waterelect_cfg where year = year(now()) and month = month(now());
		    
			insert into t_checkin(houseid,roomno,customid,trash,keycount,keyprice,year,month,day,created) 
				values(v_houseid,v_roomno,v_customid,v_trash,v_keycount,v_keyprice,year(now()),month(now()),day(now()),UNIX_TIMESTAMP(now()));
				
			insert into t_custom(id,customname,iphone,cardid,year,month,day,created) 
				values(v_customid,v_customname,v_iphone,v_cardid,year(now()),month(now()),day(now()),UNIX_TIMESTAMP(now()));
				
			insert into t_room_money(houseid,roomno,monthmoney,pressmoney,roommoney,year,month,day,created) 
				values(v_houseid,v_roomno,v_monthmoney,v_pressmoney,v_roommoney,year(now()),month(now()),day(now()),UNIX_TIMESTAMP(now()));
			
			insert into t_waterelect(houseid,roomno,water,waterprice,elect,electprice,year,month,day,created) 
				values(v_houseid,v_roomno,v_water,v_waterprice,v_elect,v_electprice,year(now()),month(now()),day(now()),UNIX_TIMESTAMP(now()));
			
			insert into t_net_cfg(houseid,roomno,ip,usr,pwd,netprice,year,month,day,created) 
				values(v_houseid,v_roomno,v_ip,'','',40,year(now()),month(now()),day(now()),UNIX_TIMESTAMP(now()));
			
		
			
		
				
			set result = 1;
		COMMIT;
		select result;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_check_out
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_check_out`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_check_out`(in v_cout_id varchar(45),in v_houseid varchar(45),in v_roomno int,in v_cout_money decimal(8,2))
BEGIN
		declare result int default 0;
		DECLARE EXIT HANDLER FOR SQLEXCEPTION  ROLLBACK;
		DECLARE EXIT HANDLER FOR SQLWARNING  ROLLBACK;
		set result = 0 ;
		START TRANSACTION;
		    -- 插入t_check_out表
			insert into t_checkout(id,houseid,roomno,customid,trash,keycount,keyprice,inyear,inmonth,inday,year,month,day,coutmoney,created)
			select v_cout_id,houseid,roomno,customid,trash,keycount,keyprice,year,month,day,year(now()),month(now()),day(now()),v_cout_money,UNIX_TIMESTAMP(now())
			from t_checkin where houseid = v_houseid and roomno = v_roomno;
			-- 插入t_room_money_out表
			insert into t_room_money_out(coutid,houseid,roomno,monthmoney,pressmoney,roommoney,year,month,day,created)
			select v_cout_id,houseid,roomno,monthmoney,pressmoney,roommoney,year,month,day,UNIX_TIMESTAMP(now())
			from t_room_money where houseid = v_houseid and roomno = v_roomno;
			-- 插入t_waterelect_out表
			insert into t_waterelect_out(coutid,houseid,roomno,water,waterprice,elect,electprice,year,month,day,created)
			select v_cout_id,houseid,roomno,water,waterprice,elect,electprice,year,month,day,UNIX_TIMESTAMP(now())
			from t_waterelect  where houseid = v_houseid and roomno = v_roomno;
			-- 插入t_net_cfg_out表
			insert into t_net_cfg_out(coutid,houseid,roomno,ip,usr,pwd,netprice,year,month,day,created)
			select v_cout_id,houseid,roomno,ip,usr,pwd,netprice,year,month,day,UNIX_TIMESTAMP(now())
			from t_net_cfg  where houseid = v_houseid and roomno = v_roomno;
			-- 删除退房的 t_checkin 表数据
			delete from t_checkin where houseid = v_houseid and roomno = v_roomno;
			-- 删除 t_room_money 数据
			delete from t_room_money where  houseid = v_houseid and roomno = v_roomno;
			-- 删除 t_waterelect 数据
			delete from t_waterelect where  houseid = v_houseid and roomno = v_roomno;
			-- 删除 t_net_cfg 数据
			delete from t_net_cfg where  houseid = v_houseid and roomno = v_roomno;	
			
			set result = 1;
		COMMIT;
		select result;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_get_room_checkout_tongji
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_get_room_checkout_tongji`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_get_room_checkout_tongji`(in v_username varchar(16))
BEGIN
		declare v_full_room_count int default 0;
		declare v_today_checkin_room_count int default 0;
		declare v_today_checkout_room_count int default 0;
		select count(1) into v_full_room_count from t_room as r 
				where (r.houseid,r.roomno) in 
				 (select ci.houseid,ci.roomno from t_checkin as ci)
				and r.houseid in(select houseid from user_houses where username = v_username);
	
		select count(1) into v_today_checkin_room_count from t_checkin as ci 
				where ci.year = year(now()) 
				and ci.month = month(now()) 
				and ci.day = day(now())
				and ci.houseid in(select houseid from user_houses where username = v_username);	

		select count(1) into v_today_checkout_room_count  from t_checkout as co 
				where co.year = year(now()) 
				and co.month = month(now()) 
				and co.day = day(now())
				and co.houseid in(select houseid from user_houses where username = v_username);

		select v_full_room_count,v_today_checkout_room_count,v_today_checkin_room_count;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_get_room_tongji
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_get_room_tongji`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_get_room_tongji`(in v_username varchar(16))
BEGIN
		declare v_empty_room_count int default 0;
		declare v_today_checkin_room_count int default 0;
		declare v_today_checkout_room_count int default 0;
		select count(1) into v_empty_room_count from t_room as r 
				where (r.houseid,r.roomno) not in 
				 (select ci.houseid,ci.roomno from t_checkin as ci)
				and r.houseid in(select houseid from user_houses where username = v_username);
	
		select count(1) into v_today_checkin_room_count from t_checkin as ci 
				where ci.year = year(now()) 
				and ci.month = month(now()) 
				and ci.day = day(now())
				and ci.houseid in(select houseid from user_houses where username = v_username);	

		select count(1) into v_today_checkout_room_count  from t_checkout as co 
				where co.year = year(now()) 
				and co.month = month(now()) 
				and co.day = day(now())
				and co.houseid in(select houseid from user_houses where username = v_username);

		select v_empty_room_count,v_today_checkin_room_count,v_today_checkout_room_count;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for p_insert_checkin
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_insert_checkin`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insert_checkin`(in v_houseid varchar(45),in v_roomno int,in v_customid varchar(45),in v_customname varchar(32),in v_iphone varchar(16),in v_cardid varchar(32),in v_monthmoney int,in v_pressmoney int,in v_roommoney int,in v_water int,in v_elect int,in v_ip varchar(16),in v_trash int,in v_keycount int,in v_keyprice int)
BEGIN
		declare result int default 0;
		declare v_waterprice decimal(8,2) default 0;
		declare v_electprice decimal(8,2) default 0;
		DECLARE EXIT HANDLER FOR SQLEXCEPTION  ROLLBACK;
		DECLARE EXIT HANDLER FOR SQLWARNING  ROLLBACK;
		set result = 0 ;
		START TRANSACTION;
		    
		    select waterprice,electprice into v_waterprice,v_electprice from t_waterelect_cfg where year = year(now()) and month = month(now());
		    
			insert into t_checkin(houseid,roomno,customid,trash,keycount,keyprice,year,month,day,created) 
				values(v_houseid,v_roomno,v_customid,v_trash,v_keycount,v_keyprice,year(now()),month(now()),day(now()),UNIX_TIMESTAMP(now()));
				
			insert into t_custom(id,customname,iphone,cardid,year,month,day,created) 
				values(v_customid,v_customname,v_iphone,v_cardid,year(now()),month(now()),day(now()),UNIX_TIMESTAMP(now()));
				
			insert into t_room_money(houseid,roomno,monthmoney,pressmoney,roommoney,year,month,day,created) 
				values(v_houseid,v_roomno,v_monthmoney,v_pressmoney,v_roommoney,year(now()),month(now()),day(now()),UNIX_TIMESTAMP(now()));
			
			insert into t_waterelect(houseid,roomno,water,waterprice,elect,electprice,year,month,day,created) 
				values(v_houseid,v_roomno,v_water,v_waterprice,v_elect,v_electprice,year(now()),month(now()),day(now()),UNIX_TIMESTAMP(now()));
			
			insert into t_net_cfg(houseid,roomno,ip,usr,pwd,netprice,year,month,day,created) 
				values(v_houseid,v_roomno,v_ip,'','',40,year(now()),month(now()),day(now()),UNIX_TIMESTAMP(now()));
				
			set result = 1;
		COMMIT;
		select result;
END
;;
DELIMITER ;

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

-- ----------------------------
-- Procedure structure for p_update_checkin
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_update_checkin`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_update_checkin`(in v_houseid varchar(45),in v_roomno int,in v_customid varchar(45),in v_customname varchar(32),in v_iphone varchar(16),in v_cardid varchar(32),in v_monthmoney int,in v_pressmoney int,in v_roommoney int,in v_water int,in v_elect int,in v_ip varchar(16),in v_trash int,in v_keycount int,in v_keyprice int)
BEGIN
		declare result int default 0;
		
		DECLARE EXIT HANDLER FOR SQLEXCEPTION  ROLLBACK;
		DECLARE EXIT HANDLER FOR SQLWARNING  ROLLBACK;
		set result = 0 ;
		START TRANSACTION;
		    
		    update t_checkin set trash = v_trash,keycount = v_keycount,keyprice = v_keyprice,updated = UNIX_TIMESTAMP(now())
		    	where houseid = v_houseid and roomno = v_roomno;
			
			update t_custom set customname = v_customname,iphone = v_iphone,cardid = v_cardid,updated = UNIX_TIMESTAMP(now())
				where id = v_customid;
			
			update t_room_money set monthmoney = v_monthmoney,pressmoney = v_pressmoney, roommoney = v_roommoney ,updated = UNIX_TIMESTAMP(now())
				where houseid = v_houseid and roomno = v_roomno;

			update t_waterelect set water = v_water,elect = v_elect,updated = UNIX_TIMESTAMP(now())
				where houseid = v_houseid and roomno = v_roomno;

			update t_net_cfg set ip = v_ip,updated = UNIX_TIMESTAMP(now())
				where houseid = v_houseid and roomno = v_roomno;
				
			set result = 1;
		COMMIT;
		select result;
END
;;
DELIMITER ;
