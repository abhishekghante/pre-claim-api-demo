package com.preclaim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.preclaim.dao.ChannelDao;
import com.preclaim.dao.UserDAO;
import com.preclaim.models.Channel;
import com.preclaim.models.ChannelList;
import com.preclaim.models.ScreenDetails;
import com.preclaim.models.UserDetails;

@Controller
@RequestMapping(value = "/channel")
public class ChannelController {

	@Autowired
	private ChannelDao channelDao;
	
	@Autowired
	private UserDAO userDao;

	@RequestMapping(value = "/add_channel", method = RequestMethod.GET)
	public String add_channel(HttpSession session) {
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		session.removeAttribute("ScreenDetails");
		ScreenDetails details = new ScreenDetails();
		details.setScreen_name("../channel/add_channel.jsp");
		details.setScreen_title("Add Channel");
		details.setMain_menu("Channels");
		details.setSub_menu1("Add Channel");
		details.setSub_menu2("Manage Channels");
		details.setSub_menu2_path("/channel/pending_channel");
		session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
	}

	@RequestMapping(value = "/pending_channel", method = RequestMethod.GET)
	public String pending_channel(HttpSession session, HttpServletRequest request) {
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		session.removeAttribute("ScreenDetails");
		ScreenDetails details = new ScreenDetails();
		details.setScreen_name("../channel/pending_channel.jsp");
		details.setScreen_title("Pending Channels");
		details.setMain_menu("Channels");
		details.setSub_menu1("Pending Channels");
		session.setAttribute("ScreenDetails", details);
		List<ChannelList> pending_list= channelDao.channel_list(0);
    	session.setAttribute("pending_channel", pending_list);
    	
    	if(request.getParameter("channelCode")!= null && request.getParameter("channelName") != null)
    	{
	    	ChannelList channel = new ChannelList();
			channel.setChannelCode(request.getParameter("channelCode"));
			channel.setChannelName(request.getParameter("channelName"));
			channel.setChannelId(Integer.parseInt(request.getParameter("channelId")));
			session.setAttribute("channel", channel);
    	}
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/active_channel", method = RequestMethod.GET)
	public String active_channel(HttpSession session) {
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		session.removeAttribute("ScreenDetails");
		ScreenDetails details = new ScreenDetails();
		details.setScreen_name("../channel/active_channel.jsp");
		details.setScreen_title("Active Channels");
		details.setMain_menu("Channels");
		details.setSub_menu1("Active Channels");
		session.setAttribute("ScreenDetails", details);
		List<ChannelList> active_list= channelDao.channel_list(1);
    	session.setAttribute("active_list", active_list);		
		return "common/templatecontent";
	}
	
	@RequestMapping(value = "/addChannel",method = RequestMethod.POST)
	public @ResponseBody String addChannel(HttpSession session, HttpServletRequest request) 
	{	
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		String ChannelName = request.getParameter("channelName");
		String ChannelCode=request.getParameter("channelCode");
		Channel channel=new Channel();
		channel.setChannelName(ChannelName);;
		channel.setChannelCode(ChannelCode);
		String message =channelDao.create_channel(channel);		
		userDao.activity_log("CHANNEL", ChannelCode, "ADD", user.getUsername());
		return message;
	}

	@RequestMapping(value = "/deleteChannel", method = RequestMethod.POST)
	public @ResponseBody String deleteChannel(HttpSession session, HttpServletRequest request)
	{
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		int channelId = Integer.parseInt(request.getParameter("channelId"));
		String message = channelDao.deleteChannel(channelId);
		userDao.activity_log("CHANNEL", String.valueOf(channelId), "DELETE", user.getUsername());
		return message;
	}
	
	@RequestMapping(value = "/updateChannel",method = RequestMethod.POST)
	public @ResponseBody String updateChannel(HttpSession session, HttpServletRequest request) 
	{	
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		String channelCode = request.getParameter("channelCode");		
		String channelName = request.getParameter("channelName");
		int channelId = Integer.parseInt(request.getParameter("channelId"));
		String message = channelDao.updateChannel(channelName, channelCode, channelId);	
		userDao.activity_log("CHANNEL", String.valueOf(channelId), "UPDATE", user.getUsername());
		return message;
	}
	@RequestMapping(value = "/updateChannelStatus",method = RequestMethod.POST)
	public @ResponseBody String updateChannelStatus(HttpSession session, HttpServletRequest request) 
	{	
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		int channelId =Integer.parseInt(request.getParameter("channelId"));		
		int status =Integer.parseInt(request.getParameter("status"));
		String message=channelDao.updateChannelStatus(channelId, status);
	    userDao.activity_log("CHANNEL", String.valueOf(channelId), status == 1 ? "ACTIVE" : "DEACTIVE", user.getUsername());
		return message;
	}
	
	
	
}
