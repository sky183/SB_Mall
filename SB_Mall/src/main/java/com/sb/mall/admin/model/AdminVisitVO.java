package com.sb.mall.admin.model;

import java.util.List;
import java.util.Map;

public class AdminVisitVO {
	//방문자수
	private int visitTotal; //총 방문자 수
	private int visitToday; //오늘의 방문자수
	private int visitPreday; //어제의 방문자수
	private int orderToday; //오늘의 주문수
	private int orderPreday; //어제의 주문수
	//매출
	private Long salesToday; //오늘의 매출
	private Long salesPreday; //어제의 매출
	private Long salesThisMonth; //이번달 총 매출
	private Long averageThisMonth; //이번달 평균
	//주문상태
	private List<Map<String, Integer>> orderStatus; //주문 상태 조회
	//가입자
	private int joinToday; //오늘의 가입자
	private int joinPreDay; //어제의 가입자
	
	public int getVisitTotal() {
		return visitTotal;
	}
	public void setVisitTotal(int visitTotal) {
		this.visitTotal = visitTotal;
	}
	public int getVisitToday() {
		return visitToday;
	}
	public void setVisitToday(int visitToday) {
		this.visitToday = visitToday;
	}
	public int getVisitPreday() {
		return visitPreday;
	}
	public void setVisitPreday(int visitPreday) {
		this.visitPreday = visitPreday;
	}
	public int getOrderToday() {
		return orderToday;
	}
	public void setOrderToday(int orderToday) {
		this.orderToday = orderToday;
	}
	public int getOrderPreday() {
		return orderPreday;
	}
	public void setOrderPreday(int orderPreday) {
		this.orderPreday = orderPreday;
	}
	public Long getSalesToday() {
		return salesToday;
	}
	public void setSalesToday(Long salesToday) {
		this.salesToday = salesToday;
	}
	public Long getSalesPreday() {
		return salesPreday;
	}
	public void setSalesPreday(Long salesPreday) {
		this.salesPreday = salesPreday;
	}
	public Long getSalesThisMonth() {
		return salesThisMonth;
	}
	public void setSalesThisMonth(Long salesThisMonth) {
		this.salesThisMonth = salesThisMonth;
	}
	public Long getAverageThisMonth() {
		return averageThisMonth;
	}
	public void setAverageThisMonth(Long averageThisMonth) {
		this.averageThisMonth = averageThisMonth;
	}
	public List<Map<String, Integer>> getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(List<Map<String, Integer>> orderStatus) {
		this.orderStatus = orderStatus;
	}
	public int getJoinToday() {
		return joinToday;
	}
	public void setJoinToday(int joinToday) {
		this.joinToday = joinToday;
	}
	public int getJoinPreDay() {
		return joinPreDay;
	}
	public void setJoinPreDay(int joinPreDay) {
		this.joinPreDay = joinPreDay;
	}
	@Override
	public String toString() {
		return "AdminVO [visitTotal=" + visitTotal + ", visitToday=" + visitToday + ", visitPreday=" + visitPreday
				+ ", orderToday=" + orderToday + ", orderPreday=" + orderPreday + ", salesToday=" + salesToday
				+ ", salesPreday=" + salesPreday + ", salesThisMonth=" + salesThisMonth + ", averageThisMonth="
				+ averageThisMonth + ", orderStatus=" + orderStatus + ", joinToday=" + joinToday + ", joinPreDay="
				+ joinPreDay + "]";
	}
	
	
	
	
}
