package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.AppUserList;
public interface AppUserDao {
	
	List<AppUserList> getAppuserList();
	String updateAppUserStatus(int appUserId, int status);
	String deleteAppUser(int appUserId);
	String deleteAllUsers();
	String readAppUserxls(String filename);
	String readAppUserxlsx(String filename);

}
