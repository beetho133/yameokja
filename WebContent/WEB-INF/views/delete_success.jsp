<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../header.jsp"%>

<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <title>탈퇴하기 완료</title> -->

<style type="text/css">

#delete_success{
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

<div id="delete_success" align="center">


<h3>${delId } 님의 탈퇴가 완료되었습니다.</h3>
<h3>안녕히 가세요.</h3>

<input type="button" onclick="location.href='${pageContext.request.contextPath}'" value="MAIN">


<!-- </body> -->
<!-- </html> -->

</div>

</div>


<!-- </body> -->
<!-- </html> -->

<%@ include file="../../footer.jsp"%>