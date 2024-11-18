#!/usr/bin/python

# for all visps, get the package activity for the time frame
# specified; get the anniversary date for the org; get the org's
# owner's name; print out in tab delimted format.


# Imports
from Fnorb.orb import CORBA
import evw.Product
import evw.MailSpool
from evw.CoreUtils import *
import evw.Core
from Conf import *

import time
import string
import base64

import ldap


# Global vars
sessionkey=None
productModule=None
mailSpoolModule=None
startTimeStamp=None
endTimeStamp=None
prodC=None
billC=None
report={}
ldapObj=None
ispdn=None


# *****************************************************************************
# The buildReportInformation function
# *****************************************************************************
def buildReportInformation(): 
   # Query all the package activity for the date period inclusive.
   # ----------------------------------------------------------   
   sql = """
   SELECT 
      packageActions.organisationDn,
      packageActions.actionTime, 
      packageActions.evwPackageId,
      LOWER(packageActions.packageAction),
      packageActions.ispDn,
      domainHistory.fqdn,
      packageActions.productId
   FROM
      packageActions LEFT OUTER JOIN domainHistory
        ON domainHistory.installedProductId = packageActions.productId
   WHERE
      packageActions.actionTime BETWEEN %s AND %s
   """ % (startTimeStamp, endTimeStamp)
   
   # Add the isp dn if in the search criteria
   if (ispdn != None):
      sql = sql + "AND ispdn = '%s' " % (ispdn)
   
   sql = sql + """
   ORDER BY
      packageActions.ispDn,
      packageActions.organisationDn,
      packageActions.actionTime      
   """ 
   #print sql
   #sys.exit(0)
   print "OK, gonna execute the sql to get package actions...."

   try:
      prodC.execute( sql )
      print "OK, query executed, fetching results..."
      res=prodC.fetchall()
      print "OK, got the query results for the package actions. looping on them..."
      counter = 0
      
      for rec in res:
         counter = counter + 1
         #print ("'%s' %s %s %s %s %s product id %s" %  (rec[0], rec[1], rec[2], rec[3], rec[4], rec[5], rec[6]))
         #print ("%s" %  rec[0])

         # Add the orgdn as the key in the report if it does not exist.
         if not report.has_key(rec[0]):
            report[rec[0]] = {}
            report[rec[0]]["packageinfo"] = []
            report[rec[0]]["ispdn"] = rec[4]

         # Add all the package information
         if rec[5] == None:
            domain = "unknown"
         else:
            domain = rec[5]
         report[rec[0]]["packageinfo"].append({"evwpackageid": rec[2], "domain": domain, "action" : rec[3], "actiontime": rec[1], "productid": rec[6]})

   except:
      print "Error querying DB2 for the package actions data"
      errstuff = sys.exc_info()
      print errstuff[0], errstuff[1]
      traceback.print_exc()
      sys.exit(1)
      return 1
   print "there were %s package actions." % (counter)
   print "done looping on results of package activity. Adding anniversary date next."
   #sys.exit(1)
###################
## add anniversary date
###################

   sql = """
   SELECT
        lower(organisationdn),
        instyear,
        instmonth,
        instday,
        insthour,
        instminute,
        accountid
   FROM
        accounts, accountholders
   WHERE
        accounts.accountholderid = accountholders.accountholderid
        """
   # Add the isp dn if in the search criteria
   if (ispdn != None):
      sql = sql + "AND lower(organisationdn) like '%""" + (ispdn) + "'"

   
        # Although this query returns everyone for Ampira (hostv3
        # customers, etc.) it's filtered out below and the table only
        # contains around 10K rows, which is not much.
        
   #print sql
   
   try:
      billC.execute( sql )
      res=billC.fetchall()
      print "got anniversary data. Looping on that."
      
      anniversaries = 0
      for rec in res:

         #print ("'%s' %s %s %s %s %s" %  (rec[0], rec[1], rec[2], rec[3], rec[4], rec[5]))
         #print string.join(map(str,rec), " ")

         # Test to see if we have the orgdn, skip it if not
         if not report.has_key(rec[0]):
            continue
            
         anniversaries = anniversaries + 1
         #report[rec[0]]["packageinfo"][0].update({"instyear": rec[1], "instmonth": rec[2], "instday":rec[3], "insthour": rec[4], "instminute": rec[5]})
         #print len(report[rec[0]]["packageinfo"])
         report[rec[0]]["instyear"] = rec[1]
         report[rec[0]]["instmonth"] = rec[2]
         report[rec[0]]["instday"] = rec[3]
         report[rec[0]]["insthour"] = rec[4]
         report[rec[0]]["instminute"] = rec[5]
         report[rec[0]]["accountid"] = rec[6]

   except:
      print "Error quering DB2 for org creation data"
      errstuff = sys.exc_info()
      print errstuff[0], errstuff[1]
      #traceback.print_exc()
      sys.exit(1)
      return 2

   print "anniversaries: %d " % (anniversaries)

#######
## end add anniversary date
#######

   print "now hitting ldap for the org data..."
   
   # Obtain the organisation data for the organisations.
   # ----------------------------------------------------------   
   # Get the organisation object
   try:
      for orgdn in report.keys():
         try:
            orgObj = ldapResultToLowerCase(ldapObj.search_s(orgdn, ldap.SCOPE_BASE, "(objectclass=organization)"))
            #print ldapObj.search_s(orgdn, ldap.SCOPE_BASE, "(objectclass=organization)")
                  
            address = "%s %s %s %s %s %s" % (orgObj[0][1]["evwstreet1"][0], orgObj[0][1]["evwstreet2"][0], orgObj[0][1]["evwstreetcity"][0], orgObj[0][1]["evwstreetzip"][0], orgObj[0][1]["evwstreetstate"][0], orgObj[0][1]["evwstreetcountry"][0])
            postalAddr = "%s %s %s %s %s %s" % (orgObj[0][1]["evwpostal1"][0], orgObj[0][1]["evwpostal2"][0], orgObj[0][1]["evwpostalcity"][0], orgObj[0][1]["evwpostalzip"][0], orgObj[0][1]["evwpostalstate"][0], orgObj[0][1]["evwpostalcountry"][0])

            # SW: break down the user address info
            report[orgdn]["street"] = orgObj[0][1]["evwstreet1"][0]
            report[orgdn]["street2"] = orgObj[0][1]["evwstreet2"][0]
            report[orgdn]["city"] = orgObj[0][1]["evwstreetcity"][0]
            report[orgdn]["state"] = orgObj[0][1]["evwstreetstate"][0]
            report[orgdn]["zip"] = orgObj[0][1]["evwstreetzip"][0]
            report[orgdn]["country"] = orgObj[0][1]["evwstreetcountry"][0]

            report[orgdn]["pstreet"] = orgObj[0][1]["evwpostal1"][0]
            report[orgdn]["pstreet2"] = orgObj[0][1]["evwpostal2"][0]
            report[orgdn]["pcity"] = orgObj[0][1]["evwpostalcity"][0]
            report[orgdn]["pstate"] = orgObj[0][1]["evwpostalstate"][0]
            report[orgdn]["pzip"] = orgObj[0][1]["evwpostalzip"][0]
            report[orgdn]["pcountry"] = orgObj[0][1]["evwpostalcountry"][0]

            # Add the already known data
            report[orgdn]["orgname"] = orgObj[0][1]["cn"][0]
            report[orgdn]["orgaddress"] = address
            report[orgdn]["orgpostaladdress"] = postalAddr
            report[orgdn]["email"] = orgObj[0][1]["evwemailaddress"][0]
            report[orgdn]["phone"] = orgObj[0][1]["telephonenumber"][0]         


            # get the org owner's info
            try:
               #print orgObj[0][1]["evwtrustlist"][0]
               trustlist = string.split(  orgObj[0][1]["evwtrustlist"][0], '|' )
               #print "trust list 2: %s" % (trustlist[2])
               userDn = trustlist[2]
               userObj = ldapResultToLowerCase(ldapObj.search_s(userDn, ldap.SCOPE_BASE, "(objectclass=person)"))
               #print "first name: " + userObj[0][1]["cn"][0]
               #print "last name: " + userObj[0][1]["sn"][0]
               report[orgdn]["firstname"] = userObj[0][1]["cn"][0]
               report[orgdn]["lastname"]  = userObj[0][1]["sn"][0]
            except:
               print "oops, failed to get the trustlist"
               errstuff = sys.exc_info()
               print errstuff[0], errstuff[1]
               traceback.print_exc()
               sys.exit(1)

               
         except:
            # Could not get the org from LDAP.
            print "Removing the org %s from the report as no LDAP details exist" % (orgdn)
            del report[orgdn] 

   except:
      print "Unable to obtain the organisation information from LDAP"
      return 1  

   print "Now done getting org data. Next: package names..."
   
   # Obtain the package names
   # ----------------------------------------------------------   
   # Get the package names. (Use a small cache approach)
   packageNames = {}
   counter = 0
   
   for orgdn in report.keys():
      # Loop through all the packages for the events in the date range
      for details in report[orgdn]["packageinfo"]:
         if not details.has_key("evwpackageid"):
            continue

         # Get the package name if not in the cache
         if not packageNames.has_key(details["evwpackageid"]):      
            packageNames[details["evwpackageid"]] = {}
            counter = counter + 1
            # Get the package name
            try:
               package = productModule.getProduct( sessionkey, details["evwpackageid"] )
               packageNames[details["evwpackageid"]]["name"] = package.name
            except:
               packageNames[details["evwpackageid"]]["name"] = "unknown"

            # Get the active cost profile name
            try:
               sql = """
                  SELECT 
                     name
                  FROM
                     costProfile
                  WHERE
                     costProfileId = '%s'
               """ % (package.activeCostProfile)

               prodC.execute( sql )
               res=prodC.fetchall()
               packageNames[details["evwpackageid"]]["costprofilename"] = res[0][0]
            except:
               packageNames[details["evwpackageid"]]["costprofilename"] = "unknown"

         # add the installed package names too.
         if not packageNames.has_key(details["productid"]):
            packageNames[details["productid"]] = {}
            counter = counter + 1
            # fetch its details
            try:
               iprod = productModule.getInstalledProduct( sessionkey, details["productid"] )
               prod  = productModule.getProduct( sessionkey, iprod.productId )
               packageNames[details["productid"]]["name"] = prod.name
            except:
               packageNames[details["productid"]]["name"] = "unknown"
      
         # Add the package name
         details["evwpackagename"] = packageNames[details["evwpackageid"]]["name"]
         details["evwpackagecostprofilename"] = packageNames[details["evwpackageid"]]["costprofilename"]
         details["currentlyinstalledpackage"] = packageNames[details["productid"]]["name"]
         
   print "number of hits on ldap for package info: %s" % (counter)
   print "all done getting package info."
   return 0



# *****************************************************************************
# The buildReportCSV function
# *****************************************************************************
def buildReportCSV(): 
   # Build the csv formatted string.
   reportStr = ""

   # Headings
   #reportStr="ISP,ORGANIZATION,ADDRESS,POSTAL,EMAIL,PHONE,ACTION DATE,ACTION,PACKAGE NAME,COST PROFILE,DOMAIN\n\n"
   reportStr="ACCCOUNTID\tISP\tORGANIZATION\tLASTNAME\tFIRSTNAME\tADDRESS\tADDRESS2\tCITY\tSTATE\tZIP\tCOUNTRY\tPOSTAL1\tP2\tPCITY\tPSTATE\tPZIP\tPCOUNTRY\tEMAIL\tPHONE\tACTYEAR\tACTMONTH\tACTDAY\tACTHOUR\tACTMIN\tACTION\tPACKAGE NAME\tCOST PROFILE\tDOMAIN\tORG ANNIVERSARY YEAR\tORG ANNIVERSARY MONTH\tORG ANNIVERSARY DAY\tORG ANNIVERSARY HOUR\tORG ANNIVERSARY MINUTE\tCURRENTLY INSTALLED\n\n"

   # Totals
   delete=0
   install=0
   upgrade=0
   totalEvents=0
   for orgdn in report.keys():
      isFirst = 1
      for event in report[orgdn]["packageinfo"]:
         # Add the org info
         if (isFirst):            
            # Build the isp name from the org dn
            isp = ""
            try:
               tmp = orgdn[string.find(orgdn, ",")+1:]
               tmp = tmp[string.find(tmp, ",")+1:]
               isp = string.replace(tmp, "o=", "")
               if (string.find(isp, ",") != -1):
                  isp=isp[:string.find(isp, ",")]
            except:
               isp = "unknown"
               
	    #print "orgdn: %s" % orgdn
	    #print "isp:   %s" % isp
            reportStr = reportStr + "%d\t" % report[orgdn]["accountid"]
            reportStr = reportStr + "%s\t" % (isp)
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["orgname"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["lastname"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["firstname"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["street"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["street2"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["city"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["state"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["zip"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["country"]))

            #reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["orgpostaladdress"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["pstreet"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["pstreet2"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["pcity"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["pstate"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["pzip"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["pcountry"]))

            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["email"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["phone"]))
            # commented out 3/3/3 Steve Wainstead (this lets us get all values in all columns,
            # rather than the sparse matrix SF was sending out.)
            #isFirst = 0 
         else:
            reportStr = reportStr + " \t \t \t \t \t \t"

         # Add the package events
         #dstr = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(event["actiontime"]))
         actyear = time.strftime("%Y", time.localtime(event["actiontime"]))
         actmon  = time.strftime("%m", time.localtime(event["actiontime"]))
         actday  = time.strftime("%d", time.localtime(event["actiontime"]))
         acthour = time.strftime("%H", time.localtime(event["actiontime"]))
         actmin  = time.strftime("%M", time.localtime(event["actiontime"]))

         reportStr = reportStr + "%s\t" % (actyear)
         reportStr = reportStr + "%s\t" % (actmon)
         reportStr = reportStr + "%s\t" % (actday)
         reportStr = reportStr + "%s\t" % (acthour)
         reportStr = reportStr + "%s\t" % (actmin)
         
         #reportStr = reportStr + "%s\t" % (dstr)
         reportStr = reportStr + "%s\t" % (event["action"])
         reportStr = reportStr + "%s\t" % (event["evwpackagename"])
         reportStr = reportStr + "%s\t" % (event["evwpackagecostprofilename"])
         reportStr = reportStr + "%s\t" % (event["domain"])

         # add the anniversary crap
         try:
            reportStr = reportStr + "%s\t" % (report[orgdn]["instyear"])
            reportStr = reportStr + "%s\t" % (report[orgdn]["instmonth"])
            reportStr = reportStr + "%s\t" % (report[orgdn]["instday"])
            reportStr = reportStr + "%s\t" % (report[orgdn]["insthour"])
            reportStr = reportStr + "%s\t" % (report[orgdn]["instminute"])
         except:
            print "Oops, missing some organization install date info for %s" % (orgdn)
            reportStr = reportStr + "\t\t\t\t\t"
            
         # currently installed product, which by any other name, is that to which we upgraded
         reportStr = reportStr + "%s\n" % (event["currentlyinstalledpackage"])

         # Keep the running total
         totalEvents = totalEvents + 1
         if event["action"] == "delete":
            delete = delete + 1   
         if event["action"] == "install":
            install = install + 1   
         if event["action"] == "upgrade":
            upgrade = upgrade + 1   
                  

   # Create the report summary.
   reportSum = "The attached package event report details the events for the period %s - %s.\n" % (time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(startTimeStamp)), time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(endTimeStamp)))
   if ispdn == None:
      reportSum = reportSum + "The report has been generated for the ISP and all VISP's within the system.\n"
   else:
      reportSum = reportSum + "The report has been generated for the ISP with dn %s\n" % (ispdn)
   reportSum = reportSum + "\n"
   reportSum = reportSum + "The following is a summary to the attached report.\n"
   reportSum = reportSum + "--------------------------------------------------\n"
   reportSum = reportSum + "\n"
   reportSum = reportSum + "TOTAL EVENTS    :\t%s\t \n" % (totalEvents)
   if (totalEvents > 0):
      reportSum = reportSum + "TOTAL INSTALLS  :\t%s\t%s%%\n" % (install, round(install * 100.0 / totalEvents, 2))
      reportSum = reportSum + "TOTAL UNINSTALLS:\t%s\t%s%%\n" % (delete, round(delete * 100.0 / totalEvents, 2))
      reportSum = reportSum + "TOTAL UPGRADES  :\t%s\t%s%%\n" % (upgrade, round(upgrade * 100.0 / totalEvents, 2))
   reportSum = reportSum + "\n"
   reportSum = reportSum + "--------------------------------------------------\n"

   return [reportStr, reportSum]




# *****************************************************************************
# The main function
# *****************************************************************************
def main(argv):
   if (not (len(argv) == 5 or len(argv) == 6)):
      print "Usage: startdate enddate admin adminpass [ispdn]"
      print "Date Format: yyyymmdd"
      print "Dates are in localtime"
      print "ISP dn Format: o=visp,ou=Clients,..."
      print "               Leave blank to query all"
      return 1

   # Get the isp dn if specified
   if (len(argv) == 6):
      globals()["ispdn"] = string.lower(argv[5])


   # Connect to system.
   #-------------------------------------------------------------------------------
   try:
      orb = CORBA.ORB_init(sys.argv, CORBA.ORB_ID )
      system = connectToSystem(orb)
      globals()["sessionkey"] = system.authenticate( system.getUserDn( argv[3], "o=" + system.getClientId() ), argv[4],  "" )
   except:
      print "Unable to authenticate with system"
      return 1

   # Connect to productModule
   try:
      ior = system.resolve("Product Module")
      globals()["productModule"] = orb.string_to_object( ior )
      productModule.ping()   
   except:
      print "Unable to connect to productModule"
      return 1

   # Connect to mailSpoolModule
   try:
      ior = system.resolve("MailSpool")
      globals()["mailSpoolModule"] = orb.string_to_object( ior )
      mailSpoolModule.ping()   
   except:
      print "Unable to connect to Mail Spool"
      return 1


   
   # Convert the dates
   try:
      startDate = time.strptime("%s000000" % (argv[1]), "%Y%m%d%H%M%S")
      globals()["startTimeStamp"] = time.mktime(startDate)
   
      endDate = time.strptime("%s235959" % (argv[2]), "%Y%m%d%H%M%S")
      globals()["endTimeStamp"] = time.mktime(endDate)
   except:
      print "Error formating the start and end date parameters."      
      return 1


   # Get the evwhome
   try:
      evwHome = os.environ['EVW_HOME']
   except KeyError:
      print "ERROR: EVW_HOME not set"
      return 1


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
         return 1


      # Product Module.conf
      try:
         prodConf = ConfigParser()
         prodConf.read(evwHome + "/etc/ProductModule.conf")

         prodDatabaseName     = prodConf.get("Database", "Database")
         prodDatabaseUsername = prodConf.get("Database", "Username")
         prodDatabasePassword = prodConf.get("Database", "Password")
         prodDatabaseType     = string.lower(prodConf.get("Database", "Type"))
      except:
         print "ERROR: Unable to read ProductModule.conf"
         return 1


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
         return 1


      # Create a db connection to billing
      try:
         billConn=connectToDB(billDatabaseType, billDatabaseName, billDatabaseUsername, billDatabasePassword)
         globals()["billC"]=billConn.cursor()
      except:
         print "Error, unable to connect to the billing database"
         return 1
      
      
      # Create a db connection to product module
      try:
         prodConn=connectToDB(prodDatabaseType, prodDatabaseName, prodDatabaseUsername, prodDatabasePassword)
         globals()["prodC"]=prodConn.cursor()
      except:
         print "Error, unable to connect to the billing database"
         return 1

      # Connect and bind to LDAP as base module
      try:
         globals()["ldapObj"] = ldap.open(ldapHost, ldapPort)
         ldapObj.simple_bind_s(ldapBindDn, ldapBindPass)
      except:
         print "Unable to connect and bind to LDAP server."
         return 1
   except:
      print "Error reading the configuration files."
      return 1



   # Get the information for the report
   res = buildReportInformation()
   if (res):
      return res

   # Let's build the report 
   vals = buildReportCSV()
   #reportHtml = buildReportHTML(vals[0])

   # exit early and often (for testing anyway)
   #print reportHtml
   #return 0
   csvfile = open('dailyMarketingReport.tsv', 'w')
   csvfile.write(vals[0])
   csvfile.close()

   #htmlfile = open('report.html', 'w')
   #htmlfile.write(reportHtml)
   #htmlfile.close()

   #sumfile = open('report.sum', 'w')
   #sumfile.write(vals[1])
   #sumfile.close()
   return 0


if __name__ == '__main__':
   sys.exit(main(sys.argv))

