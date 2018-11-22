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
	public String crowdPage() {
		return "view/store/crowdFunding/crowdBoard";
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
