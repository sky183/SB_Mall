package com.sb.mall.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.member.dao.MemberDao;
import com.sb.mall.member.model.MemberInfo;
import com.sb.mall.order.dao.OrderDetailDao;
import com.sb.mall.order.model.OrderDetail;

@Repository
public class MemberMypageService {

	@Autowired
	SqlSessionTemplate sessionTemplate;

	private MemberDao memberDao;
	private MemberInfo memberInfo;

//	public Join_memberInfoAndOrder myPageService(int userSeq) {
	public MemberInfo getMemberInfo(String userId) {
		System.out.println("MypageService 실행");
		// sql 실행
		memberDao = sessionTemplate.getMapper(MemberDao.class);

		// 결과값
//		Join_memberInfoAndOrder result = memberDao.join_memberInfoAndOrder(userSeq);
		memberInfo = memberDao.selectById(userId);

		System.out.println(memberInfo.toString());
		System.out.println("MypageService 종료");

		return memberInfo;
	}

	private OrderDetailDao orderDetailDao;
	private List<OrderDetail> orderDetail;

	public List<OrderDetail> getOrderDetail(int userSeq) {
		System.out.println("MypageService2 실행");

		System.out.println("주문한 회원의 번호: " + userSeq);
		orderDetailDao = sessionTemplate.getMapper(OrderDetailDao.class);
		orderDetail = orderDetailDao.selectOrderDetail_userSqe(userSeq);
		System.out.println(orderDetail.toString());
		return orderDetail;
	}

}
