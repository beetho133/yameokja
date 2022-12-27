<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>

<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" />
<style type="text/css">

body{
/*     background-color:#e54a98; */
    margin:0;
    padding:0;
/*     font-size:0.75em; */
}

#header, #footer{
	  background-color: #ffe6ff;
}

#wrap{
	min-height:700px;
	width:1000px;
    text-align:center;
    margin:0;
    margin-right:auto;
    margin-left:auto;
/*     background-color:#e54a98; */
    background-repeat:repeat-y;        
}

.headTd{
	text-align: center;
	width: 150px;
	height: 30px;
	font-size: 25px;
	font-style: normal;
}

.headTd span{
	font-size: 50px;
	color: #ff3972;
}

.headTd a{
	text-decoration:none;
/*  	color:#fff; */
  	color:#000;
}

.headTd a:hover{
	color: #aaa;
   	font-weight: bold;
   	background-repeat:repeat-x;
   	background-position:bottom;
}

textarea {

	width: 100%;
	resize: none;
	border-radius: 4px;
	border-color: #b3c6ff; 	
}

.clear{clear:both;}

#footer{
	text-align: center;
}

input, button, select {
	height: 25px;
	border: thin;
	border-radius: 4px;
	border-style: solid;
	border-color: #b3c6ff;
}


</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	
	var imgInfo = [{
		'src' : 'img/y2.png',
		'width' : '180',
		'height' : '100'
	},
	{
		'src' : 'img/ya1.jpg',
		'width' : '180',
		'height' : '100'
	}];
	
	$(".toIndex").hover( function (){
		
			$('.toIndex img').attr(imgInfo[0]);
			$('.headTd span').css('color', '#3d3d3d');
			$('.headTd span').css('font-size', '45px');
		
		}, function (){ 
			
			$('.toIndex img').attr(imgInfo[1]);
			$('.headTd span').css('color', '#ff3972');
			$('.headTd span').css('font-size', '50px');
		
		});

	
	
})



</script>

</head>
<body>

<div id="header" align="center">

	<table id="headTable">
		<tr>
			<td class="headTd"> 
				<a class="toIndex" href="${pageContext.request.contextPath}">
					<img src="img/ya1.jpg" width="180" height="100">
				</a>
			</td>
			<td class="headTd" style="width: 200; text-align: left;"><a class="toIndex" href="${pageContext.request.contextPath}"><span>meokja</span></a></td>
			<c:if test="${empty sessionScope.loginId}">
				<td class="headTd"> <a href="memberJoinForm.do">회원가입</a> </td>
			</c:if>
			<c:if test="${not empty sessionScope.loginId}">
				<td class="headTd"> ${sessionScope.loginId }</td>
			</c:if>
			<td class="headTd"> <a href="boardList.do">게 시 판</a> </td>
			<c:if test="${empty sessionScope.loginId}">
				<td class="headTd"> <a href="memberLoginForm.do">로 그 인</a> </td>
			</c:if>
			<c:if test="${not empty sessionScope.loginId}">
				<td class="headTd"> <a href="memberLogout.do">로그아웃</a> </td>
			</c:if>
			<td class="headTd"> <a href="myInfo.do">마이페이지</a> </td>
		</tr>
	
	</table>
	<hr>
</div>
	
<div id="wrap">
	
	
	<div class="clear"></div>
