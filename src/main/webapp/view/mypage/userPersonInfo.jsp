<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 관리</title>
</head>
<body>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<style>
.wrap{
	width : 45rem;
}
.bnt-group{
	width : 30rem;
	display: inline-flex;
	justify-content: space-evenly;
	margin : 0 auto;
}
</style>

<div class = "wrap">
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
    
    <tr class="table-primary">
      <th scope="row">아이디</th>
      
      <td>${per.id}</td>
    </tr>
    <tr class="table-primary">
      <th scope="row">이름</th>      
      <td>${per.name}</td>
    </tr>
    <tr class="table-primary">
      <th scope="row">별명</th>      
      <td>${per.nickname}</td>
    </tr>
	<tr class="table-primary">
      <th scope="row">성별</th>      
      <td>${per.gender == 1 ? "남자" : "여자"}</td>
    </tr>
    <tr class="table-primary">
      <th scope="row">전화번호</th>      
      <td>${per.tel}</td>
    </tr>
        <tr class="table-primary">
      <th scope="row">이메일</th>      
      <td>${per.email}</td>
    </tr>
        <tr class="table-primary">
      <th scope="row">주소</th>      
      <td>${per.location}</td>
    </tr>    
    <tr class="table-primary">
      <th scope="row">상세주소</th>      
      <td>${per.location1}</td>
    </tr>
  </tbody>
</table>
<div class="bnt-group">
<button type="button" class="btn btn-primary btn-sm">정보 수정</button>
<button type="button" class="btn btn-primary btn-sm">비밀번호 수정</button>
<button type="button" class="btn btn-primary btn-sm">회원 탈퇴</button>
</div>
</div>
</body>
</html>