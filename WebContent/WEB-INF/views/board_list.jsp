<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="../../header.jsp"%>

<style type="text/css">

#board_list {
	width: 1000px;
 	text-align: center;
 	margin-left: auto;
 	margin-right: auto;
 	
 	border: 1px solid #f972b6;
	border-collapse: collapse;
 	
/*  	background-color: #ffe6ff; */
}

#boardListForm{
	min-height: 350px;
}

#boardListTable{
	width: 100%;
	text-align: center;
	background-color: #ffe6ff;
}

#boardListTable td:nth-child(3) {
	width: 500px;
	text-align: left;
	padding-left: 5px;
	padding-right: 5px;
}


#boardListTable td:nth-child(4) {
	width: 200px;
}

#boardListSearchForm select, #boardListSearchForm input{
	height: 30px;
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


</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		$('#sex').hide();
		$('#sex').attr('name', 'keywordInt');
		
		$('#bMatchCheck').hide();
		$('#bMatchCheck').attr('name', 'keywordInt');
		
		$('#startDateDiv').hide();
		$('#startDateDiv .form-control').attr('name', 'start');
		$('#startDateDiv .form-control').attr('required', false);
		
		$('#wave').hide();
		
		$('#endDateDiv').hide();
		$('#endDateDiv .form-control').attr('name', 'end');
		$('#endDateDiv .form-control').attr('required', false);
		
		$('select[name="searchArticle"]').on("change", function(){
	        
			if($(this).val() == 'sex') {
				
				$('#string').hide();
				$('#string').attr('name', 'keywordString');
				$('#string').attr('required', false);
				
				$('#sex').show();
				$('#sex').attr('name', 'searchKeywordInt');
								
				$('#bMatchCheck').hide();
				$('#bMatchCheck').attr('name', 'keywordInt');
				
				$('#startDateDiv').hide();
				$('#startDateDiv .form-control').attr('name', 'start');
				$('#startDateDiv .form-control').attr('required', false);
				
				$('#wave').hide();
				
				$('#endDateDiv').hide();
				$('#endDateDiv .form-control').attr('name', 'end');
				$('#endDateDiv .form-control').attr('required', false);
				
			} else if($(this).val() == 'bMatchCheck') {
				
				$('#string').hide();
				$('#string').attr('name', 'keywordString');
				$('#string').attr('required', false);
				
// 				alert($('#string').attr('name'));
				
				$('#sex').hide();
				$('#sex').attr('name', 'keywordInt');

				
				$('#bMatchCheck').show();
				$('#bMatchCheck').attr('name', 'searchKeywordInt');
				
				$('#startDateDiv').hide();
				$('#startDateDiv .form-control').attr('name', 'start');
				$('#startDateDiv .form-control').attr('required', false);
				
				$('#wave').hide();
				
				$('#endDateDiv').hide();
				$('#endDateDiv .form-control').attr('name', 'end');
				$('#endDateDiv .form-control').attr('required', false);
				
			} else if($(this).val() == 'bTime') {
				
				$('#string').hide();
				$('#string').attr('name', 'keywordString');
				$('#string').attr('required', false);
				
				$('#sex').hide();
				$('#sex').attr('name', 'keywordInt');
				
				$('#bMatchCheck').hide();
				$('#bMatchCheck').attr('name', 'keywordInt');
				
				$('#startDateDiv').show();
				$('#startDateDiv .form-control').attr('name', 'startDate');
				$('#startDateDiv .form-control').attr('required', true);
				
				$('#wave').show();
				
				$('#endDateDiv').show();
				$('#endDateDiv .form-control').attr('name', 'endDate');
				$('#endDateDiv .form-control').attr('required', true);

				
			} else {
				$('#string').show();
				$('#string').attr('name', 'searchKeywordString');
				$('#string').attr('required', true);
				
				$('#sex').hide();
				$('#sex').attr('name', 'keywordInt');
				
				$('#bMatchCheck').hide();
				$('#bMatchCheck').attr('name', 'keywordInt');
				
				$('#startDateDiv').hide();
				$('#startDateDiv .form-control').attr('name', 'start');
				$('#startDateDiv .form-control').attr('required', false);
				
				$('#wave').hide();
				
				$('#endDateDiv').hide();
				$('#endDateDiv .form-control').attr('name', 'end');
				$('#endDateDiv .form-control').attr('required', false);

			}
			

	    });
		

		
	})

</script>

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/moment.min.js"></script>
<script type="text/javascript" src="js/locales.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />

	<div id="tempHe" style="height: 100px;"></div>

	<div id="board_list">
	
	<div id="boardListForm">

<%-- 		<c:if test="${not empty boardPage.boardList }"> --%>
		
		<h4>
			<c:choose>
				<c:when test="${searchCheck == 'y'}">
					검색 게시글 수 : ${boardPage.boardCount }
				</c:when>
				<c:otherwise>
					총 게시글 수 : ${boardPage.boardCount }
				</c:otherwise>
			</c:choose>
		</h4>	
			
<%-- 		</c:if> --%>

		<table style="width: 100%">
			<tr>
				<td align="left">
					<button onclick="location.href='boardList.do'">전체 목록</button>
				</td>	
				<td align="right">
					<button onclick="location.href='boardWriteForm.do'">글쓰기</button>
				</td>
			</tr>
		
		</table>

		<table id="boardListTable">
			
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

			<c:if test="${empty boardPage.boardList }">
				<c:choose>
					<c:when test="${searchCheck == 'y'}">
						<tr>
							<td colspan="7">검색된 게시글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">작성된 게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
			</c:choose>
				
			</c:if>

			<c:set var="listNum" value="${boardPage.listNum }" />
			<c:if test="${not empty boardPage.boardList }">

				<c:forEach items="${boardPage.boardList }" var="list">

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
						<td><pre style="white-space: pre-wrap; word-wrap: break-word;"><a href="boardContent.do?bNum=${list.bNum }&page=${boardPage.currentPage}">${list.bTitle }</a></pre></td>
						
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
		
	<div id="boardListPageForm" align="center">
		<c:if test="${boardPage.startPage>1 }">
			<a href="boardList.do?page=${boardPage.startPage-1 }"> [이전] </a>
		</c:if>

		<c:forEach begin="${boardPage.startPage }" end="${boardPage.endPage }"
			var="i">

			<a href="boardList.do?page=${i }">[${i }]</a>

		</c:forEach>

		<c:if test="${boardPage.endPage<boardPage.totalPage }">
			<a href="boardList.do?page=${boardPage.endPage+1 }"> [다음] </a>
		</c:if>

	</div>
	
	<div class="clear"></div>

	<div align="center" id="boardListSearchForm">

		<form action="boardList.do" method="post">
		
		<table>
			<tr>
				<td>
					
					<select name="searchArticle" style="margin: 0px; padding: 0px; display: inline-block;">
						<option selected="selected">---------------</option>
						<option value="bMatchCheck">모집현황</option>
						<option value="bTitle">제목</option> <!-- searchKeywordString -->
						<option value="bContent">내용</option> <!-- searchKeywordString -->
						<option value="bWriter">작성자 ID</option> <!-- searchKeywordString -->
						<option value="sex">작성자 성별</option>
						<option value="bLocation">지역</option> <!-- searchKeywordString -->
						<option value="bTime">시간</option>
					</select>
				
				</td>
				
				<td>
				
					<div class="searchContent" style="margin:0px; padding:0px; display: inline-block;">	
						<input type="text" id="string" name="searchKeywordString" required="required">
					</div>
					<div class="searchContent" style="display: inline-block;">
						<select id="sex" name="searchKeywordInt">
							<option value="0">여자</option>
							<option value="1">남자</option>
						</select>
					</div>
					<div class="searchContent" style="margin:0px; padding:0px; display: inline-block;">
						<select id="bMatchCheck" name="searchKeywordInt">
							<option value="0">모집중</option>
							<option value="1">모집완료</option>
						</select>
					</div>	
				
					<div class="searchContent" style="display: inline-block;">	
				
						<div class="form-group" style="width: 200px; margin: 0px; padding: 0px; display: inline-block;" id="startDateDiv">
               				<div class='input-group date' id='datetimepicker1'>
                    				
                    			<span class="input-group-addon">
                        			<span class="glyphicon glyphicon-calendar"></span>
                    			</span>
                				<input type="text" class="form-control" name="startDate" required="required"/>
                			</div>
            			</div>
            			<script type="text/javascript">
            				$(function () {
                				$('#datetimepicker1').datetimepicker({
                					
                					format : "YYYY-MM-DD HH:mm",
                					showClose:true,
                    				showClear:true
                				
                					});
            				});
        				</script>
				
					<span id="wave"> ~ </span>
					
						<div class="form-group" style="width: 200px; margin: 0px; padding: 0px; display: inline-block;" id="endDateDiv">
               				<div class='input-group date' id='datetimepicker2' style="padding: 0; margin: 0;">
                    				
                    			<span class="input-group-addon">
                        			<span class="glyphicon glyphicon-calendar"></span>
                    			</span>
                				<input type="text" class="form-control" name="endDate" required="required"/>
                			</div>
            			</div>
            			<script type="text/javascript">
            				$(function () {
                				$('#datetimepicker2').datetimepicker({
                					
                					format : "YYYY-MM-DD HH:mm",
                					showClose:true,
                    				showClear:true
                				
                					});
            				});
        				</script>
				
					</div>
				
				</td>
				
				<td>
					<input type="submit" value="검색">
				</td>
			</tr>
		</table>

	</form>
		
	</div>	

	</div>


<%@ include file="../../footer.jsp"%>
