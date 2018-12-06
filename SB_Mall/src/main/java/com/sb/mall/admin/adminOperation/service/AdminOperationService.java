package com.sb.mall.admin.adminOperation.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.admin.adminOperation.dao.AdminOperationDao;
import com.sb.mall.admin.adminOperation.model.BudgetVO;
import com.sb.mall.admin.adminOperation.model.TotalReportVO;

@Repository
public class AdminOperationService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private AdminOperationDao dao;
	
	
	//loadBottomReport.jsp에서 사용할 데이터 수집
	@Transactional
	public TotalReportVO getTotalReportVO(Object nowDate) {
		
		dao = sqlSessionTemplate.getMapper(AdminOperationDao.class);
		
		TotalReportVO totalReportVO = new TotalReportVO();
		
		//dao의 메서드 실행하여 totalReportVO에 값 할당
		totalReportVO.setTotalBudget(dao.totalBudget(nowDate));
		totalReportVO.setYearAmount(dao.yearAmount(nowDate));		
		totalReportVO.setDailySalesOrerCount(dao.dailySalesOrerCount(nowDate));
		totalReportVO.setVisitCount(dao.visitCount(nowDate));
		totalReportVO.setNewMember(dao.newMember(nowDate));
		totalReportVO.setTotalCostSales(dao.totalCostSales(nowDate));
		totalReportVO.setLaborCost(dao.laborCost(nowDate));
		totalReportVO.setUtilSupllie(dao.utilSupllie(nowDate));
		totalReportVO.setRent(dao.rent(nowDate));
		
		//totalReportVO의 변수값을 언바인딩 및 계산하여 변수 값 할당 완료
		totalReportVO.setTotalResultBinding();

		return totalReportVO;
	}
	
	//loadBudgetReport.jsp에서 사용할 데이터 수집
	@Transactional
	public BudgetVO getBudgetVO(Object nowDate) {
		
		dao = sqlSessionTemplate.getMapper(AdminOperationDao.class);
		
		BudgetVO budgetVO = new BudgetVO();
		
		//dao의 메서드 실행하여 budgetVO에 값 할당
		budgetVO = dao.selectBudget(nowDate);
		budgetVO.setNowYear((String)nowDate);
		
		return budgetVO;
	}
	
	//loadBudgetReport.jsp에서 값을 받아와서 수정
	@Transactional
	public void updateBudget(BudgetVO budgetVO) {
		
		dao = sqlSessionTemplate.getMapper(AdminOperationDao.class);
		
		//dao의 메서드 실행하여 budgetVO에 값 할당
		dao.updateBudget(budgetVO);
		
	}
	
	

}
