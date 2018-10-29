package com.sb.mall.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.service.StoreListViewService;

@Controller
public class StoreListViewController {
	
	@Autowired
	StoreListViewService storeListViewService;
	
	@ResponseBody
	@RequestMapping("store/boardListView")
	public ModelAndView getListView() {
		ModelAndView modelAndView = new ModelAndView();
		try {
			List<Map<String,Object>> list = storeListViewService.proAndSalList();
			modelAndView.addObject("viewList", list);
		} catch (SQLException e) {
			System.out.println("글 목록 로딩에 실패하였습니다.");
		}
		modelAndView.setViewName("store/boardListView");
		return modelAndView;
	}

}
