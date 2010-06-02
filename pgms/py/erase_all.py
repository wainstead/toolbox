#!/usr/bin/python

import gallery_remote2

print "Hello sailor!"

gallery = gallery_remote2.Gallery( 'http://swainfree.myphotodevel.com' )
gallery.login( 'admin', '112233' )



albums = gallery.fetchAlbums()
if not albums:
    print "No albums in this site."
else:
    for a in albums:
        print "deleting %s." % a['name']
        gallery.login( 'admin', '112233' )
        gallery.deleteAlbum(a['name'])

print "end of line."
