package com.sb.mall.admin.adminCalendar.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.admin.adminCalendar.dao.AdminCalendarDao;
import com.sb.mall.admin.adminMain.model.AdminMainVO;

@Repository
public class AdminCalendarService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private AdminCalendarDao dao;
	
	@Transactional
	public AdminMainVO getAdminReport(AdminMainVO admin) {
		
		dao = sqlSessionTemplate.getMapper(AdminCalendarDao.class);
		

		return admin;

	}

}
