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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.preclaim.config.Config;
import com.preclaim.dao.CaseDao;
import com.preclaim.dao.IntimationTypeDao;
import com.preclaim.dao.InvestigationTypeDao;
import com.preclaim.dao.LocationDao;
import com.preclaim.dao.UserDAO;
import com.preclaim.models.CaseDetails;
import com.preclaim.models.ScreenDetails;
import com.preclaim.models.UserDetails;

@Controller
@RequestMapping(value = "/message")
public class CaseController {

	@Autowired
	CaseDao caseDao;
	
	@Autowired
	UserDAO userDao;
	
	@Autowired
	InvestigationTypeDao investigationDao;
	
	@Autowired
	IntimationTypeDao intimationTypeDao;
	
	@Autowired
	LocationDao locationDao;
	
    @RequestMapping(value = "/import_case", method = RequestMethod.GET)
    public String import_case(HttpSession session) {
    	UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		
		session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../message/import_case.jsp");
    	details.setScreen_title("Import Case");
    	details.setMain_menu("Case Management");
    	details.setSub_menu1("Bulk case uploads");
    	details.setSub_menu2("App Users");
    	details.setSub_menu2_path("/app_user/app_user");
    	session.setAttribute("ScreenDetails", details);
 
    	return "common/templatecontent";
    }
    
    @RequestMapping(value = "/add_message", method = RequestMethod.GET)
    public String add_message(HttpSession session, HttpServletRequest request) {
    	UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
    	session.removeAttribute("ScreenDetails");
    	
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../message/add_message.jsp");
    	details.setScreen_title("Add Cases");
    	details.setMain_menu("Case Management");
    	details.setSub_menu1("Create Case");
    	details.setSub_menu2("Manage Cases");
    	details.setSub_menu2_path("../message/pending_message.jsp");
    	session.setAttribute("ScreenDetails", details);    	
    	
    	session.setAttribute("investigation_list", investigationDao.getActiveInvestigationList());
    	session.setAttribute("intimation_list", intimationTypeDao.getActiveIntimationType());
    	session.setAttribute("location_list", locationDao.getActiveLocationList());
    	
    	return "common/templatecontent";
    }
    
    @RequestMapping(value = "/pending_message", method = RequestMethod.GET)
    public String pending_message(HttpSession session) {
    	UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		
		session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../message/pending_message.jsp");
    	details.setScreen_title("Pending Cases Lists");
    	details.setMain_menu("Case Management");
    	details.setSub_menu1("RCU Pending Cases");
    	session.setAttribute("ScreenDetails", details);
    	
    	session.setAttribute("pendingCaseList", caseDao.getPendingCaseList(user.getUsername()));
    	session.setAttribute("investigation_list", investigationDao.getActiveInvestigationList());
    	session.setAttribute("intimation_list", intimationTypeDao.getActiveIntimationType());
    	
    	return "common/templatecontent";
    }
  
    @RequestMapping(value = "/active_message", method = RequestMethod.GET)
    public String active_message(HttpSession session) {
    	UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		session.removeAttribute("ScreenDetails");
    	
		ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../message/active_message.jsp");
    	details.setScreen_title("Active Cases Lists");
    	details.setMain_menu("Case Management");
    	details.setSub_menu1("RCU Active Cases");
    	session.setAttribute("ScreenDetails", details);
    	
    	session.setAttribute("activeCaseList", caseDao.getAssignedCaseList(user.getUsername()));
    	session.setAttribute("investigation_list", investigationDao.getActiveInvestigationList());
    	session.setAttribute("intimation_list", intimationTypeDao.getActiveIntimationType());
    	
    	return "common/templatecontent";
    }
    
    @RequestMapping(value = "/assigned_message", method = RequestMethod.GET)
    public String assigned_message(HttpSession session) {
    	UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		
		session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../message/assigned_message.jsp");
    	details.setScreen_title("Assigned Cases Lists");
    	details.setMain_menu("Case Management");
    	details.setSub_menu1("RCU Assigned Cases");
    	session.setAttribute("ScreenDetails", details);
        
    	session.setAttribute("assignCaseList", caseDao.getAssignedCaseList(user.getUsername()));
    	session.setAttribute("investigation_list", investigationDao.getActiveInvestigationList());
    	session.setAttribute("intimation_list", intimationTypeDao.getActiveIntimationType());
    	
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
		details.setScreen_name("../message/import_case.jsp");
    	details.setScreen_title("Import Case");
    	details.setMain_menu("Case Management");
    	details.setSub_menu1("Bulk case uploads");
    	details.setSub_menu2("App Users");
    	details.setSub_menu2_path("/app_user/app_user");
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
				caseDao.addBulkUpload(filename);
				details.setSuccess_message1("File uploaded successfully");		
			 	userDao.activity_log("RCUTEAM", "Excel", "BULKUPLOAD", user.getUsername());	
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
				details.setError_message1("File Uploading failed");
			}    	
		}
	  
		return "common/templatecontent";
	}
    
    @RequestMapping(value = "/addMessage",method = RequestMethod.POST)
   	public @ResponseBody String addMessage(HttpSession session, HttpServletRequest request) 
   	{			
    	UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
       	
		CaseDetails caseDetail=new CaseDetails();
       	caseDetail.setPolicyNumber(request.getParameter("policyNumber"));
       	caseDetail.setInvestigationCategory(request.getParameter("msgCategory"));
       	caseDetail.setInsuredName( request.getParameter("insuredName"));
       	caseDetail.setInsuredDOD(request.getParameter("insuredDOD"));
       	caseDetail.setInsuredDOB(request.getParameter("insuredDOB"));
       	caseDetail.setSumAssured(Integer.parseInt(request.getParameter("sumAssured")));
       	caseDetail.setIntimationType( request.getParameter("msgIntimationType"));
       	caseDetail.setClaimantCity(request.getParameter("claimantCity"));
       	caseDetail.setClaimantState(request.getParameter("claimantState"));
       	caseDetail.setClaimantZone(request.getParameter("claimantZone"));
       	caseDetail.setNominee_name(request.getParameter("nomineeName"));
       	caseDetail.setNomineeContactNumber(request.getParameter("nomineeMob"));
       	caseDetail.setNominee_address(request.getParameter("nomineeAdd"));
       	caseDetail.setInsured_address(request.getParameter("insuredAdd"));
		caseDetail.setCreatedBy(user.getUsername()); 
       	String message= caseDao.addcase(caseDetail);
       	userDao.activity_log("CASE HISTORY", caseDetail.getPolicyNumber(), "ADD CASE", user.getUsername());
   		
       	return message;
   	}
    
    @RequestMapping(value = "/deleteMessage",method = RequestMethod.POST)
    public @ResponseBody String deleteMessage(HttpServletRequest request,HttpSession session) 
    {
		int caseId=Integer.parseInt(request.getParameter("msgId"));
	    String message=caseDao.deleteCase(caseId);  	
	    return message;
    }
    
    @RequestMapping(value = "/edit",method = RequestMethod.GET)
   	public String edit(HttpSession session, HttpServletRequest request) 
   	{			
    	UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		
		session.removeAttribute("ScreenDetails"); 	
		ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../message/edit_message.jsp");
    	details.setScreen_title("Edit Case");
    	details.setMain_menu("Case Management");
    	details.setSub_menu1("Create Case");
    	details.setSub_menu2("Manage Cases");
    	details.setSub_menu2_path("../message/pending_message.jsp");
    	session.setAttribute("ScreenDetails", details);    	
    	
    	session.setAttribute("investigation_list", investigationDao.getActiveInvestigationList());
    	session.setAttribute("intimation_list", intimationTypeDao.getActiveIntimationType());
    	session.setAttribute("case_detail",caseDao.getCaseDetail(Integer.parseInt(request.getParameter("caseId"))));
		
		return "common/templatecontent";
   	}
    
    @RequestMapping(value = "/updateMessageDetails",method = RequestMethod.POST)
    public String updateMessageDetails(HttpSession session, HttpServletRequest request) {
    	UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
       	
		CaseDetails caseDetail=new CaseDetails();
       	caseDetail.setPolicyNumber(request.getParameter("policyNumber"));
       	caseDetail.setInvestigationCategory(request.getParameter("msgCategory"));
       	caseDetail.setInsuredName( request.getParameter("insuredName"));
       	caseDetail.setInsuredDOD(request.getParameter("insuredDOD"));
       	caseDetail.setInsuredDOB(request.getParameter("insuredDOB"));
       	caseDetail.setSumAssured(Integer.parseInt(request.getParameter("sumAssured")));
       	caseDetail.setIntimationType( request.getParameter("msgIntimationType"));
       	caseDetail.setClaimantCity(request.getParameter("claimantCity"));
       	caseDetail.setClaimantState(request.getParameter("claimantState"));
       	caseDetail.setClaimantZone(request.getParameter("claimantZone"));
       	caseDetail.setNominee_name(request.getParameter("nomineeName"));
       	caseDetail.setNomineeContactNumber(request.getParameter("nomineeMob"));
       	caseDetail.setNominee_address(request.getParameter("nomineeAdd"));
       	caseDetail.setInsured_address(request.getParameter("insuredAdd"));
		caseDetail.setCreatedBy(user.getUsername()); 
       	String message= caseDao.updateCaseDetails(caseDetail);
     	userDao.activity_log("CASE HISTORY", caseDetail.getPolicyNumber(), "EDIT CASE", user.getUsername());
   		return message;
    }
    
    @RequestMapping(value = "/assignToRM",method = RequestMethod.POST)
    public @ResponseBody String assignToRM(HttpServletRequest request,HttpSession session) 
    {
    	UserDetails user = (UserDetails) session.getAttribute("User_Login");
		
    	String[] paramValues = request.getParameterValues("caseList[]");
		int caseLen = paramValues.length;
		String caseList = "";
		for (int i = 0; i < caseLen; i++)
			caseList += "'" + paramValues[i] + "',";
		caseList = caseList.substring(0, caseList.length() - 1);
	 	userDao.activity_log("CASE HISTORY","", "ASSIGN CASE", user.getUsername());
		return caseDao.assignToRM(caseList, "ARM", user.getUsername());
		
    }
}
