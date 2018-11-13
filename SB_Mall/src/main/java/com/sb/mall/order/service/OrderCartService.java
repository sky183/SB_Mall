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
import com.sb.mall.store.model.Product;

@Service
public class OrderCartService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private OrderDao orderDao;
	
	@Transactional
	public void addCart(Order order) throws SQLException {
		orderDao=sqlSessionTemplate.getMapper(OrderDao.class);
		List<Order> checklist=orderDao.checkDuplicateCart(order);
		Product product = orderDao.selectProduct(order.getProductSeq());
		order.setSalePrice(product.getPrice()*order.getQuantity()); //제품과 주문수량을 곱하여 주문가격 결정
		if(checklist.isEmpty()) {
			orderDao.insertCart(order);
		}else {
			orderDao.updateDuplicateCart(order);
		}
		
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
