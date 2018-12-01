package com.sb.mall.order.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.order.model.Order;
import com.sb.mall.order.model.OrderOrderCommand;
import com.sb.mall.order.service.OrderCartService;

@Controller
public class OrderCartController {
	
	@Autowired
	OrderCartService orderCartService;
	
	@RequestMapping(value="order/cart",method=RequestMethod.POST)
	@ResponseBody
	public String addCart(OrderOrderCommand orderCommand) {
		try {
		orderCartService.addCart(orderCommand);
		}catch (SQLException e) {
			System.out.println(e.getMessage());
			return "장바구니 추가에 실패하였습니다.";
		}
		return "상품이 장바구니에 추가되었습니다.";
	}
	
	@RequestMapping(value="order/cart/{userSeq}",method=RequestMethod.GET)
	public ModelAndView viewCart(@PathVariable("userSeq") int userSeq) {
		ModelAndView modelAndView = new ModelAndView();
		return modelAndView;
	}
	
	@RequestMapping(value="order/cart",method=RequestMethod.DELETE)
	public String deleteCart(OrderOrderCommand orderCommand) {
		
		List<Order> list = new ArrayList<Order>();
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
	
	@RequestMapping(value="order/cart",method=RequestMethod.PUT)
	@ResponseBody
	public String modifyCartStock() {
		return "";
	}
	
}
