#!/usr/bin/python
#
# Name: listUsers.py
# Desc: list all the users and their info, print CSV output to stdout
# Auth: some swain guy


# Imports
#-------------------------------------------------------------------------------
import evw.Core
from evw.CoreUtils import *
from Fnorb.orb import CORBA
from Fnorb.orb import TypeCode
import sys
import evw.Base
from Conf import *
import ldap

login    = "admin"
password = "vcx874"

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

# try:
#    orb = CORBA.ORB_init(sys.argv, CORBA.ORB_ID )
# except:
#    print "[ERROR] Unable to Initialize the ORB"
#    sys.exit(1)


# # Connect to System
# #-------------------------------------------------------------------------------
# system = connectToSystem(orb)


# # Authenticate
# #-------------------------------------------------------------------------------

# try:
#    orgDn = "o="
#    orgDn = orgDn + system.getClientId()
#    sessionkey = system.authenticate( system.getUserDn( login, orgDn ), password,  "" )
# except:
#    print "[ERROR] Unable to authenticate with System. Please ensure that the"
#    print "        Evolutionware System is running and the password is correct."
#    sys.exit(1)

# print "sessionkey: %s" % sessionkey
# userDn  = system.getDnForSessionkey( sessionkey )
# print "userDn: %s" % userDn

# try:
#    session = system.connectToSession( sessionkey )
# except:
#    print "[ERROR] Unable to connect to the User Session: " + sessionkey
#    sys.exit(1)

# print "dn: %s" % session.getDn()
# print "ispDn: %s" % session.getIspDn()

# try:
#    ior = system.resolve("User Manager")
#    userManager = orb.string_to_object( ior )
#    userManager.ping()
# except:
#    print "Unable to connect to the User Manager"
#    sys.exit(2)

# try:
#    userIor = userManager.selectUser( sessionkey , userDn )
#    User = orb.string_to_object( userIor )
# except:
#    print "Unable to connect to User : %s" % userDn

try:
   orb = CORBA.ORB_init(sys.argv, CORBA.ORB_ID )
except:
   print "[ERROR] Unable to Initialize the ORB"
   sys.exit(1)


# Connect to System
#-------------------------------------------------------------------------------
system = connectToSystem(orb)


# Authenticate
#-------------------------------------------------------------------------------

try:
   orgDn = "o="
   orgDn = orgDn + system.getClientId()
   sessionkey = system.authenticate( system.getUserDn( "admin", orgDn ), "sffc:)",  "" )
except:
   print "[ERROR] Unable to authenticate with System. Please ensure that the"
   print "        Evolutionware System is running and the password is correct."
   sys.exit(1)

print "sessionkey: %s" % sessionkey
userDn  = system.getDnForSessionkey( sessionkey )
print "userDn: %s" % userDn

try:
   session = system.connectToSession( sessionkey )
except:
   print "[ERROR] Unable to connect to the User Session: " + sessionkey
   sys.exit(1)

print "dn: %s" % session.getDn()
print "ispDn: %s" % session.getIspDn()

try:
   ior = system.resolve("User Manager")
   userManager = orb.string_to_object( ior )
   userManager.ping()
except:
   print "Unable to connect to the User Manager"
   sys.exit(2)

try:
   userIor = userManager.selectUser( sessionkey , userDn )
   User = orb.string_to_object( userIor )
except:
   print "Unable to connect to User : %s" % userDn


# userPass = User.getPassword( sessionkey )
# print "password: %s" % userPass


#  BaseModule.conf
try:
   baseConf = ConfigParser()
   baseConf.read( "/opt/evw/etc/BaseModule.conf")
   
   ldapHost = baseConf.get("Ldap", "Hostname")
   ldapPort = baseConf.getint("Ldap", "Port")
   ldapBindDn = baseConf.get("Ldap", "Dn")
   ldapBindPass = baseConf.get("Ldap", "Password")
except:
   print "ERROR: Unable to read BaseModule.conf"

# Connect and bind to LDAP as base module
ldapObj = None
try:
   ldapObj = ldap.open(ldapHost, ldapPort)
   ldapObj.simple_bind_s(ldapBindDn, ldapBindPass)
except:
   print "Unable to connect and bind to LDAP server."

#orgObj = ldapResultToLowerCase(ldapObj.search_s("o=FCDE", ldap.SCOPE_BASE, "(objectclass=organization)"))
baseDn = "ou=Clients,o=FCTY"
seachScope = ldap.SCOPE_SUBTREE
retrieveAttributes = None
searchFilter = "objectclass=person"

#print "username\tfirstname\tlastname\tpassword\temail\torgDn"
try:
   ldap_result_id = ldapObj.search(baseDn,seachScope, searchFilter,retrieveAttributes)
   result_set = []
   while 1:
      result_type, result_data = ldapObj.result(ldap_result_id, 0)
      if (result_data == []):
         break
      else:
         if result_type == ldap.RES_SEARCH_ENTRY:
            result_set.append(result_data)

# ldapsearch -h db2-1.prv.ampira.com -p 400 -D "cn=Directory Manager" -w "11223344" -b "ou=Clients,o=FCTY" "username=*" username cn sn userpassword evwemailaddress| wc -l

   print len(result_set)
   for item in result_set:

#      print "%s\t%s\t%s\t%s" % (item[0][1]["username"][0], item[0][1]["cn"][0], item[0][1]["sn"][0], item[0][1]["evwemailaddress"][0])
      print "%s\t%s\t%s\t%s\t%s\t%s" % (item[0][1]["username"][0], item[0][1]["cn"][0], item[0][1]["sn"][0], item[0][1]["evwcleartextpassword"][0], item[0][1]["evwemailaddress"][0], item[0][1]["evworgdn"][0])

      
except: #ldap.LDAPError, e:
   print "some problem with ldap"

print "End of line."
