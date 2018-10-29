package com.sb.mall.dao;

import java.util.List;

import com.sb.mall.model.MemberInfo;

public interface MemberDao {
	public void insert(MemberInfo memberInfo);
	
	public MemberInfo selectById(String userId);

	public List<MemberInfo> selectAll();

	public int update(MemberInfo memberInfo);
	
	public int delete(String userId);
}
