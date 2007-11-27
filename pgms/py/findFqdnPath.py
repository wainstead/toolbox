#!/usr/bin/python
#
# Name: findFqdnPath.py
# Desc: list all the users and their info, print CSV output to stdout
# Auth: some swain guy

# this script is a copy of WhereIsMyDomainFqdn.py from
# /opt/evw/scripts. It's been expanded to query all the cws servers'
# agents.

# Imports
#-------------------------------------------------------------------------------
import evw.Core
import evw.Web
import evw.Apache
from evw.CoreUtils import *
from Fnorb.orb import CORBA
from Fnorb.orb import TypeCode
import sys
import traceback

#####
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
system = connectToSystem(orb)


# Authenticate
#-------------------------------------------------------------------------------

if (len(sys.argv) != 4):
   print "usage: %s usename pw fqdn" % (sys.argv[0])
   sys.exit()

try:
   orgDn = "o="
   orgDn = orgDn + system.getClientId()
   sessionkey = system.authenticate( system.getUserDn( sys.argv[1], orgDn ), sys.argv[2],  "" )
except:
   print "[ERROR] Unable to authenticate with System. Please ensure that the"
   print "        Evolutionware System is running and the password is correct."
   sys.exit(1)

#print "sessionkey: %s" % sessionkey
#userDn  = system.getDnForSessionkey( sessionkey )
#print "userDn: %s" % userDn

try:
   session = system.connectToSession( sessionkey )
except:
   print "[ERROR] Unable to connect to the User Session: " + sessionkey
   sys.exit(1)

#print "dn: %s" % session.getDn()
#print "ispDn: %s" % session.getIspDn()

####

dn = []
dn.append("") # for mneumonic purposes, we'll use index number to refer to cws server.
dn.append("evwService=Web,evwHostname=cws-1.prv.ampira.com,evwNetwork=DMZ1,ou=Infrastructure,o=FCTY")
dn.append("evwService=Web,evwHostname=cws-2.prv.ampira.com,evwNetwork=DMZ1,ou=Infrastructure,o=FCTY")
dn.append("evwService=Web,evwHostname=cws-3.prv.ampira.com,evwNetwork=DMZ1,ou=Infrastructure,o=FCTY")
dn.append("evwService=Web,evwHostname=cws-4.prv.ampira.com,evwNetwork=DMZ1,ou=Infrastructure,o=FCTY")
dn.append("evwService=Web,evwHostname=cws-5.prv.ampira.com,evwNetwork=DMZ1,ou=Infrastructure,o=FCTY")

cws = []
cws.append("")

for i in range(1,6):
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
      
#print "end of line."
#sys.exit()


# Process Commands
#-------------------------------------------------------------------------------
print"Checking domain [%s]" %(sys.argv[3])

found = 0
for i in (range(1,6)):
   try:
      path = cws[i].getFqdnRoot(sessionkey, sys.argv[3])
      found = 1
      break
   except:
      found = 0 # or a noop, if you prefer
      #print "cws-%d excepted." % (i)


if found == 0:
   print "Domain [%s] Not Found (Have you tried putting www.domain.com)" %(sys.argv[3])
   sys.exit(1)

print "Path is [%s/web]" %(path)
