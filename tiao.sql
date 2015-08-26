/*
Navicat MySQL Data Transfer

Source Server         : Singapore-boss
Source Server Version : 50544
Source Host           : localhost:3306
Source Database       : tiao

Target Server Type    : MYSQL
Target Server Version : 50544
File Encoding         : 65001

Date: 2015-08-26 09:47:53
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
INSERT INTO `persistent_logins` VALUES ('zouleihui', 'JeQ1fy06y6LjIg3PxwsCTg==', 'SRRtmpLVVTKdu5TSoLGojw==', '2015-08-26 01:28:04');
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
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '201', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '40', '2015', '8', '21', '1440151526', null);
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '202', '69f376e6-4425-11e5-8dbc-135e963d3b8c', '10', '2', '10', '2015', '8', '16', '1439736318', '1439736420');
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '203', 'e53c361e-45ba-11e5-90c7-8f68044e1257', '10', '2', '10', '2015', '8', '18', '1439910483', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '305', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '24', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '306', 'e24c66c1-4423-11e5-ae2a-8fe22c727244', '10', '2', '10', '2015', '6', '1', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '350', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '12', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '401', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '26', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '402', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '10', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '403', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '11', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '405', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '15', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '406', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '15', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '407', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '15', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '408', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '10', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '409', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '12', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '410', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '14', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '501', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '15', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '502', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '16', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '503', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '14', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '505', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '10', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '507', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '10', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '508', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '9', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '509', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '20', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '510', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '8', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '601', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '6', '10', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '603', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '21', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '605', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '30', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '606', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '10', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '607', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '8', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '608', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '20', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '609', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '6', '0', null);
INSERT INTO `t_checkin` VALUES ('b8dadd82-44c7-11e5-b983-e3f00749665c', '610', '24e5c561-47ec-11e5-936c-2de2a2fbfcfd', '10', '2', '10', '2015', '8', '20', '0', null);

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
