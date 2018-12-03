package com.sb.mall.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.admin.dao.AdminOperationDao;
import com.sb.mall.admin.model.AdminVO;

@Repository
public class AdminOperationService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private AdminOperationDao dao;
	
	@Transactional
	public AdminVO getAdminReport(AdminVO admin) {
		
		dao = sqlSessionTemplate.getMapper(AdminOperationDao.class);
		

		return admin;

	}

}