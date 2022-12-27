<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../header.jsp"%>

<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <title>탈퇴하기 실패!</title> -->

<style type="text/css">

#member_error{
	width: 550px;
	text-align: center;
	border: thin;
	border-radius: 4px;
	border-style: solid;
	border-color: #f972b6;

}

input{
	width: 150px;
	height: 30px;
	border: thin;
	border-radius: 4px;
	border-style: solid;
	border-color: #b3c6ff;
	margin-bottom: 10px;
}

</style>

<!-- </head> -->
<!-- <body> -->

<div id="tempHe" style="height: 200px;"></div>

<div id="tempCe" align="center">

<div id="member_error" align="center">

<h1>비번 틀려서 삭제 실패!!!</h1>
<a href="myInfo.do">내 정보로 가기</a>

</div>

</div>


<!-- </body> -->
<!-- </html> -->

<%@ include file="../../footer.jsp"%>