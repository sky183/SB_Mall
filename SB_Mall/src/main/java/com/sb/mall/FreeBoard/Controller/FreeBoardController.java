package com.sb.mall.FreeBoard.Controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.FreeBoard.model.FreeBoard;
import com.sb.mall.FreeBoard.service.FreeBoardService;
import com.sb.mall.member.model.MemberInfo;

@Controller
@RequestMapping("freeBoard")
@SessionAttributes("memberInfo")
public class FreeBoardController {
	MemberInfo memberInfo;
	//게시판 이동
	@RequestMapping(method = RequestMethod.GET) 
	public ModelAndView getFreeBoardMainForm() {
		System.out.println("자유게시판");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("freeBoard/FreeBoardMain");
		
		
		return modelAndView;
	}
	
	//게시판에서 글쓰기버튼 클릭
	@RequestMapping("/writePage") 
	public String freeBoardWrite() {
		System.out.println("[freeBoardWrite()]");
		
		return "freeBoard/FreeBoardWrite";
	}
	
	@Autowired
	FreeBoardService freeBoardService;
	
	//글쓰기 페이지
	@RequestMapping(method = RequestMethod.POST, value="/insert") 
	public String freeBoardInsert(
			FreeBoard freeBoard,
			MemberInfo memberInfo,
			HttpServletRequest request, 
			HttpSession session) throws Exception {
		System.out.println("[freeBoardInsert()]");
		System.out.println("접속 회원 명:"+memberInfo.getUserName());
		
		ModelAndView modelAndView = new ModelAndView("freeBoard/FreeBoardMain");
		
		if (memberInfo.getUserId() != null) {
			
			System.out.println("FK: memberInfo 테이블의 기본키 freeBoard 테이블에 저장");
			freeBoard.setUserSeq(memberInfo.getUserSeq());
			freeBoard.setWriterName(memberInfo.getUserName());
			freeBoard.setBoardWriteDate(new Date());
			
			System.out.println(freeBoard.toString());
			
			int resultCnt = 0;
			resultCnt = freeBoardService.freeBoardService_Create(freeBoard);
			
		}else {
			freeBoard.setWriterName("비회원");
			System.out.println(freeBoard.toString());
		}
		
		return "freeBoard/FreeBoardWrite";
	}
}
