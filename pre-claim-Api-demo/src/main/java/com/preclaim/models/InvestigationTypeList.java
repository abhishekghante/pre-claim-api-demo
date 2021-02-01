package com.preclaim.models;

public class InvestigationTypeList {

	private int srNo;
	private int investigationId;
	private String investigationType;
	private int createdBy;
	private int updatedBy;
	private int status;
    
    public InvestigationTypeList() {
	
    	srNo = 0;
    	investigationId = 0;
    	investigationType = "";
    	createdBy = 0;
    	updatedBy = 0;
    	status = 0;
      }

	public int getSrNo() {
		return srNo;
	}

	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}

	public int getInvestigationId() {
		return investigationId;
	}

	public void setInvestigationId(int investigationId) {
		this.investigationId = investigationId;
	}

	public String getInvestigationType() {
		return investigationType;
	}

	public void setInvestigationType(String investigationType) {
		this.investigationType = investigationType;
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
		return "InvestigationTypeList [srNo=" + srNo + ", investigationId=" + investigationId + ", investigationType="
				+ investigationType + ", createdBy=" + createdBy + ", updatedBy=" + updatedBy + ", status=" + status
				+ "]";
	}
    

}

