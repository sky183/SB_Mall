package com.sb.mall.service;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.dao.OrderDao;
import com.sb.mall.model.Order;

@Service
public class OrderCartService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private OrderDao orderDao;
	
	@Transactional
	public void addCart(Order order) throws SQLException {
		orderDao=sqlSessionTemplate.getMapper(OrderDao.class);
		orderDao.insertCart(order);
	}
	
	@Transactional
	public void deleteCart(String orderSeq) {
		
	}
	
}
