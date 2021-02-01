package com.preclaim.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.preclaim.dao.RegionDao;
import com.preclaim.dao.UserDAO;
import com.preclaim.models.Region;
import com.preclaim.models.RegionList;
import com.preclaim.models.ScreenDetails;
import com.preclaim.models.UserDetails;

@Controller
@RequestMapping(value = "/region")
public class RegionController{

	@Autowired
	private RegionDao regionDao;
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(value = "/add_region",method = RequestMethod.GET)
	public String add_region(HttpSession session) {
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		session.removeAttribute("ScreenDetails");
		ScreenDetails details=new ScreenDetails();
		details.setScreen_name("../region/add_region.jsp");
		details.setScreen_title("Add Region");
		details.setMain_menu("Regions");
		details.setSub_menu1("Add Region");
    	details.setSub_menu2("Manage Regions");
    	details.setSub_menu2_path("/region/pending_region");
		session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/pending_region",method = RequestMethod.GET)
	public String pending_region(HttpSession session, HttpServletRequest request) {
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		session.removeAttribute("ScreenDetails");
		ScreenDetails details=new ScreenDetails();
		details.setScreen_name("../region/pending_region.jsp");
		details.setScreen_title("Pending Region");
		details.setMain_menu("Regions");
		details.setSub_menu1("Pending Regions");
		session.setAttribute("ScreenDetails", details);
		List<RegionList> pending_region=regionDao.region_list(0);
		session.setAttribute("pending_region", pending_region);
		
		if(request.getParameter("regionName")!= null && request.getParameter("regionId")!= null)
		{
			RegionList region = new RegionList();
			region.setRegionId(Integer.parseInt(request.getParameter("regionId")));
			region.setRegionName(request.getParameter("regionName"));
			session.setAttribute("region", region);
		}
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/active_region",method = RequestMethod.GET)
	public String active_region(HttpSession session) {
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		session.removeAttribute("ScreenDetails");
		ScreenDetails details=new ScreenDetails();
		details.setScreen_name("../region/active_region.jsp");
		details.setScreen_title("Active Region");
		details.setMain_menu("Regions");
		details.setSub_menu1("Active Regions");
		session.setAttribute("ScreenDetails", details);
		List<RegionList> active_region=regionDao.region_list(1);
		session.setAttribute("active_region", active_region);
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/deleteRegion",method = RequestMethod.POST)
	public @ResponseBody String deleteRegion(HttpSession session, HttpServletRequest request) {
	
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		int RegionId=Integer.parseInt(request.getParameter("RegionId"));
		System.out.println("RegionId :"+RegionId);
		String message=regionDao.deleteRegion(RegionId);
		userDao.activity_log("REGION", String.valueOf(RegionId), "DELETE", user.getUsername());
		return message;
	}
	
	@RequestMapping(value = "/addRegion",method = RequestMethod.POST)
	public @ResponseBody String addRegion(HttpSession session, HttpServletRequest request) 
	{	
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		String RegionName = request.getParameter("regionName");
		Region region = new Region();
		region.setRegionName(RegionName);
		String message=regionDao.create_region(region);		
		userDao.activity_log("REGION", RegionName, "ADD", user.getUsername());
		return message;
	}
	
	@RequestMapping(value = "/updateRegion",method = RequestMethod.POST)
	public @ResponseBody String updateRegion(HttpSession session, HttpServletRequest request) 
	{	
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		int RegionId=Integer.parseInt(request.getParameter("regionId"));		
		String RegionName = request.getParameter("regionName");
		System.out.println("RegionId :"+ RegionId);
		String message=regionDao.updateRegion(RegionId,RegionName);	
		userDao.activity_log("REGION", RegionName, "UPDATE", user.getUsername());
		return message;
	}
	
	@RequestMapping(value = "/updateRegionStatus",method = RequestMethod.POST)
	public @ResponseBody String updateRegionStatus(HttpSession session, HttpServletRequest request)
	{
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		int RegionId=Integer.parseInt(request.getParameter("regionId"));
		int RegionStatus=Integer.parseInt(request.getParameter("status"));
	    String message= regionDao.updateRegionStatus(RegionId,RegionStatus); 
	    userDao.activity_log("REGION", String.valueOf(RegionId), RegionStatus == 1 ? "ACTIVE" : "DEACTIVE", user.getUsername());
		return message;
    }
}


