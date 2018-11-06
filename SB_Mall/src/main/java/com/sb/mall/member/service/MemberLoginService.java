package com.sb.mall.member.service;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.member.dao.MemberDao;
import com.sb.mall.member.model.MemberInfo;

@Repository
public class MemberLoginService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private MemberDao Dao;

	public boolean login(String id, String pw, HttpSession session) throws SQLException {

		Dao = sqlSessionTemplate.getMapper(MemberDao.class);

		boolean result = false;

		MemberInfo memberInfo = Dao.selectById(id);

		// 비밀번호 비교
		if (memberInfo == null || !memberInfo.getUserPw().equals(pw)) {
				
		} else {
			System.out.println("로그인처리");

			// 로그인 처리 : 세션에 사용자 데이터 저장
			memberInfo.setUserPw("");

			session.setAttribute("memberInfo", memberInfo);

			result = true;
		}

		return result;

	}

}
