-- $Id: declubify.sql,v 1.1 2007/07/17 20:00:30 swain Exp $
-- delete all the shopping carts

DELIMITER $$

DROP PROCEDURE IF EXISTS declubme $$

CREATE PROCEDURE declubme()
BEGIN

delete from prem_packages_history where customer_id= (select userid from users where username='swain');
update users set status=1, package_type=0 where username='swain';

END$$



DROP PROCEDURE IF EXISTS reclubme $$

CREATE PROCEDURE reclubme()
BEGIN

select @userid := userid from users where username='swain';
insert into prem_packages_history (packages_history_id, customer_id, products_id, date, start_date, expire_date) values(NULL, @userid, 148, now(), now(), DATE_ADD( curdate(), interval 365 day));
select @pphid := packages_history_id from prem_packages_history where customer_id=@userid;
update users set package_type=@pphid, status=9 where username='swain';

END$$

DELIMITER ;