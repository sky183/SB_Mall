<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<div id="adminInfo">
				<span>
					${memberInfo.userName}
				</span>
				<span>
					관리자님 환영합니다.
				</span>
				<span>로그아웃</span>
		</div>
		<ul id="headerNavi">
					<li><a class="${adminCalendar}" href="<%=request.getContextPath()%>/admin/adminCalendar">일정관리</a></li>
					<li><a class="${adminMember}" href="<%=request.getContextPath()%>/admin/adminMember">회원관리</a></li>
					<li><a class="${adminOrder}" href="<%=request.getContextPath()%>/admin/adminOorder">주문관리</a></li>
					<li><a class="${adminSales}" href="<%=request.getContextPath()%>/admin/adminSales">영업관리</a></li>
		  <li ><a class="${adminPage}" href="<%=request.getContextPath()%>/admin/adminPage">Home</a></li>
		</ul>