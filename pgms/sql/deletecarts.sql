-- $Id: deletecarts.sql,v 1.1 2007/03/02 17:10:11 swain Exp $
-- delete all the shopping carts

DELIMITER $$

DROP PROCEDURE IF EXISTS flushcarts $$

CREATE PROCEDURE flushcarts()
BEGIN

DELETE FROM osc_cart;
DELETE FROM osc_cart_contents;
DELETE FROM osc_cart_contents_attributes;

END$$

DELIMITER ;