package com.sb.mall.member.service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.home.model.PageListView;

@Controller
public class MemberOrderListController {
	
	@RequestMapping(value="/member/orderList",method=RequestMethod.GET)
	public ModelAndView getOrderList() {
		ModelAndView modelAndView = new ModelAndView();
		PageListView list;
		return modelAndView;
	}
	
	@RequestMapping(value="/member/orderDetailList",method=RequestMethod.GET)
	public ModelAndView getOrderDetailList() {
		ModelAndView modelAndView = new ModelAndView();
		PageListView list;
		return modelAndView;
	}

}
