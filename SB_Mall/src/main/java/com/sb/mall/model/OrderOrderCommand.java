package com.sb.mall.model;

import java.util.List;

public class OrderOrderCommand {
	
	private Order order;
	private List<Order> orders;
	private OrderDetail orderDetail;
	
	@Override
	public String toString() {
		return "OrderOrderCommand [order=" + order + ", orders=" + orders + ", orderDetail=" + orderDetail + "]";
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public OrderDetail getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}
	
}
