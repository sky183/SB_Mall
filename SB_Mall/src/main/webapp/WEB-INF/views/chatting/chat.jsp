<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chatting Page</title>

<script type="text/javascript" src="resources/js/jquery-1.12.1.js"></script>
<script type="text/javascript" src="resources/js/sockjs-1.0.3.min.js"></script>

<style>
.bubble {
	position: relative;
	padding: 2px;
	margin: 5px 0px;
	background: #FFc828;
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	border-radius: 5px;
	left: 5px;
	display: inline-block;
}

/* .bubble:after 
{
content: '';
position: absolute;
border-style: solid;
border-width: 15px 20px 15px 0;
border-color: transparent #FFFF77;
display: block;
width: 0;
z-index: 1;
left: 0px;
top: 37px;
} */

/* .bubble:before 
{
content: '';
position: absolute;
border-style: solid;
border-width: 16px 21px 16px 0;
border-color: transparent #000000;
display: block;
width: 0;
z-index: 0;
left: -3px;
top: 10px;
} */

.chatting {
	right: 30px;
	width:500px;
	bottom: 30px;
	position: fixed;
	right:10px;
	bottom:10px;
	background-color: #787878;
	padding:15px;
}
.closeButton{
	float: right;
	display: inline-block;
}

#chatOpenBtn{
	width: 30px;
	height: 30px;
	position: fixed;
	right:10px;
	bottom:10px;
	cursor: pointer;
}

#chatMessage{
	overflow: hidden;
}

</style>

<script type="text/javascript">
	var sock = null;

	$(document).ready(
			function() {

				sock = new SockJS("/mall/echo-ws");
				sock.onopen = function() {
					sock.send("입장");
				}

				sock.onmessage = function(evt) {
					// alert(evt.data);
					$("#chatMessage").append(evt.data + "<br/>");
				}

				sock.onclose = function() {
					sock.send("퇴장");
				}

				$("#sendMessage").click(
						function() {
							if ($("#message").val() != "") {
								sock.send('<div class="bubble">'
										+ $("#message").val() + '</div>');

								// $("#chatMessage").append("나 -> " + $("#message").val() + "<br/>");

								$("#message").val("");
							}
						})

				$("#message").keydown(function(key) {
					if (key.keyCode == 13) {
						$("#sendMessage").trigger("click");
					}
				});
			});
	
	function openChat() {
		var chat = document.getElementById("chatBox");
		var chatBtn = document.getElementById("chatBtn2");
		chat.style.display="block";
		chatBtn.style.display="none";
		
	}
	
	function closeChat() {
		var chat = document.getElementById("chatBox");
		var chatBtn = document.getElementById("chatBtn2");
		chat.style.display="none";
		chatBtn.style.display="block";
		
	}
</script>



</head>
<body>

	<div id="chatBox" class="chatting" style="display:none">

		<h4 style="display:inline-block">Chatting Page</h4>
		<button class="closeButton" onclick="closeChat()">닫기</button>
		<div>
			<input type="text" id="message" /> 
			<input type="button" id="sendMessage" value="보내기" />
		</div>
		<div id="chatMessage" style=" max-height: 500px;">

		</div>
	</div>
	
	<div id="chatBtn2">
		<a onclick="openChat()" id="chatOpenBtn">
			<img src="<%=request.getContextPath()%>/img/chat.png" style="width: 30px; height: 30px;">
		</a>
	</div>

</body>


<!-- <script type="text/javascript">
	$(document).ready(function() {
		alert("짠짠영의 채팅페이지");
	});
</script> -->

</html>