package com.sb.mall.member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sb.mall.member.service.MemberDeleteService;

@Controller
public class MemberDeleteController {

	@Autowired
	private MemberDeleteService memberDeleteService;
	
	@RequestMapping(value="/member/memberDelete", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getMemberDelete(@RequestParam("userId") String userId, HttpServletResponse httpServletResponse) {
		
		httpServletResponse.setHeader("Content-Type", "text/html; charset=utf-8");
		
		System.out.println("MemberDeleteController");
		
		String result = "";
		//내 정보 가져오기
		try {
			memberDeleteService.memberDelete(userId);
			result = "삭제 완료";
		} catch (Exception e) {
			result = "삭제 실패";
		}
	
		
		return result;
	}
}
