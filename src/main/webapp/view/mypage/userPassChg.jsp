<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<style>
.form-control {
	width : 30rem;
}
.form-check-label{
	font-size : 0.8rem;
}
.wrap{
	display: inline-flex;
}
a{

}
</style>
<br>
<form name="f" method="post" action="${pageContext.request.contextPath}/mypage/userPassChgPro">
<div>
<ul class="list-group" style = "max-width : 50rem; margin : 0 auto; list-style : none;">

<br>
	<li class="list-group-item d-flex justify-content-center align-items-center">
		<h3 class="form-label mt-4">비밀번호 변경</h3>		
	</li>

	
  <li class="list-group-item d-flex justify-content-center align-items-center">
  <div class="form-group">
  <input name="id" value="${id}">
 	<input name="kinds" value="${kinds}">
  <label class="col-form-label col-form-label-sm mt-4" for="inputSmall2">비밀번호</label>
  <input class="form-control form-control-sm" type="password" placeholder="비밀번호를 입력해주세요." id="inputSmall2" name="passchg1">
  <label class="col-form-label col-form-label-sm mt-4" for="inputSmall2">비밀번호 확인</label>
  <input class="form-control form-control-sm" type="password" placeholder="비밀번호를 입력해주세요." id="inputSmall2" name="passchg2">
</div>
  <li class="list-group-item d-flex justify-content-between align-items-center" style="margin : 0 auto">
    
    <button type="submit" class="btn btn-primary">확인</button>
  </li>
 </ul>
</body>
</html>