package com.sb.mall.crowd.dao;

import java.util.List;
import java.util.Map;

import com.sb.mall.crowd.model.CrowdBoard;
import com.sb.mall.crowd.model.CrowdGoods;
import com.sb.mall.crowd.model.CrowdOption;
import com.sb.mall.crowd.model.CrowdProduct;

public interface CrowdDao {
	
	public int insertCrowdBoard(CrowdBoard crowdBoard);
	public int insertCrowdProduct(CrowdProduct crowdProduct);
	public int insertCrowdGoods(CrowdGoods crowdGoods);
	public int insertCrowdOption(CrowdOption crowdOption);
	public List<Map<String, Object>> selectCrowdBoard(int pageNum, int pageShowCnt);
}
