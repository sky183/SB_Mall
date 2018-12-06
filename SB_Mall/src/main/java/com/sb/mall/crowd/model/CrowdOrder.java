package com.sb.mall.crowd.model;

public class CrowdOrder {
	private int crOrderSeq;
	private String crOrderDetailNo;
	private int userSeq;
	private int crowdBoardSeq;
	private String crGoodsNo;
	private int crOptionSeq;
	private int quantity;
	private int salePrice;
	private int totalPrice;
	private int crOrderSatus;
	
	private String crGoodsName;
	private String crOpt1Name;
	private String crOpt2Name;
	
	private String crGoodsImg;
	private String userName;
	
	
	public int getCrOrderSeq() {
		return crOrderSeq;
	}
	public void setCrOrderSeq(int crOrderSeq) {
		this.crOrderSeq = crOrderSeq;
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
	public int getCrowdBoardSeq() {
		return crowdBoardSeq;
	}
	public void setCrowdBoardSeq(int crowdBoardSeq) {
		this.crowdBoardSeq = crowdBoardSeq;
	}
	public String getCrGoodsNo() {
		return crGoodsNo;
	}
	public void setCrGoodsNo(String crGoodsNo) {
		this.crGoodsNo = crGoodsNo;
	}
	public int getCrOptionSeq() {
		return crOptionSeq;
	}
	public void setCrOptionSeq(int crOptionSeq) {
		this.crOptionSeq = crOptionSeq;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getCrOrderSatus() {
		return crOrderSatus;
	}
	public void setCrOrderSatus(int crOrderSatus) {
		this.crOrderSatus = crOrderSatus;
	}
	public String getCrGoodsImg() {
		return crGoodsImg;
	}
	public void setCrGoodsImg(String crGoodsImg) {
		this.crGoodsImg = crGoodsImg;
	}
	public String getCrGoodsName() {
		return crGoodsName;
	}
	public void setCrGoodsName(String crGoodsName) {
		this.crGoodsName = crGoodsName;
	}
	public String getCrOpt1Name() {
		return crOpt1Name;
	}
	public void setCrOpt1Name(String crOpt1Name) {
		this.crOpt1Name = crOpt1Name;
	}
	public String getCrOpt2Name() {
		return crOpt2Name;
	}
	public void setCrOpt2Name(String crOpt2Name) {
		this.crOpt2Name = crOpt2Name;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "CrowdOrder [crOrderSeq=" + crOrderSeq + ", crOrderDetailNo=" + crOrderDetailNo + ", userSeq=" + userSeq
				+ ", crowdBoardSeq=" + crowdBoardSeq + ", crGoodsNo=" + crGoodsNo + ", crOptionSeq=" + crOptionSeq
				+ ", quantity=" + quantity + ", salePrice=" + salePrice + ", totalPrice=" + totalPrice
				+ ", crOrderSatus=" + crOrderSatus + ", crGoodsName=" + crGoodsName + ", crOpt1Name=" + crOpt1Name
				+ ", crOpt2Name=" + crOpt2Name + ", crGoodsImg=" + crGoodsImg + ", userName=" + userName + "]";
	}
	
	
}
