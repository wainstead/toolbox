
-- pro_portfolio_gallery owner_id
-- pro_portfolio_photos photog_id
-- pro_portfolio_videos photog_id

-- pro_portfolio_gallery_attrs gallery_id
-- pro_portfolio_gallery_notifications gallery_id
-- pro_portfolio_gallery_perms gallery_id
-- pro_portfolio_gallery_photos gallery_id
-- pro_portfolio_gallery_subalbums gallery_id
-- pro_portfolio_gallery_videos gallery_id
-- mpa_album_polls gallery_id

-- pro_photo_comments photo_id
-- pro_photo_sizes photo_id
-- pro_portfolio_photos_info id (photo_id)


-- pro_portfolio_videos_info id (video_id)
-- pro_video_comments id (video_id)
-- pro_video_sizes video_id

-- delete all photo comments for a user
delete pro_photo_comments
from users, pro_portfolio_photos, pro_photo_comments
where users.userid = pro_portfolio_photos.photog_id
and pro_portfolio_photos.id = pro_photo_comments.photo_id;

-- delete all photo sizes for a user
delete pro_photo_sizes
from users, pro_portfolio_photos, pro_photo_sizes
where users.userid = pro_portfolio_photos.photog_id
and pro_portfolio_photos.id = pro_photo_sizes.photo_id;

-- delete all photos info
delete pro_portfolio_photos_info
from users, pro_portfolio_photos, pro_portfolio_photos_info
where users.userid = pro_portfolio_photos.photog_id
and pro_portfolio_photos.id = pro_portfolio_photos_info.id;

-- and finally all photos
delete pro_portfolio_photos 
from users, pro_portfolio_photos 
where users.userid = pro_portfolio_photos.photog_id;

