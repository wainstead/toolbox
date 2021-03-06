// $Id: UrlTest.java,v 1.1 2008/02/20 19:47:51 swain Exp $
// testbed for the URL class

import java.net.*;
import java.io.*;
import java.lang.*;
import java.util.*;

public class UrlTest {

    public static void main(String argv[]) {
        /*
        try {
            System.out.println("hello sailor!");
            URL earl = new URL("http://swain.myphotodevel.com/albums.php");
            java.lang.System.out.println(earl.toString());

            URLConnection hup = earl.openConnection();
            System.out.println("content length: " + hup.getContentLength());
            System.out.println("content type: " + hup.getContentType());
            //HashMap mappy = hup.getHeaderFields();

        } catch (Exception e) {
            System.out.println("oops, boo hoo.");
            e.printStackTrace();
        }
        */
        try {
            URL google = new URL("http://www.google.com/");
            URLConnection yc = google.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
            String inputLine;

            while ((inputLine = in.readLine()) != null) 
                System.out.println(inputLine);
            in.close();
        } catch (Exception e) {
            System.out.println("oops, boo hoo.");
            e.printStackTrace();
        }

    }
}
