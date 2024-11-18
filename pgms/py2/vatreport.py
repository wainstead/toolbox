#!/usr/bin/python

# $Id: vatreport.py,v 1.9 2005/01/31 23:49:02 swain Exp $

# Generate a report for the previous quarter showing all customers who
# paid the EU VAT.

import time
import sys, traceback
import string

from Fnorb.orb import CORBA
import evw.Product
import evw.MailSpool
from evw.CoreUtils import *
import evw.Core
from Conf import *

import base64

import ldap

report = {}

# Connect to system.
#-------------------------------------------------------------------------------
try:
    orb = CORBA.ORB_init(sys.argv, CORBA.ORB_ID )
    system = connectToSystem(orb)
    globals()["sessionkey"] = system.authenticate( system.getUserDn( "admin", "o=" + system.getClientId() ), "112233",  "" )
except:
    print "Unable to authenticate with system"
    errstuff = sys.exc_info()
    print errstuff[0], errstuff[1]
    traceback.print_exc()
    sys.exit(1)


# Connect to productModule
try:
    ior = system.resolve("Product Module")
    globals()["productModule"] = orb.string_to_object( ior )
    productModule.ping()   
except:
    print "Unable to connect to productModule"
    errstuff = sys.exc_info()
    print errstuff[0], errstuff[1]
    traceback.print_exc()
    sys.exit(2)


# Connect to mailSpoolModule
try:
    ior = system.resolve("MailSpool")
    globals()["mailSpoolModule"] = orb.string_to_object( ior )
    mailSpoolModule.ping()   
except:
    print "Unable to connect to Mail Spool"
    errstuff = sys.exc_info()
    print errstuff[0], errstuff[1]
    traceback.print_exc()
    sys.exit(3)


# # Get the evwhome
# try:
#     evwHome = os.environ['EVW_HOME']
# except KeyError:
#     print "ERROR: EVW_HOME not set"
#     errstuff = sys.exc_info()
#     print errstuff[0], errstuff[1]
#     traceback.print_exc()
#     sys.exit(4)

evwHome = "/opt/evw"


try:
    # Read in the required configuration information
    # System.conf

    # Billing.conf
    try:
        billConf = ConfigParser()
        billConf.read(evwHome + "/etc/BillingModule.conf")

        billDatabaseName     = billConf.get("Database", "Database")
        billDatabaseUsername = billConf.get("Database", "Username")
        billDatabasePassword = billConf.get("Database", "Password")
        billDatabaseType     = string.lower(billConf.get("Database", "Type"))
    except:
        print "ERROR: Unable to read BillingModule.conf"
        errstuff = sys.exc_info()
        print errstuff[0], errstuff[1]
        traceback.print_exc()
        sys.exit(5)



    # Product BaseModule.conf
    try:
        baseConf = ConfigParser()
        baseConf.read(evwHome + "/etc/BaseModule.conf")

        ldapHost = baseConf.get("Ldap", "Hostname")
        ldapPort = baseConf.getint("Ldap", "Port")
        ldapBindDn = baseConf.get("Ldap", "Dn")
        ldapBindPass = baseConf.get("Ldap", "Password")
    except:
        print "ERROR: Unable to read ProductModule.conf"
        errstuff = sys.exc_info()
        print errstuff[0], errstuff[1]
        traceback.print_exc()
        sys.exit(6)



    # Create a db connection to billing
    try:
        billConn=connectToDB(billDatabaseType, billDatabaseName, billDatabaseUsername, billDatabasePassword)
        globals()["billC"]=billConn.cursor()
    except:
        print "Error, unable to connect to the billing database"
        errstuff = sys.exc_info()
        print errstuff[0], errstuff[1]
        traceback.print_exc()
        sys.exit(7)


    # Connect and bind to LDAP as base module
    try:
        globals()["ldapObj"] = ldap.open(ldapHost, ldapPort)
        ldapObj.simple_bind_s(ldapBindDn, ldapBindPass)
    except:
        print "Unable to connect and bind to LDAP server."
        errstuff = sys.exc_info()
        print errstuff[0], errstuff[1]
        traceback.print_exc()
        sys.exit(8)

except:
    print "Error reading the configuration files."
    errstuff = sys.exc_info()
    print errstuff[0], errstuff[1]
    traceback.print_exc()
    sys.exit(9)



# process command line args, or just do previous quarter
if (len(sys.argv) == 3):
    # do the user-specified timeframe
    fromdate = sys.argv[1]
    todate   = sys.argv[2]
else:
    # do the previous quarter
    datefields = time.localtime(time.time())
    month = datefields[1]
    year  = datefields[0]
#    print "year: %d month: %d" % (year, month)

#    print "month: %d" % month
    # curse Python for not having a case statement.
    if (1 <= month <= 3):
        # this is Q1, do Q4
        fromdate = (year - 1) + "-10-1"
        todate   = year + "-1-1"
    elif (4  <= month <= 6):
        print "second Q"
    elif (7  <= month <= 9):
        print "third Q"
    elif (10 <= month <= 12):
        # this is Q4, do Q3
        fromdate = str(year) + "-7-1"
        todate   = str(year) + "-10-1"
    else:
        print "I can't determine what month this is!"
        sys.exit(10)


#print "dates: %s %s" % (fromdate, todate)

ffields = string.split(fromdate, '-')
tfields = string.split(todate, '-')
#print ffields
#print tfields

if ( (len(ffields) != 3) or (len(tfields) != 3) ):
    print "usage: %s YYYY-MM-DD YYYY-MM-DD" % (sys.argv[0])
    print "or called with no args, will do the previous quarter"
    sys.exit(11)
    
    
ffields = ffields + [0, 0, 0, 0, 0, -1]
# When the user defines the timeframe, we include the last date
# else we only go to midnight of the first day of the next quarter
if ( len(sys.argv) == 3 ):
    tfields = tfields + [23, 59, 59, 0, 0, -1]
else:
    tfields = tfields + [0, 0, 0, 0, 0, -1]


fromtime = time.mktime(map(lambda s: int(s), ffields[0:9]))
totime   = time.mktime(map(lambda s: int(s), tfields[0:9]))

#print "from: %d (%s)" % (fromtime, time.localtime(fromtime))
#print "to:   %d (%s)" % (totime,   time.localtime(totime))


# select unique accountids
sqlquery = """
select distinct(a.accountid), sum(amountpretax), sum(tax), sum(amount), organisationdn, max(journaltimestamp)
from journal j,accountholders ac, accounts a
where a.accountid=j.accountid
and (journaltimestamp > %d)
and (journaltimestamp < %d)
and (tax > 0)
and ac.accountholderid=a.accountholderid
group by a.accountid, organisationdn

""" % (fromtime, totime)

#print sqlquery



try:
    billC.execute( sqlquery )
    res=billC.fetchall()

    for rec in res:
        #print rec

        #print ("%s %s %s %s %s %s" %  (rec[0], rec[1], rec[2], rec[3], rec[4], rec[5]))
        #print ("%s" %  rec[0])

        # Add the orgdn as the key in the report if it does not exist.
        if not report.has_key(rec[4]):
            report[rec[4]] = {}

        cleanorg = string.replace(rec[4], ",", "|")
        datestr = "%d-%d-%d" % (time.localtime(rec[5])[0:3])

        amountpretax = "%.2f" % (float(rec[1]) / 100)
        tax          = "%.2f" % (float(rec[2]) / 100)
        amount       = "%.2f" % (float(rec[3]) / 100)
        
        report[rec[4]] = {"accountid": rec[0], "amountpretax": amountpretax, "tax" : tax, "amount": amount, "organisationdn" : cleanorg, "datestr" : datestr}

except:
    print "Error in sql query block"
    errstuff = sys.exc_info()
    print errstuff[0], errstuff[1]
    traceback.print_exc()
    sys.exit(12)



# Obtain the organisation data for the organisations.
# ----------------------------------------------------------   
# Get the organisation object
try:
    for orgdn in report.keys():
        #print orgdn

        try:
            orgObj = ldapResultToLowerCase(ldapObj.search_s(orgdn, ldap.SCOPE_BASE, "(objectclass=organization)"))
            #print ldapObj.search_s(orgdn, ldap.SCOPE_BASE, "(objectclass=organization)")
            #print orgObj
            #print orgObj[0][1]["evwstreetcountry"][0]
            report[orgdn]["country"] = orgObj[0][1]["evwstreetcountry"][0]
            report[orgdn]["orgname"] = string.replace(orgObj[0][1]["o"][0], ",", ".")
            report[orgdn]["accountholderid"] = orgObj[0][1]["evwaccountholder"][0]
        except:
            print "oops"
            errstuff = sys.exc_info()
            print errstuff[0], errstuff[1]
            traceback.print_exc()
            sys.exit(13)

except:
    print "no dice on the ldap query"
    errstuff = sys.exc_info()
    print errstuff[0], errstuff[1]
    traceback.print_exc()
    sys.exit(14)



# proof our results
print "DATE,ACCOUNT ID,AMOUNT (PRETAX),TAX,AMOUNT (TOTAL),ACCOUNTHOLDER ID,ORGANIZATION,COUNTRY"
try:
    for orgdn in report.keys():
        #print orgdn
        fields = report[orgdn]
        #print fields["accountid"], fields["amountpretax"], fields["tax"], fields["amount"]
#         for key in fields.keys():
#             print "--- %s: %s" % (key, fields[key])

        print "%s,%s,%s,%s,%s,%s,%s,%s" % (fields["datestr"], fields["accountid"], fields["amountpretax"], fields["tax"], fields["amount"], fields["accountholderid"], fields["orgname"], fields["country"])
except:
    print "error in report block"
    errstuff = sys.exc_info()
    print errstuff[0], errstuff[1]
    traceback.print_exc()
    sys.exit(15)

sys.exit(0)

# $Log: vatreport.py,v $
# Revision 1.9  2005/01/31 23:49:02  swain
# assorted changes from devil.
#
# Revision 1.8  2003/10/20 21:58:13  swain
# final edits, tested with crontab, looks good
#
# Revision 1.7  2003/10/20 15:41:59  swain
# fixed bug where the first day of next quarter was included
#
# Revision 1.6  2003/10/16 19:34:45  swain
# improved the error output, added sequencial exit codes
#
# Revision 1.5  2003/10/16 17:04:43  swain
# final output looks good
#
# Revision 1.4  2003/10/16 16:07:38  swain
# mostly working now, but need to format the output correctly, maybe
# munge the data structure into something more easily understood
#
# Revision 1.3  2003/10/15 22:20:11  swain
# fixed the query problem (wrong module, duh)
#
# Revision 1.2  2003/10/15 22:17:03  swain
# almost working sql query but not quite
#
# Revision 1.1  2003/10/15 22:01:17  swain
# got the date logic worked out to do previous quarter when no args given
#
