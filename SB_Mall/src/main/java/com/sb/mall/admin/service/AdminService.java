package com.sb.mall.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.admin.dao.AdminDao;
import com.sb.mall.admin.model.AdminVO;

@Repository
public class AdminService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private AdminDao dao;
	
	@Transactional
	public AdminVO getAdminReport(AdminVO admin) {
		
		dao = sqlSessionTemplate.getMapper(AdminDao.class);
		
		//총 방문수
		admin.setVisitTotal(dao.visitCountTotal());
		//오늘의 방문수
		admin.setVisitToday(dao.visitCountDayPre(0));
		//어제의 방문수
		admin.setVisitPreday(dao.visitCountDayPre(1));
		
		//총 주문수
		admin.setOrderTotal(dao.orderCountTotal());
		//오늘의 주문수
		admin.setOrderToday(dao.orderDayCountPre(0));
		//어제의 주문수
		admin.setOrderPreday(dao.orderDayCountPre(1));
		
		//오늘의 매출
		admin.setSalesToday(dao.salesDayPre(0));
		//어제의 매출
		admin.setSalesPreday(dao.salesDayPre(1));
		//이번달 총 매출
		admin.setSalesThisMonth(dao.salesMonthPre(0));
		//지난달 총 매출
		admin.setSalesPreMonth(dao.salesMonthPre(1));
		//이번달 평균
		admin.setAverageThisMonth(dao.averageMonthPre(0));
		//주문상태
		admin.setOrderStatus(dao.orderStatus());
		//가입자
		admin.setJoinToday(dao.joinCountPre(0));
		admin.setJoinPreDay(dao.joinCountPre(1));

		return admin;

	}

}
