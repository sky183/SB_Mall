package com.sb.mall.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sb.mall.service.StoreDeleteService;

@Controller
public class StoreDeleteController {
	
	@Autowired
	StoreDeleteService storeDeleteService;
	
	@RequestMapping("store/deleteBoard")
	public String deleteStore(@RequestParam(value="salSeq")int salSeq) {
		try {
			storeDeleteService.deleteStore(salSeq);
		} catch (SQLException e) {
			System.out.println("게시글 삭제에 실패하였습니다.");
			e.printStackTrace();
			return "redirect:/store";
		}
		return "redirect:/store";
	}

}
