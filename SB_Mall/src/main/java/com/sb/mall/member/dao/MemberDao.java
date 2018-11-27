package com.sb.mall.member.dao;

import java.util.List;

import com.sb.mall.member.model.MemberInfo;

public interface MemberDao {
	
	public int insert(MemberInfo memberInfo);
	
	public MemberInfo selectById(String userId);

	public List<MemberInfo> selectAll();

	public int update(MemberInfo memberInfo);
	
	public int delete(String userId);
	
	public int selectCount();
	
	public List<Object> selectList(int firstRow, int endRow);

	public List<Object> selectTodayList(int firstRow, int endRow);
	
	public List<MemberInfo> find_id(String userName,String phone);
	
	public String find_pw(String userId, String userName);
	
}
