package com.sb.mall.store.dao;

import java.util.List;
import java.util.Map;

import com.sb.mall.store.model.Reply;

public interface ReplyDao {
	public List<Map<String, Object>> getReply(int salesSeq, int firstRow);
	public int getReplyCount(int salesSeq);
	public int writeReply(Reply reply);
	public int deleteReply(int replySeq);

}
