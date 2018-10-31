package com.sb.mall.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sb.mall.model.QnABoard;
import com.sb.mall.service.QnAService;

@Controller
@RequestMapping("/qna/")
public class QnABoardController {
	
	@Inject
    private QnAService service;
    
    @RequestMapping(value="/qnaWrite",method=RequestMethod.GET)
    public void createGET(QnABoard board, Model model) throws Exception{
        System.out.println("/qna/qnaWrite 입니다. GET방식");
        
    }
    
    @RequestMapping(value = "/qnaWrite",method=RequestMethod.POST )
    public String createPOST(QnABoard board, Model model) throws Exception{
        System.out.println("/qna/qnaWrite POST방식 입니다.");
        System.out.println(board.toString());
        
        service.create(board);
        model.addAttribute("result", "성공");
        
        return "/qna/success";
    }

	
	
	
	
	
	
	
	
	/*@Autowired
	private QnAService qnaBoardService;

	@RequestMapping(value="/qna/openQnAList.do")
	public ModelAndView openQnAList(CommandMap commandMap) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/qna/qnaList");
		
		List<Map<String,Object>> list = QnAService.selectQnAList(commandMap.getMap());
		modelAndView.addObject("list", list);
    	
		return modelAndView;
	}
	
	@RequestMapping(value="/qna/openQnAWrite.do")
	public ModelAndView openQnAWrite(CommandMap commandMap) throws Exception{
		ModelAndView modelAndView = new ModelAndView("/qna/qnaWrite");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/qna/insertQnA.do")
	public ModelAndView insertQnA(CommandMap commandMap) throws Exception{
		ModelAndView modelAndView = new ModelAndView("redirect:/qna/openQnAList.do");
		
		QnAService.insertQnA(commandMap.getMap());
		
		return modelAndView;
	}
	
	@RequestMapping(value="/qna/openQnADetail.do")
	public ModelAndView openQnADetail(CommandMap commandMap) throws Exception{
		ModelAndView modelAndView = new ModelAndView("/qna/qnaDetail");
		
		Map<String,Object> map = QnAService.selectQnADetail(commandMap.getMap());
		modelAndView.addObject("map", map);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/qna/openQnAUpdate.do")
	public ModelAndView openQnAUpdate(CommandMap commandMap) throws Exception{
		ModelAndView modelAndView = new ModelAndView("/qna/qnaUpdate");
		
		Map<String,Object> map = QnAService.selectQnADetail(commandMap.getMap());
		modelAndView.addObject("map", map);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/qna/updateQnA.do")
	public ModelAndView updateQnA(CommandMap commandMap) throws Exception{
		ModelAndView modelAndView = new ModelAndView("redirect:/qna/openQnADetail.do");
		
		QnAService.updateQnA(commandMap.getMap());
		
		modelAndView.addObject("IDX", commandMap.get("IDX"));
		return modelAndView;
	}
	
	@RequestMapping(value="/qna/deleteQnA.do")
	public ModelAndView deleteQnA(CommandMap commandMap) throws Exception{
		ModelAndView modelAndView = new ModelAndView("redirect:/qna/openQnAList.do");
		
		QnAService.deleteQnA(commandMap.getMap());
		
		return modelAndView;
	}*/
	
	
	/*@ResponseBody
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

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String createPOST(QnABoard board, RedirectAttributes rttr) throws Exception {
		
		System.out.println(board.toString());

		qnaBoardListService.qnaList();

		// return "/board/succes";
		rttr.addFlashAttribute("msg", "성공");
		return "redirect:/qna";
	}*/

}
