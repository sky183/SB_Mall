package com.sb.mall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.dao.MemberDao;
import com.sb.mall.model.Join_memberInfoAndOrder;
import com.sb.mall.model.MemberInfo;
import com.sb.mall.service.MypageService;

@Controller

public class MyPageController {

	@Autowired
	MypageService mypageService;

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private List<Join_memberInfoAndOrder> join_memberInfoAndOrder;

	@RequestMapping("/myPage")
	public ModelAndView myPage(HttpSession session, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("myPage");
		
		 Object object = session.getAttribute("memberInfo");
		 MemberInfo member = (MemberInfo) object;
		 System.out.println("세션에 저장된 회원아이디"+member.getUserId());
		 String userId = member.getUserId();
		 
		 
		 
		 System.out.println("Test");
		
		return modelAndView;
	}

}
