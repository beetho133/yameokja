<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../header.jsp"%>

<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>에러에러</title> -->

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


<h3>입력하신 정보가 일치하지 않습니다.</h3>

<input type="button" onclick="location.href='myInfoControl.do'" value="내 정보 보기">

<!-- </body> -->
<!-- </html> -->

</div>

</div>

<%@ include file="../../footer.jsp"%>