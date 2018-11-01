package com.sb.mall.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.dao.MemberDao;
import com.sb.mall.model.MemberInfo;

@Repository
public class MypageService {
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	private MemberDao memberDao;
	private MemberInfo memberInfo;
	
//	public Join_memberInfoAndOrder myPageService(int userSeq) {
		public MemberInfo getMemberInfo(String userId) {
		System.out.println("MypageService 실행");
		//sql 실행
		memberDao = sessionTemplate.getMapper(MemberDao.class);
		
		//결과값 
//		Join_memberInfoAndOrder result = memberDao.join_memberInfoAndOrder(userSeq);
		memberInfo = memberDao.selectById(userId);
		
		System.out.println(memberInfo.toString());
		System.out.println("MypageService 종료");
		
		return memberInfo;
	}

}
