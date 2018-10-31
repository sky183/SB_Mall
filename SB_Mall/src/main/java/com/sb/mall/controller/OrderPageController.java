package com.sb.mall.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.Order;
import com.sb.mall.model.Product;
import com.sb.mall.service.OrderService;

@Controller
public class OrderPageController {
	
	@Autowired
	OrderService orderService;

	@RequestMapping("order/insOrder")
	public ModelAndView order(Order order) {
		ModelAndView modelAndView = new ModelAndView();
		Product product = null;
		try {
			product = orderService.getProduct(order.getProductSeq());
		} catch (SQLException e) {
			System.out.println("구매물픔 등록에 실패하였습니다.");
			e.printStackTrace();
		}
		modelAndView.addObject("order",order);
		modelAndView.addObject("product", product);
		modelAndView.setViewName("orderPage");
		return modelAndView;
	}
	
}
