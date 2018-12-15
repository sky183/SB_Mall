package com.sb.mall.admin.adminOrder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.admin.adminOperation.service.AdminOperationService;
import com.sb.mall.admin.adminOrder.service.AdminOrderService;
import com.sb.mall.home.model.PageListView;

@Controller
public class OrderManagerController {

	static final int COUNT_PER_PAGE = 10;

	@Autowired
	AdminOrderService service;

	// 일별 주문현황 loadOrderList ajax
	@RequestMapping(value = "/admin/adminOrder/orderManager/loadOrderList", method = RequestMethod.GET)
	public ModelAndView loadDailySalReport(@RequestParam(value = "startDate", required = true) String startDate,
			@RequestParam(value = "endDate", required = true) String endDate,
			@RequestParam(value = "tableName", required = true) String tableName,
			@RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber,
			@RequestParam(value = "status", defaultValue = "-1") int status,
			@RequestParam(value = "payment", defaultValue = "-1") int payment,
			@RequestParam(value = "search", defaultValue = "") String search) {

		ModelAndView modelAndView = new ModelAndView();

		// dailySal.jsp 에 넣을 객체를 받아온다.
		PageListView viewData = service.getOrderVOList(startDate, endDate, tableName, pageNumber,
				COUNT_PER_PAGE, status, payment, search);

		modelAndView.addObject("viewData", viewData);

		modelAndView.setViewName("admin/adminOrder/orderManager/loadOrderList");

		return modelAndView;
	}
	
	

}
