package com.preclaim.models;

public class Location {

	private int locationId;
	private String city;
	private String state;
	private String zone;
	private String createdBy;
	private String updatedBy;
	private int status;
	
	public Location() {
		locationId = 0;
		city = "";
		state = "";
		zone = "";
		createdBy = "";
		updatedBy = "";
		status = 0;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Location [locationId=" + locationId + ", city=" + city + ", state=" + state + ", zone=" + zone
				+ ", createdBy=" + createdBy + ", updatedBy=" + updatedBy + ", status=" + status + "]";
	}

			
}
