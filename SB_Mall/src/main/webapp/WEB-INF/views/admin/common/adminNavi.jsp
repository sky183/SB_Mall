<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	 <div class="headerTop">
		<div id="adminInfo">
				<span>
					${memberInfo.userName}
				</span>
				<span>
					관리자님 환영합니다.
				</span>
				<span>로그아웃</span>
		</div>
	 </div>
	 <div class="headerBottom">
		<ul id="headerNavi">
					<li><a class="${adminCalendar}" href="<%=request.getContextPath()%>/admin/adminCalendar">일정관리</a></li>
					<li><a class="${adminStatistics}" href="<%=request.getContextPath()%>/admin/adminStatistics">통계</a></li>
					<li><a class="${adminMember}" href="<%=request.getContextPath()%>/admin/adminMember">회원관리</a></li>
					<li><a class="${adminOrder}" href="<%=request.getContextPath()%>/admin/adminOrder">주문관리</a></li>
					<li><a class="${adminOperation}" href="<%=request.getContextPath()%>/admin/adminOperation">매출관리</a></li>
		  <li ><a class="${adminMain}" href="<%=request.getContextPath()%>/admin/adminMain">관리홈</a></li>
		</ul>
	 </div>
