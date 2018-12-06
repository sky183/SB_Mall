package com.sb.mall.crowd.model;

import java.util.Date;

public class CrowdOrderDetail {
	private int crDetailSeq;
	private String crOrderDetailNo;
	private int userSeq;
	private int payment;
	private Date orderTime;
	private int status;
	private int finalPrice;
	private String cardNo;
	private int yearDay;
	private String cardPassword;
	private int birthNo;
	private String orderAddress;
	private int orderPhone;
	private String orderRequest;
	private String orderName;
	public int getCrDetailSeq() {
		return crDetailSeq;
	}
	public void setCrDetailSeq(int crDetailSeq) {
		this.crDetailSeq = crDetailSeq;
	}
	public String getCrOrderDetailNo() {
		return crOrderDetailNo;
	}
	public void setCrOrderDetailNo(String crOrderDetailNo) {
		this.crOrderDetailNo = crOrderDetailNo;
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
	public int getFinalPrice() {
		return finalPrice;
	}
	public void setFinalPrice(int finalPrice) {
		this.finalPrice = finalPrice;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public int getYearDay() {
		return yearDay;
	}
	public void setYearDay(int yearDay) {
		this.yearDay = yearDay;
	}
	public String getCardPassword() {
		return cardPassword;
	}
	public void setCardPassword(String cardPassword) {
		this.cardPassword = cardPassword;
	}
	public int getBirthNo() {
		return birthNo;
	}
	public void setBirthNo(int birthNo) {
		this.birthNo = birthNo;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public int getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(int orderPhone) {
		this.orderPhone = orderPhone;
	}
	public String getOrderRequest() {
		return orderRequest;
	}
	public void setOrderRequest(String orderRequest) {
		this.orderRequest = orderRequest;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	@Override
	public String toString() {
		return "CrowdOrderDetail [crDetailSeq=" + crDetailSeq + ", crOrderDetailNo=" + crOrderDetailNo + ", userSeq="
				+ userSeq + ", payment=" + payment + ", orderTime=" + orderTime + ", status=" + status + ", finalPrice="
				+ finalPrice + ", cardNo=" + cardNo + ", yearDay=" + yearDay + ", cardPassword=" + cardPassword
				+ ", birthNo=" + birthNo + ", orderAddress=" + orderAddress + ", orderPhone=" + orderPhone
				+ ", orderRequest=" + orderRequest + ", orderName=" + orderName + "]";
	}
	
	

}
