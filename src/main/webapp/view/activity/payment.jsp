<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${p_type} <br>
	${id} <br>
	${title} <br>
	<div>
	
	기부 페이지에서 온 경우(p_type 확인)
	결제창
	내가 하려는 게시글의 제목(index받아와서 tiltle)
	결제 정보
	회원 id확인
	금액 5000 10000 30000 직접입력
	결제 발생 날짜 시간 sysdate 저장(히든)
	확인버튼 
	</div>
	
	<div>
	봉사 페이지에서 온 경우(p_type 확인)
	봉사활동 신청 페이지
	신청 정보
	회원 id확인
	신청하려 하는 날짜 시간
	시간*10000 에서 마일리지 저장
	신청 발생 날짜 시간
	확인버튼
	</div>
</body>
</html>