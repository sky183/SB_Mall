package com.sb.mall.member.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.member.dao.MemberDao;
import com.sb.mall.member.model.MemberInfo;

@Repository
public class MemberModifyService {

	@Autowired
	SqlSessionTemplate sessionTemplate;

	@Autowired
	private AES256Util aes256Util;

	private MemberDao memberDao;

	public MemberInfo getMember(String id, String pw) throws Exception{
		memberDao = sessionTemplate.getMapper(MemberDao.class);
		MemberInfo memberInfo = new MemberInfo();
		try {
			String enPw = aes256Util.encrypt(pw);
			String findPw = memberDao.checkPw(id);
			if (enPw.equals(findPw)) {
				System.out.println("check");
				memberInfo = memberDao.selectById(id);
				System.out.println(memberInfo);
			}else {
				throw new Exception("비밀번호 다름");
			}
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
		}
		return memberInfo;
	}// end of Method(memberModify)

	public String modifyMember(MemberInfo memberInfo) {
		memberDao = sessionTemplate.getMapper(MemberDao.class);
		memberDao.updateMember(memberInfo);
		return "회원정보 수정 성공";
	}// end of Method(memberModify_end)
	
	public void modifyMemberPw(MemberInfo memberInfo) {
		String pw = memberInfo.getUserPw();
		memberDao = sessionTemplate.getMapper(MemberDao.class);
		if(pw!=null) {
			try {
				memberInfo.setUserPw(aes256Util.encrypt(pw));
				memberDao.updatePw(memberInfo);
			} catch (UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace();
			}
		}
	}// end of Method(memberModify_end)

}
