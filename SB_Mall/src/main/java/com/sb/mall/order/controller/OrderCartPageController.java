package com.sb.mall.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.order.service.OrderCartService;

@Controller
@RequestMapping("order/cart")
public class OrderCartPageController {
	
	@Autowired
	OrderCartService orderCartService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String viewCartList() {
		
		return "view/orderCart";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView orderCartList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:order/cart");
		return modelAndView;
	}
	
}
