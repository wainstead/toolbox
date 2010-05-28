#!/usr/bin/python

import gallery_remote2
import os
import re

path = "/Users/swain/Pictures"

dirList = os.listdir(path)

gallery = gallery_remote2.Gallery('http://swainfree.myphotodevel.com')

for fname in dirList:
    pattern = re.compile('^uploadable')
    if pattern.match(fname):
        print fname
        gallery.login('admin', '112233')
        albumname = gallery.newAlbum(0, None, fname)
        photoDir = "%(p)s/%(f)s" % { 'p': path, 'f': fname }
        fileList = os.listdir(photoDir)
        for iname in fileList:
            photoFile = "%(p)s/%(f)s/%(i)s" % { 'p': path, 'f': fname, 'i' : iname }
            print photoFile
            gallery.login('admin', '112233')
            gallery.addItem(albumname, photoFile, iname)
