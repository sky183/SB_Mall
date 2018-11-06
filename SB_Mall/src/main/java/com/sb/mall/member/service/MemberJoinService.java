package com.sb.mall.member.service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.member.dao.MemberDao;
import com.sb.mall.member.model.MemberInfo;

public class MemberJoinService {
		
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private MemberDao memberDao;
	
		
	
	@Transactional
	public int joinResult(MemberInfo memberInfo, HttpServletRequest request) 
			throws SQLException, IllegalStateException, IOException {
		
		memberDao = sqlSessionTemplate.getMapper(MemberDao.class);
		
		int resultCnt = 0 ;
		
			resultCnt = memberDao.insert(memberInfo);
			System.out.println("<Service Message>");
			System.out.println("가입한 회원 ID:" + memberInfo.getUserId());

		return resultCnt;
		
	}
}
