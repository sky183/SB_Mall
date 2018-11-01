package com.sb.mall.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.StoreListView;
import com.sb.mall.service.GetPagingService;
import com.sb.mall.service.StoreListViewService;

@Controller
public class StoreListViewController {
	
	@Autowired
	StoreListViewService storeListViewService;
	
	@Autowired
	GetPagingService getPagingService;
	
	
	@RequestMapping("store/boardListView")
	@ResponseBody
	public ModelAndView getListView(String tag,
		@RequestParam(value="sortType",defaultValue="s.viewSeq desc") String sortType,
		@RequestParam(value="pageNumber",defaultValue="1") int pageNumber,
		@RequestParam(value="countPerPage",defaultValue="8") int countPerPage){
		ModelAndView modelAndView = new ModelAndView();
		try {
			StoreListView list = 
					getPagingService.getStoreList(pageNumber, countPerPage, 
							"StoreListView", tag, sortType);
			modelAndView.addObject("viewList", list);
			System.out.println(sortType);
		} catch (SQLException e) {
			modelAndView.addObject("errorMsg", "글 목록 조회에 실패하였습니다.");
			System.out.println("글 목록 조회에 실패하였습니다.");
		}
		modelAndView.setViewName("store/boardListView");
		return modelAndView;
	}

}
