package com.sb.mall.service;

import java.util.Collections;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.dao.MemberDao;
import com.sb.mall.dao.OrderDao;
import com.sb.mall.dao.OrderDetailDao;
import com.sb.mall.model.PageListView;

@Repository
public class GetPagingService {

	@Autowired
	SqlSessionTemplate sessionTemplate;

	private MemberDao memberDao;
	
	private OrderDao orderDao;
	
	private OrderDetailDao orderDetailDao;

	// 한 페이지에 보여줄 메시지의 수
/*	private static final int MESSAGE_COUNT_PER_PAGE = 10;*/
	
	//매개변수 페이지넘버는 표시할 페이지
	@Transactional
	public PageListView getList(int pageNumber, int countPerPage, String daoName) {
		
		if (daoName.equals("memberDao")) {
			memberDao = sessionTemplate.getMapper(MemberDao.class);
		} else if (daoName.equals("orderDao")) {
			orderDao = sessionTemplate.getMapper(OrderDao.class);
		} else if (daoName.equals("orderDetailDao")) {
			orderDetailDao = sessionTemplate.getMapper(OrderDetailDao.class);
		}

		int currentPageNumber = pageNumber;

		// 전체 메시지 구하기
		//메세지 갯수
		int objTotalCount = 0;
		if (daoName.equals("memberDao")) {
			objTotalCount = memberDao.selectCount();
		} else if (daoName.equals("orderDao")) {
			objTotalCount = orderDao.selectCount();
		} else if (daoName.equals("orderDetailDao")) {
			objTotalCount = orderDetailDao.selectCount();
		}
	
		//메세지가 담길 리스트
		List<Object> objList = null;
		int firstRow = 0;
		int endRow = 0;
		//메세지 갯수가 0보다 크면 첫 행에는 표시할 페이지 -1  * 10을 한다 - 이것은 표시할 행의 시작 인덱스다.
		//마지막 행에는 표시할 페이지 갯수를 적는다.
		if (objTotalCount > 0) {
			firstRow = (pageNumber - 1) * countPerPage;
			endRow = countPerPage;
			//현재 페이지에 표시할 메세지를 가져온다.
			if (daoName.equals("memberDao")) {
				objList = memberDao.selectList(firstRow, endRow);
			} else if (daoName.equals("orderDao")) {
				objList = orderDao.selectList(firstRow, endRow);
			} else if (daoName.equals("orderDetailDao")) {
				objList = orderDetailDao.selectList(firstRow, endRow);
			}
		} else {
			currentPageNumber = 0;
			objList = Collections.emptyList();
		}
		
		return new PageListView(objList, objTotalCount, currentPageNumber, countPerPage, firstRow,
				endRow);
	}
}
