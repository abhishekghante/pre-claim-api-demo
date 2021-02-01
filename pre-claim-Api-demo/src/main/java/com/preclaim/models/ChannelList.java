package com.preclaim.models;

public class ChannelList {

	private int srNo;
	private String channelName;
	private String channelCode;
	private String createdDate;
	private int status;
	private int channelId;

	public ChannelList() {
		this.srNo = 0;
		this.channelName = "";
		this.channelCode = "";
		this.createdDate = "";
		this.status = 0;
		this.channelId = 0;
	}

	public int getChannelId() {
		return channelId;
	}

	public void setChannelId(int channelId) {
		this.channelId = channelId;
	}

	public int getSrNo() {
		return srNo;
	}

	public void setSrNo(int srNo) {
		this.srNo = srNo;
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

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ChannelList [srNo=" + srNo + ", channelName=" + channelName + ", channelCode=" + channelCode
				+ ", createdDate=" + createdDate + ", status=" + status + ", channelId=" + channelId + "]";
	}

}
