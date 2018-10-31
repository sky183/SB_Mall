package com.sb.mall.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sb.mall.model.QnABoard;
import com.sb.mall.service.QnABoardListService;

@Controller
public class QnABoardController {

	@Autowired
	private QnABoardListService qnaBoardListService;

	@ResponseBody
	@RequestMapping(value = "qna")
	public ModelAndView getQnABoard() {
		ModelAndView modelAndView = new ModelAndView();

		try {
			List<Map<String, Object>> list = qnaBoardListService.qnaList();
			modelAndView.addObject("qnaList", list);
		} catch (SQLException e) {
			modelAndView.addObject("errorMsg", "글 목록 조회에 실패하였습니다.");
			System.out.println("글 목록 조회에 실패하였습니다.");
		}
		modelAndView.setViewName("qna");
		return modelAndView;
	}

	@RequestMapping(value = "/writeqna", method = RequestMethod.POST)
	public String createPOST(QnABoard board, RedirectAttributes rttr) throws Exception {
		
		System.out.println(board.toString());

		qnaBoardListService.qnaList();

		// return "/board/succes";
		rttr.addFlashAttribute("msg", "성공");
		return "redirect:/qna";
	}

}
