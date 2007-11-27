// $Id: UrlTest.java,v 1.2 2005/01/31 23:49:02 swain Exp $
// testbed for the URL class

import java.net.*;
import java.lang.*;
import java.util.*;

public class UrlTest {

    public static void main(String argv[]) {
        try {
        System.out.println("hello sailor!");
        URL earl = new URL("http://www.w3.org/2001/XMLSchema");
        java.lang.System.out.println(earl.toString());

        URLConnection hup = earl.openConnection();
        System.out.println("content length: " + hup.getContentLength());
        System.out.println("content type: " + hup.getContentType());
        //HashMap mappy = hup.getHeaderFields();

        } catch (Exception e) {
            System.out.println("oops, boo hoo.");
            e.printStackTrace();
        }
    }
}
