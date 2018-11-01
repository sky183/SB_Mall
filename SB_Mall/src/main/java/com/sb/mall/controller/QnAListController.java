package com.sb.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.QnABoard;
import com.sb.mall.service.QnAListViewService;

@Controller
public class QnAListController {

	/*@RequestMapping("/qna")
	public String viewQnAPage() {
		return "/qna";
	}*/
	
	@Autowired
	private QnAListViewService qnaService;
	
	
	@RequestMapping(value="qna")
	public ModelAndView getListView() {
		ModelAndView modelAndView = new ModelAndView();
		
		List<QnABoard> list = qnaService.qnaAndMemList();

		modelAndView.addObject("qnaList", list);
		modelAndView.setViewName("qna");
		return modelAndView;
	}
	
}
