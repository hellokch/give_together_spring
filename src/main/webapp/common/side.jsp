<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<menu>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


<c:if test="${sessionScope.id != null and sessionScope.kinds eq 1}">
<div class="accordion bg-light" id="accordionExample">
  <div class="accordion-item bg-light">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
        <strong>내정보 관리(개인)</strong>
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse bg-light" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
      <div class="accordion-body">
        <br>
        <a href="${pageContext.request.contextPath}/mypage/userPersonInfo" class="list-group-item list-group-item-action">내정보</a><br>
        <a href="${pageContext.request.contextPath}/mypage/userPersonUpdatePassCheck" class="list-group-item list-group-item-action">내정보수정</a><br>
        <a href="${pageContext.request.contextPath}/mypage/userPassChgPassCheck" class="list-group-item list-group-item-action">비밀번호변경</a><br>
        <a href="${pageContext.request.contextPath}/mypage/userDelete" class="list-group-item list-group-item-action">회원탈퇴</a><br>
      </div>
    </div>
  </div>
  
  
</div>
</c:if>





<c:if test="${sessionScope.id != null and sessionScope.kinds eq '2'}">
<div class="accordion bg-light" id="accordionExample">
  <div class="accordion-item bg-light">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
        <strong>내정보 관리(단체)</strong>
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse bg-light" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
      <div class="accordion-body">
        <br>
        <a href="${pageContext.request.contextPath}/mypage/userGroupInfo" class="list-group-item list-group-item-action">단체정보</a><br>
        <a href="${pageContext.request.contextPath}/mypage/userGroupUpdatePassCheck" class="list-group-item list-group-item-action">단체정보수정</a><br>
        <a href="${pageContext.request.contextPath}/mypage/userPassChgPassCheck" class="list-group-item list-group-item-action">비밀번호변경</a><br>
        <a href="${pageContext.request.contextPath}/mypage/userDelete" class="list-group-item list-group-item-action">회원탈퇴</a><br>
      </div>
    </div>
  </div>
  
  

</div></c:if>


<c:if test="${sessionScope.id == admin}">
관리자 전용 메뉴

</c:if>

</menu>
<body>

</body>
</html>