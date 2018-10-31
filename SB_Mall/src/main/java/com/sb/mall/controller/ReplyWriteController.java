package com.sb.mall.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sb.mall.model.MemberInfo;
import com.sb.mall.model.Reply;
import com.sb.mall.service.ReplyService;

@Controller
public class ReplyWriteController {
	
	@Autowired
	private ReplyService replyService;
	
	@ResponseBody
	@RequestMapping("/replyWrite")
	public String writeReply(HttpServletRequest request, HttpSession session, Reply replyWrite) {
		MemberInfo LoginMember = (MemberInfo) session.getAttribute("memberInfo");
		replyWrite.setUserSeq(LoginMember.getUserSeq());
		
		String result = "댓글 등록 실패.";
		
		boolean writeReplyOk = replyService.writeReplyService(replyWrite);
		
		if(writeReplyOk) {
			result="댓글 등록 성공.";
		}
		
		
		return result;
	}

}
