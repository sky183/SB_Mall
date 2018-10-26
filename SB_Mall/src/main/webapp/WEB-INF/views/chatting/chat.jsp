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
.bubble 
{
position: relative;
padding: 2px;
margin:5px 0px; 
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
</style>

<script type="text/javascript">

	var sock = null;
	
	$(document).ready(function() {
		
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
		
		$("#sendMessage").click(function () {
			if ( $("#message").val() != "") {
				sock.send('<div class="bubble">' + $("#message").val() + '</div>');
				
				// $("#chatMessage").append("나 -> " + $("#message").val() + "<br/>");
				
				$("#message").val("");
			}
		})
		
		$("#message").keydown(function (key) {
			if (key.keyCode == 13) {
				$("#sendMessage").trigger("click");
			}
		});
	});


</script>



</head>
<body>
	
	<h4>Chatting Page</h4>
	
	<input type="text" id="message" />
	<input type="button" id="sendMessage" value="메시지 보내기" />
	
	<div id="chatMessage" style="overflow : auto; max-height : 500px;">
	
	
	
	</div>
	
</body>


<script type="text/javascript">

	$(document).ready(function() {
		alert("짠짠영의 채팅페이지");
	});

</script>

</html>