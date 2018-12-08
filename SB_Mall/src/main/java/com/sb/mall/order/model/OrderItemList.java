package com.sb.mall.order.model;

import java.util.List;

public class OrderItemList {
	
	private List<OrderItem> orders;

	@Override
	public String toString() {
		return "OrderItemList [orders=" + orders + "]";
	}

	public List<OrderItem> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderItem> orders) {
		this.orders = orders;
	}

}
