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
	보드 넘어와있음
	
	
	로그인 정보 : ${login} <br> 
	로그인 회원 분류 :${login1}<br> 
	
	게시글 제목 : ${board.title} <br>
	<c:if test="${board.p_type eq 2 }">
	<div>
	
	
	결제창
	내가 하려는 게시글의 제목(index받아와서 tiltle)
	결제 정보
	회원 id확인
	금액 5000 10000 30000 직접입력
	결제 발생 날짜 시간 sysdate 저장(히든)
	확인버튼 
	</div>
	</c:if>
	
	<c:if test="${board.p_type eq 1 }">
	<div>
	
	봉사활동 신청 페이지
	신청 정보
	회원 id확인
	신청하려 하는 날짜 시간
	시간*10000 에서 마일리지 저장
	신청 발생 날짜 시간
	확인버튼
	</div>
	</c:if>
	
</body>
</html>