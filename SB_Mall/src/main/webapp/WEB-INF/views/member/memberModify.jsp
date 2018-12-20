<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

		<input type="hidden"  name="userPw" value="${member.userPw}">
		
		<div class="myModalUnit">
			<h3 class="myModalH3">아이디</h3>
			<div class="myInputBox">
				<input class="myInput" type="text" name="userId" value="${member.userId}" readonly>
			</div>
		</div>
		
		<div class="myModalUnit">
			<h3 class="myModalH3">새로운 비밀번호</h3>
			<div class="myInputBox">
				<input class="myInput" type="password" name="userId" value="" >
			</div>
		</div>
		
		<div class="myModalUnit">
			<h3 class="myModalH3">비밀번호 확인</h3>
			<div class="myInputBox">
				<input class="myInput" type="password" name="userId" value="" >
			</div>
		</div>
		
		<div class="myModalUnit">
			<h3 class="myModalH3">회원이름</h3>
			<div class="myInputBox">
				<input class="myInput" type="text"  name="userName" value="${member.userName}">
			</div>
		</div>
		
		<div class="myModalUnit">
			<h3 class="myModalH3">주소</h3>
			<div class="myInputBox">
				<input class="myInput" type="text"  name="address1" value="${member.address1}">
			</div>
		</div>
		
		<div class="myModalUnit">
			<h3 class="myModalH3">주소2</h3>
			<div class="myInputBox">
				<input class="myInput" type="text"  name="address2" value="${member.address2}">
			</div>
		</div>
		
		<div class="myModalUnit">
			<h3 class="myModalH3">우편번호</h3>
			<div class="myInputBox">
				<input class="myInput" type="text"  name="zipCode" value="${member.zipCode}">
			</div>
		</div>
		
		<div class="myModalUnit">
			<h3 class="myModalH3">전화번호</h3>
			<div class="myInputBox">
				<input class="myInput" type="text"  name="phone" value="${member.phone}">
			</div>
		</div>
		
		<div class="myModalUnit">
			<h3 class="myModalH3">가입일</h3>
			<div class="myInputBox">
				<input class="myInput" type="text"  name="regDate" value="${member.regDate}" readonly>
			</div>
		</div>
		
		<div class="myModalUnit">
			<h3 class="myModalH3">마일리지</h3>
			<div class="myInputBox">
				<input class="myInput" type="text"  name="point" ${readonly} value="${member.point}" readonly>
			</div>
		</div>
		
		<div class="myModalUnit">
			<h3 class="myModalH3">총구매액</h3>
			<div class="myInputBox">
				<input class="myInput" type="text"  name="userAmount" value="${member.userAmount}" readonly>
			</div>
		</div>
