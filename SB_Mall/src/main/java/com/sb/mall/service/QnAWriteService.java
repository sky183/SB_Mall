package com.sb.mall.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.dao.QnADao;
import com.sb.mall.model.MemberInfo;
import com.sb.mall.model.QnABoard;

@Service
public class QnAWriteService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private QnADao qnaDao;
	
	@Transactional
	public void qnaWrite(MemberInfo memberInfo, QnABoard qnaBoard) {
		
		qnaDao = sqlSessionTemplate.getMapper(QnADao.class);
		
		try {
			qnaBoard.setUserSeq(memberInfo.getUserSeq());
			qnaDao.create(qnaBoard);
			System.out.println("qnaDao : " + qnaDao);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
