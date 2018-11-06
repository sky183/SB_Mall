package com.sb.mall.order.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.member.model.MemberInfo;
import com.sb.mall.order.service.OrderCartService;

@Controller
@RequestMapping("order/cart")
public class OrderCartListController {
	
	@Autowired
	OrderCartService orderCartService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView viewCartList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		MemberInfo memberInfo = (MemberInfo)session.getAttribute("memberInfo");
		modelAndView.setViewName("orderCart");
		List<Map<String,Object>> list = null;
		try {
			list=orderCartService.selectCart(memberInfo.getUserSeq());
			modelAndView.addObject("cart",list);
		} catch (SQLException e) {
			modelAndView.addObject("errorMsg","장바구니 조회에 실패하였습니다. DB오류");
			System.out.println("장바구니 조회에 실패하였습니다.");
		}
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView orderCartList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:order/cart");
		return modelAndView;
	}
	
}
