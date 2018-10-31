package com.sb.mall.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.MemberInfo;
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
	
	@RequestMapping("order/cartOrder")
	public ModelAndView cartOrder(HttpSession session,OrderList orderList) {
		MemberInfo memberInfo = (MemberInfo)session.getAttribute("memberInfo");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("orderCartOrder");
		List<Order> paramList = orderList.getOrderList();
		/*List<Order> orderList = new ArrayList<Order>();
		for(int i=0;i<selProduct.length;i++) {
			Order order = new Order();
			order.setProductSeq(Integer.parseInt(selProduct[i].split("/")[0]));
			order.setOption(selProduct[i].split("/")[1]);
			order.setUserSeq(memberInfo.getUserSeq());
			orderList.add(order);
		}*/
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
			totalAmount+=(int)map.get("price")*(int)map.get("quantity");
			System.out.println(totalAmount);
		}
		modelAndView.addObject("totalAmount", totalAmount);
		modelAndView.addObject("orders", list);
		return modelAndView;
	}
	
}
