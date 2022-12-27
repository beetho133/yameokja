//////////////////MEMEBER//////////////////// 
function join() {
	
	if(document.jForm.id.value=="") {
		alert("아아디를 입력하세요.");
		document.jForm.id.focus();
		return false;
	}
	
	if(document.jForm.pw.value=="") {
		alert("비밀번호를 입력하세요.");
		document.jForm.pw.focus();
		return false;
	}
	
	if(document.jForm.pw.value!=document.jForm.checkPw.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.jForm.pw.focus();
		return false;
	}
	
	if(document.jForm.name.value=="") {
		alert("이름을 입력하세요.");
		document.jForm.name.focus();
		return false;
	}
	
	if(document.jForm.birthDate.value=="") {
		alert("생년월일을 입력하세요.");
		document.jForm.birthDate.focus();
		return false;
	}
	
	if(document.jForm.phone.value=="") {
		alert("전화번호를 입력하세요.");
		document.jForm.phone.focus();
		return false;
	}
	
	if((document.jForm.checkId.value.length == 0) || document.jForm.checkId.value != document.jForm.id.value) {
		alert("아이디 중복 확인이 필요합니다.");
		jForm.id.focus();
		return false;
	}
	
	var regId = /^[a-zA-Z][a-zA-Z0-9]{3,9}$/;
	var joinId = document.jForm.id.value;
	
	if(!regId.test(joinId)) {
		
		alert("아이디 첫자리는 반드시 영문으로 입력하세요.\n" +
				"영문 및 숫자로 총 4~10자리를 입력하세요.");
		jForm.id.focus();
		return false;
		
	}
	
	var regPw = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*_-])[a-zA-Z0-9!@#$%^&*_-]{4,8}$/;
	var joinPw = document.jForm.pw.value;
	
	if(!regPw.test(joinPw)) {
		
		alert("비밀번호를 영문, 숫자, 특수문자를 하나 이상 포함하여 4~8자리로 입력하세요.\n허용 특수문자 : !@#$%^&*_-");
		jForm.pw.focus();
		return false;
		
	}
	
	var regBd = /^[0-9]{6}$/;	
	var joinBd = document.jForm.birthDate.value;

	if(!regBd.test(joinBd)) {
		alert("생년월일을 6자리 숫자로 입력해 주세요.");
		jForm.birthDate.focus();
		return false;
	}
	
	var regP = /^[0-9]{10,11}$/;	
	var joinP = document.jForm.phone.value;

	if(!regP.test(joinP)) {
		alert("전화번호를 '-' 등 문자를 제외하고, 숫자 10~11자리를 입력하세요");
		jForm.phone.focus();
		return false;
	}
	
	var regN = /^[가-힣]{2,6}$/;
	var joinN = document.jForm.name.value;
	
	if(!regN.test(joinN)) {
		alert("이름을 한글로 2~6자로 입력하세요.");
		jForm.name.focus();
		return false;
	}
	
	var regE = /^[a-zA-Z][a-zA-Z0-9]{5,10}[\@][a-z]{2,10}[\.][a-z]{2,3}[\.]?([a-z]{0}|[a-z]{2,3})$/;
	var joinE = document.jForm.email.value;
	
	if(joinE.length != 0) {
		if(!regE.test(joinE)) {
			alert("이메일을 형식에 맞게 입력하세요.")
			jForm.email.focus();
			return false;
		}
	}

}
/////////////////////////////////


function modify() {
	
	if(document.uForm.pw.value=="") {
		alert("비밀번호를 입력하세요.");
		document.uForm.pw.focus();
		return false;
	}
	
	if(document.uForm.pw.value!=document.uForm.checkPw.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.uForm.pw.focus();
		return false;
	}
	
	if(document.uForm.phone.value=="") {
		alert("전화번호를 입력하세요.");
		document.uForm.phone.focus();
		return false;
	}
	
	var regPw = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*_-])[a-zA-Z0-9!@#$%^&*_-]{4,8}$/;
	var joinPw = document.uForm.pw.value;

	if(!regPw.test(joinPw)) {
		
		alert("비밀번호를 영문, 숫자, 특수문자를 하나 이상 포함하여 4~8자리로 입력하세요.\n허용 특수문자 : !@#$%^&*_-");
		uForm.pw.focus();
		return false;
		
	}
	
	var regP = /^[0-9]{10,11}$/;
	var joinP = document.uForm.phone.value;
	
	if(!regP.test(joinP)) {
		alert("전화번호를 다시 입력하세요");
		uForm.phone.focus();
		return false;
	}
	
	var regE = /^[a-zA-Z][a-zA-Z0-9]{2,10}[\@][a-z]{2,10}[\.][a-z]{2,3}[\.]?([a-z]{0}|[a-z]{2,3})$/;
	var joinE = document.uForm.email.value;
	
	if(joinE.length != 0) {
		if(!regE.test(joinE)) {
			alert("이메일을 다시 입력하세요.")
			jForm.email.focus();
			return false;
		}
	}
	
}

function idCheck() {
	
	if(document.jForm.id.value == "") {
		alert("아이디를 입력하세요.");
		document.jForm.id.focus();
		return;
	}
	
	var url = "memberIdCheck.do?checkId=" + document.jForm.id.value;
	
	window.open(url,
			"_blanck_1", "toolbar=no, menubar=no scrollbars=yes," +
			" resizable=no, width=450, height=250");	
}


function checkedId() {
	
	opener.jForm.id.value = document.cForm.checkId.value;
	opener.jForm.checkId.value = document.cForm.checkId.value;
	self.close();
}

//function write() {
//	
//	if(document.wForm.bTitle.value == "") {
//		alert("제목을 입력하세요");
//		document.wForm.bTitle.focus();
//		return false;
//	}
//	
//	if(document.wForm.bLocation.value == "") {
//		alert("지역을 입력하세요.");
//		document.wForm.bLocation.focus();
//		return false;
//	}
//	
//	if(document.wForm.bAddress.value == "") {
//		alert("장소를 입력하세요.");
//		document.wForm.bAddress.focus();
//		return false;
//	}
//	
//	if(document.wForm.bTime.value == "") {
//		alert("시간을 입력하세요.");
//		document.wForm.bTime.focus();
//		return false;
//	}
//	
//	if(document.wForm.bContent.value == "") {
//		alert("내용을 입력하세요.");
//		document.wForm.bContent.focus();
//		return false;
//	}
//	
//	if(document.wForm.bPw.value == "") {
//		alert("비밀번호를 입력하세요.");
//		document.wForm.bPw.focus();
//		return false;
//	}
//	
//	var regPw = /^[0-9]{1,8}$/;
//	var writePw = document.wForm.bPw.value;
//	
//	if(!regPw.test(writePw)) {
//		alert("비밀번호를 다시 입력하세요");
//		wForm.bPw.focus();
//		return false;
//	}
//	
//}

