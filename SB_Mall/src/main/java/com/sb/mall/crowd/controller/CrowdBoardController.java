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
	public ModelAndView crowdPage(@RequestParam(value="crowdPageCount", defaultValue="1")int nowPage, 
			@RequestParam(value="pageShowCnt", defaultValue="16")int pageShowCnt) {
		ModelAndView modelAndView = new ModelAndView();
		
		List<Map<String, Object>> list= new ArrayList<Map<String, Object>>();
		list = boardService.getCrowdBoard(nowPage, pageShowCnt);
		System.out.println("게시판 get");
		System.out.println("List.Length : "+list.size());
		System.out.println("photo : "+list.get(0));
		int paging = boardService.getBoardPageCnt(pageShowCnt);
		
		modelAndView.addObject("boardList", list);
		modelAndView.addObject("paging", paging);
		modelAndView.addObject("nowPage", nowPage);
		modelAndView.setViewName("view/store/crowdFunding/crowdBoard");
		
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView getCrowdBoard(@RequestParam(value="crowdPageCount", defaultValue="1")int crowdPageCount, 
						@RequestParam(value="pageShowCnt", defaultValue="16")int pageShowCnt){
		System.out.println("게시판 가져오는 컨트롤러 입장.");
		ModelAndView modelAndView = new ModelAndView();
		List<Map<String, Object>> list= new ArrayList<Map<String, Object>>();
		
		System.out.println("crowdPageCount : "+crowdPageCount+", pageShowCnt"+pageShowCnt);
		
		list = boardService.getCrowdBoard(crowdPageCount, pageShowCnt);
		
		System.out.println(list);
		
		modelAndView.addObject("crBoard", list);
		modelAndView.setViewName("store/crowdFunding/option/crowdBoardOption");
		
		return modelAndView;
	}
}
