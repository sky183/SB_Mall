package com.sb.mall.dao;

import java.util.List;

import com.sb.mall.model.Join_memberInfoAndOrder;
import com.sb.mall.model.MemberInfo;

public interface MemberDao {
	public int insert(MemberInfo memberInfo);
	
	public MemberInfo selectById(String userId);

	public List<MemberInfo> selectAll();

	public int update(MemberInfo memberInfo);
	
	public int delete(String userId);
	
	public int selectCount();
	
	public List<Object> selectList(int firstRow, int endRow);
	
	public List<Join_memberInfoAndOrder> join_memberInfoAndOrder(String userId);
}
