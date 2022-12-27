<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    

<%@ include file="../../header.jsp"%>
    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=odiDemcla9iRM6yBGuNa&submodules=geocoder"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		commentList(1);
		
		commentWriteForm();
		
		var inputAddress = '${board.bAddress}';
		mapping(inputAddress);
		
		$(document).on('click', '#btn-cList', function(){
			
			commentList(1);
			
			commentWriteForm();
			
			return false;
			
		})
		
		$(document).on('click', '#btn-cAsk', function(){

			alert('신청자');
			
			commentList(2);
			
			return false;
		})
		
		$(document).on('click', '#btn-cAccept', function(){

			alert('확정자');
			
			commentList(3);
			
			return false;
		})
		
		$(document).on('click', '#bnt-cWrite', function(){

			alert('댓글작성');
			
			if(${empty sessionScope.loginId }) {
				alert('로그인이 필요합니다.');
//				로그인 페이지로
				return false;
			} 
		
// 			alert($('textarea[name="cContent"]').val());	
// 			alert('${sessionScope.loginId }');
// 			alert('${board.bNum }');
			
			var cAsk;
			
// 			if($('#inputAsk:checked').val() == 1) {
// 				cAsk = 1;
// 			} else {
// 				cAsk = 0;
// 			}

			if($('#inputAsk:checked').length > 0) {
				cAsk = 1;
			} else {
				cAsk = 0;
			}

			
			
			var comment = {'cBoardNum' : '${board.bNum }',
				'cWriter' : '${sessionScope.loginId }',
				'cContent' : $('textarea[name="cContent"]').val(),
				'cNum' : -1,
				'cAsk' : cAsk};
		
// 			alert($('textarea[name="cContent"]').val());
		
			$.ajax({
			
				url:'commentWrite.do',
				type:'post',	
				data:comment,
				dataType:'text',
				success:function(result){
					
					commentList(1);
					commentWriteForm();

				},
				error:function(ex){
					alert('ddddddddddd');
				}
			
			})
		
			return false;

			
		})
		
		$(document).on('click', '#c-com', function(event){
			
			$('#commentShowTable tr').show();

			alert('대댓글 ' + $(this).prop("title") + '번 글');
			
			var cSub = $(this).prop("title");
			
			var cWriteNum='';
			
			var comment = {'cBoardNum' : '${board.bNum }',
					'cSub' : cSub
					};
			
			$.ajax({
				
				url:'cCommentWriteForm.do',
				type:'post',	
				data:comment,
				dataType:'text',
				success:function(cWriteNum){
					
					alert('댓글 폼 완료 ');
                	
					cCommentWriteForm(cWriteNum, cSub);
					
					$('textarea[name="tempFormTT"]').focus();

				},
				error:function(ex){
					alert(ex);
				}
			
			})
		
			return false;
			
		})
		
		$(document).on('click', '#bnt-c-cWrite', function(event){

			alert('대댓글작성');
			
			if(${empty sessionScope.loginId }) {
				alert('로그인이 필요합니다.');
//				로그인 페이지로
				return false;
			} 
		

			var cSub = $(this).prop("value");
			
			var comment = {'cBoardNum' : '${board.bNum }',
				'cWriter' : '${sessionScope.loginId }',
				'cContent' : $('textarea[name="tempFormTT"]').val(),
				'cNum' : cSub,
				'cSub' : cSub
				};

			$.ajax({
			
				url:'commentWrite.do',
				type:'post',	
				data:comment,
				dataType:'text',
				success:function(result){
					
					alert('대댓 작성 완료');
                	
					commentList(1);

				},
				error:function(ex){
					alert(ex);
				}
			
			})
		
			return false;

			
		})
		
		$(document).on('click', '#bnt-c-Cancle', function(){

			alert('대댓글 취소');
			
// 			$('#tempComForm').remove();

			commentList(1);
			
			return false;
			
		})
		
		$(document).on('click', '#c-modi', function(event){

			alert('댓글 수정');
			
			$('#commentShowTable tr').show();
			
			var cNum = $(this).prop("title");
			var cContent = $('#cComment' + cNum + ' pre').html();
			var cAsk;
			
			if($('#cComment' + cNum + ' input:checkbox').is(':checked')) {
				cAsk = 1;
			} else {
				cAsk = 0;
			}
			alert(cAsk);
			alert(cNum);
			
			commentModiForm(cNum, cContent, cAsk);
			$('textarea[name="tempFormTT"]').focus();
			
			$('#cComment' + cNum).hide();
			
			return false;
			
		})
		
		$(document).on('click', '#bnt-cModi', function(event){

			alert('댓글 수정');
			
			if(${empty sessionScope.loginId }) {
				alert('로그인이 필요합니다.');
//				로그인 페이지로
				return false;
			} 
			
			var cNum = $(this).prop("value");
			var cAsk;
			var cContent = $('textarea[name="tempFormTT"]').val();
			
			if($('#tempComForm input:checkbox').is(':checked')) {
				cAsk = 1;
			} else {
				cAsk = 0;
			}
			
// 			alert(cNum);
// 			alert(cAsk);
// 			alert(cContent);

			var cNum = $(this).prop("value");
			
			var comment = {'cContent' : cContent,
				'cNum' : cNum,
				'cAsk' : cAsk
				};

			$.ajax({
			
				url:'commentUpdate.do',
				type:'post',	
				data:comment,
				dataType:'text',
				success:function(result){
					
					alert('댓글 수정 완료');
                	
					commentList(1);

				},
				error:function(ex){
					alert(ex);
				}
			
			})
		
			return false;

			
		})
		
		$(document).on('click', '#c-c-modi', function(event){

			alert('대댓글 수정');
			
			$('#commentShowTable tr').show();
			
			var cNum = $(this).prop("title");
			var cContent = $('#cComment' + cNum + ' pre').html();
			
			alert(cNum);
			alert($('#cComment' + cNum + ' pre').html());
			
			cCommentModiForm(cNum, cContent);
			$('textarea[name="tempFormTT"]').focus();
			
			$('#cComment' + cNum).hide();
			
			return false;
			
		})
		
		$(document).on('click', '#c-del', function(event){
			
			var cNum = $(this).prop("title");
			
			alert(cNum);

			msg = "정말로 삭제하시겠습니까?";
            if (confirm(msg)!=0) {
            	alert('삭제');
            	
            	$.ajax({
        			
    				url:'commentDelete.do',
    				type:'post',	
    				data:{'cNum' : cNum},
    				dataType:'text',
    				success:function(result){
    					
    					alert('삭제 완료');
                    	
    					commentList(1);

    				},
    				error:function(ex){
    					alert(ex);
    				}
    			
    			})
    			
            } else {
            	alert('삭제취소');
			}
            
            return false;
			
		})
		
		

	})
	
	function commentWriteForm() {
		$('#commentWriteTable').empty();

		$('#commentWriteTable').append('<tr>');
		$('#commentWriteTable').append('<td width="100px" height="100px">신청여부 <input type="checkbox" id="inputAsk" value="1"></td>');
		$('#commentWriteTable').append('<td><textarea rows="3" cols="75" name="cContent" id="cContent"></textarea></td>');
		$('#commentWriteTable').append('<td width="100px"><button id="bnt-cWrite">작성</button></td>');
		$('#commentWriteTable').append('</tr>');
	}
	
	
	function cCommentWriteForm(cWriteNum, cNum) {

		if($('#tempComForm').length > 0) {
			$('#tempComForm').remove();
		}
		
		var com = "";
		
		com += '<tr id="tempComForm"><td colspan="3">';
		com += '<table>';
		com += '<tr>';
		com += '<td width="100px" height="100px"></td>';
		com += '<td width="100px" height="100px"><img src="img/re.gif" width="50px" height="50px"></td>';
		com += '<td><textarea rows="3" cols="65" name="tempFormTT" id="tempFormTT"></textarea></td>';
		com += '<td width="100px"><button id="bnt-c-cWrite" value="' + cNum + '">작성</button> <button id="bnt-c-Cancle" value="' + cNum + '">취소</button></td>';
		com += '</tr>';
		com += '</table>';
		com += '</td></tr>';
		
		$('#cComment' + cWriteNum).after(com);
		
	}
	
	function commentModiForm(cNum, cContent, cAsk) {

		if($('#tempComForm').length > 0) {
			$('#tempComForm').remove();
		}
		
		var com = "";
		
		com += '<tr id="tempComForm"><td colspan="3">';
		com += '<table>';
		com += '<tr>';
		
		if(cAsk == 1) {
			com += '<td width="100px" height="100px">신청여부 <input type="checkbox" checked="checked" id="moinputAsk"></td>';
		} else {
			com += '<td width="100px" height="100px">신청여부 <input type="checkbox" id="moinputAsk"></td>';
		}
		com += '<td><textarea rows="3" cols="75" name="tempFormTT" id="tempFormTT">' + cContent + '</textarea></td>';
		com += '<td width="100px"><button id="bnt-cModi" value="' + cNum + '">수정</button> <button id="bnt-c-Cancle">취소</button></td>';
		com += '</tr>';
		com += '</table>';
		com += '</td></tr>';
		
		$('#cComment' + cNum).after(com);
	}
	
	function cCommentModiForm(cNum, cContent) {

		if($('#tempComForm').length > 0) {
			$('#tempComForm').remove();
		}
		
		var com = "";
		
		com += '<tr id="tempComForm"><td colspan="3">';
		com += '<table>';
		com += '<tr>';
		com += '<td width="100px" height="100px"></td>';
		com += '<td width="100px" height="100px"><img src="img/re.gif" width="50px" height="50px"></td>';
		com += '<td><textarea rows="3" cols="65" name="tempFormTT" id="tempFormTT">' + cContent + '</textarea></td>';
		com += '<td width="100px"><button id="bnt-cModi" value="' + cNum + '">수정</button> <button id="bnt-c-Cancle">취소</button></td>';
		com += '</tr>';
		com += '</table>';
		com += '</td></tr>';
		
		$('#cComment' + cNum).after(com);
		
	}
	
	
	function commentList(check) {
		
		$.ajax({
			
			url:'commentList.do',
			type:'post',
			data:{'cBoardNum' : '${board.bNum }'},
			dataType:'text',
			success:function(result){
// 				alert('!!!!!');	
				
				var Ca = /\+/g;
				result = decodeURIComponent(result.replace(Ca, " "));
				
// 				alert(result);
				result = $.parseJSON(result);
				
				$('#commentShowTable').empty();
				
				$.each(result, function(i, r) {
					
					if(check == 1) {
						$('#commentShowTable').append(dataShow(r));
					} else if(check == 2) {
						
						if(r.cAsk == 1) {
							$('#commentShowTable').append(dataShow(r));
						}
						
					}
                
                });
				
			},
			error:function(ex){
				alert('eeeeeeeeeeee');
			}
			
		});
		
	}	
	
	function dataShow(r){
				
		var com='';
		
		com += '<tr id="cComment' + r.cNum + '" title="' + r.cNum + '">';
		
		if(r.cNum == r.cSub) {
			if(r.cAsk == 1 && '${board.bWriter}' == '${sessionScope.loginId}' && r.cAccept == 0) {
				com += '<td width="100px" height="100px">신청여부  <input type="checkbox" disabled="disabled" checked="checked"> <br> <button id="bnt-c-cAccept">수락</button> </td>';
			} else if(r.cAsk == 1 && r.cAccept == 1) {
				com += '<td width="100px" height="100px">신청여부  <input type="checkbox" disabled="disabled" checked="checked"> <br> 수락 완료 </td>';
			} else if(r.cAsk == 1) {
				com += '<td width="100px" height="100px">신청여부  <input type="checkbox" disabled="disabled" checked="checked">';
			} else {
				com += '<td width="100px" height="100px">신청여부  <input type="checkbox" disabled="disabled"> </td>';
			}
			if(r.cWriter == '${sessionScope.loginId}') {
				com += '<td colspan="2" width="700px"> <b>' + r.cWriter +  '</b> &nbsp;' + r.cWriteDate + '&nbsp; <label id="c-com" title="' + r.cNum + '">답글</label> <label id="c-modi" title="' + r.cNum + '">수정</label> <label id="c-del" title="' + r.cNum + '">삭제</label> <br>';
			} else {
				com += '<td colspan="2" width="700px"> <b>' + r.cWriter +  '</b> &nbsp;' + r.cWriteDate + '&nbsp; <label id="c-com" title="' + r.cNum + '">답글</label> <br>';
			}

			com += '<pre>'+r.cContent+'</pre>';
			com += '</td>';
			com += '</tr>';
			
		} else {
			com += '<td width="100px" height="100px"></td>';
			com += '<td width="100px" height="100px"> <img src="img/re.gif" width="50px" height="50px"> </td>';
			if(r.cWriter == '${sessionScope.loginId}') {
				com += '<td width="700px"> <b>' + r.cWriter +  '</b> &nbsp;' + r.cWriteDate + '&nbsp; <label id="c-c-modi" title="' + r.cNum + '">수정</label> <label id="c-del" title="' + r.cNum + '">삭제</label> <br>';
			} else {
				com += '<td width="700px"> <b>' + r.cWriter +  '</b> &nbsp;' + r.cWriteDate + '&nbsp; <br>';
			}
			com += '<pre>' + r.cContent + '</pre></td>';
			com += '</tr>';
		}
		
        
        return com;

	}
	
	
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

</head>
<body>

	<div align="center">
		
	<form action="boardUpdateForm.do" method="post">
		<input type="text" name="bNum" value="${board.bNum }">
		<input type="text" name="bAddress" value="${board.bAddress }">
		<table border="1" style="width: 800px">
			<tr>
				<td colspan="2">
					<input type="button" value="전체목록" 
						onclick="">
					&nbsp;
					
					<c:if test="${sessionScope.loginId == board.bWriter }">
					
						<input type="submit" value="글 수정">
						&nbsp;
						<input type="button" value="글 삭제"
							onclick="">
						&nbsp;
					</c:if>
				
				</td>
			</tr>
			<tr>
				<th width="150px">
					제목
				</th>
				<td>
					${board.bTitle }
				</td>
			</tr>
			<tr>
				<th>
					작성자
				</th>
				<td>
					${board.bWriter }
				</td>
			</tr>		
			<tr>	
				<th>
					지역
				</th>
				<td>
					${board.bLocation }
				</td>
			</tr>		
			<tr>	
				<th>
					시간
				</th>
				<td>
					${board.bTime }
				</td>
			</tr>	
			<tr>
				<td id="map" style="width:600px;height:400px;" colspan="2">
				</td>
			</tr>	
			<tr>	
				<th>
					내용
				</th>
				<td>
					<pre>${board.bContent }</pre>
				</td>
			</tr>	
			<tr>
				<td colspan="3">
					<table border="1" style="width: 100%;">
						<tr>
							<td id="btn-cList" width="266px"> 신청/댓글 </td>
							<td id="btn-cAsk" width="266px"> 신청목록 </td>
							<td id="btn-cAccept"> 확정자 </td>
						<tr>
					</table>
				</td>
			</tr>	
		</table>
	
	</form>
	
	
	<div id="commentShowDiv">
		<table border="1" id="commentShowTable" style="width: 800px">
		</table>
	</div>
	
	<div id="commentWriteDiv">
		<table id="commentWriteTable" style="width: 800px">
		</table>
	</div>

</div>
	
</body>
</html>