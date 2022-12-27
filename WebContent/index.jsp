<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../header.jsp" %>

<!-- <link rel="stylesheet" type="text/css" href="css/reset.css"> -->
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/navigation.css">

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.slides.min.js"></script>
<script>
  $(function() {
     $("#slides").slidesjs({
       //이미지 크기설정
       "width" : 800,
       "height" : 450,

       play : {
            active : true,   //play/stop 버튼의 표시여부
         //자동재생기능
         auto : true,

         //슬라이더 재생 간격시간설정
         interval : 5000,

         swap : true,
         // true : play와 stop버튼이 상황에 따라 표시됨
         // false : play와 stop버튼이 항상 표시됨
         effect : "slide"
         // fade & slide 2가지 중 택일
       }
     });
  });


</script>

<link rel="stylesheet" href="css/style.css" />

<!-- </head> -->
<!-- <body> -->

<div id="tempHe" style="height: 50px;"></div>

<div class="example">
   <div id="slides">
   <img src="img/chojs0.jpg" style="width: 800; height: 500;"/>
   <img src="img/chojs2.jpg" style="width: 800; height: 500;"/>
   <img src="img/chojs3.jpg" style="width: 800; height: 500;"/>
   <img src="img/chojs4.jpg" style="width: 800; height: 500;"/>
   </div>
</div>




<%@ include file="../footer.jsp" %>

<%-- 
<c:if test="${empty sessionScope.loginId }">

	<a href="joinForm.do">회원가입</a> <br>
	<a href="loginForm.do">로그인</a> <br>

</c:if>

<c:if test="${not empty sessionScope.loginId}">
	
	<a href="logout.do">로그아웃</a> <br>
	<a href="myPage.do">마이페이지</a> <br>

</c:if>

<a href="boardList.do">게시글</a>
--%>
