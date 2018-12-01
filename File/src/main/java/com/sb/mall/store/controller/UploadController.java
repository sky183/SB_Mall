package com.sb.mall.store.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sb.mall.store.service.UploadService;

@Controller
public class UploadController {
	
	@Autowired
	UploadService imgUploadService;
	
	@RequestMapping("upload/{foldername}")
	public void imgUploadDo( @PathVariable("foldername") String folderName, MultipartFile file, String filename,  
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		
		// 이미지경로 출력을 위한 객체 - 응답을 해준다.
		PrintWriter out = response.getWriter(); 
		
		//파일 업로드
		String filePath=imgUploadService.imgUpload(file, folderName, filename, request, response);
		
		out.println(filePath); // 응답으로 경로를 출력해준다. 
		out.close(); // out 객체를 닫는다.
	}
}
