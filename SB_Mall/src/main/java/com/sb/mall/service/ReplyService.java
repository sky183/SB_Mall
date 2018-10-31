package com.sb.mall.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sb.mall.dao.ReplyDao;
import com.sb.mall.model.Reply;

@Component
public class ReplyService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private ReplyDao replyDao;
	
	public List<Map<String, Object>> getReplys(int salesSeq, int nowPage){
		System.out.println("reply service in");
		
		List<Map<String, Object>> replyList = new ArrayList<Map<String, Object>>();
		
		replyDao = sqlSessionTemplate.getMapper(ReplyDao.class);
		
		int firstRow = (nowPage-1)*5;
		System.out.println("salesSeq : "+salesSeq+" , firstRow : "+firstRow);
		System.out.println("getReply before");
		replyList = replyDao.getReply(salesSeq,firstRow);
		System.out.println("getReply after");
		
		return replyList!=null?replyList:null;
	}
	
	
	public int getReplyCount() {
		replyDao = sqlSessionTemplate.getMapper(ReplyDao.class);
		int reCnt;
		int pageCnt=0;
		
		reCnt = replyDao.getReplyCount();
		pageCnt = (reCnt/5);
		
		if(reCnt%5>0) {
			pageCnt+=1;
		}
		System.out.println("pageCnt : "+pageCnt);
		
		return pageCnt;
	}
}
