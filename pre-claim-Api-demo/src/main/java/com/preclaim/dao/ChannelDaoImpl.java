package com.preclaim.dao;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.preclaim.models.Channel;
import com.preclaim.models.ChannelList;

public class ChannelDaoImpl implements ChannelDao {
	
    @Autowired
	DataSource datasource;
	
	private JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public String create_channel(Channel channel) {	
		try 
		{
			String channelCheck = "SELECT count(*) FROM channel_lists WHERE channelCode='" + 
					channel.getChannelCode()+"'";
			 int channelCount = this.template.queryForObject(channelCheck, Integer.class);
			 if(channelCount == 0) 
			 {
				 String query="INSERT INTO channel_lists(channelName, channelCode, level, createdBy, "
						 	+ "createdDate, updatedDate, updatedBy, status) values(?,?,?,?,now(),now(),?,?)";
				 template.update(query, channel.getChannelName(), channel.getChannelCode(), channel.getLevel(),
						 		channel.getCreatedBy(), channel.getUpdatedBy(), channel.getStatus());			
			 }
			 else 
			         return "Channel name already exists";
    	}
		catch(Exception e) 
		{	
			System.out.println(e.getMessage());
			e.printStackTrace();
			return "Error adding channel. Kindly contact system administrator";
		}
		
		return "****";
	}

	@Override
	public List<ChannelList> channel_list(int status) {
		String query="";
		if(status==0) 
		  query = "SELECT * FROM channel_lists WHERE status = " + status;
		else
		  query = "select * from channel_lists where status = 1 or status = 2";
		return template.query(query, (ResultSet rs, int rowNum) -> {
			ChannelList channelList = new ChannelList();
			channelList.setSrNo(rowNum + 1);
			channelList.setChannelName(rs.getString("channelName"));
			channelList.setChannelCode(rs.getString("channelCode"));
			channelList.setCreatedDate(rs.getString("createdDate"));
			channelList.setStatus(rs.getInt("status"));
			channelList.setChannelId(rs.getInt("channelId"));
			return channelList;
		});
		
	}

	@Override
	public String deleteChannel(int channelId) {
		try
		{
			String sql = "DELETE FROM channel_lists where channelId = ?";
			template.update(sql, channelId);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "Error deleting channel. Kindly contact system administrator";
		}

		return "****";
	}

	@Override
	public String updateChannel(String channelName, String channelCode, int channelId) {
		try
		{
			String sql = "UPDATE channel_lists SET channelName = ?, channelCode = ?, updatedDate = now() where channelId = ?";
			template.update(sql, channelName, channelCode, channelId);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "Error updating channel. Kindly contact system administrator";
		}
		return "****";
	}

	@Override
	public String updateChannelStatus(int channelId, int status) {
		try 
		{			
	       String sql="UPDATE channel_lists SET status = ? where channelId = ?";
           this.template.update(sql,status,channelId);				
		}catch(Exception e)
		{
			e.printStackTrace();
			return "Error updating channel status. Kindly contact system administrator";
		}
		return "****";
	}
	
}
