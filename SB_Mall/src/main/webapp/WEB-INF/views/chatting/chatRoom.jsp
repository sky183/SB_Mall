<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 세팅 부분 init -->
	<input type="hidden" id="userId" value="${ login.id }"> <!-- 유저 아이디 -->
	<input type="hidden" id="room" value="${ room }"> <!-- 현재 유저가 접속한 방이름 -->
	
	<!-- 방 이름 / 방 만들기 / 방 나가기 -->
	<table style="width: 900px; background-color: white;">
	
	<tr>
		<td align="center" style="width: 600px; color: gray">
			<!-- 방 이름 출력 -->
			<h2>방 이름 : 
			<c:if test="${ room == 'all' }" > <b> 전체 채팅방 </b> </c:if>
			<c:if test="${ room != 'all' }" > <b> ${ room } </b> </c:if>
			
			</h2>
		</td>
		
		<td align="center" style="width: 300px">
		
			<!-- 방 만들기 / 방 나가기 버튼 -->
			
				<input type="button" class="ui button" value="방 만들기" id="create Room">
				&nbsp;&nbsp;
				<input type="button" class="ui button" value="전체 채팅방으로 이동" id="backBtn">
		</td>
	</tr>
	</table>
	
	<!-- 채팅방 구현하기 위한 테이블 -->
	<table align="center" style="height: 600px; width: 900px; margin: 0; padding: 0;" class="ui blue table">
	
	<!-- 왼쪽 채팅창 출력 -->
	<col width="200px"> <!-- 귓속말 영역 -->
	<col width="400px"> <!-- 메세지 입력 영역 -->
	
	<!-- 오른쪽 리스트 출력 영역 -->
	<col width="300px"> <!-- 보내기 영역 -->
	
	<tr height="600px;">
		
		<!-- 채팅 내용 출력 -->
		<td style="width: 550px;" colspan="2" >
		
			<div style="width: 100%; height: 550px; overflow-y: scroll; overflow-x: inherit;" class="ui message" id="output">
			
			</div>
		</td>
		
		<!-- 채팅방 목록 -->
		<td style="width: 300px">
		
		<!-- 채팅방 -->
		<form action="MoveChatRoom.do" method="post" id="moveChatForm">
		<input type="hidden" name="roomName" value="">
		
		<div class="ui message blue" style="width: 300px; height: 100px; overflow-y: scroll; overflow-x: inherit;" id="room">
		
		<!-- 전체 채팅방 -->
		<div class="ui celled list" id="getRoomList">
			<div class="item">
				<div class="content">
					<b title="전체 채팅방입니다.">전체 채팅방</b>
				</div>
			</div>
		</div>
		</div>
		
		</form>
	
	
	
	
	
	
	
	</table>
	
	
</body>
</html>