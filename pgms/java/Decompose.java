/* $Id: Decompose.java,v 1.4 2004/10/14 20:34:22 swain Exp $ */

import com.evolutionware.CORBA.*;
import com.evolutionware.UI.*;
import com.evolutionware.Exceptions.*;
import com.evolutionware.CORBA.AccountsPackage.*;

import java.io.*;
import java.lang.*;
import java.util.HashMap;
import java.sql.*;

/** 
 * Decompose queries the INSTALLED table in the EVW billing database
 * for all installed product IDs, then gets each one in turn from the
 * Product Module and prints out its attributes.
 *
 *  @author  $Author: swain $
 *  @version $Id: Decompose.java,v 1.4 2004/10/14 20:34:22 swain Exp $
 * <br>
 *  @see <a href="https://cvs.corp.fortunecity.com/cgi-bin/viewcvs.cgi/swain/pgms/java/Decompose.java">CVS log</a>
 * 
 * <pre>
 * $Source: /opt/cvs/swain/pgms/java/Decompose.java,v $
 * 
 * </pre>
 */

public class Decompose {

    public static void main(String[] argv) {


        java.lang.System.setProperty("EVW_HOME", "/opt/evw");
        String username = "admin";
        String password = "vcx874";
        String userDN = "";
        String sessionKey = "";
        String ispDn = "o=FC Gold,ou=Clients,o=DMFC";

        int counter = 0;
        ProductModule prodmodule = null;
        Accounts accountsModule = null;
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

            accountsModule = resources.getAccountsModule();

            // get a CORBA system object so we can get a session key
            system = resources.getSystem();

        } catch (Exception e) {
            stdout("Couldn't get the CORBA system. Or something.");
            e.printStackTrace();
        }


        // go get all the installed product ids from db2.
        Statement stmt   = null;
        ResultSet result = null;
        Connection conn  = null;
        try {
            Class.forName ("COM.ibm.db2.jdbc.app.DB2Driver").newInstance ();
            conn = DriverManager.getConnection("jdbc:db2:evw", "evwbill", "112233");
            stmt = conn.createStatement();
            result = stmt.executeQuery("select installedid from installed");

        } catch (Exception e) {
            stdout("oops: " + e.getMessage() + "\n");
            e.printStackTrace();
            java.lang.System.exit(1);
        }



        try {


            userDN = system.getUserDn(username, "o="+system.getClientId());
//             stdout("using: " 
//                    + userDN 
//                    + " password: " 
//                    + password);
            sessionKey = system.authenticate(userDN, password, new byte[0]);
            
//            stdout("got userDN and sessionKey (" + userDN + " " + sessionKey + ")");

            int stopblock = 0;

            while (result.next()) {

                InstalledProduct ip = null;
                try {
                    ip = prodmodule.getInstalledProduct(sessionKey,
                                                        result.getString("installedid"));

                } catch (InstalledProductNotFound e) {
                    continue;
                }

                Command cmd = ip.command;
                
                for (int x = 0; x < cmd.data.length; x++) {

                    stdout(
                            cmd.data[x].key 
                           + "\t" 
                           + cmd.data[x].value
                           + "\t" 
                           + cmd.data[x].lvalue
                           + "\t"
                           + cmd.data[x].dvalue
                           );
                }
                stopblock++;
                if (stopblock > 5) break;
                stdout("--------------------------------------------");
            }

            // clean up your room or so help me you won't get any dinner
            conn.close();


        } catch (SystemUnavailable e) {
            stdout("Check the ispDn, it's probably wrong:");
            e.printStackTrace(java.lang.System.err);
        } catch (Exception e) {
            stdout("Doh! " + e);
            e.printStackTrace(java.lang.System.err);
        }


    }

    // get around System conflict
    private static void stdout(String message) {
        java.lang.System.out.println(message);
    }
}
