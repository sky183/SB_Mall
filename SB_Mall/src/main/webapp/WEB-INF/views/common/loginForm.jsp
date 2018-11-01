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

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Custom styles for this template -->
<link href="css/logincss.css" rel="stylesheet">

<!-- <style>
#contents {
	margin: 50px 10px 50px 10px;
}
</style> -->
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
	$(function() {
		//최초 쿠키에 login_id라는 쿠키값이 존재하면
		var login_id = $.cookie('idcookie');
		if (login_id != undefined) {
			//아이디에 쿠키값을 담는다
			$("#login_id").val(login_id);
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
			} else {
				//아이디저장 체크되어있으면 쿠키저장
				if ($("#rememberId").prop("checked")) {
					//아이디저장 미체크면 쿠키에 정보가 있던간에 삭제
				} else {
					$.removeCookie("idcookie");
				}
				/* 	alert("로그인!!"); */
				$('#loginForm').submit();
			}
		})
	})
</script>


</head>

<body class="text-center">

	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<form method="post" id="loginForm" class="form-signin">
		<div>
		<img class="mb-4"
			src="<%=request.getContextPath()%>/img/SBCompanyLogo.png" alt=""
			width="72" height="72"> <br>
			<h1 class="loginMainFont" style="color:#282828; font-family: 'Open Sans',sans-serif; font-size:32pt; font-weight:bolder; display:inline-block;">SB Company</h1>
		</div>
			<br>
			
		<!-- <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1> -->
		<label for="login_id" class="sr-only">ID</label> <input type="text"
			name="userId" id="login_id" class="form-control" placeholder="아이디"
			required auotofocus> <br> <label for="inputPassword"
			class="sr-only">Password</label> <input type="password" name="userPw"
			id="userPw" class="form-control" placeholder="비밀번호" required>
		 	
		 	${error} 

		<div class="checkbox mb-3">
			<input type="checkbox" name="rememberId"
				id="rememberId"> 
				<label for="rememberId" id="rememberIdLabel">아이디 저장 </label>
			

		</div>


		<button class="btn btn-lg btn-primary btn-block" type="button"
			id=login_button>로그인</button>
		<br>
		<p class="mt-5 mb-3 text-muted">&copy; 2018-2019</p>










	</form>

</body>
</html>




