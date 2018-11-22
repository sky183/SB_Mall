<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script type="text/javascript">
var insCnt=0;
var goodsArr=[];
var goods={
		'gNo':'',
		'gPrice':'',
		'gOpt1Name':'',
		'gOpt1Price':'',
		'gOpt2Name':'',
		'gOpt2Price':''
		};
var setGoodsBackColor = function(e) {
	$('#goodsList>li').css('background-color','white');
	e.style.backgroundColor='#f2f2f2';
}
var setOpt1BackColor = function(e) {
	$('#goodsOpt1List li').css('background-color','white');
	e.style.backgroundColor='#f2f2f2';
}
var setOpt2BackColor = function(e) {
	$('#goodsOpt2List li').css('background-color','white');
	e.style.backgroundColor='#f2f2f2';
}
var goodsRadioClick = function(e) {
	var gno = e.dataset.gno;
	//goodsNo에 맞는 옵션목록1  받아오기!
	$.ajax({
		url:'<%=request.getContextPath()%>/store/getGoodsOptionList?goodsNo='+ gno,
		type:'GET',
		success:function(data){
			//옵션1 리스트 초기화
			$('#goodsOpt1List').text('');
			var dupliCheck = "";
			//옵션1 리스트 생성
			for(var key in data){
				
				if(data[key].opt1Name!=dupliCheck){
					dupliCheck=data[key].opt1Name;
					var opt1Id='opt1List'+key
					$('<li/>').attr({
						id:opt1Id,
						onclick:'setOpt1BackColor(this)'
					}).appendTo('#goodsOpt1List');
					$('<input/>').attr({
						id:'radio'+opt1Id,
						name:'opt1Radio',
						type:'radio',
						hidden:'hidden',
						onclick:'opt1RadioClick(this)',
						'data-gno':gno,
						'data-name':data[key].opt1Name,
						'data-price':data[key].opt1Price
					}).appendTo('#'+opt1Id);
					$('<label/>').attr({
						id:'la'+opt1Id,
						'for': 'radio'+opt1Id,
						style:'cursor:pointer'
					}).appendTo('#'+opt1Id);
					$('<span/>').attr({
					}).text(data[key].opt1Name+':(+'+numberWithCommas(data[key].opt1Price)+'원)').appendTo('#la'+opt1Id);
				
				}
			}
		}
	});
	//상품목록 닫기
	$('#goodsSelectHeader').val(1);
	$('#goodsList').hide();
	//옵션목록1펼치기
	$('#goodsOpt1SelectHeader').val(0);
	$('#goodsOpt1List').show('fast');
};

var opt1RadioClick = function(e) {
	var gno = e.dataset.gno;
	//goodsNo와 opt1Name에 맞는 옵션목록2  받아오기
	$.ajax({
		url:'<%=request.getContextPath()%>/store/getGoodsOptionList?goodsNo='+ gno,
		type:'GET',
		success:function(data){
			//옵션2 리스트 초기화
			$('#goodsOpt2List').text('');
			//옵션1이름과 같은 조건의 옵션2 리스트 생성
			for(var key in data){
				if(data[key].opt1Name==e.dataset.name){
					var opt2Id='opt2List'+key
					$('<li/>').attr({
						id:opt2Id,
						onclick:'setOpt2BackColor(this)'
					}).appendTo('#goodsOpt2List');
					$('<input/>').attr({
						id:'radio'+opt2Id,
						name:'opt2Radio',
						type:'radio',
						hidden:'hidden',
						onclick:'opt2RadioClick()',
						'data-gno':gno,
						'data-name':data[key].opt2Name,
						'data-price':data[key].opt2Price
					}).appendTo('#'+opt2Id);
					$('<label/>').attr({
						id:'la'+opt2Id,
						'for': 'radio'+opt2Id,
						style:"cursor:pointer"
					}).appendTo('#'+opt2Id);
					$('<span/>').attr({
					}).text(data[key].opt2Name+':(+'+numberWithCommas(data[key].opt2Price)+'원)').appendTo('#la'+opt2Id);
				}
			}
		}
	});
	//옵션목록1 닫기
	$('#goodsOpt1SelectHeader').val(1);
	$('#goodsOpt1List').hide();
	//옵션목록2펼치기
	$('#goodsOpt2SelectHeader').val(0);
	$('#goodsOpt2List').show('fast');
	
	
}

var opt2RadioClick = function () {
	//옵션목록2펼치기
	$('#goodsOpt2SelectHeader').val(1);
	$('#goodsOpt2List').hide();
	addGoodsList();
	$('#closeBoardSelector').trigger('click');
}

var addGoodsList= function() {
	var goodsNo=$('input[name=goodsRadio]:checked').data('gno');
	var goodsName=$('input[name=goodsRadio]:checked').data('gname');
	var goodsPrice=$('input[name=goodsRadio]:checked').data('price');
	var opt1Name=$('input[name=opt1Radio]:checked').data('name');
	var opt1Price=$('input[name=opt1Radio]:checked').data('price');
	var opt2Name=$('input[name=opt2Radio]:checked').data('name');
	var opt2Price=$('input[name=opt2Radio]:checked').data('price');
	var duplInsCart = false;
	$('#insCartList>li').each(function(index, item){ 
		if(item.dataset.goodsno==goodsNo && item.dataset.opt1name==opt1Name && item.dataset.opt2name==opt2Name){
			duplInsCart = true;
		}
	});
	
	if(duplInsCart){
		alert('이미 등록된 물품입니다.');
		return false;
	}
	
	$('<li/>').attr({
		id:'insCartLi'+insCnt,
		'data-goodsno': goodsNo,
		'data-goodsname': goodsName,
		'data-goodsprice': goodsPrice,
		'data-opt1name':opt1Name,
		'data-opt1price':opt1Price,
		'data-opt2name':opt2Name,
		'data-opt2price':opt2Price
	}).appendTo('#insCartList');
	$('<div/>').attr({
		id:'insCartBox'+insCnt,
		style:'overflow:hidden'
	}).appendTo('#insCartLi'+insCnt);
	$('<div/>').attr({
		id:'insCartDetail'+insCnt,
		'class':'insCartDetail'
	}).html('<p>'+goodsName+'/'+opt1Name+'(+'+numberWithCommas(opt1Price)+')/'
			+opt2Name+'(+'+numberWithCommas(opt2Price)+')'+'</p>')
	.appendTo('#insCartBox'+insCnt);
	$('<div/>').attr({
		id:'insCartDeleteBox'+insCnt,
		'class':'insCartDivRight'
	}).appendTo('#insCartDetail'+insCnt);
	$('<button/>').attr({
		value:insCnt,
		onclick:'removeGoodsList(this)',
		'class':'insCartDeleteBtn'
	}).text('X').appendTo('#insCartDeleteBox'+insCnt);
	$('<div/>').attr({
		id:'insCartNumberBox'+insCnt,
		'class': 'insCartNumberBox'
	}).appendTo('#insCartBox'+insCnt);
	$('<input/>').attr({
		type:'number',
		id:'insCartNumber'+insCnt,
		'class':'insCartNumber',
		'data-inscnt':insCnt,
		oninput:'changeInsCartPrice(this)',
		value:1,
		min:0,
		max:9999
	}).appendTo('#insCartNumberBox'+insCnt);
	$('<button/>').attr({
		'class':'insCartNumBtn',
		type:'button',
		value:insCnt,
		onclick:'minusInsCartNum(this)'
	}).text('-').appendTo('#insCartBox'+insCnt);
	$('<button/>').attr({
		'class':'insCartNumBtn',
		type:'button',
		value:insCnt,
		onclick:'plusInsCartNum(this)'
	}).text('+').appendTo('#insCartBox'+insCnt);
	$('<span/>').attr({
		id:'insCartPrice'+insCnt,
		'class': 'insCartPrice',
		'data-price':goodsPrice+opt1Price+opt2Price,
		'data-calprice':goodsPrice+opt1Price+opt2Price
	}).text(numberWithCommas(goodsPrice+opt1Price+opt2Price)+'원').appendTo('#insCartBox'+insCnt);
	insCnt++;
}

var removeGoodsList = function(e) {
	$('#insCartLi'+e.value).remove();
}

	$(document).ready(function () {
		$('.storeDeleteBtn').click(function () {
			if (confirm("정말 삭제하시겠습니까??") == true){
				$('#storeDeleteForm').submit();
			}else{//취소
			    return;
			}
		});
		
		$('.storeModifyBtn').click(function () {
			if (confirm("게시글을 수정하시겠습니까??") == true){
				$('#storeModifyForm').submit();
			}else{//취소
			    return;
			}
		});
		
		$('#boardSelectViewBTN').click(function () {
			var seq = '${proAndSal.productSeq}';
			$('#boardSelector').css('visibility','visible');
			$.ajax({
				url:'<%=request.getContextPath()%>/store/getGoodsList?productSeq='+seq,
				type:'GET',
				success: function(data) {
					$('#goodsList').text('');
					for(var key in data){
						var gid = 'GoodsList'+key;
						$('<li/>').attr({
							id:gid,
							'class':'goodsListItem goodsListSelect',
							value:data[key].goodsNo,
							onclick:'setGoodsBackColor(this)'
						}).appendTo('#goodsList');
						$('<input/>').attr({
							id:'radio'+gid,
							name:'goodsRadio',
							type:'radio',
							onclick:'goodsRadioClick(this)',
							hidden:'hidden',
							'data-gno':data[key].goodsNo,
							'data-gname':data[key].goodsName,
							'data-price':data[key].goodsPrice
						}).appendTo('#'+gid);
						$('<label/>').attr({
							id:'la'+gid,
							'for': 'radio'+gid,
							style:"cursor:pointer"
						}).appendTo('#'+gid);
						$('<span/>').attr({
							id:'GoodsListImgBox'+key,
							'class':'goodsListImgBox'
						}).appendTo('#la'+gid);
						
						$('<img/>').attr({
							src:data[key].goodsPhoto,
							onerror:'imgError(this)'
						}).appendTo('#GoodsListImgBox'+key);
						
						$('<span/>').attr({
							'class':'goodsListItemName'
						}).text(data[key].goodsName).appendTo('#la'+gid);
						
						$('<span/>').text(numberWithCommas(data[key].goodsPrice)+' 원').appendTo('#la'+gid);
					}
				}
			});
			
			$('#goodsSelectHeader').val(0);
			$('#goodsList').show('fast');
		});
		
		$('#closeBoardSelector').click(function () {
			$('#boardSelector>ul').text('');
			$('#boardSelector').css('visibility','hidden');
		});
		
		
		$('#goodsSelectHeader').click(function () {
			if($(this).val()=="0"){
				$(this).val(1);
				$('#goodsList').hide();
			}else if($(this).val()=="1"){
				$('#goodsOpt1SelectHeader').val(1);
				$('#goodsOpt1List').hide();
				$('#goodsOpt2SelectHeader').val(1);
				$('#goodsOpt2List').hide();
				$(this).val(0);
				$('#goodsList').show('fast');
			}
		});
		
		$('#goodsOpt1SelectHeader').click(function () {
			if($(this).val()=="0"){
				$(this).val(1);
				$('#goodsOpt1List').hide();
			}else if($(this).val()=="1"){
				$('#goodsSelectHeader').val(1);
				$('#goodsList').hide();
				$('#goodsOpt2SelectHeader').val(1);
				$('#goodsOpt2List').hide();
				$(this).val(0);
				$('#goodsOpt1List').show('fast');
			}
		});
		
		$('#goodsOpt2SelectHeader').click(function () {
			if($(this).val()=="0"){
				$(this).val(1);
				$('#goodsOpt2List').hide();
			}else if($(this).val()=="1"){
				$('#goodsSelectHeader').val(1);
				$('#goodsList').hide();
				$('#goodsOpt1SelectHeader').val(1);
				$('#goodsOpt1List').hide();
				$(this).val(0);
				$('#goodsOpt2List').show('fast');
			}
		});
		
	});
	
	function imgError(e) {
		e.src='<%=request.getContextPath()%>/img/noImage.png'
	}
	function addCart() {
		$('#quantity').val($('#selQuantity').val());
		$('#option').val($('input[type=radio][name=color]:checked').val());
		//$('#hForm').submit();
        var queryString = $('#hForm').serialize();
        $.ajax({
				    url : '<%=request.getContextPath()%>/order/addCart',
				    type : 'POST',
					data : queryString,
					error : function(error) {
				        alert("Error!");
				    },
					success : function(data) {
						alert(data);
					}
				});
	}
	function buyProduct() {
		$('#quantity').val($('#selQuantity').val());
		$('#option').val($('input[type=radio][name=color]:checked').val());
		$("#hForm").attr("action", "<%=request.getContextPath()%>/order/insOrder");
		$('#hForm').submit();
	}
	function changeInsCartPrice(e) {
		var insCnt = e.dataset.inscnt;
		e.value = Math.abs(e.value); //number 인풋에 자연수만 들어가도록 변경
		if(e.value>9999){
			e.value=9999;
		}
		var calprice =$('#insCartPrice'+insCnt).data('price')*e.value;
		$('#insCartPrice'+insCnt).text(numberWithCommas(calprice)+"원");
		$('#insCartPrice'+insCnt).data('calprice',calprice);
	}
	function plusInsCartNum(e) {
		var selector = $('#insCartNumber'+e.value)
		selector.val(Number(selector.val())+1);
		$(selector).trigger('input');
	}
	function minusInsCartNum(e) {
		var selector = $('#insCartNumber'+e.value)
		selector.val(Number(selector.val())-1);
		$(selector).trigger('input');
	}
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	
</script>
</head>
<body>
<div id=boardDetailContainer>
<c:if test="${proAndSal!=null}">
	<div id="boardProductContainer">
		<div id="boardProductThumbBox"> 
			<img src="${proAndSal.photo}" alt="이미지없음" id="boardProductThumb" 
				onerror="imgError(this)">
		</div>
		<div id="boardProductOptionBox">
			<ul>
				<li id="boardProductName">
					<h2>${proAndSal.productName}</h2>
				</li>
				<li>
					<p>가격: <fmt:formatNumber value="${proAndSal.price}" pattern="###,###,###,###,###"/></p>
				</li>
				<li>
					<p>등록일: <fmt:formatDate value="${proAndSal.writeDate}" pattern="yyyy-MM-dd HH:mm"/></p>
				</li>
				<li id="boardSelectLi">
					<div id="boardSelectContainer">
					<div id="boardSelectBox">
						<button type="button" id="boardSelectViewBTN">
							<span class="boardBtnTextLeft">제품선택하기</span>
							<span class="boardBtnTextRight">▽</span>
						</button>
					</div>
					<div id="boardSelector">
						<div class="boardSelectorHeader">
							<span class="boardBtnTextLeft">제품선택</span>
							<button type="button" id="closeBoardSelector" class="boardBtnTextRight">
								<span>X</span>
							</button>
						</div>
						<div>
							<button type="button" class="boardSelectorHeader" value="0" id="goodsSelectHeader">
								<span class="boardBtnTextLeft">제품</span>
								<span class="boardBtnTextRight">▼</span>
							</button>
						</div>
						<ul id="goodsList">
						</ul>
						<div>
							<button type="button" class="boardSelectorHeader" value="1" id="goodsOpt1SelectHeader">
								<span class="boardBtnTextLeft">옵션1</span>
								<span class="boardBtnTextRight">▼</span>
							</button>
						</div>
						<ul id="goodsOpt1List" class="goodsOptUl">
						</ul>
						<div>
							<button type="button" class="boardSelectorHeader" value="1" id="goodsOpt2SelectHeader">
								<span class="boardBtnTextLeft">옵션2</span>
								<span class="boardBtnTextRight">▼</span>
							</button>
						</div>
						<ul id="goodsOpt2List" class="goodsOptUl">
						</ul>
					</div>
					</div>
				</li>
				<li>
					<ul id="insCartList">
					</ul>
				</li>
				<li>
					<p>
						<button class="boardBtn" onclick="addCart()">
							<p class="boardBtnMsg">장바구니추가</p>
						</button>
						<button class="boardBtn" onclick="buyProduct()">
							<p class="boardBtnMsg">주문하기</p>
						</button>
					</p>
				</li>
			</ul>
			<br>
		</div>
	</div>
	<div id="boardDetailHeader">
	<p>상세설명</p>
	</div>
	<br>
	<div id="boardTextContainer">
		${proAndSal.text}
	</div>
</c:if>
	<br>
	<div id="boardReplyContainer">
		<c:if test="${memberInfo.gradeNum>=3}">
			<form method="get" action="<%=request.getContextPath()%>/store/ModifyBoard" id="storeModifyForm">
				<input type="hidden" value="${salSeq}" name="salSeq">
				<input type="button" class="storeBtn storeAdminBtn storeModifyBtn" value="글수정">
			</form>
			<form method="post" action="<%=request.getContextPath()%>/store/deleteBoard" id="storeDeleteForm">
				<input type="hidden" value="${salSeq}" name="salSeq">
				<input type="button" class="storeBtn storeAdminBtn storeDeleteBtn" value="글삭제">
			</form>
		</c:if>
		
	</div>
</div>
</body>
</html>