#!/usr/bin/python

# code borrowed from billing/GenericCreditCard/customersAwaitingVettingReport.vps
# $Id: vetting.py,v 1.3 2003/07/29 21:41:17 swain Exp $

# Imports
#-------------------------------------------------------------------------------------------------
from evw.CoreUtils import *
import evw.Core
import evw.Base
import evw.Accounts
from time import *
import string
import evw.GenericCreditCardExtension

import evw.Billing
import evw.GenericCreditCardExtension
from Fnorb.orb import CORBA
from Fnorb.orb import TypeCode
import sys


# insert standard system connection code here



# connectToSystem( orb )
#-------------------------------------------------------------------------------
def connectToSystem( orb ):
   
   # Read the IOR from disk                                                                     
   try:
      i = open( '/var/System.ior', 'r' )
      ior = i.readline()
   
      while ior[ len(ior) -1] == '\n':
         ior = ior[0 :len(ior) - 1]

      i.close()
   except:
      print "[ERROR] Unable to retrieve the IOR for System from /var/System.ior"
      sys.exit(1)

   # Convert ior to object
   try:
      system = orb.string_to_object(ior)
      system.ping()
   except:
      print "[ERROR] Unable to connect to the Evolutionware System."
      print "        Please ensure that the System binary is running and the IOR"
      print "        for System can be found in /var/System,ior"
      sys.exit(1)

   return system


# Initialise ORB
#-------------------------------------------------------------------------------
try:
   orb = CORBA.ORB_init(sys.argv, CORBA.ORB_ID )
except:
   print "[ERROR] Unable to Initialize the ORB"
   sys.exit(1)




# Connect to System
#-------------------------------------------------------------------------------
print ""
system = connectToSystem(orb)


# Authenticate
#-------------------------------------------------------------------------------
sys.stdout.write("Admin Password: ")
adminPassword = string.strip( sys.stdin.readline() )

try:
   ispDn = "o=" + system.getClientId()
   userDn = system.getUserDn("admin", ispDn)
   sessionkey = system.authenticate( userDn, adminPassword, "")

except:
   print "[ERROR] Unable to authenticate with System. Please ensure that the"
   print "        Evolutionware System is running and the password is correct."
   sys.exit(1)


#-------------------------------------------------------------------------------
try:
   session = system.connectToSession( sessionkey )
except:
   print "[ERROR] Unable to connect to the User Session: " + sessionkey
   sys.exit(1)


# Resolve and connect to the Accounts Module
#-------------------------------------------------------------------------------
try:
   ior = system.resolve("Accounts Module")
   accountManager = orb.string_to_object( ior )
   accountManager.ping()
except:
   print "[ERROR] Unable to resolve and connect to the Accounts Module."
   print "        Please ensure that the Accounts Module is running and"
   print "        has bound with System."
   sys.exit(1)


# # Resolve and connect to the GenericCreditCardExtension
# #-------------------------------------------------------------------------------
try:
   extensionIor = accountManager.getExtensionIOR("1.3.6.1.4.1.3999.1.9.1.1.15")
   genericCCExtension = orb.string_to_object(extensionIor)
   genericCCExtension.ping()
except:
   print "[ERROR] Unable to resolve and connect to the GenericCreditCardExtension."
   print "        Please ensure that the extension is running and"
   print "        has bound with System."
   print sys.exc_info()
   sys.exit(456789)



# end standard system connection code



try:
   databaseName     = "evw"
   databaseUsername = "evwbill"
   databasePassword = "112233"
   databaseType     = "DB2"
except:
   print "Unable to retrieve session variables for session : %s " % sessionkey



try:
   # AccountDn is actually the merchant accountDn
   #accountDn = session.get("accountDn")
   # stolen from the web page source after hacking in an echo()
   accountDn = "evwMerchantAccountId=0000000162,evwMerchantId=0000000081,o=HostV3,ou=Clients,o=DMFC"
   merchantAccountId = accountManager.getMerchantAccountIdFromDn(sessionkey, accountDn)
except:
   print "Could not get the merchant account id."


pageInfo = [ ]

try:
   conn=connectToDB(databaseType, databaseName, databaseUsername, databasePassword)
   c=conn.cursor()

   # Only select the entries for the merchant Id
   sqlQuery =            "SELECT "     
   sqlQuery = sqlQuery + "   genericCcVetting.reqAuthId, genericCcVetting.type, accountHolders.clientName,"
   sqlQuery = sqlQuery + "   amount, genericCcRequestAuth.currency, cardHolderName, creditCardNumber, expiryDate, CVV2,"
   sqlQuery = sqlQuery + "   avsAddressVerification, avsCity, avsState, avsZipCode,"
   sqlQuery = sqlQuery + "   avsCountry, avsTelephone, email,"
   sqlQuery = sqlQuery + "   dateUTC, gatewayMessage, gatewayAvsData, gatewayCvv2Data, "
   sqlQuery = sqlQuery + "   genericCcRequestAuth.accountId, accountHolders.organisationDn "
   sqlQuery = sqlQuery + "FROM"
   sqlQuery = sqlQuery + "   accounts, accountHolders, genericCcRequestAuth, genericCcVetting "
   sqlQuery = sqlQuery + "WHERE"
   sqlQuery = sqlQuery + "   genericCcRequestAuth.merchantAccountId = %ld AND" % (merchantAccountId)
   sqlQuery = sqlQuery + "   genericCcVetting.status = 'WA' AND"
   sqlQuery = sqlQuery + "   genericCcRequestAuth.accountId <> 0 AND"
   sqlQuery = sqlQuery + "   genericCcVetting.reqAuthId = genericCcRequestAuth.reqAuthId AND"
   sqlQuery = sqlQuery + "   accounts.accountId = genericCcRequestAuth.accountId AND"
   sqlQuery = sqlQuery + "   accountHolders.accountHolderId = accounts.accountHolderId "
   sqlQuery = sqlQuery + "ORDER BY"
   sqlQuery = sqlQuery + "   genericCcRequestAuth.accountId, genericCcRequestAuth.timeStamp"

   c.execute( sqlQuery )
   res=c.fetchall()


   reqAuthID = 0
   externalReference = ""

   
   # loop over entries in job queue, do preauth for each.
   for entry in res:
      #print entry
      accountID = entry[20]
      amount    = entry[3]
      accountname = entry[2]
      print "doing accountname: %s, accountid: %d,  amount: %d" % (accountname, accountID, amount)
      #for n in range(len(entry)):
      ##    print "%d: %s" % (n, entry[n])
      try:
         (reqAuthID,externalReference) = genericCCExtension.requestAuthorization(sessionkey,long(accountID),long(amount))
         print "Successfully performed a requestAuthorization"
         print "\n"
         print "Internal Reference = ", reqAuthID
         print "External Reference = ", externalReference
         #print "accountname: %s, accountID: %d, amount: %d" % (accountname, accoundID, amount)
         print "\n"
      except:
         print "[ERROR] Could not perform a requestAuthorization. "
         print "[ERROR] Please check the GenericCreditCardExtension log for more information."
         print "\n"

      
except:
   print "no dice. bad things happened."
   print sys.exc_info()


