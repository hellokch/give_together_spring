<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<a href="${pageContext.request.contextPath}/giveTogether/donation">
	<h1 >기부 영역</h1>
	</a>
  <div class="row">
  
<c:if test="dona1"> 
<a href="#">
<%-- <a href="${pageContext.request.contextPath}/donation/donationInfo?num=${dona.index_num}"> --%>
<div class="card bg-secondary mb-3" style="max-width: 18rem;">
  <div class="picarea" style = "color:black">
<img class = "img" src="${pageContext.request.contextPath}/view/donation/img/${dona1.picture}"></div>
  <div class="card-body">
    <p class="card-text">${dona1.title} </p>
    <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: ${dona1.raised/dona1.goal*100};" aria-valuenow="${card.raised/card.goal*100}" aria-valuemin="0" aria-valuemax="100"></div>
</div>
	<p class="card-text">${dona1.context}</p>
  </div>
</div>
</a>
</c:if>



<div class="card bg-secondary mb-3" style="max-width: 18rem;">
  <div class="picarea" style = "color:black">사진영역</div>
  <div class="card-body">
    <p class="card-text">기부 게시판 두번째 글 </p>
    <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
</div>
	<p class="card-text">-----------------------</p>
  </div>
</div>



<div class="card bg-secondary mb-3" style="max-width: 18rem;">
  <div class="picarea" style = "color:black" >사진영역</div>
  <div class="card-body">
    <p class="card-text">기부 게시판 세번째 글 </p>
    <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
</div>
	<p class="card-text">-----------------------</p>
  </div>
</div>



<div class="card bg-secondary mb-3" style="max-width: 18rem;">
  <div class="picarea" style = "color:black">사진영역</div>
  <div class="card-body">
    <p class="card-text"> </p>
    <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
</div>
	<p class="card-text">-----------------------</p>
  </div>
</div>

  </div>
</div>




<div class="container">
	<a href="${pageContext.request.contextPath}/giveTogether/funding">
	<h1>펀딩</h1>
	</a>
  <div class="row">

<div class="card bg-secondary mb-3" style="max-width: 18rem;">
  <div class="picarea" style = "color:black">사진영역</div>
  <div class="card-body">
    <p class="card-text">sample text sample text sample text sample text sample text sample text sample text sample text </p>
    <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
</div>
	<p class="card-text">-----------------------</p>
  </div>
</div>




<div class="card bg-secondary mb-3" style="max-width: 18rem;">
  <div class="picarea" style = "color:black">사진영역</div>
  <div class="card-body">
    <p class="card-text">sample text sample text sample text sample text sample text sample text sample text sample text </p>
    <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
</div>
	<p class="card-text">-----------------------</p>
  </div>
</div>



<div class="card bg-secondary mb-3" style="max-width: 18rem;">
  <div class="picarea" style = "color:black" >사진영역</div>
  <div class="card-body">
    <p class="card-text">sample text sample text sample text sample text sample text sample text sample text sample text </p>
    <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
</div>
	<p class="card-text">-----------------------</p>
  </div>
</div>



<div class="card bg-secondary mb-3" style="max-width: 18rem;">
  <div class="picarea" style = "color:black">사진영역</div>
  <div class="card-body">
    <p class="card-text">sample text sample text sample text sample text sample text sample text sample text sample text </p>
    <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
</div>
	<p class="card-text">-----------------------</p>
  </div>
</div>

  </div>
</div>





</body>
</html>
