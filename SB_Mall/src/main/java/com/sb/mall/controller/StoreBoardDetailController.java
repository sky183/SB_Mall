package com.sb.mall.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.service.StoreBoardDetailService;

@Controller
public class StoreBoardDetailController {
	
	@Autowired
	StoreBoardDetailService boardDetailService;

	@RequestMapping(value="store/board/{salSeq}",method=RequestMethod.GET)
	public ModelAndView boardDetailView(@PathVariable("salSeq") int salSeq) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("storeBoardDetail");
		try {
			List<Map<String,Object>> list = boardDetailService.SalDetailView(salSeq);
			modelAndView.addObject("viewList", list);
		} catch (SQLException e) {
			modelAndView.addObject("errorMsg", "게시글 조회에 실패하였습니다.");
			System.out.println("게시글 조회에 실패하였습니다.");
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value="store/board/{salSeq}",method=RequestMethod.POST)
	public ModelAndView boardDetailViewDo(@PathVariable("salSeq") int salSeq) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("store/result");
		return modelAndView;
	}
	
	
	
}
