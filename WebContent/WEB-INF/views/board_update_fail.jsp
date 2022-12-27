<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../header.jsp"%>

<!-- <!DOCTYPE> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <title>Insert title here</title> -->

<!-- </head> -->
<!-- <body> -->

<script type="text/javascript">
	alert("${check} 작업간 문제가 발생했습니다. \n"
			+"다시 시도해 주시거나 관리자에게 문의해 주세요.");
	location.href='boardList.do';
</script>

<!-- </body> -->
<!-- </html> -->

<%@ include file="../../footer.jsp"%>