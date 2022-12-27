<%@page import="vo.MemberVO"%>
<%@page import="repository.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	

<%@ include file="../../header.jsp"%>

<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>마이 페이지</title> -->

<style type="text/css">

#member_myinfo_control{
	text-align: center;
	width:500px;
	background-color: #ffe6ff;
	padding: 10px;
}

#member_myinfo_control table:nth-child(1){
	
	width:480px;
	height: 500px;
	border: 1px solid #fff;
	border-collapse: collapse;
	margin-bottom: 30px;

}

#member_myinfo_control table:nth-child(1) th{
	
	width:200px;

}

input[type=button], input[type=submit]{

	width: 100px;
	height: 30px;
 
}



</style>

<!-- </head> -->
<!-- <body> -->
	
<div id="tempCe" align="center">	

	<div id="member_myinfo_control" align="center">
	
	<h3>가입 정보</h3>
		<br>
			<div id="memberJoinFormTable" align="center">
			<table border="1">

				<tr>
					<th>아이디</th>
					<td>
						${myinfo.id}
					</td>
				</tr>				
				<tr>
					<th>이름</th>
					<td>
						${myinfo.name }
					</td>
				</tr>
				
				<tr>
					<th>성별</th>
					<td>
						${changedSex }
					</td>
				</tr>
				
				<tr>
					<th>생년월일</th>
					<td>
						${myinfo.birthDate }
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						${myinfo.phone }
					</td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td>
						${myinfo.email }
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td align="center" colspan="2">
						<input type="button" value="정보수정"
							onclick="location.href='myinfoModifyCheck.do'"> &nbsp;&nbsp;
						<input type="button" value="회원탈퇴"
							onclick="location.href='myinfoDeleteCheck.do'">
					</td>
				</tr>
			</table>
			
			</div>
	
</div>

</div>	
<!-- </body> -->
<!-- </html> -->

<%@ include file="../../footer.jsp"%>