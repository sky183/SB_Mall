package com.sb.mall.member.service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.member.dao.MemberDao;
import com.sb.mall.member.model.MemberInfo;

@Repository
public class MemberJoinService {
		
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private MemberDao memberDao;
	
	/*회원가입 Methos*/
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
	
	/*아이디 중복 체크 Method*/
	@Transactional
	public int idCheckResult(String userId, HttpServletRequest request) 
			throws SQLException, IllegalStateException, IOException {
		System.out.println("<Service Message>");
		System.out.println("중복검사 할 ID:"+ userId);
		
		//DB에 입력한 아이디 조회 후 객체 생성
		memberDao = sqlSessionTemplate.getMapper(MemberDao.class);
		MemberInfo user = memberDao.selectById(userId);
		
		if (user != null) {
			System.out.println("가입 불가");
			return 1;
			
		}else {
			System.out.println("가입 가능 :" + userId);
			return 0;
			
		}
		
	}
	
}
