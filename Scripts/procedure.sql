
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

/**
 * p_insert_checkin 插入存储过程 
 * call p_insert_checkin();
 */
DELIMITER $$
DROP PROCEDURE IF EXISTS p_insert_checkin $$
CREATE PROCEDURE p_insert_checkin(in v_houseid varchar(45),in v_roomno int,in v_customid varchar(45),in v_customname varchar(32),in v_iphone varchar(16),in v_cardid varchar(32),in v_monthmoney int,in v_pressmoney int,in v_roommoney int,in v_water int,in v_elect int,in v_ip varchar(16),in v_trash int,in v_keycount int,in v_keyprice int)
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
END $$
DELIMITER ;


/**
 * p_update_checkin 修改存储过程 
 * call p_update_checkin();
 */
DELIMITER $$
DROP PROCEDURE IF EXISTS p_update_checkin $$
CREATE PROCEDURE p_update_checkin(in v_houseid varchar(45),in v_roomno int,in v_customid varchar(45),in v_customname varchar(32),in v_iphone varchar(16),in v_cardid varchar(32),in v_monthmoney int,in v_pressmoney int,in v_roommoney int,in v_water int,in v_elect int,in v_ip varchar(16),in v_trash int,in v_keycount int,in v_keyprice int)
BEGIN
		declare result int default 0;
		
		DECLARE EXIT HANDLER FOR SQLEXCEPTION  ROLLBACK;
		DECLARE EXIT HANDLER FOR SQLWARNING  ROLLBACK;
		set result = 0 ;
		START TRANSACTION;
		    
		    update t_checkin set trash = v_trash,keycount = v_keycount,keyprice = v_keyprcie, updated = UNIX_TIMESTAMP(now())
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
END $$
DELIMITER ;
