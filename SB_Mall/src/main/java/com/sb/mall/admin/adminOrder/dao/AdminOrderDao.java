package com.sb.mall.admin.adminOrder.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface AdminOrderDao {
	// 일반 주문 및 크라우드펀딩 주문 갯수
	public int selectOrderVOCount(String startDate, String endDate, String tableName, @Param("status") int status,
			@Param("payment") int payment, @Param("search") String search);

	// 일반 주문 및 크라우드펀딩 주문 조회
	public List<Object> selectOrderVOList(String startDate, String endDate, String tableName, int firstRow, int endRow,
			@Param("status") int status, @Param("payment") int payment, @Param("search") String search);

}
