package com.sb.mall.admin.adminOperation.model;

import java.math.BigDecimal;
import java.util.Map;

public class TotalReportVO {
	// 토탈연버젯, 이번달까지연버젯, 토탈월버젯, 오늘까지월버젯
	private Map<String, Object> totalBudget;
	// 이번달까지 연매출
	private long yearAmount;
	// 일매출, 오늘의 주
	private Map<String, Integer> dailySalesOrerCount;
	// 오늘의 방문수
	private int visitCount;
	// 오늘의 신규회원
	private int newMember;
	// 이번달 오늘까지 cost, 이번달 오늘까지매출, cost%
	private Map<String, Object> totalCostSales;
	// 이번달 오늘까지 인건비
	private int laborCost;
	// 이번달 오늘까지 유틸리티, 소모품
	private Map<String, Object> utilSupllie;
	// 이번달 오늘까지 임대료
	private int rent;

	// 맵 객체들에서 언바인딩해서 값 할당하는 변수들
	// totalBudget에서 언바인딩한다.
	private long yearBudgetTotal; // 연버젯 총합
	private long yearBudget; // 이번달까지 연버젯
	private long monthBudgetTotal; // 이번달 버젯 총합
	private long monthBudget; // 이번달 오늘까지 월버젯

	// dailySalesOrerCount 에서 언바인딩한다.
	private int dailySales; // 오늘의 매출
	private int orderCount; // 오늘의 주문수

	// totalCostSales에서 언바인딩한다.
	private int monthCost; // 이번달 오늘까지 코스트 총액
	private long monthAmount; // 이번달 오늘까지 매출
	private int monthCostRate; // 이번달 오늘까지 코스트 %
	private int monthAvg; // 이번달 오늘까지 일평균 매출

	// utilSupllie에서 언바인딩한다.
	private int utility; // 이번달 오늘까지 유틸리티 금액
	private int supplie; // 이번달 오늘까지 소모품 금액

	// 언바인딩 후 값 계산
	private int yearBudgetRate; // 연버젯 % 이번달까지 매출 / 연버젯 * 100
	private int monthBudgetRate; // 월버젯 % 이번달 오늘까지 매출 / 월버젯 * 100
	private int ppa; // 오늘의 매출 / 주문수
	private int tce; // 이번달 오늘까지 cost금액, 인건비, 유틸리티, 소모품비 합산금액
	private int tci; // tce / 월매출 * 100
	private int tnc; // 임대료 / 월매출 *100
	private int operatingCashflow; // (매출 - (rent + TCE)) / 월매출 * 100
	private int laborCostRate; // 이번달 오늘까지 인건비% - 인건비 / 이번달 오늘까지 매출 * 100
	private int utilityRate; // 이번달 오늘까지 유틸리티 금액% - 유틸리티 / 이번달 오늘까지 매출 * 100
	private int supplieRate; // 이번달 오늘까지 소모품 금액% - 소모품 / 이번달 오늘까지 매출 * 100

	
	
	
	// 언바인딩 및 계산하여 값 할당하는 메서드
	public void setTotalResultBinding() {
		// totalBudget에서 언바인딩한다.
		this.yearBudgetTotal = (long) this.totalBudget.get("yearBudgetTotal");
		this.yearBudget = (long) this.totalBudget.get("yearBudget");
		this.monthBudgetTotal = (long) this.totalBudget.get("monthBudgetTotal");
		this.monthBudget = ((BigDecimal)this.totalBudget.get("monthBudget")).longValue();

		// dailySalesOrerCount 에서 언바인딩한다.
		this.dailySales = (int) this.dailySalesOrerCount.get("dailySales");
		this.orderCount = (int) this.dailySalesOrerCount.get("orderCount");

		// totalCostSales에서 언바인딩한다.
		this.monthCost = (int) this.totalCostSales.get("monthCost");
		this.monthAmount = (long) this.totalCostSales.get("monthAmount");
		this.monthCostRate = (int) this.totalCostSales.get("monthCostRate");
		this.monthAvg = (int) this.totalCostSales.get("monthAvg");

		// 언바인딩 후 값 계산
		this.yearBudgetRate = (int) (this.yearAmount / this.yearBudget * 100);
		this.monthBudgetRate = (int) (this.monthAmount / this.monthBudget * 100);
		this.ppa = (int) (dailySales / orderCount);
		this.tce = this.monthCost + this.laborCost + this.supplie;
		this.tci = (int) (this.tce / this.monthAmount * 100);
		this.tnc = (int) (this.rent / this.monthAmount * 100);
		this.operatingCashflow = (int) (this.monthAmount - (this.rent + this.tce));
		this.laborCostRate = (int) (this.laborCost / this.monthAmount * 100);
		this.utilityRate = (int) (this.utility / this.monthAmount * 100);
		this.supplieRate = (int) (this.supplie / this.monthAmount * 100);
	}

	// 기본 변수들 게터 세터
	public Map<String, Object> getTotalBudget() {
		return totalBudget;
	}

	public void setTotalBudget(Map<String, Object> totalBudget) {
		this.totalBudget = totalBudget;
	}

	public long getYearAmount() {
		return yearAmount;
	}

	public void setYearAmount(long yearAmount) {
		this.yearAmount = yearAmount;
	}

	public Map<String, Integer> getDailySalesOrerCount() {
		return dailySalesOrerCount;
	}

	public void setDailySalesOrerCount(Map<String, Integer> dailySalesOrerCount) {
		this.dailySalesOrerCount = dailySalesOrerCount;
	}

	public int getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}

	public int getNewMember() {
		return newMember;
	}

	public void setNewMember(int newMember) {
		this.newMember = newMember;
	}

	public Map<String, Object> getTotalCostSales() {
		return totalCostSales;
	}

	public void setTotalCostSales(Map<String, Object> totalCostSales) {
		this.totalCostSales = totalCostSales;
	}

	public int getLaborCost() {
		return laborCost;
	}

	public void setLaborCost(int laborCost) {
		this.laborCost = laborCost;
	}

	public Map<String, Object> getUtilSupllie() {
		return utilSupllie;
	}

	public void setUtilSupllie(Map<String, Object> utilSupllie) {
		this.utilSupllie = utilSupllie;
	}

	public int getRent() {
		return rent;
	}

	public void setRent(int rent) {
		this.rent = rent;
	}

	@Override
	public String toString() {
		return "TotalReportVO [totalBudget=" + totalBudget + ", yearAmount=" + yearAmount + ", dailySalesOrerCount="
				+ dailySalesOrerCount + ", visitCount=" + visitCount + ", newMember=" + newMember + ", totalCostSales="
				+ totalCostSales + ", laborCost=" + laborCost + ", utilSupllie=" + utilSupllie + ", rent=" + rent
				+ ", yearBudgetTotal=" + yearBudgetTotal + ", yearBudget=" + yearBudget + ", monthBudgetTotal="
				+ monthBudgetTotal + ", monthBudget=" + monthBudget + ", dailySales=" + dailySales + ", orderCount="
				+ orderCount + ", monthCost=" + monthCost + ", monthAmount=" + monthAmount + ", monthCostRate="
				+ monthCostRate + ", monthAvg=" + monthAvg + ", utility=" + utility + ", supplie=" + supplie
				+ ", yearBudgetRate=" + yearBudgetRate + ", monthBudgetRate=" + monthBudgetRate + ", ppa=" + ppa
				+ ", tce=" + tce + ", tci=" + tci + ", tnc=" + tnc + ", operatingCashflow=" + operatingCashflow
				+ ", laborCostRate=" + laborCostRate + ", utilityRate=" + utilityRate + ", supplieRate=" + supplieRate
				+ "]";
	}

}
