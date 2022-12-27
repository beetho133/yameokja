<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="../../header.jsp"%>

<style type="text/css">

#commentShowDiv, #commentWriteDiv {
	padding: 0;
}

#board_content table{
	width: 800px;
/* 	table-layout:fixed; */
	padding: 0;
	margin: 0;
}

#boardContentTable{
	
	border: 1px solid #f972b6;
	border-collapse: collapse;

}

#boardContentTable tr:nth-child(1) th, #boardContentTable tr:nth-child(1) td{

	width: 200px;

}

#commentContoller {

	text-align: center;
	margin: 0;
	border: 1px solid #f972b6;
	border-collapse: collapse;

}

#commentContoller td:hover{
	
	color: #000;
    font-weight: bold;
    cursor: pointer;

}



#commentShowTable{
	
	background-color: #ffe6ff;

}

#commentShowTable span{
	
	font-size: small;

}

#commentShowTable span:hover{
	
	color: white;
	cursor: pointer;
	font-size: small;

}


#commentShowTable > tr > td{

	border-bottom:  1px solid #e54a98;
		
}

#commentShowTable > tr > td:nth-child(1){
	
	text-align: center;

}

/* #tempComForm table{ */
/*  	border: 1px solid #e54a98; */
/*   	border-top: 1px solid #e54a98; */
/*   	border-bottom: 1px solid #e54a98; */
/*  	border-collapse: collapse; */

/* } */

#tempComForm tr, #tempComForm td{
	
 	margin: 0;
 	padding: 0;

 } 
 
 tbody{
 	margin: 0;
	padding: 0;
 } 
 
#acceptFormTrId > th{
	
	border-bottom:  1px solid #e54a98;

}


input[type=checkbox]{

	height: auto;
	border: 0;
	
}

#commentWriteTable{

	border: 1px solid #f972b6;
	text-align: center;

}


</style>
    
<!-- <!DOCTYPE> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <title>Insert title here</title> -->

<script type="text/javascript" src="js/moment.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=odiDemcla9iRM6yBGuNa&submodules=geocoder"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		commentList(1);
		$('#btn-cList').css('backgroundColor', '#ffe6ff');
		
		commentWriteForm();
		
		var inputAddress = '${board.bAddress}';
		mapping(inputAddress);
		
		$(document).on('click', '#btn-cList', function(event){
			
			commentList(1);
			$(this).css('backgroundColor', '#ffe6ff');
			$('#btn-cAsk').css('backgroundColor', '');
			$('#btn-cAccept').css('backgroundColor', '');
			$('#btn-cAcceptPerson').css('backgroundColor', '');
			
			commentWriteForm();
			
			return false;
			
		})
		
		$(document).on('click', '#btn-cAsk', function(event){

// 			alert('신청목록');
			
			commentList(2);
			$('#btn-cList').css('backgroundColor', '');
			$(this).css('backgroundColor', '#ffe6ff');
			$('#btn-cAccept').css('backgroundColor', '');
			$('#btn-cAcceptPerson').css('backgroundColor', '');
			
			$('#commentWriteTable').empty();
			
			return false;
		})
		
		$(document).on('click', '#btn-cAccept', function(event){

// 			alert('수락목록');
			
			commentList(3);
			$('#btn-cList').css('backgroundColor', '');
			$('#btn-cAsk').css('backgroundColor', '');
			$(this).css('backgroundColor', '#ffe6ff');
			$('#btn-cAcceptPerson').css('backgroundColor', '');
			
			
			$('#commentWriteTable').empty();
			
			return false;
		})
		
		$(document).on('click', '#btn-cAcceptPerson', function(event){

// 			alert('확정자');
			
			$('#btn-cList').css('backgroundColor', '');
			$('#btn-cAsk').css('backgroundColor', '');
			$('#btn-cAccept').css('backgroundColor', '');
			$(this).css('backgroundColor', '#ffe6ff');
			
			$('#commentWriteTable').empty();
			
			$.ajax({
				
				url:'acceptList.do',
				type:'post',
				data:{'cBoardNum' : '${board.bNum }'},
				dataType:'text',
				success:function(result){
//	 				alert('!!!!!');	
					
					var Ca = /\+/g;
					result = decodeURIComponent(result.replace(Ca, " "));
					
//	 				alert(result);
					result = $.parseJSON(result);
					
					$('#commentShowTable').empty();
					
					var com = '';
					
					com += '<tr id="acceptFormTrId">';		
					com += '<th width="120px"> 확정자 정보 </th>';
					com += '<th> 아이디 </th>';
// 					com += '<th width="100px"> 이름 </th>';
					com += '<th width="80px"> 성별 </th>';
					com += '<th width="150px"> 생년 </th>';
					com += '<th width="200px"> 전화번호 </th>';
// 					com += '<th> 이메일 </th>';
					com += '</tr>';
					
					$('#commentShowTable').append(com);
					
					var check = -1;
					
					$.each(result, function(i, r) {
						
						if('${sessionScope.loginId}' == '${board.bWriter}' 
								|| '${sessionScope.loginId}' == r.id) {
							
							check = 1;
							
						}
						
						$('#commentShowTable').append(acceptListShow(r));
	                
	                });
					
					if(check == -1) {
						$('#commentShowTable').empty();
						
						var comSub = '';
						
						comSub += '<tr>';		
						comSub += '<th> 게시글 작성자 및 확정자만 정보를 확인할 수 있습니다. </th>';
						comSub += '</tr>';
							
						$('#commentShowTable').append(comSub);
						
					}
					
				},
				error:function(ex){
					alert('eeeeeeeeeeee');
				}
				
			});
			
			return false;
		})
		
		$(document).on('click', '#btn-cWrite', function(){

// 			alert('댓글작성');
			
			if('${sessionScope.loginId }' == null) {
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
				
				if('${sessionScope.loginId}' == '${board.bWriter}') {
					
					alert('본인이 작성한 글에 신청할 수 없습니다.');
					return false;
				
				} else {
					cAsk = 1;
				}
				
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
					
				url:'checkAsk.do',
				type:'post',	
				data:comment,
				dataType:'text',
				success:function(checkAsk){
					
					if(checkAsk == 'false' && cAsk == 1) {
						alert('이미 신청하셨습니다.');
						return false;
					} else {
						
						$.ajax({
							
							url:'commentWrite.do',
							type:'post',	
							data:comment,
							dataType:'text',
							success:function(result){
								
								commentList(1);
								
								$('#btn-cList').css('backgroundColor', '#ffe6ff');
								$('#btn-cAsk').css('backgroundColor', '');
								$('#btn-cAccept').css('backgroundColor', '');
								$('#btn-cAcceptPerson').css('backgroundColor', '');
								
								commentWriteForm();

							},
							error:function(ex){
								alert('ddddddddddd');
							}
						
						})

					}
						
// 					alert(cAsk);

				},
				error:function(ex){
					alert('ddddddddddd');
				}
				
			})
			

			return false;

			
		})
		
// 		$(document).on('click', '#c-com', function(event){
			
// 			$('#commentShowTable tr').show();

// 			alert('대댓글 ' + $(this).prop("title") + '번 글');
			
// 			var cSub = $(this).prop("title");
			
// 			var cWriteNum='';
			
// 			var comment = {'cBoardNum' : '${board.bNum }',
// 					'cSub' : cSub
// 					};
			
// 			$.ajax({
				
// 				url:'cCommentWriteForm.do',
// 				type:'post',	
// 				data:comment,
// 				dataType:'text',
// 				success:function(cWriteNum){
					
// 					alert('댓글 폼 완료 ');
                	
// 					cCommentWriteForm(cWriteNum, cSub);
					
// 					$('textarea[name="tempFormTT"]').focus();

// 				},
// 				error:function(ex){
// 					alert(ex);
// 				}
			
// 			})
		
// 			return false;
			
// 		})
		
		$(document).on('click', '.c-com', function(event){
			
			$('#commentShowTable tr').show();
			
			var cSub = $(this).prop("id").substring(5, $(this).prop("id").length)
			
// 			alert('대댓글 ' + cSub + '번 글');
			
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
					
// 					alert('댓글 폼 완료 '+$('#commentShowTable').css('width'));
                	
					cCommentWriteForm(cWriteNum, cSub);
					
					$('textarea[name="tempFormTT"]').focus();
// 					alert('댓글 폼 완료 2'+$('#commentShowTable').css('width'));
				},
				error:function(ex){
					alert(ex);
				}
			
			})
		
			return false;
			
		})
		
		$(document).on('click', '#btn-c-cWrite', function(event){

// 			alert('대댓글작성');
			
			if('${sessionScope.loginId }' == null) {
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
					
// 					alert('대댓 작성 완료');
                	
					commentList(1);
					
					$('#btn-cList').css('backgroundColor', '#ffe6ff');
					$('#btn-cAsk').css('backgroundColor', '');
					$('#btn-cAccept').css('backgroundColor', '');
					$('#btn-cAcceptPerson').css('backgroundColor', '');

				},
				error:function(ex){
					alert(ex);
				}
			
			})
		
			return false;

			
		})
		
		$(document).on('click', '#btn-c-Cancle', function(){

// 			alert('대댓글 취소');
			
// 			$('#tempComForm').remove();

			commentList(1);
			
			$('#btn-cList').css('backgroundColor', '#ffe6ff');
			$('#btn-cAsk').css('backgroundColor', '');
			$('#btn-cAccept').css('backgroundColor', '');
			$('#btn-cAcceptPerson').css('backgroundColor', '');
			
			return false;
			
		})
		
// 		$(document).on('click', '#c-modi', function(event){

// 			alert('댓글 수정폼');
			
// 			$('#commentShowTable tr').show();
			
// 			var cNum = $(this).prop("title");
// 			var cContent = $('#cComment' + cNum + ' pre').html();
// 			var cAsk;
			
// 			if($('#cComment' + cNum + ' input:checkbox').is(':checked')) {
// 				cAsk = 1;
// 			} else {
// 				cAsk = 0;
// 			}
// 			alert(cAsk);
// 			alert(cNum);
			
// 			commentModiForm(cNum, cContent, cAsk);
// 			$('textarea[name="tempFormTT"]').focus();
			
// 			$('#cComment' + cNum).hide();
			
// 			return false;
			
// 		})
		
		$(document).on('click', '.c-modi', function(event){

// 			alert('댓글 수정폼');
			
			$('#commentShowTable tr').show();
			
			var cNum = $(this).prop("id").substring(6, $(this).prop("id").length);
			
			var cContent = $('#cComment' + cNum + ' pre').html();
			var cAsk;
			
			if($('#cComment' + cNum + ' input:checkbox').is(':checked')) {
				cAsk = 1;
			} else {
				cAsk = 0;
			}
// 			alert(cAsk);
// 			alert(cNum);
			
			commentModiForm(cNum, cContent, cAsk);
			$('textarea[name="tempFormTT"]').focus();
			
			$('#cComment' + cNum).hide();
			
			return false;
			
		})
		
		$(document).on('click', '#btn-cModi', function(event){

// 			alert('댓글 수정');
			
			if('${sessionScope.loginId }' == null) {
				alert('로그인이 필요합니다.');
//				로그인 페이지로
				return false;
			} 
			
			var cNum = $(this).prop("value");
			var cAsk;
			var cContent = $('textarea[name="tempFormTT"]').val();
			
			if($('#tempComForm input:checkbox').is(':checked')) {
				
				if('${sessionScope.loginId}' == '${board.bWriter}') {
					
					alert('본인이 작성한 글에 신청할 수 없습니다.');
					return false;
				
				} else {
					cAsk = 1;
				}
				
			} else {
				cAsk = 0;
			}
			
// 			alert(cNum);
// 			alert(cAsk);
// 			alert(cContent);

			var cNum = $(this).prop("value");
			
			var comment = {'cBoardNum' : '${board.bNum }',
					'cWriter' : '${sessionScope.loginId }',
					'cContent' : cContent,
					'cNum' : cNum,
					'cAsk' : cAsk};
			
			$.ajax({
				
				url:'checkAsk.do',
				type:'post',	
				data:comment,
				dataType:'text',
				success:function(checkAsk){
					
					if(checkAsk == 'false' && cAsk == 1) {
						alert('이미 신청하셨습니다.');
						return false;
					} else {
						
						$.ajax({
							
							url:'commentUpdate.do',
							type:'post',	
							data:comment,
							dataType:'text',
							success:function(result){
								
// 								alert('댓글 수정 완료');
			                	
								commentList(1);
								
								$('#btn-cList').css('backgroundColor', '#ffe6ff');
								$('#btn-cAsk').css('backgroundColor', '');
								$('#btn-cAccept').css('backgroundColor', '');
								$('#btn-cAcceptPerson').css('backgroundColor', '');

							},
							error:function(ex){
								alert(ex);
							}
						
						})

					}

				},
				error:function(ex){
					alert('ddddddddddd');
				}
				
			})
		
			return false;

		});
		
// 		$(document).on('click', '#c-c-modi', function(event){

// 			alert('대댓글 수정');
			
// 			$('#commentShowTable tr').show();
			
// 			var cNum = $(this).prop("title");
// 			var cContent = $('#cComment' + cNum + ' pre').html();
			
// 			alert(cNum);
// 			alert($('#cComment' + cNum + ' pre').html());
			
// 			cCommentModiForm(cNum, cContent);
// 			$('textarea[name="tempFormTT"]').focus();
			
// 			$('#cComment' + cNum).hide();
			
// 			return false;
			
// 		})
		
		$(document).on('click', '.c-c-modi', function(event){

// 			alert('대댓글 수정');
			
			$('#commentShowTable tr').show();
			
			var cNum = $(this).prop("id").substring(8, $(this).prop("id").length);
			var cContent = $('#cComment' + cNum + ' pre').html();
			
// 			alert(cNum);
// 			alert($('#cComment' + cNum + ' pre').html());
			
			cCommentModiForm(cNum, cContent);
			$('textarea[name="tempFormTT"]').focus();
			
			$('#cComment' + cNum).hide();
			
			return false;
			
		})
		
// 		$(document).on('click', '#c-del', function(event){
			
// 			var cNum = $(this).prop("title");
			
// 			alert(cNum);

// 			msg = "정말로 삭제하시겠습니까?";
//             if (confirm(msg)!=0) {
//             	alert('삭제');
            	
//             	$.ajax({
        			
//     				url:'commentDelete.do',
//     				type:'post',	
//     				data:{'cNum' : cNum},
//     				dataType:'text',
//     				success:function(result){
    					
//     					alert('삭제 완료');
                    	
//     					commentList(1);
    					
//     					$('#btn-cList').css('backgroundColor', 'pink');
//     					$('#btn-cAsk').css('backgroundColor', 'white');
//     					$('#btn-cAccept').css('backgroundColor', 'white');
//     					$('#btn-cAcceptPerson').css('backgroundColor', 'white');

//     				},
//     				error:function(ex){
//     					alert(ex);
//     				}
    			
//     			})
    			
//             } else {
//             	alert('삭제취소');
// 			}
            
//             return false;
			
// 		})
		
		$(document).on('click', '.c-del', function(event){
			
			var cNum = $(this).prop("id").substring(5, $(this).prop("id").length);
			
// 			alert(cNum);

			msg = "정말로 삭제하시겠습니까?";
            if (confirm(msg)!=0) {
            	alert('삭제');
            	
            	$.ajax({
        			
    				url:'commentDelete.do',
    				type:'post',	
    				data:{'cNum' : cNum},
    				dataType:'text',
    				success:function(result){
    					
//     					alert('삭제 완료');
                    	
    					commentList(1);
    					
    					$('#btn-cList').css('backgroundColor', '#ffe6ff');
    					$('#btn-cAsk').css('backgroundColor', '');
    					$('#btn-cAccept').css('backgroundColor', '');
    					$('#btn-cAcceptPerson').css('backgroundColor', '');

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
		
		$(document).on('click', '#accept', function(event){
			
			var cNum = $(this).prop("value");
			
// 			alert(cNum);
			
			var tempAccept = $(this).text();
			
// 			alert(tempAccept);
			
			var cAccept;
			
			if(tempAccept == '수락') {
				cAccept = 1;
			} else {
				cAccept = 0;
			}
			
// 			alert(cAccept);
			
			var comment = {'cNum' : cNum, 'cAccept' : cAccept}
			
			$.ajax({
    			
				url:'accept.do',
				type:'post',	
				data:comment,
				dataType:'text',
				success:function(result){
					
// 					alert('수락 완료 or 취소');
                	
					commentList(3);
					
					$('#btn-cList').css('backgroundColor', '');
					$('#btn-cAsk').css('backgroundColor', '');
					$('#btn-cAccept').css('backgroundColor', '#ffe6ff');
					$('#btn-cAcceptPerson').css('backgroundColor', '');

				},
				error:function(ex){
					alert(ex);
				}
			
			})
			
			
			return false;
			
		})
		
		$(document).on('click', '#btn-matchCheck', function(){

// 			alert('모집');
			
			var bMatchCheck;
			
			if('${board.bMatchCheck}' == 0) {
				bMatchCheck = 1;
			} else {
				bMatchCheck = 0;
			}
			
			var board = {'bNum' : '${board.bNum}', 'bMatchCheck' : bMatchCheck}
			
			$.ajax({
    			
				url:'matchCheck.do',
				type:'post',	
				data:board,
				dataType:'text',
				success:function(result){
					
// 					alert('바뀜');
					
// 					alert($('#matchCheck').text());
                	
					if($('#btn-matchCheck').val() == '모집 완료') {
						$('#matchCheck').text('모집완료');
						$('#btn-matchCheck').val('다시 모집');
					} else {
						$('#matchCheck').text('모집중');
						$('#btn-matchCheck').val('모집 완료');
					}

				},
				error:function(ex){
					alert(ex);
				}
			
			})
			
			
			return false;
		})
		
		
		$('#cContent').on('keydown', function(event) {

	        if($(this).val().length > 100) {
	        
				alert('더 이상 입력할 수 없습니다.');
	        	
	            $(this).val($(this).val().substring(0, 100));

	        }

	    });
	    
		$('#cContent').on('keyup', function(event) {

	        if($(this).val().length > 100) {
	        
				alert('더 이상 입력할 수 없습니다.');
	        	
	            $(this).val($(this).val().substring(0, 100));

	        }

	    });
	    
		$('#tempFormTT').on('keydown', function(event) {

	        if($(this).val().length > 100) {
	        
				alert('더 이상 입력할 수 없습니다.');
	        	
	            $(this).val($(this).val().substring(0, 100));

	        }

	    });
	    
		$('#tempFormTT').on('keyup', function(event) {

	        if($(this).val().length > 100) {
	        
				alert('더 이상 입력할 수 없습니다.');
	        	
	            $(this).val($(this).val().substring(0, 100));

	        }

	    });
	    
	    

	});
	
	
	
	function commentWriteForm() {
		$('#commentWriteTable').empty();
		
		var com = "";
		
		com += '<tr>';
		com += '<td width="200px" height="100px">신청여부 <input type="checkbox" id="inputAsk" value="1"></td>';
		com += '<td><textarea rows="3" cols="70" name="cContent" id="cContent"></textarea></td>';
		com += '<td width="100px"><button id="btn-cWrite">작성</button></td>';
		com += '</tr>';

		$('#commentWriteTable').append(com);
	}
	
	
	function cCommentWriteForm(cWriteNum, cNum) {

		if($('#tempComForm').length > 0) {
			$('#tempComForm').remove();
		}
		
		var com = "";
		
		com += '<tr id="tempComForm" height="100px" style="padding:0;margin:0;"><td colspan="3">';
// 		com += '<table id="yyj" style="background-color:red; border:0px; width:800;">';
		com += '<table style="width:800px;">';
		com += '<tr>';
		com += '<td width="200px"> </td> ';
		com += '<td width="100px"> <img src="img/re.gif" width="50px" height="50px"> </td>';
		com += '<td><textarea rows="3" name="tempFormTT" id="tempFormTT"></textarea></td>';
		com += '<td width="100px"><button id="btn-c-cWrite" value="' + cNum + '">작성</button> <button id="btn-c-Cancle" value="' + cNum + '">취소</button></td>';
		com += '</tr>';
		com += '</table>';
		com += '</td></tr>';
		
		$('#cComment' + cWriteNum).after(com);
		
		$('#commentShowTable').css('border-spacing','0');
// 		console.log('yyj:'+$('#tempComForm').css('width'));
// 		console.log('yyj2:'+$('#yyj').css('width'));
	}
	
	function commentModiForm(cNum, cContent, cAsk) {

		if($('#tempComForm').length > 0) {
			$('#tempComForm').remove();
		}
		
		var com = "";
		
		com += '<tr id="tempComForm" height="100px" style="padding:0;margin:0;"><td colspan="3">';
		com += '<table style="width:800px;">';
		com += '<tr>';
		
		if(cAsk == 1) {
			com += '<td width="200px">신청여부 <input type="checkbox" checked="checked" id="moinputAsk"></td>';
		} else {
			com += '<td width="200px">신청여부 <input type="checkbox" id="moinputAsk"></td>';
		}
		com += '<td><textarea rows="3" name="tempFormTT" id="tempFormTT">' + cContent + '</textarea></td>';
		com += '<td width="100px"><button id="btn-cModi" value="' + cNum + '">수정</button> <button id="btn-c-Cancle">취소</button></td>';
		com += '</tr>';
		com += '</table>';
		com += '</td></tr>';
		
		$('#cComment' + cNum).after(com);
		
		$('#commentShowTable').css('border-spacing','0');
	}
	
	function cCommentModiForm(cNum, cContent) {

		if($('#tempComForm').length > 0) {
			$('#tempComForm').remove();
		}
		
		var com = "";
		
		com += '<tr id="tempComForm" height="100px" style="padding:0;margin:0;"><td colspan="3">';
		com += '<table style="width:800px;padding:0;margin:0;">';
		com += '<tr>';
		com += '<td width="200px"> </td> ';
		com += '<td width="100px"> <img src="img/re.gif" width="50px" height="50px"> </td>';
		com += '<td><textarea rows="3" name="tempFormTT" id="tempFormTT">' + cContent + '</textarea></td>';
		com += '<td width="100px"><button id="btn-cModi" value="' + cNum + '">수정</button> <button id="btn-c-Cancle">취소</button></td>';
		com += '</tr>';
		com += '</table>';
		com += '</td></tr>';
		
		$('#cComment' + cNum).after(com);
		
		$('#commentShowTable').css('border-spacing','0');
		
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
						$('#commentShowTable').append(comListShow(r));
					} else if(check == 2) {
						
						if(r.cAsk == 1) {
							$('#commentShowTable').append(comListShow(r));
						}
						
					} else {
						
						if(r.cAccept == 1) {
							$('#commentShowTable').append(comListShow(r));
						}
						
					}

                
                });
				
			},
			error:function(ex){
				alert('eeeeeeeeeeee');
			}
			
		});
		
	}	
	
	function comListShow(r){
		
// 		var cWriteDate = moment(r.cWriteDate).format('MM-DD HH:mm');
		

		var tempDate = new Date(r.cWriteDate);
			
		var cWriteDate = (tempDate.getMonth() + 1) + '-' + tempDate.getDate()
			+ ' ' + tempDate.getHours() + ':' + tempDate.getMinutes();

			
		var com='';
		
// 		com += '<tr id="cComment' + r.cNum + '" title="' + r.cNum + '">';
		com += '<tr id="cComment' + r.cNum + '">';
		
		if(r.cNum == r.cSub) {
			if(r.cAsk == 1 && '${board.bWriter}' == '${sessionScope.loginId}' && r.cAccept == 0) {
				com += '<td width="200px" height="100px">신청여부 <input type="checkbox" disabled="disabled" checked="checked"><br><button id="accept" value="' + r.cNum + '">수락</button></td>';
			} else if(r.cAsk == 1 && '${board.bWriter}' == '${sessionScope.loginId}' && r.cAccept == 1) {
				com += '<td width="200px" height="100px">신청여부<input type="checkbox" disabled="disabled" checked="checked"><br> <button id="accept" value="' + r.cNum + '">수락 취소</button></td>';
			} else if(r.cAsk == 1 && r.cAccept == 1) {
				com += '<td width="200px" height="100px">신청여부<input type="checkbox" disabled="disabled" checked="checked"><br>수락 완료</td>';
			} else if(r.cAsk == 1) {
				com += '<td width="200px" height="100px">신청여부<input type="checkbox" disabled="disabled" checked="checked"></td>';
			} else {
				com += '<td width="200px" height="100px">신청여부<input type="checkbox" disabled="disabled"></td>';
			}
			
			
			if(r.cWriter == '${sessionScope.loginId}') {
// 				com += '<td colspan="2"> <b>' + r.cWriter +  '</b> &nbsp;' + cWriteDate + '&nbsp; <label id="c-com" title="' + r.cNum + '">답글</label> <label id="c-modi" title="' + r.cNum + '">수정</label> <label id="c-del" title="' + r.cNum + '">삭제</label> <br>';
				com += '<td height="100px" colspan="2"> <b>' + r.cWriter +  '</b>&nbsp;' + cWriteDate + '&nbsp; <span class="c-com" id="c-com' + r.cNum + '">답글</span> <span class="c-modi" id="c-modi' + r.cNum + '">수정</span> <span class="c-del" id="c-del' + r.cNum + '">삭제</span> <br>';
			} else {
				com += '<td height="100px" colspan="2"> <b>' + r.cWriter +  '</b>&nbsp;' + cWriteDate + '&nbsp; <span class="c-com" id="c-com' + r.cNum + '">답글</span> <br>';
			}
			
// 			if(r.cWriter == '${sessionScope.loginId}') {
// 				com += '<td colspan="2"> <b>' + r.cWriter +  '</b> &nbsp;' + r.cWriteDate + '&nbsp; <label id="c-com" title="' + r.cNum + '">답글</label> <label id="c-modi" title="' + r.cNum + '">수정</label> <label id="c-del" title="' + r.cNum + '">삭제</label> <br>';
// 			} else {
// 				com += '<td colspan="2"> <b>' + r.cWriter +  '</b> &nbsp;' + r.cWriteDate + '&nbsp; <label id="c-com" title="' + r.cNum + '">답글</label> <br>';
// 			}

			com += '<pre width="100%" style="white-space: pre-wrap; word-wrap: break-word;">'+r.cContent+'</pre>';
			com += '</td>';
			com += '</tr>';
			
		} else {
			com += '<td width="200px" height="100px"> </td> ';
			com += '<td width="100px" height="100px"> <img src="img/re.gif" width="50px" height="50px"> </td>';
			
			if(r.cWriter == '${sessionScope.loginId}') {
// 				com += '<td width="500px" height="100px"> <b>' + r.cWriter +  '</b> &nbsp;' + r.cWriteDate + '&nbsp; <span class="c-c-modi" id="c-c-modi' + r.cNum + '">수정</span> <span class="c-del" id="c-del' + r.cNum + '">삭제</span> <br>';
				com += '<td width="500px" height="100px"> <b>' + r.cWriter +  '</b>&nbsp;' + cWriteDate + '&nbsp; <span class="c-c-modi" id="c-c-modi' + r.cNum + '">수정</span> <span class="c-del" id="c-del' + r.cNum + '">삭제</span> <br>';
			} else {
				com += '<td width="500px"> <b>' + r.cWriter +  '</b>&nbsp;' + cWriteDate + '&nbsp; <br>';
			}
			
			
			com += '<pre width="100%" style="white-space: pre-wrap; word-wrap: break-word;">' + r.cContent + '</pre> </td>';
			com += '</tr>';
		}
		
        
        return com;

	}
	
	
	function acceptListShow(r){
		
		var com='';
		
// 		com += '<tr>';		
// 		com += '<th> 확정자 정보 </th>';
// 		com += '<th> 아이디 </th>';
// 		com += '<th> 이름 </th>';
// 		com += '<th> 성별 </th>';
// 		com += '<th> 생년 </th>';
// 		com += '<th> 전화번호 </th>';
// 		com += '<th> 이메일 </th>';
// 		com += '</tr>';
		com += '<tr class="acceptFormTrClass" align="center">'
		if(r.id == '${board.bWriter}') {
			com += '<td> 주선자 </td>';
		} else {
			com += '<td> 참가자 </td>';
		}
		com += '<td>' + r.id + '</td>'
// 		com += '<td>' + r.name + '</td>'
		if(r.sex == 0) {
			com += '<td>여자</td>'
		} else {
			com += '<td>남자</td>'
		}
		com += '<td>' + r.birthDate + '</td>'
		com += '<td>' + r.phone + '</td>'
// 		com += '<td>' + r.email + '</td>'
		com += '</tr>'
        
        return com;

	}
	
// 	function getSex(check, cWriter) {
		
// 		var sex = '';
		
// 		$.ajax({
			
// 			url:'getSex.do',
// 			type:'post',
// 			data:{'id' : cWriter},
// 			dataType:'text',
// 			success:function(tempsex){
				
// 					alert(tempsex);
				
// 				if(tempsex == '0') {
// 					sex = '여';
// 				} else {
// 					sex = '남';
// 				}
				
// 					alert(sex);
					
// 					if(check == 1) {
// 						$('#commentShowTable').append(comListShow(r,sex));
// 					} else if(check == 2) {
						
// 						if(r.cAsk == 1) {
// 							$('#commentShowTable').append(comListShow(r,sex));
// 						}
						
// 					} else {
						
// 						if(r.cAccept == 1) {
// 							$('#commentShowTable').append(comListShow(r,sex));
// 						}
						
// 					}
					
					
	
// 			},
// 			error:function(ex){
// 				alert('eeeeeeeeeeee');
// 			}
			
// 		});
		
// 	}
	
	
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

<!-- </head> -->
<!-- <body> -->

<div align="center" id="board_content">
	
	<div id="boardContent">
	
		<input type="hidden" name="page" value="${page }">
		<input type="hidden" name="bNum" value="${board.bNum }">
		<input type="hidden" name="bAddress" value="${board.bAddress }">
		
		<table>
			<tr>
				<td align="left">
					<input type="button" value="전체목록" 
						onclick="location.href='boardList.do?page=${page}'">
					
				</td>
				
				<td align="right">
				
					<c:if test="${sessionScope.loginId == board.bWriter }">
					
						<c:if test="${board.bMatchCheck == 0 }">
							<input type="button" value="모집 완료" id="btn-matchCheck">
						</c:if> 
						<c:if test="${board.bMatchCheck == 1 }">
							<input type="button" value="다시 모집" id="btn-matchCheck">
						</c:if> 
						
						&nbsp;
						<input type="button" value="글 수정"
							onclick="location.href='boardPassCheck.do?bNum=${board.bNum }&check=up&page=${page }'">
						&nbsp;
						<input type="button" value="글 삭제"
							onclick="location.href='boardPassCheck.do?bNum=${board.bNum }&check=de&page=${page }'">
						&nbsp;
					</c:if>
				
				</td>
				
			</tr>
		</table>
		
		<table id="boardContentTable" border="1">
			
			<tr>
				<th>진행상태</th>
				
				<td id="matchCheck">
					<c:if test="${board.bMatchCheck == 0 }">
						모집중
					</c:if> 
					<c:if test="${board.bMatchCheck == 1 }">
						모집완료
					</c:if> 
				</td>
				
				<th>
					조회수
				</th>
				<td>
					${board.bReadCount }
				</td>	
			</tr>
			<tr>
				<th>
					제목
				</th>
				<td colspan="3">
					${board.bTitle }
				</td>
			</tr>	
			<tr>
				<th>
					작성자
				</th>
				<td colspan="3">
					${board.bWriter } (${sex })
				</td>
			</tr>
			<tr>
				<th>
					시간
				</th>
				<td colspan="3">
					${fn:substring(board.bTime, 0, 16) }
				</td>
			</tr>		
			<tr>	
				<th>
					장소
				</th>
				<td colspan="3">
					${board.bLocation } &nbsp; (${board.bAddress })
				</td>
			</tr>		
			<tr>
				<td colspan="4" align="center">
					<div id="map" style="width:600px;height:400px;" align="center"></div>
				</td>
			</tr>	
			<tr>	
				<th>
					내용
				</th>
				<td colspan="3">
					<pre width="100%" style="white-space: pre-wrap; word-wrap: break-word;">${board.bContent }</pre>
				</td>
			</tr>	
			
		</table>
		
	</div>

	<div>
		<table id="commentContoller" border="1">
			<tr>
				<td id="btn-cList" width="200px"> 신청/댓글 </td>
				<td id="btn-cAsk" width="200px"> 신청목록 </td>
				<td id="btn-cAccept" width="200px"> 수락목록 </td>
				<td id="btn-cAcceptPerson" width="200px"> 확정자 </td>
			</tr>		
		</table>
	</div>
	
	<div id="commentShowDiv">
		<table id="commentShowTable" style="width: 800px;">
		</table>
	</div>
	
	<div id="commentWriteDiv">
		<table id="commentWriteTable" style="width: 800px;">
		</table>
	</div>
	
</div>	
	
<!-- </body> -->
<!-- </html> -->

<%@ include file="../../footer.jsp"%>
