package com.sb.mall.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.admin.service.AdminOperationService;

@Controller
public class AdminOperationController {
	
	@Autowired
	AdminOperationService salesService;
	
	//영업관리 컨트롤러
	@RequestMapping(value="/admin/adminOperation", method=RequestMethod.GET)
	public ModelAndView main() {
		
		ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("admin/adminOperation");
			
		//해당 페이지 버튼 활성화
		modelAndView.addObject("adminOperation", "active");
		
		return modelAndView;
	}
	
	//영업관리 페이지 컨트롤러
	@RequestMapping(value="/admin/adminOperation/{page}", method=RequestMethod.GET)
	public ModelAndView operationPage(@PathVariable String page) {
		
		ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("admin/adminOperation/" + page);
		//해당 페이지 버튼 활성화
		modelAndView.addObject("adminOperation", "active");
		
		return modelAndView;
	}
	

}

