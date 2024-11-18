#!/usr/bin/python


import gallery_remote2


gallery = gallery_remote2.Gallery( 'http://swainfree.myphotodevel.com' )

try:
    gallery.login( 'admin', '112233' )
    images = gallery.fetchAlbumImages('album12')
except:
    print "error trying to fetch images for album58"
    
# http://swainfree.myphotodevel.com/view_photo.php?set_albumName=album12&id=2004_04_18_00_41_58

# try to delete a subalbum (this should fail; they should call delete-album to do this)
try:
    gallery.login('admin', '112233')
    gallery.deleteAlbumItem('album12', 'album13')
except:
    print "Failed to delete album13 from album12, as expected"


# test that a user without permission cannot delete a photo
try:
    gallery.login('family', '112233')
    gallery.deleteAlbumItem('album12', '2004_04_18_00_41_58')
except:
    print "did not have permission to delete the albumitem, as expected"


try:
    gallery.login('admin', '112233')
    gallery.deleteAlbumItem('album12', 'img_3454')
    print "photo deleted successfully"
except:
    print "Failed to delete photo!"
