package com.sb.mall.home.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.member.model.MemberInfo;
import com.sb.mall.member.service.MemberJoinService;

@Controller 

//joinSession추가
@RequestMapping("member/join") // 요청에 대해 어떤 Controller, 어떤 메소드가 처리할지를 맵핑하기 위한 어노테이션
@SessionAttributes("memberInfo")
public class JoinController {
	
	@Autowired
	private MemberJoinService joinService;
	
		
	@RequestMapping(method = RequestMethod.GET) 
	public String getJoinForm() {
		System.out.println("HOME 에서 JOIN 클릭");
		
		return "/joinForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)  //get 방식으로  값을 받아와 String num에 저장 modelAndView로  리턴
	public ModelAndView getResultForm(@ModelAttribute("mInfo") MemberInfo memberInfo, @RequestParam("userPwChck") String userPwChck,
			HttpServletRequest request) {
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/home");
		
		if (!memberInfo.getUserPw().equals(userPwChck)) {
			modelAndView.setViewName("error/joinError");
			modelAndView.addObject("error", "비밀번호가 다릅니다.");
			return modelAndView;
		}
		
		try {
			
			//joinSession에 memberInfo등록
			int resultCnt = joinService.joinResult(memberInfo, request);
			modelAndView.addObject("memberInfo", memberInfo);
			
			//1. Session(memberInfo) is not null 일때 회원가입
			if (memberInfo != null) {
				
				System.out.println("Session is not null");
				System.out.println("<Controller Message>");
				System.out.println("가입한 회원 ID:" + memberInfo.getUserId());
				//1.1 회원가입 실패시 : resultCnt == 0 
				if(resultCnt==0) {
					modelAndView.setViewName("error/memberjoinError");
				}else {
					System.out.println("RequestMethod.POST방식 가입완료");
				}
				
			}else {
				System.out.println("Session is null");
			}
			
		} catch (SQLException e) {
			modelAndView.setViewName("join/joinFail");
			modelAndView.addObject("error", "이미 존재하는 아이디입니다.");
			System.out.println("SQLExceptione");
		} catch (IllegalStateException e) {
			modelAndView.setViewName("join/joinFail");
			modelAndView.addObject("error", "이미 존재하는 아이디입니다.");
			System.out.println("IllegalStateException");
		} catch (IOException e) {
			modelAndView.setViewName("join/joinFail");
			modelAndView.addObject("error", "이미 존재하는 아이디입니다.");
			System.out.println("IOException");
		}catch (Exception e) {
			modelAndView.setViewName("join/joinFail");
			System.out.println("Exception");
			modelAndView.addObject("error", "이미 존재하는 아이디입니다.");
		}
		
		return modelAndView;
		
	}// end of method (getResultForm)
}// end of class (JoinController)

