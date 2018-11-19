<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/subway.css">
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script type="text/javascript">
//노선도 정보로 지하철역 리스트 값 얻기.
	var stationUrl = 'http://openAPI.seoul.go.kr:8088/55686455676570643239595a596655/xml/SearchSTNBySubwayLineService/1/300/';
	var LineNum = 0;
	var stationCode=0;
	var days=1;
	var fast='n';
	$(document).ready(function() {
		
		/* 지하철 호선 선택 */
		$('.selectLine').on('click',function(){
			$('#selectBox').html('');
			
			for (var i = 1; i <= 9; i++) {
				var line = '<button class="selectedLine" value='+i+'>'+i+'호선</button>'
				$('#selectBox').append(line);
			}
			
			$('.selectedLine').on('click',function(){
				LineNum = $(this).val();
				$('.selectLine').html($(this).html());//지하철 노선 html().
				$('.selectLine').val($(this).val()); //지하철 value().
				$('#selectBox').html('');
			})
			
		})
		
		
		
		
		$('.selectStation').on('click',function(){
				$('#selectBox').html('');
				if(LineNum!=0){
					getStations();
					//ajax끝
				}else{
					alert('노선을 선택해주세요');
				}
		})
		
		/* 시간표 보이기 */
		$('.viewSubwayTime').on('click',function(){
			if(LineNum !=0 && stationCode!=0){
			$('#SubwayTimeBigBox').css('display','block');
			}else{
				alert('노선 또는 역을 선택하지 않으셨습니다.');
			}
		})
		
		
		$('.selectDays').change(function() {
			days=$(this).val();
			
			getUpTrain();
			getDownTrain();
		})
		
		$('.selectFast').change(function() {
			if($(this).is(":checked")){
				fast='y';
			}else{
				fast='n';
			}
			getUpTrain();
			getDownTrain();
		})
		
		/* $('input[type=checkbox]:checked')
		})
		
		
		$('input:checkbox[id="checkbox_id"]').is(":checked") == true */

		
		
		
		
		
		
	/* 노선 선택 후, 지하철 역 정보 가져오기 */
	function getStations(){
			$.ajax({
				url: stationUrl+LineNum,
				error:console.log("노선선택 = "+stationUrl+LineNum),
				success : function(data){
					cnt=1;
					
					$(data).find('SearchSTNBySubwayLineService').find('row').each(function(){
						var st_code = $(this).find('STATION_CD').text();
						console.log("지하철 코드 = "+st_code);
						var st_name = $(this).find('STATION_NM').text();
						
						
						if(cnt%5==0){
							$('#selectBox').append('<button class="stationOn" value="'+st_code+'">'+st_name+'</button><br>');
						console.log(st_code+', '+st_name);
						}else{
							$('#selectBox').append('<button class="stationOn" value="'+st_code+'">'+st_name+'</button>');
						}
						cnt++;
					})
					
					
					$('.stationOn').on('click',function(){
						
						$('.selectStation').html($(this).html());
						$('.selectStation').val($(this).val());
						stationCode=$(this).val();
						$('.viewSubwayTime').css('background-color','#ffc828');
						
						$('#selectBox').html('');
						
						$('.tBoxLineNum').html(LineNum+'호선');
						getUpTrain();
						getDownTrain();
					})
				}
			})
		}
		
		
		//상행선 시간표.
		function getUpTrain(){
			var upUrl = 'http://openAPI.seoul.go.kr:8088/55686455676570643239595a596655/xml/SearchSTNTimeTableByIDService/1/300/'+stationCode+'/'+days+'/1/';
			
			$.ajax({
				url:upUrl,
				error:function(){
					alert('upUrl : '+upUrl);
				},
				success:function(data){
					$('.dirUp').html('');
					$(data).find('SearchSTNTimeTableByIDService').find('row').each(function(){
						if($(this).find('EXPRESS_YN').text()=='G'){//급행 아님.
							if(fast=='n'){
								var addUpTrain = '<h4 class="timeBoxH4">'+$(this).find('ARRIVETIME').text()+'</h4><h6 class="timeBoxH6">'+$(this).find('SUBWAYENAME').text()+'행</h6>';
								$('.dirUp').append(addUpTrain);
							}
						}else{//급행임.
							var addUpTrain = '<h4 class="timeBoxH4">'+$(this).find('ARRIVETIME').text()+'</h4><h6 class="timeBoxH6">(급)'+$(this).find('SUBWAYENAME').text()+'행</h6>';
							$('.dirUp').append(addUpTrain);
						}
					})
					if($('.dirUp').html().length==0){
						$('.dirUp').html('<h3>요청하신 지하철 시간표가 <br>존재하지 않습니다.</h3>');
					}
				}
			})
		}
		//하행선 시간표.
		function getDownTrain(){
			var upUrl = 'http://openAPI.seoul.go.kr:8088/55686455676570643239595a596655/xml/SearchSTNTimeTableByIDService/1/300/'+stationCode+'/'+days+'/2/';
			
			$.ajax({
				url:upUrl,
				error:function(){
					alert('upUrl : '+upUrl);
				},
				success:function(data){
					$('.dirDown').html('');
					console.log(upUrl);
					$(data).find('SearchSTNTimeTableByIDService').find('row').each(function(){
						
						if($(this).find('EXPRESS_YN').text()=='G'){
							if(fast=='n'){
								var addUpTrain = '<h4 class="timeBoxH4">'+$(this).find('ARRIVETIME').text()+'</h4><h6 class="timeBoxH6">'+$(this).find('SUBWAYENAME').text()+'행</h6>';
								$('.dirDown').append(addUpTrain);
							}
						}else{
							var addUpTrain = '<h4 class="timeBoxH4">'+$(this).find('ARRIVETIME').text()+'</h4><h6 class="timeBoxH6">(급)'+$(this).find('SUBWAYENAME').text()+'행</h6>';
							$('.dirDown').append(addUpTrain);
						}
					})
					alert($('.dirDown').html().length);
					if($('.dirDown').html().length==0){
						$('.dirDown').html('<h3>요청하신 지하철 시간표가 <br>존재하지 않습니다.</h3>');
					}
				}
			})
		}
		
		
		
		
		
		
		
	})
	
	

	
</script>
	
</head>
<body>
	<div>
		<button class="SubwaySize">+</button>
		<button class="SubwaySize">-</button>
		<div class="SubwayMap">
			<img class="subwayMapImage" src="<%=request.getContextPath()%>/img/subwayMap-01.png">
		</div>
	</div>
	<div id="subwayBigBox">
	
		<button class="selectLine">호선 선택</button>
		<button class="selectStation">역 선택</button>
		
		<div id="subwayTimeBtn">
			<button class="viewSubwayTime">시간정보</button>
		</div>
	</div>
	<div id="selectBox">
	
	</div>
	
	<!-- 시간표 -->
	<div id="SubwayTimeBigBox">
		<div id="SubwayTimeMidBox">
			<div id="timeBoxLine">
				<h1 class="tBoxLineNum"></h1>
			</div>
			<div id="timeBoxOption">
					<input class="selectDays" type="radio" name="days" checked="checked" value="1">평일
					<input class="selectDays" type="radio" name="days" value="2">주말
					
					<input class="selectFast" type="checkbox" value="D">급행
			</div>
			<div class="timeBoxDir">
				<h4>상행선</h4>
				<div class="dirUp">
				
				</div>
			</div>
			<div class="timeBoxDir">
				<h4>하행선</h4>
				<div class="dirDown">
				
				</div>
			</div>
			
		</div>
	</div>
	
	
<%-- <%@ include file="/WEB-INF/views/common/header.jsp"%> --%>
</body>
</html>