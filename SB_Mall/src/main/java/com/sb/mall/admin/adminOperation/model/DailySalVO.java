package com.sb.mall.admin.adminOperation.model;

public class DailySalVO {
	
	private String orderTime;
	private int orderCount;
	private int visitCount;
	private int dailyAmount;
	
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public int getVisitCount() {
		return visitCount;
	}
	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}
	public int getDailyAmount() {
		return dailyAmount;
	}
	public void setDailyAmount(int dailyAmount) {
		this.dailyAmount = dailyAmount;
	}
	@Override
	public String toString() {
		return "DailySalVO [orderTime=" + orderTime + ", orderCount=" + orderCount + ", visitCount=" + visitCount
				+ ", dailyAmount=" + dailyAmount + "]";
	}
	
	
	
}
