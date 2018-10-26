package com.sb.mall.dao;

import java.sql.SQLException;

import com.sb.mall.model.Product;
import com.sb.mall.model.SalesBoard;

public interface StoreDao {
	
	public void insertSalesBoard(SalesBoard salesBoard) throws SQLException;
	public void insertProduct(Product product) throws SQLException;

}
