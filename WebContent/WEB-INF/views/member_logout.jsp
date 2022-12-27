<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../header.jsp"%>

<!-- <!DOCTYPE> -->
<!-- <html> -->
<!-- <head> -->
<!-- <title>로그아웃</title> -->

<!-- </head> -->
<!-- <body> -->

<script type="text/javascript">
	alert("로그아웃 하셨습니다.");
	/* 
	location.href='loginForm.do';
	*/
	location.href='${pageContext.request.contextPath}'; 
</script>

<!-- </body> -->
<!-- </html> -->

<%@ include file="../../footer.jsp"%>