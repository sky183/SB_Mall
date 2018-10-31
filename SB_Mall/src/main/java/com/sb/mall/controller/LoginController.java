package com.sb.mall.controller;

import java.sql.SQLException;
import java.util.Arrays;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.service.LoginService;

@Controller // 클라이언의 요청을 처리 한 뒤그 결과를 DispatcherServlet에게 알려 줌 Struts의 Action과 동일한 기능
public class LoginController {

	@Autowired // Spring Framework에서 지원하는 의존주입 용도의 어노테이션
	private LoginService loginService;
	
	// 요청에 대해 어떤 Controller, 어떤 메소드가 처리할지를 맵핑하기 위한 어노테이션
	@RequestMapping(value="Login", method = RequestMethod.GET) 
	public ModelAndView getLoginForm(@CookieValue(value = "idcookie", required = false)String rememberId) {//쿠키값 불러온다.
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("/common/loginForm");
		modelAndView.addObject("idcookie",rememberId);
		
		
		
		

		return modelAndView;
		
		
	}

	@RequestMapping(value="Login", method = RequestMethod.POST)
	public ModelAndView loginProcess(@RequestParam(value = "userId", required = false) String userId,
			@RequestParam(value = "userPw", required = false) String userPw, 
			@RequestParam(value = "rememberId", required = false)String rememberId,
			HttpSession session, HttpServletResponse response //쿠키 값 받아와서 처리
			
			
			) throws SQLException {

		System.out.println(rememberId);
		ModelAndView modelAndView = new ModelAndView();

		
		if("on".equals(rememberId)) {
			response.addCookie(new Cookie("idcookie", userId));//쿠키 생성
			
		}
		modelAndView.setViewName("/common/loginFail");

		if (userId != null && userPw != null) {
// userId 또는 userPw가 null 이 아닌 경우 
			if (loginService.login(userId, userPw, session)) {
				modelAndView.setViewName("redirect:/");
			} else {
				modelAndView.setViewName("common/loginForm");
				modelAndView.addObject("error", "아이디 또는 비밀번호가 틀렸습니다.");
			}

		}

		return modelAndView;
	}
	
	@RequestMapping("loginError")
	public String loginError() {
		return "/error/loginError";
	}

}
