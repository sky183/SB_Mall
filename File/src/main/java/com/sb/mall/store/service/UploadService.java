package com.sb.mall.store.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadService {
	
	public String imgUpload(MultipartFile file, String folderName, String filename, 
			HttpServletRequest request, HttpServletResponse response) 
					throws IllegalStateException, IOException{
		response.setContentType("text/html;charset=utf-8");
				
		// 저장될 실제 폴더 경로+파일이름
		String filepath = "/file/"+ folderName +"/" + filename;
		System.out.println("파일경로 : " + filepath);
		File f = new File(filepath);
		
		try {
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
		String sqlpath = ("http://sbmallstore.com/file/" + folderName + "/" + filename).trim();
		return sqlpath;
	};

}
