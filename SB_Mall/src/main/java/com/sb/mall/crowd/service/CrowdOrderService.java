package com.sb.mall.crowd.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sb.mall.crowd.dao.CrowdDao;

@Component
public class CrowdOrderService {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	private CrowdDao crowdDao;
	
	public String getUserName(int userSeq) {
		crowdDao = sessionTemplate.getMapper(CrowdDao.class);
		String userName = crowdDao.getUserName(userSeq);
		
		return userName;
	}
}
