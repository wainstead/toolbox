import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

/** 
 * Simple example on how to send an email from Java. Found the code
 * via Google at http://www.javacommerce.com/articles/sendingmail.htm.
 *
 *  @author  $Author: swain $
 *  @version $Id: SendMail.java,v 1.2 2004/08/18 18:30:53 swain Exp $
 */

public class SendMail {

    public static void main(String[] argv) {
        java.lang.System.out.println("Hello, mailman!");
        String[] recipients = new String[1];
        recipients[0] = "swain@ampira.com";
        try {
            postMail(recipients, "hello sailor!", "got a date?", "swain@evw-1.dvl.ampira.com");
        } catch (MessagingException me) {
            java.lang.System.out.println("ERROR: got a MessagingException.");
            me.printStackTrace();
        } catch (Exception e) {
            java.lang.System.out.println("Doh! Unknown exception!");
            e.printStackTrace();
        }
    }


    /** 
     * Send the email. This method is taken verbatim from the website.
     */

    public static void postMail( String recipients[ ], String subject, String message , String from)
        throws MessagingException {

        boolean debug = false;

        //Set the host smtp address
        Properties props = new Properties();
        props.put("mail.smtp.host", "localhost");

        // create some properties and get the default Session
        Session session = Session.getDefaultInstance(props, null);
        session.setDebug(debug);

        // create a message
        Message msg = new MimeMessage(session);

        // set the from and to address
        InternetAddress addressFrom = new InternetAddress(from);
        msg.setFrom(addressFrom);

        InternetAddress[] addressTo = new InternetAddress[recipients.length]; 
        for (int i = 0; i < recipients.length; i++)
            {
                addressTo[i] = new InternetAddress(recipients[i]);
            }
        msg.setRecipients(Message.RecipientType.TO, addressTo);
   

        // Optional : You can also set your custom headers in the Email if you Want
        msg.addHeader("MyHeaderName", "myHeaderValue");

        // Setting the Subject and Content Type
        msg.setSubject(subject);
        msg.setContent(message, "text/plain");
        Transport.send(msg);
    }

}

/** 
 * $Log: SendMail.java,v $
 * Revision 1.2  2004/08/18 18:30:53  swain
 * Added some documentation.
 *
 */
