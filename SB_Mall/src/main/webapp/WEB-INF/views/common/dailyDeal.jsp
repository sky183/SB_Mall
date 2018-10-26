<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<meta charset="UTF-8">

<script>

		var secOrigin;
		var minOrigin;
		var hourOrigin;
		
		var secNum;
		var minNum
		var hourNum;
		
	window.onload=function(){
		secOrigin=document.getElementById("sec").innerHTML;
		minOrigin=document.getElementById("min").innerHTML;
		hourOrigin=document.getElementById("hour").innerHTML;
		
		if(secOrigin>9){secNum=0;
		}else{secNum=Number(secOrigin);}
		
		if(minOrigin>9){minNum=0;
		}else{minNum=Number(minOrigin);}
		
		if(hourOrigin>9){hourNum=0;
		}else{hourNum=Number(hourOrigin);}
		
		function secCnt() {
			var sec = document.getElementById("sec");
			var min = document.getElementById("min");
			var hour = document.getElementById("hour");
			
			if(sec.innerHTML==59){
				sec.innerHTML="00";
				if(min.innerHTML==59){
					min.innerHTML="00";
					if(hour.innerHTML==24){
						hour.innerHTML = "01";
					}else{//일반 시 증가.
						if(hour.innerHTML<9){
							hourNum++;
							hour.innerHTML="0"+hourNum;
							if(hourNum==9){
								hourNum=0;
							}
						}else{
							hour.innerHTML=Number(hour.innerHTML)+1;
						}
					}
				}else{//일반 분 증가.
					if(min.innerHTML<9){
						minNum++;
						min.innerHTML="0"+minNum;
						if(minNum==9){
							minNum=0;
						}
					}else{
						min.innerHTML=Number(min.innerHTML)+1;
					}
				}
			}else{//일반 초 증가.
				if(sec.innerHTML<9){
					secNum++;
					sec.innerHTML="0"+secNum;
					if(secNum==9){
						secNum=0;
					}
				}else{
					sec.innerHTML=parseInt(sec.innerHTML)+1;
				}
			}
			setTimeout(secCnt, 1000);
		}
		secCnt(); 
		
		
		
		
		
		
		
		
	}
	
	
</script>
<body>

<div class="defaultLayout dailyDeal">

	<!-- time count -->
	<h1 id="dealHeadline" class="fontOpenSans">Daily Deal</h1>
	
	<div id="timeBigBox">
		<div class="timeBox">
			<span class="timeZone timeText" id="hour">${hour}</span>
		</div>
		
		<span class="timeDot timeText">:</span>
		
		<div class="timeBox">
			<span class="timeZone timeText" id="min">${min}</span>
		</div>
		
		<span class="timeDot timeText">:</span>
		
		<div class="timeBox">
			<span class="timeZone timeText" id="sec">${sec}</span>
		</div>
	</div>
	
	<!-- 슬라이더 div -->
	<div id="dailySliderBox">
	
	
	</div>
</div>

</body>
</html>