package com.sb.mall.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sb.mall.dao.StoreDao;

@Service
public class StoreListViewService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private StoreDao storeDao;
	

	public List<Map<String,Object>> ListView() throws SQLException{
		storeDao=sqlSessionTemplate.getMapper(StoreDao.class);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		try {
			list = storeDao.selectListBoardList();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	};
	
}
