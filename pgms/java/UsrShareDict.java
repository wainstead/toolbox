/**
 * The goal here is to build a data structure containing only five or
 * six letter words that are unique in their character content,
 * e.g. the Jumble puzzle in the daily paper.

 * Simple approach: for each word, sort the letters
 * alphabetically. For example, the word "example" becomes "aeelmpx."
 * Then do hash["aeelmpx"]++;. When we are done, we can loop through
 * the hash and find all words with a value of 1, which means that
 * word has no duplicates. We can build a second hash of these unique
 * words, where sortedword = actualword.

 * Is this the most efficient approach? Probably not... depending on
 * what one wants to optimize on.
 */

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

                    char[] content = strLine.toCharArray();
                    java.util.Arrays.sort(content);
                    String sorted = new String(content);

                    System.out.println(sorted + " " + strLine);
                }
            }

            in.close();

        } catch (Exception e) {
            System.out.println("oops, boo hoo.");
            e.printStackTrace();
        }


    }
}
