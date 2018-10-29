package com.sb.mall.service;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.sb.mall.dao.LoginDaoInterface;
import com.sb.mall.model.MemberInfo;

public class LoginService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private LoginDaoInterface LoginDao;

	public boolean login(String id, String pw, HttpSession session) throws SQLException {

		LoginDao = sqlSessionTemplate.getMapper(LoginDaoInterface.class);

		boolean result = false;

		MemberInfo memberInfo = LoginDao.getMemberInfo(id);

		// 비밀번호 비교
		if (memberInfo != null & memberInfo.getUserPw().equals(pw)) {

			System.out.println("로그인처리");

			// 로그인 처리 : 세션에 사용자 데이터 저장
			memberInfo.setUserPw("");

			session.setAttribute("loginInfo", memberInfo);

			result = true;

		}

		return result;

	}

}
