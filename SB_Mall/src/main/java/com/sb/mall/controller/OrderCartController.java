package com.sb.mall.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sb.mall.model.Order;
import com.sb.mall.model.OrderList;
import com.sb.mall.service.OrderCartService;

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
	public String deleteCart(OrderList orderList) {
		List<Order> list = orderList.getOrderList();
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
