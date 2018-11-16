package com.sb.mall.member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sb.mall.member.service.MemberFindService;

@Controller
public class MemberFindController {

	@Autowired
	private MemberFindService findService;

	// find_id 으로 요청이들어오면 "/member/find_id_form".jsp 파일을 응답해주는 내용
	// 아이디 찾기 버튼 클릭시 아이디 찾기 폼으로 이동
	@RequestMapping(value = "/member/find_id", method=RequestMethod.GET)
	public String find_id_form() throws Exception{
		
		return "login/find_id_form";
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/member/find_id", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response,@RequestParam("userName") String userName,@RequestParam("phone") String phone,Model md) throws Exception{
	
	
	 md.addAttribute("id",findService.findId(response,userName,phone));
		
		
		return "login/find_id";
	
	}
	
	
}
