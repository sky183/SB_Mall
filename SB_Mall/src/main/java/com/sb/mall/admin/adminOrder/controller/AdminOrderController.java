package com.sb.mall.admin.adminOrder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.admin.adminOperation.service.AdminOperationService;

@Controller
@RequestMapping("/admin/adminOrder")
public class AdminOrderController {
	
	@Autowired
	AdminOperationService visitService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView admin() {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("");
		modelAndView.addObject("", "");
		
		return modelAndView;
	}

}

