package com.sb.mall.model;

public class Reply {
	private int replySeq;
	private String reply;
	private String regTime;
	private int userSeq;
	private int salesSeq;
	
	public int getReplySeq() {
		return replySeq;
	}
	public void setReplySeq(int replySeq) {
		this.replySeq = replySeq;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getRegTime() {
		return regTime;
	}
	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public int getSalesSeq() {
		return salesSeq;
	}
	public void setSalesSeq(int salesSeq) {
		this.salesSeq = salesSeq;
	}

}
