package com.sb.mall.model;

public class Order {
	private int orderSeq;
	private String orderDetailNum;
	private int userSeq;
	private int productSeq;
	private int quantity;
	private String option;
	private int salePrice;

	
	public int getOrderSeq() {
		return orderSeq;
	}
	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
	}
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

	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}

	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	@Override
	public String toString() {
		return "Order [orderSeq=" + orderSeq + ", orderDetailNum=" + orderDetailNum + ", userSeq=" + userSeq
				+ ", productSeq=" + productSeq + ", quantity=" + quantity + ", option=" + option + ", salePrice="
				+ salePrice + "]";
	}
	
	

	
	
}
