package com.sb.mall.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubwayController {
	
	@RequestMapping("subway")
	public String subwayPage() {
		System.out.println("지하철.");
		return "view/community/contents/subway"; 
	}
	
}
