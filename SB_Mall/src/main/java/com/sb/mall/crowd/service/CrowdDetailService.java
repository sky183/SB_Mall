package com.sb.mall.crowd.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sb.mall.crowd.dao.CrowdDao;
import com.sb.mall.crowd.dao.CrowdReplyDao;
import com.sb.mall.crowd.model.CrowdBoardRating;

@Component
public class CrowdDetailService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private CrowdDao crowdDao;
	private CrowdReplyDao crowdReplyDao;
	
	//디테일 페이지 게시판 정보
	public List<Map<String, Object>> getCrBoard(int crBoardSeq){
		crowdDao = sqlSessionTemplate.getMapper(CrowdDao.class);
		
		return crowdDao.getDetailBoard(crBoardSeq);
	}
	
	public List<Map<String, Object>> getCrPhoto(String productNo){
		crowdDao = sqlSessionTemplate.getMapper(CrowdDao.class);
	
		return crowdDao.getDetailPhoto(productNo);
	}
	
	public List<Map<String, Object>> getCrGoods(int crProductSeq){
		crowdDao = sqlSessionTemplate.getMapper(CrowdDao.class);
	
		return crowdDao.getDetailGoods(crProductSeq);
	}
	
	public int getPhotoCount(String productNo) {
		crowdDao = sqlSessionTemplate.getMapper(CrowdDao.class);
		
		return crowdDao.getPhotoCount(productNo);
	}
	
	public void setViewSeqUps(int crowdBoardSeq) {
		crowdDao = sqlSessionTemplate.getMapper(CrowdDao.class);
		crowdDao.setViewSeqUp(crowdBoardSeq);
	}
	
	public CrowdBoardRating topRating(int crowdBoardSeq) {
		crowdReplyDao = sqlSessionTemplate.getMapper(CrowdReplyDao.class);
		CrowdBoardRating boardRating = new CrowdBoardRating();
		int top =0;
		int mid=0;
		int bottom=0;
		Integer totalRating = crowdReplyDao.getTotalRating(crowdBoardSeq);
		
		if(totalRating!=0) {
			int count = crowdReplyDao.getReplyCount(crowdBoardSeq);
			boardRating.setCount(count);
			Double ratingCnt = (double) count;
			int midResult = (int) (totalRating/ratingCnt*10);

				
			top = midResult/10;
			boardRating.setTop(top);
			mid = midResult%10;
			boardRating.setMid(mid);
			if(top<5) {
				bottom = 5-((int)(top)+1);
				boardRating.setBottom(bottom);
			}
			
		}else {
			boardRating.setTop(0);
			boardRating.setMid(0);
			boardRating.setBottom(0);
		}
		
		return boardRating;
	}
	
	
	public int getViewCount(int crowdBoardSeq) {
		crowdDao = sqlSessionTemplate.getMapper(CrowdDao.class);
		
		return crowdDao.getViewSeq(crowdBoardSeq);
	}
	
	
}
