package com.sb.mall.FreeBoard.model;

import java.util.Date;

public class FreeBoard {
	
	int boardSeq;
	int userSeq;
	String boardTitle;
	String boardContent;
	Date boardWriteDate;
	String writerName;
	
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardWriteDate() {
		return boardWriteDate;
	}
	public void setBoardWriteDate(Date boardWriteDate) {
		this.boardWriteDate = boardWriteDate;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	
	@Override
	public String toString() {
		return "<자유게시판> [boardSeq=" + boardSeq + ", userSeq=" + userSeq + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardWriteDate=" + boardWriteDate + ", writerName=" + writerName
				+ "]";
	}
	
}
