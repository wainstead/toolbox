-- the point here is to delete the customer who bought an
-- autorenewable club membership; this account was created while
-- running "utlimate_test.lhh" via my perl script "lhhreplay.pl". --sw

-- this chunk was taken out of my work log; something I solved long
-- ago... it forms the basis of this stored procedure:

-- select @id := customers_id from osc_customers where customers_email_address='mister@test.myphotodevel.com';
-- delete from osc_orders_products where orders_id in (select orders_id from osc_orders where customers_id = @id);
-- delete from osc_orders_products_attributes where orders_id in (select orders_id from osc_orders where customers_id = @id);
-- delete from osc_orders_total where orders_id in (select orders_id from osc_orders where customers_id = @id);
-- delete from osc_orders_status_history where orders_id in (select orders_id from osc_orders where customers_id = @id);
-- delete from osc_orders where customers_id = @id;
-- delete from osc_session_info where customers_id=@id;
-- delete from osc_address_book where customers_id = @id;
-- delete from osc_customers_basket where customers_id=@id;
-- delete from osc_customers where customers_id=@id;



DELIMITER $$

DROP PROCEDURE IF EXISTS delete_autorenew_customer $$

CREATE PROCEDURE delete_autorenew_customer()
BEGIN

DECLARE ultimatetest_cust_id INT;

SELECT customers_id INTO ultimatetest_cust_id FROM osc_customers WHERE customers_email_address = 'joebanks@test.myphotodevel.com';

delete from osc_orders_products            where orders_id in (select orders_id from osc_orders where customers_id = ultimatetest_cust_id);
delete from osc_orders_products_attributes where orders_id in (select orders_id from osc_orders where customers_id = ultimatetest_cust_id);
delete from osc_orders_total               where orders_id in (select orders_id from osc_orders where customers_id = ultimatetest_cust_id);
delete from osc_orders_status_history      where orders_id in (select orders_id from osc_orders where customers_id = ultimatetest_cust_id);
delete from osc_orders                     where customers_id = ultimatetest_cust_id;
delete from osc_address_book               where customers_id = ultimatetest_cust_id;
delete from osc_customers_basket           where customers_id = ultimatetest_cust_id;
delete from osc_customers                  where customers_id = ultimatetest_cust_id;


END $$

-- remove the club membership for risefm.myphotodevel.com
DROP PROCEDURE IF EXISTS declubify_risefm $$

CREATE PROCEDURE declubify_risefm()
BEGIN

DECLARE risefm_id INT;

SELECT userid INTO risefm_id FROM users WHERE username='risefm';
DELETE FROM mpa_club_memberships WHERE mpa_userid = risefm_id;
UPDATE users SET status = 1, package_type = 0 WHERE userid = risefm_id;

END $$

DELIMITER ;