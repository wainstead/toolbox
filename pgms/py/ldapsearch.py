#!/usr/local/bin/python

from Fnorb.orb import CORBA
import evw.Product
import evw.MailSpool
from evw.CoreUtils import *
import evw.Core
from Conf import *

import ldap

sessionkey = ""
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



