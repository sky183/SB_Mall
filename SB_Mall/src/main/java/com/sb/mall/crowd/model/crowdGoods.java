package com.sb.mall.crowd.model;

import org.springframework.web.multipart.MultipartFile;

public class crowdGoods {
	private String goodsNo;
	private int productSeq;
	private String goodsName;
	private int goodsPrice;
	private String goodsPhoto;
	private MultipartFile goodsFile;
	
	public String getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}
	public int getProductSeq() {
		return productSeq;
	}
	public void setProductSeq(int productSeq) {
		this.productSeq = productSeq;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public String getGoodsPhoto() {
		return goodsPhoto;
	}
	public void setGoodsPhoto(String goodsPhoto) {
		this.goodsPhoto = goodsPhoto;
	}
	public MultipartFile getGoodsFile() {
		return goodsFile;
	}
	public void setGoodsFile(MultipartFile goodsFile) {
		this.goodsFile = goodsFile;
	}
	
	@Override
	public String toString() {
		return "crowdGoods [goodsNo=" + goodsNo + ", productSeq=" + productSeq + ", goodsName=" + goodsName
				+ ", goodsPrice=" + goodsPrice + ", goodsPhoto=" + goodsPhoto + ", goodsFile=" + goodsFile + "]";
	}
}
