package com.sb.mall.model;

public class QnAWriteCommand {

	private QnABoard qnaBoard;
	private MemberInfo memberInfo;
	
	@Override
	public String toString() {
		return "QnAWriteCommand [qnaBoard=" + qnaBoard + ", memberInfo=" + memberInfo + "]";
	}

	public QnABoard getQnaBoard() {
		return qnaBoard;
	}

	public void setQnaBoard(QnABoard qnaBoard) {
		this.qnaBoard = qnaBoard;
	}

	public MemberInfo getMemberInfo() {
		return memberInfo;
	}

	public void setMemberInfo(MemberInfo memberInfo) {
		this.memberInfo = memberInfo;
	}

	
	
}
