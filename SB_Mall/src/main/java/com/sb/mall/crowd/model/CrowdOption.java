package com.sb.mall.crowd.model;

public class CrowdOption {
	private int crOptionSeq;
	private String crGoodsNo;
	private String crOpt1Name;
	private int crOpt1Price;
	private String crOpt2Name;
	private int crOpt2Price;
	private int crOptAmount;
	
	public int getCrOptionSeq() {
		return crOptionSeq;
	}
	public void setCrOptionSeq(int crOptionSeq) {
		this.crOptionSeq = crOptionSeq;
	}
	public String getCrGoodsNo() {
		return crGoodsNo;
	}
	public void setCrGoodsNo(String crGoodsNo) {
		this.crGoodsNo = crGoodsNo;
	}
	public String getCrOpt1Name() {
		return crOpt1Name;
	}
	public void setCrOpt1Name(String crOpt1Name) {
		this.crOpt1Name = crOpt1Name;
	}
	public int getCrOpt1Price() {
		return crOpt1Price;
	}
	public void setCrOpt1Price(int crOpt1Price) {
		this.crOpt1Price = crOpt1Price;
	}
	public String getCrOpt2Name() {
		return crOpt2Name;
	}
	public void setCrOpt2Name(String crOpt2Name) {
		this.crOpt2Name = crOpt2Name;
	}
	public int getCrOpt2Price() {
		return crOpt2Price;
	}
	public void setCrOpt2Price(int crOpt2Price) {
		this.crOpt2Price = crOpt2Price;
	}
	public int getCrOptAmount() {
		return crOptAmount;
	}
	public void setCrOptAmount(int crOptAmount) {
		this.crOptAmount = crOptAmount;
	}
	@Override
	public String toString() {
		return "CrowdOption [crOptionSeq=" + crOptionSeq + ", crGoodsNo=" + crGoodsNo + ", crOpt1Name=" + crOpt1Name
				+ ", crOpt1Price=" + crOpt1Price + ", crOpt2Name=" + crOpt2Name + ", crOpt2Price=" + crOpt2Price
				+ ", crOptAmount=" + crOptAmount + "]";
	}
	
	
	
	
}
