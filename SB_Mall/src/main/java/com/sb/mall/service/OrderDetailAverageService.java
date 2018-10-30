package com.sb.mall.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.dao.OrderDetailDao;

@Repository
public class OrderDetailAverageService {

	@Autowired
	SqlSessionTemplate sessionTemplate;

	private OrderDetailDao Dao;

	@Transactional
	public String getAverage() {

		String result = "";

		Dao = sessionTemplate.getMapper(OrderDetailDao.class);

		result = Dao.thisMonthAverage();

		return result;
	}

}
