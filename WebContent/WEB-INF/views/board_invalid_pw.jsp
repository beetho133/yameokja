<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../../header.jsp"%>
<!-- <!DOCTYPE> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <title>Insert title here</title> -->

<!-- </head> -->
<!-- <body> -->

<script type="text/javascript">
	alert("${check} 비밀번호가 잘못되었습니다.");
	window.history.go(-2);	
</script>


<!-- </body> -->
<!-- </html> -->

<%@ include file="../../footer.jsp"%>
