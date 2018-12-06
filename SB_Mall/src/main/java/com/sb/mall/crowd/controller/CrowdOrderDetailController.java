package com.sb.mall.crowd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sb.mall.crowd.model.CrowdOrder;
import com.sb.mall.crowd.model.CrowdOrderCommand;
import com.sb.mall.crowd.service.CrowdOrderService;

@Controller
public class CrowdOrderDetailController {
	
	@Autowired
	private CrowdOrderService orderService;
	
	@RequestMapping(value="/crowd/crowdOrderDetail", method=RequestMethod.POST)
	public ModelAndView orderDetail(CrowdOrderCommand orderCommand) {
		ModelAndView modelAndView = new ModelAndView();
		ObjectMapper jackson = new ObjectMapper();
		
		try {
			Map<String, List<CrowdOrder>> map = new HashMap<>();
			map.put("orderList", orderCommand.getOrderList());
			
			String orders = jackson.writeValueAsString(map);
			System.out.println("orders : "+orders);
			
			
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		modelAndView.setViewName("redirect:/");
		
		return modelAndView;
	}
}
