package com.sb.mall.model;

import java.util.Date;

public class Join_memberInfoAndOrder {
	private String userId;
	private String userName;
	private int gradeNum;
	private int point;
	private int userAmount;
	private String orderDetailNum;
	private int payment;
	private Date orderTime;
	private int status;
	private int totalAmount;
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getGradeNum() {
		return gradeNum;
	}
	public void setGradeNum(int gradeNum) {
		this.gradeNum = gradeNum;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getUserAmount() {
		return userAmount;
	}
	public void setUserAmount(int userAmount) {
		this.userAmount = userAmount;
	}
	public String getOrderDetailNum() {
		return orderDetailNum;
	}
	public void setOrderDetailNum(String orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	
	@Override
	public String toString() {
		return "Join_memberInfoAndOrder [userId=" + userId + ", userName=" + userName + ", gradeNum=" + gradeNum
				+ ", point=" + point + ", userAmount=" + userAmount + ", orderDetailNum=" + orderDetailNum
				+ ", payment=" + payment + ", orderTime=" + orderTime + ", status=" + status + ", totalAmount="
				+ totalAmount + "]";
	}

}
