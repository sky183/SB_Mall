package com.sb.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberListController {

/*	@Autowired
	private MemberListService service;*/

	@RequestMapping("/memberList/viewType")
	public ModelAndView getMemberList(@RequestParam(value = "type", defaultValue = "HTML") String type)
			throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		
		switch (type) {
		case "HTML":
			modelAndView.setViewName("member/viewTypeHTML");
			break;
		case "JSON":
			modelAndView.setViewName("member/viewTypeJSON");
			break;
		case "XML":
			modelAndView.setViewName("member/viewTypeXML");
			break;
		}
		
/*		List<MemberInfo> members = service.getMemberList();

		modelAndView.addObject("members", members);
*/


		return modelAndView;
	}

}
