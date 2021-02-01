package com.preclaim.dao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.sql.DataSource;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ParameterizedPreparedStatementSetter;
import org.springframework.transaction.annotation.Transactional;

import com.preclaim.config.Config;
import com.preclaim.models.AppUserList;

public class AppUserDaoImpl implements AppUserDao {

	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public List<AppUserList> getAppuserList() {
		try
		{
			String sql = "SELECT * FROM app_users";
			List<AppUserList> appuserList = new ArrayList<AppUserList>();
			appuserList =  template.query(sql, 
					(ResultSet rs, int rowCount) -> {
						AppUserList appuser = new AppUserList();
						appuser.setSrno(rowCount + 1);
						appuser.setAppuserId(rs.getInt("appUserId"));
						appuser.setUsername(rs.getString("userName"));
						appuser.setAgentcode(rs.getString("agentCode"));
						appuser.setAgentname(rs.getString("agentName"));
						appuser.setChannelcode1(rs.getString("channelCode_1"));
						appuser.setChannelname1(rs.getString("channel_1"));
						appuser.setRegionId(rs.getInt("regionId"));
						appuser.setLatitude(rs.getString("lat"));
						appuser.setLongitude(rs.getString("lng"));
						appuser.setZipcode(rs.getInt("zipcode"));
						appuser.setPassword(rs.getString("password"));
						appuser.setStatus(rs.getInt("status"));
						return appuser;
					}
					
					);
			return appuserList;
		}
		catch(Exception e)
		{
			System.out.println("Error inside getAppuserList() " + e.getMessage());
			e.printStackTrace();
			return null;	
		}
	}
	
	@Override
	public String deleteAppUser(int appUserId) {
		try 
		{
			String query = "DELETE FROM app_users WHERE appUserId = ?";
			template.update(query, appUserId);
		} 
		catch (Exception e) 
		{
			System.out.println("Deletion" + e.getMessage());
			e.printStackTrace();
			return "Error deleting App User ID. Kindly contact system administrator";
		}
		return "****";
	}
	
	@Override
	public String updateAppUserStatus(int appUserId, int status) {
		try {
			
			  String query="UPDATE app_users SET status = ?, updatedOn = now() WHERE appUserId = ?";
              this.template.update(query,status,appUserId);	
		   }
	    catch(Exception e) 
		{
	    	System.out.println(e.getMessage());
		    return "Error updating App User status. Kindly contact system administrator ";
	    }
		return "****";
	}

	@Override
	public String deleteAllUsers() {
		try
		{
			String sql = "DELETE FROM app_users";
			template.update(sql);
			return "****";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			System.out.println("Error inside deleteAllUsers() " + ex.getMessage());
			return "Error deleting all users";
		}
	}

	@Override
	public String readAppUserxls(String filename) {
		
		return null;
	}

	@Override
	@Transactional
	public String readAppUserxlsx(String filename) {
		try {
			File file = new File(Config.upload_directory + filename);
			//File not found error won't occur
			List<AppUserList> appuserList = new ArrayList<AppUserList>();
			FileInputStream fis = new FileInputStream(file);
			XSSFWorkbook wb = new XSSFWorkbook(fis);   
			XSSFSheet sheet = wb.getSheetAt(0);
			Iterator<Row> itr = sheet.iterator();    //iterating over excel file  		
			itr.hasNext();
			itr.next();
			while (itr.hasNext())                 
			{  
				//Skipping Header String
				Row row = itr.next();
				Iterator<Cell> cellIterator = row.cellIterator();   //iterating over each column  
				AppUserList appuser = new AppUserList();
				Cell cell;
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setUsername(readCellStringValue(cell));
				}	
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setAgentname(readCellStringValue(cell));
				}	
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setAgentcode(readCellStringValue(cell));
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setChannelId1(readCellIntValue(cell));
				}				
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setChannelname1(readCellStringValue(cell));;
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setChannelcode1(readCellStringValue(cell));;
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setRegionId(readCellIntValue(cell));;
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setLevel(readCellIntValue(cell));;
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setPassword(readCellStringValue(cell));;
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setStatus(readCellIntValue(cell));;
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setChannelcode2(readCellStringValue(cell));;
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setChannelname2(readCellStringValue(cell));;
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setChannelId2(readCellIntValue(cell));;
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setEmail(readCellStringValue(cell));;
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setLeaderFlag(readCellStringValue(cell));;
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setLang(readCellIntValue(cell));;
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setLatitude(readCellStringValue(cell));;
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setLongitude(readCellStringValue(cell));
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					appuser.setZipcode(readCellIntValue(cell));
				}
					
				appuserList.add(appuser);
			}
			wb.close();
			String sql = "INSERT INTO app_users(userName, agentName, agentCode, channelId1, channel_1, "
					+ "channelCode_1, regionId, level, password, createdBy, createdDate, updatedOn, "
					+ "lastLogin, status, channelCode_2, channel_2, channelId2, emailId, leaderFlag,"
					+ "lang, lat, lng, zipcode, userType, is_updated) VALUES(?,?,?,?,?,?,?,?,?,0,now(),"
					+ "now(), now(),?,?,?,?,?,?,?,?,?,?,?,0)";
			
			template.batchUpdate(sql,appuserList,5,
	                new ParameterizedPreparedStatementSetter<AppUserList>() {
	                    public void setValues(PreparedStatement ps, AppUserList appuser) throws SQLException          
	                    {
	                    	ps.setString(1,appuser.getUsername());
	                    	ps.setString(2, appuser.getAgentname());
	                    	ps.setString(3, appuser.getAgentcode());
	                    	ps.setInt(4, appuser.getChannelId1());
	                    	ps.setString(5, appuser.getChannelname1());
	                    	ps.setString(6, appuser.getChannelcode1());
	                    	ps.setInt(7, appuser.getRegionId());
	                    	ps.setInt(8, appuser.getLevel());
	                    	ps.setString(9, appuser.getPassword());
	                    	ps.setInt(10, appuser.getStatus());
	                    	ps.setString(11, appuser.getChannelcode2());
	                    	ps.setString(12, appuser.getChannelname2());
	                    	ps.setInt(13, appuser.getChannelId2());
	                    	ps.setString(14, appuser.getEmail());
	                    	ps.setString(15, appuser.getLeaderFlag());
	                    	ps.setInt(16, appuser.getLang());
	                    	ps.setString(17, appuser.getLatitude());
	                    	ps.setString(18, appuser.getLongitude());
	                    	ps.setInt(19, appuser.getZipcode());
	                    	ps.setString(20, appuser.getUserType());
	                    	 	
	                    }
	                });
			return "****";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}

	public String readCellStringValue(Cell cell)
	{
		switch (cell.getCellType())               
		{  
			case STRING:  
				return cell.getStringCellValue();  
			case NUMERIC:    //field that represents number cell type  
				return String.valueOf(cell.getNumericCellValue());
			default:
				return "";
		}
	}
	
	public int readCellIntValue(Cell cell)
	{
		switch (cell.getCellType())               
		{  
			case STRING:  
				return Integer.parseInt(cell.getStringCellValue());  
			case NUMERIC:    //field that represents number cell type  
				return (int)cell.getNumericCellValue();
			default:
				return 0;
		}
	}
	
}
