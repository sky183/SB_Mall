package com.sb.mall.crowd.model;

import java.util.List;

public class crowdWriteCommand {
	private crowdBoard crowdBoard;
	private crowdProduct crowdProduct;
	private List<crowdGoods> goodsList;
	private List<crowdOption> optionList;
	public crowdBoard getCrowdBoard() {
		return crowdBoard;
	}
	public void setCrowdBoard(crowdBoard crowdBoard) {
		this.crowdBoard = crowdBoard;
	}
	public crowdProduct getCrowdProduct() {
		return crowdProduct;
	}
	public void setCrowdProduct(crowdProduct crowdProduct) {
		this.crowdProduct = crowdProduct;
	}
	public List<crowdGoods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<crowdGoods> goodsList) {
		this.goodsList = goodsList;
	}
	public List<crowdOption> getOptionList() {
		return optionList;
	}
	public void setOptionList(List<crowdOption> optionList) {
		this.optionList = optionList;
	}
	@Override
	public String toString() {
		return "crowdWriteCommand [crowdBoard=" + crowdBoard + ", crowdProduct=" + crowdProduct + ", goodsList="
				+ goodsList + ", optionList=" + optionList + "]";
	}
	
	
	
	
	
	
}
