package com.sb.mall.admin.adminOrder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.admin.adminOrder.service.AdminOrderService;
import com.sb.mall.home.model.PageListView;

@Controller
public class ReturnManagerController {

	static final int COUNT_PER_PAGE = 10;

	@Autowired
	AdminOrderService service;

	// 일별 주문현황 loadReturnList ajax
	@RequestMapping(value = "/admin/adminOrder/returnManager/loadReturnList", method = RequestMethod.GET)
	public ModelAndView loadReturnList(@RequestParam(value = "startDate", required = true) String startDate,
			@RequestParam(value = "endDate", required = true) String endDate,
			@RequestParam(value = "tableName", required = true) String tableName,
			@RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber) {

		ModelAndView modelAndView = new ModelAndView();

		// dailySal.jsp 에 넣을 객체를 받아온다.
		PageListView viewData = service.getReturnVOList(startDate, endDate, tableName, pageNumber,	COUNT_PER_PAGE);

		modelAndView.addObject("viewData", viewData);

		modelAndView.setViewName("admin/adminOrder/returnManager/loadReturnList");

		return modelAndView;
	}
	
	// 반품 상태 업데이트 loadOrderList ajax
//	@RequestMapping(value = "/admin/adminOrder/orderManager/loadOrderList/changeStatus/{status}/{tableName}", method = RequestMethod.POST)
//	@ResponseBody
//	public String changeStatus(@RequestBody List<Object> orderDetailArray, 
//			@PathVariable String status, @PathVariable String tableName) {
//		
//		//주문 상태 업데이트
//		service.changeStatus(orderDetailArray, status, tableName);
//		
//		return "변경 완료!";
//	}
		

}
