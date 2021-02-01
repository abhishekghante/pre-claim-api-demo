package com.preclaim.models;

public class MessageList {

	private int srNo;
	private long msgID;
	private String msgTitleEng;
	private String msgTitleHin;
	private int regionId;
	private String regionName;
	private int groupId;
	private String groupName;
	private int categoryId;
	private String categoryName;
	private int channelId;
	private String channelName;
	private String createdDate;
	private String expiryDate;
	private int status;
	
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	public long getMsgID() {
		return msgID;
	}
	public void setMsgID(long msgID) {
		this.msgID = msgID;
	}
	public String getMsgTitleEng() {
		return msgTitleEng;
	}
	public void setMsgTitleEng(String msgTitleEng) {
		this.msgTitleEng = msgTitleEng;
	}
	public String getMsgTitleHin() {
		return msgTitleHin;
	}
	public void setMsgTitleHin(String msgTitleHin) {
		this.msgTitleHin = msgTitleHin;
	}
	public int getRegionId() {
		return regionId;
	}
	public void setRegionId(int regionId) {
		this.regionId = regionId;
	}
	public String getRegionName() {
		return regionName;
	}
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getChannelId() {
		return channelId;
	}
	public void setChannelId(int channelId) {
		this.channelId = channelId;
	}
	public String getChannelName() {
		return channelName;
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "MessageList [msgID=" + msgID + ", msgTitleEng=" + msgTitleEng + ", msgTitleHin=" + msgTitleHin
				+ ", regionId=" + regionId + ", regionName=" + regionName + ", groupId=" + groupId + ", groupName="
				+ groupName + ", categoryId=" + categoryId + ", categoryName=" + categoryName + ", channelId="
				+ channelId + ", channelName=" + channelName + ", createdDate=" + createdDate + ", expiryDate="
				+ expiryDate + ", status=" + status + "]";
	}
	
	public MessageList() {
		this.msgID = 0;
		this.msgTitleEng = "";
		this.msgTitleHin = "";
		this.regionId = 0;
		this.regionName = "";
		this.groupId = 0;
		this.groupName = "";
		this.categoryId = 0;
		this.categoryName = "";
		this.channelId = 0;
		this.channelName = "";
		this.createdDate = "";
		this.expiryDate = "";
		this.status = 0;
	}
	
	
	
}
