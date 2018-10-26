package com.sb.mall.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.StoreWriteCommend;

@Controller
@RequestMapping("/store/write")
public class StoreWriteController {
	

	@RequestMapping(method=RequestMethod.GET)
	public String storeWrite() {
		return  "/store/boardEditor";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView storeWriteDo(HttpServletRequest request,
			StoreWriteCommend storeWriteCommend) {
		ModelAndView modelAndView = new ModelAndView();
		//storeWriteCommend.getProduct().getProductName();
		//storeWriteCommend.getSalesBoard().getTitle();
		modelAndView.addObject("product", storeWriteCommend);
		modelAndView.setViewName("/store/result");
		return  modelAndView;
	}
	
}
