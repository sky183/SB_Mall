<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/default.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<br>
	<br>
	<div id="contents">

		<basefont size="6">
		<table width="940" border="1">
			<!-- Start Table -->
			<%String context = request.getContextPath(); %>
			<form method="POST">
			<%-- <form action="<%=context%>/join/joinResult" method="POST"> --%>
				<!-- Start Form -->
				<tr>
					<td>
						<center>
							<h1>회원가입</h1>
						</center>
					</td>
				</tr>
				<tr height="327px">
					<td colspan="2" align="left" valign="top" style="">
						<!--내용시작-->
						<table width="780">
							<tr>
								<td>Test</td>
							</tr>
							<tr>
								<td>
									<!--테이블 시작-->
									<table width="940" style="padding: 5px 0 5px 0;">
										<tr>
											<th>메일주소</th>
											<td><input type="text" name="userId" required></td>
										</tr>

										<tr>
											<th>비밀번호</th>
											<td><input type="password" name="userPw" required>
											</td>
										</tr>
										<th>비밀번호 확인</th>
										<td><input type="password" name="userPwChck" required></td>
										<tr>

										<tr>
											<th>이름</th>
											<td><input type="text" name="userName" required></td>
										</tr>
										
										<tr>
											<th>우편번호</th>
											<td><input type="text" name="zipCode" required></td>
										</tr>
										
										<tr>
											<th>주소</th>
											<td><input type="text" name="address1" size="50"><br/>
												<input type="text" name="address2" size="50"></td>
										</tr>
										<tr>
											<th>핸드폰 번호</th>
											<td><input type="text" name="phone"></td>
										</tr>
										
										
									</table>
								</td>
							</tr>



							<tr height="2" bgcolor="#ffc8c3">
								<td></td>
							</tr>
							<tr>
								<td>
								
									<div id="member_button">
										<center>
											
											<input type="submit" value="가입완료"> 
											<input type="submit" value="취소">
										</center>
									</div>
								</td>
							</tr>

						</table>
					</td>
				</tr>
			</form>
			<!-- end of Form -->

		</table>
		<!-- End of Table -->
		</basefont>
	</div>





</body>
</html>