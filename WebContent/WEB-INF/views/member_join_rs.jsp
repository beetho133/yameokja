<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../../header.jsp"%>

<!-- <!DOCTYPE> -->
<!-- <html> -->
<!-- <head> -->
<!-- <title>회원 가입 결과</title> -->

<!-- </head> -->
<!-- <body> -->


<style type="text/css">

#member_join_rs{
	width: 500px;
	height: 120px;
	text-align: center;
	border: thin;
	border-radius: 4px;
	border-style: solid;
	border-color: #f972b6;

}

a{
   		text-decoration:none;
   	 	color:#000;
   	 	text-decoration: underline;
}

a:hover{
   		color: #aaa;
    	font-weight: bold;
}

button {
	width: 100px;
}

input[type=submit]{

	width: 300px;
	height: 30px;

}


</style>

<!-- </head> -->
<!-- <body> -->

<div id="tempHe" style="height: 200px;"></div>

<div id="tempCe" align="center">

<div id="member_join_rs" align="center">
	
	<c:if test="${check }">
	<h2>${id }님 가입이 완료되었습니다.</h2>
		 
		<form action="memberLoginForm.do" method="post">
			<input type="hidden" name="id" value="${id }">
			<input type="submit" value="로그인">&nbsp;
		</form>
	</c:if>

	<c:if test="${!check }">
		<h2>회원가입에 실패하였습니다.</h2>
		<button onclick="location.href='memberJoinForm.do'">다시시도</button>
		<button onclick="location.href='${pageContext.request.contextPath}'">MAIN</button>
	</c:if>
	
</div>

</div>




<!-- </body> -->
<!-- </html> -->

<%@ include file="../../footer.jsp"%>