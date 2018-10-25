package com.sb.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/store/write")
public class StoreWriteController {
	

	@RequestMapping(method=RequestMethod.GET)
	public String storeWrite() {
		return  "/store/boardEditor";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView storeWriteDo(String sTitle, String sCode) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("sTitle", sTitle);
		modelAndView.addObject("sCode", sCode);
		modelAndView.setViewName("/store/result");
		return  modelAndView;
	}
	
}
