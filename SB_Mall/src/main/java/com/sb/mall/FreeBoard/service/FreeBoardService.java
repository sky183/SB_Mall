package com.sb.mall.FreeBoard.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.FreeBoard.dao.FreeBoardDao;
import com.sb.mall.FreeBoard.model.FreeBoard;

@Repository
public class FreeBoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private FreeBoardDao freeBoardDao;
	
	/*Create*/
	@Transactional
	public int freeBoardService_Create(FreeBoard freeBoard) throws Exception {
		System.out.println("[freeBoard_Create()]");
		System.out.println("/*Writing..*/");
		
		freeBoardDao = sqlSessionTemplate.getMapper(FreeBoardDao.class);
		
		int resultCnt = 0;
		resultCnt = freeBoardDao.insert_FreeBoard(freeBoard);
		
		System.out.println("/*End of writing*/");
		return resultCnt;
		
	}

}
