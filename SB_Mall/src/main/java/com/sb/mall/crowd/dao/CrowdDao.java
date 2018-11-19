package com.sb.mall.crowd.dao;

import java.util.List;
import java.util.Map;

import com.sb.mall.crowd.model.crowdBoard;
import com.sb.mall.crowd.model.crowdGoods;
import com.sb.mall.crowd.model.crowdOption;
import com.sb.mall.crowd.model.crowdProduct;

public interface CrowdDao {
	
	public int insertCrowdBoard(crowdBoard crowdBoard);
	public int insertCrowdProduct(crowdProduct crowdProduct);
	public int insertCrowdGoods(crowdGoods crowdGoods);
	public int insertCrowdOption(crowdOption crowdOption);
	public List<Map<String, Object>> selectCrowdBoard(int pageNum, int pageShowCnt);
}
