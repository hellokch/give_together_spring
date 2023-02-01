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
    <a class="nav-link" href="#">진행중인 기부</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">지난 기부</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">_공란_</a>
  </li>
   <li>	</li>
   <li>	</li>
</ul>
<br>
	<a href="${pageContext.request.contextPath}/donation/donationForm">
	<button type="button" class="btn" style="margin-left : 55rem">글쓰기(단체)</button>
	</a>

	<!-- 조건이 날짜가 지나지 않은것,지난것
	     시작~끝 갯수(보드카운트)
	     시작 ?필요함? 1~3 1~6 1~9
	     시작은 1고정
	     
	     1~(i*3)
	 -->      
	     

<c:forEach var="card" items="${list}" varStatus="status">
  <c:if test="${status.index % 3 == 0}">
    <div class="row">
  </c:if>
  <div class="col-sm-4">
    <div class="card text-white bg-primary mb-3" style="max-width: 18rem;">
      <div class="picarea" style = "color:black">사진영역</div>
      <div class="card-body">
        <p class="card-text">${card.context}번째 글</p>
        <div class="progress">
          <div class="progress-bar" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <p class="card-text">-----------------------</p>
      </div>
    </div>
  </div>
  <c:if test="${status.index % 3 == 2}">
    </div>
  </c:if>
</c:forEach>




<button type="button" class="btn" style = "width : 68rem" 
onclick="location.href='${pageContext.request.contextPath}/donation/donation?last=${end+1}'">더보기</button>

</div>
  
  
  



</body>
</html>