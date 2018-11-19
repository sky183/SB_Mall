package com.sb.mall.home.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.order.service.OrderDetailAmountService;
import com.sb.mall.order.service.OrderDetailAverageService;


@Controller
@RequestMapping("/admin/adminPage")
public class AdminPageController {
	
	@Autowired
	OrderDetailAmountService amountService;
	@Autowired
	OrderDetailAverageService averageService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView adminPage() {
		
		ModelAndView modelAndView = new ModelAndView("/view/adminPage");
		
		List<String> salAmount = new ArrayList();
		List<String> salAverage = new ArrayList();
		
		for (int i = 0; i <= 11; i++) {
			salAmount.add(amountService.getAmount(i));
			salAverage.add(averageService.getAverage(i));
		}
		
		modelAndView.addObject("salAmount", salAmount);
		modelAndView.addObject("salAverage", salAverage);
		
		return modelAndView;
	}
	
	
}
