package com.sb.mall.FreeBoard.dao;

import java.util.List;

import com.sb.mall.FreeBoard.model.FreeBoard;

public interface FreeBoardDao {
	
	//List 보기
	public List<FreeBoard> selectAll_FreeBoard() throws Exception;
	//Create
	public int insert_FreeBoard(FreeBoard freeBoard) throws Exception;
	//Read
	public FreeBoard select_FreeBoard(int boardSeq) throws Exception;
	//Update
	public int update_FreeBoard(FreeBoard freeBoard) throws Exception;
	//Dalete
	public int delete_FreeBoard(int boardSeq) throws Exception;
	

}
