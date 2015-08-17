/**
 * p_get_room_tongji 统计  还有空房x间, 今天入住x间, 今天退房x间  
 * call p_get_room_tongji
 */
DELIMITER $$
DROP PROCEDURE IF EXISTS p_get_room_tongji $$
CREATE PROCEDURE p_get_room_tongji(in v_username varchar(16))
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
END $$
DELIMITER ;

/**
 * p_check_out 退房操作
 * call p_check_out(cout_id,houseid,roomno)
 */
DELIMITER $$
DROP PROCEDURE IF EXISTS p_check_out $$
CREATE PROCEDURE p_check_out(in v_cout_id varchar(45),in v_houseid varchar(45),in v_roomno int,in v_cout_money decimal(8,2))
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
END $$
DELIMITER ;
