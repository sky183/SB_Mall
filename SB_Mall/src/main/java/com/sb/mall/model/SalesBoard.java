package com.sb.mall.model;

import java.text.SimpleDateFormat;

public class SalesBoard {
	
	private int SalesSeq;
	private String title;
	private String text;
	private int viewSeq;
	private String writeDate;
	private int userSeq;
	private int productSeq;
	
	@Override
	public String toString() {
		return "SalesBoard [SalesSeq=" + SalesSeq + ", title=" + title + ", text=" + text + ", viewSeq=" + viewSeq
				+ ", writeDate=" + writeDate + ", userSeq=" + userSeq + ", productSeq=" + productSeq + "]";
	}
	public int getSalesSeq() {
		return SalesSeq;
	}
	public void setSalesSeq(int salesSeq) {
		SalesSeq = salesSeq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getViewSeq() {
		return viewSeq;
	}
	public void setViewSeq(int viewSeq) {
		this.viewSeq = viewSeq;
	}
	public String getWriteDate() {
		return new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(writeDate);
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
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
	
	
	
	

}
