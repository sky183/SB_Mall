package com.sb.mall.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.dao.MemberDao;
import com.sb.mall.model.MemberInfo;

public class JoinService {
		
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private MemberDao memberDao;
	
		
	
	@Transactional
	public int joinResult(MemberInfo memberInfo, HttpServletRequest request) 
			throws SQLException, IllegalStateException, IOException {
		
		memberDao = sqlSessionTemplate.getMapper(MemberDao.class);
		
		
		//conn = ConnectionProvider.getConnection();
		int resultCnt = 0 ;
		
		// 물리적 저장 경로
		String uploadUri = "/uploadfile/userphoto";
		// uploadUri 경로의 시스템 경로
		String dir = request.getSession().getServletContext().getRealPath(uploadUri);
		
			resultCnt = memberDao.insert(memberInfo);
			System.out.println("<Service Message>");
			System.out.println("가입한 회원 ID:" + memberInfo.getUserId());

		return resultCnt;
		
	}
}
