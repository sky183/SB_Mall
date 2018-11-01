package com.sb.mall.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.QnABoard;
import com.sb.mall.service.QnAWriteAnsService;
import com.sb.mall.service.QnAWriteAnsService_end;

@Controller
public class QnAWriteAnsController {
	
	@Autowired
	QnAWriteAnsService qnaWriteAnsService;
	
	@Autowired
	QnAWriteAnsService_end qnaWriteAnsService_end;
	
	@RequestMapping(value="/qna/qnaWriteAns/{qnaSeq}", method=RequestMethod.GET)
	public ModelAndView replyGET(@PathVariable(value="qnaSeq") int qnaSeq, QnABoard qnaBoard) {
		
		ModelAndView modelAndView = new ModelAndView("qna/qnaWriteAns");
		
		qnaWriteAnsService.qnaWriteAns(qnaBoard);
		
		System.out.println("게시판번호 : " + qnaSeq);
		System.out.println(qnaBoard.toString());
		
		modelAndView.addObject("qnaBoard", qnaBoard);
		
		return modelAndView;
		
		// return "qna/qnaWriteAns";
		
	}
	
	@RequestMapping(value="/qna/qnaWriteAns/{qnaSeq}", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public ModelAndView replyPOST(QnABoard qnaBoard, HttpServletResponse httpServletResponse) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		httpServletResponse.setHeader("Content-Type", "text/html; charset=utf-8");
		
		modelAndView.addObject("qnaBoard", qnaBoard);
		
		qnaWriteAnsService.qnaWriteAns(qnaBoard);
			
		System.out.println(qnaBoard.toString());
		
		System.out.println("== 수정완료 ==");
		
		modelAndView.setViewName("redirect:/qna");
			
		return modelAndView;
	}
	
}
