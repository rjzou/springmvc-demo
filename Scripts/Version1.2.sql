/**
 * 2015-08-21 21:25 已更新服务器
 */

/**
 * p_get_room_checkout_tongji 统计  在住x间, 今天退房x间, 今天入住x间  
 * call p_get_room_checkout_tongji
 */
DELIMITER $$
DROP PROCEDURE IF EXISTS p_get_room_checkout_tongji $$
CREATE PROCEDURE p_get_room_checkout_tongji(in v_username varchar(16))
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
END $$
DELIMITER ;