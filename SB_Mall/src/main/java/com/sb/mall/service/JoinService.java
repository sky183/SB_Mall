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
	
	//@Autowired
	//private MemberDao memberDao;
	
	//@Autowired
	//private JdbcTemplateMemberDao memberDao;
	
	//@Autowired
	//private MybatisMemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private MemberDao memberDao;
	
		
	
	@Transactional
	public int memberReg(MemberInfo memberInfo, HttpServletRequest request) 
			throws SQLException, IllegalStateException, IOException {
		
		memberDao = sqlSessionTemplate.getMapper(MemberDao.class);
		
		
		//conn = ConnectionProvider.getConnection();
		int resultCnt = 0 ;
		
		// 물리적 저장 경로
		String uploadUri = "/uploadfile/userphoto";
		// uploadUri 경로의 시스템 경로
		String dir = request.getSession().getServletContext().getRealPath(uploadUri);
		
		
		/*// DB 저장용 파일 이름, 물리적 저장할때의 이름
		String imgName = "";
		
		if(!memberInfo.getPhotoFile().isEmpty()) {
			
			imgName = memberInfo.getUserId()+"_"+memberInfo.getPhotoFile().getOriginalFilename();
			
			// 물리적 저장
			memberInfo.getPhotoFile().transferTo(new File(dir, imgName));
					
			
			// DB 에 저장할 이름 SET
			memberInfo.setUserPhoto(imgName);
		}*/
		
		//try {	
			//conn.setAutoCommit(false);
			
			resultCnt = memberDao.insert(memberInfo);
			
			//memberDao.insertMemberInfo(memberInfo);
			
			System.out.println("service - 신규 회원 의 IDX 값 : " + memberInfo.getUserId());
			
			//conn.commit();
		//} catch (Exception e) {
		//	JdbcUtil.rollback(null);
		//	throw e;
		//} finally {
		//	conn.setAutoCommit(false);
		//	JdbcUtil.close(conn);
		//}
		
		return resultCnt;
		
	}
}
