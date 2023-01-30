<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<hr>
	<div class="w3-container">
	<h3 class="23-center">${boardName}[${boardid}]</h3>
		<c:if test="${boardCount == 0 }">
		
			<p>등록된 게시물이 없습니다</p>
			</c:if>
	
	<a class="23-button w3-right w3-grey"
			href="${pageContext.request.contextPath}/board/boardForm">게시판 입력</a>
		<table
			class="w3-table-all w3-bordered w3-striped w3-border test w3-hoverable"
			style="color: #000">
			<tbody>
				<tr class="w3-grey">
					<th>번호</th>
					<th>이름</th>
					<th>제목</th>
					<th>내용</th>
					<th>파일</th>
					<th>입력일</th>
					<th>조회수</th>
				</tr>
			</tbody>
			<tbody>
				<c:forEach var="b" items = "${list}">
				<tr>
					<td>${b.num}</td><td>
					<c:if test="${b.reflevel > 0 }">
					<img src="<%=request.getContextPath() %>/view/community/level.gif" width="${5*b.reflevel}px">
					<img src="<%=request.getContextPath() %>/view/community/re.gif" >					
					</c:if>
					
					
										
					${b.name}</td>
					<td><a href="${pageContext.request.contextPath}/community/boardInfo?num=${b.num}">${b.subject}</a></td>
					<td>${b.content}</td>
					<td>${b.file1}</td>
					<td>${b.regdate}</td>
					<td>${b.readcnt}</td>
				</tr>				
				</c:forEach>
			</tbody>
		</table>
		<br>
		<div class="w3-bar w3-center w3-small">
		<c:if test="${startPage <= bottomLine}">
		<a href="#" class="w3-button w3-disabled">[이전]</a></c:if>
		<c:if test="${startPage > bottomLine}">
		<a href="${pageContext.request.contextPath}/community/boardList?pageNum=${startPage-1}" class="w3-button">[이전]
		</a></c:if>
		
		<c:forEach var="p"  begin="${startPage}" end="${endPage}">
		<a href="${pageContext.request.contextPath}/community/boardList?pageNum=${p}"
		class="w3-button <c:if test="${p==pageInt}"> w3-red </c:if>  ">
		${p}</a> &nbsp;		
		</c:forEach>
		
		
		<c:if test="${endPage >= maxPage}">
		<a href="#" class="w3-button w3-disabled">[다음]</a></c:if>
		<c:if test="${endPage < maxPage}">
		<a href="${pageContext.request.contextPath}/community/boardList?pageNum=${endPage+1}"
		 class="w3-button">[다음]</a></c:if>
		</div>	
		
	</div>
</body>
</html>