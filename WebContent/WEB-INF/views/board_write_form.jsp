<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../header.jsp"%>    
    
<!-- <!DOCTYPE> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <title>글쓰기 폼</title> -->


<style type="text/css">


#boardWriteFormTable{
	
	border: 1px solid #f972b6;
	border-collapse: collapse;
	padding: 0;
	margin: 0;

}

#boardWriteFormTable td{
	
	height: 30px;

}

#map {
	
	border: 1px solid #f972b6;
	border-collapse: collapse;

}

#mapInfo{
	
	border: 1px solid #f972b6;
	border-collapse: collapse;
	margin-right: 5px;
	
}


input[name=bTitle], input[name=bPw] {
	height: 100%;
	width: 100%;
	border: thin;
	border-radius: 4px;
	border-style: solid;
	border-color: #b3c6ff
}

input[name=subLocation], #bLocation, #keyword{
	height: 100%;
	border: thin;
	border-radius: 4px;
	border-style: solid;
	border-color: #b3c6ff
}

.map span:hover{
	cursor: pointer;
}


</style>
<!-- <script type="text/javascript" src="js/script.js"></script> -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=odiDemcla9iRM6yBGuNa&submodules=geocoder"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		var inputAddress = '서울특별시 강남구 역삼동 718-5';
		mapping(inputAddress);
		
// 		$('#btnSearch').click(function(){
		$(document).on('click', '#btnSearch', function(){	
			
			var keyword = $('#keyword').val();
			
// 			alert(keyword);
			
			if(keyword == null || keyword == '') {
				alert('검색어를 입력하세요!');
				return false;
			}
			
			$('.map').remove();
			$('#searchAdd').remove();
			
			$.ajax({
				
				url : 'mapSearch.do',
				method : 'get',
				data : 'keyword=' + keyword,
				dataType : 'text',
				success : function(result){
			
				
// 					alert('success');

					var Ca = /\+/g;
					result = decodeURIComponent(result.replace(Ca, " "));


					result = $.parseJSON(result);
					
					var maps = result['items'];
					
					var addelement = '';
					
					$.each(maps , function(i, map){
						
						addelement += '<tr class="map">';
						addelement += '<td width="120px" align="center"><span>' + map['title'] + '</span></td>';
						addelement += '<td width="200px"><span>' + map['description'] + '</span></td>';
						addelement += '<td width="120px" align="center"><span>' + map['telephone'] + '</span></td>';
						addelement += '<input type="hidden" name="tempAdd' + i + '" id="tempAdd' + i + '" value="' + map['address'] + '">';
// 						addelement += '<td id="address">' + map['address'] + '</td>';
// 						addelement += '<td id="roadAddress">' + map['roadAddress'] + '</td>';
// 						addelement += '<td id="mapX">' + map['mapx'] + '</td>';
// 						addelement += '<td id="mapY">' + map['mapy'] + '</td>';
						addelement += '</tr>';
						
					})

					$('#mapInfo').append(addelement);
		
				},
				error : function(ex){
					alert('error : ' + ex.message);
				}
					
			})
			
			return false;

		})
		
		
		$(document).on('click', '.map', function(event){ 

			inputAddress = $(this).find('input').val();
			var inputRoadAddress = $(this).find('td:eq(4)').text();
			var inputMapX = $(this).find('td:eq(5)').text();
			var inputMapY = $(this).find('td:eq(6)').text();
			
			var locations = inputAddress.split(' ');
			
			var location1 = locations[0];	
			var location2 = $(this).find('td:eq(0)').text();
				
			$('input:text[name=subLocation]').val(location2);
			$('input:hidden[name="bAddress"]').val(inputAddress);
			$('input:text[name="bLocation"]').val(location1);
			$('input:text[name="bAddress"]').val(inputAddress);
			
			mapping(inputAddress);		
			
		});
		
		$(document).on('click', '#locationForm', function(event){ 

			$('#keyword').focus();
			
		});
		
		$('textarea').on('keydown', function(event) {

	        if($(this).val().length > 500) {
	        
				alert('더 이상 입력할 수 없습니다.');
	        	
	            $(this).val($(this).val().substring(0, 500));

	        }

	    });
		
		
		$('textarea').on('keyup', function(event) {

	        if($(this).val().length > 500) {
	        
				alert('더 이상 입력할 수 없습니다.');
	        	
	            $(this).val($(this).val().substring(0, 500));

	        }

	    });
		
// 		$('input[name=bPw]').on('keydown', function(event) {

// 	        if($(this).val() != '1') {
	        
// 				alert('더 이상 입력할 수 없습니다.');
	        	
// 	            $(this).val($(this).val().substring(0, 500));

// 	        }

// 	    });
		
// 		$(document).on('click', 'input:submit', function(){
			
// 			var regbTime = /^[2][0][0-9]{2}[\-][0-1][0-9][\-][0-3][0-9][\ ][0-2][0-9][\:][0-5][0-9]$/;
// 			var bTime = $('input[name="bTime"]').val();

// 			if(!regbTime.test(bTime)) {
// 				alert('시간을 다시 입력하세요.');
// 				$('input:text[name="bTime"]').focus();
// 				return false;
// 			}
			
// 		})

		$(document).on('click', 'input[type=submit]', function(){
			
			var regPw = /^[0-9]{1,8}$/;
			var writePw = document.body.wForm.bPw.value;
			
			if(!regPw.test(writePw)) {
				alert("비밀번호를 다시 입력하세요");
				document.body.wForm.bPw.focus();
				return false;
			}
			
		})

		
	})
	
	function mapping(inputAddress) {
		
		var map = new naver.maps.Map('map');
		// 여기
      var myaddress = inputAddress;// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
          if (status !== naver.maps.Service.Status.OK) {
              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
          }
          var result = response.result;
          // 검색 결과 갯수: result.total
          // 첫번째 결과 결과 주소: result.items[0].address
          // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
          map.setCenter(myaddr); // 검색된 좌표로 지도 이동
          // 마커 표시
          var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
          });
          // 마커 클릭 이벤트 처리
          naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
          });
          // 마크 클릭시 인포윈도우 오픈
          var infowindow = new naver.maps.InfoWindow({
              content: '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
          });
      });
		
	}

</script>

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/moment.min.js"></script>
<script type="text/javascript" src="js/locales.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />


<!-- </head> -->
<!-- <body> -->
	
	<div id="board_write_form" align="center">

	<form action="boardWrite.do" method="post" name="wForm">
		<div style="height: 30px;">
			<input type="hidden" name="bWriter" value="${sessionScope.loginId }"> <!-- 나중에 삭제 처리 -->
			<input type="hidden" name="bAddress" id="bAddress" required="required"> <!-- 나중에 히든 처리 -->
<!-- 		<input type="text" name="bTime" id="bTime"> -->
		</div>
		
<!-- 		<table id="boardWriteFormTable" border="1" style="width: 800px;border-collapse: collapse;"> -->
		<table id="boardWriteFormTable" border="1" style="width: 800px">
		<tr>
			<th width="200px">
				제목
			</th>
			<td>
				<input type="text" name="bTitle" required="required" maxlength="30">
			</td>
		</tr>	
		<tr id="locationForm">	
			<th>
				지역 <span style="color: red;">*</span> 장소 검색
			</th>
			<td id="locationForm">
					<input type="text" id="keyword" size="14">
					<button id="btnSearch"> 검색 </button>
					지역 : <input type="text" name="bLocation" id="bLocation" readonly="readonly" required="required" size="20">
					식당 : <input type="text" name="subLocation" readonly="readonly" size="15" required="required">
<!-- 				<select name="bLocation"> -->
<!-- 					<option value="서울" selected="selected"> 서울 </option> -->
<!-- 					<option value="인천"> 인천 </option> -->
<!-- 					<option value="경기"> 경기 </option> -->
<!-- 					<option value="강원"> 강원 </option> -->
<!-- 					<option value="충븍"> 충북 </option> -->
<!-- 					<option value="대전"> 대전 </option> -->
<!-- 					<option value="세종"> 세종 </option> -->
<!-- 					<option value="충남"> 충남 </option> -->
<!-- 					<option value="전북"> 전북 </option> -->
<!-- 					<option value="광주"> 광주 </option> -->
<!-- 					<option value="전남"> 전남 </option> -->
<!-- 					<option value="대구"> 대구 </option> -->
<!-- 					<option value="경북"> 경북 </option> -->
<!-- 					<option value="부산"> 부산 </option> -->
<!-- 					<option value="울산"> 울산 </option> -->
<!-- 					<option value="경남"> 경남 </option> -->
<!-- 					<option value="제주"> 제주 </option>				 -->
<!-- 				</select> -->
			</td>
		</tr>	
		<tr id="timeForm">	
			<th>
				시간 <span style="color: red;">*</span> 달력 아이콘
			</th>
			<td>
				<div style="width: 600px; margin: 0; padding: 0;" id="bTimeDiv">
			    	<div class="form-group" style="padding: 0; margin: 0;">
               			<div class='input-group date' id='datetimepicker1' style="padding: 0; margin: 0;">			
                    		<span class="input-group-addon" id="calendarImg">
                        		<span class="glyphicon glyphicon-calendar"></span>
                    		</span>
                    		<input type="text" class="form-control" name="bTime" style="padding: 0; margin: 0;" required="required"/>
                		</div>
           			</div>
        			<script type="text/javascript">
            			$(function () {
                			$('#datetimepicker1').datetimepicker({
                		
                				format : "YYYY-MM-DD HH:mm",
                				showClose:true,
                				showClear:true,
                				minDate: new Date()
                				
                				});
            			});
        			</script>
				</div>				
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div style="width: 100%; padding: 0; margin: 0;">
					<table style="width: 100%; padding: 0; margin: 0;">
						<tr>
							<td id="map" style="width:360px; height:400px;"></td>
							<td>
								<div style="overflow:scroll; height:400px;">
									<table id="mapInfo" border="1">
<!-- 										<tr> -->
<!-- 											<td colspan="3"> -->
<!-- 												장소 검색 : -->
<!-- 												<input type="text" id="keyword"> -->
<!-- 												<button id="btnSearch">검색</button> -->
<!-- 											</td> -->
<!-- 										</tr> -->
										<tr>
											<th width="120px">업체 명</th>
											<th width="200px">업체 상세정보</th>
											<th width="120px">업체 전화번호</th>
<!-- 											<th>업체 주소(item - address)</th> -->
<!-- 											<th>업체 도로명 주소</th> -->
<!-- 											<th>x좌표(item - mapx - int)</th> -->
<!-- 											<th>y좌표(item - mapy - int)</th> -->
										</tr>
									</table>
								</div>
							</td>							
						</tr>
					</table>
				</div>
				
			</td>
		</tr>
		<tr>	
			<th width="200px">
				내용
			</th>
			<td>
				<textarea rows="7" cols="70" name="bContent" required="required"></textarea>
			</td>
		</tr>	
		<tr>	
			<th>
				비밀번호
			</th>
			<td>
				<input type="password" name="bPw" required="required" placeholder="숫자 1~8 자리" maxlength="8"
					onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
				
				<script type="text/javascript">
				
				function onlyNumber(event){
					event = event || window.event;
					var keyID = (event.which) ? event.which : event.keyCode;
					if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
						return;
					else
						alert('숫자만 입력하세요'); return false;
				}
				function removeChar(event) {
					event = event || window.event;
					var keyID = (event.which) ? event.which : event.keyCode;
					if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
						return;
					else
						event.target.value = event.target.value.replace(/[^0-9]/g, "");
				}
				
				
				</script>
				
			</td>		
		</tr>
		
	</table>
	
	<table>
		<tr>	
			<td colspan="2" align="center">
				<input type="submit" value="작성 완료">
				&nbsp;
				<input type="reset" value="다시 작성">
			</td>	
		</tr>
	
	</table>
		
	</form>
	
</div>

<!-- </body> -->
<!-- </html> -->

<%@ include file="../../footer.jsp"%>