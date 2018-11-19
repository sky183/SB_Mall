package com.sb.mall.crowd.model;

import org.springframework.web.multipart.MultipartFile;

public class crowdProduct {
	private int productSeq;
	private int salesSeq;
	private int crowdBoardSeq;
	private int price;
	private String productName;
	private String photo;
	private MultipartFile photoFile;
	private String detail;
	
	
	public int getProductSeq() {
		return productSeq;
	}
	public void setProductSeq(int productSeq) {
		this.productSeq = productSeq;
	}
	public int getSalesSeq() {
		return salesSeq;
	}
	public void setSalesSeq(int salesSeq) {
		this.salesSeq = salesSeq;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public MultipartFile getPhotoFile() {
		return photoFile;
	}
	public void setPhotoFile(MultipartFile photoFile) {
		this.photoFile = photoFile;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	@Override
	public String toString() {
		return "crowdProduct [productSeq=" + productSeq + ", salesSeq=" + salesSeq + ", price=" + price
				+ ", productName=" + productName + ", photo=" + photo + ", photoFile=" + photoFile + ", detail="
				+ detail + "]";
	}
	public int getCrowdBoardSeq() {
		return crowdBoardSeq;
	}
	public void setCrowdBoardSeq(int crowdBoardSeq) {
		this.crowdBoardSeq = crowdBoardSeq;
	}
	
	
}
