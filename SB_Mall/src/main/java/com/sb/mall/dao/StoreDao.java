package com.sb.mall.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.sb.mall.model.Product;
import com.sb.mall.model.SalesBoard;

public interface StoreDao {
	
	public void insertSalesBoard(SalesBoard salesBoard) throws SQLException;
	public void insertProduct(Product product) throws SQLException;
	public List<Map<String,Object>> selectProAndSalList() throws SQLException;
	public List<Map<String,Object>> selectProAndSal(int salSeq) throws SQLException;
	public List<Product> selectProductList() throws SQLException;
	public List<SalesBoard> selectSalBoardList() throws SQLException;
	public void updateSalBoardCnt(int salSeq) throws SQLException;
}
