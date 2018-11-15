<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>join</title>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css"
	rel="stylesheet">
<!-- JQuery -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>

<style>
body {
	background-color: #f5f5f5;
}
</style>

<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	
	/**상대경로**/	
	//var pop = window.open("popup/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	/**절대경로**/
	var pop = window.open("join/popup/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadAddrPart1,addrDetail,zipNo){
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.addrDetail.value = addrDetail;
		document.form.zipNo.value = zipNo;
		
}

</script>

</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<br>
	<br>
	<div id="contents">
		<div style="margin: 30px auto 20px auto; width: 600px;">
			<!-- Default form register -->
			<form class="text-center  p-5" method="post" name="form" id="form">

				<p class="h4 mb-4"><b>회원가입</b></p>

				<input type="email" id="defaultRegisterFormFirstName"
					class="form-control" placeholder="E-mail (Id)" name="userId"
					required> <small id="defaultRegisterFormPasswordHelpBlock"
					class="form-text text-muted mb-4">메일주소를 정확히 입력해주세요.</small>

				<div class="form-row mb-4">
					<div class="col">

						<input type="password" id="defaultRegisterFormPassword"
							class="form-control" name="userPw" required placeholder="비밀번호"
							aria-describedby="defaultRegisterFormPasswordHelpBlock">
					</div>
					<div class="col">

						<input type="password" id="defaultRegisterFormPassword"
							class="form-control" name="userPwChck" required
							placeholder="비밀번호 확인"
							aria-describedby="defaultRegisterFormPasswordHelpBlock">
					</div>
				</div>
				<div class="form-row mb-4">
					<div class="col">

						<input type="text" id="defaultRegisterFormLastName"
					class="form-control" name="userName" required placeholder="이름">
					</div>
					<div class="col">

						<input type="text" id="defaultRegisterFormLastName"
					class="form-control" name="regID" required placeholder="생년월일">
					</div>
				</div>

				
				

				<small id="defaultRegisterFormPasswordHelpBlock"
					class="form-text text-muted mb-4"></small> <input type="text"
					id="defaultRegisterPhonePassword" class="form-control"
					placeholder="휴대폰 번호"
					aria-describedby="defaultRegisterFormPhoneHelpBlock" name="phone" required> <small
					id="defaultRegisterFormPhoneHelpBlock"
					class="form-text text-muted mb-4" > -
					를 빼고 입력하세요 </small> 
				 
				<!-- 주소API -->
				<input type="button" onClick="goPopup();" value="주소검색" class="btn my-4 btn-block" style="background-color: #ffc828; font-size: 18px;"
				
				height="25px"/>
					
				<div class="form-row mb-4" id="callBackDiv">
				
					<!-- 우편번호 -->
					<input type="text" id="zipNo"
					class="form-control" placeholder="우편번호" name="zipCode" required
					aria-describedby="defaultRegisterFormPhoneHelpBlock"> 
						
					<!-- 주소 -->
					<input type="text" id="roadAddrPart1" 
							class="form-control" placeholder="주소"
							aria-describedby="defaultRegisterFormPhoneHelpBlock"
							name="address1">

					<!-- 상세주소 -->
						<input type="text" id="addrDetail"
							class="form-control" placeholder="상세주소"
							aria-describedby="defaultRegisterFormPhoneHelpBlock"
							name="address2">
					
				</div>
				<!-- 주소API 끝-->
				
				<small id="defaultRegisterFormPhoneHelpBlock"
					class="form-text text-muted mb-4"> 주소를 정확히 입력하세요. 상품 주문시
					사용됩니다. </small>


				<!-- Sign up button -->
				<div id="member_button">
					<button class="btn my-4 btn-block" style="background-color: #ffc828; font-size: 18px;" type="submit">회원 가입</button>
				</div>

				<!-- Social register -->
				<p>or sign up with:</p>

				<a type="button" class="light-blue-text mx-2"> <i
					class="fa fa-facebook"></i>
				</a> <a type="button" class="light-blue-text mx-2"> <i
					class="fa fa-twitter"></i>
				</a> <a type="button" class="light-blue-text mx-2"> <i
					class="fa fa-linkedin"></i>
				</a> <a type="button" class="light-blue-text mx-2"> <i
					class="fa fa-github"></i>
				</a>

				<hr>

				<p>
					By clicking <em>Sign up</em> you agree to our <a href=""
						target="_blank">terms of service</a> and <a href=""
						target="_blank">terms of service</a>.
				</p>
			</form>
		</div>
	</div>




</body>
</html>