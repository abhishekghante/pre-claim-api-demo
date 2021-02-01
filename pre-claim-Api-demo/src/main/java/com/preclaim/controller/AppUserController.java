package com.preclaim.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.preclaim.config.Config;
import com.preclaim.dao.AppUserDao;
import com.preclaim.dao.UserDAO;
import com.preclaim.models.ScreenDetails;
import com.preclaim.models.UserDetails;

@Controller
@RequestMapping(value = "/app_user")
public class AppUserController {
	
	@Autowired
	AppUserDao appuserDao;
	
	@Autowired
	UserDAO userDao;
	
	@RequestMapping(value = "/app_user")
	public String app_user(HttpSession session)
	{
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../app_user/app_user.jsp");
    	details.setScreen_title("<li class = \"active\">App User Lists</li>");
    	details.setMain_menu("App Users Management");
    	details.setSub_menu1("");
    	session.setAttribute("ScreenDetails", details);
    	session.setAttribute("AppUserList", appuserDao.getAppuserList());
    	return "common/templatecontent";
	}
	
	@RequestMapping(value = "/import")
	public String import_user(HttpSession session)
	{
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../app_user/import_user.jsp");
    	details.setScreen_title("<li class = \"active\">App User Lists</li>");
    	details.setMain_menu("App Users Management");
    	details.setSub_menu1("");
    	session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/updateAppUserStatus",method = RequestMethod.POST)
	public @ResponseBody String updateAppUserStatus(HttpSession session, HttpServletRequest request)
	{
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		int appUserId = Integer.parseInt(request.getParameter("appUserId"));
		int appUserStatus = Integer.parseInt(request.getParameter("status"));
	    String message = appuserDao.updateAppUserStatus(appUserId, appUserStatus); 
	    userDao.activity_log("APP USER", String.valueOf(appUserId), appUserStatus == 1 ? "ACTIVE" : "DEACTIVE", 
	    		user.getUsername());
		return message;
    }
	
	@RequestMapping(value = "/deleteAppUser",method = RequestMethod.POST)
	public @ResponseBody String deleteAppUser(HttpSession session, HttpServletRequest request) {
	
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		int appUserId = Integer.parseInt(request.getParameter("appUserId"));
		String message = appuserDao.deleteAppUser(appUserId);
		userDao.activity_log("APPUSER", String.valueOf(appUserId), "DELETE", user.getUsername());
		return message;
	}
	
	@RequestMapping(value = "/deleteAll")
	public String deleteAll(HttpSession session, HttpServletRequest request)
	{
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		appuserDao.deleteAllUsers();
		userDao.activity_log("APPUSER","", "DELETEALL", user.getUsername());
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../app_user/app_user.jsp");
    	details.setScreen_title("App User Lists");
    	details.setMain_menu("App Users Management");
    	details.setSub_menu1("");
    	details.setSuccess_message1("All users deleted successfully");
    	session.setAttribute("ScreenDetails", details);
    	session.setAttribute("AppUserList", appuserDao.getAppuserList());
    	return "common/templatecontent";
	}
	
	@RequestMapping(value = "/importData", method = RequestMethod.POST)
	public String importData(@RequestParam CommonsMultipartFile userfile,HttpSession session, HttpServletRequest request)
	{
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../app_user/import_user.jsp");
    	details.setScreen_title("App User Lists");
    	details.setMain_menu("App Users Management");
    	details.setSub_menu1("");
    	session.setAttribute("ScreenDetails", details);
				
		//File Uploading Routine
		if(userfile != null)
		{
			try 
			{
	    		byte[] temp = userfile.getBytes();
	    		String filename = userfile.getOriginalFilename();
	    		filename = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH-mm-SS")) + "_" + filename;
	    		Path path = Paths.get(Config.upload_directory + filename);
	    		System.out.println("Entered");
				Files.write(path, temp);
				String fileExtension = StringUtils.getFilenameExtension(filename);
				if(fileExtension.equals("xls"))
					appuserDao.readAppUserxls(filename);
				else if(fileExtension.equals("xlsx"))
					appuserDao.readAppUserxlsx(filename);
				details.setSuccess_message1("File uploaded successfully");		    	
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
				details.setError_message1("File Uploading failed");
			}    	
		}
			
		return "common/templatecontent";
	}
}
