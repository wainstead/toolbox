-- delete user 'autotest' from the system
DELIMITER $$

DROP PROCEDURE IF EXISTS delete_autouser $$

CREATE PROCEDURE delete_autouser()
BEGIN

DECLARE autotest_userid INT;

SELECT userid INTO autotest_userid FROM users WHERE username = 'autotest';

delete 
mpa_subusers,
mpa_sites_subusers
from
mpa_subusers,
mpa_sites_subusers
where mpa_sites_subusers.site_id = autotest_userid
and mpa_sites_subusers.uid = mpa_subusers.uid;

DELETE FROM users                 WHERE userid      = autotest_userid;
DELETE FROM userinfo              WHERE userid      = autotest_userid;
DELETE FROM userstats             WHERE userid      = autotest_userid;
DELETE FROM prem_packages_history WHERE customer_id = autotest_userid;
DELETE FROM mpa_photos            WHERE subdomain   = 'autotest';
DELETE FROM mpa_albumitems        WHERE userid      = autotest_userid;
DELETE FROM mpa_albumitems2       WHERE user_id     = autotest_userid;
DELETE FROM mpa_albums2           WHERE user_id     = autotest_userid;
DELETE FROM mpa_points            WHERE username    = 'autotest';

END $$
DELIMITER ;