package com.preclaim.models;

public class CaseDetailList {

	private int srNo;
	private long caseId;
	private String policyNumber;
	private String investigationCategory;
	private String insuredName;
	private String insuredDOD;
	private String insuredDOB;
	private double sumAssured;
	private String intimationType;
	private String claimantCity;
	private String claimantZone;
	private String claimantState;
	private String caseStatus;
	private String caseSubstatus;
	private String nominee_name;
	private String nomineeContactNumber;
	private String nominee_address;
	private String insured_address;
	private String supervisor;
	private String supervisor2managerRemarks;
	private String supervisor2investigatorRemarks;
	private String regionalManager2supervisorRemarks;
	private String investigator;
	private String investigator2supervisorRemarks;
	private String underwriter;
	private String underwriter2regionalManagerRemarks;
	private String talicManager;
	private String talicManager2underwriteRemarks;
	private String createdBy;
	private String createdDate;
	private String updatedDate;
	private String updatedBy;

	public CaseDetailList() {

		srNo = 0;
		caseId = 0;
		policyNumber = "";
		investigationCategory = "";
		insuredName = "";
		insuredDOD = "";
		insuredDOB = "";
		sumAssured = 0;
		intimationType = "";
		claimantCity = "";
		claimantState = "";
		claimantZone = "";
		caseStatus = "";
		caseSubstatus = "";
		nominee_name = "";
		nomineeContactNumber = "";
		nominee_address = "";
		insured_address = "";
		supervisor = "";
		supervisor2managerRemarks = "";
		supervisor2investigatorRemarks = "";
		regionalManager2supervisorRemarks = "";
		investigator = "";
		investigator2supervisorRemarks = "";
		underwriter = "";
		underwriter2regionalManagerRemarks = "";
		talicManager = "";
		talicManager2underwriteRemarks = "";
		createdBy = "";
		createdDate = "";
		updatedDate = "";
		updatedBy = "";

	}

	public int getSrNo() {
		return srNo;
	}

	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}

	public long getCaseId() {
		return caseId;
	}

	public void setCaseId(long caseId) {
		this.caseId = caseId;
	}

	public String getPolicyNumber() {
		return policyNumber;
	}

	public void setPolicyNumber(String policyNumber) {
		this.policyNumber = policyNumber;
	}

	public String getInvestigationCategory() {
		return investigationCategory;
	}

	public void setInvestigationCategory(String investigationCategory) {
		this.investigationCategory = investigationCategory;
	}

	public String getInsuredName() {
		return insuredName;
	}

	public void setInsuredName(String insuredName) {
		this.insuredName = insuredName;
	}

	public String getInsuredDOD() {
		return insuredDOD;
	}

	public void setInsuredDOD(String insuredDOD) {
		this.insuredDOD = insuredDOD;
	}

	public String getInsuredDOB() {
		return insuredDOB;
	}

	public void setInsuredDOB(String insuredDOB) {
		this.insuredDOB = insuredDOB;
	}

	public double getSumAssured() {
		return sumAssured;
	}

	public void setSumAssured(double sumAssured) {
		this.sumAssured = sumAssured;
	}

	public String getIntimationType() {
		return intimationType;
	}

	public void setIntimationType(String intimationType) {
		this.intimationType = intimationType;
	}

	public String getClaimantCity() {
		return claimantCity;
	}

	public void setClaimantCity(String claimantCity) {
		this.claimantCity = claimantCity;
	}

	public String getClaimantZone() {
		return claimantZone;
	}

	public void setClaimantZone(String claimantZone) {
		this.claimantZone = claimantZone;
	}

	public String getClaimantState() {
		return claimantState;
	}

	public void setClaimantState(String claimantState) {
		this.claimantState = claimantState;
	}

	public String getCaseStatus() {
		return caseStatus;
	}

	public void setCaseStatus(String caseStatus) {
		this.caseStatus = caseStatus;
	}

	public String getCaseSubstatus() {
		return caseSubstatus;
	}

	public void setCaseSubstatus(String caseSubstatus) {
		this.caseSubstatus = caseSubstatus;
	}

	public String getNominee_name() {
		return nominee_name;
	}

	public void setNominee_name(String nominee_name) {
		this.nominee_name = nominee_name;
	}

	public String getNomineeContactNumber() {
		return nomineeContactNumber;
	}

	public void setNomineeContactNumber(String nomineeContactNumber) {
		this.nomineeContactNumber = nomineeContactNumber;
	}

	public String getNominee_address() {
		return nominee_address;
	}

	public void setNominee_address(String nominee_address) {
		this.nominee_address = nominee_address;
	}

	public String getInsured_address() {
		return insured_address;
	}

	public void setInsured_address(String insured_address) {
		this.insured_address = insured_address;
	}

	public String getSupervisor() {
		return supervisor;
	}

	public void setSupervisor(String supervisor) {
		this.supervisor = supervisor;
	}

	public String getSupervisor2managerRemarks() {
		return supervisor2managerRemarks;
	}

	public void setSupervisor2managerRemarks(String supervisor2managerRemarks) {
		this.supervisor2managerRemarks = supervisor2managerRemarks;
	}

	public String getSupervisor2investigatorRemarks() {
		return supervisor2investigatorRemarks;
	}

	public void setSupervisor2investigatorRemarks(String supervisor2investigatorRemarks) {
		this.supervisor2investigatorRemarks = supervisor2investigatorRemarks;
	}

	public String getRegionalManager2supervisorRemarks() {
		return regionalManager2supervisorRemarks;
	}

	public void setRegionalManager2supervisorRemarks(String regionalManager2supervisorRemarks) {
		this.regionalManager2supervisorRemarks = regionalManager2supervisorRemarks;
	}

	public String getInvestigator() {
		return investigator;
	}

	public void setInvestigator(String investigator) {
		this.investigator = investigator;
	}

	public String getInvestigator2supervisorRemarks() {
		return investigator2supervisorRemarks;
	}

	public void setInvestigator2supervisorRemarks(String investigator2supervisorRemarks) {
		this.investigator2supervisorRemarks = investigator2supervisorRemarks;
	}

	public String getUnderwriter() {
		return underwriter;
	}

	public void setUnderwriter(String underwriter) {
		this.underwriter = underwriter;
	}

	public String getUnderwriter2regionalManagerRemarks() {
		return underwriter2regionalManagerRemarks;
	}

	public void setUnderwriter2regionalManagerRemarks(String underwriter2regionalManagerRemarks) {
		this.underwriter2regionalManagerRemarks = underwriter2regionalManagerRemarks;
	}

	public String getTalicManager() {
		return talicManager;
	}

	public void setTalicManager(String talicManager) {
		this.talicManager = talicManager;
	}

	public String getTalicManager2underwriteRemarks() {
		return talicManager2underwriteRemarks;
	}

	public void setTalicManager2underwriteRemarks(String talicManager2underwriteRemarks) {
		this.talicManager2underwriteRemarks = talicManager2underwriteRemarks;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	@Override
	public String toString() {
		return "CaseDetailList [srNo=" + srNo + ", caseId=" + caseId + ", policyNumber=" + policyNumber
				+ ", investigationCategory=" + investigationCategory + ", insuredName=" + insuredName + ", insuredDOD="
				+ insuredDOD + ", insuredDOB=" + insuredDOB + ", sumAssured=" + sumAssured + ", intimationType="
				+ intimationType + ", claimantCity=" + claimantCity + ", claimantZone=" + claimantZone
				+ ", claimantState=" + claimantState + ", caseStatus=" + caseStatus + ", caseSubstatus=" + caseSubstatus
				+ ", nominee_name=" + nominee_name + ", nomineeContactNumber=" + nomineeContactNumber
				+ ", nominee_address=" + nominee_address + ", insured_address=" + insured_address + ", supervisor="
				+ supervisor + ", supervisor2managerRemarks=" + supervisor2managerRemarks
				+ ", supervisor2investigatorRemarks=" + supervisor2investigatorRemarks
				+ ", regionalManager2supervisorRemarks=" + regionalManager2supervisorRemarks + ", investigator="
				+ investigator + ", investigator2supervisorRemarks=" + investigator2supervisorRemarks + ", underwriter="
				+ underwriter + ", underwriter2regionalManagerRemarks=" + underwriter2regionalManagerRemarks
				+ ", talicManager=" + talicManager + ", talicManager2underwriteRemarks="
				+ talicManager2underwriteRemarks + ", createdBy=" + createdBy + ", createdDate=" + createdDate
				+ ", updatedDate=" + updatedDate + ", updatedBy=" + updatedBy + "]";
	}

	

}
