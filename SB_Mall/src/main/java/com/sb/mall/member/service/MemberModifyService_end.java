package com.sb.mall.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.member.dao.MemberDao;
import com.sb.mall.member.model.MemberInfo;

@Repository
public class MemberModifyService_end {

	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	private MemberDao memberDao;

	
	public int memberModify_end(MemberInfo updateMember) {
		
		int updateMemberCnt;
		
		memberDao = sessionTemplate.getMapper(MemberDao.class);
		
		updateMemberCnt = memberDao.update(updateMember);
		
		/*if (userId.equals(memberInfo.getUserId())) {
			memberResult = memberInfo;
		}else {
			System.out.println("조회 가능한 member가 없음");
		}*/
		
		return updateMemberCnt;
	}

}
