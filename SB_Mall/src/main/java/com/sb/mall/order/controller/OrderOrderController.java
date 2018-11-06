package com.sb.mall.order.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.sb.mall.member.model.MemberInfo;
import com.sb.mall.order.model.OrderOrderCommand;
import com.sb.mall.order.service.OrderService;

@Controller
public class OrderOrderController {
	
	@Autowired
	OrderService orderService;

	@RequestMapping(value="order/insOrder/complete",method=RequestMethod.POST)
	public ModelAndView insOrder(OrderOrderCommand command,HttpSession session){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("order/orderCompletePage");
		MemberInfo memberInfo = (MemberInfo)session.getAttribute("memberInfo");
		RedirectView redirectView = new RedirectView();
		redirectView.setExposeModelAttributes(false); //redirect시 get 파라미터값 보이지 않게해줌
		if(memberInfo==null) { // 로그인세션 없을시 로그인화면으로 리다이렉트
			redirectView.setUrl("redirect:/Login");
			modelAndView.addObject("errorMsg","로그인이 필요합니다.");
			modelAndView.setView(redirectView);
			return modelAndView;
		}
		try {
			orderService.insertOrderAndDetail(command);
		} catch (SQLException e) {
			modelAndView.addObject("message","주문에 실패하였습니다.");
			System.out.println("주문에 실패하였습니다.");
			e.printStackTrace();
			return modelAndView;
		}
		modelAndView.addObject("message", "주문이 완료되었습니다.");
		return modelAndView;
	}
	
	@RequestMapping(value="order/insOrder/complete",method=RequestMethod.GET)
	public String insOrder() {
		return "redirect:/store"; 
	}
	
	@RequestMapping(value="order/cartOrder/complete",method=RequestMethod.POST)
	public ModelAndView cartOrder(OrderOrderCommand command) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("orderCompletePage");
		try {
			orderService.insertOrdersAndDetail(command);
		} catch (SQLException e) {
			modelAndView.addObject("message","주문에 실패하였습니다.");
			System.out.println("주문에 실패하였습니다.");
			e.printStackTrace();
			return modelAndView;
		}
		modelAndView.addObject("message", "주문이 완료되었습니다.");
		return modelAndView;
	}
	
	@RequestMapping(value="order/cartOrder/complete",method=RequestMethod.GET)
	public String cartOrder() {
		return "redirect:/order/cart"; 
	}
		
	
}
