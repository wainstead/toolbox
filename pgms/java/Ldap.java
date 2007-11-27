import java.util.Properties;
import java.lang.*;
import javax.naming.*;
import javax.naming.directory.*;
import java.util.*;


class Ldap {


    public static void main(String argv[]) {

        String host = "localhost";
        int port = 400;
        String dn = "cn=Directory Manager";
        String password = "11223344";
        DirContext dirContext = null;
        

        // connect
        try {
            Properties env = new Properties();
            env.put(DirContext.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
            env.put(DirContext.PROVIDER_URL, "ldap://evw-1.dev.ampira.com:400");
            env.put(DirContext.SECURITY_PRINCIPAL, dn);
            env.put(DirContext.SECURITY_CREDENTIALS, password);
            dirContext = new InitialDirContext(env);
        } catch (NamingException ne) {
            System.err.println("Exception when connecting, " + 
                               "printing stack trace.");
            ne.printStackTrace();
            System.exit(1 );
        }

        // query


        try {
            SearchControls sc = new SearchControls();
            sc.setSearchScope(SearchControls.SUBTREE_SCOPE);
            
            // run a simple search
            NamingEnumeration ne = dirContext.search("o=DMFC", "(username=*)", sc);
            
            // iterate over the results
            while (ne.hasMore()) {
                
                HashMap userValues = new HashMap();
                
                SearchResult sr = (SearchResult)ne.next();
                //System.out.println("SearchResult as string: " + sr.toString());
                Attributes atts = sr.getAttributes();
                //System.out.println("size of this result: " + atts.size());
                NamingEnumeration ne2 = atts.getAll();
                // print out each attribute; note toString() renders them colon separated
                while (ne2.hasMore()) {
                    Attribute att = (Attribute)ne2.next();
                    String st = att.toString();
                    //System.out.println("thing: " + st);
                    //System.out.println("size: " + att.size());
                    int colon = st.indexOf(":");
                    String key = st.substring(0, colon);
                    String val = st.substring(colon+2, st.length());
                    //System.out.println("key/value: '" + key + "/" + val + "'");
                    userValues.put(key, val);
                }
                if ( ! userValues.containsKey("evwispdn") ) 
                    continue;
                System.out.println("full dn: " + userValues.get("evwispdn"));
                String evwispdn = (String)userValues.get("evwispdn");
                int comma = evwispdn.indexOf(",");
                if (comma == -1) {
                    // it's an Ampira account
                    userValues.put("visp", "ampira");
                } else {
                    // it's a visp account
                    String visp = evwispdn.substring(2, comma);
                    visp = visp.toLowerCase();
                    visp = visp.replace(' ', '_');
                    userValues.put("visp", visp);
                }
                System.out.println("visp: " + (String)userValues.get("visp"));





                ///////////////////////////////////////////////////////////////////////////
                // now get the domain name
                if ( ! userValues.containsKey("evworgdn") ) 
                    continue;

                // something screwy with this entry, maybe because org name contains "\/"
                if ( "sara15".equals((String)userValues.get("username")) )
                    continue;
                
                String[] rettributes = new String[1];
                rettributes[0] = "evwzone";

                sc.setReturningAttributes(rettributes);

                NamingEnumeration nedn
                    = dirContext.search((String)userValues.get("evworgdn"), "(objectclass=evwZone)", sc);

                OUTER:
                while (nedn.hasMore()) {
                    SearchResult srdn = (SearchResult)nedn.next();
                    //System.out.println("SearchResult as string: " + sr.toString());
                    Attributes attsdn = srdn.getAttributes();
                    //System.out.println("size of this result: " + atts.size());
                    NamingEnumeration nedn2 = attsdn.getAll();
                    INNER:
                    while (nedn2.hasMore()) {
                        Attribute attdn = (Attribute)nedn2.next();
                        //System.out.println("evwzone: " + attdn.toString());
                        String st = attdn.toString();
                        int colon = st.indexOf(":");
                        String key = st.substring(0, colon);
                        String val = st.substring(colon+2, st.length());
                        userValues.put(key, val);
                    
                        break OUTER; // we only use the first domain name, some people have more than one
                    }
                }


                // debug: print out the hashmap
                Iterator it = userValues.keySet().iterator();
                while (it.hasNext()) {
                    String key = (String) it.next();
                    System.out.println("Key: " + key + " Value: " + userValues.get(key));
                }



            }



        } catch (NamingException ne) {
            System.err.println("Error searching: " + ne.getMessage());
            ne.printStackTrace();
        }

    }
}
