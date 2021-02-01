package com.preclaim.dao;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.preclaim.models.Region;
import com.preclaim.models.RegionList;

public class RegionDaoImpl implements RegionDao {

	@Autowired
	DataSource datasource;
	
	private JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public String create_region(Region region) 
	{
		try 
		{		
			String RegionCheck = "SELECT count(*) FROM region_lists WHERE regionName='" + 
					region.getRegionName() + "'";
			int RegionCount = this.template.queryForObject(RegionCheck, Integer.class);
			if (RegionCount == 0) 			 
			{
				String query = "INSERT INTO region_lists(regionName, createdBy, createdDate, updatedDate,"
								+ "updatedBy, status) values(?,?,now(),now(),?,?)";
				template.update(query, region.getRegionName(), region.getCreatedBy(), 
						region.getUpdatedBy(), region.getStatus());
			} 
			else 
				return "Region name already exists";		    
		} 
		catch (Exception e)       
		{
		    System.out.println(e.getMessage());
		    e.printStackTrace();
	        return "Error adding region. Kindly contact system administrator";	      
		}
		return "****";
	}

	@Override
	public List<RegionList> region_list(int status) {
		String query="";
		if(status==0) 
	      query = "SELECT * FROM region_lists WHERE status = " + status;
	    else 
	    	query = "SELECT * FROM region_lists WHERE status = 1 or status = 2";
		return template.query(query, (ResultSet rs, int rowNum) -> {
			RegionList regionList = new RegionList();
			regionList.setRegionId(rs.getInt("regionId"));
			regionList.setSrNo(rowNum + 1);
			regionList.setRegionName(rs.getString("regionName"));
			regionList.setCreatedDate(rs.getString("createdDate"));
			regionList.setStatus(rs.getInt("status"));
			return regionList;
		});
	}

	@Override
	public String deleteRegion(int regionId) {
		try 
		{
			String query = "DELETE FROM region_lists WHERE regionId = ?";
			template.update(query, regionId);
		} 
		catch (Exception e) 
		{
			System.out.println("Deletion" + e.getMessage());
			e.printStackTrace();
			return "Error deleting region. Kindly contact system administrator";
		}
		return "****";
	}

	@Override
	public String updateRegion(int regionId, String region_name) {
		try 
		{
			String sql = "UPDATE region_lists SET regionName = ? , updatedDate = now() WHERE regionId = ?";
			template.update(sql, region_name, regionId);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return "Error updating region. Kindly contact system administrator";
		}
		return "****";
	}

	@Override
	public String updateRegionStatus(int RegionId, int status) {
		try {
			
			  String query="UPDATE region_lists SET status = ? WHERE regionId = ?";
              this.template.update(query,status,RegionId);	
            
		   }
	    catch(Exception e) 
		{
	    	e.printStackTrace();
		     return "Error updating region status. Kindly contact system administrator";
	    }
		return "****";
	}
}
