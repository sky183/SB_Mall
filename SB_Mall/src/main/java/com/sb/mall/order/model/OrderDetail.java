package com.sb.mall.order.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderDetail {
	private String orderDetailNum;
	private int userSeq;
	private int payment;
	private Date orderTime;
	private int status;
	private int totalAmount;
	
	public String getOrderDetailNum() {
		return orderDetailNum;
	}

	public void setOrderDetailNum(String orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}

	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public String getOrderTime() {
		return new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(orderTime);
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
		return "OrderDetail [orderDetailNum=" + orderDetailNum + ", userSeq=" + userSeq + ", payment=" + payment
				+ ", orderTime=" + orderTime + ", status=" + status + ", totalAmount=" + totalAmount + "]";
	}
	
	

}
