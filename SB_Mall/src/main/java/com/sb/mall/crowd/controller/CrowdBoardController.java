package com.sb.mall.crowd.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.crowd.service.CrowdBoardService;

@Controller
@RequestMapping("crowd/crowdBoard")
public class CrowdBoardController {
	
	@Autowired
	private CrowdBoardService boardService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView crowdPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("view/store/crowdFunding/crowdBoard");
		
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView getCrowdBoard(@RequestParam(value="nowPage", defaultValue="1")int nowPage, 
						@RequestParam(value="pageShowCnt", defaultValue="15")int pageShowCnt){
		System.out.println("게시판 가져오는 컨트롤러 입장.");
		ModelAndView modelAndView = new ModelAndView();
		
		List<Map<String, Object>> list= new ArrayList<Map<String, Object>>();
		list = boardService.getCrowdBoard(nowPage, pageShowCnt);
		System.out.println("게시판 get");
		System.out.println("List.Length : "+list.size());
		
		int paging = boardService.getBoardPageCnt(pageShowCnt);
		int doAdd = list.size()%3;
		System.out.println("doAdd : "+doAdd);
		System.out.println("?? 왜 안나오냐?");
		
		modelAndView.addObject("boardList", list);
		modelAndView.addObject("paging", paging);
		modelAndView.addObject("nowPage", nowPage);
		System.out.println("nowPage : "+nowPage+", paging : "+paging);
		modelAndView.addObject("doAdd", doAdd);
		modelAndView.setViewName("store/crowdFunding/option/crowdBoardOption");
		
		return modelAndView;
	}
}
