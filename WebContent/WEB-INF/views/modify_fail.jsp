<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../header.jsp"%>

<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <title>수정하기 실패!</title> -->

<style type="text/css">

#modify_fail{
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

<div id="modify_fail" align="center">



<h3>수정 작업간 문제가 발생했습니다.</h3>
<h3>다시 시도해 주시거나 관리자에게 문의해 주세요.</h3>
<input type="button" onclick="location.href='myInfoControl.do'" value="내 정보 보기">

</div>

</div>
<!-- </body> -->
<!-- </html> -->

<%@ include file="../../footer.jsp"%>