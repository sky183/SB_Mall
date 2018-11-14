package com.sb.mall.order.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
		modelAndView.setViewName("order/orderInsOrderPage");
		return modelAndView;
	}
	
	@RequestMapping(value="order/insOrder" ,method=RequestMethod.GET)
	public String order() {
		return "redirect:/store";
	}
	
	@RequestMapping(value="order/cartOrder" ,method=RequestMethod.POST)
	public ModelAndView cartOrder(OrderOrderCommand orderCommand) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("order/orderCartOrderPage");
		List<Order> orders = new ArrayList<Order>();
		for(Order order : orderCommand.getOrders() ) {
			if(order.getUserSeq()!=0) { //받아온 리스트중 0번유저(빈값) 제거
				orders.add(order);
			}
		}
		System.out.println(orders);
		List<Map<String,Object>> list = null;
		try {
			list = orderCartService.selectCartForOrder(orders);
		} catch (SQLException e) {
			modelAndView.addObject("errorMsg", "주문목록 생성에 실패하였습니다.");
			e.printStackTrace();
		}
		int totalAmount=0;
		for(Map<String,Object> map : list) {
			totalAmount+=(int)map.get("price")*(int)map.get("quantity"); //주문금액 총합
		}
		for(Order order : orders) {
			totalAmount+=order.getSalePrice();
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
