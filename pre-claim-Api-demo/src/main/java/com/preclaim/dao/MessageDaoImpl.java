package com.preclaim.dao;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.preclaim.models.Channel;
import com.preclaim.models.IntimationType;
import com.preclaim.models.Region;

public class MessageDaoImpl implements MessageDao {

	@Autowired
	DataSource datasource;
	
	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public List<IntimationType> getActiveGrouplist() {
		try {
			String sql = "SELECT * FROM group_lists where status = 1";
			return template.query(sql,
					(ResultSet rs, int rowCount) ->
					{
						IntimationType intimationType = new IntimationType();
						intimationType.setIntimationId(rs.getInt("groupId"));
						intimationType.setIntimationType(rs.getString("groupName"));
						intimationType.setStatus(1);
						return intimationType;
					}
					);
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Region> getActiveRegionlist() {
		try {
			String sql = "SELECT * FROM region_lists where status = 1";
			return template.query(sql,
					(ResultSet rs, int rowCount) ->
					{
						Region region = new Region();
						region.setRegionId(rs.getInt("regionId"));
						region.setRegionName(rs.getString("regionName"));
						region.setStatus(1);
						return region;
					}
					);
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Channel> getActiveChannellist() {
		try {
			String sql = "SELECT * FROM channel_lists where status = 1";
			return template.query(sql,
					(ResultSet rs, int rowCount) ->
					{
						Channel channel = new Channel();
						channel.setChannelCode(rs.getString("channelCode"));
						channel.setChannelName(rs.getString("channelName"));
						return channel;
					}
					);
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Channel> getCategoryChannellist() {
		try {
			String sql = "SELECT * FROM category_lists where status = 1";
			return template.query(sql,
					(ResultSet rs, int rowCount) ->
					{
						Channel channel = new Channel();
						return channel;
					}
					);
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			e.printStackTrace();
			return null;
		}

	}

/*	@Override
	public List<CaseDetailList> getCaseDetailList(int status) {
		try
		{
			String sql="";
			 if(status==0) 
				 sql ="SELECT * FROM case_lists where status = " + status; 
			   else 
				 sql ="SELECT * FROM case_lists where status = 1 or status = 2";
			List<CaseDetailList> casedetailList = template.query(sql,(ResultSet rs, int rowCount) -> {
						CaseDetailList casedetail=new CaseDetailList();
						casedetail.setSrNo(rowCount+1);
						casedetail.setCaseId(rs.getInt("caseId"));
						casedetail.setPolicyNumber(rs.getString("policyNumber"));
						casedetail.setInsuredName(rs.getString("insuredName"));
						casedetail.setInvestigationCategory(rs.getString("investigationCategory"));
						casedetail.setClaimantZone(rs.getString("claimantZone"));
						casedetail.setSumAssured(rs.getInt("sumAssured"));
						casedetail.setStatus(rs.getInt("status"));
						casedetail.setCaseSubstatus(rs.getInt("subStatus"));
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
	public String addcase(CaseDetails casedetail) {
	
		try {
				String query="Insert into case_lists(policyNumber,insuredName,claimantCity,claimantZone,claimantState,status,subStatus,"
						+ "investigationCategory,sumAssured,createdBy,createdDate,updatedDate,updatedBy) values(?,?,?,?,?,1,1,?,?,?,now(),now(),0)";
		       this.template.update(query,casedetail.getPolicyNumber(),casedetail.getInsuredName(),casedetail.getClaimantCity(),casedetail.getClaimantZone()
		    		   ,casedetail.getClaimantState(),casedetail.getInvestigationCategory(),casedetail.getSumAssured(),casedetail.getCreatedBy());
				
	    	}
		catch(Exception e) 
		{
			e.printStackTrace();
			return "Error adding case. Kindly contact system administrator";
		}
		return "****";
	}
*/
	

	


}
