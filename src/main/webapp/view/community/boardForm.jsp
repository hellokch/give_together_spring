<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<div class="w3-container">


<form class="w3-container w3-card-4" enctype="multipart/form-data"
	action="${pageContext.request.contextPath}/community/communityPro" method="post">
<h3   class="w3-center">게시글 작성</h3>
<br>


<input type = "hidden" name = "p_type" value = "2"/>
<input type = "hidden" name = "end_date" value = "20/01/01"/> 
<input type = "hidden" name = "goal" value = "2"/> 
<input type = "hidden" name = "reword" value = ""/>
<input type = "hidden" name = "location" value = ""/>
<input type = "hidden" name = "act_time" value = ""/>
<input type = "hidden" name = "day" value = ""/>
<input type = "hidden" name = "v_start" value = "20/01/01"/>
<input type = "hidden" name = "v_end" value = "20/01/01"/>
<input type = "hidden" name = "v_type" value = "20/01/01"/>
<input type = "hidden" name = "field" value = ""/>
<input type = "hidden" name = "boardid" value = ""/>
<input type = "number" name = "raised" value="0" style ="display:none;"/>

<input type="hidden"  name="id"  value = "${per.id}"/>


<p>     
<label class="w3-text-grey">글 제목</label>
<input class="w3-input w3-border" type="text" name="title" >
</p><p>      
<label class="w3-text-grey">내용</label>
<textarea class="w3-input w3-border" style="resize:none"  name="context"></textarea>
</p>
<p>      
<label class="w3-text-grey">첨부 파일 </label>
<input class="w3-input w3-border" type="file" name="uploadfile">
</p>

  <p  class="w3-center"><button type="submit" class="w3-btn w3-padding w3-teal" 
  style="width:120px">작성 완료</button></p>
</form>
</div>
</body>
</html>