package com.sb.mall.member.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberOrderListService {
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	public List<Object> getOrderList(){
		List<Object> list = new ArrayList<>();
		return list;
	}
	
	public List<Object> getOrderDetailList(){
		List<Object> list = new ArrayList<>();
		return list;
	}

}
