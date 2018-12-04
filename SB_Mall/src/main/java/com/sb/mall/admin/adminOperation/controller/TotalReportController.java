package com.sb.mall.admin.adminOperation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.admin.adminOperation.service.AdminOperationService;

@Controller
public class TotalReportController {

	@Autowired
	AdminOperationService operationService;

	// 영업 현황 ajax
	@RequestMapping(value = "/admin/adminOperation/totalReport/loadBottomReport", method = RequestMethod.GET)
	public ModelAndView loadBottomReport(@RequestParam(value="nowDate", required=false) String nowDate) {

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("admin/adminOperation/totalReport/loadBottomReport");

		return modelAndView;
	}

}
