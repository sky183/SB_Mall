package com.sb.mall.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sb.mall.dao.QnADao;
import com.sb.mall.model.QnABoard;
import com.sb.mall.model.MemberInfo;;

@Service
public class QnABoardListService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private QnADao qnaDao;
	
	public List<Map<String,Object>> qnaList() throws SQLException{
		qnaDao=sqlSessionTemplate.getMapper(QnADao.class);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			list = qnaDao.selectQnAList();
		return list;
	};
	
	public List<QnABoard> QnABoard() throws SQLException{
		qnaDao=sqlSessionTemplate.getMapper(QnADao.class);
		List<QnABoard> list = new ArrayList<QnABoard>();
				list = qnaDao.selectQnABoard();
		return list;
	}
	
	public List<MemberInfo> MemberInfo() throws SQLException{
		qnaDao=sqlSessionTemplate.getMapper(QnADao.class);
		List<MemberInfo> list = new ArrayList<MemberInfo>();
			list = qnaDao.selectMemberInfo();
		return list;
	}
	
}
