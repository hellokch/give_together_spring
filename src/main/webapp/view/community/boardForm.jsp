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
	action="${pageContext.request.contextPath}/community/boardPro" method="post">
<h3   class="w3-center">게시글 작성</h3>
<br>

<input type = "hidden" name = "id" value = "${per.id}"/>

<p>      
<label class="w3-text-grey">작성자</label>
<input class="w3-input w3-border" type="text"  name="name" >
</p><p>      
<label class="w3-text-grey">게시글 비밀번호(수정시 필요)</label>
<input class="w3-input w3-border" type="text" name="pass" >
</p><p>      
<label class="w3-text-grey">글 제목</label>
<input class="w3-input w3-border" type="text" name="title" >
</p><p>      
<label class="w3-text-grey">내용</label>
<textarea class="w3-input w3-border" style="resize:none"  name="context"></textarea>
</p>
<p>      
<label class="w3-text-grey">첨부 파일 </label>
<input class="w3-input w3-border" type="file" name="file1">
</p>

  <p  class="w3-center"><button type="submit" class="w3-btn w3-padding w3-teal" 
  style="width:120px">작성 완료</button></p>
</form>
</div>
</body>
</html>