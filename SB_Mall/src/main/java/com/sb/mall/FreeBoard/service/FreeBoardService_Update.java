package com.sb.mall.FreeBoard.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.FreeBoard.dao.FreeBoardDao;
import com.sb.mall.FreeBoard.model.FreeBoard;

@Repository
public class FreeBoardService_Update {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private FreeBoardDao freeBoardDao;
	
	/*Create*/
	@Transactional
	public int freeBoardService_Update(FreeBoard freeBoard) throws Exception {
		System.out.println("[freeBoardService_Update()]");
		System.out.println("/*Updating..*/");
		
		int resultCnt = 0;
		freeBoardDao = sqlSessionTemplate.getMapper(FreeBoardDao.class);
		
		resultCnt = freeBoardDao.update_FreeBoard(freeBoard);
		System.out.println("resultCnt :"+ resultCnt);
		System.out.println(freeBoard.toString());
		System.out.println("/*End of Updating*/");
		return resultCnt;
		
	}

}
