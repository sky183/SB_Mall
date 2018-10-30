package com.sb.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("order/cart")
public class OrderCartListController {
	
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView viewCartList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("orderCart");
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView orderCartList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("orderCart");
		return modelAndView;
	}
	
}
