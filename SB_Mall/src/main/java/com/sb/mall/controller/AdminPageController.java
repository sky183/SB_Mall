package com.sb.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/adminPage")
public class AdminPageController {
	
	@RequestMapping(method=RequestMethod.GET)
	public String adminPage() {
		return "/admin/adminPage";
	}
	
	
}
