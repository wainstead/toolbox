#!/usr/bin/python

# $Id: parsedates.py,v 1.2 2003/10/15 18:39:37 swain Exp $
# convert date numbers into unix time (seconds since the epoch)
# example: ./unix.py 2003 8 18 15 35 0 0 0 0
# the zeroes are needed due to the demands of
# time.mktime but it don't use them 

import time
import sys
import string

fromdate = sys.argv[1]
todate   = sys.argv[2]

print "dates: %s %s" % (fromdate, todate)

ffields = string.split(fromdate, '-')
tfields = string.split(todate, '-')
print ffields
print tfields

if ( (len(ffields) != 3) or (len(tfields) != 3) ):
    print "usage: %s YYYY-MM-DD YYYY-MM-DD" % (sys.argv[0])
    sys.exit(1)


ffields = ffields + [0, 0, 0, 0, 0, -1]
tfields = tfields + [23, 59, 59, 0, 0, -1]

fromtime = time.mktime(map(lambda s: int(s), ffields[0:9]))
totime   = time.mktime(map(lambda s: int(s), tfields[0:9]))
print fromtime
print totime

# query we will use:
# db2 "select a.accountid, tax, organisationdn 
# from journal j,accountholders ac, accounts a 
# where a.accountid=j.accountid and
# (journaltimestamp > 1064980800) and (journaltimestamp < 1065844799)
# and (tax > 0) and ac.accountholderid=a.accountholderid"

sqlquery = """
select a.accountid, tax, organisationdn
from journal j,accountholders ac, accounts a
where a.accountid=j.accountid
and (journaltimestamp > %d)
and (journaltimestamp < %d)
and (tax > 0)
and ac.accountholderid=a.accountholderid""" % (fromtime, totime)

print sqlquery

# print time.time()

# print time.localtime(time.time())

# print time.mktime(time.localtime(time.time()))
# print sys.argv[1:10]

# print time.mktime(map(lambda s: int(s), sys.argv[1:10]))

# $Log: parsedates.py,v $
# Revision 1.2  2003/10/15 18:39:37  swain
# added cvs log keyword
#
