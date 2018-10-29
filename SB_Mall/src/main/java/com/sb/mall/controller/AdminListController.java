package com.sb.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.MemberInfo;
import com.sb.mall.model.OrderDetail;
import com.sb.mall.service.MemberListService;
import com.sb.mall.service.OrderDetailListService;

@Controller
public class AdminListController {

	@Autowired
	private MemberListService memService;
	
	@Autowired
	private OrderDetailListService orderService;

	@RequestMapping("/memberList/viewType")
	public ModelAndView getMemberList(@RequestParam(value = "type", defaultValue = "orderList") String type)
			throws Exception {

		ModelAndView modelAndView = new ModelAndView("/admin/adminPage");
		
		switch (type) {
		
		case "memberList":
			
			List<MemberInfo> members = memService.getMemberList();

			modelAndView.addObject("members", members);
			
			break;
			
		case "orderList":
			modelAndView.setViewName("member/viewTypeJSON");
			
			List<OrderDetail> orderDetails = orderService.getOrderDetailList();

			modelAndView.addObject("orderDetails", orderDetails);
			
			break;
	}
		
		


		return modelAndView;
	}

}
