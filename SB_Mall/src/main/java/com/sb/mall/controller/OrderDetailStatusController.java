package com.sb.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sb.mall.model.OrderDetail;
import com.sb.mall.service.OrderDetailStatusService;

@Controller
public class OrderDetailStatusController {

	@Autowired
	private OrderDetailStatusService service;

	@RequestMapping("/orderDetailStatus/{orderDetailNum}")
	@ResponseBody
	public OrderDetail orderDetail(@PathVariable("orderDetailNum") String orderDetailNum) throws Exception {

		OrderDetail orderDetail;

		orderDetail = service.getOrderDetail(orderDetailNum);

		return orderDetail;
	}

}
