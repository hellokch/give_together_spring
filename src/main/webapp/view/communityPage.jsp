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
<c:if test="${sessionScope.id != null and sessionScope.kinds eq '1'}">
<a href="${pageContext.request.contextPath}/community/boardForm">
	<button type="button" class="btn" style="margin-left : 55rem">글작성</button>
</a>
</c:if>



<c:forEach var="com" items="${list}" varStatus="status">
  <c:if test="${status.index % 3 == 0}">
    <div class="row">
  </c:if>
  <div class="col-sm-4">
  <a href="${pageContext.request.contextPath}/community/boardInfo?num=${com.index_num}">
    <div class="card text-white bg-primary mb-3" style="max-width: 20rem;">
      <div class="picarea" style = "color:black" >
      <img class = "img" src="${pageContext.request.contextPath}/view/community/img/${com.picture}" style="max-width: 19.5rem;" >
      </div>
      <div class="card-body">
        <p class="card-text">제목 :${com.title}      작성자: ${com.id} </p>
      
        <p class="card-text">내용 : ${com.context}</p>
        
        
        <p class="card-text">작성일 :</p> 
        <p class="card-text"> ${com.not_date}</p>
       
      </div>
    </div>
  </a>
  </div>
  <c:if test="${status.index % 3 == 2}">
    </div>
  </c:if>
</c:forEach>




<button type="button" class="btn" style = "width : 68rem" 
onclick="location.href='${pageContext.request.contextPath}/community/community?last=${end+1}'">더보기</button>

</div>
  
  
  



</body>
</html>