package com.sb.mall.store.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sb.mall.store.service.ImgUploadService;


@Controller
public class SummerImgController {
	
	@Autowired
	ImgUploadService imgUploadService;
	
	@RequestMapping("store/summer/imgUpload")
	public void imgUploadDo(MultipartFile file, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String folderName = "storeBoard"; // 이미지 저장폴더 중간경로
		PrintWriter out = response.getWriter(); // 이미지경로 출력을 위한 객체
		//파일 업로드
		String filePath=imgUploadService.imgUpload(file, folderName, request, response);
		out.println(filePath); // 경로 출력
		out.close(); // out 객체를 닫는다.
	}
	
}
