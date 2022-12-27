<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../../header.jsp"%>

<c:set var="loginId" value="${sessionScope.loginId}"/>
<!-- <!DOCTYPE> -->
<!-- <html> -->
<!-- <head> -->
<!-- <title>로그인</title> -->


<style type="text/css">

#member_login_form{
	width: 400px;
	height: 300px;
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
	height: 30px;
}

input[type=submit], input[type=button] {

	width: 300px;
	height: 30px;

}

h2{
	display: inline;
} 

</style>


<!-- </head> -->
<!-- <body> -->




<div id="tempHe" style="height: 150px;"></div>

<div id="tempCe" align="center">

<div id="member_login_form" align="center">

<c:if test="${empty loginId }">


<form action="memberLogin.do" method="post">

	<h3>로그인</h3>

	<table style="height: 250px;">
		<tr>
			<th> 아이디 </th>
			<td> <input type="text" name="id" value="${id }"> </td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td> <input type="password" name="pw"> </td>
		</tr>
		<tr>
			<td align="center" colspan="2" height="20px" style="color: red;">${message }</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="submit" value="로그인"><br><br>
				<input type="button" value="MAIN" 
					onclick="location.href='${pageContext.request.contextPath}'">
			</td>
		</tr>	
	</table>
</form>

</c:if>

<c:if test="${not empty loginId }">

	<div id="tempHe" style="height: 80px;"></div>
	<h2>${loginId }</h2> <b>님 환영합니다.</b>
	
	<br>
	<br>
	<br>


	<button onclick="location.href='${pageContext.request.contextPath}'">MAIN</button>
	<button onclick="location.href='myInfo.do'">마이페이지</button>
	<button onclick="location.href='memberLogout.do'">로그아웃</button>

</c:if>

</div>

</div>

<!-- </body> -->
<!-- </html> -->

<%@ include file="../../footer.jsp"%>