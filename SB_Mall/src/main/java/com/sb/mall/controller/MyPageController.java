package com.sb.mall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.Join_memberInfoAndOrder;
import com.sb.mall.model.MemberInfo;
import com.sb.mall.order.model.OrderDetail;
import com.sb.mall.service.MypageService;
import com.sb.mall.service.MypageService2;

@Controller
@SessionAttributes("memberInfo")
public class MyPageController {

	@Autowired
	MypageService mypageService;

	@Autowired
	MypageService2 mypageService2;

	@RequestMapping("/myPage")
	public ModelAndView myPage(HttpSession session, HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView("myPage");

		MemberInfo memberInfo = (MemberInfo) session.getAttribute("memberInfo");
		int userSeq = memberInfo.getUserSeq();
		String userId = memberInfo.getUserId();

		// 주문내역
		try {
			List<OrderDetail> orderDetail = mypageService2.getOrderDetail(userSeq);
			modelAndView.addObject("orderDetail", orderDetail);
		} catch (Exception e) {
		}

		memberInfo = mypageService.getMemberInfo(userId);

		modelAndView.addObject("memberInfo", memberInfo);

		return modelAndView;
	}

}
