#!/usr/bin/python

# $Id: orgs.py,v 1.4 2004/04/30 21:19:59 swain Exp $

# Find all clients who own an org in EVW, and find their first and last names.
# This script has training wheels on.
# SW May 2003

# Imports
#----------------------------------------------------------------------------------------------------
from Fnorb.orb import CORBA
import evw.Product
from evw.CoreUtils import *
import evw.Core
from Conf import *

import ldap


# Global vars
ispdn = "FCTY"
password = "sffc:)"
username = "admin"

sessionkey=None
productModule=None
billC=None
ldapObj=None
orgDict = {}

# initialize connections to assorted systems (CORBA, Prod Module, DB2)

def init():

   # Connect to system.
   #-------------------------------------------------------------------------------
   password = globals()["password"]
   username = globals()["username"]

   try:
      orb = CORBA.ORB_init(sys.argv, CORBA.ORB_ID )
      system = connectToSystem(orb)
      globals()["sessionkey"] = system.authenticate( system.getUserDn( username, "o=" + system.getClientId() ), password,  "" )
   except:
      print "Unable to authenticate with system"
      print sys.exc_info()
      return 1

   #print "got the org"
   # Connect to productModule
   try:
      ior = system.resolve("Product Module")
      globals()["productModule"] = orb.string_to_object( ior )
      productModule.ping()   
   except:
      print "Unable to connect to productModule"
      print sys.exc_info()
      return 1

   #print "got the PM"
   
   # Get the evwhome
   try:
      evwHome = os.environ['EVW_HOME']
   except KeyError:
      evwHome = "/opt/evw"

   #print "home is %s" % evwHome
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
         print sys.exc_info()
         return 1

      #print "got the billing conf info"

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
         print sys.exc_info()
         return 1

      #print "and the base and ldap crap..."
      
      # Create a db connection to billing
      try:
         billConn=connectToDB(billDatabaseType, billDatabaseName, billDatabaseUsername, billDatabasePassword)
         globals()["billC"]=billConn.cursor()
      except:
         print "Error, unable to connect to the billing database"
         print sys.exc_info()
         return 1
      
      #print "connected to billing db"
      # Connect and bind to LDAP as base module
      try:
         globals()["ldapObj"] = ldap.open(ldapHost, ldapPort)
         ldapObj.simple_bind_s(ldapBindDn, ldapBindPass)
      except:
         print "Unable to connect and bind to LDAP server."
         print sys.exc_info()
         return 1

      #print "connected to ldap!"
   except:
      print "Error reading the configuration files."
      print sys.exc_info()
      return 1

   # end init
   #********************************************************************
   



# *****************************************************************************
# The main function
# *****************************************************************************

def main(argv):

    # do your thing from here on down.
    if (init() == 1):
       print "Failed to initialize."
       sys.exit(1)


    # get ldap info
    try:
        baseDn = "ou=Clients,o=" + globals()["ispdn"]
        #print "baseDn: %s" % baseDn
        searchScope = ldap.SCOPE_SUBTREE
        retrieveAttributes = ["evwemailaddress"]
        searchFilter = "evworgtype=ORG"

        ldap_result_id = ldapObj.search(baseDn, searchScope, searchFilter, retrieveAttributes)
        result_set = []
        while 1:
            result_type, result_data = ldapObj.result(ldap_result_id, 0)
            if (result_data == []):
                break
            else:
                if result_type == ldap.RES_SEARCH_ENTRY:
                    result_set.append(result_data)


        print "length of result set: %d" % len(result_set)
        for item in result_set:
            #print item
            #print "%s '%s'" % (item[0][0], item[0][1]["evwemailaddress"][0])
            orgDict[item[0][1]["evwemailaddress"][0]] = item[0][0]

    except:
        print "error querying ldap first time"
        print "%s\n%s\n%s\n" % sys.exc_info()
        sys.exit(2)

    print "size of orgDict: %d" % len(orgDict)

    
    try:
        baseDn = "ou=Clients,o=" + globals()["ispdn"]
        searchScope = ldap.SCOPE_SUBTREE
        retrieveAttributes = ["cn", "sn", "evwemailaddress"]
        searchFilter = "(&(evwemailaddress=*)(objectclass=person))"

        ldap_result_id = ldapObj.search(baseDn, searchScope, searchFilter, retrieveAttributes)
        result_set = []
        while 1:
            result_type, result_data = ldapObj.result(ldap_result_id, 0)
            if (result_data == []):
                break
            else:
                if result_type == ldap.RES_SEARCH_ENTRY:
                    result_set.append(result_data)


        print "length of result set: %d" % len(result_set)
        counter = 0
        noncounter = 0
        for item in result_set:
            #print item
            temp = item[0][1] # screw typing it all out
            #print "%s %s %s" % (temp["evwemailaddress"][0], temp["cn"][0], temp["sn"][0])
            #print item[0][1]["evwemailaddress"][0]
            if ( orgDict.has_key( temp["evwemailaddress"][0] ) ):
                #print "found this one in orgDict: %s" % item[0][1]["evwemailaddress"][0]
                print "%s; %s %s; %s" % (temp["evwemailaddress"][0], temp["cn"][0], temp["sn"][0], item[0][0])
                counter = counter + 1
            else:
               noncounter = noncounter + 1
               #                 print "didn't match on '%s' (%s)" % (item[0][1]["evwemailaddress"][0], item[0][0])
               #                 #print "didn't match on '%s'" % (item[0][1]["evwemailaddress"][0])

        print "matches: %d" % counter
        print "nonmatches: %d" % noncounter
    except:
        print "error querying ldap second time"
        print "%s\n%s\n%s\n" % sys.exc_info()
        sys.exit(3)

if __name__ == '__main__':
   sys.exit(main(sys.argv))
