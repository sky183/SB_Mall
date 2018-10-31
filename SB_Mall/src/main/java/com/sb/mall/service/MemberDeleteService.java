package com.sb.mall.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.dao.MemberDao;

@Repository
public class MemberDeleteService {

	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	private MemberDao memberDao;
	
	public int memberDelete(String userId) {
		System.out.println("MemberDeleteService");
		System.out.println("<**회원 삭제 시작**>");
		
		memberDao = sessionTemplate.getMapper(MemberDao.class);
		
		int deleteResult = memberDao.delete(userId);
		
		System.out.println("<**회원 삭제 완료**>");
		
		return deleteResult;
	}

}
