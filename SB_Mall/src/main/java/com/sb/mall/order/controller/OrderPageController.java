package com.sb.mall.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.order.model.Order;
import com.sb.mall.order.model.OrderOrderCommand;
import com.sb.mall.order.service.OrderCartService;
import com.sb.mall.order.service.OrderService;
import com.sb.mall.store.model.Product;

@Controller
public class OrderPageController {
	
	@Autowired
	OrderService orderService;
	@Autowired
	OrderCartService orderCartService;
	
	@RequestMapping(value="order/order", method=RequestMethod.POST)
	public ModelAndView orderCartList(OrderOrderCommand orderCommand) {
		ModelAndView modelAndView = new ModelAndView();
		List<Order> list = orderCommand.getOrders();
		modelAndView.addObject("orders",list);
		modelAndView.setViewName("order/orderInsOrderPage");
		return modelAndView;
	}
	
	@RequestMapping(value="order/insOrder", method=RequestMethod.POST)
	public ModelAndView order(Order order) {
		ModelAndView modelAndView = new ModelAndView();
		Product product = null;
		modelAndView.addObject("order",order);
		modelAndView.addObject("product", product);
		modelAndView.setViewName("order/orderInsOrderPage");
		return modelAndView;
	}
	
	@RequestMapping(value="order/insOrder" ,method=RequestMethod.GET)
	public String order() {
		return "redirect:/store";
	}
	
	@RequestMapping(value="order/cartOrder" ,method=RequestMethod.POST)
	public ModelAndView cartOrder(List<Order> list) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("order/orderCartOrderPage");
		modelAndView.addObject("orders", list);
		return modelAndView;
	}
	
	@RequestMapping(value="order/cartOrder" ,method=RequestMethod.GET)
	public String cartOrder() {
		return "redirect:/order/cart";
	}
	
}
