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

	public MemberInfo getMember(String id, String pw) {
		memberDao = sessionTemplate.getMapper(MemberDao.class);
		MemberInfo memberInfo = new MemberInfo();
		try {
			String enPw = aes256Util.encrypt(id);
			String findPw = memberDao.find_pw(id, pw);
			if (enPw.equals(findPw)) {
				memberInfo = memberDao.selectById(id);
			}else {
				System.out.println("비밀번호 다름");
			}
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
		}
		return memberInfo;
	}// end of Method(memberModify)

	public String modifyMember(MemberInfo updateMember) {
		String pw = updateMember.getUserPw();
		memberDao = sessionTemplate.getMapper(MemberDao.class);
		if(pw!=null) {
			try {
				updateMember.setUserPw(aes256Util.encrypt(pw));
				memberDao.update(updateMember);
			} catch (UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace();
				return "회원정보 수정 실패";
			}
		}
		return "회원정보 수정 성공";
	}// end of Method(memberModify_end)

}
