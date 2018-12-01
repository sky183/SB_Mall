package com.sb.mall.store.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.store.dao.StoreDao;
import com.sb.mall.store.model.GoodsOption;

@Service
public class StoreBoardDetailService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private StoreDao storeDao;
	
	@Transactional
	public Map<String,Object> SalDetailView(int salSeq) throws SQLException{
		storeDao = sqlSessionTemplate.getMapper(StoreDao.class);
		Map<String,Object> proAndSal = new HashMap<String, Object>();
			 proAndSal = storeDao.selectProAndSal(salSeq);
			 storeDao.updateSalBoardCnt(salSeq);
		/*int productSeq= (Integer)proAndSal.get("productSeq");
		
		//option 종류 몇개인가 체크
		List<GoodsOption> list = storeDao.checkGoodsOptionIsNull(productSeq);
		System.out.println("리스트:"+list);
		int checkNullOption = 0;
		if(!list.isEmpty()) {
			for(GoodsOption opt : list) {
				if(opt.getOpt1Name().length()>0) {
					checkNullOption=1;
				}
				if(opt.getOpt2Name().length()>0) {
					checkNullOption=2;
					break;
				}
			}
		}
		
		proAndSal.put("checkNullOption", checkNullOption);*/
		return proAndSal;
	}
	
}
