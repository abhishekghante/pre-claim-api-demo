package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.CaseDetailList;
import com.preclaim.models.UserDetails;

public interface RegionalManagerDao {

	List<String> getActiveZone(String role_name);
	List<String> getActiveState(String role_name, String zone);
	List<String> getActiveCity(String role_name, String zone, String state);
	List<UserDetails> getActiveUser(String role_name, String zone, String state, String city);
	List<CaseDetailList> getAssignedCaseList(String zone);
	List<CaseDetailList> getPendingCaseList(String zone);
	public String assignToSupervisor(String policyNumber, String caseSubStatus,String supervisorName ,String username);
	
}
