package com.sb.mall.admin.adminStatistics.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.admin.adminOperation.dao.AdminOperationDao;
import com.sb.mall.admin.adminStatistics.dao.AdminStatisticsDao;
import com.sb.mall.admin.adminStatistics.model.VisitStatVO;

@Repository
public class AdminStatisticsService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private AdminStatisticsDao dao;
	
	
	//loadBottomReport.jsp에서 사용할 데이터 수집
	@Transactional
	public VisitStatVO getVisitStatVO(Object nowDate) {
		
		dao = sqlSessionTemplate.getMapper(AdminStatisticsDao.class);
		
		VisitStatVO visitStatVO = new VisitStatVO();
		
		//dao의 메서드 실행하여
		visitStatVO = dao.getVisitStatVO(nowDate);



		return visitStatVO;
	}
	
	
}
	
	