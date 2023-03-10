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

// 			alert('????????????');
			
			commentList(2);
			$('#btn-cList').css('backgroundColor', '');
			$(this).css('backgroundColor', '#ffe6ff');
			$('#btn-cAccept').css('backgroundColor', '');
			$('#btn-cAcceptPerson').css('backgroundColor', '');
			
			$('#commentWriteTable').empty();
			
			return false;
		})
		
		$(document).on('click', '#btn-cAccept', function(event){

// 			alert('????????????');
			
			commentList(3);
			$('#btn-cList').css('backgroundColor', '');
			$('#btn-cAsk').css('backgroundColor', '');
			$(this).css('backgroundColor', '#ffe6ff');
			$('#btn-cAcceptPerson').css('backgroundColor', '');
			
			
			$('#commentWriteTable').empty();
			
			return false;
		})
		
		$(document).on('click', '#btn-cAcceptPerson', function(event){

// 			alert('?????????');
			
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
					com += '<th width="120px"> ????????? ?????? </th>';
					com += '<th> ????????? </th>';
// 					com += '<th width="100px"> ?????? </th>';
					com += '<th width="80px"> ?????? </th>';
					com += '<th width="150px"> ?????? </th>';
					com += '<th width="200px"> ???????????? </th>';
// 					com += '<th> ????????? </th>';
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
						comSub += '<th> ????????? ????????? ??? ???????????? ????????? ????????? ??? ????????????. </th>';
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

// 			alert('????????????');
			
			if('${sessionScope.loginId }' == null) {
				alert('???????????? ???????????????.');
//				????????? ????????????
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
					
					alert('????????? ????????? ?????? ????????? ??? ????????????.');
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
						alert('?????? ?????????????????????.');
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

// 			alert('????????? ' + $(this).prop("title") + '??? ???');
			
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
					
// 					alert('?????? ??? ?????? ');
                	
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
			
// 			alert('????????? ' + cSub + '??? ???');
			
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
					
// 					alert('?????? ??? ?????? '+$('#commentShowTable').css('width'));
                	
					cCommentWriteForm(cWriteNum, cSub);
					
					$('textarea[name="tempFormTT"]').focus();
// 					alert('?????? ??? ?????? 2'+$('#commentShowTable').css('width'));
				},
				error:function(ex){
					alert(ex);
				}
			
			})
		
			return false;
			
		})
		
		$(document).on('click', '#btn-c-cWrite', function(event){

// 			alert('???????????????');
			
			if('${sessionScope.loginId }' == null) {
				alert('???????????? ???????????????.');
//				????????? ????????????
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
					
// 					alert('?????? ?????? ??????');
                	
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

// 			alert('????????? ??????');
			
// 			$('#tempComForm').remove();

			commentList(1);
			
			$('#btn-cList').css('backgroundColor', '#ffe6ff');
			$('#btn-cAsk').css('backgroundColor', '');
			$('#btn-cAccept').css('backgroundColor', '');
			$('#btn-cAcceptPerson').css('backgroundColor', '');
			
			return false;
			
		})
		
// 		$(document).on('click', '#c-modi', function(event){

// 			alert('?????? ?????????');
			
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

// 			alert('?????? ?????????');
			
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

// 			alert('?????? ??????');
			
			if('${sessionScope.loginId }' == null) {
				alert('???????????? ???????????????.');
//				????????? ????????????
				return false;
			} 
			
			var cNum = $(this).prop("value");
			var cAsk;
			var cContent = $('textarea[name="tempFormTT"]').val();
			
			if($('#tempComForm input:checkbox').is(':checked')) {
				
				if('${sessionScope.loginId}' == '${board.bWriter}') {
					
					alert('????????? ????????? ?????? ????????? ??? ????????????.');
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
						alert('?????? ?????????????????????.');
						return false;
					} else {
						
						$.ajax({
							
							url:'commentUpdate.do',
							type:'post',	
							data:comment,
							dataType:'text',
							success:function(result){
								
// 								alert('?????? ?????? ??????');
			                	
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

// 			alert('????????? ??????');
			
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

// 			alert('????????? ??????');
			
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

// 			msg = "????????? ?????????????????????????";
//             if (confirm(msg)!=0) {
//             	alert('??????');
            	
//             	$.ajax({
        			
//     				url:'commentDelete.do',
//     				type:'post',	
//     				data:{'cNum' : cNum},
//     				dataType:'text',
//     				success:function(result){
    					
//     					alert('?????? ??????');
                    	
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
//             	alert('????????????');
// 			}
            
//             return false;
			
// 		})
		
		$(document).on('click', '.c-del', function(event){
			
			var cNum = $(this).prop("id").substring(5, $(this).prop("id").length);
			
// 			alert(cNum);

			msg = "????????? ?????????????????????????";
            if (confirm(msg)!=0) {
            	alert('??????');
            	
            	$.ajax({
        			
    				url:'commentDelete.do',
    				type:'post',	
    				data:{'cNum' : cNum},
    				dataType:'text',
    				success:function(result){
    					
//     					alert('?????? ??????');
                    	
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
            	alert('????????????');
			}
            
            return false;
			
		})
		
		$(document).on('click', '#accept', function(event){
			
			var cNum = $(this).prop("value");
			
// 			alert(cNum);
			
			var tempAccept = $(this).text();
			
// 			alert(tempAccept);
			
			var cAccept;
			
			if(tempAccept == '??????') {
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
					
// 					alert('?????? ?????? or ??????');
                	
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

// 			alert('??????');
			
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
					
// 					alert('??????');
					
// 					alert($('#matchCheck').text());
                	
					if($('#btn-matchCheck').val() == '?????? ??????') {
						$('#matchCheck').text('????????????');
						$('#btn-matchCheck').val('?????? ??????');
					} else {
						$('#matchCheck').text('?????????');
						$('#btn-matchCheck').val('?????? ??????');
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
	        
				alert('??? ?????? ????????? ??? ????????????.');
	        	
	            $(this).val($(this).val().substring(0, 100));

	        }

	    });
	    
		$('#cContent').on('keyup', function(event) {

	        if($(this).val().length > 100) {
	        
				alert('??? ?????? ????????? ??? ????????????.');
	        	
	            $(this).val($(this).val().substring(0, 100));

	        }

	    });
	    
		$('#tempFormTT').on('keydown', function(event) {

	        if($(this).val().length > 100) {
	        
				alert('??? ?????? ????????? ??? ????????????.');
	        	
	            $(this).val($(this).val().substring(0, 100));

	        }

	    });
	    
		$('#tempFormTT').on('keyup', function(event) {

	        if($(this).val().length > 100) {
	        
				alert('??? ?????? ????????? ??? ????????????.');
	        	
	            $(this).val($(this).val().substring(0, 100));

	        }

	    });
	    
	    

	});
	
	
	
	function commentWriteForm() {
		$('#commentWriteTable').empty();
		
		var com = "";
		
		com += '<tr>';
		com += '<td width="200px" height="100px">???????????? <input type="checkbox" id="inputAsk" value="1"></td>';
		com += '<td><textarea rows="3" cols="70" name="cContent" id="cContent"></textarea></td>';
		com += '<td width="100px"><button id="btn-cWrite">??????</button></td>';
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
		com += '<td width="100px"><button id="btn-c-cWrite" value="' + cNum + '">??????</button> <button id="btn-c-Cancle" value="' + cNum + '">??????</button></td>';
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
			com += '<td width="200px">???????????? <input type="checkbox" checked="checked" id="moinputAsk"></td>';
		} else {
			com += '<td width="200px">???????????? <input type="checkbox" id="moinputAsk"></td>';
		}
		com += '<td><textarea rows="3" name="tempFormTT" id="tempFormTT">' + cContent + '</textarea></td>';
		com += '<td width="100px"><button id="btn-cModi" value="' + cNum + '">??????</button> <button id="btn-c-Cancle">??????</button></td>';
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
		com += '<td width="100px"><button id="btn-cModi" value="' + cNum + '">??????</button> <button id="btn-c-Cancle">??????</button></td>';
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
				com += '<td width="200px" height="100px">???????????? <input type="checkbox" disabled="disabled" checked="checked"><br><button id="accept" value="' + r.cNum + '">??????</button></td>';
			} else if(r.cAsk == 1 && '${board.bWriter}' == '${sessionScope.loginId}' && r.cAccept == 1) {
				com += '<td width="200px" height="100px">????????????<input type="checkbox" disabled="disabled" checked="checked"><br> <button id="accept" value="' + r.cNum + '">?????? ??????</button></td>';
			} else if(r.cAsk == 1 && r.cAccept == 1) {
				com += '<td width="200px" height="100px">????????????<input type="checkbox" disabled="disabled" checked="checked"><br>?????? ??????</td>';
			} else if(r.cAsk == 1) {
				com += '<td width="200px" height="100px">????????????<input type="checkbox" disabled="disabled" checked="checked"></td>';
			} else {
				com += '<td width="200px" height="100px">????????????<input type="checkbox" disabled="disabled"></td>';
			}
			
			
			if(r.cWriter == '${sessionScope.loginId}') {
// 				com += '<td colspan="2"> <b>' + r.cWriter +  '</b> &nbsp;' + cWriteDate + '&nbsp; <label id="c-com" title="' + r.cNum + '">??????</label> <label id="c-modi" title="' + r.cNum + '">??????</label> <label id="c-del" title="' + r.cNum + '">??????</label> <br>';
				com += '<td height="100px" colspan="2"> <b>' + r.cWriter +  '</b>&nbsp;' + cWriteDate + '&nbsp; <span class="c-com" id="c-com' + r.cNum + '">??????</span> <span class="c-modi" id="c-modi' + r.cNum + '">??????</span> <span class="c-del" id="c-del' + r.cNum + '">??????</span> <br>';
			} else {
				com += '<td height="100px" colspan="2"> <b>' + r.cWriter +  '</b>&nbsp;' + cWriteDate + '&nbsp; <span class="c-com" id="c-com' + r.cNum + '">??????</span> <br>';
			}
			
// 			if(r.cWriter == '${sessionScope.loginId}') {
// 				com += '<td colspan="2"> <b>' + r.cWriter +  '</b> &nbsp;' + r.cWriteDate + '&nbsp; <label id="c-com" title="' + r.cNum + '">??????</label> <label id="c-modi" title="' + r.cNum + '">??????</label> <label id="c-del" title="' + r.cNum + '">??????</label> <br>';
// 			} else {
// 				com += '<td colspan="2"> <b>' + r.cWriter +  '</b> &nbsp;' + r.cWriteDate + '&nbsp; <label id="c-com" title="' + r.cNum + '">??????</label> <br>';
// 			}

			com += '<pre width="100%" style="white-space: pre-wrap; word-wrap: break-word;">'+r.cContent+'</pre>';
			com += '</td>';
			com += '</tr>';
			
		} else {
			com += '<td width="200px" height="100px"> </td> ';
			com += '<td width="100px" height="100px"> <img src="img/re.gif" width="50px" height="50px"> </td>';
			
			if(r.cWriter == '${sessionScope.loginId}') {
// 				com += '<td width="500px" height="100px"> <b>' + r.cWriter +  '</b> &nbsp;' + r.cWriteDate + '&nbsp; <span class="c-c-modi" id="c-c-modi' + r.cNum + '">??????</span> <span class="c-del" id="c-del' + r.cNum + '">??????</span> <br>';
				com += '<td width="500px" height="100px"> <b>' + r.cWriter +  '</b>&nbsp;' + cWriteDate + '&nbsp; <span class="c-c-modi" id="c-c-modi' + r.cNum + '">??????</span> <span class="c-del" id="c-del' + r.cNum + '">??????</span> <br>';
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
// 		com += '<th> ????????? ?????? </th>';
// 		com += '<th> ????????? </th>';
// 		com += '<th> ?????? </th>';
// 		com += '<th> ?????? </th>';
// 		com += '<th> ?????? </th>';
// 		com += '<th> ???????????? </th>';
// 		com += '<th> ????????? </th>';
// 		com += '</tr>';
		com += '<tr class="acceptFormTrClass" align="center">'
		if(r.id == '${board.bWriter}') {
			com += '<td> ????????? </td>';
		} else {
			com += '<td> ????????? </td>';
		}
		com += '<td>' + r.id + '</td>'
// 		com += '<td>' + r.name + '</td>'
		if(r.sex == 0) {
			com += '<td>??????</td>'
		} else {
			com += '<td>??????</td>'
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
// 					sex = '???';
// 				} else {
// 					sex = '???';
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
		// ??????
      var myaddress = inputAddress;// ????????? ????????? ?????? ????????? ?????? (????????? ??????!!!!)
      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
          if (status !== naver.maps.Service.Status.OK) {
              return alert(myaddress + '??? ?????? ????????? ????????? ?????? ???????????? ??????');
          }
          var result = response.result;
          // ?????? ?????? ??????: result.total
          // ????????? ?????? ?????? ??????: result.items[0].address
          // ????????? ?????? ?????? ??????: result.items[0].point.y, result.items[0].point.x
          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
          map.setCenter(myaddr); // ????????? ????????? ?????? ??????
          // ?????? ??????
          var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
          });
          // ?????? ?????? ????????? ??????
          naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
          });
          // ?????? ????????? ??????????????? ??????
          var infowindow = new naver.maps.InfoWindow({
              content: '<h4> [????????? ???????????????]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
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
					<input type="button" value="????????????" 
						onclick="location.href='boardList.do?page=${page}'">
					
				</td>
				
				<td align="right">
				
					<c:if test="${sessionScope.loginId == board.bWriter }">
					
						<c:if test="${board.bMatchCheck == 0 }">
							<input type="button" value="?????? ??????" id="btn-matchCheck">
						</c:if> 
						<c:if test="${board.bMatchCheck == 1 }">
							<input type="button" value="?????? ??????" id="btn-matchCheck">
						</c:if> 
						
						&nbsp;
						<input type="button" value="??? ??????"
							onclick="location.href='boardPassCheck.do?bNum=${board.bNum }&check=up&page=${page }'">
						&nbsp;
						<input type="button" value="??? ??????"
							onclick="location.href='boardPassCheck.do?bNum=${board.bNum }&check=de&page=${page }'">
						&nbsp;
					</c:if>
				
				</td>
				
			</tr>
		</table>
		
		<table id="boardContentTable" border="1">
			
			<tr>
				<th>????????????</th>
				
				<td id="matchCheck">
					<c:if test="${board.bMatchCheck == 0 }">
						?????????
					</c:if> 
					<c:if test="${board.bMatchCheck == 1 }">
						????????????
					</c:if> 
				</td>
				
				<th>
					?????????
				</th>
				<td>
					${board.bReadCount }
				</td>	
			</tr>
			<tr>
				<th>
					??????
				</th>
				<td colspan="3">
					${board.bTitle }
				</td>
			</tr>	
			<tr>
				<th>
					?????????
				</th>
				<td colspan="3">
					${board.bWriter } (${sex })
				</td>
			</tr>
			<tr>
				<th>
					??????
				</th>
				<td colspan="3">
					${fn:substring(board.bTime, 0, 16) }
				</td>
			</tr>		
			<tr>	
				<th>
					??????
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
					??????
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
				<td id="btn-cList" width="200px"> ??????/?????? </td>
				<td id="btn-cAsk" width="200px"> ???????????? </td>
				<td id="btn-cAccept" width="200px"> ???????????? </td>
				<td id="btn-cAcceptPerson" width="200px"> ????????? </td>
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
