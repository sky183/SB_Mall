package com.sb.mall.admin.adminOrder.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.admin.adminMain.model.AdminMainVO;
import com.sb.mall.admin.adminOrder.dao.AdminOrderDao;

@Repository
public class AdminOrderService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private AdminOrderDao dao;
	
	@Transactional
	public AdminMainVO getAdminReport(AdminMainVO admin) {
		
		dao = sqlSessionTemplate.getMapper(AdminOrderDao.class);
		

		return admin;

	}

}
