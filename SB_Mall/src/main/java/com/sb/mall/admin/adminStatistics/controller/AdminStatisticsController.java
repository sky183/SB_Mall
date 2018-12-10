package com.sb.mall.admin.adminStatistics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminStatisticsController {
	
	//총 영업 현황 불러오기
	@RequestMapping(value="/admin/adminStatistics", method=RequestMethod.GET)
	public ModelAndView main() {
		
		ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("admin/adminStatistics");
			
		//상단 메뉴 버튼 활성화
		modelAndView.addObject("adminStatistics", "active");
		
		return modelAndView;
	}
	
	//영업관리 페이지 컨트롤러 - totalReport salReport dailySal monthlySal weeklySal hourSal budget
	@RequestMapping(value="/admin/adminStatistics/{page}", method=RequestMethod.GET)
	public ModelAndView operationPage(@PathVariable String page) {
		
		ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("admin/adminStatistics/" + page);
		
		return modelAndView;
	}
	

}

