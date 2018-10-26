package com.sb.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StoreListViewController {
	
	@RequestMapping("store/boardListView")
	public ModelAndView getListView() {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println(1);
		modelAndView.setViewName("store/boardListView");
		System.out.println(2);
		return modelAndView;
	}

}
