/* $Id: MakePackageXml.java,v 1.4 2004/05/06 18:24:04 swain Exp $ */

import com.evolutionware.CORBA.*;
import com.evolutionware.UI.*;
import com.evolutionware.Exceptions.*;

import java.io.*;
import java.lang.*;
import java.util.HashMap;

public class MakePackageXml {

    private static HashMap wanted = new HashMap();



    public static void main(String[] argv) {


         wanted.put("Monthly Packages", "Monthly Packages");
         wanted.put("Yearly Packages", "Yearly Packages");
         wanted.put("Quarterly Packages", "Quarterly Packages");

        java.lang.System.setProperty("EVW_HOME", "/opt/evw");
        String username = "admin";
        String password = "112233";
        String userDN = "";
        String sessionKey = "";
        String orgDn = "o=FC Gold,ou=Clients,o=FCDE";
        //String orgDn = "o=FCDE";
        int counter = 0;
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
            java.lang.System.out.println(prodmodule);
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

            userDN = system.getUserDn(username, "o="+system.getClientId());
            //stdout("trying: " + userDN + " " + password);
            sessionKey = system.authenticate(userDN, password, new byte[0]);
            
            //stdout("got userDN and sessionKey (" + userDN + " " + sessionKey + ")");

            int ctr = 0;

            ProductCategory[] pcs = prodmodule.getCategories(sessionKey, orgDn, CategoryType.PackageCategory);
            //stdout("number of categories: " + pcs.length );
            for (int x = 0; x < pcs.length; x++) {
                // use the HashMap to determine if we're interested in this category
                if (false && !wanted.containsKey(pcs[x].name) )
                    continue;
                //stdout(pcs[x].name);

                // these are always zero. Go SystemsFusion!
                //stdout("num categories: " + pcs[x].categories.length);
                //stdout("num packages: " + pcs[x].products.length);

                Product[] products = prodmodule.getProductsForCategory(sessionKey, pcs[x].id);
                if (products != null)
                    //stdout("Got this many products: " + products.length);
                for (int i = 0; i < products.length; i++) { 

                    ctr++;
                    CostProfile cp = null;
                    String duration = "";
                    try {
                        cp = prodmodule.getCostProfile(sessionKey, 
                                                                   orgDn, 
                                                                   products[i].activeCostProfile);
                        //stdout("     cost profile name: " + cp.name);
                        //stdout("     cost profile desc: " + cp.description);

                        

                        if (cp.description.toLowerCase().indexOf("quarter") != -1) {
                            //stdout("this is quarterly");
                            duration = "quarterly";
                        } else if (cp.description.toLowerCase().indexOf("year") != -1) {
                            //stdout("this is yearly");
                            duration = "yearly";
                        } else if (cp.description.toLowerCase().indexOf("month") != -1) {
                            //stdout("this is monthly");
                            duration = "monthly";
                        } else {
                            //stdout("no match ---------------");
                            duration = "error";
                        }

                        stdout("<!-- ");
                        stdout(products[i].description 
                               + " " 
                               + cp.name 
                               + " "
                               + products[i].id
                               + " "
                               + cp.id
                               );
                        stdout(" -->");
                    } catch (Exception e) {
                        stdout("ERROR No cost profile: " 
                               + products[i].id
                               + " name: " 
                               + products[i].name);
                        continue;
                    }


                    stdout("<!-- product description: " + products[i].description
                           + " -->");
                    stdout("<!-- cost profile name: " + cp.name + " -->");

                    // make package.xml entries

                    stdout("\n" +
                           " <cwPackage id=\"" + products[i].id + "\">\n" +
                           "    <name>" + products[i].name + "</name>\n" +
                           "    <shortname>" + products[i].name + "</shortname>\n" +
                           "    <description>" + cp.description + "</description>\n" +
                           "    <price>" + cp.description + "</price>\n" +
                           "    <period> \n" +
                           "      <duration>" + duration + "</duration>\n" +
                           "      <count></count>\n" +
                           "    </period>\n" +
                           "  </cwPackage>\n" +
                           "");




                }
            }


            stdout("<!-- " + ctr + " packages found. -->");
            


            

//             ProductData[] pdata = prodmodule.getAvailablePackages(sessionKey, orgDn);

//             stdout("number of things in the productdata array: " + pdata.length);
//             //stdout("<cwPackages>");

//             // list all available packages
//             for (int x = 0; x < pdata.length; x++) {
//                 //stdout("In the loop...");

//                 if (pdata[x].name.startsWith("V3")) {
//                     continue;
//                 } else {
//                     counter++;
//                 }
                
//                 Product pkg = prodmodule.getProduct(sessionKey, pdata[x].id);
                
//                 String duration = "";
                
//                 CostProfile cp = null;
//                 try {
//                     cp = prodmodule.getActiveCostProfile(sessionKey, orgDn, pdata[x].id);
//                 } catch (CostProfileNotFound ce) {
//                     stdout("Cost profile not found for: " + pdata[x].name);
//                 }
//                 /*
//                 // package details, cost profile details
//                 stdout("ProductData:");
//                 stdout("name: " + pdata[x].name
//                        + "\nid: " + pdata[x].id
//                        + "\nvalue: " + pdata[x].value
//                        + "\ndesc: " + pdata[x].description
//                        + "\n");

                
//                 stdout("CostProfile:");
//                 stdout("desc: " 
//                             + cp.description 
//                             + "\nid: "
//                             + cp.id 
//                             + "\nname: " 
//                             + cp.name 
//                             + "\nlength of components array: " 
//                             + cp.components.length);
//                 stdout("Product:");
//                 stdout("name: " + pkg.name
//                        + "\ndesc: " + pkg.description
//                        + "");
//                 */

//                 /*
//                 // try to get the cost of this package
//                 ProductCostInfo costinfo = new ProductCostInfo();
//                 ProductCostInfoHolder holder = new ProductCostInfoHolder(costinfo);
 
//                 prodmodule.getProductCost(sessionKey, holder);
//                 //stdout("cost: " + costinfo.amount);

//                 stdout("-------------------------------------------\n");
//                 */ 
//                 //if (cp.description.toLowerCase().indexOf("quarterly") != -1) {
//                 if (cp == null) {
//                     duration = "quarterly";
//                 } else if (cp.description.toLowerCase().indexOf("year") != -1) {
//                     //              stdout("this is yearly");
//                     duration = "yearly";
//                 } else if (cp.description.toLowerCase().indexOf("month") != -1) {
//                     //                stdout("this is monthly");
//                     duration = "monthly";
//                 } else {
//                     //                stdout("no match ---------------");
//                     duration = "error";
//                 }

//                 // make package.xml entries

//                 /*                stdout("\n" +
//                        " <cwPackage id=\"" + pdata[x].id + "\">\n" +
//                        "    <name>" + pdata[x].name + "</name>\n" +
//                        "    <shortname>" + pdata[x].name + "</shortname>\n" +
//                        "    <description>" + cp.description + "</description>\n" +
//                        "    <price>" + cp.description + "</price>\n" +
//                        "    <period> \n" +
//                        "      <duration>" + duration + "</duration>\n" +
//                        "      <count></count>\n" +
//                        "    </period>\n" +
//                        "  </cwPackage>\n" +
//                        "");
//                 */

//                 // this will generate a visp.in file used by guitester
//                 stdout( pdata[x].name + ", " + pdata[x].name + ", " + pdata[x].id + ", v3two" + counter);

//                 // stdout(pdata[x].id + "," + pdata[x].name);
//             } // end loop



        } catch (SystemUnavailable e) {
            stdout("Check the orgDn, it's probably wrong:");
            e.printStackTrace(java.lang.System.err);
        } catch (Exception e) {
            stdout("Doh! " + e);
            e.printStackTrace(java.lang.System.err);
        }
        
        //stdout("</cwPackages>");
        //stdout("<!-- Number of packages: " + counter + " -->");
    }

    // get around System conflict
    private static void stdout(String message) {
        java.lang.System.out.println(message);
    }
}
