-- given a script name, return the ID for it.

-- +----------------------------+
-- | uploader                   |
-- +----------------------------+
-- | /image_uploader3.php       |
-- | /gallery_remote2.php       |
-- | /move_photo.php            |
-- | /save_photos.php           |
-- | /pixenate/save2gallery.php |
-- | /add_movie.php             |
-- | /copy_photo.php            |
-- | /fx_add_photo.php          |
-- +----------------------------+


drop table if exists mpa_upload_scripts;

create table mpa_upload_scripts (
   id int not null primary key,
   tool varchar(32) not null default '',
   index `upload_script_index` (`tool`)
);

insert into mpa_upload_scripts values(1, '/image_uploader3.php');
insert into mpa_upload_scripts values(2, '/gallery_remote2.php');
insert into mpa_upload_scripts values(3, '/move_photo.php');
insert into mpa_upload_scripts values(4, '/save_photos.php');
insert into mpa_upload_scripts values(5, '/pixenate/save2gallery.php');
insert into mpa_upload_scripts values(6, '/add_movie.php');
insert into mpa_upload_scripts values(7, '/copy_photo.php');
insert into mpa_upload_scripts values(8, '/fx_add_photo.php');

-- change statement delimiter from semicolod to $$, so we can use
-- semicolons in the function declaration
DELIMITER $$

DROP FUNCTION IF EXISTS lookup_script_id $$

CREATE FUNCTION lookup_script_id( script_name VARCHAR(32) )
RETURNS int(2)
READS SQL DATA

BEGIN

-- declare a variable to hold our return value
DECLARE return_val int(2);

SET return_val = 0; -- default return value if nothing matches

SELECT id INTO return_val FROM mpa_upload_scripts WHERE tool = script_name;


RETURN(return_val);

END $$

-- reset the delimiter to a semicolon
DELIMITER ;
