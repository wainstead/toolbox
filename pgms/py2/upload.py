#!/usr/bin/python

import gallery_remote2
import os
import re

path = "/Users/swain/Pictures"

dirList = os.listdir(path)

gallery = gallery_remote2.Gallery('http://swainfree.myphotodevel.com')

folderPattern = re.compile('^uploadable')
isImage = re.compile('jpg$', re.IGNORECASE)

for fname in dirList:

    if folderPattern.match(fname):
        print fname
        gallery.login('admin', '112233')
        albumname = gallery.newAlbum(0, None, fname)
        photoDir = "%(p)s/%(f)s" % { 'p': path, 'f': fname }
        fileList = os.listdir(photoDir)
        x = 0
        for iname in fileList:
            if not isImage.search(iname): continue
            photoFile = "%(p)s/%(f)s/%(i)s" % { 'p': path, 'f': fname, 'i' : iname }
            print photoFile
            gallery.login('admin', '112233')
            gallery.addItem(albumname, photoFile, iname)
            x += 1
            if x > 5: break
