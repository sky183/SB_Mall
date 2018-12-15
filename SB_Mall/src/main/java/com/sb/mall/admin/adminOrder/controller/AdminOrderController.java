package com.sb.mall.admin.adminOrder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminOrderController {
	
	//주문 페이지 불러오기
	@RequestMapping(value="/admin/adminOrder", method=RequestMethod.GET)
	public ModelAndView main() {
		
		ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("admin/adminOrder");
			
		//상단 메뉴 버튼 활성화
		modelAndView.addObject("adminOrder", "active");
		
		return modelAndView;
	}
	
	//주문 각 페이지 컨트롤러
	@RequestMapping(value="/admin/adminOrder/{page}", method=RequestMethod.GET)
	public ModelAndView adminOrderPage(@PathVariable String page) {
		
		ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("admin/adminOrder/" + page);
		
		return modelAndView;
	}

}

