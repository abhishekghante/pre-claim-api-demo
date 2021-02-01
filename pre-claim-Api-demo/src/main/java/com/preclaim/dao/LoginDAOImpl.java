package com.preclaim.dao;

import java.sql.ResultSet;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.preclaim.config.Config;
import com.preclaim.models.Login;
import com.preclaim.models.MailConfig;
import com.preclaim.models.UserDetails;

public class LoginDAOImpl implements LoginDAO {
	
	@Autowired  
	DataSource datasource;
	  
	private JdbcTemplate template;
	  
	public void setTemplate(JdbcTemplate template) 
	{  
      this.template = template;    
	}
	
	public UserDetails validateUser(Login login)	  
	{	
		String sql = "SELECT * FROM admin_user WHERE username = ? and password = ?";
		List<UserDetails> user_list = template.query(sql, 
				new Object[] {login.getUsername(),login.getPassword()},
				(ResultSet rs, int arg1) ->{
					UserDetails login_user = new UserDetails();
					login_user.setUserID(rs.getInt("user_id"));
					login_user.setUsername(rs.getString("username"));
					login_user.decodePassword(rs.getString("password"));
					login_user.setFull_name(rs.getString("full_name"));
					login_user.setStatus(rs.getInt("status"));
					login_user.setUser_email(rs.getString("user_email"));
					login_user.setAccount_type(rs.getString("role_name"));
					login_user.setUserimage(rs.getString("user_image"));
					login_user.setZone(rs.getString("zone"));
					login_user.setState(rs.getString("state"));
					login_user.setCity(rs.getString("city"));
					login_user.setUserImageb64(Config.upload_directory + rs.getString("user_image"));
					return login_user;
				});
		return user_list.size() > 0 ? user_list.get(0) : null ;
	  }

	@Override
	public UserDetails checkUser(String username) {
		try
		{
			String sql = "SELECT * FROM admin_user WHERE username = ?";
			List<UserDetails> user_list = template.query(sql, 
					new Object[] {username},
					(ResultSet rs, int arg1) ->{
						UserDetails login_user = new UserDetails();
						login_user.setUserID(rs.getInt("user_id"));
						login_user.setUsername(rs.getString("username"));
						login_user.decodePassword(rs.getString("password"));
						login_user.setFull_name(rs.getString("full_name"));
						login_user.setStatus(rs.getInt("status"));
						login_user.setUser_email(rs.getString("user_email"));
						login_user.setUserimage(rs.getString("user_image"));
						login_user.setUserImageb64(Config.upload_directory + rs.getString("user_image"));
						return login_user;
					});
			return user_list.size() > 0 ? user_list.get(0) : null ;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
	}

	@Override
	public String updatePassword(String username, String password) {
		try
		{
			String sql = "UPDATE admin_user SET password = ? WHERE username = ?";
			template.update(sql, password, username);
		}
		catch(Exception ex)
		{
			return "Error updating Password. Kindly contact system administrator";
		}
		return "****";
	}
	
	@Override
	public String sendSMTPMail(MailConfig mail)
	{
		Properties properties = System.getProperties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.host", mail.getHost());
        properties.put("mail.smtp.port", mail.getPort());
        if(mail.getEncryptionType().equals("SSL"))
        {
        	properties.put("mail.smtp.socketFactory.port", mail.getPort());
        	properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        }
        else if(mail.getEncryptionType().equals("TLS"))
        	properties.put("mail.smtp.starttls.enable", "true");
        
     // Get the default Session object.
        Session session = Session.getInstance(properties, new Authenticator() {
        	@Override
        	protected PasswordAuthentication getPasswordAuthentication() {
        		return new PasswordAuthentication(mail.getUsername(), mail.getPassword());
        	}
        });

        try {
           MimeMessage message = new MimeMessage(session);
           message.setFrom(new InternetAddress(mail.getUsername()));
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(mail.getReceipent()));
           message.setSubject(mail.getSubject());

           BodyPart messageBodyPart = new MimeBodyPart();
           messageBodyPart.setText(mail.getMessageBody());
           
           Multipart multipart = new MimeMultipart();
           multipart.addBodyPart(messageBodyPart);
           // Send the complete message parts
           message.setContent(multipart);

           // Send message
           Transport.send(message);
           return "****";
        } 
        catch (MessagingException mex) {
        	mex.printStackTrace();
           return mex.getMessage();
        }       
	}

	@Override
	public String sendIMAPMail(MailConfig mail)
	{
		Properties properties = System.getProperties();
        properties.put("mail.store.protocol", "imaps");
        properties.put("mail.imap.starttls.enable", "true");
        properties.put("mail.imap.host", mail.getHost());
        properties.put("mail.imap.port", mail.getPort());
        
        // Get the default Session object.
        Session session = Session.getInstance(properties, new Authenticator() {
        	@Override
        	protected PasswordAuthentication getPasswordAuthentication() {
        		return new PasswordAuthentication(mail.getUsername(), mail.getPassword());
        	}
        });

        try {
           MimeMessage message = new MimeMessage(session);
           message.setFrom(new InternetAddress(mail.getUsername()));
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(mail.getReceipent()));
           message.setSubject(mail.getSubject());

           BodyPart messageBodyPart = new MimeBodyPart();
           messageBodyPart.setText(mail.getMessageBody());
           
           Multipart multipart = new MimeMultipart();
           multipart.addBodyPart(messageBodyPart);
           // Send the complete message parts
           message.setContent(multipart);

           // Send message
           Transport.send(message);
           return "****";
        } 
        catch (MessagingException mex) {
        	mex.printStackTrace();
           return mex.getMessage();
        }       
	}
}

