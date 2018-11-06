package com.sb.mall.member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.member.model.MemberInfo;
import com.sb.mall.member.service.MemberModifyService;
import com.sb.mall.member.service.MemberModifyService_end;



@Controller
public class MemberModifyController {

	@Autowired
	private MemberModifyService memberModifyService;
	
	@Autowired
	private MemberModifyService_end memberModifyService_end;
		
	@RequestMapping("/memberModify")
	public ModelAndView getMemberModify(@RequestParam("userId") String userId) {
		
		System.out.println("MemberModifyController");
		
		ModelAndView modelAndView = new ModelAndView("member/memberModify");
		
		//내 정보 가져오기
		MemberInfo member = memberModifyService.memberModify(userId);
		
		System.out.println("회원ID :"+userId);
		System.out.println(member.toString());
		modelAndView.addObject("member",member);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/memberModify_end", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getMemberModify_end(MemberInfo memberInfo, HttpServletResponse httpServletResponse) {
		System.out.println("<**수정시작**>");
		
		httpServletResponse.setHeader("Content-Type", "text/html; charset=utf-8");
		
		String result = "";
		try {
			memberModifyService_end.memberModify_end(memberInfo);

			System.out.println("<**수정완료**>");
			result = "수정완료";  
		} catch (Exception e) {
			result = "수정실패";
			
			// TODO: handle exception
		}

		/*modelAndView.addObject(memberInfo);*/
		
		return result;
	}
	
}
