<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제창</title>
</head>
<body>
<link rel="stylesheet" href ="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
	


	
	정보 확인
	로그인 정보 : ${id} <br> 
	로그인 회원 분류 :${kinds}<br> 
	
	게시글 제목 : ${board.title} <br>
	
	
	<c:if test="${board.p_type eq 2 }">
	<div class = "list-group location-center" style = "width : 20rem; padding : 2rem; margin-left : 2rem" align="left">
	
	결제 정보<br>
	<form name="act" method="post" action="${pageContext.request.contextPath}/act/paymentPro">
	<input type="text" name="id" value ="${id}" style="display:none;">
	<input type="text" name="kinds" value ="${kinds}" style="display:none;">
	<input type="number" name="act_number" value ="${board.index_num}" style="display:none;">
	<input type="text" name="act_type" value ="${board.p_type}" style="display:none;">
	
  <input class="form-check-input" type="radio" name="radio" id="5000원" value=5000>
  <label class="form-check-label" for="5000원">5,000원</label>
  <br>
  <input class="form-check-input" type="radio" name="radio" id="10000원" value=10000>
  <label class="form-check-label" for="10000원">10,000원</label>
  <br>
  <input class="form-check-input" type="radio" name="radio" id="30000원" value=30000>
  <label class="form-check-label" for="30000원">30,000원</label>
  <br>
  <input class="form-check-input" type="radio" name="radio" id="50000원" value=50000>
  <label class="form-check-label" for="50000원">50,000원</label>
  <br>
  <input class="form-check-input" type="radio" name="radio" id="직접입력">
  <label class="form-check-label" for="직접입력">직접입력</label>
  <br>
 <input class="form-check-input" type="number" style = "width : 20rem; display: none;" name="act_pay" id="numinput" >
  <br>
  <input class="form-check-input" type="number" style = "width : 20rem; display: none;" name="act_mile">
  <button type="submit" class="btn btn-primary btn-sm">결제하기</button>
</form>
	
	</div>
	</c:if>
	
	<c:if test="${board.p_type eq 1 }">
	<div>
	
	봉사활동 신청 페이지<br>
	
	신청 정보<br>
	회원 id확인<br>
	신청하려 하는 날짜 시간 (요)<br>
	시간*10000 에서 마일리지 저장<br>
	신청 발생 날짜 시간<br>
	확인버튼<br>
	</div>
	</c:if>
	
	
<script>
const radioButtons = document.querySelectorAll('input[type="radio"]');
const numInput = document.querySelector('#numinput');
const mileInput = document.querySelector('input[name="act_mile"]');

radioButtons.forEach(radioButton => {
  radioButton.addEventListener('click', function() {
    if (this.id === "직접입력") {
      numInput.style.display = "block";
      numInput.value = "";
    } else {
      numInput.style.display = "none";
      mileInput.value = this.value;
    }
  });
});

numInput.addEventListener('input', function() {
  mileInput.value = this.value;
});
</script>


</body>
</html>