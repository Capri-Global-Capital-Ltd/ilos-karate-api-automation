package utils;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil2 {

    public static void main(String[] args) {
        // Sender's email ID and password
        final String fromEmail = "karateapireport@outlook.com"; // Replace with your Outlook email
        final String password = "ovpkmjtqsdsxzmkf";       // Replace with your App Password or Outlook password

        // Recipient's email ID
        String toEmail = "karateapireport@gmail.com"; // Replace with the recipient's email

        // SMTP server information
        String host = "smtp.office365.com";
        int port = 587;

        // Setup mail server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Get the Session object and authenticate
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            // Create a default MimeMessage object
            Message message = new MimeMessage(session);

            // Set From: header field
            message.setFrom(new InternetAddress(fromEmail));

            // Set To: header field
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

            // Set Subject: header field
            message.setSubject("Test Email from Java Program using Outlook");

            // Set the actual message
            message.setText("Hello, this is a test email sent from a Java program using Outlook SMTP!");

            // Send the message
            Transport.send(message);

            System.out.println("Email sent successfully!");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
