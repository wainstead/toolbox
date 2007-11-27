-- reset coupons and offers for me

DELIMITER $$

DROP PROCEDURE IF EXISTS resetoffers;

CREATE PROCEDURE resetoffers()
BEGIN

DELETE osc_orders_offers 
FROM   osc_orders_offers, osc_orders 
WHERE osc_orders_offers.orders_id = osc_orders.orders_id 
  AND osc_orders.customers_id=2;

UPDATE osc_coupon_codes
SET uses_done=0,
    expire_date = date_add(now(), interval 1 year)
WHERE validation_code='qqqqwwww';

END$$

DELIMITER ;