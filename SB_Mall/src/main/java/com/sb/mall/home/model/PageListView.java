package com.sb.mall.home.model;

import java.util.List;


public class PageListView {
	private int objTotalCount;
	private int currentPageNumber;
	private List<Object> objList;
	private int pageTotalCount;
	private int objCountPerPage;
	private int firstRow;
	private int endRow;
	
	
	public PageListView(List<Object> objList, int objtotalCount, int currentPageNumber,
			int objCountPerPage, int firstRow, int endRow) {
		this.objList = objList;
		this.objTotalCount = objtotalCount;
		this.currentPageNumber = currentPageNumber;
		this.objCountPerPage = objCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		calculatePageTotalCount();
	}
	
	//페이지 계산하기 - 메세지 총 갯수가 0이면 페이지 총 갯수도 0이다.
	//메세지 총 갯수가 0이 아니면 메세지 페이지 총 갯수는 메세지 총 갯수 / 10이다.
	//여기서 메세지 총 갯수를 10으로 나눈 나머지가 0보다 크면 페이지 총 갯수에 하나 더 추가해준다.
	private void calculatePageTotalCount() {
		if (objTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = objTotalCount / objCountPerPage;
			if (objTotalCount % objCountPerPage > 0) {
				pageTotalCount++;
			}
		}

	}
	
	public boolean isEmpty() {
		return objTotalCount == 0;
	}
	
	public int getObjTotalCount() {
		return objTotalCount;
	}
	
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	public List<Object> getObjList() {
		return objList;
	}
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	public int getObjCountPerPage() {
		return objCountPerPage;
	}
	public int getFirstRow() {
		return firstRow;
	}
	public int getEndRow() {
		return endRow;
	}


	
}
