package com.preclaim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/role")
public class roleController {

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add() {
        return "role/add";
    }    
}
