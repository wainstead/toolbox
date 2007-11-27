
/* $Id: SubdomainSearch.java,v 1.3 2005/01/31 23:49:02 swain Exp $ */

import com.evolutionware.CORBA.*;
import com.evolutionware.UI.*;
import com.evolutionware.Exceptions.*;

/**
 * Class SubdomainSearch is a Command pattern class.
 */

public class SubdomainSearch {

    private java.lang.System.setProperty("EVW_HOME", "/opt/evw");
    private String username = "admin";
    private String password = "112233";
    private String userDN = "";
    private String sessionkey = "";
    private String orgDn = "o=FC Gold,ou=Clients,o=FCDE";
    private ResourceManager resources;
    private com.evolutionware.CORBA.System system = null;

    // init
    public boolean init() {
        resources = new ResourceManager();
        if (resources == null) {
            stdout("Didn't get a ResourceManager object."); 
        }

        try {
            // get a CORBA system object so we can get a session key
            system = resources.getSystem();
        } catch (Exception e) {
            stdout("Couldn't get the CORBA system.");
            e.printStackTrace();
        }


        try {

            userDN = system.getUserDn(username, "o="+system.getClientId());
            sessionkey = system.authenticate(userDN, password, new byte[0]);
            
            stdout("got userDN and sessionkey (" + userDN + " " + sessionkey + ")");
        } catch (Exception e) {
            stdout("error: " + e.getMessage());
            e.printStackTrace();
        }
    }


    public boolean lookupSubdomain(String registrationDomainPrefix, String registrationParentZone) {
        ////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////
        // stolen from /Applications/DomainRegistration/InstallingConfigCode.jsp
        ////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////
        try {
                
            String fqdn = registrationDomainPrefix + "." + registrationParentZone;

            boolean isValid = true;
            WhoisClient whoisClient = null;

            // step one: check for pending jobs for this fqdn
            try {
                String[] commandIds = 
                    system.findJobConflict(sessionkey, fqdn, CommandTaskStatusType.CommandTaskAnyStatus);
                
                if (commandIds.length > 0) {
                    stdout("There are pending jobs for the specified domain " 
                           + "in this Evolutionware system.  The domain cannot be registered.");
                    isValid = false;
                } else {
                    stdout("No jobs pending for: " + fqdn);
                }
            } catch(Exception e) {
                //Don't throw, the custome must be taken anyway!!
                stdout("Oops, caught an exception: " + e.getMessage());
                e.printStackTrace();
            }


            // step two: see if it's available

            // note that the default behavior of Evolutionware is to
            // return true if the domain is available, and to throw an
            // exception if it's not. Which is kinda retarded.
            // FIXME: need to test the case where somename.fortunecity.com is taken
            // FIXME: what does whoIsHolder contain?
            try {
                org.omg.CORBA.ORB orb = resources.getOrb();
                String whoisClientIor = system.resolve("Registrar");
                org.omg.CORBA.Object obj = orb.string_to_object(whoisClientIor);
                whoisClient = WhoisClientHelper.narrow(obj);

                org.omg.CORBA.StringHolder whoIsHolder = new org.omg.CORBA.StringHolder();
                stdout("testing: " + fqdn);
                boolean available = whoisClient.isDomainAvailable(registrationParentZone, fqdn, true, whoIsHolder);
                if (available) {
                    stdout("Yup, that fqing dn is available.");
                } else {
                    stdout("Nope, that fging dn is not available. You lose.");
                }

                // but does it really detect existing domains?
                // someotherdupetest.com
                stdout("testing: someotherdupetest.com");
                available = whoisClient.isDomainAvailable("com", "someotherdupetest.com", true, whoIsHolder);
                if (available) {
                    stdout("Yup, someotherdupetest.com is available.");
                }
            } catch (DuplicateFqdn df) {
                stdout("Dupe fqdn, and I caught the exception");
            }
 
            ////////////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////////////
            /// end stolen code
            ////////////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////////////



        } catch (SystemUnavailable e) {
            stdout("Check the orgDn, it's probably wrong:");
            e.printStackTrace(java.lang.System.err);
        } catch (Exception e) {
            stdout("Doh! " + e);
            e.printStackTrace(java.lang.System.err);
        }
        
    }

    /*
    private String registrationDomainPrefix = "";
    private String registrationParentZone   = "";

    public void setRegistrationDomainPrefix(String prefix) {
        this._registrationDomainPrefix = prefix;
    }
    public String getRegistrationDomainPrefix() {
        return this._registrationDomainPrefix;
    }


    public void setRegistrationParentZone(String prefix) {
        this._registrationParentZone = prefix;
    }
    public String getRegistrationParentZone() {
        return this._registrationParentZone;
    }
    */

    // get around System conflict
    private static void stdout(String message) {
        java.lang.System.out.println(message);
    }
}
