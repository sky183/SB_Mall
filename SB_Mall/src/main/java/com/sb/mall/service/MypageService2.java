package com.sb.mall.service;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.dao.MemberDao;
import com.sb.mall.dao.OrderDao;
import com.sb.mall.dao.OrderDetailDao;
import com.sb.mall.model.MemberInfo;
import com.sb.mall.model.OrderDetail;

@Repository
public class MypageService2 {
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	private OrderDetailDao orderDetailDao;
	private List<OrderDetail> orderDetail;
	
		public List<OrderDetail> getOrderDetail(int userSeq) {
		System.out.println("MypageService2 실행");
		
		System.out.println("주문한 회원의 번호: "+userSeq);
		orderDetailDao = sessionTemplate.getMapper(OrderDetailDao.class);	
		orderDetail = orderDetailDao.selectOrderDetail_userSqe(userSeq);
		System.out.println(orderDetail.toString());
		return orderDetail;	
	}

}
