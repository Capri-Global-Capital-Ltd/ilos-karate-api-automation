package utils;

import javax.mail.*;
import javax.mail.internet.*;
import java.io.File;
import java.io.IOException;
import java.util.Properties;

public class EmailUtil {

    public static void sendEmail(String a, String b, String c, Float percentage, String environment, String subject, String reportLink, String attachmentPath) {
        
        // Recipient's email ID needs to be mentioned
        String toList = ResourceLoader.getValue("mailing.list");

        if (toList == null || toList.trim().isEmpty()) {
            System.err.println("Error: 'mailing.list' is not set or is empty.");
            return;
        }

        // Sender's email ID needs to be mentioned
        final String fromEmail = "karateapireport@outlook.com"; // Replace with your Outlook email
        final String password = "ovpkmjtqsdsxzmkf"; // Replace with your App Password or Outlook password

        String HOST = "smtp.office365.com";
        int PORT = 587;

        // Get system properties
        Properties properties = System.getProperties();
        properties.put("mail.smtp.host", HOST);
        properties.put("mail.smtp.port", PORT);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true"); //TLS

        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(fromEmail));

            // Set To: header field of the header.
            message.addRecipients(Message.RecipientType.TO, InternetAddress.parse(toList));

            // Create a multipart message
            MimeMultipart multipart = new MimeMultipart();

            // Create the email body part
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            StringBuilder sb = new StringBuilder();
            sb.append("<html><body><table border=\"1\">")
              .append("<tr><td><strong> No. of TCs Passed </strong></td><td>").append(a).append("</td></tr>")
              .append("<tr><td><strong> No. of TCs Failed </strong></td><td>").append(b).append("</td></tr>")
              .append("<tr><td><strong> Time Taken (secs) </strong></td><td>").append(c).append("</td></tr>")
              .append("<tr><td><strong> Report Link </strong></td><td>").append(reportLink).append("</td></tr>")
              .append("</table></body></html>");
            messageBodyPart.setContent(sb.toString(), "text/html");
            multipart.addBodyPart(messageBodyPart);

            // Create the attachment part
            MimeBodyPart attachmentBodyPart = new MimeBodyPart();
            attachmentBodyPart.attachFile(new File(attachmentPath));
            multipart.addBodyPart(attachmentBodyPart);

            // Set the complete message parts
            message.setContent(multipart);

            // Set Subject: header field
            message.setSubject(ResourceLoader.getValue("project.name") + " : " + environment + " : " + subject + " : " + "TCs - " + (Integer.valueOf(a) + Integer.valueOf(b)) + " : PASS % " + percentage);

            System.out.println("Sending email...");

            // Send message
            Transport.send(message);

            System.out.println("Sent message successfully....");

        } catch (MessagingException | IOException mex) {
            System.err.println("Failed to send email due to an error: " + mex.getMessage());
            mex.printStackTrace();
        }
    }
}
