package com.sb.mall.model;

public class Order {
	private int orderSeq;
	private int orderDetailNum;
	private int userSeq;
	private int productSeq;
	private int quantity;
	private String option;
	private int status;
	
	public int getOrderSeq() {
		return orderSeq;
	}
	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
	}
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
	public int getProductSeq() {
		return productSeq;
	}
	public void setProductSeq(int productSeq) {
		this.productSeq = productSeq;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	@Override
	public String toString() {
		return "Order [orderSeq=" + orderSeq + ", orderDetailNum=" + orderDetailNum + ", userSeq=" + userSeq
				+ ", productSeq=" + productSeq + ", quantity=" + quantity + ", option=" + option + ", status=" + status
				+ "]";
	}
	
	
	
}
