DELIMITER $$

DROP PROCEDURE IF EXISTS fix_userids
$$

CREATE PROCEDURE fix_userids()
READS SQL DATA
BEGIN
 DECLARE u_userid INT(10) UNSIGNED;
 DECLARE u_username VARCHAR(30);
 DECLARE done INT DEFAULT 0;

 DECLARE cur1 CURSOR FOR 
   SELECT userid, username FROM users;

 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;

 

 OPEN cur1;
 user_loop:LOOP
        FETCH cur1 INTO u_userid, u_username;
        IF done=1 THEN
                LEAVE user_loop;
        END IF;

        UPDATE mpa_albumitems SET userid=u_userid WHERE username = u_username;
        END loop user_loop;
END;

$$

DELIMITER ;