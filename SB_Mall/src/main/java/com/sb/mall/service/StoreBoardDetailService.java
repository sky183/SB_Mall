package com.sb.mall.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.dao.StoreDao;

@Service
public class StoreBoardDetailService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private StoreDao storeDao;
	
	@Transactional
	public List<Map<String,Object>> SalDetailView(int salSeq) throws SQLException{
		storeDao = sqlSessionTemplate.getMapper(StoreDao.class);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		try {
			 list = storeDao.selectProAndSal(salSeq);
			 storeDao.updateSalBoardCnt(salSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
