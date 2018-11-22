package com.sb.mall.crowd.model;

import org.springframework.web.multipart.MultipartFile;

public class CrowdGoods {
	private String crGoodsNo;
	private int crProductSeq;
	private String crGoodsName;
	private int crGoodsPrice;
	private String crGoodsPhoto;
	private MultipartFile goodsFile;
	
	public String getCrGoodsNo() {
		return crGoodsNo;
	}
	public void setCrGoodsNo(String crGoodsNo) {
		this.crGoodsNo = crGoodsNo;
	}
	public int getCrProductSeq() {
		return crProductSeq;
	}
	public void setCrProductSeq(int crProductSeq) {
		this.crProductSeq = crProductSeq;
	}
	public String getCrGoodsName() {
		return crGoodsName;
	}
	public void setCrGoodsName(String crGoodsName) {
		this.crGoodsName = crGoodsName;
	}
	public int getCrGoodsPrice() {
		return crGoodsPrice;
	}
	public void setCrGoodsPrice(int crGoodsPrice) {
		this.crGoodsPrice = crGoodsPrice;
	}
	public String getCrGoodsPhoto() {
		return crGoodsPhoto;
	}
	public void setCrGoodsPhoto(String crGoodsPhoto) {
		this.crGoodsPhoto = crGoodsPhoto;
	}
	public MultipartFile getGoodsFile() {
		return goodsFile;
	}
	public void setGoodsFile(MultipartFile goodsFile) {
		this.goodsFile = goodsFile;
	}
	@Override
	public String toString() {
		return "crowdGoods [crGoodsNo=" + crGoodsNo + ", crProductSeq=" + crProductSeq + ", crGoodsName=" + crGoodsName
				+ ", crGoodsPrice=" + crGoodsPrice + ", crGoodsPhoto=" + crGoodsPhoto + ", goodsFile=" + goodsFile
				+ "]";
	}
	
	
}
