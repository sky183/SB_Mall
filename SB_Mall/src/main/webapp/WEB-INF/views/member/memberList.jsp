<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tr>
	<td>회원번호</td>
	<td>아이디</td>
	<td>비밀번호</td>
	<td>회원이름</td>
	<td>주소1</td>
	<td>주소2</td>
	<td>우편번호</td>
	<td>전화번호</td>
	<td>가입일</td>
	<td>회원등급</td>
	<td>마일리지</td>
	<td>총구매액</td>
	<td>관리</td>
</tr>
<c:forEach var="member" items="${members}">
	<tr>
		<td>${member.userSeq}</td>
		<td>${member.userId}</td>
		<td>${member.userPw}</td>
		<td>${member.userName}</td>
		<td>${member.address1}</td>
		<td>${member.address2}</td>
		<td>${member.zipCode}</td>
		<td>${member.phone}</td>
		<td>${member.regDate}</td>
		<td>${member.gradeNum}</td>
		<td>${member.point}</td>
		<td>${member.userAmount}</td>
		<td><a
			href="<%=request.getContextPath()%>/memberModify/${member.userId}">수정</a>
			<a
			href="<%=request.getContextPath()%>/memberDelete/${member.userId}">삭제</a>
		</td>
	</tr>
</c:forEach>
