package com.sb.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.OrderDetail;
import com.sb.mall.service.OrderDetailService;

@Controller
public class OrderDetailListController {

	@Autowired
	private OrderDetailService orderDetailService;

	@RequestMapping("/orderDetailList")
	public ModelAndView getMemberList() throws Exception {

		ModelAndView modelAndView = new ModelAndView("/admin/adminPage");

		modelAndView.setViewName("orderDetail/orderDetailList");

		List<OrderDetail> orderDetails = orderDetailService.getOrderDetailList();

		modelAndView.addObject("orderDetails", orderDetails);

		return modelAndView;
	}

}
