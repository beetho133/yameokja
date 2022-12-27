<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE>
<html>
<head>
<title>아이디 중복 확인</title>

<style type="text/css">

input {
	
	height: 25px;
	border: thin;
	border-radius: 4px;
	border-style: solid;
	border-color: #b3c6ff;
	
}

#member_id_check{
	width: 350px;
	text-align: center;
	border: thin;
	border-radius: 4px;
	border-style: solid;
	border-color: #f972b6;

}

input[type=button] {
	
	margin: 5px;
	width: 200px;
	
}

</style>

<script type="text/javascript" src="js/script.js"></script>

<link rel="stylesheet" href="css/style.css" />

</head>
<body>

<div id="tempHe" style="height: 15px;"></div>
<div id="tempCe" align="center">

<div id="member_id_check" align="center">

	<h2> 아이디 중복 확인 </h2>
	
	<form action="memberIdCheck.do" method="post" name="cForm">
	
		<b>아이디</b> : <input type="text" name="checkId" maxlength="10" value="${checkId }">
		<input type="submit" value="중복체크">

		<br>
		<br>
	
		<c:if test="${check }">
			<span style="color: green;">${checkId }는 사용 가능한 아이디입니다.</span> <br>
			<input type="button" value="사용" onclick="checkedId()">
		</c:if>
	
		<c:if test="${!check }">
			<script type="text/javascript">
				opener.document.jForm.Id.value="";
			</script>
			<span style="color: red;">${checkId }는 이미 사용 중인 아이디입니다.</span>
		</c:if>

	</form>
	
</div>

</div>

</body>
</html>