package com.preclaim.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.preclaim.dao.MailConfigDao;
import com.preclaim.dao.UserDAO;
import com.preclaim.models.MailConfigList;
import com.preclaim.models.ScreenDetails;
import com.preclaim.models.UserDetails;

@Controller
@RequestMapping(value = "/mailConfig")
public class MailConfigController{

	@Autowired
	private MailConfigDao mailConfigDao;
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
	public String add(HttpSession session) {
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		session.removeAttribute("ScreenDetails");
		ScreenDetails details=new ScreenDetails();
		details.setScreen_name("../mailConfig/addConfig.jsp");
		details.setScreen_title("Add Mail Config");
		details.setMain_menu("Mail Config");
		details.setSub_menu1("Add Mail Config");
    	details.setSub_menu2("Manage Mail Config");
    	details.setSub_menu2_path("/mailConfig/pendingConfig");
		session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/edit/{mailConfigId}",method = RequestMethod.GET)
	public String edit(@PathVariable("mailConfigId") int mailConfigId, HttpSession session) {
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		session.removeAttribute("ScreenDetails");
		ScreenDetails details = new ScreenDetails();
		details.setScreen_name("../mailConfig/editConfig.jsp");
		details.setScreen_title("Add Mail Config");
		details.setMain_menu("Mail Config");
		details.setSub_menu1("Add Mail Config");
    	details.setSub_menu2("Manage Mail Config");
    	details.setSub_menu2_path("/mailConfig/pendingConfig");
		session.setAttribute("ScreenDetails", details);
		session.setAttribute("editMailConfig", mailConfigDao.getMailConfigListById(mailConfigId));
		return "common/templatecontent";
	}
	@RequestMapping(value = "/pending",method = RequestMethod.GET)
	public String pending(HttpSession session, HttpServletRequest request) {
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		
		session.removeAttribute("ScreenDetails");
		ScreenDetails details = new ScreenDetails();
		details.setScreen_name("../mailConfig/pendingConfig.jsp");
		details.setScreen_title("Pending Mail Config");
		details.setMain_menu("Mail Config");
		details.setSub_menu1("Pending Mail Config");
		session.setAttribute("ScreenDetails", details);
		session.setAttribute("pendingConfig", mailConfigDao.getMailConfigList(0));
		
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/active",method = RequestMethod.GET)
	public String active(HttpSession session) {
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		session.removeAttribute("ScreenDetails");
		ScreenDetails details = new ScreenDetails();
		details.setScreen_name("../mailConfig/activeConfig.jsp");
		details.setScreen_title("Active mailConfig");
		details.setMain_menu("Mail Config");
		details.setSub_menu1("Active Mail Config");
		session.setAttribute("ScreenDetails", details);
		session.setAttribute("activeConfig", mailConfigDao.getMailConfigList(1));
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/delete",method = RequestMethod.POST)
	public @ResponseBody String delete(HttpSession session, HttpServletRequest request) {
	
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		
		int mailConfigId = Integer.parseInt(request.getParameter("mailConfigId"));
		String message = mailConfigDao.delete(mailConfigId);
		userDao.activity_log("MAIL", String.valueOf(mailConfigId), "DELETE", user.getUsername());
		return message;
	}
	
	@RequestMapping(value = "/addMailConfig",method = RequestMethod.POST)
	public @ResponseBody String addmailConfig(HttpServletRequest request,HttpSession session) 
	{	
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		MailConfigList mailConfig = new MailConfigList();
		mailConfig.setUsername(request.getParameter("username"));
		mailConfig.setPassword(request.getParameter("password"));
		mailConfig.setOutgoingServer(request.getParameter("outgoingServer"));
		mailConfig.setOutgoingPort(Integer.parseInt(request.getParameter("outgoingPort")));
		mailConfig.setEncryptionType(request.getParameter("encryptionType"));
		mailConfig.setCreatedBy(user.getUsername());
		String message = mailConfigDao.add(mailConfig);		
		userDao.activity_log("MAIL", "", "ADD", user.getUsername());
		return message;
	}
	
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public @ResponseBody String update(HttpSession session, HttpServletRequest request) 
	{	
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		MailConfigList mailConfig = new MailConfigList();
		mailConfig.setMailConfigId(Integer.parseInt(request.getParameter("mailConfigId")));
		mailConfig.setUsername(request.getParameter("username"));
		mailConfig.setPassword(request.getParameter("password"));
		mailConfig.setOutgoingServer(request.getParameter("outgoingServer"));
		mailConfig.setOutgoingPort(Integer.parseInt(request.getParameter("outgoingPort")));
		mailConfig.setEncryptionType(request.getParameter("encryptionType"));
		mailConfig.setUpdatedBy(user.getUsername());
		String message = mailConfigDao.update(mailConfig);	
		userDao.activity_log("MAIL", String.valueOf(mailConfig.getMailConfigId()), "UPDATE", user.getUsername());
		return message;
	}
	
	@RequestMapping(value = "/updateStatus",method = RequestMethod.POST)
	public @ResponseBody String updateStatus(HttpSession session, HttpServletRequest request)
	{
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		int mailConfigId = Integer.parseInt(request.getParameter("mailConfigId"));
		int mailConfigStatus = Integer.parseInt(request.getParameter("status"));
	    String message = mailConfigDao.updateStatus(mailConfigId, mailConfigStatus , user.getUsername()); 
	    userDao.activity_log("MAIl", String.valueOf(mailConfigId), mailConfigStatus == 1 ? "ACTIVE" : "DEACTIVE", 
	    		user.getUsername());
		return message;
    }
}


