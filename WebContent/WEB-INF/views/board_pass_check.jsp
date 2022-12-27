<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../../header.jsp" %>
    
<!-- <!DOCTYPE> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <title>비밀번호 확인</title> -->

<style type="text/css">

.pass_check{
	width: 350px;
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

<div class="pass_check" align="center">

<%-- ${page } --%>

<c:if test="${check eq 'up' }">

	<h3>${bNum }번 글 수정 비밀번호 확인</h3>
	
	<form action="boardModifyForm.do" method="post">
		<input type="hidden" name="bNum" value="${bNum }">
		<input type="hidden" name="page" value="${page }">
		<b>PASSWORD</b> : <input type="password" name="checkPw">
		<input type="submit" value="확인">
	</form>


</c:if>

<c:if test="${check eq 'de' }">

	<h3>${bNum }번 글을 삭제 비밀번호 확인</h3>
	
	<form action="boardDeleteForm.do" method="post">
		<input type="hidden" name="bNum" value="${bNum }">
		<input type="hidden" name="page" value="${page }">
		<b>PASSWORD</b> : <input type="password" name="checkPw">
		<input type="submit" value="확인">
	</form>

</c:if>

</div>

</div>


<!-- </body> -->
<!-- </html> -->

<%@ include file="../../footer.jsp"%>