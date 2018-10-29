package com.sb.mall.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sb.mall.dao.StoreDao;
import com.sb.mall.model.Product;
import com.sb.mall.model.SalesBoard;

@Service
public class StoreListViewService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private StoreDao storeDao;
	

	public List<Map<String,Object>> proAndSalList() throws SQLException{
		storeDao=sqlSessionTemplate.getMapper(StoreDao.class);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		try {
			list = storeDao.selectProAndSalList();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	};
	
	public List<Product> productList() throws SQLException{
		storeDao=sqlSessionTemplate.getMapper(StoreDao.class);
		List<Product> list = new ArrayList<Product>();
			try {
				list = storeDao.selectProductList();
			} catch (SQLException e) {
				e.printStackTrace();
				throw e;
			}
		return list;
	}
	
	public List<SalesBoard> salBoardList() throws SQLException{
		storeDao=sqlSessionTemplate.getMapper(StoreDao.class);
		List<SalesBoard> list = new ArrayList<SalesBoard>();
		try {
			list = storeDao.selectSalBoardList();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}
	
	
}