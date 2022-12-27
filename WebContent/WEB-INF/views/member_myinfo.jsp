<%@page import="vo.MemberVO"%>
<%@page import="repository.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="../../header.jsp"%>

<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->


<style type="text/css">

#member_myinfo {
	width: 1000px;
 	margin-left: auto;
 	margin-right: auto;
/*  	background-color: #ffe6ff; */

	border: 1px solid #f972b6;
	border-collapse: collapse;
}

a{
   		text-decoration:none;
   	 	color:#000;
   	 	text-decoration: underline;
}

a:hover{
   		color: #aaa;
    	font-weight: bold;
}


#wirteBoardList, #writeAskList, #writeAcceptList{
	width: 100%;
	height: 100%;
	border-top: 1px solid #f972b6;
	border-bottom: 1px solid #f972b6;	
	border-collapse: collapse;
	
}

#wirteBoardList table, #writeAskList table, #writeAcceptList table{
	width: 100%;
	text-align: center;
	margin-bottom: 5px;
	background-color: #ffe6ff;
}

#wirteBoardList td:nth-child(3), #writeAskList td:nth-child(3), #writeAcceptList td:nth-child(3){
	width: 450px;
	text-align: left;
	padding-left: 5px;
	padding-right: 5px;
}


#wirteBoardList td:nth-child(4), #writeAskList td:nth-child(4), #writeAcceptList td:nth-child(4){
	width: 200px;
}


a{
   		text-decoration:none;
   	 	color:#000;
   	 	text-decoration: underline;
}

a:hover{
   		color: #aaa;
    	font-weight: bold;
}

button{
	width: 150px;
	height: 50px;
	font-size: large;
	margin-right: 10px;
}

h4{

	border-top: 1px solid #f972b6;
	padding-top: 20px;

}


</style>


<!-- </head> -->

<!-- <body> -->
	
	<div id="member_myinfo" align="center">
	
		<h3 align="right">
			<button onclick="location.href='myInfoControl.do'">내 정보 보기</button>
		</h3>
		
	<div id="writeBoard" style="overflow-y:scroll; height:250px;">	

		<h4 align="left">내가 쓴 게시글 수 : ${writeBoardCount }</h4>
		
		<div id="wirteBoardList">
<%-- 		<c:if test="${not empty boardPage.boardList }"> --%>		
			
<%-- 		</c:if> --%>

		<table>
			
			<tr>
			
				<th>목차</th>
				<th>글 상태</th>
				<!-- 만료 진행 -->
				

				<!--  -->
<!-- 				<th>글 번호</th> -->
				<!--  -->
				<th>제목</th>
				<th>작성자</th>
				<th>시간</th>
				<th>지역</th>
				
				
<!-- 				<th>성별</th> -->
<!-- 				<th>작성일자</th> -->
				<th>조회수</th>
			</tr>

			<c:if test="${empty writeBoard }">

				<tr>
					<td colspan="7">작성된 게시글이 없습니다.</td>
				</tr>
				
			</c:if>

			<c:set var="listNum" value="${writeBoardCount }" />
			<c:if test="${not empty writeBoard }">

				<c:forEach items="${writeBoard }" var="list">

					<tr>
						<td>
							${listNum } <c:set var="listNum" value="${listNum - 1 }" />
						</td>
						<td>
							<c:if test="${list.bMatchCheck == 0 }">
								모집중
							</c:if> 
							<c:if test="${list.bMatchCheck == 1 }">
								모집완료
							</c:if>
						</td>
						

						<!--  -->
<%-- 						<td>${list.bNum }</td> --%>
						<!--  -->
						<td><pre style="white-space: pre-wrap; word-wrap: break-word;"><a href="boardContent.do?bNum=${list.bNum }">${list.bTitle }</a></pre></td>
						
						<c:forEach items="${memberList }" var="mList">
							<c:if test="${list.bWriter == mList.id}">
								<c:choose>
									<c:when test="${mList.sex == 0 }">
										<td id="bWriter" title="${list.bNum }">${list.bWriter }(여자)</td>
									</c:when>
									<c:otherwise>
										<td id="bWriter" title="${list.bNum }">${list.bWriter }(남자)</td>
									</c:otherwise>
								</c:choose>
								
							</c:if>
						</c:forEach>
						
<%-- 						<td id="bWriter" title="${list.bNum }">${list.bWriter }</td> --%>
						
						
						
<%-- 						<td id="sex" title="${list.bNum }">성별</td>						 --%>
						
						
						<td>${fn:substring(list.bTime, 5, 16) }</td>
						
						<c:if test="${list.bLocation == '서울특별시'}">
							<td>서울</td>
						</c:if>
						<c:if test="${list.bLocation == '인천광역시'}">
							<td>인천</td>
						</c:if>
						<c:if test="${list.bLocation == '경기도'}">
							<td>경기</td>
						</c:if>
						<c:if test="${list.bLocation == '강원도'}">
							<td>강원</td>
						</c:if>
						<c:if test="${list.bLocation == '충청북도'}">
							<td>충북</td>
						</c:if>
						<c:if test="${list.bLocation == '대전광역시'}">
							<td>대전</td>
						</c:if>
						<c:if test="${list.bLocation == '세종특별자치시'}">
							<td>세종</td>
						</c:if>
						<c:if test="${list.bLocation == '충청남도'}">
							<td>충남</td>
						</c:if>
						<c:if test="${list.bLocation == '전라북도'}">
							<td>전북</td>
						</c:if>
						<c:if test="${list.bLocation == '광주광역시'}">
							<td>광주</td>
						</c:if>
						<c:if test="${list.bLocation == '전라남도'}">
							<td>전남</td>
						</c:if>
						<c:if test="${list.bLocation == '대구광역시'}">
							<td>대구</td>
						</c:if>
						<c:if test="${list.bLocation == '경상북도'}">
							<td>경북</td>
						</c:if>
						<c:if test="${list.bLocation == '부산광역시'}">
							<td>부산</td>
						</c:if>
						<c:if test="${list.bLocation == '울산광역시'}">
							<td>울산</td>
						</c:if>
						<c:if test="${list.bLocation == '경상남도'}">
							<td>경남</td>
						</c:if>
						<c:if test="${list.bLocation == '제주특별자치도'}">
							<td>제주</td>
						</c:if>
						
						
<!-- 						<td> -->
<%-- 							<fmt:formatDate var="bWriteDate" --%>
<%-- 								value="${list.bWriteDate }" pattern="MM-dd HH:mm" /> --%>
<%-- 							${bWriteDate } --%>
<!-- 						</td> -->
						<td>${list.bReadCount }</td>
					</tr>
				</c:forEach>

			</c:if>

		</table>

		</div>
	
	</div>
	
	<div class="clear" style="height: 30px;"></div>
	
	<div id="writeAsk" align="center" style="overflow-y:scroll; height:250px;">
	
	<h4 align="left">내가 요청한 게시글 수 : ${writeAskCount }</h4>
	
	<div id="writeAskList">
<%-- 		<c:if test="${not empty boardPage.boardList }"> --%>		
			
<%-- 		</c:if> --%>

		<table>
			
			<tr>
			
				<th>목차</th>
				<th>글 상태</th>
				<!-- 만료 진행 -->
				

				<!--  -->
<!-- 				<th>글 번호</th> -->
				<!--  -->
				<th>제목</th>
				<th>작성자</th>
				<th>시간</th>
				<th>지역</th>
				
				
<!-- 				<th>성별</th> -->
<!-- 				<th>작성일자</th> -->
				<th>조회수</th>
			</tr>

			<c:if test="${empty writeAsk }">

				<tr>
					<td colspan="7">요청한 게시글이 없습니다.</td>
				</tr>
				
			</c:if>

			<c:set var="listNumAsk" value="${writeAskCount }" />
			<c:if test="${not empty writeAsk }">

				<c:forEach items="${writeAsk }" var="listAsk">

					<tr>
						<td>
							${listNumAsk } <c:set var="listNumAsk" value="${listNumAsk - 1 }" />
						</td>
						<td>
							<c:if test="${listAsk.bMatchCheck == 0 }">
								모집중
							</c:if> 
							<c:if test="${listAsk.bMatchCheck == 1 }">
								모집완료
							</c:if>
						</td>
						

						<!--  -->
<%-- 						<td>${list.bNum }</td> --%>
						<!--  -->
						<td><pre style="white-space: pre-wrap; word-wrap: break-word;"><a href="boardContent.do?bNum=${listAsk.bNum }"> ${listAsk.bTitle }</a></pre></td>
						
						<c:forEach items="${memberList }" var="mListAsk">
							<c:if test="${listAsk.bWriter == mListAsk.id}">
								<c:choose>
									<c:when test="${mListAsk.sex == 0 }">
										<td id="bWriter" title="${listAsk.bNum }">${listAsk.bWriter }(여자)</td>
									</c:when>
									<c:otherwise>
										<td id="bWriter" title="${listAsk.bNum }">${listAsk.bWriter }(남자)</td>
									</c:otherwise>
								</c:choose>
								
							</c:if>
						</c:forEach>
						
<%-- 						<td id="bWriter" title="${list.bNum }">${list.bWriter }</td> --%>
						
						
						
<%-- 						<td id="sex" title="${list.bNum }">성별</td>						 --%>
						
						
						<td>${fn:substring(listAsk.bTime, 5, 16) }</td>
						
						<c:if test="${listAsk.bLocation == '서울특별시'}">
							<td>서울</td>
						</c:if>
						<c:if test="${listAsk.bLocation == '인천광역시'}">
							<td>인천</td>
						</c:if>
						<c:if test="${listAsk.bLocation == '경기도'}">
							<td>경기</td>
						</c:if>
						<c:if test="${listAsk.bLocation == '강원도'}">
							<td>강원</td>
						</c:if>
						<c:if test="${listAsk.bLocation == '충청북도'}">
							<td>충북</td>
						</c:if>
						<c:if test="${listAsk.bLocation == '대전광역시'}">
							<td>대전</td>
						</c:if>
						<c:if test="${listAsk.bLocation == '세종특별자치시'}">
							<td>세종</td>
						</c:if>
						<c:if test="${listAsk.bLocation == '충청남도'}">
							<td>충남</td>
						</c:if>
						<c:if test="${listAsk.bLocation == '전라북도'}">
							<td>전북</td>
						</c:if>
						<c:if test="${listAsk.bLocation == '광주광역시'}">
							<td>광주</td>
						</c:if>
						<c:if test="${listAsk.bLocation == '전라남도'}">
							<td>전남</td>
						</c:if>
						<c:if test="${listAsk.bLocation == '대구광역시'}">
							<td>대구</td>
						</c:if>
						<c:if test="${listAsk.bLocation == '경상북도'}">
							<td>경북</td>
						</c:if>
						<c:if test="${listAsk.bLocation == '부산광역시'}">
							<td>부산</td>
						</c:if>
						<c:if test="${listAsk.bLocation == '울산광역시'}">
							<td>울산</td>
						</c:if>
						<c:if test="${listAsk.bLocation == '경상남도'}">
							<td>경남</td>
						</c:if>
						<c:if test="${listAsk.bLocation == '제주특별자치도'}">
							<td>제주</td>
						</c:if>
						
						
<!-- 						<td> -->
<%-- 							<fmt:formatDate var="bWriteDateAsk" --%>
<%-- 								value="${listAsk.bWriteDate }" pattern="MM-dd HH:mm" /> --%>
<%-- 							${bWriteDateAsk } --%>
<!-- 						</td> -->
						
						<td>${listAsk.bReadCount }</td>
					</tr>
				</c:forEach>

			</c:if>

		</table>

		</div>
	
	
	</div>
	
	<div class="clear" style="height: 30px;"></div>
	
	<div id="writeAccept" align="center" style="overflow-y:scroll; height:250px;">
	
	<h4 align="left">수락된 게시글 수 : ${writeAcceptCount }</h4>
	
	<div id="writeAcceptList">
<%-- 		<c:if test="${not empty boardPage.boardList }"> --%>		
			
<%-- 		</c:if> --%>

		<table>
			
			<tr>
			
				<th>목차</th>
				<th>글 상태</th>
				<!-- 만료 진행 -->
				

				<!--  -->
<!-- 				<th>글 번호</th> -->
				<!--  -->
				<th>제목</th>
				<th>작성자</th>
				<th>시간</th>
				<th>지역</th>
				
				
<!-- 				<th>성별</th> -->
<!-- 				<th>작성일자</th> -->
				<th>조회수</th>
			</tr>

			<c:if test="${empty writeAccept }">

				<tr>
					<td colspan="7">수락된 게시글이 없습니다.</td>
				</tr>
				
			</c:if>

			<c:set var="listNumAccept" value="${writeAcceptCount }" />
			<c:if test="${not empty writeAccept }">

				<c:forEach items="${writeAccept }" var="listAccept">

					<tr>
						<td>
							${listNumAccept } <c:set var="listNumAccept" value="${listNumAccept - 1 }" />
						</td>
						<td>
							<c:if test="${listAccept.bMatchCheck == 0 }">
								모집중
							</c:if> 
							<c:if test="${listAccept.bMatchCheck == 1 }">
								모집완료
							</c:if>
						</td>
						

						<!--  -->
<%-- 						<td>${list.bNum }</td> --%>
						<!--  -->
						<td><pre style="white-space: pre-wrap; word-wrap: break-word;"><a href="boardContent.do?bNum=${listAccept.bNum }">${listAccept.bTitle }</a></pre></td>
						
						<c:forEach items="${memberList }" var="mListAccept">
							<c:if test="${listAccept.bWriter == mListAccept.id}">
								<c:choose>
									<c:when test="${mListAccept.sex == 0 }">
										<td id="bWriter" title="${listAccept.bNum }">${listAccept.bWriter }(여자)</td>
									</c:when>
									<c:otherwise>
										<td id="bWriter" title="${listAccept.bNum }">${listAccept.bWriter }(남자)</td>
									</c:otherwise>
								</c:choose>
								
							</c:if>
						</c:forEach>
						
<%-- 						<td id="bWriter" title="${list.bNum }">${list.bWriter }</td> --%>
						
						
						
<%-- 						<td id="sex" title="${list.bNum }">성별</td>						 --%>
						
						
						<td>${fn:substring(listAccept.bTime, 5, 16) }</td>
						
						<c:if test="${listAccept.bLocation == '서울특별시'}">
							<td>서울</td>
						</c:if>
						<c:if test="${listAccept.bLocation == '인천광역시'}">
							<td>인천</td>
						</c:if>
						<c:if test="${listAccept.bLocation == '경기도'}">
							<td>경기</td>
						</c:if>
						<c:if test="${listAccept.bLocation == '강원도'}">
							<td>강원</td>
						</c:if>
						<c:if test="${listAccept.bLocation == '충청북도'}">
							<td>충북</td>
						</c:if>
						<c:if test="${listAccept.bLocation == '대전광역시'}">
							<td>대전</td>
						</c:if>
						<c:if test="${listAccept.bLocation == '세종특별자치시'}">
							<td>세종</td>
						</c:if>
						<c:if test="${listAccept.bLocation == '충청남도'}">
							<td>충남</td>
						</c:if>
						<c:if test="${listAccept.bLocation == '전라북도'}">
							<td>전북</td>
						</c:if>
						<c:if test="${listAccept.bLocation == '광주광역시'}">
							<td>광주</td>
						</c:if>
						<c:if test="${listAccept.bLocation == '전라남도'}">
							<td>전남</td>
						</c:if>
						<c:if test="${listAccept.bLocation == '대구광역시'}">
							<td>대구</td>
						</c:if>
						<c:if test="${listAccept.bLocation == '경상북도'}">
							<td>경북</td>
						</c:if>
						<c:if test="${listAccept.bLocation == '부산광역시'}">
							<td>부산</td>
						</c:if>
						<c:if test="${listAccept.bLocation == '울산광역시'}">
							<td>울산</td>
						</c:if>
						<c:if test="${listAccept.bLocation == '경상남도'}">
							<td>경남</td>
						</c:if>
						<c:if test="${listAccept.bLocation == '제주특별자치도'}">
							<td>제주</td>
						</c:if>
						
						
<!-- 						<td> -->
<%-- 							<fmt:formatDate var="bWriteDateAsk" --%>
<%-- 								value="${listAsk.bWriteDate }" pattern="MM-dd HH:mm" /> --%>
<%-- 							${bWriteDateAsk } --%>
<!-- 						</td> -->
						
						<td>${listAccept.bReadCount }</td>
					</tr>
				</c:forEach>

			</c:if>

		</table>

		</div>
	
	</div>
	
	</div>
	
<!-- </body> -->
<!-- </html> -->

<%@ include file="../../footer.jsp"%>