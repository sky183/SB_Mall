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
	public QnABoard qnaWriteAns(int qnaSeq) {
		
		QnABoard qnaBoard = new QnABoard();
		
		qnaDao = sqlSessionTemplate.getMapper(QnADao.class);
		
		qnaBoard = qnaDao.reply(qnaSeq);
		
		if (qnaSeq == qnaBoard.getQnaSeq()) {
			qnaboard = qnaBoard;
		} else {
			System.out.println("조회 가능한 QnA가 없음");
		}
			System.out.println("qnaDao : " + qnaDao);
		
			return qnaboard;
			
	}

}
