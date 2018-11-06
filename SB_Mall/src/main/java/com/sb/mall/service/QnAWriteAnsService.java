package com.sb.mall.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.dao.QnADao;
import com.sb.mall.model.QnABoard;

@Service
public class QnAWriteAnsService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private QnADao qnaDao;
	private QnABoard qnaboard;

	@Transactional
	public void qnaWriteAns(QnABoard qnaBoard) {
		
		qnaDao = sqlSessionTemplate.getMapper(QnADao.class);
		
		try {
			qnaDao.reply(qnaBoard);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}

}