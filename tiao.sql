/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50542
 Source Host           : localhost
 Source Database       : tiao

 Target Server Type    : MySQL
 Target Server Version : 50542
 File Encoding         : utf-8

 Date: 08/15/2015 00:30:12 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `persistent_logins`
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
--  Records of `persistent_logins`
-- ----------------------------
BEGIN;
INSERT INTO `persistent_logins` VALUES ('zouruijin', 'ao2fvKH5Evz38HDdmNnDbA==', '5s+89gf+dfpKQM+SYWYBCg==', '2015-08-15 00:17:13'), ('zouruijin', 'RvzTxXSJIeJMpCyXD6j0Mw==', 'yn60o45IooxR1tyi7WJ98Q==', '2015-08-14 11:23:08'), ('zouruijin', 'SSeJgZhKz4ulXMmKgMJi1w==', 'f4pkHXbWceZG3TbtXFxDhQ==', '2015-08-15 00:00:32'), ('zouruijin', 'tmKTsafNpQ14FySJsw61wg==', 'CgnuVQwS1MRGOcUsQLkPGw==', '2015-08-14 17:34:40');
COMMIT;

-- ----------------------------
--  Table structure for `t_checkin`
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
--  Records of `t_checkin`
-- ----------------------------
BEGIN;
INSERT INTO `t_checkin` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '100', 'eclipse', '17722677503', '362203198611176811', '0', '0', '0', '0', '0', null, '10', '2', '10', '2015', '8', '15', '1439569545418', null), ('89635a0e-418a-11e5-9172-fdf195657018', '103', 'eclipse2', '17722671560', '362203198611176812', '0', '0', '0', '0', '0', null, '10', '2', '10', '2015', '8', '15', '1439569623716', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_checkout`
-- ----------------------------
DROP TABLE IF EXISTS `t_checkout`;
CREATE TABLE `t_checkout` (
  `id` varchar(45) NOT NULL,
  `houseid` varchar(45) NOT NULL,
  `roomno` int(8) NOT NULL,
  `customname` varchar(32) NOT NULL,
  `iphone` varchar(16) NOT NULL,
  `cardid` varchar(32) NOT NULL,
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
--  Records of `t_checkout`
-- ----------------------------
BEGIN;
INSERT INTO `t_checkout` VALUES ('1e8798db-425e-11e5-94a1-c500579d0a7a', '89635a0e-418a-11e5-9172-fdf195657018', '303', 'javamelody', '1311224101', '33333333', '10', '2', '10', '2015', '8', '14', '2015', '8', '14', '-99999.00', '1439540771', null), ('3e7911de-4265-11e5-af19-ef176a2ffcbc', '89635a0e-418a-11e5-9172-fdf195657018', '100', 'springmvc', '17722671560', '362203198621176811', '10', '2', '10', '2015', '8', '9', '2015', '8', '14', '-20.00', '1439543831', null), ('4cb01c40-4268-11e5-a456-612d91f37c48', '89635a0e-418a-11e5-9172-fdf195657018', '131', 'mysql', '17722677510', '362203198621176812', '10', '2', '10', '2015', '8', '14', '2015', '8', '14', '130.00', '1439545143', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_custom`
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
--  Records of `t_custom`
-- ----------------------------
BEGIN;
INSERT INTO `t_custom` VALUES ('1d57f743-42a1-11e5-a693-73e8fed79601', 'eclipse', '17722677503', '362203198611176811', '2015', '8', '15', '1439569545420', null), ('45fd1634-42a1-11e5-a693-f7a807b3b745', 'eclipse2', '17722671560', '362203198611176812', '2015', '8', '15', '1439569623718', null), ('4d04d1d2-42a0-11e5-a693-e1398864253a', 'anguler', '17722677503', '362203198611171122', '2015', '8', '15', '1439569201399', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_house`
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
--  Records of `t_house`
-- ----------------------------
BEGIN;
INSERT INTO `t_house` VALUES ('3d023159-419e-11e5-9dd8-bbf8b2aae6dc', '新楼', '', '1439458359', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '1栋楼', '', '1439449897', null), ('97c2b41f-418a-11e5-9172-ade6bde32708', '2栋楼', '', '1439449921', '1439449933885');
COMMIT;

-- ----------------------------
--  Table structure for `t_net_cfg`
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
--  Records of `t_net_cfg`
-- ----------------------------
BEGIN;
INSERT INTO `t_net_cfg` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '100', '', null, null, '40', '2015', '8', '15', '1439569545420', null), ('89635a0e-418a-11e5-9172-fdf195657018', '103', '', null, null, '40', '2015', '8', '15', '1439569623718', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_net_cfg_out`
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
--  Records of `t_net_cfg_out`
-- ----------------------------
BEGIN;
INSERT INTO `t_net_cfg_out` VALUES ('1e8798db-425e-11e5-94a1-c500579d0a7a', '89635a0e-418a-11e5-9172-fdf195657018', '303', '', null, null, '40', '2015', '8', '14', '1439540771', null), ('3e7911de-4265-11e5-af19-ef176a2ffcbc', '89635a0e-418a-11e5-9172-fdf195657018', '100', '', null, null, '40', '2015', '8', '14', '1439543831', null), ('4cb01c40-4268-11e5-a456-612d91f37c48', '89635a0e-418a-11e5-9172-fdf195657018', '131', '', null, null, '40', '2015', '8', '14', '1439545143', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_room`
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
--  Records of `t_room`
-- ----------------------------
BEGIN;
INSERT INTO `t_room` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '100', '90', '50', 'danjian', '', '1438669454344', '1438669570536'), ('89635a0e-418a-11e5-9172-fdf195657018', '102', '200', '150', 'yifangyiting', 'abc', '0', '1439196731501'), ('89635a0e-418a-11e5-9172-fdf195657018', '103', '220', '150', 'danjian', '', '0', '1439196757788'), ('89635a0e-418a-11e5-9172-fdf195657018', '104', '180', '100', 'danjian', '', '0', '1439365267702'), ('89635a0e-418a-11e5-9172-fdf195657018', '131', '320', '200', 'danjian', 'abcde', '1438656389780', '1439544093435'), ('89635a0e-418a-11e5-9172-fdf195657018', '201', '200', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '202', '200', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '203', '230', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '204', '240', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '205', '200', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '206', '200', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '301', '300', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '302', '300', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '303', '300', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '304', '300', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '305', '300', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '306', '310', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '307', '320', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '308', '310', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '309', '300', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '401', '310', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '402', '320', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '403', '330', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '404', '300', '0', 'danjian', null, '0', '0'), ('89635a0e-418a-11e5-9172-fdf195657018', '907', '210', '0', 'danjian', null, '1438591469784', null), ('89635a0e-418a-11e5-9172-fdf195657018', '908', '200', '0', 'danjian', null, '1438591324338', null), ('89635a0e-418a-11e5-9172-fdf195657018', '909', '200', '0', 'danjian', null, '1438591164091', null), ('97c2b41f-418a-11e5-9172-ade6bde32708', '101', '500', '300', 'yifangyiting', '', '1439451032862', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_room_money`
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
  `day` int(8) NOT NULL,
  `created` bigint(32) NOT NULL,
  `updated` bigint(32) DEFAULT NULL,
  PRIMARY KEY (`houseid`,`roomno`,`year`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_room_money`
-- ----------------------------
BEGIN;
INSERT INTO `t_room_money` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '100', '90', '50', '210.00', '2015', '8', '15', '1439569545420', null), ('89635a0e-418a-11e5-9172-fdf195657018', '103', '220', '150', '440.00', '2015', '8', '15', '1439569623718', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_room_money_out`
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
--  Records of `t_room_money_out`
-- ----------------------------
BEGIN;
INSERT INTO `t_room_money_out` VALUES ('1e8798db-425e-11e5-94a1-c500579d0a7a', '89635a0e-418a-11e5-9172-fdf195657018', '303', '300', '200', '570.00', '2015', '8', '14', '1439540771', null), ('3e7911de-4265-11e5-af19-ef176a2ffcbc', '89635a0e-418a-11e5-9172-fdf195657018', '100', '90', '50', '210.00', '2015', '8', '9', '1439543831', null), ('4cb01c40-4268-11e5-a456-612d91f37c48', '89635a0e-418a-11e5-9172-fdf195657018', '131', '320', '200', '590.00', '2015', '8', '14', '1439545143', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_room_type`
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
--  Records of `t_room_type`
-- ----------------------------
BEGIN;
INSERT INTO `t_room_type` VALUES ('danjian', '单间', null, '0', null), ('yifangyiting', '一房一厅', null, '0', null), ('liangfangyiting', '两房一厅', null, '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_waterelect`
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
--  Records of `t_waterelect`
-- ----------------------------
BEGIN;
INSERT INTO `t_waterelect` VALUES ('89635a0e-418a-11e5-9172-fdf195657018', '100', '1', '4.50', '1', '1.50', '2015', '8', '15', '1439569545420', null), ('89635a0e-418a-11e5-9172-fdf195657018', '103', '2', '4.50', '2', '1.50', '2015', '8', '15', '1439569623718', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_waterelect_cfg`
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
--  Records of `t_waterelect_cfg`
-- ----------------------------
BEGIN;
INSERT INTO `t_waterelect_cfg` VALUES ('2014', '12', '4.50', '1.50', '0', '0'), ('2015', '1', '4.50', '1.60', '1438910815936', '0'), ('2015', '2', '4.50', '1.50', '1438910815936', '0'), ('2015', '3', '4.50', '1.50', '1438910815936', '0'), ('2015', '4', '4.50', '1.50', '1438910815936', '0'), ('2015', '5', '4.50', '1.50', '1438910815936', '0'), ('2015', '6', '4.50', '1.50', '1438910815936', '0'), ('2015', '7', '4.50', '1.50', '1438910815936', '0'), ('2015', '8', '4.50', '1.50', '1438910815936', '0'), ('2015', '9', '4.50', '1.50', '1438910815936', '0'), ('2015', '10', '4.50', '1.50', '1438910815936', '0'), ('2015', '11', '4.50', '1.50', '1438910815936', '0'), ('2015', '12', '4.50', '1.50', '1438910815936', '0'), ('2016', '1', '4.50', '1.50', '1438910833006', '0'), ('2016', '2', '4.50', '1.50', '1438910833006', '0'), ('2016', '3', '4.50', '1.50', '1438910833006', '0'), ('2016', '4', '4.50', '1.50', '1438910833006', '0'), ('2016', '5', '4.50', '1.50', '1438910833006', '0'), ('2016', '6', '4.50', '1.50', '1438910833006', '0'), ('2016', '7', '4.50', '1.50', '1438910833006', '0'), ('2016', '8', '4.50', '1.50', '1438910833006', '0'), ('2016', '9', '4.50', '1.50', '1438910833006', '0'), ('2016', '10', '4.50', '1.50', '1438910833006', '0'), ('2016', '11', '4.50', '1.50', '1438910833006', '0'), ('2016', '12', '4.50', '1.50', '1438910833006', '0');
COMMIT;

-- ----------------------------
--  Table structure for `t_waterelect_out`
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
--  Records of `t_waterelect_out`
-- ----------------------------
BEGIN;
INSERT INTO `t_waterelect_out` VALUES ('1e8798db-425e-11e5-94a1-c500579d0a7a', '89635a0e-418a-11e5-9172-fdf195657018', '303', '20', '4.50', '30', '1.50', '2015', '8', '14', '1439540771', null), ('3e7911de-4265-11e5-af19-ef176a2ffcbc', '89635a0e-418a-11e5-9172-fdf195657018', '100', '100', '4.50', '100', '1.50', '2015', '8', '14', '1439543831', null), ('4cb01c40-4268-11e5-a456-612d91f37c48', '89635a0e-418a-11e5-9172-fdf195657018', '131', '100', '4.50', '100', '1.50', '2015', '8', '14', '1439545143', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_waterelectout`
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
--  Table structure for `user_houses`
-- ----------------------------
DROP TABLE IF EXISTS `user_houses`;
CREATE TABLE `user_houses` (
  `username` varchar(45) DEFAULT NULL,
  `houseid` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user_houses`
-- ----------------------------
BEGIN;
INSERT INTO `user_houses` VALUES ('zouruijin', '89635a0e-418a-11e5-9172-fdf195657018'), ('zouruijin', '97c2b41f-418a-11e5-9172-ade6bde32708'), ('mkyong', '3d023159-419e-11e5-9dd8-bbf8b2aae6dc');
COMMIT;

-- ----------------------------
--  Table structure for `user_roles`
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
--  Records of `user_roles`
-- ----------------------------
BEGIN;
INSERT INTO `user_roles` VALUES ('2', 'mkyong', 'ROLE_ADMIN'), ('5', 'zouruijin', 'ROLE_ADMIN'), ('3', 'alex', 'ROLE_USER'), ('1', 'mkyong', 'ROLE_USER'), ('6', 'zouruijin', 'ROLE_USER');
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('alex', '123456', '1'), ('mkyong', '654321', '1'), ('zouruijin', '654321', '1');
COMMIT;

-- ----------------------------
--  View structure for `v_room_money_last`
-- ----------------------------
DROP VIEW IF EXISTS `v_room_money_last`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_room_money_last` AS select `t_room_money`.`houseid` AS `houseid`,`t_room_money`.`roomno` AS `roomno`,max(`t_room_money`.`year`) AS `last_year`,max(`t_room_money`.`month`) AS `last_month`,`t_room_money`.`day` AS `lastday` from `t_room_money` group by `t_room_money`.`houseid`,`t_room_money`.`roomno`;

-- ----------------------------
--  View structure for `v_waterelect_last`
-- ----------------------------
DROP VIEW IF EXISTS `v_waterelect_last`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_waterelect_last` AS select `t_waterelect`.`houseid` AS `houseid`,`t_waterelect`.`roomno` AS `roomno`,max(`t_waterelect`.`year`) AS `last_year`,max(`t_waterelect`.`month`) AS `last_month`,`t_waterelect`.`day` AS `lastday` from `t_waterelect` group by `t_waterelect`.`houseid`,`t_waterelect`.`roomno`;

-- ----------------------------
--  Procedure structure for `p_check_out`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_check_out`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_check_out`(v_cout_id varchar(45),in v_houseid varchar(45),in v_roomno int,in v_cout_money decimal(8,2))
BEGIN
		declare result int default 0;
		DECLARE EXIT HANDLER FOR SQLEXCEPTION  ROLLBACK;
		DECLARE EXIT HANDLER FOR SQLWARNING  ROLLBACK;
		set result = 0 ;
		START TRANSACTION;
		    -- 插入t_check_out表
			insert into t_checkout(id,houseid,roomno,customname,iphone,cardid,trash,keycount,keyprice,inyear,inmonth,inday,year,month,day,coutmoney,created)
			select v_cout_id,houseid,roomno,customname,iphone,cardid,trash,keycount,keyprice,year,month,day,year(now()),month(now()),day(now()),v_cout_money,UNIX_TIMESTAMP(now())
			from t_checkin where houseid = v_houseid and roomno = v_roomno;
			-- 插入t_room_money_out表
			insert into t_room_money_out(coutid,houseid,roomno,monthmoney,pressmoney,roommoney,year,month,day,created)
			select v_cout_id,houseid,roomno,monthmoney,pressmoney,roommoney,year,month,day,UNIX_TIMESTAMP(now())
			from t_room_money where houseid = v_houseid and roomno = v_roomno;
			-- 插入t_waterelect_out表
			insert into t_waterelect_out(coutid,houseid,roomno,water,waterprice,elect,electprice,year,month,day,created)
			select v_cout_id,houseid,roomno,water,waterprice,elect,electprice,year(now()),month(now()),day(now()),UNIX_TIMESTAMP(now())
			from t_waterelect  where houseid = v_houseid and roomno = v_roomno;
			-- 插入t_net_cfg_out表
			insert into t_net_cfg_out(coutid,houseid,roomno,ip,usr,pwd,netprice,year,month,day,created)
			select v_cout_id,houseid,roomno,ip,usr,pwd,netprice,year(now()),month(now()),day(now()),UNIX_TIMESTAMP(now())
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
delimiter ;

-- ----------------------------
--  Procedure structure for `p_get_room_tongji`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_get_room_tongji`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_get_room_tongji`()
BEGIN
		declare v_empty_room_count int default 0;
		declare v_today_checkin_room_count int default 0;
		declare v_today_checkout_room_count int default 0;
		select count(1) into v_empty_room_count from t_room as r 
				where (r.houseid,r.roomno) not in 
				 (select ci.houseid,ci.roomno from t_checkin as ci);
			
		select count(1) into v_today_checkin_room_count from t_checkin as ci where ci.year = year(now()) and ci.month = month(now()) and ci.day = day(now());	
		select count(1) into v_today_checkout_room_count  from t_checkout as co where co.year = year(now()) and co.month = month(now()) and co.day = day(now());

		select v_empty_room_count,v_today_checkin_room_count,v_today_checkout_room_count;
END
 ;;
delimiter ;

-- ----------------------------
--  Procedure structure for `p_insert_houses`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_insert_houses`;
delimiter ;;
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
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
