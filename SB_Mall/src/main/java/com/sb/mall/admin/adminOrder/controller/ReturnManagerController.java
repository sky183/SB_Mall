package com.sb.mall.admin.adminOrder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.admin.adminOperation.service.AdminOperationService;
import com.sb.mall.home.model.PageListView;

@Controller
public class ReturnManagerController {

	static final int COUNT_PER_PAGE = 10;

	@Autowired
	AdminOperationService operationService;

	// 일별 주문현황 loadDailySalReport ajax
	@RequestMapping(value = "/admin/adminOrder/orderManager/loadOrderList", method = RequestMethod.GET)
	public ModelAndView loadDailySalReport(@RequestParam(value = "startDate", required = true) String startDate,
			@RequestParam(value = "endDate", required = true) String endDate,
			@RequestParam(value = "tableName", required = true) String tableName,
			@RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber) {

		ModelAndView modelAndView = new ModelAndView();

		// dailySal.jsp 에 넣을 객체를 받아온다.
		PageListView viewData = operationService.getWeeklySalVOList(startDate, endDate, tableName, pageNumber,
				COUNT_PER_PAGE);

		modelAndView.addObject("viewData", viewData);

		modelAndView.setViewName("admin/adminOrder/orderManager/loadOrderList");

		return modelAndView;
	}
		

}
