package com.sb.mall.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sb.mall.dao.HomeDao;

@Component
public class HomeService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private HomeDao homeDao;
	
	public List<Map<String,Object>> getDailyDeal(){
		
		homeDao = sqlSessionTemplate.getMapper(HomeDao.class);
		
		return null;
	}
	
//	public List<E>
}
