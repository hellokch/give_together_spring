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

<script>
function aaa(){
	const checked = document.getElementById('flexCheckDefault');
	const is_check = checked.checked
	aa
	if(is_check){
		return aa = '2';
	}else{
		return aa = '1';
	}
}
</script>
<form action ="${pageContext.request.contextPath}/giveTogether/loginPro" method ="post">
<ul class="list-group">
  <li class="list-group-item d-flex justify-content-between align-items-center">
       <div class="form-check">      
        <input class="form-check-input" type="checkbox" id="flexCheckDefault" onclick="aaa" style="min-width : 1rem">
        <label class="form-check-label" for="flexCheckDefault">
          단체회원입니다.
          ${aa}
       
       <input name="kinds" value= "1"> 
       
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