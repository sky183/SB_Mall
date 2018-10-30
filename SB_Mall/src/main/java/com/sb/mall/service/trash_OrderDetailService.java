package com.sb.mall.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.dao.OrderDetailDao;
import com.sb.mall.model.OrderDetail;

@Repository
public class trash_OrderDetailService {
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	private OrderDetailDao Dao;
	
	@Transactional
	public void addOrderDetail(OrderDetail OrderDetail) throws Exception {

		Dao = sessionTemplate.getMapper(OrderDetailDao.class);

		Dao.insert(OrderDetail);
		
	}
	
	
	@Transactional
	public List<OrderDetail> getOrderDetailList() throws Exception {

		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();

		Dao = sessionTemplate.getMapper(OrderDetailDao.class);

		orderDetails = Dao.selectAll();
		
		return orderDetails;
	}
	
}
