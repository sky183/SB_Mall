package com.sb.mall.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.model.Product;
import com.sb.mall.model.SalesBoard;

@Service
public class StoreWriteService {
	
	@Transactional
	public void productAndBoardWrite(Product product,SalesBoard salesBoard) {
		
	}
	
}
