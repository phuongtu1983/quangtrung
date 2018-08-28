package com.stepup.gasoline.qt.util;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Administrator
 */
public class MailHandle implements Runnable {
    
    public static final String EMAIL_DEFAULT = "buoctiensoft@gmail.com";
    private final String USERNAME = "buoctiensoft";
    private final String PASSWORD = "phuongtu1983";
    private final String HOST = "smtp.gmail.com";
    
    private String mailTo;
    private String subject;
    private String content;

    /**
     * Creates a new instance of MailHandle
     *
     * @param mailTo
     * @param subject
     * @param content
     */
    public MailHandle(String mailTo, String subject, String content) {
        this.mailTo = mailTo;
        this.subject = subject;
        this.content = content;
    }
    
    @Override
    public void run() {
        try {
            this.sendMail();
        } catch (Exception ex) {
            
        }
    }
    
    private void sendMail() {
        Properties props = System.getProperties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", HOST);
        props.put("mail.smtp.user", USERNAME);
        props.put("mail.smtp.password", PASSWORD);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        
        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);
        
        try {
            message.setFrom(new InternetAddress(EMAIL_DEFAULT));
            String[] to = {mailTo};
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for (int i = 0; i < to.length; i++) {
                toAddress[i] = new InternetAddress(to[i]);
            }
            
            for (int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }
            
            message.setSubject(subject);
            message.setContent(content, "text/html; charset=utf-8");
            Transport transport = session.getTransport("smtp");
            transport.connect(HOST, USERNAME, PASSWORD);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        } catch (AddressException ae) {
            ae.printStackTrace();
        } catch (MessagingException me) {
            me.printStackTrace();
        }
    }
}
