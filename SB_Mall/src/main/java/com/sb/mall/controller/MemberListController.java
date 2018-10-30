package com.sb.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.MemberInfo;
import com.sb.mall.service.MemberListService;

@Controller
public class MemberListController {

	@Autowired
	private MemberListService memService;


	@RequestMapping("/memberList")
	public ModelAndView getMemberList()
			throws Exception {

		ModelAndView modelAndView = new ModelAndView("/admin/adminPage");

			modelAndView.setViewName("member/memberList");

			List<MemberInfo> members = memService.getMemberList();

			modelAndView.addObject("members", members);

		return modelAndView;
	}
	
	

}
