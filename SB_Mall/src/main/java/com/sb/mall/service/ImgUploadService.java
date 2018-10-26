package com.sb.mall.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ImgUploadService {
	
	public String imgUpload(MultipartFile file, String folderName,
			HttpServletRequest request, HttpServletResponse response) 
					throws IllegalStateException, IOException{
		response.setContentType("text/html;charset=utf-8");
		// 업로드할 폴더 기본경로
		String realFolder = request.getSession().getServletContext().getRealPath("file");
		UUID uuid = UUID.randomUUID();
		// 원본파일 이름
		String org_filename = file.getOriginalFilename();
		// 저장될 이름
		String str_filename = uuid.toString() + org_filename;
		// 저장될 폴더 경로+파일이름
		String filepath = realFolder + "\\"+ folderName +"\\" + str_filename;
		System.out.println("파일경로 : " + filepath);
		File f = new File(filepath);
		
		try {
			if (!f.exists()) {
				f.mkdirs();
			}
			file.transferTo(f);
		} catch (IllegalStateException e) {
			f.delete();
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			f.delete();
			e.printStackTrace();
			throw e;
		}
		//웹경로 리턴
		String sqlpath = "file/"+folderName+"/"+str_filename;
		return sqlpath;
	};

}
