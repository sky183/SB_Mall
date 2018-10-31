package com.sb.mall.model;

public class OrderOrderCommand {
	
	private Order order;
	private OrderDetail orderDetail;
	
	@Override
	public String toString() {
		return "OrderOrderCommand [order=" + order + ", orderDetail=" + orderDetail + "]";
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public OrderDetail getOrderDetail() {
		return orderDetail;
	}
	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}

}
