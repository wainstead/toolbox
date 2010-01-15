#!/usr/bin/perl

# pro_portfolio_gallery owner_id

$sqlvar = '@userid';

@tables = qw(
 pro_portfolio_gallery_attrs         
 pro_portfolio_gallery_notifications 
 pro_portfolio_gallery_perms         
 pro_portfolio_gallery_photos        
 pro_portfolio_gallery_subalbums     
 pro_portfolio_gallery_videos        
 mpa_album_polls                     
);


foreach $table (@tables) {
    print <<"EOLN";

-- archive and delete $table
insert into arch_$table (
   select $table.*
   from users, pro_portfolio_gallery, $table
   where users.userid = $sqlvar
   and users.userid = pro_portfolio_gallery.owner_id
   and pro_portfolio_gallery.owner_id = $table.gallery_id
)
;

delete $table
from users, pro_portfolio_gallery, $table
where users.userid = $sqlvar
and users.userid = pro_portfolio_gallery.owner_id
and pro_portfolio_gallery.owner_id = $table.gallery_id
;

EOLN
}
