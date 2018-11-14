package com.sb.mall.crowd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CrowdWriteController {
	
	@RequestMapping("crowdWritePage")
	public String crowdWriteForm() {
		System.out.println("crowdWrite입장");
		return "store/crowdFunding/crowdWritePage";
	}
}
