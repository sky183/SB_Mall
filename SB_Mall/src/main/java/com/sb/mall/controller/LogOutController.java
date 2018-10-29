package com.sb.mall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogOutController {

	@RequestMapping("/member/logout") 		// 요청한 주소로 들어온다
	public String logout(HttpSession session) {
		
		// 세션의 종료
		session.invalidate();
		
		
		
		return "redirect:/";
		
	}
	
	
	
}