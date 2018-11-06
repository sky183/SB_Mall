package com.sb.mall.store.model;

public class StoreWriteCommend {
	
	private Product product;
	private SalesBoard salesBoard;
	
	@Override
	public String toString() {
		return "StoreWriteCommend [product=" + product + ", salesBoard=" + salesBoard + "]";
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public SalesBoard getSalesBoard() {
		return salesBoard;
	}
	public void setSalesBoard(SalesBoard salesBoard) {
		this.salesBoard = salesBoard;
	}
	
	

}
