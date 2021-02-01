package com.preclaim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/setting")
public class settingController {

    @RequestMapping(value = "/setting", method = RequestMethod.GET)
    public String setting() {
        return "setting";
    }
    
    @RequestMapping(value = "/update_version", method = RequestMethod.GET)
    public String update_version() {
        return "update_version";
    }
}
