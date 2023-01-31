<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<link rel="stylesheet" href="/css/jquery-ui.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
	<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
	<link rel="stylesheet" href ="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
	
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js" integrity="sha512-2XuQYSojalNmRQyWxr1Dr+KWZ7Gn6JgWMZvPxIYwGFRVA1r8RPWHRWybIu8zp/G2EtTTAXh56aMpk99pkrrpNA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
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
    

    </script>

<br>
<div class="list-group" style = "width : 80rem; margin : 0 auto;">
<form class="w3-container w3-card-4" enctype = "multipart/form-data" action = "${pageContext.request.contextPath}/donation/donationPro" method="post"
style = "padding : 2rem">
<h3   class="w3-center">기부정보 등록</h3>
<br>

<input type = "hidden" name = "id" value = "${gro.id}"/>
<input type = "hidden" name = "p_type" value = "2"/>
<input type = "hidden" name = "reword" value = ""/>
<input type = "hidden" name = "location" value = ""/>
<input type = "hidden" name = "act_time" value = ""/>
<input type = "hidden" name = "v_start" value = "20/01/01"/>
<input type = "hidden" name = "v_end" value = "20/01/01"/>
<input type = "hidden" name = "v_type" value = "20/01/01"/>
<input type = "hidden" name = "day" value = ""/>
<input type = "hidden" name = "field" value = ""/>
<input type = "hidden" name = "boardid" value = ""/>
<input type = "number" name = "raised" value="0" style ="display:none;"/>




<p>      
<label class="w3-text-grey">제목</label>
<input class="w3-input w3-border" type="text"  name = "title">
</p><p>      
</p><p>      
<label class="w3-text-grey">기부 관련 내용을 적어주세요:</label>
<textarea class="w3-input w3-border" style="height : 30rem;" name = "context" ></textarea>
    
<label class="w3-text-grey">파일 </label>
<input class="w3-input w3-border" type = "file" name = "uploadfile" >

<div class = "list-group" style = "width : 20rem; padding : 2rem; margin-left : 2rem" align="left">
<label class="w3-text-grey">기부 종료 날짜:</label>
	<div class="input-group date">
    	<input type="text" class="form-control" name = "end_date" readonly><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
	</div>
	<br>
<label class="w3-text-grey">기부 목표금액</label>
		<input class="w3-input w3-border" type="number" name="goal" id="numinput" style =" webkit-appearance: none;">
    	<input class="w3-input w3-border" type="text"  id="numoutput" readonly>
    	
</div>
  <p  class="w3-center"><button type="submit" class="w3-btn w3-padding w3-teal" 
  style="width:120px">저장</button></p>
</form>




    <script type="text/javascript">
    const input = document.querySelector('#numinput');
    const output = document.querySelector('#numoutput');
    input.addEventListener('keyup', function(e) {
      let value = e.target.value;
      
      value = Number(value.replaceAll(',', ''));
      if(isNaN(value)) {
        input.value = 0;
      }else {
        const formatValue = value.toLocaleString('ko-KR');
        output.value = formatValue.concat('(원)');
      }
    })
    
    function toNum(){
    	const A = document.querySelector('#number');
    	numA = number(A);
    	input.value = numA;
    }
    </script>

</body>
</html>