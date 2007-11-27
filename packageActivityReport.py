#!/usr/bin/python
#
# Name: packageActivityReport
# Desc: Generates an organisation activity report that will be emailed.
#       This report uses the Product Modules Reports mail template 1.3.6.1.4.1.3999.1.11.50.1.1
# Author: Johnathan Ingram
# Corrections and additions: Steve Wainstead, March 2003:
# * changed it to a real CSV file instead of tab delimited
# * changed the extension it's emailed out with from txt to csv
# * fixed assorted grammatical errors in the comments

# Steve Wainstead maintains a copy of this file in his private CVS tree (cvs co swain)
# $Id: packageActivityReport.py,v 1.6 2005/01/31 23:49:02 swain Exp $ 
################################################################################



# Imports
#----------------------------------------------------------------------------------------------------
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
# The sendReport function
# *****************************************************************************
def sendReport(orgDn, templateId, reportText, csvReport, htmlReport):
   # Send the report
   cdate = time.localtime(time.time())

   # Strip the last \n's from the csvReport string and the reportText
   while (reportText[len(reportText)-1] == "\n"):
      reportText = reportText[:len(reportText)-2]
   while (csvReport[len(csvReport)-1] == "\n"):
      csvReport = csvReport[:len(csvReport)-2]

   csvReportBase64 = base64.encodestring(csvReport)
   htmlReportBase64 = base64.encodestring(htmlReport)

   # Build the parameters
   # For the subject, have to make a very crusty entries
   params = []
   params.append(evw.Core.StringPair("subject", "Package Events Report %s\nContent-Type: multipart/mixed; boundary=\"=-r3at43RBsm5bppNM3x2s\"\nMime-Version: 1.0" % (time.strftime("%Y-%m-%d %H:%M:%S", cdate))))
   params.append(evw.Core.StringPair("reporttext", reportText))
   params.append(evw.Core.StringPair("filename", "\"packageEvents_%s.csv\"" % (time.strftime("%Y%m%d%H%M%S", cdate))))
   params.append(evw.Core.StringPair("filenamehtml", "\"packageEvents_%s.html\"" % (time.strftime("%Y%m%d%H%M%S", cdate))))
   params.append(evw.Core.StringPair("reportcsv", csvReportBase64))
   params.append(evw.Core.StringPair("reporthtml", htmlReportBase64))

   # Send the report
   try:
      mailSpoolModule.sendMailWithTemplate(
         sessionkey, 
         "packageActivityReport.py",
         "Package Activity Report: %s" % (time.strftime("%Y-%m-%d %H:%M:%S", cdate)),
         templateId,
         orgDn,
         params)
   except:
      print "Unable to send the report using mail template %s" % templateId
      return 1


# *****************************************************************************
# The buildReportHTML function
# *****************************************************************************
def buildReportHTML(reportStr): 
   # Turn the report into an html page from the reportStr csv format
   reportHtml = "<html>\n<body bgcolor='white'>\n"

   t = string.replace(reportStr, "\n\n", "\n")
   rows = string.split(t, "\n")
  
   reportHtml = reportHtml + "<table border=1>\n"
   isHeading=1
   for row in rows:
      reportHtml = reportHtml + "   <tr>\n"
      if isHeading:
         #Output the heading   
         for field in string.split(row, ","):
            reportHtml = reportHtml + "      <th><font face=Arial>%s</font></th>\n" % (field)
         isHeading = 0
      else:      
         for field in string.split(row, ","):
            if field == "":
               field = "&nbsp;"               
            reportHtml = reportHtml + "      <td><font face=Arail>%s</font></td>\n" % (field)
      reportHtml = reportHtml + "   </tr>\n"

   reportHtml = reportHtml + "</table>\n"
   reportHtml = reportHtml + "</body></html>"

   return reportHtml
   
   
   

# *****************************************************************************
# The buildReportCSV function
# *****************************************************************************
def buildReportCSV(): 
   # Build the csv formatted string.
   reportStr = ""

   # Headings
   #reportStr="ISP,ORGANIZATION,ADDRESS,POSTAL,EMAIL,PHONE,ACTION DATE,ACTION,PACKAGE NAME,COST PROFILE,DOMAIN\n\n"
   reportStr="ISP\tORGANIZATION\tADDRESS\tADDRESS2\tCITY\tSTATE\tZIP\tCOUNTRY\tPOSTAL1\tP2\tPCITY\tPSTATE\tPZIP\tPCOUNTRY\tEMAIL\tPHONE\tACTION DATE\tACTION\tPACKAGE NAME\tCOST PROFILE\tDOMAIN\n\n"

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
            reportStr = reportStr + "%s\t" % (isp)
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["orgname"]))
            #reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["orgaddress"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["street"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["street2"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["city"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["zip"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["state"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["country"]))

            #reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["orgpostaladdress"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["pstreet"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["pstreet2"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["pcity"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["pzip"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["pstate"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["pcountry"]))

            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["email"]))
            reportStr = reportStr + "%s\t" % (string.strip(report[orgdn]["phone"]))
            # commented out 3/3/3 Steve Wainstead (this lets us get all values in all columns,
            # rather than the sparse matrix SF was sending out.)
            #isFirst = 0 
         else:
            reportStr = reportStr + " \t \t \t \t \t \t"

         # Add the package events
         dstr = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(event["actiontime"]))
         
         reportStr = reportStr + "%s\t" % (dstr)
         reportStr = reportStr + "%s\t" % (event["action"])
         reportStr = reportStr + "%s\t" % (event["evwpackagename"])
         reportStr = reportStr + "%s\t" % (event["evwpackagecostprofilename"])
         reportStr = reportStr + "%s\n" % (event["domain"])

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
      domainHistory.fqdn
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


   try:
      prodC.execute( sql )
      res=prodC.fetchall()
      
      for rec in res:

         #print ("%s %s %s %s %s %s" %  rec[0], rec[1], rec[2], rec[3], rec[4], rec[5])
         #print ("%s" %  rec[0])

         # Add the orgdn as the key in the report if it does not exist.
         if not report.has_key(rec[0]):
            globals()["report"][rec[0]] = {}
            globals()["report"][rec[0]]["packageinfo"] = []
            globals()["report"][rec[0]]["ispdn"] = rec[4]

         # Add all the package information
         if rec[5] == None:
            domain = "unknown"
         else:
            domain = rec[5]
         globals()["report"][rec[0]]["packageinfo"].append({"evwpackageid": rec[2], "domain": domain, "action" : rec[3], "actiontime": rec[1]})
            
   except:
      print "Error quering the products database for package events"
      print sys.exc_info()
      return 1


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
            globals()["report"][orgdn]["street"] = orgObj[0][1]["evwstreet1"][0]
            globals()["report"][orgdn]["street2"] = orgObj[0][1]["evwstreet2"][0]
            globals()["report"][orgdn]["city"] = orgObj[0][1]["evwstreetcity"][0]
            globals()["report"][orgdn]["zip"] = orgObj[0][1]["evwstreetzip"][0]
            globals()["report"][orgdn]["state"] = orgObj[0][1]["evwstreetstate"][0]
            globals()["report"][orgdn]["country"] = orgObj[0][1]["evwstreetcountry"][0]

            globals()["report"][orgdn]["pstreet"] = orgObj[0][1]["evwpostal1"][0]
            globals()["report"][orgdn]["pstreet2"] = orgObj[0][1]["evwpostal2"][0]
            globals()["report"][orgdn]["pcity"] = orgObj[0][1]["evwpostalcity"][0]
            globals()["report"][orgdn]["pzip"] = orgObj[0][1]["evwpostalzip"][0]
            globals()["report"][orgdn]["pstate"] = orgObj[0][1]["evwpostalstate"][0]
            globals()["report"][orgdn]["pcountry"] = orgObj[0][1]["evwpostalcountry"][0]

            # Add the already known data
            globals()["report"][orgdn]["orgname"] = orgObj[0][1]["cn"][0]
            globals()["report"][orgdn]["orgaddress"] = address
            globals()["report"][orgdn]["orgpostaladdress"] = postalAddr
            globals()["report"][orgdn]["email"] = orgObj[0][1]["evwemailaddress"][0]
            globals()["report"][orgdn]["phone"] = orgObj[0][1]["telephonenumber"][0]         
         except:
            # Could not get the org from LDAP.
            print "Removing the org %s from the report as no LDAP details exist" % (orgdn)
            del globals()["report"][orgdn] 

   except:
      print "Unable to obtain the organisation information from LDAP"
      return 1  


   # Obtain the package names
   # ----------------------------------------------------------   
   # Get the package names. (Use a small cache approach)
   packageNames = {}
   for orgdn in report.keys():
      # Loop through all the packages for the events in the date range
      for details in report[orgdn]["packageinfo"]:
         # Get the package name if not in the cache
         if not packageNames.has_key(details["evwpackageid"]):      
            packageNames[details["evwpackageid"]] = {}

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
      
         # Add the package name
         details["evwpackagename"] = packageNames[details["evwpackageid"]]["name"]
         details["evwpackagecostprofilename"] = packageNames[details["evwpackageid"]]["costprofilename"]

   return 0



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

   except:
      print "Error reading the configuration files."




   # Get the information for the report
   res = buildReportInformation()
   if (res):
      return res

   # Let's build the report 
   vals = buildReportCSV()
   reportHtml = buildReportHTML(vals[0])

   # exit early and often (for testing anyway)
   #print reportHtml
   #return 0
   csvfile = open('report.csv', 'w')
   csvfile.write(vals[0])
   csvfile.close()

   htmlfile = open('report.html', 'w')
   htmlfile.write(reportHtml)
   htmlfile.close()

   sumfile = open('report.sum', 'w')
   sumfile.write(vals[1])
   sumfile.close()
   return 0

   # Send the report using a mail template
   if ispdn == None:
      sendReport("", "1.3.6.1.4.1.3999.1.11.50.1.1", vals[1], vals[0], reportHtml)
   else:
      sendReport(ispdn, "1.3.6.1.4.1.3999.1.11.50.1.1", vals[1], vals[0], reportHtml)

   return 0   


if __name__ == '__main__':
   sys.exit(main(sys.argv))

