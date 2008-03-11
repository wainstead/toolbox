-- Pull all relevant info out of mpa_subusers and mpa_sites_subusers, given users.username

DELIMITER $$

DROP PROCEDURE IF EXISTS showuser $$

CREATE PROCEDURE showuser(IN mpa_sitename VARCHAR(64), mpa_username VARCHAR(64))
BEGIN

DECLARE siteid INT;
DECLARE s_uid INT;

-- get the users.userid, which is site_id in mpa_sites_subusers
SELECT userid INTO siteid FROM users WHERE username = mpa_sitename;

SELECT ss.uid
 INTO s_uid
 FROM mpa_subusers s, mpa_sites_subusers ss
 WHERE ss.site_id = siteid
 AND s.uid = ss.uid
 AND s.username = mpa_username;

SELECT * FROM mpa_sites_subusers WHERE site_id = siteid;

SELECT * FROM mpa_subusers WHERE uid = s_uid AND username = mpa_username;

END $$

DELIMITER ;