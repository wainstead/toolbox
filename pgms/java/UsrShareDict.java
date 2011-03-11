// testbed for reading files

import java.io.*;
import java.util.regex.*;

public class UsrShareDict {

    public static void main(String argv[]) {

        FileReader dict;
        String pattern = "^[a-z]{5,6}$";

        try {

            Pattern p = Pattern.compile(pattern);


            FileInputStream fstream = new FileInputStream("/usr/share/dict/words");
            DataInputStream in      = new DataInputStream(fstream);
            BufferedReader br       = new BufferedReader(new InputStreamReader(in));

            String strLine;

            while ((strLine = br.readLine()) != null) {
                // Print the content on the console
                if ( p.matcher(strLine).lookingAt() ) { 
                    System.out.println (strLine);
                }
            }

            in.close();

        } catch (Exception e) {
            System.out.println("oops, boo hoo.");
            e.printStackTrace();
        }


    }
}
