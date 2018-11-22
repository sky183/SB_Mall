package com.sb.mall.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.home.dao.HomeDao;

@Repository
public class adminService {
		
		@Autowired
		private SqlSessionTemplate sqlSessionTemplate;
		
		private HomeDao homeDao;
		
}
