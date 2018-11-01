package com.sb.mall.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.Join_memberInfoAndOrder;
import com.sb.mall.model.MemberInfo;
import com.sb.mall.model.OrderDetail;
import com.sb.mall.service.MypageService;
import com.sb.mall.service.MypageService2;

@Controller

public class MyPageController {

	@Autowired
	MypageService mypageService;
	
	@Autowired
	MypageService2 mypageService2;
	
	@RequestMapping("/myPage")
	public ModelAndView myPage(HttpSession session, HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView("myPage");
		
		MemberInfo memberInfo = new MemberInfo();
		
		
		/*Session*/
		 Object object = session.getAttribute("memberInfo");
		 MemberInfo member = (MemberInfo) object;
		 String userId = member.getUserId();
		 int userSeq = member.getUserSeq();
		 
		 //주문내역
		 List<OrderDetail> orderDetail = mypageService2.getOrderDetail(userSeq);
		 
		 System.out.println("Controller Sql 실행");
		 if (userId.equals(null)) {
			 System.out.println("로그인 필요");
			
		}else {
			System.out.println("세션에 저장된 회원아이디"+member.getUserId());
			System.out.println("세션에 저장된 회원번호"+member.getUserSeq());
			
			if (!orderDetail.isEmpty()) {
				System.out.println("주문내역 있음");
				memberInfo = mypageService.getMemberInfo(userId);
				orderDetail = mypageService2.getOrderDetail(userSeq);
				
				modelAndView.addObject("memberInfo",memberInfo);			
				modelAndView.addObject("orderDetail",orderDetail);			
			}else {
				System.out.println("주문내역 없음");
				memberInfo = mypageService.getMemberInfo(userId);
				modelAndView.addObject("memberInfo",memberInfo);			
			}
		}
		 
		 
		return modelAndView;
	}

}
