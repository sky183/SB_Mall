package com.sb.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.MemberInfo;
import com.sb.mall.service.MemberListService;

@Controller
public class MemberListController {

	@Autowired
	private MemberListService service;

	@RequestMapping("/memberList/viewType")
	public ModelAndView getMemberList(@RequestParam(value = "type", defaultValue = "orderList") String type)
			throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		
		switch (type) {
		case "memberList":
			modelAndView.setViewName("member/memberList");
			break;
		case "orderList":
			modelAndView.setViewName("member/viewTypeJSON");
			break;
	}
		
		List<MemberInfo> members = service.getMemberList();

		modelAndView.addObject("members", members);



		return modelAndView;
	}

}
