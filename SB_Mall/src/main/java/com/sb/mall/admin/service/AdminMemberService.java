package com.sb.mall.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.admin.dao.AdminMemberDao;
import com.sb.mall.admin.model.AdminVO;

@Repository
public class AdminMemberService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private AdminMemberDao dao;
	
	@Transactional
	public AdminVO getAdminReport(AdminVO admin) {
		
		dao = sqlSessionTemplate.getMapper(AdminMemberDao.class);
		

		return admin;

	}

}
