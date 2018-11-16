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

function idDuplicateCheck() {
	var userId = $('#defaultRegisterFormFirstName').val();
	
	alert(userId);
	/* $.ajax({
		type: 'POST',//보내는 방식
		url:'join/IDDuplicateCheck',//보낼 url 주소
		data: {userID : userId}, //userId를 userID이름으로 전송
		success : function(result){
			console.log(result);
			if (result == 1) {
				$('#checkMessage').html('사용할 수 있는 아이디 입니다.');
				$('#checkType').attr('class','modal-content paner-success';)
			}else{
				
				$('#checkMessage').html('사용할 수 없는 아이디 입니다.');
				$('#checkType').attr('class','modal-content paner-warning';)
			}
			$('#checkModal').modal("show");
		}
	})  */
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
					required> 
				
					<!-- 중복검사 Button -->
					<input type="button" onClick="idDuplicateCheck();" value="중복검사" class="btn my-4 btn-block" 
					style="background-color: #ffc828; font-size: 10px;" height="20px"/>
					
					<small id="defaultRegisterFormPasswordHelpBlock"
					class="form-text text-muted mb-4">메일주소를 정확히 입력해주세요.</small>
				
				<div class="form-row mb-4">
					<div class="col">

						<input type="password" id="defaultRegisterFormPassword1"
							class="form-control" name="userPw" 
							aria-describedby="defaultRegisterFormPasswordHelpBlock"
							onkeyup="passwordCheckFunction()"
							required placeholder="비밀번호"
							>
					</div>
					<div class="col">

						<input type="password" id="defaultRegisterFormPassword2"
							class="form-control" name="userPwChck" 
							aria-describedby="defaultRegisterFormPasswordHelpBlock"
							onkeyup="passwordCheckFunction()"
							required placeholder="비밀번호 확인"
							>
					</div>
				</div>
				<!-- 비밀번호 확인 -->
				<h6 style="color: red;" id="password_check"> 비밀번호를 정확히 입력해 주세요</h6>

				<input type="text" id="defaultRegisterFormLastName"
					class="form-control" name="userName" required placeholder="이름">

				<small id="defaultRegisterFormPasswordHelpBlock"
					class="form-text text-muted mb-4"></small> <input type="text"
					id="defaultRegisterPhonePassword" class="form-control"
					placeholder="휴대폰 번호"
					aria-describedby="defaultRegisterFormPhoneHelpBlock" name="phone" required> <small
					id="defaultRegisterFormPhoneHelpBlock"
					class="form-text text-muted mb-4" > -
					를 빼고 입력하세요 </small> 
				
				<!-- 주소API -->
				<input type="button" onClick="goPopup();" value="주소검색" class="btn my-4 btn-block" 
				style="background-color: #ffc828; font-size: 10px;" height="25px"/>
					
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
	<%
		String messageContent = null;
		if(session.getAttribute("messageContent") != null){
			messageContent = (String)session.getAttribute("messageContent");
		}
		String messageType = null;
		if(session.getAttribute("messageType") != null){
			messageType = (String)session.getAttribute("messageType");
		}
		if(messageContent != null){
		%>
		<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden = "true">
			<div class="vertical-aligment-helper">
				<div class="modal-dialog vertical-align-center">
					<div class="modal-content" <% if(messageType.equals("오류 메시지")) out.println("penel-warning"); else out.println("penel-success"); %>>
						<div class="modal-header panel-heading">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span>
								<span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title">
								<%=messageType %>
							</h4>
						</div>
						<div class="modal-body">
							<%=messageContent%>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn=primary" data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			$('#messageModal').modal("show");
		</script>
		
		<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	
		%>
		<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden = "true">
			<div class="vertical-aligment-helper">
				<div class="modal-dialog vertical-align-center">
					<div id="checkType" class="modal-content panel-info" >
						<div class="modal-header panel-heading">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span>
								<span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title">
								확인 메시지
							</h4>
						</div>
						<div class="modal-body" id="checkMessage">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn=primary" data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>

<script>
function passwordCheckFunction() {
	var pw1 = $('#defaultRegisterFormPassword1').val();
	var pw2 = $('#defaultRegisterFormPassword2').val();
	if (pw1 != pw2) {
		/*Test후 아래문장 삭제 후 주석해제*/
		//$('#password_check').html('입력한 비밀번호 [password1 :'+pw1 + '] [password2 :'+pw2+']');
		$('#password_check').html('비밀번호가 서로 일치하지 않습니다.');
	}else{
		/*Test후 아래문장 삭제 후 주석해제*/
		//$('#password_check').html('입력한 비밀번호 [password1 :'+pw1 + '] [password2 :'+pw2+']');
		$('#password_check').html('');
		
	}
}
</script>


</body>
</html>