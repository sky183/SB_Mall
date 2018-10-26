package com.sb.mall.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.model.StoreWriteCommend;
import com.sb.mall.service.ImgUploadService;

@Controller
@RequestMapping("/store/write")
public class StoreWriteController {
	
	@Autowired
	ImgUploadService imgUploadService;

	@RequestMapping(method=RequestMethod.GET)
	public String storeWrite() {
		return  "/store/boardEditor";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView storeWriteDo(StoreWriteCommend storeWriteCommend,
			HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("store/result");
		//업로드폴더 중간경로 지정
		String folderName = "product";
		try {
			//파일 업로드. 동시에 엑세스가능한 웹경로도 지정해준다. 
			String filePath = request.getContextPath()+"/"+
					imgUploadService.imgUpload(
					storeWriteCommend.getProduct().getPhotoFile(),folderName, request, response);
			//product객체에 웹경로 저장. 
			storeWriteCommend.getProduct().setPhoto(filePath);
			System.out.println(storeWriteCommend.getProduct());
			System.out.println(storeWriteCommend.getSalesBoard());
		} catch (IOException e) {
			return modelAndView;
		}
		modelAndView.addObject("product", storeWriteCommend.getProduct());
		modelAndView.addObject("salesBoard",storeWriteCommend.getSalesBoard());
		return  modelAndView;
	}
	
}
