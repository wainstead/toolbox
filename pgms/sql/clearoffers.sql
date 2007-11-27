-- | offers                   | varchar(255) | NO   |     |                   |                | 
-- | validated_coupon_code_id | int(10)      | NO   |     | 0                 |                | 
-- | validated_offer_id       | int(4)       | NO   |     | 0                 |                | 

-- given 2f9141f0280df057398454e18e348499, delete all discounts for that cart

DELIMITER $$

DROP PROCEDURE IF EXISTS clearoffers $$

CREATE PROCEDURE clearoffers(IN oscsid VARCHAR(64))
BEGIN

UPDATE osc_cart SET
offers = '',
validated_coupon_code_id = 0,
validated_offer_id = 0
WHERE sess_key = oscsid;

END $$

DELIMITER ;