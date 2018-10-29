package com.sb.mall.dao;

import java.util.List;
import java.util.Map;

import com.sb.mall.model.Order;

public interface OrderDao {
	
	public int insert(Order order);
	public int update(Order order);
	public int updateStatus(Map<String, Object> map); //int orderSeq, int status
	public int delete(int orderSeq);
	public List<Order> selectAll();
	public List<Order> selectColumn(Map<String, Object> map); //String where, String column
	public List<Order> selectJoin(Map<String, Object> map); //String joinTable, String where, String column
	public List<Order> selectMemberOrder(String userId);
	public List<Order> select(int orderDetailNum);
	public Order selectOrder(int orderSeq);

}
