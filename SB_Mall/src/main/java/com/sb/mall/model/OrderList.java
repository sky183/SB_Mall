package com.sb.mall.model;

import java.util.List;

public class OrderList {

	private List<Order> orderList;

	@Override
	public String toString() {
		return "OrderList [orderList=" + orderList + "]";
	}

	public List<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	
}
