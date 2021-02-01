package com.preclaim.dao;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.preclaim.models.CaseDetailList;
import com.preclaim.models.UserDetails;

public class AgencySupervisorDaoImpl implements AgencySupervisorDao {
	
	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	@Override
	public List<String> getActiveZone(String role_name)
	{
		try
		{
			String sql = "SELECT DISTINCT zone FROM admin_user where status = 1 and role_name = ?";
			return template.query(sql, new Object[] {role_name}, 
					(ResultSet rs, int rowCount) -> {return rs.getString("zone");});
		}
		catch(Exception e)
		{
			return null;
		}
	}
	
	@Override
	public List<String> getActiveState(String role_name, String zone)
	{
		try
		{
			String sql = "SELECT DISTINCT state FROM admin_user where status = 1 and role_name = ? and "
					+ "zone = ?";
			return template.query(sql, new Object[] {role_name, zone}, 
					(ResultSet rs, int rowCount) -> {return rs.getString("state");});
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<String> getActiveCity(String role_name, String zone, String state)
	{
		try
		{
			String sql = "SELECT DISTINCT city FROM admin_user where status = 1 and role_name = ? and "
					+ "zone = ? and state = ?";
			return template.query(sql, new Object[] {role_name, zone, state}, 
					(ResultSet rs, int rowCount) -> {return rs.getString("city");});
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<UserDetails> getActiveUser(String role_name, String zone, String state, String city)
	{
		try
		{
			String sql = "SELECT * FROM admin_user where status = 1 and role_name = ? and "
					+ "zone = ? and state = ? and city = ?";
			return template.query(sql, new Object[] {role_name, zone, state, city}, 
					(ResultSet rs, int rowCount) -> 
						{
							UserDetails user = new UserDetails();
							user.setUsername(rs.getString("username"));
							user.setFull_name(rs.getString("full_name"));
							return user;
						});
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<CaseDetailList> getPendingCaseList(String username) {
		try
		{
			String sql ="SELECT * FROM case_lists where caseSubStatus = 'AAS' and "
					+ "supervisor = '" + username + "'"; 			   
			List<CaseDetailList> casedetailList = template.query(sql,(ResultSet rs, int rowCount) -> {
						CaseDetailList casedetail=new CaseDetailList();
						casedetail.setSrNo(rowCount+1);
						casedetail.setCaseId(rs.getInt("caseId"));
						casedetail.setPolicyNumber(rs.getString("policyNumber"));
						casedetail.setInsuredName(rs.getString("insuredName"));
						casedetail.setInvestigationCategory(rs.getString("investigationCategory"));
						casedetail.setClaimantZone(rs.getString("claimantZone"));
						casedetail.setSumAssured(rs.getInt("sumAssured"));
						casedetail.setCaseStatus(rs.getString("caseStatus"));
						casedetail.setCaseSubstatus(rs.getString("caseSubStatus"));
						casedetail.setIntimationType(rs.getString("intimationType"));	
						return casedetail;
					});
			return casedetailList;
		}
		catch(Exception ex)
		{
			System.out.println(ex.getMessage());
			ex.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<CaseDetailList> getAssignedCaseList(String username) {
		try
		{
			String sql ="SELECT * FROM case_lists where caseSubStatus NOT IN ('PA', 'ARM' ,'AAS') and"
					+ " supervisor = '" + username + "'"; 			   
			List<CaseDetailList> casedetailList = template.query(sql,(ResultSet rs, int rowCount) -> {
						CaseDetailList casedetail=new CaseDetailList();
						casedetail.setSrNo(rowCount+1);
						casedetail.setCaseId(rs.getInt("caseId"));
						casedetail.setPolicyNumber(rs.getString("policyNumber"));
						casedetail.setInsuredName(rs.getString("insuredName"));
						casedetail.setInvestigationCategory(rs.getString("investigationCategory"));
						casedetail.setClaimantZone(rs.getString("claimantZone"));
						casedetail.setSumAssured(rs.getInt("sumAssured"));
						casedetail.setCaseStatus(rs.getString("caseStatus"));
						casedetail.setCaseSubstatus(rs.getString("caseSubStatus"));
						casedetail.setIntimationType(rs.getString("intimationType"));	
						return casedetail;
					});
			return casedetailList;
		}
		catch(Exception ex)
		{
			System.out.println(ex.getMessage());
			ex.printStackTrace();
			return null;
		}
	}

	@Override
	public String AssignToinvestigator(String policyNumber, String caseSubStatus, String investigator, String username) {
		
		try {			
		      String sql="UPDATE case_lists SET caseSubStatus = ?, updatedDate = now(), investigator=?, "
		      		+ "updatedBy = ? "
		      		+ "where caseSubStatus = 'AAS' and policyNumber in (" + policyNumber + ")";
			  this.template.update(sql, caseSubStatus,investigator,username);
			  
		   }
		catch(Exception e) 
		{
			return "Error assigning cases to Investigator. Kindly contact system administrator";	
	    }
		return "****";

	}
}
