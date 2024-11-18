#!/usr/bin/python


#
# Name: connectToGenericAccountExtension.py
# Desc:
#


# Imports
#-------------------------------------------------------------------------------
import evw.Core
import evw.Accounts
import evw.Billing
import evw.GenericCreditCardExtension
from evw.CoreUtils import *
from Fnorb.orb import CORBA
from Fnorb.orb import TypeCode
from Fnorb.orb import TypeCode
import sys


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


# Build blank any
#-------------------------------------------------------------------------------
blankAny = CORBA.Any(TypeCode.NullTypeCode(),None)


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
   module = orb.string_to_object( ior )
   module.ping()
except:
   print "[ERROR] Unable to resolve and connect to the Accounts Module."
   print "        Please ensure that the Accounts Module is running and"
   print "        has bound with System."
   sys.exit(1)


# Resolve and connect to the GenericCreditCardExtension
#-------------------------------------------------------------------------------
try:
   extensionIor = module.getExtensionIOR("1.3.6.1.4.1.3999.1.9.1.1.15")
   genericCCExtension = orb.string_to_object(extensionIor)
   genericCCExtension.ping()
except:
   print "[ERROR] Unable to resolve and connect to the GenericCreditCardExtension."
   print "        Please ensure that the extension is running and"
   print "        has bound with System."
   sys.exit(1)

print ""

reqAuthID = 0
externalReference = ""

sys.stdout.write("Account ID: ")
accountID = string.strip( sys.stdin.readline() )

sys.stdout.write("Amount (in cents): ")
amount = string.strip( sys.stdin.readline() )

print "\n"

try:
   (reqAuthID,externalReference) = genericCCExtension.requestAuthorization(sessionkey,long(accountID),long(amount))
   print "Successfully performed a requestAuthorization"
   print "\n"
   print "Internal Reference = ", reqAuthID
   print "External Reference = ", externalReference
   print "\n"
except:
   print "[ERROR] Could not perform a requestAuthorization. "
   print "[ERROR] Please check the GenericCreditCardExtension log for more information."
   print "\n"


