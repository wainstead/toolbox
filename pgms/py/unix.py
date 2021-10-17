#!/usr/bin/python

# $Id: unix.py,v 1.3 2005/01/31 23:40:46 swain Exp $
# convert date numbers into unix time (seconds since the epoch)
# example: ./unix.py 2003 8 18 15 35 0 0 0 0
# the zeroes are needed due to the demands of
# time.mktime but it don't use them

import time
import sys
import string

try:
    print time.time()

    print time.localtime(time.time())
    timestamp = time.time()
    df = time.localtime(timestamp)[0:3]
    #datestr = "%d-%d-%d" % (df[0], df[1], df[2])
    datestr = "now: %d-%d-%d %d:%d:%d" % (time.localtime(timestamp)[0:6])
    print datestr

    datestr = "then: %d-%d-%d %d:%d:%d" % (time.localtime(1001974317)[0:6])
    print datestr


    print time.mktime(time.localtime(time.time()))
    print sys.argv[1:10]

    print time.mktime(map(lambda s: int(s), sys.argv[1:10]))
except:
    print "usage: ./unix.py 2003 8 18 15 35 0 0 0 0"
