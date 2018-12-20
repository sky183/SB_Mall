package com.sb.mall.member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.member.model.MemberInfo;
import com.sb.mall.member.service.MemberModifyService;

@Controller
public class MemberModifyController {

	@Autowired
	private MemberModifyService memberModifyService;

	@RequestMapping(value = "/member/memberModifyCheck", method = RequestMethod.POST)
	public ModelAndView getMember(String id,String pw) {
		ModelAndView modelAndView = new ModelAndView("member/memberModify");
		// 내 정보 가져오기
		MemberInfo member = memberModifyService.getMember(id,pw);
		// View에 로그인한 現 회원정보 담아서 리턴
		modelAndView.addObject("member", member);
		return modelAndView;
	}

	@RequestMapping(value = "/member/memberModify", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getMemberModify_end(MemberInfo memberInfo, HttpServletResponse httpServletResponse) {
		httpServletResponse.setHeader("Content-Type", "text/html; charset=utf-8");
		String result = "";
		try {
			result = memberModifyService.modifyMember(memberInfo);
		} catch (Exception e) {
			result = "회원번호 수정 실패";
		}
		return result;
	}

}
