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
th{
	class:"table-primary";
}
</style>

<div class="list-group" style = "padding : 2rem;">
<table class="table table-hover">
<tr>
<td rowspan=5 width="200px"><img src="${pageContext.request.contextPath}/view/user/picture/${gro.picture}" width="150" height="200" id="picture"></td>
<th class="table-primary"  width="200px">아이디</th>
<td>${gro.id} </td>
</tr>
<tr>
<th class="table-primary" >단체명</th>
<td>${gro.name}</td>
</tr>
<tr>
<th class="table-primary" >대표자명</th>
<td>${gro.p_name}</td>
</tr>
<tr>
<th class="table-primary" >연락처</th>
<td>${gro.tel }</td>
</tr>
<tr>
<th class="table-primary" >이메일</th>
<td>${gro.email }</td>
</tr>
<tr>
<th class="table-primary" >주소</th>
<td colspan = 3>${gro.location }</td>
</tr>
<tr>
<th class="table-primary" >상세주소</th>
<td colspan = 3>${gro.location1 }</td>
</tr>
<tr>
<th class="table-primary"  colspan=4>단체 소개</th>
</tr>
<tr>
<td rowspan =2 colspan=4>${gro.intro}</td>
</tr>
</table>
</div>

</body>
</html>