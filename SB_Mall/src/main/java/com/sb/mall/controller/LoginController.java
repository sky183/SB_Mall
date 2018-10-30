package com.sb.mall.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	@RequestMapping(value="Login", method = RequestMethod.GET) // get 방식으로 값을 받아와 String num에 저장 modelAndView로 리턴
	public ModelAndView getLoginForm() {
		return new ModelAndView("/common/loginForm");
	}

	@RequestMapping(value="Login", method = RequestMethod.POST)
	public ModelAndView loginProcess(@RequestParam(value = "userId", required = false) String userId,
			@RequestParam(value = "userPw", required = false) String userPw, HttpSession session) throws SQLException {

		ModelAndView modelAndView = new ModelAndView();

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
