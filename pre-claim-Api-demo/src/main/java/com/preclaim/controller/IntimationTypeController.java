 package com.preclaim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.preclaim.dao.IntimationTypeDao;
import com.preclaim.dao.UserDAO;
import com.preclaim.models.IntimationType;
import com.preclaim.models.IntimationTypeList;
import com.preclaim.models.ScreenDetails;
import com.preclaim.models.UserDetails;

@Controller
@RequestMapping(value = "/intimationType")
public class IntimationTypeController {
	
    @Autowired
	private IntimationTypeDao intimationTypeDao;
    
    @Autowired
    private UserDAO userDao;

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../intimationType/addIntimationType.jsp");
    	details.setScreen_title("Add Intimation Type");
    	details.setMain_menu("Intimation Type");
    	details.setSub_menu1("Add Intimation Type");
    	details.setSub_menu2("Manage Intimation");
    	details.setSub_menu2_path("/intimationType/pendingIntimationType.jsp");
    	session.setAttribute("ScreenDetails", details);
    	return "common/templatecontent";
    }
   
    @RequestMapping(value = "/pending",method = RequestMethod.GET)
    public String pending(HttpSession session, HttpServletRequest request) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../intimationType/pendingIntimationType.jsp");
    	details.setScreen_title("Pending Intimation Type List");
    	details.setMain_menu("Intimation Type");
    	details.setSub_menu1("Pending Intimation");
    	session.setAttribute("ScreenDetails", details);
    	List<IntimationTypeList> pending_list= intimationTypeDao.intimationType_list(0);
    	session.setAttribute("pending_intimationType", pending_list);
    	
    	if(request.getParameter("intimationtypeName")!= null && request.getParameter("intimationId") != null)
    	{
    		IntimationTypeList intimationTypeList = new IntimationTypeList();
    		intimationTypeList.setIntimationId(Integer.parseInt(request.getParameter("intimationId")));
    		intimationTypeList.setIntimationType(request.getParameter("intimationtypeName"));
    		session.setAttribute("intimationTypeList", intimationTypeList);
    	}
    	return "common/templatecontent";
    }
    
    @RequestMapping(value="/active",method = RequestMethod.GET)
    public String active(HttpSession session) {
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../intimationType/activeIntimationType.jsp");;
    	details.setScreen_title("Active Intimation");
    	details.setMain_menu("Intimation Type");
    	details.setSub_menu1("Active Intimation");
    	session.setAttribute("ScreenDetails", details);
    	List<IntimationTypeList> active_list = intimationTypeDao.intimationType_list(1);
    	session.setAttribute("active_list", active_list);
    	return "common/templatecontent";
    }
    
    @RequestMapping(value = "/deleteIntimationType", method = RequestMethod.POST)
	public @ResponseBody String deleteIntimationType(HttpSession session, HttpServletRequest request)
	{
		int IntimationId = Integer.parseInt(request.getParameter("IntimationId"));
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		String message = intimationTypeDao.deleteIntimationType(IntimationId);
		userDao.activity_log("IntimationType", String.valueOf(IntimationId), "DELETE", user.getUsername());
		return message;
	}
    
    @RequestMapping(value = "/addIntimationType",method = RequestMethod.POST)
	public @ResponseBody String addGroup(HttpSession session, HttpServletRequest request) 
	{	
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		String IntimationtypeName = request.getParameter("intimationtypeName");
		IntimationType intimationType = new IntimationType();
		intimationType.setIntimationType(IntimationtypeName);
		intimationType.setCreatedBy(user.getUserID());
		String message = intimationTypeDao.add_intimationType(intimationType);
		userDao.activity_log("IntimationType", IntimationtypeName, "ADD", user.getUsername());
		return message;
	}
	
	@RequestMapping(value = "/updateIntimationType",method = RequestMethod.POST)
	public @ResponseBody String updateGroup(HttpSession session, HttpServletRequest request) 
	{	
		int IntimationId=Integer.parseInt(request.getParameter("intimationId"));		
		String IntimationType = request.getParameter("intimationtypeName");
		System.out.println("IntimationId : "+ IntimationId);
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		String message = intimationTypeDao.updateIntimationType(IntimationId, IntimationType, user.getUserID());
		userDao.activity_log("IntimationType", IntimationType, "UPDATE", user.getUsername());
		return message;
	}
	
	@RequestMapping(value = "/updateIntimationTypeStatus",method = RequestMethod.POST)
	public @ResponseBody String updateIntimationTypeStatus(HttpSession session, HttpServletRequest request) 
	{	
		int IntimationId=Integer.parseInt(request.getParameter("IntimationId"));	
		int status=Integer.parseInt(request.getParameter("status"));
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		String message = intimationTypeDao.updateIntimationTypeStatus(IntimationId, status, user.getUserID());
		userDao.activity_log("IntimationType", String.valueOf(IntimationId), status == 1 ? "ACTIVE" : "DEACTIVE", user.getUsername());
		return message;
	}
	
}
