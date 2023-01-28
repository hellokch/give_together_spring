<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인회원 정보 관리</title>
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
th{
	text-align : center;
	
}
</style>

<div class = "wrap">
<table class="table table-hover">
  <tbody> 
    <tr >
      <th scope="row" class="table-primary" class = "table-success">아이디</th>
      
      <td class="table-secondary">${per.id}</td>
    </tr>
    <tr >
      <th scope="row" class="table-primary" >이름</th>      
      <td class="table-secondary">${per.name}</td>
    </tr>
    <tr >
      <th scope="row" class="table-primary">별명</th>      
      <td class="table-secondary">${per.nickname}</td>
    </tr>
	<tr >
      <th scope="row" class="table-primary">성별</th>      
      <td class="table-secondary">${per.gender == 1 ? "남자" : "여자"}</td>
    </tr>
    <tr >
      <th scope="row" class="table-primary">전화번호</th>      
      <td class="table-secondary">${per.tel}</td>
    </tr>
        <tr >
      <th scope="row" class="table-primary">이메일</th>      
      <td class="table-secondary">${per.email}</td>
    </tr>
        <tr >
      <th scope="row" class="table-primary">주소</th>      
      <td class="table-secondary">${per.location}</td>
    </tr>    
    <tr >
      <th scope="row" class="table-primary">상세주소</th>      
      <td class="table-secondary">${per.location1}</td>
    </tr>
    <tr >
    </tr>
  </tbody>
</table>
<div class="bnt-group">
<button type="button" class="btn btn-primary btn-sm">정보 수정</button>
<button type="button" class="btn btn-primary btn-sm">비밀번호 변경</button>
<button type="button" class="btn btn-primary btn-sm">회원 탈퇴</button>
</div>
</div>
</body>
</html>