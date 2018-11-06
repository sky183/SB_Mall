package com.sb.mall.store.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.member.model.MemberInfo;
import com.sb.mall.store.service.StoreBoardDetailService;

@Controller
public class StoreBoardDetailController {
	
	@Autowired
	StoreBoardDetailService boardDetailService;

	@RequestMapping(value="store/board/{salSeq}",method=RequestMethod.GET)
	public ModelAndView boardDetailView(@PathVariable("salSeq") int salSeq,
			HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		MemberInfo memberInfo = (MemberInfo)session.getAttribute("memberInfo");
		modelAndView.setViewName("storeBoardDetail");
		try {
			List<Map<String,Object>> list = boardDetailService.SalDetailView(salSeq);
			modelAndView.addObject("userGrade",memberInfo.getGradeNum());
			modelAndView.addObject("salSeq", salSeq);
			modelAndView.addObject("viewList", list);
		} catch (SQLException e) {
			modelAndView.addObject("errorMsg", "게시글 조회에 실패하였습니다.");
			System.out.println("게시글 조회에 실패하였습니다.");
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value="store/board/{salSeq}",method=RequestMethod.POST)
	public ModelAndView boardDetailViewDo(@PathVariable("salSeq") int salSeq) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("store/result");
		return modelAndView;
	}
	
	
	
}
