package com.sb.mall.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.MemberInfo;
import com.sb.mall.service.JoinService;

@Controller 

//joinSession추가
@SessionAttributes("joinSession")

@RequestMapping("/join") // 요청에 대해 어떤 Controller, 어떤 메소드가 처리할지를 맵핑하기 위한 어노테이션
public class JoinController {
	
	@Autowired
	private JoinService joinService;
	
		
	@RequestMapping(method = RequestMethod.GET) 
	public String getJoinForm() {
		System.out.println("HOME 에서 JOIN 클릭");
		
		return "/join/joinForm";
	}
	@RequestMapping(method = RequestMethod.POST)  //get 방식으로  값을 받아와 String num에 저장 modelAndView로  리턴
	public ModelAndView getResultForm(@ModelAttribute("mInfo") MemberInfo memberInfo,
			HttpServletRequest request) {
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/join/joinResult");
		
		try {
			
			//joinSession에 memberInfo등록
			joinService.joinResult(memberInfo, request);
			request.getSession().setAttribute("joinSession", memberInfo);
			modelAndView.addObject("joinSession", memberInfo);
			
			//1. Session is not null
			if (request.getSession().getAttribute("joinSession") != null) {
				
				System.out.println("Session is not null");
				System.out.println("Session Check : "+request.getSession().getAttribute("joinSession"));
				int resultCnt = joinService.joinResult(memberInfo, request);
				
				System.out.println("<Controller Message>");
				System.out.println("가입한 회원 ID:" + memberInfo.getUserId());
				//1.1 resultCnt == 0 
				if(resultCnt==0) {
					modelAndView.setViewName("join/joinFail");
				}else {
					System.out.println("RequestMethod.POST방식 가입완료");
					
				}
				
			}else {
				//2. Session is not null
				System.out.println("Session is null");
			}//End of if (about Session)
			
			
			
		} catch (SQLException e) {
			modelAndView.setViewName("join/joinFail");
			System.out.println("SQLExceptione");
			e.printStackTrace();
		} catch (IllegalStateException e) {
			modelAndView.setViewName("join/joinFail");
			System.out.println("IllegalStateException");
			e.printStackTrace();
		} catch (IOException e) {
			modelAndView.setViewName("join/joinFail");
			System.out.println("IOException");
			e.printStackTrace();
		}catch (Exception e) {
			modelAndView.setViewName("join/joinFail");
			System.out.println("Exception");
			e.printStackTrace();
		}
		
		return modelAndView;
		
	}
}
