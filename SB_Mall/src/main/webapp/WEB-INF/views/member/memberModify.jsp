<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


	
	<%-- <form action="<%= request.getContextPath() %>/memberModify_end" method="POST"> --%>
	<form id="memberModify">
	<h1>회원 수정</h1>
		<table border="1" class="memList" method="post">
			<tr>
				<th>회원번호</th><td><input type="text" readonly name="userSeq" value="${member.userSeq}"></td>
			</tr>
			<tr>
				<th>아이디</th><td><input type="text" readonly name="userId" value="${member.userId}"></td>
			</tr>
			<tr>
				<th>비밀번호</th><td><input type="text"  name="userPw" value="${member.userPw}"></td>
			</tr>
			<tr>
				<th>회원이름</th><td><input type="text"  name="userName" value="${member.userName}"></td>
			</tr>
			<tr>
				<th>주소1</th><td><input type="text"  name="address1" value="${member.address1}"></td>
			</tr>
			<tr>
				<th>주소2</th><td><input type="text"  name="address2" value="${member.address2}"></td>
			</tr>
			<tr>
				<th>우편번호</th><td><input type="text"  name="zipCode" value="${member.zipCode}"></td>
			</tr>
			<tr>
				<th>전화번호</th><td><input type="text"  name="phone" value="${member.phone}"></td>
			</tr>
			<tr>
				<th>가입일</th><td><input type="text"  name="regDate" value="${member.regDate}"></td>
			</tr>
			<tr>
				<c:if test="${sessionScope.memberInfo.gradeNum < 4}">
					<c:set var="readonly" value="readonly"></c:set>
				</c:if>
				
				<th>회원등급</th><td><input type="text" name="gradeNum" ${readonly} value="${member.gradeNum}"></td>
			</tr>
			<tr>
				<th>마일리지</th><td><input type="text"  name="point" value="${member.point}"></td>
			</tr>
			<tr>
				<th>총구매액</th><td><input type="text"  name="userAmount" value="${member.userAmount}"></td>
			</tr>
		</table>
				<input type="button" id="modifyButton" value="수정하기"/>
		
	</form>
<script >

$('#modifyButton').click(function() {
	var memberModify = $('#memberModify').serialize();
	$.ajax({
		url : '<%= request.getContextPath() %>/memberModify_end',
		type : 'POST',
		data : memberModify,
/*  		dataType : 'json', */
		error : function(error) {
	        alert("Error!");
	    },
		success : function(result) {
			alert(result);
		}
	});
});
</script>

