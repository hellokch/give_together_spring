<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단체 회원 가입</title>
</head>
<body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


<%-- 주소 코드 --%>
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
    
    function win_upload(){
        var op = "width=500, heigth=150, left=50, top=150";
        open("${pageContext.request.contextPath}/user/pictureimgForm", "", op);
    }
    
    
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%-- 주소코드 여기까지 --%>

<%-- 경로 예시로 잡아둔것 수정예정 --%>
<form action="${pageContext.request.contextPath}/giveTogether/joinUserGroupPro" method="post" >


  <fieldset>
   <li class="list-group-item d-flex justify-content-center align-items-center">
		<h3 for="exampleInputEmail1" class="form-label mt-4">단체 회원가입</h3>
	</li>
    <li >
		<h6 align="right" style = "margin-right:5rem"><a href="${pageContext.request.contextPath}/giveTogether/joinForPerson">개인회원 가입</a></h6>
	</li>
           
    <input type="text" name="kinds" value="2" style = "display : none">
    
    <div class="form-group">
      <label for="InputEmail1" class="form-label mt-4">ID를 입력하세요.</label>
      <input type="text" class="form-control" id="InputID" aria-describedby="emailHelp" placeholder="Enter email" name="id">
    </div>
    
    <div class="form-group">
      <label for="InputPassword1" class="form-label mt-4">비밀번호</label>
      <input type="password" class="form-control" id="InputPassword1" placeholder="비밀번호를 입력하세요." name="pass">
    </div>
    
       <div class="form-group">
      <label for="InputPassword1" class="form-label mt-4">비밀번호 확인</label>
      <input type="password" class="form-control" id="InputPassword2" placeholder="비밀번호를 한번 더 입력하세요.">
    </div>
    
       <div class="form-group">
      <label for="InputPicture" class="form-label mt-4">단체 사진 등록</label>
    <input type="hidden"  name="picture"  >
		<table class="w3-table-all">			
			
				<td rowspan="4" valign="bottom" width="100px" class="w3-border">
				<img src=""
					width="100" height="120" id="picture"><br> <font size="3">
					<a  class="w3-button w3-blue" 
						href="javascript:win_upload()">사진등록</a></font></td>
       </table></div>

    
    
    
    
    
      <div class="form-group">
      <label for="InputTEL" class="form-label mt-4">연락처 입력</label>
      <input type="text" class="form-control" id="InputTEL" placeholder="-없이 입력하세요." name="tel">
    </div>
    
     <div class="form-group">
      <label for="InputNAME" class="form-label mt-4">단체명 입력</label>
      <input type="text" class="form-control" id="InputP.NAME" placeholder="단체명을 입력하세요." name="p_name">
    </div>
    
     <div class="form-group">
      <label for="InputNAME" class="form-label mt-4">대표자명 입력</label>
      <input type="text" class="form-control" id="InputNAME" placeholder="성함을 입력하세요." name="name">
    </div>

 	<div class="form-group">
      <label for="InputIntro" class="form-label mt-4">소개 입력</label>
      <input type="text" class="form-control" id="InputIntro" placeholder="단체 소개를 입력하세요." name="intro">
    </div>
    
    

<%--주소 코드 --%>        
<label class="col-form-label col-form-label-sm mt-4" for="adress">주소</label><br>
<div class = "wrap" id = "adress">  
<input class="form-control-sm form-control" style = "max-width : 5rem; " type="text" id="sample6_postcode" placeholder="우편번호">
<input class="btn btn-primary btn-sm" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
</div>
<br>
<input class="form-control form-control-sm" type="text" name="location" id="sample6_address" placeholder="주소">
<div class = "wrap">  
<input class="form-control form-control-sm" style = "max-width : 15rem; " type="text" name="location1" id="sample6_detailAddress" placeholder="상세주소">
<input class="form-control form-control-sm" style = "max-width : 15rem; " type="text" id="sample6_extraAddress" placeholder="참고항목">
</div>

 
  


   <li class="list-group-item d-flex justify-content-between align-items-center" style="margin : 0 auto"> 
   <button type="submit" class="btn btn-primary">회원가입 완료</button>   
 </fieldset>
</form> 
</body>
</html>