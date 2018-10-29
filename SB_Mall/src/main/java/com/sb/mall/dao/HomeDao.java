package com.sb.mall.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface HomeDao {
	
	public List<Map<String, Object>> selectDailyDeal() throws SQLException;
	public List<Map<String, Object>> selectNewProduct() throws SQLException;
	

}
