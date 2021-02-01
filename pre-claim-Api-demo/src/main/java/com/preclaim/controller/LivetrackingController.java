package com.preclaim.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.preclaim.models.ScreenDetails;

@Controller
@RequestMapping(value = "/livetracking")
public class LivetrackingController {

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(HttpSession session) {
    	session.removeAttribute("ScreenDetails");    	
		ScreenDetails details = new ScreenDetails();
    	details.setScreen_name("../livetracking/index.jsp");
    	details.setScreen_title("App Users Lists");
    	details.setMain_menu("Live Tracking");
    	session.setAttribute("ScreenDetails", details);
		return "common/templatecontent";
    }    
}
