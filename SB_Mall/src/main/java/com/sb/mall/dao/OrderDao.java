package com.sb.mall.dao;

import java.util.List;
import java.util.Map;

import com.sb.mall.model.Order;
import com.sb.mall.model.OrderDetail;
import com.sb.mall.model.Product;

public interface OrderDao {
	
	public int insertCart(Order order);
	public int insertOrder(Order order);
	public int insertOrderDetail(OrderDetail orderDetail);
	public int update(Order order);
	public int updateStatus(Map<String, Object> map); //int orderSeq, int status
	public int delete(int orderSeq);
	public List<Order> selectAll();
	public List<Order> selectColumn(Map<String, Object> map); //String where, String column
	public List<Order> selectJoin(Map<String, Object> map); //String joinTable, String where, String column
	public List<Order> selectMemberOrder(String userId);
	public List<Order> select(String orderDetailNum);
	public List<Map<String,Object>> selectCart(int userSeq);
	public List<Map<String,Object>> selectOrderAndProduct(int productSeq);
	public Product selectProduct(int productSeq);
	public Order selectOrder(int orderSeq);
	public int selectCount();
	public List<Object> selectList(int firstRow, int endRow);

}
