package com.sb.mall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.MemberInfo;
import com.sb.mall.model.Order;
import com.sb.mall.model.OrderDetail;
import com.sb.mall.service.MemberListService;
import com.sb.mall.service.OrderDetailService;
import com.sb.mall.service.OrderService;

@Controller
public class AdminListController {

	@Autowired
	private MemberListService memService;

	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private OrderService orderService;

	@RequestMapping("/memberList/viewType")
	public ModelAndView getMemberList(@RequestParam(value = "type", defaultValue = "orderList") String type)
			throws Exception {

		ModelAndView modelAndView = new ModelAndView("/admin/adminPage");

		switch (type) {

		case "memberList":

			modelAndView.setViewName("member/memberList");

			List<MemberInfo> members = memService.getMemberList();

			modelAndView.addObject("members", members);

			break;

		case "orderList":
			modelAndView.setViewName("orderDetail/orderDetailList");

			List<OrderDetail> orderDetails = orderDetailService.getOrderDetailList();

			modelAndView.addObject("orderDetails", orderDetails);

			break;
		}
		return modelAndView;
	}
	
	@RequestMapping("/orderDetail/{orderDetailNum}")
	public ModelAndView orderDetail(@PathVariable("orderDetailNum") String orderDetailNum,
			HttpServletRequest request, HttpSession session) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView("/admin/adminPage");
		
		List<Order> orders = orderService.getOrderByDetailNum(orderDetailNum);
		
		modelAndView.setViewName("order/orderList");
		
		modelAndView.addObject("orders", orders);

		return modelAndView;
	}
	

}
