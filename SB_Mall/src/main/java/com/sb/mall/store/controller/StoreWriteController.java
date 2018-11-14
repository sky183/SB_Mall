package com.sb.mall.store.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.member.model.MemberInfo;
import com.sb.mall.store.model.StoreWriteCommend;
import com.sb.mall.store.service.StoreAdminService;

@Controller
@RequestMapping("/store/write")
public class StoreWriteController {

	@Autowired
	StoreAdminService storeAdminService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView storeWrite(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("store/storeWritePage");

		MemberInfo memberInfo = (MemberInfo) session.getAttribute("memberInfo");
		modelAndView.addObject("userGrade", memberInfo.getGradeNum());
 
		return modelAndView;

	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView storeWriteDo(StoreWriteCommend storeWriteCommend, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		MemberInfo memberInfo = (MemberInfo) session.getAttribute("memberInfo");

		modelAndView.setViewName("redirect:/store");

		storeWriteCommend.getSalesBoard().setUserSeq(memberInfo.getUserSeq());

		try {
			// 제품판매 게시글 등록
			storeAdminService.productAndBoardWrite(storeWriteCommend.getProduct(), storeWriteCommend.getSalesBoard());

		} catch (SQLException e) {

			System.out.println("게시글등록 실패");

		}

		return modelAndView;
	}

}
