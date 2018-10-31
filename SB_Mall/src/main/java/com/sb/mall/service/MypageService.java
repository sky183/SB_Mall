package com.sb.mall.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.dao.MemberDao;
import com.sb.mall.model.Join_memberInfoAndOrder;

@Repository
public class MypageService {
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	private MemberDao memberDao;
	
	public List<Join_memberInfoAndOrder> myPage(String userId) {
		
		//sql 실행
		memberDao = sessionTemplate.getMapper(MemberDao.class);
		
		//결과값 
		List<Join_memberInfoAndOrder> list = memberDao.join_memberInfoAndOrder(userId);
		return list;
	}

}
