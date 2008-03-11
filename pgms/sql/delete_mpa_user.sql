-- delete a MyPhotoAlbum user, backing up their info to archive tables where necessary.
-- Steve Wainstead, March 2008

DELIMITER $$

DROP PROCEDURE IF EXISTS delete_mpa_user $$

CREATE PROCEDURE delete_mpa_user(mpa_userid INT(10))
MODIFIES SQL DATA
BEGIN

DECLARE mpa_subdomain VARCHAR(30);
DECLARE mpa_email_address VARCHAR(100);

SELECT username      INTO mpa_subdomain     FROM users WHERE userid = mpa_userid;
SELECT email_address INTO mpa_email_address FROM users WHERE userid = mpa_userid;

INSERT INTO arch_userinfo                     (SELECT * FROM userinfo                     WHERE userid = mpa_userid);

INSERT INTO arch_users                        (SELECT * FROM users                        WHERE userid = mpa_userid);
INSERT INTO arch_userstats                    (SELECT * FROM userstats                    WHERE userid = mpa_userid);
INSERT INTO arch_mpa_club_memberships         (SELECT * FROM mpa_club_memberships         WHERE mpa_userid = mpa_userid);
INSERT INTO arch_mpa_sites_subusers           (SELECT * FROM mpa_sites_subusers           WHERE site_id = mpa_userid);
INSERT INTO arch_mpa_trialpay                 (SELECT * FROM mpa_trialpay                 WHERE sid = mpa_userid);
INSERT INTO arch_mpa_mobile_upload            (SELECT * FROM mpa_mobile_upload            WHERE userid = mpa_userid);
INSERT INTO arch_mpa_profile                  (SELECT * FROM mpa_profile                  WHERE userid = mpa_userid);
INSERT INTO arch_photouploads                 (SELECT * FROM photouploads                 WHERE userid = mpa_userid);
INSERT INTO arch_mpa_redeemed_features        (SELECT * FROM mpa_redeemed_features        WHERE userid = mpa_userid);
INSERT INTO arch_mpa_users_ecards             (SELECT * FROM mpa_users_ecards             WHERE userid = mpa_userid);
INSERT INTO arch_mpa_users_email_history      (SELECT * FROM mpa_users_email_history      WHERE parent_userid = mpa_userid);
INSERT INTO arch_mpa_users_received_shares    (SELECT * FROM mpa_users_received_shares    WHERE received_userid = mpa_userid);


INSERT INTO arch_mpa_photos                   (SELECT * FROM mpa_photos                   WHERE subdomain = mpa_subdomain);
INSERT INTO arch_mpa_users_address_book       (SELECT * FROM mpa_users_address_book       WHERE email_address = mpa_email_address);


END $$

DELIMITER ;