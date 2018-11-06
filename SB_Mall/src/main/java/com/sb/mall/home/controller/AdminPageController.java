package com.sb.mall.home.controller;

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
		String secondMonth = amountService.getAmount(2);
		String thirdMonth = amountService.getAmount(3);
		String fourthMonth = amountService.getAmount(4);
		String fifthMonth = amountService.getAmount(5);
		String sixthMonth = amountService.getAmount(6);
		String seventhMonth = amountService.getAmount(7);
		String eighthMonth = amountService.getAmount(8);
		String ninethMonth = amountService.getAmount(9);
		String tenthMonth = amountService.getAmount(10);
		String thisMonthAverage = averageService.getAverage(0);
		String preMonthAverage = averageService.getAverage(1);
		
		modelAndView.addObject("thisMonth", thisMonth);
		modelAndView.addObject("preMonth", preMonth);
		modelAndView.addObject("secondMonth", secondMonth);
		modelAndView.addObject("thirdMonth", thirdMonth);
		modelAndView.addObject("fourthMonth", fourthMonth);
		modelAndView.addObject("fifthMonth", fifthMonth);
		modelAndView.addObject("sixthMonth", sixthMonth);
		modelAndView.addObject("seventhMonth", seventhMonth);
		modelAndView.addObject("eighthMonth", eighthMonth);
		modelAndView.addObject("ninethMonth", ninethMonth);
		modelAndView.addObject("tenthMonth", tenthMonth);
		modelAndView.addObject("thisMonthAverage", thisMonthAverage);
		modelAndView.addObject("preMonthAverage", preMonthAverage);
		
		return modelAndView;
	}
	
	
}
