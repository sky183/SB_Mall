package com.sb.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.service.OrderDetailAmountService;
import com.sb.mall.service.OrderDetailAverageService;

@Controller
@RequestMapping("/adminPage")
public class AdminPageController {
	
	@Autowired
	OrderDetailAmountService amountService;
	@Autowired
	OrderDetailAverageService averageService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView adminPage() {
		
		ModelAndView modelAndView = new ModelAndView("/admin/adminPage");
		
		String thisMonth = amountService.getAmount(0);
		String preMonth = amountService.getAmount(1);
		String thisMonthAverage = averageService.getAverage();
		
		modelAndView.addObject("thisMonth", thisMonth);
		modelAndView.addObject("preMonth", preMonth);
		modelAndView.addObject("thisMonthAverage", thisMonthAverage);
		
		return modelAndView;
	}
	
	
}
