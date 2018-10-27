package com.sb.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.service.StoreListViewService;

@Controller
public class StoreListController {
	
	@Autowired
	StoreListViewService storeListViewService;

	@RequestMapping(value="store")
	public ModelAndView storeListView(
			@RequestParam(value="pageNumber",defaultValue="1")int pageNumber
			) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(pageNumber);
		/*List<Map<String, Object>> list=null;
		try {
			list = storeListViewService.ListView();
		} catch (SQLException e) {
			System.out.println("글목록 로딩에 실패하였습니다.");
		}
		modelAndView.addObject("viewList", list);*/
		modelAndView.setViewName("storeBoard");
		return modelAndView;
	}
	
}
