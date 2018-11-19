<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<!-- JQuery -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.

		/**상대경로**/
		//var pop = window.open("popup/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		/**절대경로**/
		var pop = window.open("join/popup/jusoPopup", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadAddrPart1, addrDetail, zipNo) {
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

				<p class="h4 mb-4">
					<b>회원가입</b>
				</p>


				<input type="email" id="defaultRegisterFormFirstName"
					class="form-control" placeholder="E-mail (Id)" name="userId"
					required onkeyup="idDuplicateCheck()">


				<!-- Email 유효성 Message 출력 -->
				<small id="id_Duplicate_Check"
					for="defaultRegisterFormFirstName"
					class="form-text text-muted mb-4">메일주소를 정확히 입력해주세요.</small>

					
				
				<div class="form-row mb-4">
					<div class="col">

						<input type="password" id="defaultRegisterFormPassword1"
							class="form-control" name="userPw"
							aria-describedby="defaultRegisterFormPasswordHelpBlock"
							onkeyup="passwordCheckFunction()" required placeholder="비밀번호">
					</div>
					<div class="col">

						<input type="password" id="defaultRegisterFormPassword2"
							class="form-control" name="userPwChck"
							aria-describedby="defaultRegisterFormPasswordHelpBlock"
							onkeyup="passwordCheckFunction()" required placeholder="비밀번호 확인">
					</div>
				</div>
				
				<!-- 비밀번호 유효성 Message 출력 -->
				<small id="password_check"
					for="defaultRegisterFormFirstName"
					class="form-text text-muted mb-4">비밀번호를 정확히 입력해 주세요.</small>
				<!-- <h6 style="color: red;" id="password_check">비밀번호를 정확히 입력해 주세요</h6> -->

				<div class="form-row mb-4">
					<div class="col">

						<input type="text" id="userName" class="form-control"
							name="userName" required placeholder="이름">
					</div>
					<div class="col">

						<input type="text" id="userBirthday" class="form-control"
							name="regID" required placeholder="생년월일">
					</div>
				</div>



				<small 
					class="form-text text-muted mb-4"></small> <input type="text"
					id="defaultRegisterPhonePassword" class="form-control"
					placeholder="휴대폰 번호"
					aria-describedby="defaultRegisterFormPhoneHelpBlock" name="phone"
					required> <small id="defaultRegisterFormPhoneHelpBlock"
					class="form-text text-muted mb-4"> - 를 빼고 입력하세요 </small>

				<!-- 주소API -->
				<input type="button" onClick="goPopup();" value="주소검색"
					class="btn my-4 btn-block"
					style="background-color: #ffc828; font-size: 10px;" height="25px" />

				<div class="form-row mb-4" id="callBackDiv">

					<!-- 우편번호 -->
					<input type="text" id="zipNo" class="form-control"
						placeholder="우편번호" name="zipCode" required
						aria-describedby="defaultRegisterFormPhoneHelpBlock"
						readonly="readonly">

					<!-- 주소 -->
					<input type="text" id="roadAddrPart1" class="form-control"
						placeholder="주소"
						aria-describedby="defaultRegisterFormPhoneHelpBlock"
						name="address1" readonly="readonly">

					<!-- 상세주소 -->
					<input type="text" id="addrDetail" class="form-control"
						placeholder="상세주소"
						aria-describedby="defaultRegisterFormPhoneHelpBlock"
						name="address2">

				</div>
				<!-- 주소API 끝-->

				<small id="defaultRegisterFormPhoneHelpBlock"
					class="form-text text-muted mb-4"> 주소를 정확히 입력하세요. 상품 주문시
					사용됩니다. </small>


				<!-- Sign up button -->
				<div id="member_button">
					<button class="btn my-4 btn-block"
						style="background-color: #ffc828; font-size: 18px;" type="submit"
						onclick="checkFunction()">회원 가입</button>
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


	<script>
	
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	
	// 비밀번호 정규식 (영문(대소문자 구분), 숫자, 특수문자 조합, 9~12자리)
	var pwPattern = /^(?=.*\\d)(?=.*[~`!@#$%\\^&*()-])(?=.*[a-z])(?=.*[A-Z]).{9,12}$/;
	
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{8,20}$/;

	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;;
	// 생일 정규식
	var birthJ = /^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$/;
	
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	
	
		/*1.Email 정규식 + 실시간 중복검사*/
		//정규식 조건-(조건에 해당되지 않을때 false를 반환)
		function idDuplicateCheck() {

		var userId = $('#defaultRegisterFormFirstName').val();

		/* 1)정규식  2)중복검사*/
		//1. 정규식에 맞지 않을때 맞을때
		/* if (!(/^[a-zA-Z0-9]+@([a-zA-Z]+\.+)+([a-zA-Z]{2,})+$/.test($('#defaultRegisterFormFirstName').val()))) { */
		if (!( mailJ.test($('#defaultRegisterFormFirstName').val()) )) {

			//출력될 Label
			$('#id_Duplicate_Check').text("Email형식에 맞지 않습니다.");

		} else {
			//2.정규식에 맞을때
			/* $('#defaultRegisterFormPasswordHelpBlock').text(
						"Email 형식에 맞는 아이디 입니다.(Test Message)"); */
				//2.1 중복검사
				$.ajax({
					type : 'POST',
					url : 'join/id_DuplicateCheck',
					data : {
					userId : userId},
					/* error : alert('Error'), */
					success : function(data) {
						console.log(data);
						//alert('result : ' + data);

						if (data == 0) {
							$('#id_Duplicate_Check').html('<h6 style="color: green;">사용할 수 있는 아이디 입니다.</h6>');
							
						} else {

							$('#id_Duplicate_Check').html('<h6 style="color: red;">중복된 아이디 입니다.</h6>');
						}
					}
				})
				
			}
		}

		/*비밀번호 재확인*/
		function passwordCheckFunction() {
			
            var pw1 = $('#defaultRegisterFormPassword1').val();
    		var pw2 = $('#defaultRegisterFormPassword2').val();
    		
    		
			//1.정규식에 부합하지 않을때
			if ( !(pwJ.test($('#password_check').val()) ) ) {
                
				$('#password_check').html('영문(대소문자 구분), 숫자, 특수문자 조합, 9~12자리를 입력해 주세요.(공백불가).. 입력한 비밀번호 [password1 :'+pw1 + '] [password2 :'+pw2+']');                
            
			} else {
            //2.정규식에 부합할때
            	/* lab.textContent = "8~20자의 영어,숫자,특수문자를 혼합하여 입력해 주세요.(공백불가)"; */
   				$('#password_check').html('8~20자의 영어,숫자,특수문자를 혼합하여 입력해 주세요.(공백불가).');
            	
    			if (pw1 != pw2) {
    				/*Test후 아래문장 삭제 후 주석해제*/
    				$('#password_check').html('비밀번호가 서로 일치하지 않습니다.');
    			} else {
    				/*Test후 아래문장 삭제 후 주석해제*/
    				//$('#password_check').html('입력한 비밀번호 [password1 :'+pw1 + '] [password2 :'+pw2+']');
    				$('#password_check').html('');

    			}
            	
                document.getElementById('i_USERPW').style.background = "#fff url(https://static.nid.naver.com/images/ui/join/pc_icon_safe_180417.png) 0 0 no-repeat";
                lab.textContent = "";
            }
			
		}
	</script>


</body>
</html>