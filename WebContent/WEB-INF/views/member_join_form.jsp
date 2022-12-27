<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../header.jsp"%>

<!-- <!DOCTYPE>     -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <title>회원가입 폼</title> -->

<style type="text/css">

#memberJoinFormTable table:nth-child(1){
	border: 1px solid #f972b6;
	border-collapse: collapse;
	padding: 0;
	margin: 0;


}

input[type=radio]{

	height: auto;
	border: 0;
 
}

input[type=button], input[type=submit]{

	width: 70px;
 
}

#member_join_form{
	text-align: center;
	width:500px;
	background-color: #ffe6ff;

}

</style>

<script type="text/javascript" src="js/script.js"></script>

<!-- </head> -->
<!-- <body> -->

<div id="tempHe" style="height: 100px;"></div>
	
<div id="tempCe" align="center">	

	<div id="member_join_form" align="center">
		
		<h3>회원가입</h3>
		<br>
		'<span style="color: red;">*</span>' 표시 항목은 필수 입력 항목입니다.	

		<form action="memberJoin.do" method="post" name="jForm"
			onsubmit="return join();">
			<div id="memberJoinFormTable" align="center">
			<table border="1">

				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id" required="required" size="25" maxlength="10">
						<input type="hidden" name="checkId">
						<span style="color: red;">*</span>
						<input type="button" value="중복확인" onclick="idCheck()">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" required="required" size="25"> <span style="color: red;">*</span></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="checkPw" required="required" size="25"> <span style="color: red;">*</span></td>
				</tr>
				
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" required="required" size="25"> 
						<span style="color: red;">*</span>
					</td>
				</tr>
				
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="sex" value="0" checked="checked"> 여자 &nbsp;
						<input type="radio" name="sex" value="1"> 남자
						<span style="color: red;">*</span>
					</td>
				</tr>
				
				<tr>
					<th>생년월일</th>
					<td>
						<input type="text" name="birthDate" required="required" maxlength="6" placeholder="생년월일 6자리를 입력하세요." size="25"> 
						<span style="color: red;">*</span>
						
						
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="phone" required="required" maxlength="11" placeholder="'-'없이 입력하세요." size="25"> 
						<span style="color: red;">*</span>
					</td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td><input type="email" name="email" size="25"></td>
				</tr>
				

			</table>
			<table>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="회원가입"> &nbsp;&nbsp;
						<input type="reset" value="다시작성"> &nbsp;&nbsp;
						<input type="button" value="MAIN"
							onclick="location.href='${pageContext.request.contextPath}'">
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