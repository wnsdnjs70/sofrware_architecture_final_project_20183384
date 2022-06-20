<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bInfo</title>
</head>
<body>
	<div align="center" style="padding-top: 100px">
		<div class="bs-docs-section">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-header" align="center">
						<h1>게시글 정보</h1>
						<br>
					</div>
					<div class="bs-component">
						<table class="table table-hover" style="width: 700px; text-align: center">
							<colgroup>
								<col width="20%" >
								<col width="80%">
							</colgroup>
							<tr class="table-default">
								<td>게시글 번호</td>
								<td>${boardAdvanceDto.num}</td>
							</tr>
							<tr class="table-default">
								<td>조회수</td>
								<td>${boardAdvanceDto.readCount}</td>
							</tr>
							<tr class="table-default">
								<td>글쓴이</td>
								<td>${boardAdvanceDto.writer}</td>
							</tr>
							<tr class="table-default">
								<td>등록 날짜</td>
								<td><fmt:formatDate value="${boardAdvanceDto.regDate}" pattern="yyyy-MM-dd"/></td>
							</tr>
							<tr class="table-default">
								<td>이메일</td>
								<td>${boardAdvanceDto.email}</td>
							</tr>
							<tr class="table-default">
								<td>제목</td>
								<td>${boardAdvanceDto.subject}</td>
							</tr>
							<tr class="table-default">
								<td>본문</td>
								<td>${boardAdvanceDto.content}</td>
							</tr>
							<tr class="table-default">
								<td colspan="2">
									<input type="button" class="btn btn-primary btn-sm" value="댓글" onclick="location.href='${contextPath }/boardAdvance/boardReplyWrite?num=${boardAdvanceDto.num}'"> 
									<input type="button" class="btn btn-primary btn-sm" value="수정" onclick="location.href='${contextPath }/boardAdvance/boardUpdate?num=${boardAdvanceDto.num}'">
									<input type="button" class="btn btn-primary btn-sm" value="삭제" onclick="location.href='${contextPath }/boardAdvance/boardDelete?num=${boardAdvanceDto.num}'">
									<input type="button" class="btn btn-primary btn-sm" value="메인" onclick="location.href='${contextPath }/boardAdvance/boardList'">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>