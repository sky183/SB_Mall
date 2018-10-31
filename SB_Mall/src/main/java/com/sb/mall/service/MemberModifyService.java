package com.sb.mall.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.dao.MemberDao;
import com.sb.mall.model.MemberInfo;

@Repository
public class MemberModifyService {

	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	private MemberDao memberDao;
	private MemberInfo memberResult;
	
	public MemberInfo memberModify(String userId) {
		
		MemberInfo memberInfo = new MemberInfo();
		
		memberDao = sessionTemplate.getMapper(MemberDao.class);
		
		memberInfo = memberDao.selectById(userId);
		
		if (userId.equals(memberInfo.getUserId())) {
			memberResult = memberInfo;
		}else {
			System.out.println("조회 가능한 member가 없음");
		}
		
		return memberResult;
	}

}
