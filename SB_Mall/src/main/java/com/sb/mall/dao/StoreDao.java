package com.sb.mall.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.sb.mall.model.Product;
import com.sb.mall.model.SalesBoard;

public interface StoreDao {
	
	public void insertSalesBoard(SalesBoard salesBoard) throws SQLException;
	public void insertProduct(Product product) throws SQLException;
	public List<Map<String,Object>> selectListBoardList() throws SQLException;
}
