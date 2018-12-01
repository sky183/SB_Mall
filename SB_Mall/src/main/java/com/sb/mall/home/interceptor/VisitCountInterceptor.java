package com.sb.mall.home.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sb.mall.home.dao.HomeDao;

public class VisitCountInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private HomeDao homeDao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		homeDao = sqlSessionTemplate.getMapper(HomeDao.class);

		
		HttpSession session = request.getSession();
		//세션에 방문자수 카운트가 되어있으면 통과 없으면 카운트한다.
		Boolean userCount = (Boolean)session.getAttribute("userCount");
		
		if (userCount != null) {
			return userCount;
		}

		try {
			homeDao.visitToday();
		} catch (Exception e) {
		} finally {
			homeDao.visitCount();
		}

		session.setAttribute("userCount", true);

		return true;

	}
}
