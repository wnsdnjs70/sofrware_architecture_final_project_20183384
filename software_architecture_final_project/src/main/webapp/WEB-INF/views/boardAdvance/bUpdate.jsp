<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bUpdate</title>
</head>
<body>
	<div align="center" style="padding-top: 100px">
		<form action="boardUpdate" method="post">
			<div class="bs-docs-section">
				<div class="row">
					<div class="col-lg-12">
						<div class="page-header" align="center">
							<h1>게시글 수정</h1>
							<br>
						</div>
						<div class="bs-component">
							<table class="table table-hover" style="width: 700px;">
								<tr class="table-default">
									<td>글쓴이</td>
									<td>${boardAdvanceDto.writer}</td>
								</tr>
								<tr class="table-default">
									<td>등록 날짜</td>
									<td><fmt:formatDate value="${boardAdvanceDto.regDate}" pattern="yyyy-MM-dd"/></td>
								</tr>
								<tr class="table-default">
									<td>제목</td>
									<td><input type="text" class="form-control" name="subject" value="${boardAdvanceDto.subject}" /></td>
								</tr>
								<tr class="table-default">
									<td><span style="color: red">*</span> 비밀번호</td>
									<td><input type="password" class="form-control" name="password" /></td>
								</tr>
								<tr class="table-default">
									<td>본문</td>
									<td><textarea rows="10" cols="60" name="content">${boardAdvanceDto.content}</textarea></td>
								</tr>
								<tr class="table-default" align="center">
									<td colspan="4">
										<input type="hidden" name="num" value="${boardAdvanceDto.num}" /> 
										<input type="submit" class="btn btn-primary btn-sm" value="수정" />
										<input type="button" class="btn btn-primary btn-sm" onclick="location.href='${contextPath }/boardAdvance/boardList'" value="메인" />
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
</body>
</html>