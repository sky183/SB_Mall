package com.sb.mall.crowd.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.mall.crowd.dao.CrowdDao;

@Repository
public class CrowdBoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private CrowdDao crowdDao;
	
	public List<Map<String, Object>> getCrowdBoard(int crowdPageCount,int pageShowCnt){
		crowdDao=sqlSessionTemplate.getMapper(CrowdDao.class);
		
		int startBoard = (crowdPageCount-1)*pageShowCnt;
		System.out.println("startBoard : "+startBoard+", pageShowCnt : "+pageShowCnt);
		return crowdDao.selectCrowdBoard(startBoard, pageShowCnt);
	}
	public int getBoardPageCnt(int viewAmount) {
		crowdDao=sqlSessionTemplate.getMapper(CrowdDao.class);
		int totalPage = crowdDao.getBoardPageCnt(); 
		
		int paging = totalPage/viewAmount;
		
		if(paging==0) {
			paging=1;
		}
		
		return paging;
	}
	
}
