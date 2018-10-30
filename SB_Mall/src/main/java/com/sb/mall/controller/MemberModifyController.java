package com.sb.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.MemberInfo;
import com.sb.mall.service.GetPagingService;

@Controller
public class MemberModifyController {
	
	@Autowired
	private GetPagingService service;
	
	@RequestMapping("/memberModify")
	public ModelAndView getMemberModify(MemberInfo memberInfo){
		
		ModelAndView modelAndView = new ModelAndView("member/memberModify");
		
		modelAndView.addObject(memberInfo);
		
//		return "member/memberModify";
		return modelAndView;
	}
	
}
