package com.sb.mall.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.Order;
import com.sb.mall.model.OrderList;
import com.sb.mall.model.Product;
import com.sb.mall.service.OrderCartService;
import com.sb.mall.service.OrderService;

@Controller
public class OrderPageController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	OrderCartService orderCartService;
	
	@RequestMapping(value="order/insOrder", method=RequestMethod.POST)
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
	
	@RequestMapping(value="order/insOrder" ,method=RequestMethod.GET)
	public String order() {
		return "redirect:/store";
	}
	
	@RequestMapping(value="order/cartOrder" ,method=RequestMethod.POST)
	public ModelAndView cartOrder(OrderList orderList) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("orderCartOrder");
		List<Order> paramList = orderList.getOrderList();
		System.out.println(orderList);
		List<Map<String,Object>> list = null;
		try {
			list = orderCartService.selectCartForOrder(paramList);
		} catch (SQLException e) {
			modelAndView.addObject("errorMsg", "주문목록 생성에 실패하였습니다.");
			e.printStackTrace();
		}
		int totalAmount=0;
		for(Map<String,Object> map : list) {
			totalAmount+=(int)map.get("price")*(int)map.get("quantity"); //주문금액 총합
		}
		modelAndView.addObject("totalAmount", totalAmount);
		modelAndView.addObject("orders", list);
		return modelAndView;
	}
	
	@RequestMapping(value="order/cartOrder" ,method=RequestMethod.GET)
	public String cartOrder() {
		return "redirect:/order/cart";
	}
	
}
