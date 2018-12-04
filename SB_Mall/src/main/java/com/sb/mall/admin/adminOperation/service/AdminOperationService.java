package com.sb.mall.admin.adminOperation.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.admin.adminMain.model.AdminMainVO;
import com.sb.mall.admin.adminOperation.dao.AdminOperationDao;

@Repository
public class AdminOperationService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private AdminOperationDao dao;
	
	@Transactional
	public AdminMainVO getAdminReport(AdminMainVO admin) {
		
		dao = sqlSessionTemplate.getMapper(AdminOperationDao.class);
		

		return admin;

	}

}
