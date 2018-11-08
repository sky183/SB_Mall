package com.sb.mall.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.store.model.SalesBoard;

@Controller
@RequestMapping("store/ModifyBoard")
public class StoreModifyController {

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView modifyBoard(int salSeq) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("store/include/boardModifyEditor");
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView modifyBoardDo(SalesBoard board) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/store/boared/"+board.getSalesSeq());
		return modelAndView;
	}
	
}
