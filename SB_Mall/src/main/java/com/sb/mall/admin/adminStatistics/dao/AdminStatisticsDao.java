package com.sb.mall.admin.adminStatistics.dao;

import com.sb.mall.admin.adminStatistics.model.VisitStatVO;

public interface AdminStatisticsDao {
	
	// 방문 통계를 불러온다.
	public VisitStatVO getVisitStatVO(Object nowDate);

	
	


}
