
/**
 * p_insert_houses 新增houses 存储过程
 * call p_insert_houses('xxxxxx','zouruijin','abcd','',@id);
 */
DELIMITER $$
DROP PROCEDURE IF EXISTS p_insert_houses $$
CREATE PROCEDURE p_insert_houses(in v_id varchar(45),in v_username varchar(45),in v_housename varchar(45),in v_description varchar(45))
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
END $$
DELIMITER ;


/**
 * p_get_room_tongji 统计  还有空房x间, 今天入住x间, 今天退房x间  
 * call p_get_room_tongji
 */
DELIMITER $$
DROP PROCEDURE IF EXISTS p_get_room_tongji $$
CREATE PROCEDURE p_get_room_tongji()
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
END $$
DELIMITER ;

/**
 * 显示最后一次收租信息
 */
DROP VIEW IF EXISTS v_room_money_last;
CREATE VIEW v_room_money_last AS 
select houseid,roomno,max(year) as last_year,max(month) as last_month,day as lastday from t_room_money 
group by houseid,roomno;

/**
 * 显示最后一次抄表信息
 */
DROP VIEW IF EXISTS v_waterelect_last;
CREATE VIEW v_waterelect_last AS 
select houseid,roomno,max(year) as last_year,max(month) as last_month,day as lastday from t_waterelect
group by houseid,roomno;

/**
 * p_check_out 退房操作
 * call p_check_out(cout_id,houseid,roomno)
 */
DELIMITER $$
DROP PROCEDURE IF EXISTS p_check_out $$
CREATE PROCEDURE p_check_out(v_cout_id varchar(45),in v_houseid varchar(45),in v_roomno int,in v_cout_money decimal(8,2))
BEGIN
		declare result int default 0;
		DECLARE EXIT HANDLER FOR SQLEXCEPTION  ROLLBACK;
		DECLARE EXIT HANDLER FOR SQLWARNING  ROLLBACK;
		set result = 0 ;
		START TRANSACTION;
		    -- 插入t_check_out表
			insert into t_checkout(id,houseid,roomno,customname,iphone,cardid,trash,keycount,keyprice,year,month,day,coutmoney,created)
			select v_cout_id,houseid,roomno,customname,iphone,cardid,trash,keycount,keyprice,year,month,day,v_cout_money,UNIX_TIMESTAMP(now())
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
END $$
DELIMITER ;



