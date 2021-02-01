package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.CaseDetailList;
import com.preclaim.models.CaseDetails;

public interface CaseDao {
	
	String addBulkUpload(String filename);
	String addcase(CaseDetails casedetail);
	String deleteCase(int caseId);
	String assignToRM(String policyNumber, String username, String caseSubStatus);
	CaseDetails getCaseDetail(int caseID);
	String updateCaseDetails(CaseDetails case_details);
	
	List<CaseDetailList> getPendingCaseList(String username);
	List<CaseDetailList> getAssignedCaseList(String username);

}
