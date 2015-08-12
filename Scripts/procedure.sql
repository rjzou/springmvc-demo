DELIMITER $$
DROP PROCEDURE IF EXISTS p_insert_houses $$
CREATE PROCEDURE p_insert_houses(in v_username varchar(45),in v_housename varchar(45),in v_description varchar(45),out oid int)
BEGIN
  insert into t_house(housename,description) values(v_housename,v_description);
  select max(id) from user into oid;
  select oid;
END $$
DELIMITER ;
?
1
call test('gg',@id);