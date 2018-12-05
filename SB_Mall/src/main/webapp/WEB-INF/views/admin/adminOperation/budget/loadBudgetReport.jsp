<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="space">
	<input type="hidden" id="nowYear" name="nowYear" value="">
	<!-- 1월 -->
	<div class="monthLabel">
		<div>Jan</div>
		<hr>
		<div><input type="text" id="Jan" name="Jan" value="0" disabled></div>
	</div>
	<!-- 2월 -->
	<div class="monthLabel">
		<div>Feb</div>
		<hr>
		<div><input type="text" id="Feb" name="Feb" value="0" disabled></div>
	</div>
	<!-- 3월 -->
	<div class="monthLabel">
		<div>Mar</div>
		<hr>
		<div><input type="text" id="Mar" name="Mar" value="0" disabled></div>
	</div>
	<!-- 4월 -->
	<div class="monthLabel">
		<div>Apr</div>
		<hr>
		<div><input type="text" id="Apr" name="Apr" value="0" disabled></div>
	</div>
</div>

<div class="space">
	<!-- 5월 -->
	<div class="monthLabel">
		<div>May</div>
		<hr>
		<div><input type="text" id="May" name="May" value="0" disabled></div>
	</div>
	<!-- 6월 -->
	<div class="monthLabel">
		<div>Jun</div>
		<hr>
		<div><input type="text" id="Jun" name="Jun" value="0" disabled></div>
	</div>
	<!-- 7월 -->
	<div class="monthLabel">
		<div>Jul</div>
		<hr>
		<div><input type="text" id="Jul" name="Jul" value="0" disabled></div>
	</div>
	<!-- 8월 -->
	<div class="monthLabel">
		<div>Aug</div>
		<hr>
		<div><input type="text" id="Aug" name="Aug" value="0" disabled></div>
	</div>
</div>

<div class="space">
	<!-- 9월 -->
	<div class="monthLabel">
		<div>Sep</div>
		<hr>
		<div><input type="text" id="Sep" name="Sep" value="0" disabled></div>
	</div>
	<!-- 10월 -->
	<div class="monthLabel">
		<div>Oct</div>
		<hr>
		<div><input type="text" id="Oct" name="Oct" value="0" disabled></div>
	</div>
	<!-- 11월 -->
	<div class="monthLabel">
		<div>Nov</div>
		<hr>
		<div><input type="text" id="Nov" name="Nov" value="0" disabled></div>
	</div>
	<!-- 12월 -->
	<div class="monthLabel">
		<div>Dec</div>
		<hr>
		<div><input type="text" id="Dec" name="Dec" value="0" disabled></div>
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
<script type="text/javascript">
$(document).ready(function(){
	$('#nowYear').val(nowYear);
	$('#Jan').val(comma(${budgetVO.jan}));
	$('#Feb').val(comma(${budgetVO.feb}));
	$('#Mar').val(comma(${budgetVO.mar}));
	$('#Apr').val(comma(${budgetVO.apr}));
	$('#May').val(comma(${budgetVO.may}));
	$('#Jun').val(comma(${budgetVO.jun}));
	$('#Jul').val(comma(${budgetVO.jul}));
	$('#Aug').val(comma(${budgetVO.aug}));
	$('#Sep').val(comma(${budgetVO.sep}));
	$('#Oct').val(comma(${budgetVO.oct}));
	$('#Nov').val(comma(${budgetVO.nov}));
	$('#Dec').val(comma(${budgetVO.dec}));
	
	//버젯 입력 input disabled 해제
	$('#budgetInput').on('click', function(){
		$('.monthLabel input').attr( 'disabled', false );
		$('.monthLabel input').addClass('inputActive');
		$(this).addClass('none');
		$('#budgetSubmit').removeClass('none');
	});
	
	//버젯 입력 Submit 하고 input disabled 적용
	$('#budgetSubmit').on('click', function(){
		$('.monthLabel input').attr( 'disabled', true );
		$('.monthLabel input').removeClass('inputActive');
		$(this).addClass('none');
		$('#budgetInput').removeClass('none');
		var nowYearDate = $( ".datepicker" ).val();
		
		$.ajax({
			url : '<%=request.getContextPath()%>/admin/adminOperation/budget/loadBudgetReport/updateBudget',
			data : $('#budgetModify').serialize(),
			error : function(error) {
		        alert("Error!");
		    },
			success : function(data) {
				alert(data);
			}
		});
	});
	
	
});


</script>		
			