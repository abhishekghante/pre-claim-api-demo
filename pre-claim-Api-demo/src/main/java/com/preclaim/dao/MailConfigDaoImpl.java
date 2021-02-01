package com.preclaim.dao;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.preclaim.models.MailConfig;
import com.preclaim.models.MailConfigList;

public class MailConfigDaoImpl implements MailConfigDao {

	@Autowired
	DataSource datasource;
	
	private JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public String add(MailConfigList mailConfig) {
		try
		{
			String sql = "INSERT INTO mail_config(username, password, outgoingServer, outgoingPort, "
					+ "encryptionType, status, createdBy, created_on, updatedBy, updated_on)"
					+ "VALUES(?, ?, ?, ? ,? , 0, ?, now(), '', '0000-00-00 00:00:00')";
			template.update(sql, mailConfig.getUsername(), mailConfig.getPassword(), mailConfig.getOutgoingServer(), 
					mailConfig.getOutgoingPort(), mailConfig.getEncryptionType(), mailConfig.getCreatedBy());
			return "****";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return e.getMessage();
		}
	}

	@Override
	public List<MailConfigList> getMailConfigList(int status) {
		try
		{
			String sql = "";
			if(status == 0)
				sql = "SELECT * FROM mail_config where status = 0";	
			else
				sql = "SELECT * FROM mail_config where status = 1 or status = 2";
			return template.query(sql, (ResultSet rs, int rowNum) -> {
				
				MailConfigList mailConfig = new MailConfigList();
				mailConfig.setMailConfigId(rs.getInt("mailConfigId"));
				mailConfig.setUsername(rs.getString("username"));
				mailConfig.setPassword(rs.getString("password"));
				mailConfig.setOutgoingServer(rs.getString("outgoingServer"));
				mailConfig.setOutgoingPort(rs.getInt("outgoingPort"));
				mailConfig.setEncryptionType(rs.getString("encryptionType"));
				mailConfig.setStatus(rs.getInt("status"));
				return mailConfig;
			} );
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public String delete(int mailConfigId) {
		try
		{
			String sql = "DELETE FROM mail_config where mailConfigId = ?";
			template.update(sql,mailConfigId);
			return "****";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "Error deleting configuration. Kindly contact system administrator";
		}
	}

	@Override
	public String update(MailConfigList mailConfig) {
		try
		{
			String sql = "UPDATE mail_config SET username = ?, password = ?, outgoingServer = ?, "
					+ "outgoingPort = ?, encryptionType = ?, updatedBy = ?, updated_on = now() where "
					+ "mailConfigId = ?";
			template.update(sql, mailConfig.getUsername(), mailConfig.getPassword(), 
					mailConfig.getOutgoingServer(), mailConfig.getOutgoingPort(), mailConfig.getEncryptionType(),
					mailConfig.getUpdatedBy(), mailConfig.getMailConfigId());
			return "****";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "Error updating configuration. Kindly contact system administrator";
		}
	}

	@Override
	public String updateStatus(int mailConfigId, int status, String username) {
		try
		{
			if(status == 1)
			{
				String sql = "SELECT count(*) FROM mail_config where status = 1";
				int activeCount = template.queryForObject(sql, Integer.class);
				if(activeCount > 0)
					return "Only one mail configuration can be active at a time";
			}
			String sql = "UPDATE mail_config SET status = ?, updatedBy = ?, updated_on = now() where"
					+ " mailConfigId = ?";
			template.update(sql,status, username, mailConfigId);
			return "****";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "Error updating configuration status. Kindly contact system administrator";
		}
	}

	@Override
	public MailConfigList getActiveConfigList() {
		try
		{
			String sql = "SELECT * FROM mail_config where status = 1";
			return template.query(sql, (ResultSet rs, int rowNum) -> {
				
				MailConfigList mailConfig = new MailConfigList();
				mailConfig.setMailConfigId(rs.getInt("mailConfigId"));
				mailConfig.setUsername(rs.getString("username"));
				mailConfig.setPassword(rs.getString("password"));
				mailConfig.setOutgoingServer(rs.getString("outgoingServer"));
				mailConfig.setOutgoingPort(rs.getInt("outgoingPort"));
				mailConfig.setEncryptionType(rs.getString("encryptionType"));
				mailConfig.setStatus(rs.getInt("status"));
				return mailConfig;
			} ).get(0);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public MailConfig getActiveConfig() {
		try
		{
			String sql = "SELECT * FROM mail_config where status = 1";
			return template.query(sql, (ResultSet rs, int rowNum) -> {
				
				MailConfig mailConfig = new MailConfig();
				mailConfig.setUsername(rs.getString("username"));
				mailConfig.setPassword(rs.getString("password"));
				mailConfig.setHost(rs.getString("outgoingServer"));
				mailConfig.setPort(rs.getInt("outgoingPort"));
				mailConfig.setEncryptionType(rs.getString("encryptionType"));
				return mailConfig;
			} ).get(0);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public MailConfigList getMailConfigListById(int mailConfigId) {
		try
		{
			String sql = "SELECT * FROM mail_config where mailConfigId = " + mailConfigId;
			return template.query(sql, (ResultSet rs, int rowNum) -> {
				
				MailConfigList mailConfig = new MailConfigList();
				mailConfig.setMailConfigId(rs.getInt("mailConfigId"));
				mailConfig.setUsername(rs.getString("username"));
				mailConfig.setPassword(rs.getString("password"));
				mailConfig.setOutgoingServer(rs.getString("outgoingServer"));
				mailConfig.setOutgoingPort(rs.getInt("outgoingPort"));
				mailConfig.setEncryptionType(rs.getString("encryptionType"));
				mailConfig.setStatus(rs.getInt("status"));
				return mailConfig;
			} ).get(0);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
}
