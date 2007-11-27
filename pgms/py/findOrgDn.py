#!/usr/bin/python

# parse any dn string for the isp
# $Id: findOrgDn.py,v 1.1 2003/06/27 20:12:07 swain Exp $

from evw.CoreUtils import *


def getISPName(dn):
    """Get ISP name from dn"""
    
    # ISP name will always be the second o=
    i = string.find(dn, "o=")
    isp = dn[i+2:]
    i = string.find(isp, "o=")
    isp = isp[i:]
    return isp
    
                               


loginDn = "username=xlsupply,ou=People,o=XLSUPPLY,o=HostV3,ou=Clients,o=DMFC"

print getISPName(loginDn)

print "username=admin,ou=people,o=DMFC"
print getISPName("username=admin,ou=people,o=DMFC")
print "username=admin,ou=People,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=admin,ou=People,o=FC Gold,ou=Clients,o=DMFC")
print "username=sf,ou=People,o=Systemsfusion Inc.,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=sf,ou=People,o=Systemsfusion Inc.,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=sf,ou=People,o=Systemsfusion Inc.,ou=Clients,o=DMFC"
print getISPName("username=sf,ou=People,o=Systemsfusion Inc.,ou=Clients,o=DMFC")
print "username=robw,ou=People,o=Systemsfusion Inc.,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=robw,ou=People,o=Systemsfusion Inc.,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=GlobalScape,ou=People,o=GlobalScape,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=GlobalScape,ou=People,o=GlobalScape,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=Brian,ou=People,o=GlobalScape,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=Brian,ou=People,o=GlobalScape,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=TomW,ou=People,o=Org022,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=TomW,ou=People,o=Org022,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=Dave,ou=People,o=Dsmith,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=Dave,ou=People,o=Dsmith,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=Jim,ou=People,o=JimBo,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=Jim,ou=People,o=JimBo,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=David,ou=People,o=GlobalScape,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=David,ou=People,o=GlobalScape,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=Al,ou=People,o=Blakes,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=Al,ou=People,o=Blakes,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=JohnM,ou=People,o=JohnM Shoes,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=JohnM,ou=People,o=JohnM Shoes,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=Youraccount,ou=People,o=YourAccount,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=Youraccount,ou=People,o=YourAccount,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=petrus,ou=People,o=Petrus Du Toit,ou=Clients,o=DMFC"
print getISPName("username=petrus,ou=People,o=Petrus Du Toit,ou=Clients,o=DMFC")
print "username=StageTest,ou=People,o=AmpiraTest,ou=Clients,o=DMFC"
print getISPName("username=StageTest,ou=People,o=AmpiraTest,ou=Clients,o=DMFC")
print "username=petrus1,ou=People,o=Petrus Du Toit,ou=Clients,o=DMFC"
print getISPName("username=petrus1,ou=People,o=Petrus Du Toit,ou=Clients,o=DMFC")
print "username=jingram,ou=People,o=Johnathan Ingram,ou=Clients,o=DMFC"
print getISPName("username=jingram,ou=People,o=Johnathan Ingram,ou=Clients,o=DMFC")
print "username=test100,ou=People,o=Rwalker,ou=Clients,o=DMFC"
print getISPName("username=test100,ou=People,o=Rwalker,ou=Clients,o=DMFC")
print "username=Brian,ou=People,o=Christal,ou=Clients,o=DMFC"
print getISPName("username=Brian,ou=People,o=Christal,ou=Clients,o=DMFC")
print "username=ericstaging,ou=People,o=FortuneCity,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=ericstaging,ou=People,o=FortuneCity,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=FCGTest001,ou=People,o=FCGTest001,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=FCGTest001,ou=People,o=FCGTest001,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=FCGTest004,ou=People,o=FCGTest004,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=FCGTest004,ou=People,o=FCGTest004,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=FCGTest003,ou=People,o=FCGTest003,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=FCGTest003,ou=People,o=FCGTest003,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=FCGTest005,ou=People,o=FCGTest005,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=FCGTest005,ou=People,o=FCGTest005,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=FCGTest006,ou=People,o=FCGTest006,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=FCGTest006,ou=People,o=FCGTest006,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=FCGTest007,ou=People,o=FCGTest007,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=FCGTest007,ou=People,o=FCGTest007,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=FCGTest008,ou=People,o=FCGTest008,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=FCGTest008,ou=People,o=FCGTest008,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=FCGTest009,ou=People,o=FCGTest009,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=FCGTest009,ou=People,o=FCGTest009,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=ericampirastaging,ou=People,o=ampirastaging,ou=Clients,o=DMFC"
print getISPName("username=ericampirastaging,ou=People,o=ampirastaging,ou=Clients,o=DMFC")
print "username=ericstaging2,ou=People,o=ericstaging2,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=ericstaging2,ou=People,o=ericstaging2,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=ericampirastaging3,ou=People,o=ericampirastaging3,ou=Clients,o=DMFC"
print getISPName("username=ericampirastaging3,ou=People,o=ericampirastaging3,ou=Clients,o=DMFC")
print "username=ericstandard,ou=People,o=ericstandard,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=ericstandard,ou=People,o=ericstandard,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=ericpower,ou=People,o=ericpower,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=ericpower,ou=People,o=ericpower,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=FCGTest010,ou=People,o=FCGTest010,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=FCGTest010,ou=People,o=FCGTest010,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=FCGTest020,ou=People,o=FCGTest020,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=FCGTest020,ou=People,o=FCGTest020,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=ericpower2,ou=People,o=ericpower2,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=ericpower2,ou=People,o=ericpower2,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=ericstandard2,ou=People,o=ericstandard2,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=ericstandard2,ou=People,o=ericstandard2,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=ericexpert,ou=People,o=ericexpert,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=ericexpert,ou=People,o=ericexpert,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=ericstandard3,ou=People,o=ericstandard3,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=ericstandard3,ou=People,o=ericstandard3,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=ericpower3,ou=People,o=ericpower3,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=ericpower3,ou=People,o=ericpower3,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=eshexpert,ou=People,o=eshexpert,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=eshexpert,ou=People,o=eshexpert,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=AmpiraTest001,ou=People,o=AmpiraTest001,ou=Clients,o=DMFC"
print getISPName("username=AmpiraTest001,ou=People,o=AmpiraTest001,ou=Clients,o=DMFC")
print "username=admin,ou=People,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=admin,ou=People,o=GlobalScape,ou=Clients,o=DMFC")
print "username=expertmonthly,ou=People,o=expertmonthly,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=expertmonthly,ou=People,o=expertmonthly,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=ericpower4,ou=People,o=ericpower4,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=ericpower4,ou=People,o=ericpower4,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=ericstandard4,ou=People,o=ericstandard4 Inc.,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=ericstandard4,ou=People,o=ericstandard4 Inc.,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=blahwhooey,ou=People,o=blahblah,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=blahwhooey,ou=People,o=blahblah,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=experteric,ou=People,o=experteric,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=experteric,ou=People,o=experteric,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=EricStandardYearly,ou=People,o=fortunecity.com,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=EricStandardYearly,ou=People,o=fortunecity.com,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=InvoiceDemo,ou=People,o=InvoiceDemo,ou=Clients,o=DMFC"
print getISPName("username=InvoiceDemo,ou=People,o=InvoiceDemo,ou=Clients,o=DMFC")
print "username=test009,ou=People,o=Test009,ou=Clients,o=DMFC"
print getISPName("username=test009,ou=People,o=Test009,ou=Clients,o=DMFC")
print "username=ampiratest002,ou=People,o=ampiratest002,ou=Clients,o=DMFC"
print getISPName("username=ampiratest002,ou=People,o=ampiratest002,ou=Clients,o=DMFC")
print "username=ampiratest003,ou=People,o=ampiratest003,ou=Clients,o=DMFC"
print getISPName("username=ampiratest003,ou=People,o=ampiratest003,ou=Clients,o=DMFC")
print "username=ampiratest004,ou=People,o=ampiratest004,ou=Clients,o=DMFC"
print getISPName("username=ampiratest004,ou=People,o=ampiratest004,ou=Clients,o=DMFC")
print "username=ampiratest005,ou=People,o=ampiratest005,ou=Clients,o=DMFC"
print getISPName("username=ampiratest005,ou=People,o=ampiratest005,ou=Clients,o=DMFC")
print "username=ampiratest006,ou=People,o=ampiratest006,ou=Clients,o=DMFC"
print getISPName("username=ampiratest006,ou=People,o=ampiratest006,ou=Clients,o=DMFC")
print "username=ampiratest010,ou=People,o=ampiratest010,ou=Clients,o=DMFC"
print getISPName("username=ampiratest010,ou=People,o=ampiratest010,ou=Clients,o=DMFC")
print "username=ampiratest020,ou=People,o=ampiratest020,ou=Clients,o=DMFC"
print getISPName("username=ampiratest020,ou=People,o=ampiratest020,ou=Clients,o=DMFC")
print "username=ampiratest030,ou=People,o=ampiratest030,ou=Clients,o=DMFC"
print getISPName("username=ampiratest030,ou=People,o=ampiratest030,ou=Clients,o=DMFC")
print "username=ampiratest040,ou=People,o=ampiratest040,ou=Clients,o=DMFC"
print getISPName("username=ampiratest040,ou=People,o=ampiratest040,ou=Clients,o=DMFC")
print "username=chrisf,ou=People,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=chrisf,ou=People,o=GlobalScape,ou=Clients,o=DMFC")
print "username=zlatin,ou=People,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=zlatin,ou=People,o=GlobalScape,ou=Clients,o=DMFC")
print "username=lysa,ou=People,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=lysa,ou=People,o=GlobalScape,ou=Clients,o=DMFC")
print "username=rob,ou=People,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=rob,ou=People,o=GlobalScape,ou=Clients,o=DMFC")
print "username=swolf,ou=People,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=swolf,ou=People,o=GlobalScape,ou=Clients,o=DMFC")
print "username=chrisferry,ou=People,o=duh,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=chrisferry,ou=People,o=duh,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC")
print "username=erictest01,ou=People,o=erictest01,ou=Clients,o=DMFC"
print getISPName("username=erictest01,ou=People,o=erictest01,ou=Clients,o=DMFC")
print "username=ericadvanced,ou=People,o=EricAdvanced,ou=Clients,o=DMFC"
print getISPName("username=ericadvanced,ou=People,o=EricAdvanced,ou=Clients,o=DMFC")
print "username=demo,ou=People,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=demo,ou=People,o=FC Gold,ou=Clients,o=DMFC")
print "username=ericdomain,ou=People,o=EricDomainReg,ou=Clients,o=DMFC"
print getISPName("username=ericdomain,ou=People,o=EricDomainReg,ou=Clients,o=DMFC")
print "username=erictesting123,ou=People,o=erictesting,ou=Clients,o=DMFC"
print getISPName("username=erictesting123,ou=People,o=erictesting,ou=Clients,o=DMFC")
print "username=erictest,ou=People,o=ET,ou=Clients,o=DMFC"
print getISPName("username=erictest,ou=People,o=ET,ou=Clients,o=DMFC")
print "username=jhanley,ou=People,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=jhanley,ou=People,o=GlobalScape,ou=Clients,o=DMFC")
print "username=hostgstest001,ou=People,o=Hostgsts001,ou=Clients,o=DMFC"
print getISPName("username=hostgstest001,ou=People,o=Hostgsts001,ou=Clients,o=DMFC")
print "username=test001,ou=People,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=test001,ou=People,o=GlobalScape,ou=Clients,o=DMFC")
print "username=testmehard1,ou=People,o=testmehard1,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=testmehard1,ou=People,o=testmehard1,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC")
print "username=admin,ou=People,o=V3 Hosting,ou=Clients,o=DMFC"
print getISPName("username=admin,ou=People,o=V3 Hosting,ou=Clients,o=DMFC")
print "username=domainrenewal,ou=People,o=testdomainrenewal,ou=Clients,o=DMFC"
print getISPName("username=domainrenewal,ou=People,o=testdomainrenewal,ou=Clients,o=DMFC")
print "username=chris,ou=People,o=DMFC"
print getISPName("username=chris,ou=People,o=DMFC")
print "username=zlatin,ou=People,o=DMFC"
print getISPName("username=zlatin,ou=People,o=DMFC")
print "username=lysa,ou=People,o=DMFC"
print getISPName("username=lysa,ou=People,o=DMFC")
print "username=admin,ou=People,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=admin,ou=People,o=HostV3,ou=Clients,o=DMFC")
print "username=hostgs001,ou=People,o=testsignup,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=hostgs001,ou=People,o=testsignup,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC")
print "username=v3hosttest001,ou=People,o=v3hosttest001,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3hosttest001,ou=People,o=v3hosttest001,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=fcgoldtest666,ou=People,o=fcgoldtest666,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgoldtest666,ou=People,o=fcgoldtest666,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=hostv3001,ou=People,o=hostv3001,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=hostv3001,ou=People,o=hostv3001,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3test119,ou=People,o=v3test119,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3test119,ou=People,o=v3test119,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=lesmois,ou=People,o=LesMois,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=lesmois,ou=People,o=LesMois,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=hostv3test001,ou=People,o=hostv3test001,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=hostv3test001,ou=People,o=hostv3test001,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=hostv3004,ou=People,o=hostv3004,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=hostv3004,ou=People,o=hostv3004,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=sholmes,ou=People,o=v3test119,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=sholmes,ou=People,o=v3test119,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=sherlock,ou=People,o=v3test119,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=sherlock,ou=People,o=v3test119,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=hostv3test002,ou=People,o=hostv3test002,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=hostv3test002,ou=People,o=hostv3test002,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=hostv3test003,ou=People,o=hostv3test003,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=hostv3test003,ou=People,o=hostv3test003,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3trellix01,ou=People,o=v3trellix01,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3trellix01,ou=People,o=v3trellix01,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3ftp01,ou=People,o=v3ftp01,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3ftp01,ou=People,o=v3ftp01,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3turbofp01,ou=People,o=v3turbofp01,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3turbofp01,ou=People,o=v3turbofp01,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=twster,ou=People,o=hostv3test003,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=twster,ou=People,o=hostv3test003,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=mtwain,ou=People,o=v3turbofp01,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=mtwain,ou=People,o=v3turbofp01,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=test112233,ou=People,o=v3ftp01,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=test112233,ou=People,o=v3ftp01,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=hostv3test004,ou=People,o=hostv3test04,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=hostv3test004,ou=People,o=hostv3test04,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=test022,ou=People,o=AmpiraTest,ou=Clients,o=DMFC"
print getISPName("username=test022,ou=People,o=AmpiraTest,ou=Clients,o=DMFC")
print "username=joeshmoo,ou=People,o=Joe Schmoo's Site,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=joeshmoo,ou=People,o=Joe Schmoo's Site,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=fcgtest056,ou=People,o=FCGTest056,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest056,ou=People,o=FCGTest056,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=blahwhateverblah,ou=People,o=blahwhateverblah,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=blahwhateverblah,ou=People,o=blahwhateverblah,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=fcgtest057,ou=People,o=FCGTest057,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest057,ou=People,o=FCGTest057,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=wainstead2,ou=People,o=wainstead2,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=wainstead2,ou=People,o=wainstead2,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=fcgtest059,ou=People,o=FCGTest059,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest059,ou=People,o=FCGTest059,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=fcgtest303,ou=People,o=FCGTest303,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest303,ou=People,o=FCGTest303,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=fcgtest060,ou=People,o=FCGTest060,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest060,ou=People,o=FCGTest060,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=fcgtest061,ou=People,o=FCGTest061,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest061,ou=People,o=FCGTest061,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=ffcgtest064,ou=People,o=FCGTest064,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=ffcgtest064,ou=People,o=FCGTest064,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=fcgtest058,ou=People,o=FCGTest058,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest058,ou=People,o=FCGTest058,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=fcgtest051,ou=People,o=fcgtest051,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest051,ou=People,o=fcgtest051,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=snotty,ou=People,o=snotty,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=snotty,ou=People,o=snotty,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=fcgtest052,ou=People,o=fcgtest052,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest052,ou=People,o=fcgtest052,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=fcgtest053,ou=People,o=fcgtest053,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest053,ou=People,o=fcgtest053,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=fcgtest054,ou=People,o=fcgtest054,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest054,ou=People,o=fcgtest054,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=fcgtest055,ou=People,o=fcgtest055,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest055,ou=People,o=fcgtest055,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=experttrellixmonthly,ou=People,o=expertTrellixmonthly,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=experttrellixmonthly,ou=People,o=expertTrellixmonthly,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=more,ou=People,o=more,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=more,ou=People,o=more,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=fcgtest061a,ou=People,o=fcgtest061a,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest061a,ou=People,o=fcgtest061a,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=fcgtest062,ou=People,o=fcgtest062,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest062,ou=People,o=fcgtest062,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=fcgtest060a,ou=People,o=fcgtest060a,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest060a,ou=People,o=fcgtest060a,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=sdfsdfsdf,ou=People,o=sdfsdf,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=sdfsdfsdf,ou=People,o=sdfsdf,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC")
print "username=e5utytyde,ou=People,o=sdfsdf3124,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=e5utytyde,ou=People,o=sdfsdf3124,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC")
print "username=fcgtest101,ou=People,o=FCGTest101,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest101,ou=People,o=FCGTest101,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=eric119,ou=People,o=Eric119,ou=Clients,o=DMFC"
print getISPName("username=eric119,ou=People,o=Eric119,ou=Clients,o=DMFC")
print "username=newmailmessage,ou=People,o=newmailmessage,ou=Clients,o=DMFC"
print getISPName("username=newmailmessage,ou=People,o=newmailmessage,ou=Clients,o=DMFC")
print "username=newmail2,ou=People,o=newmail2,ou=Clients,o=DMFC"
print getISPName("username=newmail2,ou=People,o=newmail2,ou=Clients,o=DMFC")
print "username=newmail3,ou=People,o=newmail3,ou=Clients,o=DMFC"
print getISPName("username=newmail3,ou=People,o=newmail3,ou=Clients,o=DMFC")
print "username=newmailtest,ou=People,o=newmailtest,ou=Clients,o=DMFC"
print getISPName("username=newmailtest,ou=People,o=newmailtest,ou=Clients,o=DMFC")
print "username=admin,ou=People,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=admin,ou=People,o=VisiHost,ou=Clients,o=DMFC")
print "username=poopoohead,ou=People,o=Blakes,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=poopoohead,ou=People,o=Blakes,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=kevvy,ou=People,o=SuperCo,ou=Clients,o=DMFC"
print getISPName("username=kevvy,ou=People,o=SuperCo,ou=Clients,o=DMFC")
print "username=wiggly,ou=People,o=NotAmpira,ou=Clients,o=DMFC"
print getISPName("username=wiggly,ou=People,o=NotAmpira,ou=Clients,o=DMFC")
print "username=lundgren,ou=People,o=kirtland,ou=Clients,o=DMFC"
print getISPName("username=lundgren,ou=People,o=kirtland,ou=Clients,o=DMFC")
print "username=aameramin,ou=People,o=Aamer Amin & Co Chartered Accountants,ou=Clients,o=DMFC"
print getISPName("username=aameramin,ou=People,o=Aamer Amin & Co Chartered Accountants,ou=Clients,o=DMFC")
print "username=armenstamp,ou=People,o=Youssefi Armen,ou=Clients,o=DMFC"
print getISPName("username=armenstamp,ou=People,o=Youssefi Armen,ou=Clients,o=DMFC")
print "username=sib-breeder,ou=People,o=Ashburn Siberians,ou=Clients,o=DMFC"
print getISPName("username=sib-breeder,ou=People,o=Ashburn Siberians,ou=Clients,o=DMFC")
print "username=danoakes,ou=People,o=Astro Lanes,ou=Clients,o=DMFC"
print getISPName("username=danoakes,ou=People,o=Astro Lanes,ou=Clients,o=DMFC")
print "username=gkarrie,ou=People,o=Gary Karriem,ou=Clients,o=DMFC"
print getISPName("username=gkarrie,ou=People,o=Gary Karriem,ou=Clients,o=DMFC")
print "username=jeepster72,ou=People,o=Plane View Photography,ou=Clients,o=DMFC"
print getISPName("username=jeepster72,ou=People,o=Plane View Photography,ou=Clients,o=DMFC")
print "username=calspaguy,ou=People,o=Mayes Norris,ou=Clients,o=DMFC"
print getISPName("username=calspaguy,ou=People,o=Mayes Norris,ou=Clients,o=DMFC")
print "username=powlas,ou=People,o=Powlas Michael,ou=Clients,o=DMFC"
print getISPName("username=powlas,ou=People,o=Powlas Michael,ou=Clients,o=DMFC")
print "username=carlascorner,ou=People,o=Carlas Corner,ou=Clients,o=DMFC"
print getISPName("username=carlascorner,ou=People,o=Carlas Corner,ou=Clients,o=DMFC")
print "username=cle1009,ou=People,o=Executive Mining Inc,ou=Clients,o=DMFC"
print getISPName("username=cle1009,ou=People,o=Executive Mining Inc,ou=Clients,o=DMFC")
print "username=falcon,ou=People,o=Falcotech Falcons,ou=Clients,o=DMFC"
print getISPName("username=falcon,ou=People,o=Falcotech Falcons,ou=Clients,o=DMFC")
print "username=eadamson,ou=People,o=Eddie Adamson,ou=Clients,o=DMFC"
print getISPName("username=eadamson,ou=People,o=Eddie Adamson,ou=Clients,o=DMFC")
print "username=srsmanian,ou=People,o=Solomon Software (East Africa) Limited,ou=Clients,o=DMFC"
print getISPName("username=srsmanian,ou=People,o=Solomon Software (East Africa) Limited,ou=Clients,o=DMFC")
print "username=glennfish,ou=People,o=Fishbine Glenn,ou=Clients,o=DMFC"
print getISPName("username=glennfish,ou=People,o=Fishbine Glenn,ou=Clients,o=DMFC")
print "username=grovetech,ou=People,o=Caraway Roxann,ou=Clients,o=DMFC"
print getISPName("username=grovetech,ou=People,o=Caraway Roxann,ou=Clients,o=DMFC")
print "username=peterthomson,ou=People,o=IBRC Co Ltd,ou=Clients,o=DMFC"
print getISPName("username=peterthomson,ou=People,o=IBRC Co Ltd,ou=Clients,o=DMFC")
print "username=rockriver,ou=People,o=Rock River Realty,ou=Clients,o=DMFC"
print getISPName("username=rockriver,ou=People,o=Rock River Realty,ou=Clients,o=DMFC")
print "username=midnightspecial,ou=People,o=Jay,ou=Clients,o=DMFC"
print getISPName("username=midnightspecial,ou=People,o=Jay,ou=Clients,o=DMFC")
print "username=catk2001,ou=People,o=Kelly Catherine,ou=Clients,o=DMFC"
print getISPName("username=catk2001,ou=People,o=Kelly Catherine,ou=Clients,o=DMFC")
print "username=nbossette,ou=People,o=MYOBmagazine,ou=Clients,o=DMFC"
print getISPName("username=nbossette,ou=People,o=MYOBmagazine,ou=Clients,o=DMFC")
print "username=iikdrii,ou=People,o=Kevin Reheiser,ou=Clients,o=DMFC"
print getISPName("username=iikdrii,ou=People,o=Kevin Reheiser,ou=Clients,o=DMFC")
print "username=pgarcia,ou=People,o=Garcia Peggy,ou=Clients,o=DMFC"
print getISPName("username=pgarcia,ou=People,o=Garcia Peggy,ou=Clients,o=DMFC")
print "username=sara15,ou=People,o=POOR/\SALLEE,ou=Clients,o=DMFC"
print getISPName("username=sara15,ou=People,o=POOR/\SALLEE,ou=Clients,o=DMFC")
print "username=progenitor,ou=People,o=Hess Justin,ou=Clients,o=DMFC"
print getISPName("username=progenitor,ou=People,o=Hess Justin,ou=Clients,o=DMFC")
print "username=gartanjoe,ou=People,o=Strutt Garry,ou=Clients,o=DMFC"
print getISPName("username=gartanjoe,ou=People,o=Strutt Garry,ou=Clients,o=DMFC")
print "username=junglebar,ou=People,o=The Fusion Box,ou=Clients,o=DMFC"
print getISPName("username=junglebar,ou=People,o=The Fusion Box,ou=Clients,o=DMFC")
print "username=mamarose,ou=People,o=the vintage rose,ou=Clients,o=DMFC"
print getISPName("username=mamarose,ou=People,o=the vintage rose,ou=Clients,o=DMFC")
print "username=thewicks.com,ou=People,o=THE WICKS,ou=Clients,o=DMFC"
print getISPName("username=thewicks.com,ou=People,o=THE WICKS,ou=Clients,o=DMFC")
print "username=tinokizis,ou=People,o=Alfa Web Design & Video,ou=Clients,o=DMFC"
print getISPName("username=tinokizis,ou=People,o=Alfa Web Design & Video,ou=Clients,o=DMFC")
print "username=toniclif,ou=People,o=Toni Clifton,ou=Clients,o=DMFC"
print getISPName("username=toniclif,ou=People,o=Toni Clifton,ou=Clients,o=DMFC")
print "username=chriss,ou=People,o=Szajko Chris,ou=Clients,o=DMFC"
print getISPName("username=chriss,ou=People,o=Szajko Chris,ou=Clients,o=DMFC")
print "username=veenoghu,ou=People,o=Stewart Morgan A,ou=Clients,o=DMFC"
print getISPName("username=veenoghu,ou=People,o=Stewart Morgan A,ou=Clients,o=DMFC")
print "username=wax-files,ou=People,o=Hansen Jim,ou=Clients,o=DMFC"
print getISPName("username=wax-files,ou=People,o=Hansen Jim,ou=Clients,o=DMFC")
print "username=winolet,ou=People,o=Ouellette Edwina,ou=Clients,o=DMFC"
print getISPName("username=winolet,ou=People,o=Ouellette Edwina,ou=Clients,o=DMFC")
print "username=xlsupply,ou=People,o=XLSUPPLY,ou=Clients,o=DMFC"
print getISPName("username=xlsupply,ou=People,o=XLSUPPLY,ou=Clients,o=DMFC")
print "username=kamau,ou=People,o=kamau Jackson,ou=Clients,o=DMFC"
print getISPName("username=kamau,ou=People,o=kamau Jackson,ou=Clients,o=DMFC")
print "username=whfjerstad,ou=People,o=The Line Holder,ou=Clients,o=DMFC"
print getISPName("username=whfjerstad,ou=People,o=The Line Holder,ou=Clients,o=DMFC")
print "username=adamkiger,ou=People,o=adamkiger.com,ou=Clients,o=DMFC"
print getISPName("username=adamkiger,ou=People,o=adamkiger.com,ou=Clients,o=DMFC")
print "username=cristall,ou=People,o=Advanced Ground Support,ou=Clients,o=DMFC"
print getISPName("username=cristall,ou=People,o=Advanced Ground Support,ou=Clients,o=DMFC")
print "username=triberfan,ou=People,o=Lynn Robin,ou=Clients,o=DMFC"
print getISPName("username=triberfan,ou=People,o=Lynn Robin,ou=Clients,o=DMFC")
print "username=cannonball,ou=People,o=Flying Eagle Stunt Team,ou=Clients,o=DMFC"
print getISPName("username=cannonball,ou=People,o=Flying Eagle Stunt Team,ou=Clients,o=DMFC")
print "username=dizzy51,ou=People,o=Sullivan Gary,ou=Clients,o=DMFC"
print getISPName("username=dizzy51,ou=People,o=Sullivan Gary,ou=Clients,o=DMFC")
print "username=angle,ou=People,o=Velez Martin,ou=Clients,o=DMFC"
print getISPName("username=angle,ou=People,o=Velez Martin,ou=Clients,o=DMFC")
print "username=maliarenko,ou=People,o=Maliarenko Anna,ou=Clients,o=DMFC"
print getISPName("username=maliarenko,ou=People,o=Maliarenko Anna,ou=Clients,o=DMFC")
print "username=jvj,ou=People,o=Appia Antica,ou=Clients,o=DMFC"
print getISPName("username=jvj,ou=People,o=Appia Antica,ou=Clients,o=DMFC")
print "username=atlant,ou=People,o=Atlant Computers,ou=Clients,o=DMFC"
print getISPName("username=atlant,ou=People,o=Atlant Computers,ou=Clients,o=DMFC")
print "username=emmiss,ou=People,o=Emmanuel Mission,ou=Clients,o=DMFC"
print getISPName("username=emmiss,ou=People,o=Emmanuel Mission,ou=Clients,o=DMFC")
print "username=komuchiku,ou=People,o=Bamboo In,ou=Clients,o=DMFC"
print getISPName("username=komuchiku,ou=People,o=Bamboo In,ou=Clients,o=DMFC")
print "username=thunderpaste,ou=People,o=Oman David,ou=Clients,o=DMFC"
print getISPName("username=thunderpaste,ou=People,o=Oman David,ou=Clients,o=DMFC")
print "username=benabrams,ou=People,o=Ben Abrams Video Productions,ou=Clients,o=DMFC"
print getISPName("username=benabrams,ou=People,o=Ben Abrams Video Productions,ou=Clients,o=DMFC")
print "username=pabernius,ou=People,o=Bernius Patricia,ou=Clients,o=DMFC"
print getISPName("username=pabernius,ou=People,o=Bernius Patricia,ou=Clients,o=DMFC")
print "username=psoup,ou=People,o=Boss Maintenance,ou=Clients,o=DMFC"
print getISPName("username=psoup,ou=People,o=Boss Maintenance,ou=Clients,o=DMFC")
print "username=heidsfost,ou=People,o=Heidcom,ou=Clients,o=DMFC"
print getISPName("username=heidsfost,ou=People,o=Heidcom,ou=Clients,o=DMFC")
print "username=chriess,ou=People,o=Riess Carl,ou=Clients,o=DMFC"
print getISPName("username=chriess,ou=People,o=Riess Carl,ou=Clients,o=DMFC")
print "username=panarello,ou=People,o=Celtic Builders Inc,ou=Clients,o=DMFC"
print getISPName("username=panarello,ou=People,o=Celtic Builders Inc,ou=Clients,o=DMFC")
print "username=freddyrvasquez,ou=People,o=Centro Familiar Cristiano Bethel,ou=Clients,o=DMFC"
print getISPName("username=freddyrvasquez,ou=People,o=Centro Familiar Cristiano Bethel,ou=Clients,o=DMFC")
print "username=cheetahchoices,ou=People,o=Rivas Rene,ou=Clients,o=DMFC"
print getISPName("username=cheetahchoices,ou=People,o=Rivas Rene,ou=Clients,o=DMFC")
print "username=judy,ou=People,o=Chimney Hill Farm,ou=Clients,o=DMFC"
print getISPName("username=judy,ou=People,o=Chimney Hill Farm,ou=Clients,o=DMFC")
print "username=scot23,ou=People,o=Wulbert Scot K,ou=Clients,o=DMFC"
print getISPName("username=scot23,ou=People,o=Wulbert Scot K,ou=Clients,o=DMFC")
print "username=ahistoryscribe,ou=People,o=Russell Maria,ou=Clients,o=DMFC"
print getISPName("username=ahistoryscribe,ou=People,o=Russell Maria,ou=Clients,o=DMFC")
print "username=akherat,ou=People,o=Justin Duncan,ou=Clients,o=DMFC"
print getISPName("username=akherat,ou=People,o=Justin Duncan,ou=Clients,o=DMFC")
print "username=dsharpe,ou=People,o=Dave Sharpe,ou=Clients,o=DMFC"
print getISPName("username=dsharpe,ou=People,o=Dave Sharpe,ou=Clients,o=DMFC")
print "username=christy,ou=People,o=Home Ministries,ou=Clients,o=DMFC"
print getISPName("username=christy,ou=People,o=Home Ministries,ou=Clients,o=DMFC")
print "username=cornerstone59,ou=People,o=Cornerstone Equine Services,ou=Clients,o=DMFC"
print getISPName("username=cornerstone59,ou=People,o=Cornerstone Equine Services,ou=Clients,o=DMFC")
print "username=trgaul,ou=People,o=cornerstorecomics.com,ou=Clients,o=DMFC"
print getISPName("username=trgaul,ou=People,o=cornerstorecomics.com,ou=Clients,o=DMFC")
print "username=dmartin2001,ou=People,o=Martin David,ou=Clients,o=DMFC"
print getISPName("username=dmartin2001,ou=People,o=Martin David,ou=Clients,o=DMFC")
print "username=donaldritchie,ou=People,o=Ritchie Donald,ou=Clients,o=DMFC"
print getISPName("username=donaldritchie,ou=People,o=Ritchie Donald,ou=Clients,o=DMFC")
print "username=bovine,ou=People,o=Bovine Design,ou=Clients,o=DMFC"
print getISPName("username=bovine,ou=People,o=Bovine Design,ou=Clients,o=DMFC")
print "username=egocreatives,ou=People,o=EGO Creative Solutions,ou=Clients,o=DMFC"
print getISPName("username=egocreatives,ou=People,o=EGO Creative Solutions,ou=Clients,o=DMFC")
print "username=elements,ou=People,o=Doug McMahan,ou=Clients,o=DMFC"
print getISPName("username=elements,ou=People,o=Doug McMahan,ou=Clients,o=DMFC")
print "username=essexpubs,ou=People,o=Ian Hunter,ou=Clients,o=DMFC"
print getISPName("username=essexpubs,ou=People,o=Ian Hunter,ou=Clients,o=DMFC")
print "username=rjwc1967,ou=People,o=Collins Robbie,ou=Clients,o=DMFC"
print getISPName("username=rjwc1967,ou=People,o=Collins Robbie,ou=Clients,o=DMFC")
print "username=facepaintfun,ou=People,o=Designs by Dixie,ou=Clients,o=DMFC"
print getISPName("username=facepaintfun,ou=People,o=Designs by Dixie,ou=Clients,o=DMFC")
print "username=mafoti,ou=People,o=FAMURA TECHNOLOGIES,ou=Clients,o=DMFC"
print getISPName("username=mafoti,ou=People,o=FAMURA TECHNOLOGIES,ou=Clients,o=DMFC")
print "username=strumen,ou=People,o=feecs.org,ou=Clients,o=DMFC"
print getISPName("username=strumen,ou=People,o=feecs.org,ou=Clients,o=DMFC")
print "username=jerryoner77,ou=People,o=Fenix Graphix,ou=Clients,o=DMFC"
print getISPName("username=jerryoner77,ou=People,o=Fenix Graphix,ou=Clients,o=DMFC")
print "username=drspain,ou=People,o=Ferme des Berges Inc,ou=Clients,o=DMFC"
print getISPName("username=drspain,ou=People,o=Ferme des Berges Inc,ou=Clients,o=DMFC")
print "username=aldaniels,ou=People,o=Daniels Alsontra,ou=Clients,o=DMFC"
print getISPName("username=aldaniels,ou=People,o=Daniels Alsontra,ou=Clients,o=DMFC")
print "username=suzanneseay,ou=People,o=For Marketers Only,ou=Clients,o=DMFC"
print getISPName("username=suzanneseay,ou=People,o=For Marketers Only,ou=Clients,o=DMFC")
print "username=freitas,ou=People,o=Freitas Customs,ou=Clients,o=DMFC"
print getISPName("username=freitas,ou=People,o=Freitas Customs,ou=Clients,o=DMFC")
print "username=atalla,ou=People,o=Atalla Basil,ou=Clients,o=DMFC"
print getISPName("username=atalla,ou=People,o=Atalla Basil,ou=Clients,o=DMFC")
print "username=gorhamg,ou=People,o=Gorham Greg,ou=Clients,o=DMFC"
print getISPName("username=gorhamg,ou=People,o=Gorham Greg,ou=Clients,o=DMFC")
print "username=gkolesar,ou=People,o=Gail Dean Kolesar CPA,ou=Clients,o=DMFC"
print getISPName("username=gkolesar,ou=People,o=Gail Dean Kolesar CPA,ou=Clients,o=DMFC")
print "username=genesis,ou=People,o=Genesis Motors Inc,ou=Clients,o=DMFC"
print getISPName("username=genesis,ou=People,o=Genesis Motors Inc,ou=Clients,o=DMFC")
print "username=ianrubin,ou=People,o=Optimum Health Coaching,ou=Clients,o=DMFC"
print getISPName("username=ianrubin,ou=People,o=Optimum Health Coaching,ou=Clients,o=DMFC")
print "username=gex,ou=People,o=Cutler Ginger,ou=Clients,o=DMFC"
print getISPName("username=gex,ou=People,o=Cutler Ginger,ou=Clients,o=DMFC")
print "username=gkivdo,ou=People,o=G K Industries Inc,ou=Clients,o=DMFC"
print getISPName("username=gkivdo,ou=People,o=G K Industries Inc,ou=Clients,o=DMFC")
print "username=straussj,ou=People,o=SIS Inc,ou=Clients,o=DMFC"
print getISPName("username=straussj,ou=People,o=SIS Inc,ou=Clients,o=DMFC")
print "username=hansen,ou=People,o=Hansen Cheryl,ou=Clients,o=DMFC"
print getISPName("username=hansen,ou=People,o=Hansen Cheryl,ou=Clients,o=DMFC")
print "username=thadev,ou=People,o=Low Priced Goods,ou=Clients,o=DMFC"
print getISPName("username=thadev,ou=People,o=Low Priced Goods,ou=Clients,o=DMFC")
print "username=southernbelle,ou=People,o=Partain Heather,ou=Clients,o=DMFC"
print getISPName("username=southernbelle,ou=People,o=Partain Heather,ou=Clients,o=DMFC")
print "username=jbdavis,ou=People,o=Heavy Equipment Services Co,ou=Clients,o=DMFC"
print getISPName("username=jbdavis,ou=People,o=Heavy Equipment Services Co,ou=Clients,o=DMFC")
print "username=dtgca,ou=People,o=Goberville D T,ou=Clients,o=DMFC"
print getISPName("username=dtgca,ou=People,o=Goberville D T,ou=Clients,o=DMFC")
print "username=paul.dell,ou=People,o=Dell Paul,ou=Clients,o=DMFC"
print getISPName("username=paul.dell,ou=People,o=Dell Paul,ou=Clients,o=DMFC")
print "username=eugeneo,ou=People,o=OLeary Eugene,ou=Clients,o=DMFC"
print getISPName("username=eugeneo,ou=People,o=OLeary Eugene,ou=Clients,o=DMFC")
print "username=bwm3115,ou=People,o=Hunter May Inc,ou=Clients,o=DMFC"
print getISPName("username=bwm3115,ou=People,o=Hunter May Inc,ou=Clients,o=DMFC")
print "username=jefsantiago,ou=People,o=Infinite Enterprises,ou=Clients,o=DMFC"
print getISPName("username=jefsantiago,ou=People,o=Infinite Enterprises,ou=Clients,o=DMFC")
print "username=inspired,ou=People,o=Inspired Solutions International,ou=Clients,o=DMFC"
print getISPName("username=inspired,ou=People,o=Inspired Solutions International,ou=Clients,o=DMFC")
print "username=esharp,ou=People,o=IroCom IT Services,ou=Clients,o=DMFC"
print getISPName("username=esharp,ou=People,o=IroCom IT Services,ou=Clients,o=DMFC")
print "username=jessethecomic,ou=People,o=Pangelinan Jesse,ou=Clients,o=DMFC"
print getISPName("username=jessethecomic,ou=People,o=Pangelinan Jesse,ou=Clients,o=DMFC")
print "username=moogroup,ou=People,o=JGMoon,ou=Clients,o=DMFC"
print getISPName("username=moogroup,ou=People,o=JGMoon,ou=Clients,o=DMFC")
print "username=jozie,ou=People,o=Thompson Joanne,ou=Clients,o=DMFC"
print getISPName("username=jozie,ou=People,o=Thompson Joanne,ou=Clients,o=DMFC")
print "username=julieannh,ou=People,o=Hodge Julie,ou=Clients,o=DMFC"
print getISPName("username=julieannh,ou=People,o=Hodge Julie,ou=Clients,o=DMFC")
print "username=juliescoggins,ou=People,o=Scoggins Julie,ou=Clients,o=DMFC"
print getISPName("username=juliescoggins,ou=People,o=Scoggins Julie,ou=Clients,o=DMFC")
print "username=andrewjohn,ou=People,o=Ward Jeffrey,ou=Clients,o=DMFC"
print getISPName("username=andrewjohn,ou=People,o=Ward Jeffrey,ou=Clients,o=DMFC")
print "username=kidsforkids,ou=People,o=Safran Martin,ou=Clients,o=DMFC"
print getISPName("username=kidsforkids,ou=People,o=Safran Martin,ou=Clients,o=DMFC")
print "username=ksloane,ou=People,o=Kit Sloane,ou=Clients,o=DMFC"
print getISPName("username=ksloane,ou=People,o=Kit Sloane,ou=Clients,o=DMFC")
print "username=latebrake,ou=People,o=Repka Mark,ou=Clients,o=DMFC"
print getISPName("username=latebrake,ou=People,o=Repka Mark,ou=Clients,o=DMFC")
print "username=mardi,ou=People,o=Gieseler Martha,ou=Clients,o=DMFC"
print getISPName("username=mardi,ou=People,o=Gieseler Martha,ou=Clients,o=DMFC")
print "username=schoenherr,ou=People,o=Linda Schoenherr,ou=Clients,o=DMFC"
print getISPName("username=schoenherr,ou=People,o=Linda Schoenherr,ou=Clients,o=DMFC")
print "username=lioness,ou=People,o=LionWalk,ou=Clients,o=DMFC"
print getISPName("username=lioness,ou=People,o=LionWalk,ou=Clients,o=DMFC")
print "username=samanda4,ou=People,o=AJ Design,ou=Clients,o=DMFC"
print getISPName("username=samanda4,ou=People,o=AJ Design,ou=Clients,o=DMFC")
print "username=richstearns,ou=People,o=LS ten Boats,ou=Clients,o=DMFC"
print getISPName("username=richstearns,ou=People,o=LS ten Boats,ou=Clients,o=DMFC")
print "username=thearc,ou=People,o=Manasota ARC,ou=Clients,o=DMFC"
print getISPName("username=thearc,ou=People,o=Manasota ARC,ou=Clients,o=DMFC")
print "username=simek,ou=People,o=Marjanca d o o,ou=Clients,o=DMFC"
print getISPName("username=simek,ou=People,o=Marjanca d o o,ou=Clients,o=DMFC")
print "username=massemonkey,ou=People,o=Evans Kris,ou=Clients,o=DMFC"
print getISPName("username=massemonkey,ou=People,o=Evans Kris,ou=Clients,o=DMFC")
print "username=farr79,ou=People,o=Farr Matt,ou=Clients,o=DMFC"
print getISPName("username=farr79,ou=People,o=Farr Matt,ou=Clients,o=DMFC")
print "username=sillymike,ou=People,o=Uy Michael,ou=Clients,o=DMFC"
print getISPName("username=sillymike,ou=People,o=Uy Michael,ou=Clients,o=DMFC")
print "username=mosfetakemi27,ou=People,o=Mergawa,ou=Clients,o=DMFC"
print getISPName("username=mosfetakemi27,ou=People,o=Mergawa,ou=Clients,o=DMFC")
print "username=happy,ou=People,o=Hanna Ihab,ou=Clients,o=DMFC"
print getISPName("username=happy,ou=People,o=Hanna Ihab,ou=Clients,o=DMFC")
print "username=emy,ou=People,o=Phillips Emy,ou=Clients,o=DMFC"
print getISPName("username=emy,ou=People,o=Phillips Emy,ou=Clients,o=DMFC")
print "username=teacha305,ou=People,o=American Senior,ou=Clients,o=DMFC"
print getISPName("username=teacha305,ou=People,o=American Senior,ou=Clients,o=DMFC")
print "username=oslolo717,ou=People,o=Tres Builders Inc,ou=Clients,o=DMFC"
print getISPName("username=oslolo717,ou=People,o=Tres Builders Inc,ou=Clients,o=DMFC")
print "username=mirek,ou=People,o=Lipinski Miroslaw,ou=Clients,o=DMFC"
print getISPName("username=mirek,ou=People,o=Lipinski Miroslaw,ou=Clients,o=DMFC")
print "username=olinjones,ou=People,o=Neptune Holdings LLC,ou=Clients,o=DMFC"
print getISPName("username=olinjones,ou=People,o=Neptune Holdings LLC,ou=Clients,o=DMFC")
print "username=denisew1972,ou=People,o=Williams Denise,ou=Clients,o=DMFC"
print getISPName("username=denisew1972,ou=People,o=Williams Denise,ou=Clients,o=DMFC")
print "username=iloveyoutn,ou=People,o=NLT Collections,ou=Clients,o=DMFC"
print getISPName("username=iloveyoutn,ou=People,o=NLT Collections,ou=Clients,o=DMFC")
print "username=nyxhaus,ou=People,o=Nyxhaus,ou=Clients,o=DMFC"
print getISPName("username=nyxhaus,ou=People,o=Nyxhaus,ou=Clients,o=DMFC")
print "username=julie,ou=People,o=Ocotillo Ranch,ou=Clients,o=DMFC"
print getISPName("username=julie,ou=People,o=Ocotillo Ranch,ou=Clients,o=DMFC")
print "username=olaf,ou=People,o=Kasten Olaf,ou=Clients,o=DMFC"
print getISPName("username=olaf,ou=People,o=Kasten Olaf,ou=Clients,o=DMFC")
print "username=othmanov,ou=People,o=Moufid Othman,ou=Clients,o=DMFC"
print getISPName("username=othmanov,ou=People,o=Moufid Othman,ou=Clients,o=DMFC")
print "username=manager,ou=People,o=PAULco Computer Consulting,ou=Clients,o=DMFC"
print getISPName("username=manager,ou=People,o=PAULco Computer Consulting,ou=Clients,o=DMFC")
print "username=misko667,ou=People,o=Paul Pavlovich Design,ou=Clients,o=DMFC"
print getISPName("username=misko667,ou=People,o=Paul Pavlovich Design,ou=Clients,o=DMFC")
print "username=pixiekids,ou=People,o=Pixiekids,ou=Clients,o=DMFC"
print getISPName("username=pixiekids,ou=People,o=Pixiekids,ou=Clients,o=DMFC")
print "username=brucekbeck,ou=People,o=Bruce Beck,ou=Clients,o=DMFC"
print getISPName("username=brucekbeck,ou=People,o=Bruce Beck,ou=Clients,o=DMFC")
print "username=bse33180,ou=People,o=Evenson Brett,ou=Clients,o=DMFC"
print getISPName("username=bse33180,ou=People,o=Evenson Brett,ou=Clients,o=DMFC")
print "username=princesskatana,ou=People,o=Katana Princess,ou=Clients,o=DMFC"
print getISPName("username=princesskatana,ou=People,o=Katana Princess,ou=Clients,o=DMFC")
print "username=putnam,ou=People,o=CW,ou=Clients,o=DMFC"
print getISPName("username=putnam,ou=People,o=CW,ou=Clients,o=DMFC")
print "username=ffaaddii,ou=People,o=Decker Arthur,ou=Clients,o=DMFC"
print getISPName("username=ffaaddii,ou=People,o=Decker Arthur,ou=Clients,o=DMFC")
print "username=enhanced,ou=People,o=Enhanced Solutions,ou=Clients,o=DMFC"
print getISPName("username=enhanced,ou=People,o=Enhanced Solutions,ou=Clients,o=DMFC")
print "username=rochf,ou=People,o=Rochelle Fletcher Photographer,ou=Clients,o=DMFC"
print getISPName("username=rochf,ou=People,o=Rochelle Fletcher Photographer,ou=Clients,o=DMFC")
print "username=indieorbit,ou=People,o=Rocks Off,ou=Clients,o=DMFC"
print getISPName("username=indieorbit,ou=People,o=Rocks Off,ou=Clients,o=DMFC")
print "username=rchrist,ou=People,o=Barrus Rusty,ou=Clients,o=DMFC"
print getISPName("username=rchrist,ou=People,o=Barrus Rusty,ou=Clients,o=DMFC")
print "username=richr,ou=People,o=Beta Graphics,ou=Clients,o=DMFC"
print getISPName("username=richr,ou=People,o=Beta Graphics,ou=Clients,o=DMFC")
print "username=ivan,ou=People,o=Salon Principles,ou=Clients,o=DMFC"
print getISPName("username=ivan,ou=People,o=Salon Principles,ou=Clients,o=DMFC")
print "username=vickie,ou=People,o=Schmidt & Associates Inc,ou=Clients,o=DMFC"
print getISPName("username=vickie,ou=People,o=Schmidt & Associates Inc,ou=Clients,o=DMFC")
print "username=travisc,ou=People,o=Cottrell Travis,ou=Clients,o=DMFC"
print getISPName("username=travisc,ou=People,o=Cottrell Travis,ou=Clients,o=DMFC")
print "username=pelligrino,ou=People,o=Motorcars East Inc,ou=Clients,o=DMFC"
print getISPName("username=pelligrino,ou=People,o=Motorcars East Inc,ou=Clients,o=DMFC")
print "username=moe,ou=People,o=Shadow Graphics & Design,ou=Clients,o=DMFC"
print getISPName("username=moe,ou=People,o=Shadow Graphics & Design,ou=Clients,o=DMFC")
print "username=silcon,ou=People,o=Silcon,ou=Clients,o=DMFC"
print getISPName("username=silcon,ou=People,o=Silcon,ou=Clients,o=DMFC")
print "username=jose8471,ou=People,o=Rivera Jose,ou=Clients,o=DMFC"
print getISPName("username=jose8471,ou=People,o=Rivera Jose,ou=Clients,o=DMFC")
print "username=greenthumb,ou=People,o=Sore Thumb Graphics,ou=Clients,o=DMFC"
print getISPName("username=greenthumb,ou=People,o=Sore Thumb Graphics,ou=Clients,o=DMFC")
print "username=jmartin,ou=People,o=Martin Joshua,ou=Clients,o=DMFC"
print getISPName("username=jmartin,ou=People,o=Martin Joshua,ou=Clients,o=DMFC")
print "username=danl,ou=People,o=Lawrence Dan,ou=Clients,o=DMFC"
print getISPName("username=danl,ou=People,o=Lawrence Dan,ou=Clients,o=DMFC")
print "username=stretchingfm1,ou=People,o=OConnor Timothy,ou=Clients,o=DMFC"
print getISPName("username=stretchingfm1,ou=People,o=OConnor Timothy,ou=Clients,o=DMFC")
print "username=shipman,ou=People,o=Summit Yoga Studio,ou=Clients,o=DMFC"
print getISPName("username=shipman,ou=People,o=Summit Yoga Studio,ou=Clients,o=DMFC")
print "username=mikewofsey,ou=People,o=Galaxy Gauge,ou=Clients,o=DMFC"
print getISPName("username=mikewofsey,ou=People,o=Galaxy Gauge,ou=Clients,o=DMFC")
print "username=supportnetinc,ou=People,o=SUPPORT NET INC,ou=Clients,o=DMFC"
print getISPName("username=supportnetinc,ou=People,o=SUPPORT NET INC,ou=Clients,o=DMFC")
print "username=surfwizard,ou=People,o=SurfNScroll,ou=Clients,o=DMFC"
print getISPName("username=surfwizard,ou=People,o=SurfNScroll,ou=Clients,o=DMFC")
print "username=samadams,ou=People,o=Paul Suchecki,ou=Clients,o=DMFC"
print getISPName("username=samadams,ou=People,o=Paul Suchecki,ou=Clients,o=DMFC")
print "username=jerzey4life,ou=People,o=LOS,ou=Clients,o=DMFC"
print getISPName("username=jerzey4life,ou=People,o=LOS,ou=Clients,o=DMFC")
print "username=thehateholiday,ou=People,o=The Hate Holiday,ou=Clients,o=DMFC"
print getISPName("username=thehateholiday,ou=People,o=The Hate Holiday,ou=Clients,o=DMFC")
print "username=samlor,ou=People,o=Aragon Studios,ou=Clients,o=DMFC"
print getISPName("username=samlor,ou=People,o=Aragon Studios,ou=Clients,o=DMFC")
print "username=vecur,ou=People,o=Vecur Wireless Inc,ou=Clients,o=DMFC"
print getISPName("username=vecur,ou=People,o=Vecur Wireless Inc,ou=Clients,o=DMFC")
print "username=jjanicki,ou=People,o=Toxic Vibe,ou=Clients,o=DMFC"
print getISPName("username=jjanicki,ou=People,o=Toxic Vibe,ou=Clients,o=DMFC")
print "username=ungoddess,ou=People,o=All American Girl,ou=Clients,o=DMFC"
print getISPName("username=ungoddess,ou=People,o=All American Girl,ou=Clients,o=DMFC")
print "username=jordi,ou=People,o=Trident Consultancy Ltd,ou=Clients,o=DMFC"
print getISPName("username=jordi,ou=People,o=Trident Consultancy Ltd,ou=Clients,o=DMFC")
print "username=rodger,ou=People,o=McFarland Rodger,ou=Clients,o=DMFC"
print getISPName("username=rodger,ou=People,o=McFarland Rodger,ou=Clients,o=DMFC")
print "username=uknowmystyle,ou=People,o=FadesNBraids Com,ou=Clients,o=DMFC"
print getISPName("username=uknowmystyle,ou=People,o=FadesNBraids Com,ou=Clients,o=DMFC")
print "username=uksoft,ou=People,o=UkSoft,ou=Clients,o=DMFC"
print getISPName("username=uksoft,ou=People,o=UkSoft,ou=Clients,o=DMFC")
print "username=adsvinow,ou=People,o=Netpas Inc,ou=Clients,o=DMFC"
print getISPName("username=adsvinow,ou=People,o=Netpas Inc,ou=Clients,o=DMFC")
print "username=osborn,ou=People,o=Osborn Thomas,ou=Clients,o=DMFC"
print getISPName("username=osborn,ou=People,o=Osborn Thomas,ou=Clients,o=DMFC")
print "username=wangandkirtley,ou=People,o=Daniel Wang & Aaron Kirtley,ou=Clients,o=DMFC"
print getISPName("username=wangandkirtley,ou=People,o=Daniel Wang & Aaron Kirtley,ou=Clients,o=DMFC")
print "username=pchan,ou=People,o=Wang Productions,ou=Clients,o=DMFC"
print getISPName("username=pchan,ou=People,o=Wang Productions,ou=Clients,o=DMFC")
print "username=mrmagic442,ou=People,o=Windshield Magic,ou=Clients,o=DMFC"
print getISPName("username=mrmagic442,ou=People,o=Windshield Magic,ou=Clients,o=DMFC")
print "username=wirelessconcept,ou=People,o=Wireless Concepts,ou=Clients,o=DMFC"
print getISPName("username=wirelessconcept,ou=People,o=Wireless Concepts,ou=Clients,o=DMFC")
print "username=word-alive,ou=People,o=WAFGC,ou=Clients,o=DMFC"
print getISPName("username=word-alive,ou=People,o=WAFGC,ou=Clients,o=DMFC")
print "username=lateduster,ou=People,o=Tom Cesario,ou=Clients,o=DMFC"
print getISPName("username=lateduster,ou=People,o=Tom Cesario,ou=Clients,o=DMFC")
print "username=patatt,ou=People,o=Attenasio Patrick,ou=Clients,o=DMFC"
print getISPName("username=patatt,ou=People,o=Attenasio Patrick,ou=Clients,o=DMFC")
print "username=bengtembrey,ou=People,o=Embrey Bengt,ou=Clients,o=DMFC"
print getISPName("username=bengtembrey,ou=People,o=Embrey Bengt,ou=Clients,o=DMFC")
print "username=aok4way,ou=People,o=Digital Flagship Promotions,ou=Clients,o=DMFC"
print getISPName("username=aok4way,ou=People,o=Digital Flagship Promotions,ou=Clients,o=DMFC")
print "username=toby,ou=People,o=Kettle,ou=Clients,o=DMFC"
print getISPName("username=toby,ou=People,o=Kettle,ou=Clients,o=DMFC")
print "username=haggs,ou=People,o=Hagen Chris,ou=Clients,o=DMFC"
print getISPName("username=haggs,ou=People,o=Hagen Chris,ou=Clients,o=DMFC")
print "username=altosax,ou=People,o=alternativefilm.com,ou=Clients,o=DMFC"
print getISPName("username=altosax,ou=People,o=alternativefilm.com,ou=Clients,o=DMFC")
print "username=antoine,ou=People,o=Columna Jose Antonio,ou=Clients,o=DMFC"
print getISPName("username=antoine,ou=People,o=Columna Jose Antonio,ou=Clients,o=DMFC")
print "username=srayburn,ou=People,o=Rayburn Susan,ou=Clients,o=DMFC"
print getISPName("username=srayburn,ou=People,o=Rayburn Susan,ou=Clients,o=DMFC")
print "username=bdon2,ou=People,o=Meyer Dave,ou=Clients,o=DMFC"
print getISPName("username=bdon2,ou=People,o=Meyer Dave,ou=Clients,o=DMFC")
print "username=zlatinivanov,ou=People,o=GlobalScape,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=zlatinivanov,ou=People,o=GlobalScape,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC")
print "username=photobot,ou=People,o=Ward Jeffrey,ou=Clients,o=DMFC"
print getISPName("username=photobot,ou=People,o=Ward Jeffrey,ou=Clients,o=DMFC")
print "username=dspiral73,ou=People,o=Miller Jodi,ou=Clients,o=DMFC"
print getISPName("username=dspiral73,ou=People,o=Miller Jodi,ou=Clients,o=DMFC")
print "username=yansh,ou=People,o=Shargorodsky Yan,ou=Clients,o=DMFC"
print getISPName("username=yansh,ou=People,o=Shargorodsky Yan,ou=Clients,o=DMFC")
print "username=michaele,ou=People,o=Eisenstein Michael,ou=Clients,o=DMFC"
print getISPName("username=michaele,ou=People,o=Eisenstein Michael,ou=Clients,o=DMFC")
print "username=beej,ou=People,o=PCA,ou=Clients,o=DMFC"
print getISPName("username=beej,ou=People,o=PCA,ou=Clients,o=DMFC")
print "username=paul27ny,ou=People,o=Piscitelli Paul,ou=Clients,o=DMFC"
print getISPName("username=paul27ny,ou=People,o=Piscitelli Paul,ou=Clients,o=DMFC")
print "username=dwfrogs,ou=People,o=Stobie Jim,ou=Clients,o=DMFC"
print getISPName("username=dwfrogs,ou=People,o=Stobie Jim,ou=Clients,o=DMFC")
print "username=vernon98,ou=People,o=Phillips Vernon,ou=Clients,o=DMFC"
print getISPName("username=vernon98,ou=People,o=Phillips Vernon,ou=Clients,o=DMFC")
print "username=davber,ou=People,o=Bergman David,ou=Clients,o=DMFC"
print getISPName("username=davber,ou=People,o=Bergman David,ou=Clients,o=DMFC")
print "username=bigdaddybmx,ou=People,o=Berrios Michael,ou=Clients,o=DMFC"
print getISPName("username=bigdaddybmx,ou=People,o=Berrios Michael,ou=Clients,o=DMFC")
print "username=zjosh,ou=People,o=Zuker Josh,ou=Clients,o=DMFC"
print getISPName("username=zjosh,ou=People,o=Zuker Josh,ou=Clients,o=DMFC")
print "username=vicky,ou=People,o=2000DC,ou=Clients,o=DMFC"
print getISPName("username=vicky,ou=People,o=2000DC,ou=Clients,o=DMFC")
print "username=goatroper,ou=People,o=badger mt goat soap company,ou=Clients,o=DMFC"
print getISPName("username=goatroper,ou=People,o=badger mt goat soap company,ou=Clients,o=DMFC")
print "username=133,ou=People,o=Maxwell Beverley,ou=Clients,o=DMFC"
print getISPName("username=133,ou=People,o=Maxwell Beverley,ou=Clients,o=DMFC")
print "username=shawnb1,ou=People,o=Blakley John,ou=Clients,o=DMFC"
print getISPName("username=shawnb1,ou=People,o=Blakley John,ou=Clients,o=DMFC")
print "username=masimba,ou=People,o=MMK Production,ou=Clients,o=DMFC"
print getISPName("username=masimba,ou=People,o=MMK Production,ou=Clients,o=DMFC")
print "username=ginger08,ou=People,o=Cakes by Sharon and Ginger,ou=Clients,o=DMFC"
print getISPName("username=ginger08,ou=People,o=Cakes by Sharon and Ginger,ou=Clients,o=DMFC")
print "username=smhunter,ou=People,o=Compassion Fire and Glory Ministries,ou=Clients,o=DMFC"
print getISPName("username=smhunter,ou=People,o=Compassion Fire and Glory Ministries,ou=Clients,o=DMFC")
print "username=ctrude,ou=People,o=Cornerstone Resources Inc,ou=Clients,o=DMFC"
print getISPName("username=ctrude,ou=People,o=Cornerstone Resources Inc,ou=Clients,o=DMFC")
print "username=joshs,ou=People,o=Shelly Josh,ou=Clients,o=DMFC"
print getISPName("username=joshs,ou=People,o=Shelly Josh,ou=Clients,o=DMFC")
print "username=jhornbeck,ou=People,o=Desert Rose Productions,ou=Clients,o=DMFC"
print getISPName("username=jhornbeck,ou=People,o=Desert Rose Productions,ou=Clients,o=DMFC")
print "username=adc1958,ou=People,o=Endtime Ministries Of Christ Inc,ou=Clients,o=DMFC"
print getISPName("username=adc1958,ou=People,o=Endtime Ministries Of Christ Inc,ou=Clients,o=DMFC")
print "username=hillroy,ou=People,o=Hill David,ou=Clients,o=DMFC"
print getISPName("username=hillroy,ou=People,o=Hill David,ou=Clients,o=DMFC")
print "username=tomspoonts,ou=People,o=HealthPlan Management Group Inc,ou=Clients,o=DMFC"
print getISPName("username=tomspoonts,ou=People,o=HealthPlan Management Group Inc,ou=Clients,o=DMFC")
print "username=imani,ou=People,o=Imani Damali,ou=Clients,o=DMFC"
print getISPName("username=imani,ou=People,o=Imani Damali,ou=Clients,o=DMFC")
print "username=jwoodward,ou=People,o=Jayomi,ou=Clients,o=DMFC"
print getISPName("username=jwoodward,ou=People,o=Jayomi,ou=Clients,o=DMFC")
print "username=whimsey,ou=People,o=Jerry Haas Race Cars Inc,ou=Clients,o=DMFC"
print getISPName("username=whimsey,ou=People,o=Jerry Haas Race Cars Inc,ou=Clients,o=DMFC")
print "username=fuller,ou=People,o=Fuller Kimberlee,ou=Clients,o=DMFC"
print getISPName("username=fuller,ou=People,o=Fuller Kimberlee,ou=Clients,o=DMFC")
print "username=burten,ou=People,o=Weisbrod & Son Promotions,ou=Clients,o=DMFC"
print getISPName("username=burten,ou=People,o=Weisbrod & Son Promotions,ou=Clients,o=DMFC")
print "username=amotz,ou=People,o=Kish Kush Inc,ou=Clients,o=DMFC"
print getISPName("username=amotz,ou=People,o=Kish Kush Inc,ou=Clients,o=DMFC")
print "username=kphealthcare,ou=People,o=K P Healthcare Strategies Inc,ou=Clients,o=DMFC"
print getISPName("username=kphealthcare,ou=People,o=K P Healthcare Strategies Inc,ou=Clients,o=DMFC")
print "username=gthudson,ou=People,o=Lightning Connect,ou=Clients,o=DMFC"
print getISPName("username=gthudson,ou=People,o=Lightning Connect,ou=Clients,o=DMFC")
print "username=cnoelldunc,ou=People,o=Duncanson Carol,ou=Clients,o=DMFC"
print getISPName("username=cnoelldunc,ou=People,o=Duncanson Carol,ou=Clients,o=DMFC")
print "username=gocpcb,ou=People,o=Garner Osborne Circuits Ltd,ou=Clients,o=DMFC"
print getISPName("username=gocpcb,ou=People,o=Garner Osborne Circuits Ltd,ou=Clients,o=DMFC")
print "username=doc,ou=People,o=ROBINSON DARRYL,ou=Clients,o=DMFC"
print getISPName("username=doc,ou=People,o=ROBINSON DARRYL,ou=Clients,o=DMFC")
print "username=pwilliams,ou=People,o=Williams Patrick,ou=Clients,o=DMFC"
print getISPName("username=pwilliams,ou=People,o=Williams Patrick,ou=Clients,o=DMFC")
print "username=margo,ou=People,o=Read A Rune,ou=Clients,o=DMFC"
print getISPName("username=margo,ou=People,o=Read A Rune,ou=Clients,o=DMFC")
print "username=ricardo,ou=People,o=ricardoart.com,ou=Clients,o=DMFC"
print getISPName("username=ricardo,ou=People,o=ricardoart.com,ou=Clients,o=DMFC")
print "username=drtag,ou=People,o=security and intelligence services corporation,ou=Clients,o=DMFC"
print getISPName("username=drtag,ou=People,o=security and intelligence services corporation,ou=Clients,o=DMFC")
print "username=slamson,ou=People,o=Terrainltd,ou=Clients,o=DMFC"
print getISPName("username=slamson,ou=People,o=Terrainltd,ou=Clients,o=DMFC")
print "username=jamie,ou=People,o=Titan Sports Consultants,ou=Clients,o=DMFC"
print getISPName("username=jamie,ou=People,o=Titan Sports Consultants,ou=Clients,o=DMFC")
print "username=tcp,ou=People,o=Touch of Color Photography,ou=Clients,o=DMFC"
print getISPName("username=tcp,ou=People,o=Touch of Color Photography,ou=Clients,o=DMFC")
print "username=tajvida,ou=People,o=Vectorstunes Ltd,ou=Clients,o=DMFC"
print getISPName("username=tajvida,ou=People,o=Vectorstunes Ltd,ou=Clients,o=DMFC")
print "username=valeriy,ou=People,o=Vital computers and electronics,ou=Clients,o=DMFC"
print getISPName("username=valeriy,ou=People,o=Vital computers and electronics,ou=Clients,o=DMFC")
print "username=twigg,ou=People,o=Twigg Bill,ou=Clients,o=DMFC"
print getISPName("username=twigg,ou=People,o=Twigg Bill,ou=Clients,o=DMFC")
print "username=swickph,ou=People,o=Swick Plumbing and Heating AC,ou=Clients,o=DMFC"
print getISPName("username=swickph,ou=People,o=Swick Plumbing and Heating AC,ou=Clients,o=DMFC")
print "username=garrydietz,ou=People,o=Viper Graphic Designs,ou=Clients,o=DMFC"
print getISPName("username=garrydietz,ou=People,o=Viper Graphic Designs,ou=Clients,o=DMFC")
print "username=midflight,ou=People,o=Mid Flight Records,ou=Clients,o=DMFC"
print getISPName("username=midflight,ou=People,o=Mid Flight Records,ou=Clients,o=DMFC")
print "username=stagingemails,ou=People,o=stagingemails,ou=Clients,o=DMFC"
print getISPName("username=stagingemails,ou=People,o=stagingemails,ou=Clients,o=DMFC")
print "username=cbhall,ou=People,o=AutomationEdge,ou=Clients,o=DMFC"
print getISPName("username=cbhall,ou=People,o=AutomationEdge,ou=Clients,o=DMFC")
print "username=baumsaway,ou=People,o=Baumsaway,ou=Clients,o=DMFC"
print getISPName("username=baumsaway,ou=People,o=Baumsaway,ou=Clients,o=DMFC")
print "username=cvoelter,ou=People,o=ChuckNChuck,ou=Clients,o=DMFC"
print getISPName("username=cvoelter,ou=People,o=ChuckNChuck,ou=Clients,o=DMFC")
print "username=djimusic,ou=People,o=Dow Jones & The Industerials,ou=Clients,o=DMFC"
print getISPName("username=djimusic,ou=People,o=Dow Jones & The Industerials,ou=Clients,o=DMFC")
print "username=editsuites,ou=People,o=editsuites inc,ou=Clients,o=DMFC"
print getISPName("username=editsuites,ou=People,o=editsuites inc,ou=Clients,o=DMFC")
print "username=spicola2,ou=People,o=Graceland Farms,ou=Clients,o=DMFC"
print getISPName("username=spicola2,ou=People,o=Graceland Farms,ou=Clients,o=DMFC")
print "username=goddesses,ou=People,o=Dexterity Music Group,ou=Clients,o=DMFC"
print getISPName("username=goddesses,ou=People,o=Dexterity Music Group,ou=Clients,o=DMFC")
print "username=joanneanderson,ou=People,o=Paper and Paint Studio,ou=Clients,o=DMFC"
print getISPName("username=joanneanderson,ou=People,o=Paper and Paint Studio,ou=Clients,o=DMFC")
print "username=stanw,ou=People,o=Remarkable Productions,ou=Clients,o=DMFC"
print getISPName("username=stanw,ou=People,o=Remarkable Productions,ou=Clients,o=DMFC")
print "username=tammyg,ou=People,o=RoyalSpots,ou=Clients,o=DMFC"
print getISPName("username=tammyg,ou=People,o=RoyalSpots,ou=Clients,o=DMFC")
print "username=brycer,ou=People,o=Freeway Productions,ou=Clients,o=DMFC"
print getISPName("username=brycer,ou=People,o=Freeway Productions,ou=Clients,o=DMFC")
print "username=ocondrea,ou=People,o=Top Flooring,ou=Clients,o=DMFC"
print getISPName("username=ocondrea,ou=People,o=Top Flooring,ou=Clients,o=DMFC")
print "username=hepatitis,ou=People,o=Triad Hepatitis Educational Support Group,ou=Clients,o=DMFC"
print getISPName("username=hepatitis,ou=People,o=Triad Hepatitis Educational Support Group,ou=Clients,o=DMFC")
print "username=virtuahost1,ou=People,o=R E V,ou=Clients,o=DMFC"
print getISPName("username=virtuahost1,ou=People,o=R E V,ou=Clients,o=DMFC")
print "username=deise,ou=People,o=Deise Metal Products Ltd,ou=Clients,o=DMFC"
print getISPName("username=deise,ou=People,o=Deise Metal Products Ltd,ou=Clients,o=DMFC")
print "username=caklein,ou=People,o=Alsatian American Chamber of Commerce,ou=Clients,o=DMFC"
print getISPName("username=caklein,ou=People,o=Alsatian American Chamber of Commerce,ou=Clients,o=DMFC")
print "username=dalamode,ou=People,o=Maunder David,ou=Clients,o=DMFC"
print getISPName("username=dalamode,ou=People,o=Maunder David,ou=Clients,o=DMFC")
print "username=rtyftdtyu,ou=People,o=fgh,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=rtyftdtyu,ou=People,o=fgh,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=sdfsdfsdf,ou=People,o=hfjgfkfhjkg,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=sdfsdfsdf,ou=People,o=hfjgfkfhjkg,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=xnggfjdg,ou=People,o=dfgdfg,ou=Clients,o=DMFC"
print getISPName("username=xnggfjdg,ou=People,o=dfgdfg,ou=Clients,o=DMFC")
print "username=dfgdfgdfgdf,ou=People,o=hfghsdf,ou=Clients,o=DMFC"
print getISPName("username=dfgdfgdfgdf,ou=People,o=hfghsdf,ou=Clients,o=DMFC")
print "username=dfhgfhhdh,ou=People,o=ghgfh,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=dfhgfhhdh,ou=People,o=ghgfh,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=kenimport1,ou=People,o=ken import,ou=Clients,o=DMFC"
print getISPName("username=kenimport1,ou=People,o=ken import,ou=Clients,o=DMFC")
print "username=swain,ou=People,o=Not Steve Wainstead,ou=Clients,o=DMFC"
print getISPName("username=swain,ou=People,o=Not Steve Wainstead,ou=Clients,o=DMFC")
print "username=abctools,ou=People,o=Lucero Enterprises,ou=Clients,o=DMFC"
print getISPName("username=abctools,ou=People,o=Lucero Enterprises,ou=Clients,o=DMFC")
print "username=rizwan,ou=People,o=ABRIDGE INTERNATIONAL INC,ou=Clients,o=DMFC"
print getISPName("username=rizwan,ou=People,o=ABRIDGE INTERNATIONAL INC,ou=Clients,o=DMFC")
print "username=t2dragontv,ou=People,o=Pires Antonio,ou=Clients,o=DMFC"
print getISPName("username=t2dragontv,ou=People,o=Pires Antonio,ou=Clients,o=DMFC")
print "username=corey291,ou=People,o=Car Land Electronics,ou=Clients,o=DMFC"
print getISPName("username=corey291,ou=People,o=Car Land Electronics,ou=Clients,o=DMFC")
print "username=dorothy,ou=People,o=Beckham Dorothy,ou=Clients,o=DMFC"
print getISPName("username=dorothy,ou=People,o=Beckham Dorothy,ou=Clients,o=DMFC")
print "username=drbradcase,ou=People,o=Chiropractic and Natural Health Care Center,ou=Clients,o=DMFC"
print getISPName("username=drbradcase,ou=People,o=Chiropractic and Natural Health Care Center,ou=Clients,o=DMFC")
print "username=hispanodub,ou=People,o=Global Netdubbing Corporation,ou=Clients,o=DMFC"
print getISPName("username=hispanodub,ou=People,o=Global Netdubbing Corporation,ou=Clients,o=DMFC")
print "username=jeffreybenice,ou=People,o=Law Offices of Jeffrey Benice,ou=Clients,o=DMFC"
print getISPName("username=jeffreybenice,ou=People,o=Law Offices of Jeffrey Benice,ou=Clients,o=DMFC")
print "username=kbc1119,ou=People,o=Cole Brian,ou=Clients,o=DMFC"
print getISPName("username=kbc1119,ou=People,o=Cole Brian,ou=Clients,o=DMFC")
print "username=marrcarr,ou=People,o=dot ave design,ou=Clients,o=DMFC"
print getISPName("username=marrcarr,ou=People,o=dot ave design,ou=Clients,o=DMFC")
print "username=reese,ou=People,o=Fellowship Bible Church,ou=Clients,o=DMFC"
print getISPName("username=reese,ou=People,o=Fellowship Bible Church,ou=Clients,o=DMFC")
print "username=trevorbaker,ou=People,o=Baker Trevor,ou=Clients,o=DMFC"
print getISPName("username=trevorbaker,ou=People,o=Baker Trevor,ou=Clients,o=DMFC")
print "username=goval,ou=People,o=Assembleia de Deus,ou=Clients,o=DMFC"
print getISPName("username=goval,ou=People,o=Assembleia de Deus,ou=Clients,o=DMFC")
print "username=abccash,ou=People,o=ABC Cash A Check Inc,ou=Clients,o=DMFC"
print getISPName("username=abccash,ou=People,o=ABC Cash A Check Inc,ou=Clients,o=DMFC")
print "username=willieche,ou=People,o=Afroanime,ou=Clients,o=DMFC"
print getISPName("username=willieche,ou=People,o=Afroanime,ou=Clients,o=DMFC")
print "username=zev,ou=People,o=Weintraub Morton,ou=Clients,o=DMFC"
print getISPName("username=zev,ou=People,o=Weintraub Morton,ou=Clients,o=DMFC")
print "username=vishosttest001,ou=People,o=visihosttest001,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=vishosttest001,ou=People,o=visihosttest001,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=basicmonthlyftp,ou=People,o=basicmonthlyFTP,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=basicmonthlyftp,ou=People,o=basicmonthlyFTP,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=basicyearlyftp,ou=People,o=basicyearlyFTP,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=basicyearlyftp,ou=People,o=basicyearlyFTP,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=basiceasymonthly,ou=People,o=basiceasymonthly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=basiceasymonthly,ou=People,o=basiceasymonthly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=basiceasyyearly,ou=People,o=basiceasyyearly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=basiceasyyearly,ou=People,o=basiceasyyearly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=basicfpmonthly,ou=People,o=basicFPmonthly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=basicfpmonthly,ou=People,o=basicFPmonthly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=basicfpyearly,ou=People,o=basicFPyearly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=basicfpyearly,ou=People,o=basicFPyearly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=proftpmonthly,ou=People,o=proFTPmonthly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=proftpmonthly,ou=People,o=proFTPmonthly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=proftpyearly,ou=People,o=proFTPyearly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=proftpyearly,ou=People,o=proFTPyearly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=proeasymonthly,ou=People,o=proeasymonthly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=proeasymonthly,ou=People,o=proeasymonthly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=proeasyyearly,ou=People,o=proeasyyearly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=proeasyyearly,ou=People,o=proeasyyearly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=profpmonthly,ou=People,o=proFPmonthly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=profpmonthly,ou=People,o=proFPmonthly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=profpyearly,ou=People,o=proFPyearly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=profpyearly,ou=People,o=proFPyearly,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=swain,ou=People,o=wainstead.com,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=swain,ou=People,o=wainstead.com,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=visihost101,ou=People,o=visihost101,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=visihost101,ou=People,o=visihost101,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=swainswani,ou=People,o=testwrong.com,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=swainswani,ou=People,o=testwrong.com,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=visihost109,ou=People,o=VisiHost109.com,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=visihost109,ou=People,o=VisiHost109.com,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=visihost110,ou=People,o=VisiHost110.com,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=visihost110,ou=People,o=VisiHost110.com,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=visihost160,ou=People,o=visihost160,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=visihost160,ou=People,o=visihost160,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=visihost111,ou=People,o=visihost111,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=visihost111,ou=People,o=visihost111,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=visihost112,ou=People,o=visihost112,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=visihost112,ou=People,o=visihost112,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=visihost201,ou=People,o=visihost201,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=visihost201,ou=People,o=visihost201,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=admin,ou=People,o=HostBran,ou=Clients,o=DMFC"
print getISPName("username=admin,ou=People,o=HostBran,ou=Clients,o=DMFC")
print "username=admin,ou=People,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=admin,ou=People,o=4Templates,ou=Clients,o=DMFC")
print "username=erictesting,ou=People,o=basicmonthlyFTP,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=erictesting,ou=People,o=basicmonthlyFTP,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=4tem001,ou=People,o=gg4templatestest1.com,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=4tem001,ou=People,o=gg4templatestest1.com,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=4tem201,ou=People,o=4Tem201,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=4tem201,ou=People,o=4Tem201,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=4tem301,ou=People,o=4Tem301,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=4tem301,ou=People,o=4Tem301,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=4tem202,ou=People,o=4T3m202,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=4tem202,ou=People,o=4T3m202,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=4tem211,ou=People,o=4tem211,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=4tem211,ou=People,o=4tem211,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=4tem002,ou=People,o=gg4templatetest2.co.uk,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=4tem002,ou=People,o=gg4templatetest2.co.uk,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=4tem212,ou=People,o=4tem212,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=4tem212,ou=People,o=4tem212,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=4tem011,ou=People,o=sdatrjthky,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=4tem011,ou=People,o=sdatrjthky,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=4tem012,ou=People,o=adsgfsjyt,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=4tem012,ou=People,o=adsgfsjyt,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=4tem102,ou=People,o=4Tem102,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=4tem102,ou=People,o=4Tem102,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=4tem101,ou=People,o=4Tem101,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=4tem101,ou=People,o=4Tem101,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=4tem111,ou=People,o=4Tem111,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=4tem111,ou=People,o=4Tem111,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=hstest001,ou=People,o=HSTest001,ou=Clients,o=V3 Hosting,ou=Clients,o=DMFC"
print getISPName("username=hstest001,ou=People,o=HSTest001,ou=Clients,o=V3 Hosting,ou=Clients,o=DMFC")
print "username=testswain,ou=People,o=testswain,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=testswain,ou=People,o=testswain,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=swaintestuser,ou=People,o=swaintestuser,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=swaintestuser,ou=People,o=swaintestuser,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=wankwank,ou=People,o=testtest,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=wankwank,ou=People,o=testtest,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=takeitonme2,ou=People,o=swaintestuser33,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=takeitonme2,ou=People,o=swaintestuser33,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=werewrrwe,ou=People,o=asdfasdf,ou=Clients,o=V3 Hosting,ou=Clients,o=DMFC"
print getISPName("username=werewrrwe,ou=People,o=asdfasdf,ou=Clients,o=V3 Hosting,ou=Clients,o=DMFC")
print "username=4tem6601,ou=People,o=4Tem6601,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=4tem6601,ou=People,o=4Tem6601,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=4temswain01,ou=People,o=4TemSwain01,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=4temswain01,ou=People,o=4TemSwain01,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=swaintest5,ou=People,o=swaintest5,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=swaintest5,ou=People,o=swaintest5,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=swaintest6,ou=People,o=swaintest6,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=swaintest6,ou=People,o=swaintest6,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=swaintest7,ou=People,o=swaintest7,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=swaintest7,ou=People,o=swaintest7,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=swainptest1,ou=People,o=swainPtest1,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=swainptest1,ou=People,o=swainPtest1,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=swainptest2,ou=People,o=swainPtest2,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=swainptest2,ou=People,o=swainPtest2,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=swaintest8,ou=People,o=swaintest8,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=swaintest8,ou=People,o=swaintest8,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=wintest1,ou=People,o=wintest1,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=wintest1,ou=People,o=wintest1,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=admin,ou=People,o=HostDemo,ou=Clients,o=DMFC"
print getISPName("username=admin,ou=People,o=HostDemo,ou=Clients,o=DMFC")
print "username=wintest2,ou=People,o=wintest2,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=wintest2,ou=People,o=wintest2,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=admin,ou=People,o=DemoHost,ou=Clients,o=DMFC"
print getISPName("username=admin,ou=People,o=DemoHost,ou=Clients,o=DMFC")
print "username=swainptest3,ou=People,o=swainPtest3,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=swainptest3,ou=People,o=swainPtest3,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=swaintest08,ou=People,o=swaintest08,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=swaintest08,ou=People,o=swaintest08,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=swainptest45,ou=People,o=swainPtest45,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=swainptest45,ou=People,o=swainPtest45,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=swaintesta1,ou=People,o=swaintestA1,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=swaintesta1,ou=People,o=swaintestA1,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=rwainstead,ou=People,o=rwainstead,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=rwainstead,ou=People,o=rwainstead,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=lamantarraya,ou=People,o=laurakelly,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=lamantarraya,ou=People,o=laurakelly,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=wainsteadstead,ou=People,o=wainsteadstead,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=wainsteadstead,ou=People,o=wainsteadstead,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=jeffoampirasite,ou=People,o=jeffoampirasite,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=jeffoampirasite,ou=People,o=jeffoampirasite,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=jeffoampiranet,ou=People,o=jeffoampiranet,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=jeffoampiranet,ou=People,o=jeffoampiranet,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3hotbody,ou=People,o=v3hotbody,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3hotbody,ou=People,o=v3hotbody,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3hotbody2,ou=People,o=v3hotbody2,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3hotbody2,ou=People,o=v3hotbody2,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3,ou=People,o=oui,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3,ou=People,o=oui,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=jeffo,ou=People,o=jeffo,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=jeffo,ou=People,o=jeffo,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=victor,ou=People,o=VHC,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=victor,ou=People,o=VHC,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=whohowhowhw,ou=People,o=lkj,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=whohowhowhw,ou=People,o=lkj,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=team,ou=People,o=zuni,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=team,ou=People,o=zuni,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=changeswain,ou=People,o=changeswain,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=changeswain,ou=People,o=changeswain,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=formtest3,ou=People,o=formtest3,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=formtest3,ou=People,o=formtest3,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=rob,ou=People,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=rob,ou=People,o=FC Gold,ou=Clients,o=DMFC")
print "username=testing1234,ou=People,o=domain.com,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=testing1234,ou=People,o=domain.com,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC")
print "username=newhostgs01,ou=People,o=newhostGS01,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=newhostgs01,ou=People,o=newhostGS01,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC")
print "username=newhostgs002,ou=People,o=newhostGS002,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=newhostgs002,ou=People,o=newhostGS002,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC")
print "username=jessytest02,ou=People,o=jessytest02,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=jessytest02,ou=People,o=jessytest02,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC")
print "username=fcgtest909,ou=People,o=FCGTest909,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest909,ou=People,o=FCGTest909,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=gstest909,ou=People,o=gstest909,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=gstest909,ou=People,o=gstest909,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC")
print "username=gstest910,ou=People,o=GSTest910,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=gstest910,ou=People,o=GSTest910,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC")
print "username=fcgtest809,ou=People,o=FCGtest809,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest809,ou=People,o=FCGtest809,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=gstest809,ou=People,o=GStest809,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=gstest809,ou=People,o=GStest809,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC")
print "username=swaintest007,ou=People,o=swaintest007,ou=Clients,o=DMFC"
print getISPName("username=swaintest007,ou=People,o=swaintest007,ou=Clients,o=DMFC")
print "username=14upgradetest01,ou=People,o=14upgradetest01,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=14upgradetest01,ou=People,o=14upgradetest01,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC")
print "username=v314upgrade01,ou=People,o=V314Upgrade01,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v314upgrade01,ou=People,o=V314Upgrade01,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=fc14upgrade01,ou=People,o=fc14upgrade01,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fc14upgrade01,ou=People,o=fc14upgrade01,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=ampira14upgrade01,ou=People,o=ampira14upgrade01,ou=Clients,o=DMFC"
print getISPName("username=ampira14upgrade01,ou=People,o=ampira14upgrade01,ou=Clients,o=DMFC")
print "username=admin,ou=People,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=admin,ou=People,o=HostEfaab,ou=Clients,o=DMFC")
print "username=admin,ou=People,o=HostLive365,ou=Clients,o=DMFC"
print getISPName("username=admin,ou=People,o=HostLive365,ou=Clients,o=DMFC")
print "username=zlatin,ou=People,o=FortuneCity.com Inc.,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=zlatin,ou=People,o=FortuneCity.com Inc.,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swaintest114,ou=People,o=swaintest114,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swaintest114,ou=People,o=swaintest114,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab001,ou=People,o=hostefaab,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab001,ou=People,o=hostefaab,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab002,ou=People,o=hostefaab002,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab002,ou=People,o=hostefaab002,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab003,ou=People,o=hostefaab003,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab003,ou=People,o=hostefaab003,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab004,ou=People,o=hostefaab004,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab004,ou=People,o=hostefaab004,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab01,ou=People,o=efaab01,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab01,ou=People,o=efaab01,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab0019,ou=People,o=hostefaab19,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab0019,ou=People,o=hostefaab19,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab010,ou=People,o=efaab010,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab010,ou=People,o=efaab010,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab011,ou=People,o=Efaab011,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab011,ou=People,o=Efaab011,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab0100,ou=People,o=Efaab0100,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab0100,ou=People,o=Efaab0100,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab20,ou=People,o=Efaab20,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab20,ou=People,o=Efaab20,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swaintest115,ou=People,o=swaintest115,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swaintest115,ou=People,o=swaintest115,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaabtest2,ou=People,o=efaabtest2,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaabtest2,ou=People,o=efaabtest2,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab015,ou=People,o=efaab015,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab015,ou=People,o=efaab015,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab012,ou=People,o=Efaab012,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab012,ou=People,o=Efaab012,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab016,ou=People,o=efaab016,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab016,ou=People,o=efaab016,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab005,ou=People,o=efaab005,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab005,ou=People,o=efaab005,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab007,ou=People,o=efaab007,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab007,ou=People,o=efaab007,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab008,ou=People,o=efaab008,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab008,ou=People,o=efaab008,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab009,ou=People,o=efaab009,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab009,ou=People,o=efaab009,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab006,ou=People,o=efaab006,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab006,ou=People,o=efaab006,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swaintest1151,ou=People,o=swaintest1151,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swaintest1151,ou=People,o=swaintest1151,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swaintest117,ou=People,o=swaintest117,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swaintest117,ou=People,o=swaintest117,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swaintest118,ou=People,o=swaintest118,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swaintest118,ou=People,o=swaintest118,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab017,ou=People,o=Efaab017,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab017,ou=People,o=Efaab017,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=efaab018,ou=People,o=Efaab018,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=efaab018,ou=People,o=Efaab018,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swainauto018,ou=People,o=swainauto018,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swainauto018,ou=People,o=swainauto018,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swainauto001,ou=People,o=swainauto001,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swainauto001,ou=People,o=swainauto001,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swainauto004,ou=People,o=swainauto004,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swainauto004,ou=People,o=swainauto004,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swainauto003,ou=People,o=swainauto003,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swainauto003,ou=People,o=swainauto003,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swainauto006,ou=People,o=swainauto006,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swainauto006,ou=People,o=swainauto006,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swainauto002,ou=People,o=swainauto002,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swainauto002,ou=People,o=swainauto002,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swainauto005,ou=People,o=swainauto005,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swainauto005,ou=People,o=swainauto005,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swainauto015,ou=People,o=swainauto015,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swainauto015,ou=People,o=swainauto015,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swainauto017,ou=People,o=swainauto017,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swainauto017,ou=People,o=swainauto017,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swainauto007,ou=People,o=swainauto007,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swainauto007,ou=People,o=swainauto007,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swainauto010,ou=People,o=swainauto010,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swainauto010,ou=People,o=swainauto010,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swainauto009,ou=People,o=swainauto009,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swainauto009,ou=People,o=swainauto009,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swainauto008,ou=People,o=swainauto008,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swainauto008,ou=People,o=swainauto008,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swainauto011,ou=People,o=swainauto011,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swainauto011,ou=People,o=swainauto011,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=blippyauto016,ou=People,o=blippyauto016,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=blippyauto016,ou=People,o=blippyauto016,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=swainauto012,ou=People,o=swainauto012,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=swainauto012,ou=People,o=swainauto012,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=fp2002testampira,ou=People,o=fp2002testampira,ou=Clients,o=DMFC"
print getISPName("username=fp2002testampira,ou=People,o=fp2002testampira,ou=Clients,o=DMFC")
print "username=fp2002testfcgold1,ou=People,o=fp2002testfcgold1,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fp2002testfcgold1,ou=People,o=fp2002testfcgold1,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=v3two26,ou=People,o=v3two26,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two26,ou=People,o=v3two26,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two23,ou=People,o=v3two23,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two23,ou=People,o=v3two23,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two24,ou=People,o=v3two24,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two24,ou=People,o=v3two24,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two25,ou=People,o=v3two25,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two25,ou=People,o=v3two25,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two39,ou=People,o=v3two39,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two39,ou=People,o=v3two39,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two53,ou=People,o=v3two53,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two53,ou=People,o=v3two53,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two50,ou=People,o=v3two50,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two50,ou=People,o=v3two50,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two49,ou=People,o=v3two49,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two49,ou=People,o=v3two49,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two51,ou=People,o=v3two51,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two51,ou=People,o=v3two51,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two52,ou=People,o=v3two52,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two52,ou=People,o=v3two52,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two38,ou=People,o=v3two38,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two38,ou=People,o=v3two38,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two20,ou=People,o=v3two20,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two20,ou=People,o=v3two20,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two21,ou=People,o=v3two21,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two21,ou=People,o=v3two21,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two22,ou=People,o=v3two22,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two22,ou=People,o=v3two22,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two27,ou=People,o=v3two27,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two27,ou=People,o=v3two27,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two28,ou=People,o=v3two28,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two28,ou=People,o=v3two28,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two36,ou=People,o=v3two36,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two36,ou=People,o=v3two36,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two32,ou=People,o=v3two32,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two32,ou=People,o=v3two32,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two33,ou=People,o=v3two33,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two33,ou=People,o=v3two33,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two41,ou=People,o=v3two41,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two41,ou=People,o=v3two41,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two42,ou=People,o=v3two42,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two42,ou=People,o=v3two42,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two29,ou=People,o=v3two29,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two29,ou=People,o=v3two29,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two30,ou=People,o=v3two30,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two30,ou=People,o=v3two30,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two35,ou=People,o=v3two35,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two35,ou=People,o=v3two35,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two34,ou=People,o=v3two34,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two34,ou=People,o=v3two34,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two43,ou=People,o=v3two43,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two43,ou=People,o=v3two43,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two31,ou=People,o=v3two31,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two31,ou=People,o=v3two31,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two37,ou=People,o=v3two37,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two37,ou=People,o=v3two37,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two40,ou=People,o=v3two40,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two40,ou=People,o=v3two40,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two58,ou=People,o=v3two58,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two58,ou=People,o=v3two58,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two54,ou=People,o=v3two54,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two54,ou=People,o=v3two54,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two57,ou=People,o=v3two57,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two57,ou=People,o=v3two57,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two55,ou=People,o=v3two55,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two55,ou=People,o=v3two55,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two56,ou=People,o=v3two56,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two56,ou=People,o=v3two56,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=swaintest0130,ou=People,o=swaintest0130,ou=Clients,o=DMFC"
print getISPName("username=swaintest0130,ou=People,o=swaintest0130,ou=Clients,o=DMFC")
print "username=v3two14,ou=People,o=v3two14,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two14,ou=People,o=v3two14,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two5,ou=People,o=v3two5,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two5,ou=People,o=v3two5,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two6,ou=People,o=v3two6,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two6,ou=People,o=v3two6,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two11,ou=People,o=v3two11,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two11,ou=People,o=v3two11,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two2,ou=People,o=v3two2,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two2,ou=People,o=v3two2,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two3,ou=People,o=v3two3,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two3,ou=People,o=v3two3,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two7,ou=People,o=v3two7,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two7,ou=People,o=v3two7,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two17,ou=People,o=v3two17,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two17,ou=People,o=v3two17,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two8,ou=People,o=v3two8,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two8,ou=People,o=v3two8,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two9,ou=People,o=v3two9,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two9,ou=People,o=v3two9,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two4,ou=People,o=v3two4,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two4,ou=People,o=v3two4,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two19,ou=People,o=v3two19,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two19,ou=People,o=v3two19,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two1,ou=People,o=v3two1,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two1,ou=People,o=v3two1,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two13,ou=People,o=v3two13,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two13,ou=People,o=v3two13,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two10,ou=People,o=v3two10,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two10,ou=People,o=v3two10,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=v3two16,ou=People,o=v3two16,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=v3two16,ou=People,o=v3two16,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=zlatintest01,ou=People,o=zlatintest01,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=zlatintest01,ou=People,o=zlatintest01,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=zlatintest01,ou=People,o=zlatintest01,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=zlatintest01,ou=People,o=zlatintest01,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=domainforwarding,ou=People,o=DomainForwarding,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=domainforwarding,ou=People,o=DomainForwarding,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=domainoneemail,ou=People,o=DomainOneEmail,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=domainoneemail,ou=People,o=DomainOneEmail,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=jessssdkjfhsdjkh,ou=People,o=sdjkfhaskfh,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=jessssdkjfhsdjkh,ou=People,o=sdjkfhaskfh,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=domainoneemailfrw,ou=People,o=DomainOneEmailFrw,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=domainoneemailfrw,ou=People,o=DomainOneEmailFrw,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=personftpmonth,ou=People,o=PersonFTPMonth,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=personftpmonth,ou=People,o=PersonFTPMonth,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=personftpmonthcuteftp,ou=People,o=PersonFTPMonthCuteFTP,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=personftpmonthcuteftp,ou=People,o=PersonFTPMonthCuteFTP,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=businessftpyearly,ou=People,o=BusinessFTPyearly,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=businessftpyearly,ou=People,o=BusinessFTPyearly,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=superftpmonth,ou=People,o=SuperFTPMonth,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=superftpmonth,ou=People,o=SuperFTPMonth,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=personftpyear,ou=People,o=PersonFTPYear,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=personftpyear,ou=People,o=PersonFTPYear,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=superftpyear,ou=People,o=SuperFTPYear,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=superftpyear,ou=People,o=SuperFTPYear,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=personfpmonth,ou=People,o=PersonFPMonth,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=personfpmonth,ou=People,o=PersonFPMonth,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=personfpyear,ou=People,o=PersonFPYear,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=personfpyear,ou=People,o=PersonFPYear,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=businessfpyearly,ou=People,o=BusinessFPyearly,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=businessfpyearly,ou=People,o=BusinessFPyearly,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=businessfpmonth,ou=People,o=BusinessFPMonth,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=businessfpmonth,ou=People,o=BusinessFPMonth,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=superfpmonth,ou=People,o=SuperFPMonth,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=superfpmonth,ou=People,o=SuperFPMonth,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=vic010,ou=People,o=vic010,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=vic010,ou=People,o=vic010,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=vic011,ou=People,o=Vic011,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=vic011,ou=People,o=Vic011,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=persontrellixmonth,ou=People,o=PersonTrellixMonth,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=persontrellixmonth,ou=People,o=PersonTrellixMonth,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=persontrellixyear,ou=People,o=PersonTrellixYear,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=persontrellixyear,ou=People,o=PersonTrellixYear,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=vic012,ou=People,o=vic012,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=vic012,ou=People,o=vic012,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=monthtrellixmonth,ou=People,o=MonthTrellixMonth,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=monthtrellixmonth,ou=People,o=MonthTrellixMonth,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=vic013,ou=People,o=vic013,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=vic013,ou=People,o=vic013,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=businesstrellixyear,ou=People,o=BusinessTrellixYear,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=businesstrellixyear,ou=People,o=BusinessTrellixYear,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=supertrellixyear,ou=People,o=SuperTrellixYear,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=supertrellixyear,ou=People,o=SuperTrellixYear,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=supertrellixmonth,ou=People,o=SuperTrellixMonth,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=supertrellixmonth,ou=People,o=SuperTrellixMonth,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=personftpyearcuteftp,ou=People,o=PersonFTPYearCuteFTP,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=personftpyearcuteftp,ou=People,o=PersonFTPYearCuteFTP,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=businessftpyearcuteftp,ou=People,o=BusinessFTPYearCuteFTP,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=businessftpyearcuteftp,ou=People,o=BusinessFTPYearCuteFTP,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=superftpyearcuteftp,ou=People,o=SuperFTPYearCuteFTP,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=superftpyearcuteftp,ou=People,o=SuperFTPYearCuteFTP,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=superftpmonthcuteftp,ou=People,o=SuperFTPMonthCuteFTP,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=superftpmonthcuteftp,ou=People,o=SuperFTPMonthCuteFTP,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=personftpmonthcutehtml,ou=People,o=PersonFTPMonthCuteHTML,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=personftpmonthcutehtml,ou=People,o=PersonFTPMonthCuteHTML,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=erictest5152003,ou=People,o=erictest5152003,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=erictest5152003,ou=People,o=erictest5152003,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=personftpyearcutehtml,ou=People,o=PersonFTPYearCuteHTML,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=personftpyearcutehtml,ou=People,o=PersonFTPYearCuteHTML,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=businessftpyearcutehtml,ou=People,o=BusinessFTPYearCuteHTML,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=businessftpyearcutehtml,ou=People,o=BusinessFTPYearCuteHTML,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=ericonepagesite001,ou=People,o=ericonepagesite001,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=ericonepagesite001,ou=People,o=ericonepagesite001,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=superftpyearcutehtml,ou=People,o=SuperFTPYearCuteHTML,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=superftpyearcutehtml,ou=People,o=SuperFTPYearCuteHTML,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=ehoneopagesite002,ou=People,o=ehoneopagesite002,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=ehoneopagesite002,ou=People,o=ehoneopagesite002,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=superftpmonthcutehtml,ou=People,o=SuperFTPMonthCuteHTML,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=superftpmonthcutehtml,ou=People,o=SuperFTPMonthCuteHTML,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=ehoneopagesite003,ou=People,o=ehoneopagesite003,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=ehoneopagesite003,ou=People,o=ehoneopagesite003,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=personftpmonthcutesb,ou=People,o=PersonFTPMonthCuteSB,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=personftpmonthcutesb,ou=People,o=PersonFTPMonthCuteSB,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=personftpyearcutesb,ou=People,o=PersonFTPYearCuteSB,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=personftpyearcutesb,ou=People,o=PersonFTPYearCuteSB,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=businessftpyearcutesb,ou=People,o=BusinessFTPYearCuteSB,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=businessftpyearcutesb,ou=People,o=BusinessFTPYearCuteSB,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=superftpyearcutesb,ou=People,o=SuperFTPYearCuteSB,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=superftpyearcutesb,ou=People,o=SuperFTPYearCuteSB,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=ericonepagesite004,ou=People,o=ericonepagesite004,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=ericonepagesite004,ou=People,o=ericonepagesite004,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=supersbmonthcuteftp,ou=People,o=SuperSBMonthCuteFTP,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=supersbmonthcuteftp,ou=People,o=SuperSBMonthCuteFTP,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=ericonepagesite004a,ou=People,o=ericonepagesite004a,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=ericonepagesite004a,ou=People,o=ericonepagesite004a,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=oneemailtofrw,ou=People,o=oneemailtofrw,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=oneemailtofrw,ou=People,o=oneemailtofrw,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=erictestonepage002,ou=People,o=erictestonepage002,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=erictestonepage002,ou=People,o=erictestonepage002,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=erictestonepage003,ou=People,o=erictestonepage003,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=erictestonepage003,ou=People,o=erictestonepage003,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=oneemailtopersonalftpmonthly,ou=People,o=OneEmailtoPersonalFTPMonthly,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=oneemailtopersonalftpmonthly,ou=People,o=OneEmailtoPersonalFTPMonthly,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=fiveemailtopersonalftpmonthly,ou=People,o=FiveEmailtoPersonalFTPMonthly,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=fiveemailtopersonalftpmonthly,ou=People,o=FiveEmailtoPersonalFTPMonthly,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=tenemailtopersonalftpmonthly,ou=People,o=TenEmailtoPersonalFTPMonthly,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=tenemailtopersonalftpmonthly,ou=People,o=TenEmailtoPersonalFTPMonthly,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=twentyemailtopersonalftpmonthly,ou=People,o=TwentyEmailtoPersonalFTPMonthly,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=twentyemailtopersonalftpmonthly,ou=People,o=TwentyEmailtoPersonalFTPMonthly,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=100emailtopersonalftpmonthly,ou=People,o=100EmailtoPersonalFTPMonthly,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=100emailtopersonalftpmonthly,ou=People,o=100EmailtoPersonalFTPMonthly,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=ggtest0521,ou=People,o=ggtest0521,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=ggtest0521,ou=People,o=ggtest0521,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=totallytesting,ou=People,o=totallytesting,ou=Clients,o=DMFC"
print getISPName("username=totallytesting,ou=People,o=totallytesting,ou=Clients,o=DMFC")
print "username=swainstagtest,ou=People,o=swainstagtest,ou=Clients,o=HostV3,ou=Clients,o=DMFC"
print getISPName("username=swainstagtest,ou=People,o=swainstagtest,ou=Clients,o=HostV3,ou=Clients,o=DMFC")
print "username=live3651,ou=People,o=live3651,ou=Clients,o=HostLive365,ou=Clients,o=DMFC"
print getISPName("username=live3651,ou=People,o=live3651,ou=Clients,o=HostLive365,ou=Clients,o=DMFC")
print "username=live36515,ou=People,o=live36515,ou=Clients,o=HostLive365,ou=Clients,o=DMFC"
print getISPName("username=live36515,ou=People,o=live36515,ou=Clients,o=HostLive365,ou=Clients,o=DMFC")
print "username=live36514,ou=People,o=live36514,ou=Clients,o=HostLive365,ou=Clients,o=DMFC"
print getISPName("username=live36514,ou=People,o=live36514,ou=Clients,o=HostLive365,ou=Clients,o=DMFC")
print "username=live3657,ou=People,o=live3657,ou=Clients,o=HostLive365,ou=Clients,o=DMFC"
print getISPName("username=live3657,ou=People,o=live3657,ou=Clients,o=HostLive365,ou=Clients,o=DMFC")
print "username=live3652,ou=People,o=live3652,ou=Clients,o=HostLive365,ou=Clients,o=DMFC"
print getISPName("username=live3652,ou=People,o=live3652,ou=Clients,o=HostLive365,ou=Clients,o=DMFC")
print "username=live3659,ou=People,o=live3659,ou=Clients,o=HostLive365,ou=Clients,o=DMFC"
print getISPName("username=live3659,ou=People,o=live3659,ou=Clients,o=HostLive365,ou=Clients,o=DMFC")
print "username=live36513,ou=People,o=live36513,ou=Clients,o=HostLive365,ou=Clients,o=DMFC"
print getISPName("username=live36513,ou=People,o=live36513,ou=Clients,o=HostLive365,ou=Clients,o=DMFC")
print "username=live3654,ou=People,o=live3654,ou=Clients,o=HostLive365,ou=Clients,o=DMFC"
print getISPName("username=live3654,ou=People,o=live3654,ou=Clients,o=HostLive365,ou=Clients,o=DMFC")
print "username=live36510,ou=People,o=live36510,ou=Clients,o=HostLive365,ou=Clients,o=DMFC"
print getISPName("username=live36510,ou=People,o=live36510,ou=Clients,o=HostLive365,ou=Clients,o=DMFC")
print "username=live3655,ou=People,o=live3655,ou=Clients,o=HostLive365,ou=Clients,o=DMFC"
print getISPName("username=live3655,ou=People,o=live3655,ou=Clients,o=HostLive365,ou=Clients,o=DMFC")
print "username=live36511,ou=People,o=live36511,ou=Clients,o=HostLive365,ou=Clients,o=DMFC"
print getISPName("username=live36511,ou=People,o=live36511,ou=Clients,o=HostLive365,ou=Clients,o=DMFC")
print "username=live3656,ou=People,o=live3656,ou=Clients,o=HostLive365,ou=Clients,o=DMFC"
print getISPName("username=live3656,ou=People,o=live3656,ou=Clients,o=HostLive365,ou=Clients,o=DMFC")
print "username=live36512,ou=People,o=live36512,ou=Clients,o=HostLive365,ou=Clients,o=DMFC"
print getISPName("username=live36512,ou=People,o=live36512,ou=Clients,o=HostLive365,ou=Clients,o=DMFC")
print "username=live3658,ou=People,o=live3658,ou=Clients,o=HostLive365,ou=Clients,o=DMFC"
print getISPName("username=live3658,ou=People,o=live3658,ou=Clients,o=HostLive365,ou=Clients,o=DMFC")
print "username=live3653,ou=People,o=live3653,ou=Clients,o=HostLive365,ou=Clients,o=DMFC"
print getISPName("username=live3653,ou=People,o=live3653,ou=Clients,o=HostLive365,ou=Clients,o=DMFC")
print "username=krokus,ou=People,o=live3655,ou=Clients,o=HostLive365,ou=Clients,o=DMFC"
print getISPName("username=krokus,ou=People,o=live3655,ou=Clients,o=HostLive365,ou=Clients,o=DMFC")
print "username=test1234,ou=People,o=test1234,ou=Clients,o=DMFC"
print getISPName("username=test1234,ou=People,o=test1234,ou=Clients,o=DMFC")
print "username=eviljavascriptfix,ou=People,o=eviljavascriptfix,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=eviljavascriptfix,ou=People,o=eviljavascriptfix,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=eviljavascriptfix2,ou=People,o=eviljavascriptfix2,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=eviljavascriptfix2,ou=People,o=eviljavascriptfix2,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=signupwiztest,ou=People,o=signupwiztest,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=signupwiztest,ou=People,o=signupwiztest,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=fcgtest666,ou=People,o=fcgtest666,ou=Clients,o=FC Gold,ou=Clients,o=DMFC"
print getISPName("username=fcgtest666,ou=People,o=fcgtest666,ou=Clients,o=FC Gold,ou=Clients,o=DMFC")
print "username=hjfttuetyuety,ou=People,o=ghgfhgfhj,ou=Clients,o=4Templates,ou=Clients,o=DMFC"
print getISPName("username=hjfttuetyuety,ou=People,o=ghgfhgfhj,ou=Clients,o=4Templates,ou=Clients,o=DMFC")
print "username=yuetyuyuryu,ou=People,o=tyrtyer,ou=Clients,o=DMFC"
print getISPName("username=yuetyuyuryu,ou=People,o=tyrtyer,ou=Clients,o=DMFC")
print "username=fsdfsfsdfsdf,ou=People,o=gdfgdfg,ou=Clients,o=DMFC"
print getISPName("username=fsdfsfsdfsdf,ou=People,o=gdfgdfg,ou=Clients,o=DMFC")
print "username=asasdfsdffsd,ou=People,o=dasdasdasd,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC"
print getISPName("username=asasdfsdffsd,ou=People,o=dasdasdasd,ou=Clients,o=HostEfaab,ou=Clients,o=DMFC")
print "username=trtyrtytryer,ou=People,o=rtyetye,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC"
print getISPName("username=trtyrtytryer,ou=People,o=rtyetye,ou=Clients,o=GlobalScape,ou=Clients,o=DMFC")
print "username=ertuetyuetyer,ou=People,o=ertwerte,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=ertuetyuetyer,ou=People,o=ertwerte,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=ereterter,ou=People,o=sfhgfhg,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=ereterter,ou=People,o=sfhgfhg,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")
print "username=tsdrtwertry,ou=People,o=gfhdfj,ou=Clients,o=VisiHost,ou=Clients,o=DMFC"
print getISPName("username=tsdrtwertry,ou=People,o=gfhdfj,ou=Clients,o=VisiHost,ou=Clients,o=DMFC")


