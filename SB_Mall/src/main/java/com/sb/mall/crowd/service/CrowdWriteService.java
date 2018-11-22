package com.sb.mall.crowd.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.crowd.dao.CrowdDao;
import com.sb.mall.crowd.model.CrowdWriteCommand;

@Repository
public class CrowdWriteService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private CrowdDao crowdDao;
	
	@Transactional
	public boolean insertCrowdCommand(CrowdWriteCommand command) {
			crowdDao = sqlSessionTemplate.getMapper(CrowdDao.class);
			
			int totalTry = command.getGoodsList().size()+command.getOptionList().size()+2;
			int sussecc = 0;
			int fail = 0;
			
			//board 등록
			int boardSC = crowdDao.insertCrowdBoard(command.getCrowdBoard());
			int crowdBoardSeq = command.getCrowdBoard().getCrowdBoardSeq();
			if(boardSC>0) {
				sussecc++;
			}else {
				fail++;
			}
			//product와 board연결
			command.getCrowdProduct().setCrowdBoardSeq(crowdBoardSeq);
			
			//product 등록
			int ProductSC = crowdDao.insertCrowdProduct(command.getCrowdProduct());
			if(ProductSC>0) {
				sussecc++;
			}else {
				fail++;
			}
			int productSeq = command.getCrowdProduct().getCrProductSeq();
			
			//goods 등록
			//product와 goods연결
			for(int i=0; i<command.getGoodsList().size(); i++) {
				command.getGoodsList().get(i).setCrProductSeq(productSeq);
				int goodsSC = crowdDao.insertCrowdGoods(command.getGoodsList().get(i));
				if(goodsSC>0) {
					sussecc++;
				}else {
					fail++;
				}
			}
			
			//option 등록.
			for(int i=0; i<command.getOptionList().size(); i++) {
				int optionSC = crowdDao.insertCrowdOption(command.getOptionList().get(i));
				if(optionSC>0) {
					sussecc++;
				}else {
					fail++;
				}
			}
			
			boolean result = false;
			
			if(totalTry==sussecc) {
				result=true;
			}
			
			System.out.println("total : "+totalTry);
			System.out.println("sussecc : "+sussecc);
			System.out.println("fail : "+fail);
			
			return result;
	}
}
