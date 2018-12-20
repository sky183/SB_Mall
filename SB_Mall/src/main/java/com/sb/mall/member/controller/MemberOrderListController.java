package com.sb.mall.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.home.model.PageListView;
import com.sb.mall.member.service.MemberOrderListService;

@Controller
public class MemberOrderListController {
	
	@Autowired
	MemberOrderListService memberOrderListService;
	
	@RequestMapping(value="/member/orderList",method=RequestMethod.GET)
	public ModelAndView getOrderList() {
		ModelAndView modelAndView = new ModelAndView();
		return modelAndView;
	}
	
	@RequestMapping(value="/member/orderDetailList",method=RequestMethod.GET)
	public ModelAndView getOrderDetailList() {
		ModelAndView modelAndView = new ModelAndView();
		return modelAndView;
	}

}
