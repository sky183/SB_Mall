package com.sb.mall.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sb.mall.dao.QnADao;
import com.sb.mall.model.QnABoard;

@Service
public class QnAListViewService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private QnADao qnaDao;
	
	public List<QnABoard> qnaAndMemList() {
		qnaDao=sqlSessionTemplate.getMapper(QnADao.class);
		List<QnABoard> list = null;
		try {
			list = qnaDao.listAll();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	};
	
}
