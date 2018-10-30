package com.sb.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.Order;
import com.sb.mall.service.OrderService;

@Controller
public class OrderListController {

	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/orderList/{orderDetailNum}")
	public ModelAndView orderDetail(@PathVariable("orderDetailNum") String orderDetailNum) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView("/admin/adminPage");
		
		List<Order> orders = orderService.getOrderByDetailNum(orderDetailNum);
		
		modelAndView.setViewName("order/orderList");
		
		modelAndView.addObject("orders", orders);

		return modelAndView;
	}
	

}