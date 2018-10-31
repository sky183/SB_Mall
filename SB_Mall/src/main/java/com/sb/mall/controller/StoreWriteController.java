package com.sb.mall.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.MemberInfo;
import com.sb.mall.model.StoreWriteCommend;
import com.sb.mall.service.ImgUploadService;
import com.sb.mall.service.StoreWriteService;

@Controller
@RequestMapping("/store/write")
public class StoreWriteController {
	
	@Autowired
	ImgUploadService imgUploadService;
	@Autowired
	StoreWriteService storeWriteService;

	@RequestMapping(method=RequestMethod.GET)
	public String storeWrite() {
		return  "/store/boardEditor";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView storeWriteDo(StoreWriteCommend storeWriteCommend,
			HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		MemberInfo memberInfo = (MemberInfo)session.getAttribute("memberInfo");
		modelAndView.setViewName("redirect:/store");
		storeWriteCommend.getSalesBoard().setUserSeq(memberInfo.getUserSeq());
		//업로드폴더 중간경로 지정
		String folderName = "product";
		try {
			//파일 업로드. 동시에 엑세스가능한 웹경로도 지정해준다. 
			String filePath = request.getContextPath()+"/"+
					imgUploadService.imgUpload(
					storeWriteCommend.getProduct().getPhotoFile(),folderName, request, response);
			//product객체에 웹경로 저장. 
			storeWriteCommend.getProduct().setPhoto(filePath);
			//제품판매 게시글 등록
			storeWriteService.productAndBoardWrite(
					storeWriteCommend.getProduct(), storeWriteCommend.getSalesBoard());
		} catch (IOException e) {
			System.out.println("파일등록실패");
		} catch (SQLException e) {
			System.out.println("게시글등록 실패");
		}
		return  modelAndView;
	}
	
}
