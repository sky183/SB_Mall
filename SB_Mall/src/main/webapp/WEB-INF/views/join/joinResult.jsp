<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

		<table border="1">
			<!-- Start Table -->
			<%String context = request.getContextPath(); %>
				<!-- Start Form -->
				<tr>
					<td>
						<h1>회원가입</h1>
					</td>
				</tr>
				<tr height="327px">
					<td colspan="2" align="left" valign="top" style="">
						<!--내용시작-->
						<table>
							<tr>
								<td>Test</td>
							</tr>
							<tr>
								<td>
									<!--테이블 시작-->
									<table style="padding: 5px 0 5px 0;">
										<tr>
											<th>메일주소</th>
											<td>${mInfo.userId}</td>
										</tr>

										<tr>
											<th>비밀번호</th>
											<td>${mInfo.userPw}
											</td>
										</tr>
										
										<tr>
											<th>이름</th>
											<td>${mInfo.userName}</td>
										</tr>
										<tr>
											<th>우편번호</th>
											<td>${mInfo.zipCode}</td>
										</tr>
										
										<tr>
											<th>주소</th>
											<td>${mInfo.address1}<br/>
												${mInfo.address2}</td>
										</tr>
										
										<tr>
											<th>핸드폰 번호</th>
											<td>${mInfo.phone}</td>
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
											
											<input type="submit" value="가입완료"> 
											<input type="submit" value="취소">
									</div>
								</td>
							</tr>

						</table>
					</td>
				</tr>
			<!-- end of Form -->

		</table>
		<!-- End of Table -->
	</div>





</body>
</html>