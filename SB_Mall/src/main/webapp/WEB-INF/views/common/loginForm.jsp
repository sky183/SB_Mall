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

	<div id="contents">
		<h2>로그인</h2>

		<hr>
		<form method="post">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userId"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="userPw"></td>
				</tr>
				<tr>

				</tr>
			

				<tr>
					<td colspan="2"><input type="submit" value="로그인"></td>

				</tr>
				
			
			</table>

		</form>

	</div>





</body>
</html>