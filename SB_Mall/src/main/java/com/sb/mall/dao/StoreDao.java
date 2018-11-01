package com.sb.mall.dao;

import java.util.List;
import java.util.Map;

import com.sb.mall.model.Product;
import com.sb.mall.model.SalesBoard;

public interface StoreDao {
	
	public void insertSalesBoard(SalesBoard salesBoard);
	public void insertProduct(Product product);
	public List<Map<String,Object>> selectProAndSalList(String tag);
	public List<Map<String,Object>> selectProAndSal(int salSeq);
	public List<Product> selectProductList();
	public List<SalesBoard> selectSalBoardList();
	public void updateSalBoardCnt(int salSeq);
}
