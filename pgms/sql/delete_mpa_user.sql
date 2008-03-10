-- delete a MyPhotoAlbum user, backing up their info to archive tables where necessary.
-- Steve Wainstead, March 2008

DELIMITER $$

DROP PROCEDURE IF EXISTS delete_mpa_user $$

CREATE PROCEDURE delete_mpa_user(mpa_userid INT(10))
MODIFIES SQL DATA
BEGIN

  DECLARE no_such_userid INT DEFAULT 0;
  DECLARE mpauserid INT;

  BEGIN
    DECLARE EXIT HANDLER FOR 1054 /* No such userid */ SET no_such_userid=1;

    SELECT userid INTO mpauserid FROM users WHERE userid = mpa_userid;
    IF mpauserid > 0 THEN
      SELECT * FROM users WHERE userid = mpa_userid;
    END IF;
  END;



IF no_such_userid = 1 THEN
   SELECT CONCAT('Failed to remove user by userid ', mpa_userid, ': no such userid') as "Result";
END IF;



END $$

DELIMITER ;