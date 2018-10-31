<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="viewData" value="${viewData}"></c:set>
${memberInfo.gradeNum}
<c:choose>
	<c:when test="${viewData.isEmpty()}">
	등록된 회원이 없습니다.
		</c:when>
	<c:otherwise>
		<table border="1" class="memList">
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
			<c:forEach var="member" items="${viewData.objList}">
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
					<td>
					<button class="memberModify" name="${member.userId}" grade="${member.gradeNum}">
						수정
					</button>
					<button class="memberDelete" name="${member.userId}"  grade="${member.gradeNum}">
						탈퇴
					</button>
<%-- 					<a
						href="<%=request.getContextPath()%>/memberModify?userId=${member.userId}">수정</a> --%>
						<%-- <a
						href="<%=request.getContextPath()%>/memberDelete?userId=${member.userId}">탈퇴</a> --%>
					</td>
				</tr>
			</c:forEach>
		</table>
		<c:forEach varStatus="i" begin="1" end="${viewData.pageTotalCount}">
			<a href="#" class="page" name="${i.index}">[${i.index}] </a>
		</c:forEach>
	</c:otherwise>
</c:choose>
<script>
$('.page').click(function() {
	$.ajax({
		url : '<%=request.getContextPath()%>' + '/memberList?page=' +  $(this).attr('name'),
		data : {
			viewType : $(this).val()
		},
		error : function(error) {
	        alert("Error!");
	    },
		success : function(data) {
			$('#viewList').empty();
			$('#viewList').append(data);
		}
	});
});

$('.memberModify').click(function() {
	var sessionId = '${memberInfo.userId}';
	var userId = $(this).attr('name');
	var sessionGrade = '${memberInfo.gradeNum}';
	var gradeNum = $(this).attr('grade');
	if(sessionGrade != 3){
		alert("관리자만 수정 가능합니다.");
	} else if(sessionId != userId && gradeNum == 3 ){
		alert("관리자는 본인만 수정 가능합니다.");
	} else {
		$.ajax({
		url : '<%=request.getContextPath()%>/memberModify?userId=' +  $(this).attr('name'),
		data : {
			viewType : $(this).val()
		},
		error : function(error) {
	        alert("Error!");
	    },
		success : function(data) {
			$('#viewList').empty();
			$('#viewList').append(data);
		}
	});
	}
});

$('.memberDelete').click(function() {
	$.ajax({
		url : '<%=request.getContextPath()%>/memberDelete?userId=' +  $(this).attr('name'),
		data : {
			viewType : $(this).val()
		},
		error : function(error) {
	        alert("Error!");
	    },
		success : function(data) {
			$('#viewList').empty();
			$('#viewList').append(data);
		}
	});
});

</script>
