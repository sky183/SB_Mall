package com.sb.mall.dao;

import java.util.List;
import java.util.Map;

import com.sb.mall.model.MemberInfo;
import com.sb.mall.model.QnABoard;

public interface QnADao {

	public void insertQnABoard(QnABoard qnaBoard);
	public void insertMemberInfo(MemberInfo memberInfo);
	public List<Map<String,Object>> selectQnAList();
	public List<Map<String,Object>> selectQnA(int qnaSeq);
	public List<QnABoard> selectQnABoard();
	public List<MemberInfo> selectMemberInfo();
	public void updateQnABoardCnt(int qnaSeq);
	
}
