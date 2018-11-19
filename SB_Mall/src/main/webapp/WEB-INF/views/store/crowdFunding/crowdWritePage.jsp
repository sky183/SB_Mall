<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/crowdWrite.css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<title>Insert title here</title>
<script>
	var goodsCount=0; // 상품 추가 갯수 카운트
	var optionCount=0; // 총 옵션 추가 갯수 카운트
	
	
	$(document).ready(function() {
	    $('#summernote').summernote({
	            height: 300,              	 // set editor height
	            minHeight: 300,             // set minimum height of editor
	            maxHeight: 300,             // set maximum height of editor
	            focus: true,                  // set focus to editable area after initializing summernote
	            callbacks: {
					onImageUpload: function(files, editor, welEditable) {
			            for (var i = files.length - 1; i >= 0; i--) {
			            	sendFile(files[i], this);
			            }
			        }
				}
	    });
	    
	    function sendFile(file, el) {
			var str = file.name;
		     var filename = guid() + str;
		      console.log(filename);
			var form_data = new FormData();
	      	form_data.append('file', file);
	      	form_data.append('filename', filename);
	      	$.ajax({
	        	data: form_data,
	        	type: "POST",
	        	url: 'http://52.79.226.226/file/upload/crsalesboard',
	        	cache: false,
	        	contentType: false,
	        	enctype: 'multipart/form-data',
	        	processData: false,
	        	success: function(img_name) {
	        		
	          		$(el).summernote('editor.insertImage', 
	          						img_name);
	        	}
	      	});
	    }
	    
	    function firstGoodsNo(){
	    	var goodsNo = guid();
	    	$('.goodsNoPk').val(goodsNo);
	    	$('.goodsNoFk').val(goodsNo);
	    }
	    firstGoodsNo();
	    
	   	function firstUserSeq(){
	   		var member = '${memberInfo.userSeq}';
	   		if(member!=''){
	   			$('.userSeq').val(member);
	   		}
	   	}
	   	firstUserSeq();
	   	
	    /* goods 상품 추가 버튼 */
	    $('.goodsBtnPlus').on('click',function addGoodsOne(){
	    		
	    		if(goodsCount<4){
	    			goodsCount++;
	    			optionCount++;
	    			var goodsNo = guid();
	    			/* alert(goodsNo); */
	    			
					var remoteAppend = 
						'<div class="remoteList remoteMidBox'+goodsCount+'">'
						+'	<span class="remoteImgBox">'
						+'		<img class="rmtImg remoteImg'+goodsCount+'" src="img/noImage2.png"> <!-- 상품 이미지 -->'
						+'	</span>'
						+'	<span class="remoteNameBox">'
						+'		<h5 class="rmtNm">'+(Number(goodsCount)+1)+'.&nbsp</h5><h5 class="rmtNm remoteName'+goodsCount+'">상품이름</h5><br>'
						+'		<h6 class="rmtPri remotePrice'+goodsCount+'">가격</h6>'
						+'	</span>'
						+'	<span class="remoteDelBox">'
						+'		<a class="remoteDel" remoteDel="remoteMidBox'+goodsCount+'" goodsDel="goodsList'+goodsCount+'">상품삭제</a>'
						+'	</span>'
						+'</div>';
						
						
						
	    			var goodsAppend = 
		    		'<div class="goodsList'+goodsCount+'">	<!-- goods Div -->'
					+'<h3 class="goodsListTitle">판매 상품 목록 '+(Number(goodsCount)+1)+'</h3>'
					
					+'	<a class="goodsBtnMinus" goodsMinusBtn="goodsList'+goodsCount+'" remoteDel="remoteMidBox'+goodsCount+'">-</a><br>'
						
					+'	<label>상품 이름'
					+'		<span>'
					+'			<input type="hidden" class="goodsNoPk" name="goodsList['+goodsCount+'].goodsNo" value="'+goodsNo+'">'
					+'			<input type="text" class="goodsName" remoteNm = "remoteName'+goodsCount+'" name="goodsList['+goodsCount+'].goodsName" placeholder="상품의 이름을 입력해주세요">'
					+'		</span>'
					+'	</label><br>'
					+'	<label>상품 가격'
					+'		<span>'
					+'			<input type="number" class="goodsPrice" remotePri = "remotePrice'+goodsCount+'" name="goodsList['+goodsCount+'].goodsPrice" placeholder="상품의 가격을 입력해주세요" oninput="mathABS(this)">'
					+'		</span>'
					+'	</label><br>'
					+'	<label>상품 이미지'
					+'		<span>'
					+'			<input type="hidden" id="goodsPhoto'+goodsCount+'" name="goodsList['+goodsCount+'].goodsPhoto">'
					+'			<input type="file" name="goodsPhoto" photoId="goodsPhoto'+goodsCount+'" onchange="goodsUpload(this,' + "'goodsPhoto" +goodsCount+"'" + ", 'remoteImg" +goodsCount+ "')" + '">'
					+'		</span>'
					+'	</label><br>'
						
					+'	<a class="optionBtnPlus pludMinusbtn" optPlusBtn="goodsList'+goodsCount+'" optCount="0">+</a>'
						
					+'	<div class="goodsList'+goodsCount+'_Opt0"> <!-- option테이블 -->'
					+'		<label>옵션1 내용'
					+'			<span>'
					+'				<input type="hidden" class="goodsNoFk" name="OptionList['+optionCount+'].goodsNo" value="'+goodsNo+'">'
					+'				<input type="text" name="OptionList['+optionCount+'].opt1Name" placeholder="옵션1의 내용을 입력해주세요">'
					+'			</span>'
					+'		</label>'
					+'		<label>옵션1 추가금'
					+'			<span>'
					+'				<input type="number" name="OptionList['+optionCount+'].opt1Price" placeholder="옵션1의 추가금액을 입력해주세요" oninput="mathABS(this)">'
					+'			</span>'
					+'		</label><br>'
					+'		<label>옵션2 내용'
					+'			<span>'
					+'				<input type="text" name="OptionList['+optionCount+'].opt2Name" placeholder="옵션2의 내용을 입력해주세요">'
					+'			</span>'
					+'		</label>'
					+'		<label>옵션2 추가금'
					+'			<span>'
					+'				<input type="number" name="OptionList['+optionCount+'].opt2Price" placeholder="옵션2의 추가금액을 입력해주세요" oninput="mathABS(this)">'
					+'			</span>'
					+'		</label>'
					/* +'		<a class="optionBtnMinus" id="goodsList1_Opt0" btn="goodsList1">-</a>' */
					+'	</div>'
					+'</div><!-- 상품 등록 끝 -->';
				
					/* 상품 추가, 이벤트 연결 */
					$('#goodsBigBox').append(goodsAppend);
					
					$('.optionBtnPlus').off();
					$('.goodsBtnMinus').off();
					optionAdd();
					removeGoods();
					
					/* 리모컨 추가, 이벤트 연결 */
					remoteNmEventOff();
					remoteRemoveEventOff();
					$('.remoteAddBox').append(remoteAppend);
					remoteNmEvent();
					remoteRemoveEvent();
				
	    		}else{
	    			alert('상품은 5개까지 추가 가능합니다')
	    			
	    		}
	    })
	    
	    /*  상품 삭제 */
	   	function removeGoods(){
		    $('.goodsBtnMinus').on('click',function(){
		    	var removeGoods = $(this).attr('goodsMinusBtn');	
		    	var optLength = $('.'+removeGoods+'').find($('div[class^="goodsList"]')).length;
		    	$('.'+removeGoods+'').remove();
		    	
		    	optionCount -= optLength; /* 상품에 추가된 옵션 갯수 만큼 빼기 */
		    	goodsCount --;
		    	
		    	alert("optionLength : "+optLength+", optionCount : "+optionCount);
		    	var removeTg = $(this).attr('remoteDel');
	    		$('.'+removeTg+'').remove();
		    })
	    }
	    
	    
	    /* 옵션 추가 버튼 */
	    function optionAdd(){
		    $('.optionBtnPlus').on('click',function(){
				var goodsList = $(this).attr('optPlusBtn');
				var btnNum = $(this).attr('plus');
				$(this).attr('optCount',Number($(this).attr('optCount'))+1);
				var goodsNo = $('.'+goodsList+'').find('input[class="goodsNoPk"]').val();
				if($(this).attr('optCount')<5){
					var optNum = $(this).attr('optCount');
					optionCount++;
					/* var optCount=$(this).attr('optCount'); */
					
						var appendOpt = 
							'<div class="'+goodsList+'_Opt'+optNum+'">'
							+' <label>옵션1 내용 '
							+'<span>'
							+'<input type="hidden" name="OptionList['+optionCount+'].goodsNo" value="'+goodsNo+'">'
							+'<input type=text name="OptionList['+optionCount+'].opt1Name" placeholder="옵션1의 내용을 입력해주세요">'
							+'</span>'
							+'</label> '
							+'<label>옵션1 추가금 '
							+'<span>'
							+'<input type=number name="OptionList['+optionCount+'].opt1Price" placeholder="옵션1의 추가금액을 입력해주세요">'
							+'</span>'
							+'</label><br>'
							+'<label>옵션2 내용 '
							+'<span>'
							+'<input type=text name="OptionList['+optionCount+'].opt2Name" placeholder="옵션2의 내용을 입력해주세요">'
							+'</span>'
							+'</label> '
							+'<label>옵션2 추가금 '
							+'<span>'
							+'<input type=number name="OptionList['+optionCount+'].opt2Price" placeholder="옵션2의 추가금액을 입력해주세요">'
							+'</span>'
							+'</label> '
							+'<a class="optionBtnMinus" id="'+goodsList+'_Opt'+optNum+'" btn="'+goodsList+'">-</a>'
							+'</div>';
							
						$('.optionBtnMinus').off();//선택자에 걸린 모든 이벤트 제거
						$('.'+goodsList+'').append(appendOpt);
						optionRemove(); //선택자에 이벤트 연결
				}else{
					alert('상품 등록은 5개까지 가능합니다');
				}
			})
	    }
	    optionAdd();
		
		/* 옵션 삭제 */
		function optionRemove(){
			$('.optionBtnMinus').on('click',function(){
				var goodsList = $(this).attr('id');
				$('.'+goodsList+'').remove();
				
				var optPlusBtn = $(this).attr('btn');
				$('a[optPlusBtn='+optPlusBtn+']').attr('optCount',Number($('a[optPlusBtn='+optPlusBtn+']').attr('optCount'))-1);
				optionCount--;
			})
	    }
	    optionRemove();
	    
	    //리모컨 이름 변경 이벤트
	    function remoteNmEvent(){
	    	/* alert('리모컨 이벤트 연결.'); */
	    	// 상품 이름 변경
	    	$('.goodsName').keyup(function(){
	    		var goodsName = $(this).attr('remoteNm');
	    		$('.'+goodsName+'').html($(this).val());
	    	})
	    	
	    	$('.goodsPrice').keyup(function(){
	    		var goodsPri = $(this).attr('remotePri');
	    		$('.'+goodsPri+'').html($(this).val()+'원');
	    	})
	    }
	    remoteNmEvent();
	    
	    //리모컨 이름 변경 이벤트 제거
	    function remoteNmEventOff(){
	    	$('.goodsName').off();
	    }
	    
	    // 리모컨 삭제버튼
	    function remoteRemoveEvent(){
	    	$('.remoteDel').on('click',function(){
	    		var check = confirm("상품을 삭제하시겠습니까?");
		    	
		    	if(check){
		    		var goodsDel = $(this).attr('goodsDel');
		    		var optLength = $('.'+goodsDel+'').find($('div[class^="goodsList"]')).length;
			    	$('.'+goodsDel+'').remove();
			    	optionCount -= optLength; /* 상품에 추가된 옵션 갯수 만큼 빼기 */
		    		
		    		var removeTg = $(this).attr('remoteDel');
		    		$('.'+removeTg+'').remove();
		    	}
	    	})
	    }
	    
	    // 리모컨 삭제버튼 이벤트 제거
	    function remoteRemoveEventOff(){
	    	$('.remoteDel').off();
	    }
	    
	    
	}); //document ready end
	
	//product이미지 저장
	function productUpload(file, photoId) {
	      var str = file.value.substring(file.value.lastIndexOf("\\")+1); 
	      var filename = guid() + str;
	      /* alert(photoId); */
	      console.log(filename);
	      var form_data = new FormData();
	      	form_data.append('file', file.files[0]);
	      	form_data.append('filename', filename);
	      	$.ajax({
	        	data: form_data,
	        	type: "POST",
	        	url: 'http://52.79.226.226/file/upload/crproduct',
	        	contentType: false,
	        	processData: false,
	        	enctype: 'multipart/form-data',
	        	success: function(img_name) {
	        		$("#productPhoto").val(img_name);
	        	}
	      	});
	    }
	
	//goods이미지 저장
	function goodsUpload(file, photoId, remotePhoto) {
	      var str = file.value.substring(file.value.lastIndexOf("\\")+1); 
	      var filename = guid() + str;
	      alert(photoId);
	      console.log(filename);
	      var form_data = new FormData();
	      	form_data.append('file', file.files[0]);
	      	form_data.append('filename', filename);
	      	$.ajax({
	        	data: form_data,
	        	type: "POST",
	        	url: 'http://52.79.226.226/file/upload/crgoods',
	        	contentType: false,
	        	processData: false,
	        	enctype: 'multipart/form-data',
	        	success: function(img_name) {
	        		$('#'+photoId+'').val(img_name);
	        		$('.'+remotePhoto+'').attr('src',img_name);
	        	}
	      	});
	    }
	function addGoods(){
		$('.goodsBtnPlus').trigger('click');
	}
	 
	/* goodsSeq */
	function guid() {
	      timestamp = new Date().getTime();
	      return timestamp;
	   }
	
	/* form submit */
	function sendCode(){
		$('.crowdBoardtext').val($('#summernote').summernote('code'));
		$('#crowdWriteForm').submit();
	}
	
	/* price 숫자면 받기 */
	function mathABS(e) {
		e.value = Math.abs(e.value); //number 인풋에 자연수만 들어가도록 변경
	}

</script>
</head>
<body>
<div id="crowdWriteBigBanner">
	<div id="crowdWriteMidBanner">
		<h3 class = rowdWriteBannerH3>CrowdWrite</h3>
	</div>
</div>


<div id="crowdWriteBixBox">
	<form method="post" enctype="multipart/form-data" id="crowdWriteForm">
		<div id="crowdBoardBigBox"> <!-- crowdBoard테이블 -->
			<label>판매글 제목
				<span>
					<input type="hidden" class="userSeq" name="crowdBoard.userSeq">
					<input type="text" name="crowdBoard.title" placeholder="판매글의 제목을 입력해주세요">
				</span>
			</label><br>
			<label>목표금액
				<span>
					<input type="number" name="crowdBoard.targetPrice" placeholder="목표 금액을 입력해주세요" oninput="mathABS(this)">
				</span>
			</label>
		</div><br>
		
		<div id="productBigBox"> <!-- Product테이블 -->
			<label>대표상품 이름
				<span>
					<input type="text" name="crowdProduct.productName" placeholder="상품의 이름을 입력해주세요">
				</span>
			</label><br>
			<label>대표상품 가격
				<span>
					<input type="number" name="crowdProduct.price" placeholder="상품의 가격을 입력해주세요" oninput="mathABS(this)">
				</span>
			</label><br>
			<label>대표상품 이미지
				<span><!-- prpduct image -->
					<input type="hidden" id="productPhoto" name="crowdProduct.photo">
					<input type="file" name = "productFakePhoto" onchange="productUpload(this,'productPhoto')">
				</span>
			</label><br>
			<label>대표상품 설명
				<span>
					<input type="text" name="crowdProduct.detail" placeholder="상품의 설명을 입력해주세요">
				</span>
			</label>
		</div><br>
		
		
		
		<div id="goodsBigBox"> <!-- Goods테이블 -->
			<h1 class="goodsTitle">상품</h1>
			<a class="goodsBtnPlus" goodsPlusBtn="goodsBigBox" goodsCount="0">+</a> <!-- 상품 추가 -->
			<div class="goodsList0">	<!-- goods Div -->
			<h3 class="goodsListTitle">판매 상품 목록 1</h3><br>
			
				
				<!-- <a class="goodsBtnMinus pludMinusbtn" goodsMinusBtn="goodsList0">-</a><br> -->
				
				<label>상품 이름
					<span>
						<input type="hidden" class="goodsNoPk" name="goodsList[0].goodsNo" value="">
						<input type="text" class="goodsName" remoteNm = "remoteName0" name="goodsList[0].goodsName" placeholder="상품의 이름을 입력해주세요">
					</span>
				</label><br>
				<label>상품 가격
					<span>
						<input type="number" class="goodsPrice" remotePri = "remotePrice0" name="goodsList[0].goodsPrice" placeholder="상품의 가격을 입력해주세요" oninput="mathABS(this)">
					</span>
				</label><br>
				<label>상품 이미지
					<span>
						<input type="hidden" id="goodsPhoto0" name="goodsList[0].goodsPhoto">
						<input type="file" name="goodsPhoto" onchange="goodsUpload(this, 'goodsPhoto0', 'remoteImg0')">
					</span>
				</label><br>
				
				<a class="optionBtnPlus pludMinusbtn" optPlusBtn="goodsList0" optCount="0">+</a>
				
				<div class="goodsList0_Opt0"> <!-- option테이블 -->
					<label>옵션1 내용
						<span>
							<input type="hidden" class="goodsNoFk" name="optionList[0].goodsNo" value="">
							<input type="text" name="optionList[0].opt1Name" placeholder="옵션1의 내용을 입력해주세요">
						</span>
					</label>
					<label>옵션1 추가금
						<span>
							<input type="number" name="optionList[0].opt1Price" placeholder="옵션1의 추가금액을 입력해주세요" oninput="mathABS(this)">
						</span>
					</label><br>
					<label>옵션2 내용
						<span>
							<input type="text" name="optionList[0].opt2Name" placeholder="옵션2의 내용을 입력해주세요">
						</span>
					</label>
					<label>옵션2 추가금
						<span>
							<input type="number" name="optionList[0].opt2Price" placeholder="옵션2의 추가금액을 입력해주세요" oninput="mathABS(this)">
						</span>
					</label>
					<!-- <a class="optionBtnMinus" id="goodsList1_Opt0" btn="goodsList1">-</a> -->
				</div>
			</div><!-- 상품 등록 끝 -->
		</div>
		
		<!-- 서머노트 -->
		<input type="hidden" class="crowdBoardtext" name="crowdBoard.text">
	</form>
		<textarea name="content" id="summernote"></textarea>
		<button onclick="sendCode();">sfa</button>
</div>

<div id="writeRemote">
	<a onclick="addGoods()">상품추가</a>
	
	<div class="remoteAddBox"> <!-- 상품 추가 박스 -->
	
		<div class="remoteList remoteMidBox0">
			<div class="remoteImgBox">
				<img class="rmtImg remoteImg0" src="<%=request.getContextPath()%>/img/noImage2.png"> <!-- 상품 이미지 -->
			</div>
			<div class="remoteNameBox">
				<h5 class="rmtNm">1.&nbsp</h5><h5 class="rmtNm remoteName0">상품이름</h5><br>
				<h6 class="rmtPri remotePrice0">가격</h6>
			</div>
			<div class="remoteDelBox">
				<!-- <a class="remoteDel" remoteDel="remoteMidBox0" optionNo = "">상품삭제</a> -->
			</div>
		</div>
		
	</div>
</div>


<%@ include file="/WEB-INF/views/common/header.jsp"%>
</body>
</html>