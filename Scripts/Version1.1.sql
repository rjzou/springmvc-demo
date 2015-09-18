/**
 * 2015-08-18 14:22 已更新服务器
 */
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


/**
 * 显示退房最后一次收租信息
 */
DROP VIEW IF EXISTS v_room_money_out_last;
CREATE VIEW v_room_money_out_last AS 
select houseid,roomno,max(year) as last_year,max(month) as last_month,day as lastday from t_room_money_out 
group by houseid,roomno;