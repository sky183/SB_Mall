package com.sb.mall.service;


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
	
	private OrderDetail orderDetail;
	
		public OrderDetail myPageService2(int userSeq) {
		System.out.println("MypageService2 실행");
		orderDetailDao = sessionTemplate.getMapper(OrderDetailDao.class);
		
		
			
		orderDetail = orderDetailDao.selectOrderDetail2(userSeq);
		if (orderDetail.getUserSeq() != userSeq) {
			System.out.println("주문내역이 없습니다.");
			System.out.println("MypageService2 종료");
			return orderDetail;
		}else {
			System.out.println(orderDetail.toString());
			System.out.println("MypageService2 종료");
			return orderDetail;	
		}		
	}

}
