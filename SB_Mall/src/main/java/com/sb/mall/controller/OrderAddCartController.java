package com.sb.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sb.mall.model.Order;

@Controller
public class OrderAddCartController {
	
	
	@RequestMapping("store/order/addCart")
	@ResponseBody
	public String addCart(Order order) {
		System.out.println(order);
		return order.toString();
	}
	
}
