package com.sb.mall.member.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.member.dao.MemberDao;

@Repository
public class MemberFindService {

	@Autowired
	private SqlSessionTemplate sqlsessionTemplates;

	private MemberDao Dao;

	
	public String findId(HttpServletResponse response ,String userName,String phone) throws Exception{

		Dao = sqlsessionTemplates.getMapper(MemberDao.class);
	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		String id = Dao.find_id(userName,phone);

		if (id == null) {
			
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();

			return null;

		}else {
			return id;
		}

	}

}
