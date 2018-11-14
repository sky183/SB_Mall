package com.sb.mall.order.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sb.mall.order.model.Order;
import com.sb.mall.order.model.OrderOrderCommand;
import com.sb.mall.order.service.OrderCartService;

@Controller
public class OrderCartController {
	
	@Autowired
	OrderCartService orderCartService;
	
	@RequestMapping(value="order/addCart",produces="application/text; charset=utf8")
	@ResponseBody
	public String addCart(Order order) {
		try {
		orderCartService.addCart(order);
		}catch (SQLException e) {
			return "장바구니 추가에 실패하였습니다.";
		}
		return "상품이 장바구니에 추가되었습니다.";
	}
	
	@RequestMapping(value="order/deleteCart")
	public String deleteCart(OrderOrderCommand orderCommand) {
		
		List<Order> list = new ArrayList<Order>();
		for(Order order : orderCommand.getOrders() ) {
			if(order.getUserSeq()!=0) { //받아온 리스트중 0번유저(빈값) 제거
				list.add(order);
			}
		}
		System.out.println(list);
		try {
			orderCartService.deleteCart(list);
		} catch (SQLException e) {
			System.out.println("장바구니 삭제에 실패하였습니다.");
			e.printStackTrace();
			return "redirect:cart";
		}
		return "redirect:cart";
	}
	
}
