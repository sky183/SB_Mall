package com.sb.mall.home.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sb.mall.home.dao.HomeDao;

@Component
public class HomeService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private HomeDao homeDao;
	
	public List<Map<String,Object>> getDailyDeal() throws SQLException{
		
		homeDao = sqlSessionTemplate.getMapper(HomeDao.class);
		
		System.out.println("homeSerivce 입장.");
		
		return homeDao.selectDailyDeal();
	}
	
	
	public List<Map<String,Object>> getNewProduct() throws SQLException{
		
		homeDao = sqlSessionTemplate.getMapper(HomeDao.class);
		
		System.out.println("homeSerivce 입장.");
		
		return homeDao.selectNewProduct();
	}
	
}
