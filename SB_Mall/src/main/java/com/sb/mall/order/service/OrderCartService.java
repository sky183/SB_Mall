package com.sb.mall.order.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.order.dao.OrderDao;
import com.sb.mall.order.model.Order;
import com.sb.mall.order.model.OrderOrderCommand;

@Service
public class OrderCartService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private OrderDao orderDao;
	
	@Transactional
	public void addCart(OrderOrderCommand orderCommand) throws SQLException {
		orderDao=sqlSessionTemplate.getMapper(OrderDao.class);
		List<Order> orderList = orderCommand.getOrders();
		System.out.println(orderList);
		orderDao.insertCart(orderList);
	}
	
	@Transactional
	public void deleteCart(List<Order> orders) throws SQLException {
		orderDao=sqlSessionTemplate.getMapper(OrderDao.class);
		orderDao.deleteCart(orders);
	}
	
	public List<Map<String,Object>> selectCart(int userSeq) throws SQLException{
		List<Map<String,Object>> list = null;
		orderDao=sqlSessionTemplate.getMapper(OrderDao.class);
		list= orderDao.selectCart(userSeq);
		return list;
	}
	
	@Transactional
	public List<Map<String,Object>> selectCartForOrder(List<Order> orders) throws SQLException{
		List<Map<String,Object>> list = null;
		orderDao=sqlSessionTemplate.getMapper(OrderDao.class);
		list= orderDao.selectCartForOrder(orders);
		return list;
	}
	
}
