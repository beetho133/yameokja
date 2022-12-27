<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../../header.jsp" %>

<!-- <!DOCTYPE> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <title>삭제</title> -->

<style type="text/css">

#board_delete_form{
	width: 400px;
	text-align: center;
	border: thin;
	border-radius: 4px;
	border-style: solid;
	border-color: #f972b6;

}

input{
	height: 25px;
	width: 60px;
	border: thin;
	border-radius: 4px;
	border-style: solid;
	border-color: #b3c6ff;
}


</style>



${page }
<c:if test="${check eq 'y' }">

	<script type="text/javascript">
		alert("${bNum}번 글의 삭제되었습니다.");
		location.href="boardList.do?page="+${page};
	</script>

</c:if>




<!-- </head> -->
<!-- <body> -->

<div id="tempHe" style="height: 200px;"></div>

<div id="tempCe" align="center">

<div id="board_delete_form" align="center">

<h3>${bNum }번 글을 정말 삭제하시겠습니까?</h3>

<form action="boardDelete.do" method="post">
	<input type="hidden" name="bNum" value="${bNum }">	
	<input type="hidden" name="page" value="${page }">
	<input type="submit" value="예">
	<input type="button" value="아니요" 
		onclick="location.href='boardContent.do?bNum=${bNum }&page=${page }'">
</form>

</div>

</div>

<!-- </body> -->
<!-- </html> -->

<%@ include file="../../footer.jsp"%>
