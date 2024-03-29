<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu bar</title>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>
li{
	font-size : 1.1rem;
} 
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style = "background-color : sky" >
  <div class="container-fluid" >
   
 
    <a href ="${pageContext.request.contextPath}/giveTogether/main">
    <img src="${pageContext.request.contextPath}/common/logo.png"/></a>
   
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/donation/donation">&nbsp;&nbsp;&nbsp;기부	</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/volunteer/volunteerList">&nbsp;&nbsp;&nbsp;봉사</a>
        </li>
       <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/community/community">&nbsp;&nbsp;&nbsp;소식</a>
        </li>
        
        <c:if test="${sessionScope.id == null }">
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/giveTogether/loginForm">&nbsp;&nbsp;&nbsp;로그인</a>
        </li>
        </c:if>
        
        <c:if test="${sessionScope.id != null and sessionScope.kinds eq 1}">
	        <li class="nav-item">
	          <a class="nav-link active" href="${pageContext.request.contextPath}/mypage/userPersonInfo">&nbsp;&nbsp;&nbsp;마이페이지(개인)</a>
	        </li>
	     </c:if>
	     <c:if test="${sessionScope.id != null and sessionScope.kinds eq '2'}">
	        <li class="nav-item">
	         <a class="nav-link active" href="${pageContext.request.contextPath}/mypage/userGroupInfo">&nbsp;&nbsp;&nbsp;마이페이지(단체)</a>
	        </li>
	        </c:if>
	        
	      <c:if test="${sessionScope.id != null}">   
	        <li class="nav-item">
	          <a class="nav-link active" href="${pageContext.request.contextPath}/giveTogether/logout">&nbsp;&nbsp;&nbsp;로그아웃</a>
	        </li>
       	 </c:if>
      </ul>
        
        </div>
        
    </div>
  </div>
</nav>

</body>
</html>