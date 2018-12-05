package com.sb.mall.admin.adminOperation.dao;

import java.util.Map;

import com.sb.mall.admin.adminOperation.model.BudgetVO;

public interface AdminOperationDao {
	//	토탈연버젯, 이번달까지연버젯, 토탈월버젯, 오늘까지월버젯
	public Map<String, Object> totalBudget(Object nowDate);
	//	이번달까지 연매출
	public long yearAmount(Object nowDate);
	//	일매출, 오늘의 주문수
	public Map<String, Object> dailySalesOrerCount(Object nowDate);
	//	오늘의 방문수
	public int visitCount(Object nowDate);
	//	오늘의 신규회원
	public int newMember(Object nowDate);
	//	이번달 오늘까지 cost,  이번달 오늘까지매출, cost% 이번달 일평균
	public Map<String, Object> totalCostSales(Object nowDate);
	//	이번달 오늘까지 인건비
	public int laborCost(Object nowDate);
	//	이번달 오늘까지 유틸리티, 소모품
	public Map<String, Object> utilSupllie(Object nowDate);
	//	이번달 오늘까지 임대료
	public int rent(Object nowDate);
	// 	버젯 전체
	public BudgetVO selectBudget(Object nowYear);
	//	버젯 수정
	public void updateBudget(BudgetVO budgetVO);



}
