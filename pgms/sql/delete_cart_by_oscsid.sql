-- given 2f9141f0280df057398454e18e348499, delete all rows from the cart tables.

DELIMITER $$

DROP PROCEDURE IF EXISTS destroycart $$

CREATE PROCEDURE destroycart(IN oscsid VARCHAR(64))
BEGIN

DECLARE cartid INT;
DECLARE cus_id INT;

SELECT cart_id INTO cartid FROM osc_cart WHERE sess_key = oscsid;

-- delete the cart based on the cookie
DELETE 
      osc_cart_contents, 
      osc_cart_contents_attributes
FROM 
      osc_cart_contents, 
      osc_cart_contents_attributes
WHERE osc_cart_contents.cart_id = cartid
  AND osc_cart_contents.cart_contents_id = osc_cart_contents_attributes.cart_contents_id;


DELETE FROM osc_cart WHERE sess_key = oscsid;

-- now delete any other carts based on my customers_id (2, on dev)

SELECT customers_id INTO cus_id FROM osc_customers WHERE customers_email_address='swain@corp.fortunecity.com';

DELETE 
      osc_cart_contents, 
      osc_cart_contents_attributes
FROM 
      osc_cart,
      osc_cart_contents, 
      osc_cart_contents_attributes
WHERE osc_cart_contents.cart_id = osc_cart.cart_id
  AND osc_cart_contents.cart_contents_id = osc_cart_contents_attributes.cart_contents_id
  AND osc_cart.customers_id = cus_id;

DELETE FROM osc_cart WHERE customers_id = cus_id;

END $$

DELIMITER ;