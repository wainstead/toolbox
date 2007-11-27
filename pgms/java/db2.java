// $Id: db2.java,v 1.3 2004/10/14 18:59:27 swain Exp $
import java.sql.*;

class db2 {
    public static void main(String[] argv) {
        Statement stmt;
        ResultSet result;

        System.out.println("hello, sailor!");

        try {
            Class.forName ("COM.ibm.db2.jdbc.app.DB2Driver").newInstance ();
            Connection conn = DriverManager.getConnection("jdbc:db2:evw", "evwbill", "112233");
            stmt = conn.createStatement();
            result = stmt.executeQuery("select installedid from installed");
            while (result.next()) {
                System.out.println(result.getString("installedid"));
            }


            conn.close();
        } catch (Exception e) {
            System.out.println ("oops: " + e.getMessage() + "\n");
            System.out.println (e);
            e.printStackTrace();
            System.exit(1);
        }
        
    }
}
