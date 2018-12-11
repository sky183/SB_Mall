package com.sb.mall.order.service;

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

import com.sb.mall.order.dao.OrderDao;
import com.sb.mall.order.model.Order;
import com.sb.mall.order.model.OrderDetail;
import com.sb.mall.order.model.OrderItem;
import com.sb.mall.order.model.OrderOrderCommand;

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
	public void insertOrders(String orders) {
		Dao = sessionTemplate.getMapper(OrderDao.class);
		Dao.insertOrderSP(orders);
		System.out.println("or : "+orders);
	}
	
	@Transactional
	public List<Map<String,Object>> getGoodsForOrder(List<OrderItem> orderItems) throws SQLException{
		Dao = sessionTemplate.getMapper(OrderDao.class);
		List<Map<String,Object>> orders = Dao.selectGoodsForOrder(orderItems);
		System.out.println(orders);
		return orders;
	}
	
	@Transactional
	public void insertOrderAndDetail(OrderOrderCommand command) throws SQLException {
		/*String orderDetailNum = new SimpleDateFormat("yyyyMMddssSSS").format(new Date());
		Dao = sessionTemplate.getMapper(OrderDao.class);
		OrderDetail orderDetail = command.getOrderDetail();
		Order order = command.getOrder();
		orderDetail.setOrderDetailNum(orderDetailNum);
		order.setOrderDetailNum(orderDetailNum);
		
		//Dao.updateUserPoint(orderDetail.getTotalAmount(), order.getUserSeq());
		Dao.insertOrderDetail(orderDetail);
		Dao.insertOrder(order);*/
	}
	
	/*@Transactional
	public Product getProduct(int productSeq) throws SQLException {
		Dao = sessionTemplate.getMapper(OrderDao.class);
		Product product = null;
		product = Dao.selectProduct(productSeq);
		return product;
	}*/
	
	@Transactional
	public void insertOrdersAndDetail(int userSeq) throws SQLException {
		String orderDetailNum = new SimpleDateFormat("yyyyMMddssSSS").format(new Date());
		Dao = sessionTemplate.getMapper(OrderDao.class);
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setTotalAmount(0);
		List<Order> orderList = Dao.selectOrdersAll(userSeq);
		for(Order order : orderList) {
			order.setOrderDetailNum(orderDetailNum);
			orderDetail.setTotalAmount(orderDetail.getTotalAmount()+order.getSalePrice());
		}
		orderDetail.setOrderDetailNum(orderDetailNum);
		orderDetail.setUserSeq(userSeq);
		
		Dao.insertOrderDetail(orderDetail);
		Dao.updateOrders(orderList);
	}
}
