package com.sb.mall.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.dao.OrderDao;
import com.sb.mall.model.Order;
import com.sb.mall.model.OrderDetail;
import com.sb.mall.model.OrderOrderCommand;
import com.sb.mall.model.Product;

@Repository
public class OrderService {
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	private OrderDao Dao;
	
	
	@Transactional
	public List<Order> getOrderByDetailNum(String orderDetailNum) {

		List<Order> orders = new ArrayList<Order>();

		Dao = sessionTemplate.getMapper(OrderDao.class);

		orders = Dao.select(orderDetailNum);
		
		return orders;
	}
	
	@Transactional
	public List<Map<String,Object>> getOrderAndProduct(int productSeq) throws SQLException{
		Dao = sessionTemplate.getMapper(OrderDao.class);
		List<Map<String,Object>> list = null;
		list = Dao.selectOrderAndProduct(productSeq);
		return list;
	}
	
	@Transactional
	public void insertOrderAndDetail(OrderOrderCommand command) throws SQLException {
		String orderDetailNum = new SimpleDateFormat("yyyyMMddssSSS").format(new Date());
		Dao = sessionTemplate.getMapper(OrderDao.class);
		OrderDetail orderDetail = command.getOrderDetail();
		Order order = command.getOrder();
		orderDetail.setOrderDetailNum(orderDetailNum);
		order.setOrderDetailNum(orderDetailNum);
		Dao.insertOrderDetail(orderDetail);
		Dao.insertOrder(order);
	}
	
	@Transactional
	public Product getProduct(int productSeq) throws SQLException {
		Dao = sessionTemplate.getMapper(OrderDao.class);
		Product product = null;
		product = Dao.selectProduct(productSeq);
		return product;
	}
	
	@Transactional
	public void insertOrdersAndDetail(OrderOrderCommand command) throws SQLException {
		String orderDetailNum = new SimpleDateFormat("yyyyMMddssSSS").format(new Date());
		Dao = sessionTemplate.getMapper(OrderDao.class);
		OrderDetail orderDetail = command.getOrderDetail();
		List<Order> orderList = command.getOrders();
		for(Order order : orderList) {
			order.setOrderDetailNum(orderDetailNum);
			System.out.println(order);
		}
		orderDetail.setOrderDetailNum(orderDetailNum);
		Dao.insertOrderDetail(orderDetail);
		Dao.updateOrders(orderList);
	}
}
