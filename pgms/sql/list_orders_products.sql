-- List an order's products.
-- Steve Wainstead, March 2008

DELIMITER $$

DROP PROCEDURE IF EXISTS list_orders_products $$

CREATE PROCEDURE list_orders_products(mpa_orders_id INT(10))

BEGIN

SELECT op.products_id, op.products_quantity, pd.products_name
FROM osc_orders_products op, osc_products_description pd
WHERE op.products_id = pd.products_id
AND orders_id = mpa_orders_id;

END $$

DELIMITER ;