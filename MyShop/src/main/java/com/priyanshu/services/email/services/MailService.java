package com.priyanshu.services.email.services;

import java.io.File;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	
	@Autowired
	public HttpSession httpSession;

	public static Session getSession(final String from) {

		final String pwd = "lhiifbbgdfobsbwu";
		String host = "smtp.gmail.com";

		Properties properties = System.getProperties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(from, pwd);
			}

		});

		return session;
	}

	public void sendMailAttachment(final String from, String to, String message, String subject) {

		Session session = getSession(from); // get session Object

		MimeMessage mimeMessage = new MimeMessage(session);

		try {
			// from
			mimeMessage.setFrom(from);
			// to
			mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// subject
			mimeMessage.setSubject(subject);
			
			// Attachment file code
			MimeMultipart mimeMultipart = new MimeMultipart();
			MimeBodyPart text = new MimeBodyPart();
			text.setText("I send The resume");

			MimeBodyPart f = new MimeBodyPart();
			File file = new File("C:\\Users\\Priyanshu\\Desktop\\JavaDev_PriyanshuSinha.pdf");
			f.attachFile(file);

			mimeMultipart.addBodyPart(text);
			mimeMultipart.addBodyPart(f);

			mimeMessage.setContent(mimeMultipart);

			Transport.send(mimeMessage);

			System.out.println("Mail successful send");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void sendTextMail(final String from, String to, String message, String subject) {

		Session session = getSession(from); // get session Object

		MimeMessage mimeMessage = new MimeMessage(session);

		try {
			mimeMessage.setFrom(from);
			// to
			mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// subject
			mimeMessage.setSubject(subject);
			// message
			mimeMessage.setText(message);

			// sent
			Transport.send(mimeMessage);

			System.out.println("Mail successful send");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public boolean mail_OTP(String to) {

		Session session = getSession("priyanshu.sinha146@gmail.com"); // get session Object

		Random random = new Random();
		int otp = random.nextInt(9999999);

		MimeMessage mimeMessage = new MimeMessage(session);

		try {
			mimeMessage.setFrom("priyanshu.sinha146@gmail.com");
			// to
			mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// subject
			mimeMessage.setSubject("OTP Verification");
			// message
			String message = "OTP " + otp;
			mimeMessage.setText(message);

			// sent
			Transport.send(mimeMessage);
			
			httpSession.setAttribute("OTP", String.valueOf(otp));

			System.out.println("SuccessFul OTP send");

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
}
