package com.sb.mall.crowd.dao;

import java.util.List;
import java.util.Map;

import com.sb.mall.crowd.model.CrowdBoard;
import com.sb.mall.crowd.model.CrowdGoods;
import com.sb.mall.crowd.model.CrowdOption;
import com.sb.mall.crowd.model.CrowdProduct;
import com.sb.mall.crowd.model.CrowdProductPhoto;

public interface CrowdDao {
	
	public int insertCrowdBoard(CrowdBoard crowdBoard);
	public int insertCrowdProduct(CrowdProduct crowdProduct);
	public int insertCrowdProductNull(CrowdProduct crowdProduct);
	public int insertCrProductPhoto(CrowdProductPhoto crowdProductPhoto);
	public int insertCrowdGoods(CrowdGoods crowdGoods);
	public int insertCrowdOption(CrowdOption crowdOption);
	public int getBoardPageCnt();
	public List<Map<String, Object>> selectCrowdBoard(int pageNum, int pageShowCnt);
}
