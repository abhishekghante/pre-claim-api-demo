package com.preclaim.dao;

import java.util.List;
import com.preclaim.models.CaseDetailList;
import com.preclaim.models.UserDetails;

public interface AgencySupervisorDao {

	List<String> getActiveZone(String role_name);
	List<String> getActiveState(String role_name, String zone);
	List<String> getActiveCity(String role_name, String zone, String state);
	List<UserDetails> getActiveUser(String role_name, String zone, String state, String city);
	List<CaseDetailList> getAssignedCaseList(String username);
	List<CaseDetailList> getPendingCaseList(String username);
	public String AssignToinvestigator(String caseList,String caseSubStatus,String investigator,String username);
	
}
