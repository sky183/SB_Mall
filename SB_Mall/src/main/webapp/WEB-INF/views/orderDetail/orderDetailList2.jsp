<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="viewData" value="${viewData}"></c:set>
<c:choose>
	<c:when test="${viewData.isEmpty()}">
            등록된 주문이 없습니다.
        </c:when>
	<c:otherwise>
		<div class="px-4">

			<div class="table-wrapper">
				<!--Table-->
				<table class="memList table table-hover mb-0">

					<!--Table head-->
					<thead>
						<tr>

							<th class="th-lg">회원번호</th>
							<th class="th-lg">아이디</th>
							<th class="th-lg">비밀번호</th>
							<th class="th-lg">회원이름</th>
							<th class="th-lg">주소1</th>
							<th class="th-lg">주소2</th>
							<th class="th-lg">우편번호</th>
							<th class="th-lg">전화번호</th>
							<th class="th-lg">가입일</th>
							<th class="th-lg">회원등급</th>
							<th class="th-lg">마일리지</th>
							<th class="th-lg">총구매액</th>
							<th class="th-lg">관리</th>
						</tr>

					</thead>
					<!--Table head-->

					<!--Table body-->
					<tbody>
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
									<button type="button" class="memberModify btn btn-primary"
										name="${member.userId}" grade="${member.gradeNum}"
										data-toggle="modal" data-target="#modalCart">수정</button>
									<button class="memberDelete btn btn-primary"
										name="${member.userId}" grade="${member.gradeNum}">
										탈퇴</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<!--Table body-->
				</table>
				<!--Table-->
			<c:if test="${viewData.currentPageNumber < viewData.pageTotalCount}">
		<button class="page" name="${viewData.currentPageNumber + 1}">${viewData.currentPageNumber}/${viewData.pageTotalCount}</button>
		</c:if>
			</div>
		</div>

	</c:otherwise>
</c:choose>
