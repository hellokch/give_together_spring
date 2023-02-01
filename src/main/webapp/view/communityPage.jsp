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




</body>
</html>