package com.sb.mall.admin.dao;

import java.util.List;
import java.util.Map;

public interface adminDao {
	//특정일 값 조회는 매개변수 obj에 date 형식 또는 String 또는 TimeStamp 를 넣으면 된다.
	//오늘이나 며칠 전 값을 조회하고 싶으면 메서드 이름 뒤에 Pre가 붙은 메서드에 원하는 숫자를 넣는다. 0을 넣으면 오늘 , -1을 넣으면 하루전 이런식
	
	//방문수
	public int visitCount(Object obj);
	public int visitCountPre(int day);
	//주문수
	public int orderDayCount(Object obj);
	public int orderDayCountPre(int day);
	//매출
	public String salesDay(Object obj);
	public String salesDayPre(int day);
	public String salesMonth(Object obj);
	public String salesMonthPre(int day);
	public String salesYear(Object obj);
	public String salesYearPre(int day);
	public String averageMonth(Object obj);
	public String averageMonthPre(int day);
	//주문상태
	public List<Map<String, Integer>> orderStatus();
	//가입자
	public int joinCount(Object obj);
	public int joinCountPre(int day);
	
}
