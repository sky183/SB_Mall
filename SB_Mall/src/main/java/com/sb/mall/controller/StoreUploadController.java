package com.sb.mall.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class StoreUploadController {
	
	@RequestMapping("store/imgUpload")
	public void imgUpload(MultipartFile file, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("file");
		UUID uuid = UUID.randomUUID();

		// 원본파일 이름
		String org_filename = file.getOriginalFilename();
		// 저장될 이름
		String str_filename = uuid.toString() + org_filename;

		String filepath = realFolder + "\\storeBoard\\" + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("file/storeBoard/"+str_filename);
		out.close();
	}
	
}
