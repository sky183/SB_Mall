package com.sb.mall.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.dao.MemberDao;
import com.sb.mall.model.MemberInfo;

@Repository
public class MemberListService {
	
	@Autowired
	SqlSessionTemplate sessionTemplate;

	private MemberDao memberDao;
	
	@Transactional
	public List<MemberInfo> getMemberList() throws Exception {

		List<MemberInfo> members = new ArrayList<MemberInfo>();

		memberDao = sessionTemplate.getMapper(MemberDao.class);

		members = memberDao.selectAll();
		
		return members;

	}
}
