
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


select @userid := userid from users where username = 'swain' and service_id = 1;

-- archive and delete comments
insert into arch_pro_photo_comments (
select pro_photo_comments.* from users, pro_portfolio_photos, pro_photo_comments
where users.userid = @userid
and users.userid = pro_portfolio_photos.photog_id
and pro_portfolio_photos.id = pro_photo_comments.photo_id
);

delete pro_photo_comments
from users, pro_portfolio_photos, pro_photo_comments
where users.userid = @userid
and users.userid = pro_portfolio_photos.photog_id
and pro_portfolio_photos.id = pro_photo_comments.photo_id;

-- archive and delete all photo sizes for a user
insert into arch_pro_photo_sizes (
select pro_photo_sizes.*
from users, pro_portfolio_photos, pro_photo_sizes
where users.userid = @userid
and users.userid = pro_portfolio_photos.photog_id
and pro_portfolio_photos.id = pro_photo_sizes.photo_id
)

delete pro_photo_sizes
from users, pro_portfolio_photos, pro_photo_sizes
where users.userid = @userid
and users.userid = pro_portfolio_photos.photog_id
and pro_portfolio_photos.id = pro_photo_sizes.photo_id;

-- archive and delete all photos info
insert into arch_pro_portfolio_photos_info (
select pro_portfolio_photos_info.*
from users, pro_portfolio_photos, pro_portfolio_photos_info
where users.userid = @userid
and users.userid = pro_portfolio_photos.photog_id
and pro_portfolio_photos.id = pro_portfolio_photos_info.id
);

delete pro_portfolio_photos_info
from users, pro_portfolio_photos, pro_portfolio_photos_info
where users.userid = @userid
and users.userid = pro_portfolio_photos.photog_id
and pro_portfolio_photos.id = pro_portfolio_photos_info.id;

-- and finally all photos
insert into arch_pro_portfolio_photos (
select pro_portfolio_photos.*
from users, pro_portfolio_photos 
where users.userid = @userid
and users.userid = pro_portfolio_photos.photog_id
);

delete pro_portfolio_photos 
from users, pro_portfolio_photos 
where users.userid = @userid
and users.userid = pro_portfolio_photos.photog_id;

--
-- now, videos. same deal.
--

-- archive and delete comments
insert into arch_pro_video_comments (
select pro_video_comments.* from users, pro_portfolio_videos, pro_video_comments
where users.userid = @userid
and users.userid = pro_portfolio_videos.photog_id
and pro_portfolio_videos.id = pro_video_comments.video_id
);

delete pro_video_comments
from users, pro_portfolio_videos, pro_video_comments
where users.userid = @userid
and users.userid = pro_portfolio_videos.photog_id
and pro_portfolio_videos.id = pro_video_comments.video_id;

-- archive and delete all video sizes for a user
insert into arch_pro_video_sizes (
select pro_video_sizes.*
from users, pro_portfolio_videos, pro_video_sizes
where users.userid = @userid
and users.userid = pro_portfolio_videos.photog_id
and pro_portfolio_videos.id = pro_video_sizes.video_id
);

delete pro_video_sizes
from users, pro_portfolio_videos, pro_video_sizes
where users.userid = @userid
and users.userid = pro_portfolio_videos.photog_id
and pro_portfolio_videos.id = pro_video_sizes.video_id;

-- archive and delete all videos info
insert into arch_pro_portfolio_videos_info (
select pro_portfolio_videos_info.*
from users, pro_portfolio_videos, pro_portfolio_videos_info
where users.userid = @userid
and users.userid = pro_portfolio_videos.photog_id
and pro_portfolio_videos.id = pro_portfolio_videos_info.id
);

delete pro_portfolio_videos_info
from users, pro_portfolio_videos, pro_portfolio_videos_info
where users.userid = @userid
and users.userid = pro_portfolio_videos.photog_id
and pro_portfolio_videos.id = pro_portfolio_videos_info.id;

-- and finally all videos
insert into arch_pro_portfolio_videos (
select pro_portfolio_videos.*
from users, pro_portfolio_videos 
where users.userid = @userid
and users.userid = pro_portfolio_videos.photog_id
);

delete pro_portfolio_videos 
from users, pro_portfolio_videos 
where users.userid = @userid
and users.userid = pro_portfolio_videos.photog_id;


--
-- and now, albums
--

-- archive and delete pro_portfolio_gallery_attrs
insert into arch_pro_portfolio_gallery_attrs (
   select pro_portfolio_gallery_attrs.*
   from users, pro_portfolio_gallery, pro_portfolio_gallery_attrs
   where users.userid = @userid
   and users.userid = pro_portfolio_gallery.owner_id
   and pro_portfolio_gallery.owner_id = pro_portfolio_gallery_attrs.gallery_id
)
;

delete pro_portfolio_gallery_attrs
from users, pro_portfolio_gallery, pro_portfolio_gallery_attrs
where users.userid = @userid
and users.userid = pro_portfolio_gallery.owner_id
and pro_portfolio_gallery.owner_id = pro_portfolio_gallery_attrs.gallery_id
;


-- archive and delete pro_portfolio_gallery_notifications
insert into arch_pro_portfolio_gallery_notifications (
   select pro_portfolio_gallery_notifications.*
   from users, pro_portfolio_gallery, pro_portfolio_gallery_notifications
   where users.userid = @userid
   and users.userid = pro_portfolio_gallery.owner_id
   and pro_portfolio_gallery.owner_id = pro_portfolio_gallery_notifications.gallery_id
)
;

delete pro_portfolio_gallery_notifications
from users, pro_portfolio_gallery, pro_portfolio_gallery_notifications
where users.userid = @userid
and users.userid = pro_portfolio_gallery.owner_id
and pro_portfolio_gallery.owner_id = pro_portfolio_gallery_notifications.gallery_id
;


-- archive and delete pro_portfolio_gallery_perms
insert into arch_pro_portfolio_gallery_perms (
   select pro_portfolio_gallery_perms.*
   from users, pro_portfolio_gallery, pro_portfolio_gallery_perms
   where users.userid = @userid
   and users.userid = pro_portfolio_gallery.owner_id
   and pro_portfolio_gallery.owner_id = pro_portfolio_gallery_perms.gallery_id
)
;

delete pro_portfolio_gallery_perms
from users, pro_portfolio_gallery, pro_portfolio_gallery_perms
where users.userid = @userid
and users.userid = pro_portfolio_gallery.owner_id
and pro_portfolio_gallery.owner_id = pro_portfolio_gallery_perms.gallery_id
;


-- archive and delete pro_portfolio_gallery_photos
insert into arch_pro_portfolio_gallery_photos (
   select pro_portfolio_gallery_photos.*
   from users, pro_portfolio_gallery, pro_portfolio_gallery_photos
   where users.userid = @userid
   and users.userid = pro_portfolio_gallery.owner_id
   and pro_portfolio_gallery.owner_id = pro_portfolio_gallery_photos.gallery_id
)
;

delete pro_portfolio_gallery_photos
from users, pro_portfolio_gallery, pro_portfolio_gallery_photos
where users.userid = @userid
and users.userid = pro_portfolio_gallery.owner_id
and pro_portfolio_gallery.owner_id = pro_portfolio_gallery_photos.gallery_id
;


-- archive and delete pro_portfolio_gallery_subalbums
insert into arch_pro_portfolio_gallery_subalbums (
   select pro_portfolio_gallery_subalbums.*
   from users, pro_portfolio_gallery, pro_portfolio_gallery_subalbums
   where users.userid = @userid
   and users.userid = pro_portfolio_gallery.owner_id
   and pro_portfolio_gallery.owner_id = pro_portfolio_gallery_subalbums.gallery_id
)
;

delete pro_portfolio_gallery_subalbums
from users, pro_portfolio_gallery, pro_portfolio_gallery_subalbums
where users.userid = @userid
and users.userid = pro_portfolio_gallery.owner_id
and pro_portfolio_gallery.owner_id = pro_portfolio_gallery_subalbums.gallery_id
;


-- archive and delete pro_portfolio_gallery_videos
insert into arch_pro_portfolio_gallery_videos (
   select pro_portfolio_gallery_videos.*
   from users, pro_portfolio_gallery, pro_portfolio_gallery_videos
   where users.userid = @userid
   and users.userid = pro_portfolio_gallery.owner_id
   and pro_portfolio_gallery.owner_id = pro_portfolio_gallery_videos.gallery_id
)
;

delete pro_portfolio_gallery_videos
from users, pro_portfolio_gallery, pro_portfolio_gallery_videos
where users.userid = @userid
and users.userid = pro_portfolio_gallery.owner_id
and pro_portfolio_gallery.owner_id = pro_portfolio_gallery_videos.gallery_id
;


-- archive and delete mpa_album_polls
insert into arch_mpa_album_polls (
   select mpa_album_polls.*
   from users, pro_portfolio_gallery, mpa_album_polls
   where users.userid = @userid
   and users.userid = pro_portfolio_gallery.owner_id
   and pro_portfolio_gallery.owner_id = mpa_album_polls.gallery_id
)
;

delete mpa_album_polls
from users, pro_portfolio_gallery, mpa_album_polls
where users.userid = @userid
and users.userid = pro_portfolio_gallery.owner_id
and pro_portfolio_gallery.owner_id = mpa_album_polls.gallery_id
;
