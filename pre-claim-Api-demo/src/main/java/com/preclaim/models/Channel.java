package com.preclaim.models;

public class Channel {

	private String channelName;
	private String channelCode;
	private int level;
	private int createdBy;
	private int updatedBy;
	private int status;
		
	public Channel() 
	{
		this.channelName = "";
		this.channelCode = "";
		this.level = 3;
		this.createdBy = 0;
		this.updatedBy = 0;
		this.status=0;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public String getChannelCode() {
		return channelCode;
	}

	public void setChannelCode(String channelCode) {
		this.channelCode = channelCode;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public int getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(int updatedBy) {
		this.updatedBy = updatedBy;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Channel [channelName=" + channelName + ", channelCode=" + channelCode + ", level=" + level
				+ ", createdBy=" + createdBy + ", updatedBy=" + updatedBy + ", status=" + status + "]";
	}
	
	
}
