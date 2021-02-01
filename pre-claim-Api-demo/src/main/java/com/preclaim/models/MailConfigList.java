package com.preclaim.models;

public class MailConfigList {

	private int mailConfigId;
	private String username;
	private String password;
	private String outgoingServer;
	private int outgoingPort;
	private String encryptionType;
	private int status;
	private String createdBy;
	private String updatedBy;
	
	public MailConfigList()
	{
		mailConfigId = 0;
		username = "";
		password = "";
		outgoingServer = "";
		outgoingPort = 0;
		encryptionType = "";
		status = 0;
		createdBy = "";
		updatedBy = "";
	}

	public int getMailConfigId() {
		return mailConfigId;
	}

	public void setMailConfigId(int mailConfigId) {
		this.mailConfigId = mailConfigId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getOutgoingServer() {
		return outgoingServer;
	}

	public void setOutgoingServer(String outgoingServer) {
		this.outgoingServer = outgoingServer;
	}

	public int getOutgoingPort() {
		return outgoingPort;
	}

	public void setOutgoingPort(int outgoingPort) {
		this.outgoingPort = outgoingPort;
	}

	public String getEncryptionType() {
		return encryptionType;
	}

	public void setEncryptionType(String encryptionType) {
		this.encryptionType = encryptionType;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	@Override
	public String toString() {
		return "MailConfigList [mailConfigId=" + mailConfigId + ", username=" + username + ", password=" + password
				+ ", outgoingServer=" + outgoingServer + ", outgoingPort=" + outgoingPort + ", encryptionType="
				+ encryptionType + ", status=" + status + "]";
	}

			
}
