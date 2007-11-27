#!/usr/bin/python

# $Id: listPhotoBuddies.py,v 1.4 2005/04/21 20:29:00 swain Exp $

# Name: listPhotoBuddies.py
# Desc: get the full pathname to the user's site, and evw username; input is orgdn, fqdn
# Auth: swain.py
# See the CVS log for more info

# Imports
#-------------------------------------------------------------------------------
from Conf import *
from Fnorb.orb import CORBA
from Fnorb.orb import TypeCode
from evw.CoreUtils import *
from socket import *
import evw.Apache
import evw.Base
import evw.Core
import evw.Server
import ldap
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


if ( len(sys.argv) != 4):
   print "usage: %s username password inputfile" % (sys.argv[0])
   print "where <inputfile> is a tab delimited file orgdn,fqdn"
   sys.exit(1)
   
login    = sys.argv[1]
password = sys.argv[2]


# Initialise ORB
#-------------------------------------------------------------------------------
try:
   orb = CORBA.ORB_init(sys.argv, CORBA.ORB_ID )
except:
   print "[ERROR] Unable to Initialize the ORB"
   sys.exit(1)


# # Connect to System
# #-------------------------------------------------------------------------------
system = connectToSystem(orb)


# # Authenticate
# #-------------------------------------------------------------------------------

try:
   orgDn = "o="
   orgDn = orgDn + system.getClientId()
   sessionkey = system.authenticate( system.getUserDn( login, orgDn ), password,  "" )
except:
   print "[ERROR] Unable to authenticate with System. Please ensure that the"
   print "        Evolutionware System is running and the password is correct."
   sys.exit(1)

try:
   session = system.connectToSession( sessionkey )
except:
   print "[ERROR] Unable to connect to the User Session: " + sessionkey
   sys.exit(1)


###  BaseModule.conf
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


dn = []
dn.append("") # for mneumonic purposes, we'll use index number to refer to cws server.
dn.append("evwService=Web,evwHostname=cws-1.prv.ampira.com,evwNetwork=DMZ1,ou=Infrastructure,o=FCTY")
dn.append("evwService=Web,evwHostname=cws-2.prv.ampira.com,evwNetwork=DMZ1,ou=Infrastructure,o=FCTY")
dn.append("evwService=Web,evwHostname=cws-3.prv.ampira.com,evwNetwork=DMZ1,ou=Infrastructure,o=FCTY")
dn.append("evwService=Web,evwHostname=cws-4.prv.ampira.com,evwNetwork=DMZ1,ou=Infrastructure,o=FCTY")
dn.append("evwService=Web,evwHostname=cws-5.prv.ampira.com,evwNetwork=DMZ1,ou=Infrastructure,o=FCTY")

cws = []
cws.append("")

for i in range(1,len(dn)):
   #print "dn[%d] is %s" % (i, dn[i])
   try:
      iorstr = system.resolve(dn[i])
      cws.append(orb.string_to_object(iorstr))
      cws[i].ping()
   except:
      print "[ERROR] Could not speak to agent on cws-%d.ampira.com" % (i)
      errstuff = sys.exc_info()
      print errstuff[0], errstuff[1]
      traceback.print_exc()
      sys.exit(1)


### end setup. follows: action code


baseDn = "o=FC Gold,ou=Clients,o=FCTY"
seachScope = ldap.SCOPE_SUBTREE


infile = sys.argv[3]

fileobj = open(infile)
filestuff = fileobj.read()
filelines = string.split(filestuff, '\n')

#print "got this many orgDns from the input file '%s': %d\n" % (infile, len(filelines))

for i in (range(len(filelines))):

    if (filelines[i] == ""):
        continue
    #print filelines[i]
    orgdata = string.split(filelines[i], '\t')
    hasorgflag = 1

    try:
       webFqdn = "www." + orgdata[1]

       # get the evwtrustlist for this org, which contains the legit user
       #print "searching for " + orgdata[0]
       ldap_result_id = ldapObj.search(orgdata[0], seachScope, "(objectclass=organization)", ["evwtrustlist"])
       result_type, result_data = ldapObj.result(ldap_result_id, 0)
       if (result_data == []):
          print "ERROR got no organization object for %s" % (filelines[i])
          hasorgflag = 0
       
       if result_type != ldap.RES_SEARCH_ENTRY:
          print "ERROR (org search) didn't get a result search entry back for %s" % (filelines[i])
          hasorgflag = 0

    except: #ldap.LDAPError, e:
       print "some problem with ldap"
       print sys.exc_info()

    # python 1.5 does not allow continue statements inside try blocks, so...
    if (hasorgflag == 0):
       continue

    evwtrustlist = result_data[0][1]["evwtrustlist"][0]
    trustfields = string.split(evwtrustlist, '|')
    userdn = trustfields[2]
    userdnfields = string.split(userdn, ',')
    userfield = string.split(userdnfields[0], '=')
    username = userfield[1]

    # iterate over the cws apache agents, ask for the path
    found = 0
    path = "unknown"
    
    for i in (range(1,1)):
       try:
          path = cws[i].getFqdnRoot(sessionkey, webFqdn)
          found = 1
          break
       except:
          found = 0 # or a noop, if you prefer
          #print "cws-%d excepted." % (i)
          
       if found == 0:
          path = "ERROR: UNKNOWN PATH"

    print "%s\t%s\t%s" % (webFqdn, path, username)       

#print "End of line."
