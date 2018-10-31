<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script type="text/javascript" src="resources/js/jquery.cookie.js"></script>
<link rel="stylesheet" href="css/default.css">
<style>
#contents {
	margin: 50px 10px 50px 10px;
}
</style>
</head>
<script type="text/javascript">
/* 	/* alert('${idcookie}'); 


	 $(document).ready(function(){
	 $('#login_id').val('${idcookie}'); 
	 });
	 
	$(function() {
		//최초 쿠키에 login_id라는 쿠키값이 존재하면
		$(document).ready(function() {
			$('#login_id').val('${idcookie}');
			if (login_id != undefined) {
				//아이디에 쿠키값을 담는다
				$("#login_id").val('${idcookie}');
				//아이디저장 체크박스 체크를 해놓는다
				$("#rememberId").prop("checked", true);
			}

			//로그인 버튼 클릭시
			$("#login_button").click(function() {
				//아이디 미입력시
				if ($.trim($("#login_id").val()) == "") {
					alert("아이디를 입력하세요");
					return;
					//아이디 입력시
				} else if ($("input:checkbox[id='rememberId']").is(":checked")==false) {
							alert(0);
							
							
							
							
							alert('1');
							}
					alert("로그인!!");
					$('#loginForm').submit();			
			})
		})
	}) */
	$(function(){
	    //최초 쿠키에 login_id라는 쿠키값이 존재하면
	    var login_id = $.cookie('idcookie');
	    if(login_id != undefined) {
	        //아이디에 쿠키값을 담는다
	        $("#login_id").val(login_id);
	        //아이디저장 체크박스 체크를 해놓는다
	        $("#rememberId").prop("checked",true);
	    }
	     
	    //로그인 버튼 클릭시
	    $("#login_button").click(function(){
	        //아이디 미입력시
	        if($.trim($("#login_id").val()) == "") {
	            alert("아이디를 입력하세요");
	            return;
	        //아이디 입력시
	        } else {
	            //아이디저장 체크되어있으면 쿠키저장
	            if($("#rememberId").prop("checked")) {
	            //아이디저장 미체크면 쿠키에 정보가 있던간에 삭제
	            } else {
	                $.removeCookie("idcookie");
	            }
	            alert("로그인!!");
	            $('#loginForm').submit();
	        }
	    })
	})



</script>


</head>

<body>

	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div id="contents">
		<h2>로그인</h2>

		<hr>
		<form method="post" id="loginForm">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userId" id="login_id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="userPw"></td>
				</tr>
				<tr>
					<td colspan="2"></td> ${error}
				</tr>

				<tr>
					<td colspan="2"><input type="button" id=login_button
						value="로그인"></td>

				</tr>

				<tr>
					<td>아이디저장</td>
					<td><input type="checkbox" name="rememberId" id="rememberId"></td>


				</tr>





			</table>

		</form>

	</div>





</body>
</html>