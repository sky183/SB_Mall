package com.sb.mall.order.dao;

import java.util.List;
import java.util.Map;

import com.sb.mall.order.model.Order;
import com.sb.mall.order.model.OrderDetail;
import com.sb.mall.order.model.OrderItem;
import com.sb.mall.store.model.Product;

public interface OrderDao {
	
	//사용중
	public int upsertCart(String orders);
	public int deleteCart(List<Order> orders);
	
	public int insertOrder(Order order);
	public List<Map<String,Object>> selectGoodsForOrder(List<OrderItem> orderItems); 
	
	public int insertOrderDetail(OrderDetail orderDetail);
	public int updateOrders(List<Order> orders);
	public List<Map<String,Object>> selectCarts(int userSeq);
	public List<Map<String,Object>> selectCartForOrder(List<Order> orders);
	public List<Map<String,Object>> selectOrderAndProduct(int productSeq);
	public Product selectProduct(int productSeq);
	public void updateUserPoint(int totalAmount,int userSeq);
	
	public List<Order> selectOrdersAll(int userSeq);
	
	//성범형
	public List<Order> select(String orderDetailNum);
	
	//public int selectCount();
	//public List<Object> selectList(int firstRow, int endRow);
	//public int update(Order order);
	//public int updateDuplicateCart(Order order);
	//public int updateStatus(Map<String, Object> map); //int orderSeq, int status
	//public List<Order> checkDuplicateCart(Order order);

}
