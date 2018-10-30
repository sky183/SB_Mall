package com.sb.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.PageListView;
import com.sb.mall.service.GetPagingService;

@Controller
public class MemberListController {
	
	@Autowired
	private GetPagingService service;
	
	static final int COUNT_PER_PAGE = 10;

	@RequestMapping("/memberList")
	public ModelAndView getMemberList(@RequestParam(value="page", defaultValue="1") int pageNumber)
			throws Exception {
		

		ModelAndView modelAndView = new ModelAndView("/admin/adminPage");

			modelAndView.setViewName("member/memberList");
			
			PageListView listView = service.getList(pageNumber, COUNT_PER_PAGE, "memberDao");


			modelAndView.addObject("viewData", listView);

		return modelAndView;
	}
	
	

}
