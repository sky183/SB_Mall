<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="space">
	<input type="hidden" id="nowYear" name="nowYear" value="${budgetVO.nowYear}">
	<!-- 1월 -->
	<div class="monthLabel">
		<div>Jan</div>
		<hr>
		<div><input type="text" id="Jan" name="Jan" value="${budgetVO.jan}" readOnly></div>
	</div>
	<!-- 2월 -->
	<div class="monthLabel">
		<div>Feb</div>
		<hr>
		<div><input type="text" id="Feb" name="Feb" value="${budgetVO.feb}" readOnly></div>
	</div>	
	<!-- 3월 -->
	<div class="monthLabel">
		<div>Mar</div>
		<hr>
		<div><input type="text" id="Mar" name="Mar" value="${budgetVO.mar}" readOnly></div>
	</div>
	<!-- 4월 -->
	<div class="monthLabel">
		<div>Apr</div>
		<hr>
		<div><input type="text" id="Apr" name="Apr" value="${budgetVO.apr}" readOnly></div>
	</div>
</div>

<div class="space">
	<!-- 5월 -->
	<div class="monthLabel">
		<div>May</div>
		<hr>
		<div><input type="text" id="May" name="May" value="${budgetVO.may}" readOnly></div>
	</div>
	<!-- 6월 -->
	<div class="monthLabel">
		<div>Jun</div>
		<hr>
		<div><input type="text" id="Jun" name="Jun" value="${budgetVO.jun}" readOnly></div>
	</div>
	<!-- 7월 -->
	<div class="monthLabel">
		<div>Jul</div>
		<hr>
		<div><input type="text" id="Jul" name="Jul" value="${budgetVO.jul}" readOnly></div>
	</div>
	<!-- 8월 -->
	<div class="monthLabel">
		<div>Aug</div>
		<hr>
		<div><input type="text" id="Aug" name="Aug" value="${budgetVO.aug}" readOnly></div>
	</div>
</div>

<div class="space">
	<!-- 9월 -->
	<div class="monthLabel">
		<div>Sep</div>
		<hr>
		<div><input type="text" id="Sep" name="Sep" value="${budgetVO.sep}" readOnly></div>
	</div>
	<!-- 10월 -->
	<div class="monthLabel">
		<div>Oct</div>
		<hr>
		<div><input type="text" id="Oct" name="Oct" value="${budgetVO.oct}" readOnly></div>
	</div>
	<!-- 11월 -->
	<div class="monthLabel">
		<div>Nov</div>
		<hr>
		<div><input type="text" id="Nov" name="Nov" value="${budgetVO.nov}" readOnly></div>
	</div>
	<!-- 12월 -->
	<div class="monthLabel">
		<div>Dec</div>
		<hr>
		<div><input type="text" id="Dec" name="Dec" value="${budgetVO.dec}" readOnly></div>
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
			<span>Total Year Budget</span>
			<span id="yearBudget">
			<fmt:formatNumber value="${budgetVO.yearBudget }" pattern="#,###"/>
			</span>
		</span>
	</span>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
	commaVal();
	
	function uncommaVal(){
		
		$('#Jan').val(uncomma($('#Jan').val()));
		$('#Feb').val(uncomma($('#Feb').val()));
		$('#Mar').val(uncomma($('#Mar').val()));
		$('#Apr').val(uncomma($('#Apr').val()));
		$('#May').val(uncomma($('#May').val()));
		$('#Jun').val(uncomma($('#Jun').val()));
		$('#Jul').val(uncomma($('#Jul').val()));
		$('#Aug').val(uncomma($('#Aug').val()));
		$('#Sep').val(uncomma($('#Sep').val()));
		$('#Oct').val(uncomma($('#Oct').val()));
		$('#Nov').val(uncomma($('#Nov').val()));
		$('#Dec').val(uncomma($('#Dec').val()));
		
	}
	
	function commaVal(){
		
		$('#Jan').val(comma($('#Jan').val()));
		$('#Feb').val(comma($('#Feb').val()));
		$('#Mar').val(comma($('#Mar').val()));
		$('#Apr').val(comma($('#Apr').val()));
		$('#May').val(comma($('#May').val()));
		$('#Jun').val(comma($('#Jun').val()));
		$('#Jul').val(comma($('#Jul').val()));
		$('#Aug').val(comma($('#Aug').val()));
		$('#Sep').val(comma($('#Sep').val()));
		$('#Oct').val(comma($('#Oct').val()));
		$('#Nov').val(comma($('#Nov').val()));
		$('#Dec').val(comma($('#Dec').val()));
		
	};
	
	
	//버젯 입력 input readOnly 해제
	$('#budgetInput').on('click', function(){
		uncommaVal();
		$('.monthLabel input').attr( 'readOnly', false );
		$('.monthLabel input').addClass('inputActive');
		$(this).addClass('none');
		$('#budgetSubmit').removeClass('none');
	});
	
	//버젯 입력 Submit 하고 input readOnly 적용
	$('#budgetSubmit').on('click', function(){
		$('.monthLabel input').attr( 'readOnly', true );
		$('.monthLabel input').removeClass('inputActive');
		$(this).addClass('none');
		$('#budgetInput').removeClass('none');
		
		$.ajax({
			url : '<%=request.getContextPath()%>/admin/adminOperation/budget/loadBudgetReport/updateBudget',
			data : $('#budgetModify').serialize(),
			type : 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			error : function(error) {
		        alert("Error!");
		    },
			success : function(data) {
				alert(data);
			}
		});
		
		commaVal();
	});
	
	
});


</script>		
			