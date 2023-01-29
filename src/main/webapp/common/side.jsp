<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<div class="accordion bg-light" id="accordionExample">
  <div class="accordion-item bg-light">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
        <strong>내정보 관리</strong>
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse bg-light" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
      <div class="accordion-body">
        <br>
        <a href="${pageContext.request.contextPath}/giveTogether/userPersonInfo" class="list-group-item list-group-item-action">내정보</a><br>
        <a href="${pageContext.request.contextPath}/giveTogether/userPersonUpdatePassCheck" class="list-group-item list-group-item-action">내정보수정</a><br>
        <a href="#" class="list-group-item list-group-item-action">비밀번호변경</a><br>
        <a href="#" class="list-group-item list-group-item-action">회원탈퇴</a><br>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		<strong>내 활동 관리</strong>      
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse bg-light" aria-labelledby="headingTwo" data-bs-parent="#accordionExample" style="">
      <div class="accordion-body">
      <br>
        <a href="#" class="list-group-item list-group-item-action">기부활동기록</a><br>
        <a href="#" class="list-group-item list-group-item-action">펀딩활동기록</a><br>
        <a href="#" class="list-group-item list-group-item-action">봉사활동기록</a><br>
        <a href="#" class="list-group-item list-group-item-action">give level</a><br>
      </div>
    </div>
  </div>
  <div class="accordion-item bg-light">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
       <strong> 또 뭐가 있을까</strong>
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse bg-light" aria-labelledby="headingThree" data-bs-parent="#accordionExample" style="">
      <div class="accordion-body">
        여기에 text 들어가요~~
      </div>
    </div>
  </div>
</div>
</menu>
<body>

</body>
</html>