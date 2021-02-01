package com.preclaim.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.preclaim.config.Config;
import com.preclaim.models.UserDetails;
import com.preclaim.models.UserList;
import com.preclaim.models.UserRole;

public class UserDAOImpl implements UserDAO{

	@Autowired
	DataSource datasource;
	
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public List<UserRole> role_lists() {
		String sql = "select * from user_role where status = 1";
		return template.query(sql, new RowMapper<UserRole>(){			
			public UserRole mapRow(ResultSet rs, int row) throws SQLException
			{
				UserRole role = new UserRole();
				role.setRoleId(rs.getInt(1));
				role.setRole(rs.getString(2));
				role.setRole_code(rs.getString(3));
				role.setStatus(rs.getInt(4));
				return role;
			}
		});
	}

	@Override
	public String create_user(UserDetails user) {
		String sql = "INSERT INTO admin_user(full_name, role_name, username, user_email, mobile_number, "
				+ "password, state, city, zone, permissions, status, user_image, createdon, login_type, "
				+ "web_active, last_login)"
				+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, '', ?, ?, now(), 1, 1, now())";
		System.out.println(user.getPassword());
		try 
		{
			template.update(sql, user.getFull_name(), user.getAccount_type(), user.getUsername(),
					user.getUser_email(),user.getContactNumber(), user.getPassword(), user.getState(),
					user.getCity(), user.getZone(), user.getStatus(), user.getUserimage());
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "Error in adding user. Kindly contact system administrator";
		}
		return "****";
	}

	@Override
	public String create_role(UserRole role) {
		try
		{
			String sql = "INSERT INTO user_role(role, role_code, status, created_on, updated_on) "
					+ "VALUES(?,?,?,now(),now())";
			template.update(sql, role.getRole(), role.getRole_code(), role.getStatus());
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "Error adding role. Kindly contact system administrator";
		}
		return "****";
	}

	@Override
	public String delete_role(UserRole role) {
		try
		{
			String sql = "UPDATE user_role SET status = ?, updated_on = now() where roleId = ?";
			template.update(sql,role.getStatus(),role.getRoleId());
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "Error deleting role. Kindly contact system administrator";
		}
		return "****";
	}

	@Override
	public List<UserList> user_list() {
		try
		{
			String sql = "select * from admin_user a, user_role b where a.role_name = b.role_code";			
			List<UserList> user_list = this.template.query(sql, 
					(ResultSet rs, int count) -> {
						UserList user = new UserList();
						user.setSrno(count + 1);
						user.setUser_id(rs.getInt("user_id"));
						user.setFull_name(rs.getString("full_name"));
						user.setAccount_type(rs.getString("role"));
						user.setAccount_code(rs.getString("roleId"));
						user.setUsername(rs.getString("username"));
						user.setUser_email(rs.getString("user_email"));
						user.decodePassword(rs.getString("password"));
						user.setUser_status(rs.getInt("status"));
						return user;
					});
			return user_list;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}		
	}

	@Override
	public String deleteAdminUser(int user_id) {
		try
		{
			String sql = "DELETE FROM admin_user where user_id = ?";
			this.template.update(sql, user_id);
		}
		catch(Exception e)
		{
			System.out.println("Error in deleteAdminUser() method" + e.getMessage());
			e.printStackTrace();
			return "Error deleting user. Kindly contact system administrator";
		}
		return "****";
	}

	@Override
	public String updateUserStatus(int user_id, int user_status) {
		try
		{
			String sql = "UPDATE admin_user SET status = ? where user_id = ?";
			this.template.update(sql, user_status,user_id);
		}
		catch(Exception e)
		{
			System.out.println("Error in updateUserStatus() method" + e.getMessage());
			e.printStackTrace();
			return "Error updating user status. Kindly contact system administrator";
		}
		return "****";
	}

	@Override
	public UserDetails getUserDetails(int user_id) {
		try
		{
			String sql = "SELECT * FROM admin_user where user_id = ?";
			List<UserDetails> user =  this.template.query(sql, new Object[] {user_id}, 
					(ResultSet rs, int rowCount) -> 
					{
						UserDetails details = new UserDetails();
						details.setFull_name(rs.getString("full_name"));
						details.decodePassword(rs.getString("password"));
						details.setStatus(rs.getInt("status"));
						details.setUser_email(rs.getString("user_email"));
						details.setUserimage(rs.getString("user_image"));
						details.setUserImageb64(Config.upload_directory + rs.getString("user_image"));
						details.setAccount_type(rs.getString("role_name"));
						details.setUsername(rs.getString("username"));
						details.setUserID(rs.getInt("user_id"));
						details.setState(rs.getString("state"));
						details.setCity(rs.getString("city"));
						details.setZone(rs.getString("zone"));
						details.setContactNumber(rs.getString("mobile_number"));
						return details;
					}
					);
			return user.get(0);
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public String updateUserDetails(UserDetails user_details) {
		try
		{
			String sql = "UPDATE admin_user SET full_name = ?, role_name = ?, username = ?,"
					+ "user_email = ?, password = ?, status = ?, user_image = ? where "
					+ "user_id = ?";
			template.update(sql, user_details.getFull_name(), user_details.getAccount_type(),
					user_details.getUsername(), user_details.getUser_email(), user_details.getPassword(),
					user_details.getStatus(), user_details.getUserimage(), user_details.getUserID());
					
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "Failed updating user ID. Kindly contact system administrator";
		}
		return "****";
	}

	@Override
	public String updateUserRole(UserRole role) {
		try
		{
			String sql = "UPDATE user_role SET role = ?, role_code = ?, updated_on = now() where roleId = ?";
			template.update(sql, role.getRole(), role.getRole_code(), role.getRoleId());
					
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "Failed updating user ID. Kindly contact system administrator";
		}
		return "****";
	}

	@Override
	public List<String> retrievePermission(String role_code) {
		try
		{
			String sql = "SELECT * from permission where role_code = ?";
			return template.query(sql, new Object[] {role_code}, 
					(ResultSet rs, int rowCount) ->
					{						
						return rs.getString("module");
					}
					);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
	}

	@Override
	public String addPermission(List<String> role_permission, String role_code) {		
		try
		{
			String sql = "DELETE FROM permission where role_code = ?";
			template.update(sql,role_code);
			sql = "INSERT INTO permission(module, role_code, status, created_on, updated_on)"
					+ "VALUES(?, ? ,1 ,now() ,now())";
			int batch_size = 3;
			for (int i = 0; i < role_permission.size(); i += batch_size) {

				final List<String> batchList = role_permission.subList(i,
						i + batch_size > role_permission.size() ? role_permission.size() : i + batch_size);

				template.batchUpdate(sql, new BatchPreparedStatementSetter() {
					@Override
					public void setValues(PreparedStatement pStmt, int rowCount) throws SQLException {
						pStmt.setString(1, batchList.get(rowCount));
						pStmt.setString(2, role_code);
					}

					@Override
					public int getBatchSize() {
						return batchList.size();
					}

				});
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "Error adding permission";
		}
		
		return "****";
	}

	@Override
	public String accountValidate(String username) {
		try
		{
			String sql = "SELECT count(*) from admin_user where username = '" + username + "'";
			int usernameExists = template.queryForObject(sql, Integer.class);
			if(usernameExists > 0)
				return "Username already exists";
			return "****";	
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "Error in database. Kindly contact system administrator";
		}
	}

	@Override
	public String updateProfile(UserDetails user_details) {
		try
		{
			String sql = "UPDATE admin_user SET full_name = ?, username = ?,"
					+ "user_email = ?, password = ?, user_image = ? where user_id = ?";
			template.update(sql, user_details.getFull_name(), user_details.getUsername(), 
					user_details.getUser_email(), user_details.getPassword(),user_details.getUserimage(), 
					user_details.getUserID());				
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "Failed updating user ID. Kindly contact system administrator";
		}
		return "****";
	}
	
	@Override
	public void activity_log(String moduleName, String moduleCode, String moduleAction, String username) {
		try 
		{
		  	String sql="INSERT INTO activity_log(moduleName, moduleCode, moduleAction, user_name, logDate) "
		  			+ "values(?, ?, ?, ?, now())";
	          this.template.update(sql, moduleName, moduleCode, moduleAction, username);	
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		
	}

	@Override
	public String getUserRole(String roleCode) {
        String sql="select role from user_role where role_code='"+roleCode+"'";
	    return this.template.queryForObject(sql,String.class);
	
	}
		
}
