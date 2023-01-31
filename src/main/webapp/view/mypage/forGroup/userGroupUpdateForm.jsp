<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>

</head>



<body>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<script>
    function win_upload(){
        var op = "width=500, heigth=150, left=50, top=150";
        open("${pageContext.request.contextPath}/giveTogether/pictureimgForm", "", op);
    }
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
<form name="f" method="post" action="${pageContext.request.contextPath}/mypage/userGroupUpdatePro">
<div>
<ul class="list-group" style = "max-width : 50rem; margin : 0 auto; list-style : none;">

<br>
	<li class="list-group-item d-flex justify-content-center align-items-center">
		<h3 class="form-label mt-4">내 정보 수정</h3>		
	</li>

	
  <li class="list-group-item d-flex justify-content-center align-items-center">
  <div class="form-group">
  <label class="col-form-label col-form-label-sm mt-4" for="disabledInput">아이디</label>
  <input class="form-control form-control-sm" type="text" placeholder="아이디를 입력해주세요." id="disabledInput" name="id" value ="${gro.id}" readonly="" >

  <input class="form-control form-control-sm" type="text" id="disabledInput" name="pass" value ="${gro.pass}"  style = "display : none">
  <input class="form-control form-control-sm" type="text" id="disabledInput" name="kinds" value ="${gro.kinds}"  style = "display : none" >


    <div class="list-group" style = "padding : 1rem;"><br>
    <h5 align="center">단체 정보</h5><br>
	<div class="wrap">
    <div style = "width : 15rem; flex-direction: column;">
    <div>
    <input type="hidden"  name="picture" value="${member.picture}">
	<img src="${pageContext.request.contextPath}/view/uesr/picture/${member.picture}" width="150" height="200" id="picture">
	</div>
	<div style = "margin-top : 1rem">
	<a href="javascript:win_upload()">
	<button type="button" class="btn btn-primary btn-sm">사진등록</button></a>
	</div>
	</div>
    <div style = "width : 15rem; flex-direction: column;">
   <label class="col-form-label col-form-label-sm mt-4" for="InputP.NAME">단체명</label>
   <input type="text" class="form-control form-control-sm" style = "max-width : 15em;" id="InputP.NAME" placeholder="단체명을 입력하세요." name="name" value="${gro.name }">
  
    
   <label class="col-form-label col-form-label-sm mt-4" for="InputNAME">대표자명</label>
   <input type="text" class="form-control form-control-sm" style = "max-width : 15em;" id="InputNAME" placeholder="성함을 입력하세요." name="p_name" value="${gro.p_name}">
  
   <label class="col-form-label col-form-label-sm mt-4" for="InputTEL">연락처</label>
    <input type="text" class="form-control form-control-sm" style = "max-width : 15em;" id="InputTEL" placeholder="-없이 입력하세요." name="tel" value="${gro.tel}">
   </div>
   </div>
    <label class="col-form-label col-form-label-sm mt-4" for="inputSmall1">이메일</label>
      <input type="text" class="form-control form-control-sm" id="InputEmail" aria-describedby="emailHelp" placeholder="example@email.com" name="email" value="${gro.email}">
    
 	<label for="introarea" class="col-form-label col-form-label-sm mt-4">단체를 소개해 주세요</label>
      <textarea class="form-control" id="introarea" rows="3" name="intro" >${gro.intro}</textarea>
    

<%--주소 코드 --%>        
<label class="col-form-label col-form-label-sm mt-4" for="adress">주소</label>
<div class = "wrap" id = "adress">  
<input class="form-control-sm form-control" style = "max-width : 5rem; " type="text" id="sample6_postcode" placeholder="우편번호">
<input class="btn btn-primary btn-sm" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
</div>
<input class="form-control form-control-sm" type="text" name="location" id="sample6_address" placeholder="주소" value="${gro.location}">
<div class = "wrap">  
<input class="form-control form-control-sm" style = "max-width : 15rem;" type="text" name="location1" id="sample6_detailAddress" placeholder="상세주소" value="${gro.location1}">
<input class="form-control form-control-sm" style = "max-width : 15rem;" type="text" id="sample6_extraAddress" placeholder="참고항목">
</div>
</div>
 
</div>
  <li class="list-group-item d-flex justify-content-between align-items-center" style="margin : 0 auto">
    
    <button type="submit" class="btn btn-primary">정보 수정하기</button>
  </li>
 </ul>
 </div>
</form>



<br><br><br>


</body>
</html>