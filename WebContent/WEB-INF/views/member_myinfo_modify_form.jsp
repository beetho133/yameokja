<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../header.jsp"%>

<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>내 정보 수정 페이지</title> -->
<style type="text/css">

#member_modify_form{
	text-align: center;
	width:500px;
	background-color: #ffe6ff;
	padding: 10px;

}

#memberModifyFormTable table:nth-child(1){
	border: 1px solid #fff;
	border-collapse: collapse;
	margin-bottom: 30px;
}

input[type=radio]{

	height: auto;
	border: 0;
 
}

input[type=button], input[type=submit], input[type=reset] {

	width: 100px;
 
}

</style>
<script type="text/javascript" src="js/script.js"></script>
<!-- </head> -->
<!-- <body> -->

<div id="tempHe" style="height: 100px;"></div>
	
<div id="tempCe" align="center">	

	<div id="member_modify_form" align="center">
		
		<h3>정보 수정</h3>
		<br>	

		<form action="modify.do" method="post" name="uForm"
			onsubmit="return modify();">
			<div id="memberModifyFormTable" align="center">
			<table border="1">

				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id" required="required" size="25" maxlength="12" readonly="readonly" value="${myinfo.id}">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" required="required" size="25" value="${myinfo.pw}"> <span style="color: red;">*</span></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="checkPw" required="required" size="25"> <span style="color: red;">*</span></td>
				</tr>
				
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" required="required" size="25" readonly="readonly" value="${myinfo.name }"> 
					</td>
				</tr>
				
				<tr>
					<th>성별</th>
					<td>
						<c:if test="${changedSex == '남자'}">
							<input type="radio" value="0" disabled="disabled"> 여자 &nbsp;
							<input type="radio" value="1" checked="checked" disabled="disabled"> 남자
							<input type="hidden" name="sex" value="1">
						</c:if>
						<c:if test="${changedSex == '여자'}">
							<input type="radio" value="0" checked="checked" disabled="disabled"> 여자 &nbsp;
							<input type="radio" value="1" disabled="disabled"> 남자
							<input type="hidden" name="sex" value="0">						
						</c:if>
					</td>
				</tr>
				
				<tr>
					<th>생년월일</th>
					<td>
						<input type="text" name="birthDate" required="required" maxlength="6" size="25" readonly="readonly" value="${myinfo.birthDate }">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="phone" required="required" maxlength="11" size="25" value="${myinfo.phone }"> 
						<span style="color: red;">*</span>
					</td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td><input type="email" name="email" size="25" value="${myinfo.email }"></td>
				</tr>
				

			</table>
			<table>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="정보수정"> &nbsp;&nbsp;
						<input type="reset" value="다시작성"> &nbsp;&nbsp;
						<input type="button" value="내 정보 보기"
							onclick="location.href='myInfoControl.do'">
					</td>
				</tr>
			</table>
			
			</div>
		</form>
		
	</div>

</div>



<!-- </body> -->
<!-- </html> -->

<%@ include file="../../footer.jsp"%>