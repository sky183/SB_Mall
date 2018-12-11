package com.sb.mall.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sb.mall.order.service.OrderService;

@Controller
public class OrderOrderController {
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value="order/orders/insert",method=RequestMethod.POST)
	@ResponseBody
	public String order(String orders) {
		String msg = "결제가 완료되었습니다."; 
		orderService.insertOrders(orders);
		return msg; 
	}
	
	/*@RequestMapping(value="order/testOrder",method=RequestMethod.POST)
	public String testOrder(HttpSession session) {
		MemberInfo memberInfo = (MemberInfo)session.getAttribute("memberInfo");
		try {
			orderService.insertOrdersAndDetail(memberInfo.getUserSeq());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:/store"; 
	}*/
		
	
}
