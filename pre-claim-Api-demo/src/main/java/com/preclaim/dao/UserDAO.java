package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.UserDetails;
import com.preclaim.models.UserList;
import com.preclaim.models.UserRole;

public interface UserDAO {
	
	String create_user(UserDetails user);
	List<UserList> user_list();
	String deleteAdminUser(int user_id);
	String create_role(UserRole role);
	List<UserRole> role_lists();
	String updateUserRole(UserRole role);	
	String delete_role(UserRole role);
	String updateUserStatus(int user_id, int user_status);
	UserDetails getUserDetails(int user_id);
	String updateUserDetails(UserDetails user_details);
	List<String> retrievePermission(String role_code);
	String addPermission(List<String> role_permission, String role_code);
	String accountValidate(String username);
	String updateProfile(UserDetails user_details);
	/**
	 * Activity Log - Keeps the log of all the activities performed on Pre-Claims Investigation Menu
	 * @param Module Name
	 * @param Module Code
	 * @param Module Action - Add, Edit, Delete, Status Change etc
	 * @param Username
	 * @return void
	 * 
	 */
	void activity_log(String moduleName,String moduleCode,String moduleAction,String username);
	String getUserRole(String roleCode);
}
