package com.sb.mall.crowd.dao;

import java.util.List;
import java.util.Map;

import com.sb.mall.crowd.model.CrowdBoard;
import com.sb.mall.crowd.model.CrowdGoods;
import com.sb.mall.crowd.model.CrowdOption;
import com.sb.mall.crowd.model.CrowdProduct;
import com.sb.mall.crowd.model.CrowdProductPhoto;

public interface CrowdDao {
	
	public int insertCrowdBoard(CrowdBoard crowdBoard); // board 추가
	public int insertCrowdProduct(CrowdProduct crowdProduct); //product 추가 (사진 있을 때)
	public int insertCrowdProductNull(CrowdProduct crowdProduct); //product 추가(사진 없을 때)
	public int insertCrProductPhoto(CrowdProductPhoto crowdProductPhoto); //photo 추가
	public int insertCrProductPhotoNo(CrowdProductPhoto crowdProductPhoto);
	public int insertCrowdGoods(CrowdGoods crowdGoods); // goods추가
	public int insertCrowdOption(CrowdOption crowdOption); //option 추가
	public int getBoardPageCnt(); // 페이지 카운트
	public List<Map<String, Object>> selectCrowdBoard(int pageNum, int pageShowCnt); // 전체 게시판 select
	public List<Map<String, Object>> getDetailBoard(int crowdBoardSeq); // 디테일 board&product select
	public List<Map<String, Object>> getDetailGoods(int crProductSeq); //디테일 goods select
	public List<Map<String, Object>> getDetailPhoto(String productNo); // 디테일 photo select
	public int getPhotoCount(String productNo); // 사진 갯수 파악
	public void setViewSeqUp(int crowdBoardSeq);// 조회수 증가
	public int getViewSeq(int crowdBoardSeq);//조회수 조회
}
