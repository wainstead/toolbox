/* $Id: SessionMaker.java,v 1.2 2003/07/18 16:27:40 swain Exp $ */

/* 
to generate the list of visps do:
 ldapsearch -h evw-1.dev.ampira.com -p 400 -D "cn=Directory Manager" -w 11223344 -b "o=DMFC" "(evworgtype=VISP)" evwdescription
*/

import com.evolutionware.CORBA.*;
import com.evolutionware.UI.*;
import com.evolutionware.Exceptions.*;

import java.io.*;
import java.lang.*;
import java.util.*;

public class SessionMaker {


    private static HashMap hm = new HashMap();


    public static void main(String[] argv) {

        init();

        if (argv.length != 3) {
            usage(1);
            java.lang.System.exit(1);
        }

        java.lang.System.setProperty("EVW_HOME", "/opt/evw");
        String username = argv[0];
        String password = argv[1];
        String visp = "";

        // set the "o=name" based on the third arg from command line; lookup in hm
        if (hm.containsKey(argv[2])) {
            visp     = (String)hm.get(argv[2]);
        } else {
            stdout("no such visp: " + argv[2]);
            usage(2);
        }

        String userDN = "";
        String sessionKey = "";


        //stdout("username, password, o=: " + username + " " + password + " " + visp);
        ProductModule prodmodule = null;
        com.evolutionware.CORBA.System system = null;

        ResourceManager resources = new ResourceManager();
        if (resources == null) {
            stdout("Didn't get a ResourceManager object."); 
        }


        try {

            // connect to product module
            prodmodule = resources.getProductModule();
            if (prodmodule == null)
                throw new Exception("Didn't get the product module.");
            //stdout(prodmodule);
            prodmodule.ping();
            //stdout("got the PM.");

            // get a CORBA system object so we can get a session key
            system = resources.getSystem();

        } catch (Exception e) {
            stdout("Couldn't get the CORBA system.");
            e.printStackTrace();
        }

        //stdout("got the system.");

        try {

            userDN = system.getUserDn(username, visp + system.getClientId());
            sessionKey = system.authenticate(userDN, password, new byte[0]);
            
            stdout("sessionkey: " + sessionKey);

        } catch (Exception e) {
            stdout("Doh! " + e);
            e.printStackTrace(java.lang.System.err);
        }
        
    }

    // get around System conflict
    private static void stdout(String message) {
        java.lang.System.out.println(message);
    }

    private static void init() {
        hm.put("ampira", "o=");
        hm.put("fcgold", "o=FC Gold,ou=Clients,o=");
        hm.put("globalscape", "o=GlobalScape,ou=Clients,o=");
        hm.put("hostv3", "o=HostV3,ou=Clients,o=");
        hm.put("visihost", "o=VisiHost,ou=Clients,o=");
        hm.put("hostbran", "o=HostBran,ou=Clients,o=");
        hm.put("4templates", "o=4Templates,ou=Clients,o=");
        hm.put("hostdemo", "o=HostDemo,ou=Clients,o=");
        hm.put("demohost", "o=DemoHost,ou=Clients,o=");
        hm.put("efaab", "o=HostEfaab,ou=Clients,o=");
        hm.put("live365", "o=HostLive365,ou=Clients,o=");
    }


    private static void usage(int exitcode) {
        stdout("Usage: SessionMaker username password visp");
        stdout("Available visps:");
        Iterator it = hm.keySet().iterator();
        while (it.hasNext()) {
            stdout("     " + (String)it.next());
        }
        java.lang.System.exit(exitcode);
    }

}

