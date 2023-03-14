<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Give 같이 하는 가치</title>

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
	/* background-color : lightgreen; */ 
	min-width : 76rem;	
	margin-top : 1rem;
	margin-bottom : 1rem;
	padding-top : 1rem;

}
.row{	
	justify-content : space-evenly;
}
.img{	
	width : 250px;
	height : 250px;
	margin-left : 1rem;
}
.picarea{
	min-width : 250px;
	min-height : 250px;
	/* background-color : yellow;  */
	margin-top : 0.5rem;
}

</style>

<div class="container">
	<a href="${pageContext.request.contextPath}/donation/donation">
	<h1 >기부</h1>
	</a>
  <div class="row">

<c:forEach var="dona" items="${listdona}">
    <div class="card d-flex bg-secondary mb-3" style="max-width: 18rem;">
<a href="${pageContext.request.contextPath}/donation/donationInfo?num=${dona.index_num}">
      <div class="picarea" style = "color:black">
      <img class = "img" src="${pageContext.request.contextPath}/view/donation/img/${dona.picture}" alt="등록된 사진이 없습니다.">
      </div>
      <div class="card-body">
       <p class="card-text"> <strong>${dona.title}</strong></p>
        <div class="progress">
          <div class="progress-bar" role="progressbar" style="width: ${dona.raised/dona.goal*100}%;" aria-valuenow="${dona.raised/dona.goal*100}" aria-valuemin="0" aria-valuemax="100"></div>
      </div>
      <div class="row" style="justify-content: space-between;">
     <div class="text-success" style="max-width: 30%"><strong><fmt:formatNumber type="percent" value=" ${dona.raised/dona.goal}" pattern="0%"/></strong></div>
          <div class ="text" style="max-width: 70%;" align="right"><fmt:formatNumber value="${dona.raised}" type="currency"/></div>
        </div></div>
  </a>
    </div>
</c:forEach>

  </div>
</div>








</body>
</html>
