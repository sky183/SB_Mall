package com.sb.mall.admin.adminMember.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.admin.adminMain.model.AdminMainVO;
import com.sb.mall.admin.adminMember.dao.AdminMemberDao;

@Repository
public class AdminMemberService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private AdminMemberDao dao;
	
	@Transactional
	public AdminMainVO getAdminReport(AdminMainVO admin) {
		
		dao = sqlSessionTemplate.getMapper(AdminMemberDao.class);
		

		return admin;

	}

}
