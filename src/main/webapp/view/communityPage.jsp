<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소식 게시판</title>
</head>
<body>

<link rel="stylesheet" href = "${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<style>
div{
	padding : 0.1rem;
}
a{
	text-decoration-line: none;
	text-decoration : none;
}
.container{
	background-color : lightgreen; 
	max-width : 70rem;	
	margin-top : 1rem;
	margin-bottom : 1rem; 
	padding-top : 1rem;

}

.picarea{
	min-width : 250px;
	min-height : 250px;
	margin-top : 0.5rem;
}
.wrap{
	justify-content: space-evenly;
	flex-direction: row;
}
</style>
<div class="container">

<ul class="nav nav-pills" style = "justify-content : space-around;">
  <li>	</li>
  <li>	</li>
  <li class="nav-item">
    <a class="nav-link" href="#">자유 게시판</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">같이 봉사해요</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">정보 공유해요</a>
  </li>
   <li>	</li>
   <li>	</li>
</ul>
<br>

<a href="${pageContext.request.contextPath}/community/boardForm">
	<button type="button" class="btn" style="margin-left : 55rem">글작성</button>
</a>
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
<c:forEach var="b" items="${list}">
					<tr>
					    <td>${b.num}</td> <td>		    
					    			    
						${b.ref},${b.reflevel},${b.refstep},${b.name}</td>
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
		<a href="#"  class="w3-button  w3-disabled ">[이전]</a> </c:if>
		<c:if test="${startPage > bottomLine}">
		<a href="${pageContext.request.contextPath}/board/boardList?pageNum=${startPage-1}"  
		class="w3-button  ">[이전]</a> </c:if>
		
		<c:forEach   var="p"    begin="${startPage}"   end="${endPage}">
		 <a href="${pageContext.request.contextPath}/community/boardList?pageNum=${p}" 
		 class="w3-button <c:if test="${p==pageInt}"> w3-red </c:if>  ">
		 ${p} </a> &nbsp;		
		</c:forEach>
		
		
		<c:if test="${endPage >= maxPage}">
		<a href="#"  class="w3-button  w3-disabled ">[다음]</a></c:if>
		<c:if test="${endPage < maxPage}">
		<a href="${pageContext.request.contextPath}/community/boardList?pageNum=${endPage+1}"  
		class="w3-button ">[다음]</a> </c:if>
		
		</div>
		
		
	</div>
</body>
</html>