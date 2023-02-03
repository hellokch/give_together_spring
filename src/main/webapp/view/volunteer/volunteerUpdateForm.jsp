<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>게시판 수정 화면</title>
<script>
	function file_delete() {
		console.log(document.f);
		document.f.picture.value = "";
		file_desc.style.display = "none";
	}
</script>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >

	<link rel="stylesheet" href ="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
	
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js" integrity="sha512-2XuQYSojalNmRQyWxr1Dr+KWZ7Gn6JgWMZvPxIYwGFRVA1r8RPWHRWybIu8zp/G2EtTTAXh56aMpk99pkrrpNA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script type='text/javascript'>
    
    $(function(){
        $('.input-group.date').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy/mm/dd",
            language: "kr"
        });

    });
    
    function selectStartT() {
    	var value = ${board.start_t};
    	
    	const element = document.getElementById("start_t");  //select box
    	$("#start_t").val(value).prop("selected", true);
    }

    function selectEndT() {
    	var value = ${board.end_t};
    	
    	const element = document.getElementById("end_t");  //select box
    	$("#end_t").val(value).prop("selected", true);
    }
    
    function file_delete() {
		$("#picture").val = "";
		file_desc.style.display = "none";
	}
    
    $(document).ready(selectStartT());
    $(document).ready(selectEndT());
    
    </script>
<br>
<div class="w3-container">
<form class="w3-container w3-card-4" enctype = "multipart/form-data" action = "${pageContext.request.contextPath}/volunteer/volunteerUpdatePro" method="post">
<h3   class="w3-center">봉사활동 등록</h3>
<br>

<input type = "hidden" name = "index_num" value = "${board.index_num}"/>
<input type = "hidden" name = "p_type" value = "1"/>
<input type = "hidden" name = "reword" value = ""/>
<p>      
<label class="w3-text-grey">제목</label>
<input class="w3-input w3-border" type="text"  name = "title" value = "${board.title}">
</p><p>      
<label class="w3-text-grey">시작 기간:</label>
<div class="container">
	<div class="input-group date">
    	<input type="text" class="form-control" name = "v_start" value = "${v_start}"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
	</div>
</div>
</p><p>      
<label class="w3-text-grey">종료 기간:</label>
<div class="container">
	<div class="input-group date">
    	<input type="text" class="form-control" name = "v_end" value = "${v_end }"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
	</div>
</div>
</p><p>      
<label class="w3-text-grey">활동 요일:</label>
	<c:if test = "${fn:contains(board.day,'월')}">
		<input type="checkbox"  name = "day" value = "월" checked>월 &nbsp;&nbsp;
	</c:if>
	<c:if test = "${!fn:contains(board.day,'월')}">
		<input type="checkbox"  name = "day" value = "월">월 &nbsp;&nbsp;
	</c:if>
	<c:if test = "${fn:contains(board.day,'화')}">
		<input type="checkbox"  name = "day" value = "화" checked>화 &nbsp;&nbsp;
	</c:if>
	<c:if test = "${!fn:contains(board.day,'화')}">
		<input type="checkbox"  name = "day" value = "화">화 &nbsp;&nbsp;
	</c:if>
	<c:if test = "${fn:contains(board.day,'수')}">
		<input type="checkbox"  name = "day" value = "수" checked>수 &nbsp;&nbsp;
	</c:if>
	<c:if test = "${!fn:contains(board.day,'수')}">
		<input type="checkbox"  name = "day" value = "수">수 &nbsp;&nbsp;
	</c:if>
	<c:if test = "${fn:contains(board.day,'목')}">
		<input type="checkbox"  name = "day" value = "목" checked>목 &nbsp;&nbsp;
	</c:if>
	<c:if test = "${!fn:contains(board.day,'목')}">
		<input type="checkbox"  name = "day" value = "목">목 &nbsp;&nbsp;
	</c:if>
	<c:if test = "${fn:contains(board.day,'금')}">
		<input type="checkbox"  name = "day" value = "금" checked>금 &nbsp;&nbsp;
	</c:if>
	<c:if test = "${!fn:contains(board.day,'금')}">
		<input type="checkbox"  name = "day" value = "금">금 &nbsp;&nbsp;
	</c:if>
	<c:if test = "${fn:contains(board.day,'토')}">
		<input type="checkbox"  name = "day" value = "토" checked>토 &nbsp;&nbsp;
	</c:if>
	<c:if test = "${!fn:contains(board.day,'토')}">
		<input type="checkbox"  name = "day" value = "토">토 &nbsp;&nbsp;
	</c:if>
	<c:if test = "${fn:contains(board.day,'일')}">
		<input type="checkbox"  name = "day" value = "일" checked>일 &nbsp;&nbsp;
	</c:if>
	<c:if test = "${!fn:contains(board.day,'일')}">
		<input type="checkbox"  name = "day" value = "일">일 &nbsp;&nbsp;
	</c:if>
</p><p>      
<label class="w3-text-grey">활동 시작 시간:</label>
	<select name = "start_t" id = "start_t">
		<c:forEach var = "cnt" begin = "0" end = "23">
			<c:if test="${cnt eq board.start_t}">
				<option value = "${cnt}" selected="selected">${cnt}:00</option>
			</c:if>
			<c:if test="${cnt == board.start_t}">
				<option value = "${cnt}">${cnt}:00</option>
			</c:if>
		<option value = "${cnt}">${cnt}:00</option>
		</c:forEach>
	</select>
<label class="w3-text-grey">활동 종료 시간:</label>
	<select name = "end_t" id = "end_t">
		<c:forEach var = "cnt" begin = "0" end = "23">
			<c:if test="${cnt eq board.end_t}">
				<option value = "${cnt}" selected="selected">${cnt}:00</option>
			</c:if>
			<c:if test="${cnt == board.end_t}">
				<option value = "${cnt}">${cnt}:00</option>
			</c:if>
		<option value = "${cnt}">${cnt}:00</option>
		</c:forEach>
	</select>
</p><p>      
<label class="w3-text-grey">활동 장소</label>
<input class="w3-input w3-border" type="text"  name = "location" value = "${board.location }">
</p><p>      
<label class="w3-text-grey">봉사자 유형</label>
	<c:if test = "${fn:contains(board.v_type,'청소년')}">
		<input type="checkbox"  name = "v_type" value = "청소년" checked>청소년 &nbsp;&nbsp;
	</c:if>
	<c:if test = "${!fn:contains(board.v_type,'청소년')}">
		<input type="checkbox"  name = "v_type" value = "청소년">청소년 &nbsp;&nbsp;
	</c:if>
	<c:if test = "${fn:contains(board.v_type,'성인')}">
		<input type="checkbox"  name = "v_type" value = "성인" checked>성인 &nbsp;&nbsp;
	</c:if>
	<c:if test = "${!fn:contains(board.v_type,'성인')}">
		<input type="checkbox"  name = "v_type" value = "성인">성인 &nbsp;&nbsp;
	</c:if>
	<input type="checkbox"  name = "v_type" value = "청소년">청소년 &nbsp;&nbsp;
	<input type="checkbox"  name = "v_type" value = "성인">성인 &nbsp;&nbsp;
</p><p>      
<label class="w3-text-grey">봉사 분야</label>
<input class="w3-input w3-border" type="text"  name = "field" value = "${board.field}">
</p><p>      
<label class="w3-text-grey">모집 종료일:</label>
<div class="container">
	<div class="input-group date">
    	<input type="text" class="form-control" name = "end_date" value = "${end_date}"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
	</div>
</div>
</p><p>      
<label class="w3-text-grey">모집 내용:</label>
<textarea class="w3-input w3-border" style="resize:none" name = "context">${board.context}</textarea>
</p><p>      
<label class="w3-text-grey">파일 </label>
	<c:if test="${board.picture != null && board.picture ne ''}">
		<div id="file_desc">${board.picture}
			<a href="javascript:file_delete()">[첨부파일 삭제]</a>
		</div> 
	</c:if>
	<input type="file" name="f" id = "picture">
</p>
  <p  class="w3-center"><button type="submit" class="w3-btn w3-padding w3-teal" 
  style="width:120px">수정</button></p>
</form>
</div>
</body>
</html>