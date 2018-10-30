package com.sb.mall.service;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.dao.StoreDao;
import com.sb.mall.model.Product;
import com.sb.mall.model.SalesBoard;

@Service
public class StoreWriteService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private StoreDao storeDao;
	
	@Transactional
	public void productAndBoardWrite(Product product,SalesBoard salesBoard) throws SQLException{
			storeDao=sqlSessionTemplate.getMapper(StoreDao.class);
			storeDao.insertProduct(product);
			// 생성된 product의 pk를 salesBoard객체에도 적용
			salesBoard.setProductSeq(product.getProductSeq()); 
			storeDao.insertSalesBoard(salesBoard);
			System.out.println(product);
			System.out.println(salesBoard);
	}
	
}
