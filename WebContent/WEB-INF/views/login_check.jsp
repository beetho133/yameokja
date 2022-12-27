<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../header.jsp" %>    

<!-- <!DOCTYPE> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <title>Insert title here</title> -->

<style type="text/css">

#pass_check{
	width: 350px;
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
	font-weight: bold;
}


</style>

<!-- </head> -->
<!-- <body> -->

<div id="tempHe" style="height: 200px;"></div>

<div id="tempCe" align="center">

<div id="login_check" align="center">
	
	<h2> 로그인이 필요합니다. </h2>
	
	<button onclick="location.href='memberLoginForm.do'">로그인</button> &nbsp;
	<button onclick="location.href='${pageContext.request.contextPath}'">메 인</button>	
	
</div>

</div>


<!-- </body> -->
<!-- </html> -->

<%@ include file="../../footer.jsp"%>