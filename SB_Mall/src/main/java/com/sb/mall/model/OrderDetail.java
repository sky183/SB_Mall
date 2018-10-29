package com.sb.mall.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderDetail {
	private int orderDetailNum;
	private int userSeq;
	private String payment;
	private Date orderTime;
	public int getOrderDetailNum() {
		return orderDetailNum;
	}
	public void setOrderDetailNum(int orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getOrderTime() {
		return new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(orderTime);
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	@Override
	public String toString() {
		return "OrderDetail [orderDetailNum=" + orderDetailNum + ", userSeq=" + userSeq + ", payment=" + payment
				+ ", orderTime=" + orderTime + "]";
	}
	
	
	
}
