<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>BoardList</title>
<script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
<script>

	$().ready(function(){
		
		$("#onePageViewCount").change(function(){
			
			var onePageViewCount = $("#onePageViewCount").val();
			var searchKeyword = $("#searchKeyword").val();
			var searchWord = $("#searchWord").val();
			var url = "${contextPath}/boardAdvance/boardList?";
				url	+= "onePageViewCount="+onePageViewCount;
				url	+= "&searchKeyword="+searchKeyword;
				url	+= "&searchWord="+searchWord;
			
			location.href = url;
			
		}) ;
		
		
		$("#getSearchBoard").click(function(){
			
			var onePageViewCount = $("#onePageViewCount").val();
			var searchKeyword = $("#searchKeyword").val();
			var searchWord = $("#searchWord").val();
			var url = "${contextPath}/boardAdvance/boardList?";
				url +="onePageViewCount="+onePageViewCount;
				url += "&searchKeyword="+searchKeyword;
				url += "&searchWord="+searchWord;
			
				location.href=url;
		});
			
		
	});
	
</script>
	</head>
         <div class="container-fluid">
             <h3 class="mt-4">Spring MVC2 게시판 구현하기 </h3>
             <ol class="breadcrumb mb-4">
                 <li class="breadcrumb-item"><a href="${contextPath }/boardAdvance/boardList">메인화면</a></li>
                 <li class="breadcrumb-item active">20183384 서준원</li>
             </ol>
             <div class="card mb-4">
                 <div class="card-body">
                 	<h5>주요 기능</h5>
                     1) 새로운 글 쓰기<br>
                     2) 게시글 열람, 수정, 삭제<br>
                     3) 페이징 기능<br>
                     4) 검색 기능<br>
                     5) 테스트 데이터 생성 > <a href="${contextPath }/boardAdvance/makeDummyData">테스트용 더미파일 만들기(최초 1회만 시행할 것)</a><br>
                 </div>
             </div>
             <div class="card mb-4">
                 <div class="card-header">
                     <i class="fas fa-table mr-1"></i>
                     총 <span style="color: red; font-weight: bold">${totalBoardCount}</span> 개의 게시글이 있습니다. 
                 </div>
                 <div class="card-body">
                     <div class="table-responsive">
                     	<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                         	<div class="row">
                         		<div class="col-sm-12 col-md-6">
                         			<div class="dataTables_length" id="dataTable_length">
                         				<label>${onePageViewCount}개씩 보기 
                          				<select id="onePageViewCount" name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
                          					<option <c:if test="${onePageViewCount eq 5}"> selected</c:if> value="5">5</option>
											<option <c:if test="${onePageViewCount eq 7}"> selected</c:if> value="7">7</option>
											<option <c:if test="${onePageViewCount eq 10}"> selected</c:if> value="10">10</option>
                          				</select> 
                          				</label>
                          			</div>		                               
                       			</div>
                       			<div class="col-sm-12 col-md-6">
                       				<input type="button" class="btn btn-primary" style="float: right" value="글 쓰기" onclick="location.href='${contextPath }/boardAdvance/boardWrite'">
                       			</div>
                       		</div>
                          <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                              <colgroup>
								<col width="10%">
								<col width="40%">
								<col width="20%">
								<col width="20%">
								<col width="10%">
							  </colgroup>
				              <thead>                                     
                                  <tr align="center">
                                      <th>번호</th>
                                      <th>제목</th>
                                      <th>글쓴이</th>
                                      <th>등록 날짜</th>
                                      <th>조회수</th>
                                  </tr>
                              </thead>
                              <tbody align="center">
                                  <c:set var="order" value="${totalBoardCount - (currentPageNumber-1) * onePageViewCount}"/>
                                  <c:forEach var="boardAdvanceDto" items="${boardList}">	                                        	
									<tr>
										<td>${order}</td>
										<c:set var="order" value="${order - 1}"/>
										<td>
											 <c:if test="${boardAdvanceDto.reStep > 1}">
											 	<c:forEach var="j" begin="0" end="${(boardAdvanceDto.reLevel-1 ) * 5 }">
											 		&nbsp;
											 	</c:forEach>
											 	»
											 </c:if>
											<a href="${contextPath }/boardAdvance/boardInfo?num=${boardAdvanceDto.num}"> ${boardAdvanceDto.subject}</a>
										</td>
										
										<td>${boardAdvanceDto.writer}</td>
										<td><fmt:formatDate value="${boardAdvanceDto.regDate}" pattern="yyyy-MM-dd"/></td>
										<td>${boardAdvanceDto.readCount}</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="5" align="center">	
										<select id="searchKeyword" class="form-control" style="width: 150px; display: inline;">
											<option <c:if test="${searchKeyword eq 'total'}"> selected</c:if> value="total">글 전체</option>
											<option <c:if test="${searchKeyword eq 'writer'}"> selected</c:if> value="writer">글쓴이</option>
											<option <c:if test="${searchKeyword eq 'subject'}"> selected</c:if> value="subject">제목</option>
										</select>
				                             		<input type="text" style="width: 300px; display: inline;" class="form-control" id="searchWord" name="searchWord" value="${searchWord}" >
										<input type="button" class="btn btn-outline-info btn-sm" value="검색" id="getSearchBoard">
									</td>
								</tr>
                              </tbody>										
                          </table>
                         	<div style="display: table; margin-left: auto; margin-right: auto">
                          	<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                          		<c:if test="${totalBoardCount gt 0 }">
                           		<ul class="pagination">
                           			<c:if test="${startPage gt 10 }">
                             			<li class="paginate_button page-item previous" id="dataTable_previous">
                             				<a href="${contextPath }/boardAdvance/boardList?currentPageNumber=${startPage - 10}&onePageViewCount=${onePageViewCount}&searchKeyword=${searchKeyword}&searchWord=${searchWord}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                             			</li>
                           			</c:if>
                           			<c:forEach var="i" begin="${startPage}" end="${endPage }" >
                             			<li class="paginate_button page-item">
                             				<a href="${contextPath }/boardAdvance/boardList?currentPageNumber=${i}&onePageViewCount=${onePageViewCount}&searchKeyword=${searchKeyword}&searchWord=${searchWord}" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">${i}</a>
                             			</li>
                             		</c:forEach>
                           			<c:if test="${endPage le totalBoardCount && endPage ge 10}"> 
                             			<li class="paginate_button page-item next" id="dataTable_next">
                             				<a href="${contextPath }/boardAdvance/boardList?currentPageNumber=${startPage + 10}&onePageViewCount=${onePageViewCount}&searchKeyword=${searchKeyword}&searchWord=${searchWord}" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">다음</a>
                             			</li>
                           			</c:if>
                           		</ul>
                           	</c:if>
                          	</div>
                          </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
</body>
</html>