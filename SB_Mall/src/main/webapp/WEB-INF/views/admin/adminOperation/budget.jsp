<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- adminOperation.jsp 에서 불러온다. -->
<div id="mainContent">
	
	<!-- 날짜 선택 -->
	<div id="mainHeader">
		<span class="headerCalendar fon22 fonb">
		<b class="fon22"> &lt; </b> 
		2018.12.12
		<b class="fon22"> &gt; </b> 
		</span>
	</div>
	
	<!-- 중단 -->
	<div id="mainMid">
		
	<!-- mainMid의 끝 -->
	</div>
	
	<!-- 하단 -->
	<div id="mainBottom">
		<form action="" method="post">
			<div class="space">
				<!-- 1월 -->
				<div class="monthLabel">
					<div>Jan</div>
					<hr>
					<div><input type="text" name="" value="2,000,000,000" disabled></div>
				</div>
				<!-- 2월 -->
				<div class="monthLabel">
					<div>Feb</div>
					<hr>
					<div><input type="text" name="" value="2,000,000,000" disabled></div>
				</div>
				<!-- 3월 -->
				<div class="monthLabel">
					<div>Mar</div>
					<hr>
					<div><input type="text" name="" value="2,000,000,000" disabled></div>
				</div>
				<!-- 4월 -->
				<div class="monthLabel">
					<div>Apr</div>
					<hr>
					<div><input type="text" name="" value="2,000,000,000" disabled></div>
				</div>
			</div>
			
			<div class="space">
				<!-- 5월 -->
				<div class="monthLabel">
					<div>May</div>
					<hr>
					<div><input type="text" name="" value="2,000,000,000" disabled></div>
				</div>
				<!-- 6월 -->
				<div class="monthLabel">
					<div>Jun</div>
					<hr>
					<div><input type="text" name="" value="2,000,000,000" disabled></div>
				</div>
				<!-- 7월 -->
				<div class="monthLabel">
					<div>Jul</div>
					<hr>
					<div><input type="text" name="" value="2,000,000,000" disabled></div>
				</div>
				<!-- 8월 -->
				<div class="monthLabel">
					<div>Aug</div>
					<hr>
					<div><input type="text" name="" value="2,000,000,000" disabled></div>
				</div>
			</div>
			
			<div class="space">
				<!-- 9월 -->
				<div class="monthLabel">
					<div>Sep</div>
					<hr>
					<div><input type="text" name="" value="2,000,000,000" disabled></div>
				</div>
				<!-- 10월 -->
				<div class="monthLabel">
					<div>Oct</div>
					<hr>
					<div><input type="text" name="" value="2,000,000,000" disabled></div>
				</div>
				<!-- 11월 -->
				<div class="monthLabel">
					<div>Nov</div>
					<hr>
					<div><input type="text" name="" value="2,000,000,000" disabled></div>
				</div>
				<!-- 12월 -->
				<div class="monthLabel">
					<div>Dec</div>
					<hr>
					<div><input type="text" name="" value="2,000,000,000" disabled></div>
				</div>
			</div>
			<div class="budgetResult">
				<span id="budgetSubmit" class="toInput fl-right none">
					입력완료
				</span>
				<span id="budgetInput" class="toInput fl-right">
					수정하기
				</span>
				<span class="fl-right">
					<span class="toResult">
						<span>총 매출</span>
						<span>200,000,000,000</span>
					</span>
				</span>
			</div>
		</form>
		
	<!-- mainBottom의 끝 -->
	</div>
	
<!-- mainContent의 끝 -->
</div>
<script type="text/javascript">
$(document).ready(function(){
	
	//메뉴 및 서브메뉴에 css 적용
	removeActive('#budget', 0);
	
	//버젯 입력 input disabled 해제
	$('#budgetInput').click(function(){
		$('.monthLabel input').attr( 'disabled', false );
		$('.monthLabel input').addClass('inputActive');
		$(this).addClass('none');
		$('#budgetSubmit').removeClass('none');
	});
	
	//버젯 입력 Submit 하고 input disabled 적용
	$('#budgetSubmit').click(function(){
		$('.monthLabel input').attr( 'disabled', true );
		$('.monthLabel input').removeClass('inputActive');
		$(this).addClass('none');
		$('#budgetInput').removeClass('none');
// 		$ajax(){
// 		}
	});

});
</script>