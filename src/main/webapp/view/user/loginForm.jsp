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
.list-group{
	max-width : 20rem;
	background-color : sky;
	margin : 0 auto;	
}
input{
	min-width : 18rem;
}
</style>


<form action ="${pageContext.request.contextPath}/giveTogether/loginPro" method ="post">
<ul class="list-group">
  <li class="list-group-item d-flex justify-content-between align-items-center">
       <div class="form-check">      
<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
  <input type="radio" class="btn-check" id="btnradio1" checked name="kinds" value ="1">
  <label class="btn btn-outline-primary" for="btnradio1">개인 회원</label>
  <input type="radio" class="btn-check" id="btnradio2" name="kinds" value ="2">
  <label class="btn btn-outline-primary" for="btnradio2">단체 회원</label>
</div>
        <label class="form-check-label" for="flexCheckDefault">
        
       
        </label>
      </div>
  </li>
  <li class="list-group-item d-flex justify-content-between align-items-center">

    <div class="form-group">
      <label for="inputid" class="form-label mt-4">아이디</label>
      <input type="text" class="form-control" id="inputid" placeholder="ID를 입력해 주세요." name="id" >
    </div>
  </li>

  <li class="list-group-item d-flex justify-content-between align-items-center">
    <div class="form-group">
      <label for="exampleInputPassword1" class="form-label mt-4">Password</label>
      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="pass">
      <a href="${pageContext.request.contextPath}/giveTogether/joinForm" class="text-primary">회원가입</a>
    </div>
  
  
  </li>
  <li class="list-group-item d-flex justify-content-between align-items-center" style="margin : 0 auto">
    <a href="#">
    <button type="submit" class="btn btn-primary">로그인</button></a>
  </li>
</ul>
</form>

</body>
</html>