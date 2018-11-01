package com.sb.mall.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		List<Order> checklist=orderDao.checkDuplicateCart(order);
		System.out.println(checklist.isEmpty());
		if(checklist.isEmpty()) {
			orderDao.insertCart(order);
		}else {
			orderDao.updateDuplicateCart(order);
		}
		
	}
	
	@Transactional
	public void deleteCart(String orderSeq) {
		
	}
	
	public List<Map<String,Object>> selectCart(int userSeq) throws SQLException{
		List<Map<String,Object>> list = null;
		orderDao=sqlSessionTemplate.getMapper(OrderDao.class);
		list= orderDao.selectCart(userSeq);
		return list;
	}
	
	@Transactional
	public List<Map<String,Object>> selectCartForOrder(List<Order> orderList) throws SQLException{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userSeq", orderList.get(0).getUserSeq());
		map.put("orderList", orderList);
		List<Map<String,Object>> list = null;
		orderDao=sqlSessionTemplate.getMapper(OrderDao.class);
		list= orderDao.selectCartForOrder(orderList);
		return list;
	}
	
}
