package com.preclaim.models;

public class IntimationTypeList {

	private int srNo;
	private String intimationType;
	private String createdDate;
	private int status;
	private int intimationId;

	public IntimationTypeList() {

		this.srNo = 0;
		this.intimationType = "";
		this.createdDate = "";
		this.status = 0;
		this.intimationId = 0;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public int getSrNo() {
		return srNo;
	}

	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}

	public String getIntimationType() {
		return intimationType;
	}

	public void setIntimationType(String intimationType) {
		this.intimationType = intimationType;
	}

	public int getIntimationId() {
		return intimationId;
	}

	public void setIntimationId(int intimationId) {
		this.intimationId = intimationId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "IntimationTypeList [srNo=" + srNo + ", intimationType=" + intimationType + ", createdDate="
				+ createdDate + ", status=" + status + ", intimationId=" + intimationId + "]";
	}

}
