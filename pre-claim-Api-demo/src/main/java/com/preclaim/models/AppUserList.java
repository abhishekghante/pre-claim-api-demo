package com.preclaim.models;

public class AppUserList {

	private int srno;
	private int appuserId;
	private String username;
	private String agentname;
	private String agentcode;
	private int channelId1;
	private String channelcode1;
	private String channelname1;
	private int regionId;
	private String region;
	private int level;
	private String password;
	private int status;
	private int channelId2;
	private String channelcode2;
	private String channelname2;
	private String email;
	private String leaderFlag;
	private int lang;
	private String latitude;
	private String longitude;
	private int zipcode;
	private String userType;
	
	public AppUserList() {
		srno = 0;
		username = "";
		agentname = "";
		agentcode = "";
		channelId1 = 0;
		channelcode1 = "";
		channelname1 = "";
		regionId = 0;
		region = "";
		level = 0;
		password = "";
		status = 0;
		channelId2 = 0;
		channelname2 = "";
		channelcode2 = "";
		email = "";
		leaderFlag = "";
		lang = 0;
		latitude = "";
		longitude = "";
		zipcode = 0;
		userType = "";
	}

	public int getSrno() {
		return srno;
	}

	public void setSrno(int srno) {
		this.srno = srno;
	}

	public int getAppuserId() {
		return appuserId;
	}

	public void setAppuserId(int appuserId) {
		this.appuserId = appuserId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAgentname() {
		return agentname;
	}

	public void setAgentname(String agentname) {
		this.agentname = agentname;
	}

	public String getAgentcode() {
		return agentcode;
	}

	public void setAgentcode(String agentcode) {
		this.agentcode = agentcode;
	}

	public int getChannelId1() {
		return channelId1;
	}

	public void setChannelId1(int channelId1) {
		this.channelId1 = channelId1;
	}

	public String getChannelcode1() {
		return channelcode1;
	}

	public void setChannelcode1(String channelcode1) {
		this.channelcode1 = channelcode1;
	}

	public String getChannelname1() {
		return channelname1;
	}

	public void setChannelname1(String channelname1) {
		this.channelname1 = channelname1;
	}

	public int getRegionId() {
		return regionId;
	}

	public void setRegionId(int regionId) {
		this.regionId = regionId;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getChannelId2() {
		return channelId2;
	}

	public void setChannelId2(int channelId2) {
		this.channelId2 = channelId2;
	}

	public String getChannelcode2() {
		return channelcode2;
	}

	public void setChannelcode2(String channelcode2) {
		this.channelcode2 = channelcode2;
	}

	public String getChannelname2() {
		return channelname2;
	}

	public void setChannelname2(String channelname2) {
		this.channelname2 = channelname2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLeaderFlag() {
		return leaderFlag;
	}

	public void setLeaderFlag(String leaderFlag) {
		this.leaderFlag = leaderFlag;
	}

	public int getLang() {
		return lang;
	}

	public void setLang(int lang) {
		this.lang = lang;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	@Override
	public String toString() {
		return "AppUserList [srno=" + srno + ", appuserId=" + appuserId + ", username=" + username + ", agentname="
				+ agentname + ", agentcode=" + agentcode + ", channelId1=" + channelId1 + ", channelcode1="
				+ channelcode1 + ", channelname1=" + channelname1 + ", regionId=" + regionId + ", region=" + region
				+ ", level=" + level + ", password=" + password + ", status=" + status + ", channelId2=" + channelId2
				+ ", channelcode2=" + channelcode2 + ", channelname2=" + channelname2 + ", email=" + email
				+ ", leaderFlag=" + leaderFlag + ", lang=" + lang + ", latitude=" + latitude + ", longitude="
				+ longitude + ", zipcode=" + zipcode + ", userType=" + userType + "]";
	}
	
}
