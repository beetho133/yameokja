<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../header.jsp"%>

<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>비밀번호 확인 페이지</title> -->

<style type="text/css">

#member_modify_check{
	width: 550px;
	text-align: center;
	border: thin;
	border-radius: 4px;
	border-style: solid;
	border-color: #f972b6;

}

input{
	height: 25px;
	border: thin;
	border-radius: 4px;
	border-style: solid;
	border-color: #b3c6ff;
}


</style>

<!-- </head> -->
<!-- <body> -->

<div id="tempHe" style="height: 200px;"></div>

<div id="tempCe" align="center">

<div id="member_modify_check" align="center">


<h3>${myinfo.id }님의 정보 수정을 위한 비밀번호 입력 화면</h3>
<form action="myInfoModifyForm.do" method="post">
<b>PASSWORD</b> : <input type="password" name ="typedpass">
<input type = "hidden" name = "id" value = "${myinfo.id}"> 
<input type = "submit" value = "확인">
</form>

</div>

</div>


<!-- </body> -->
<!-- </html> -->

<%@ include file="../../footer.jsp"%>