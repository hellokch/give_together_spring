<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 사진 등록</title>
</head>
<body>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<h3>업로드</h3>
<form method="post" action="${pageContext.request.contextPath}/giveTogether/picturePro" enctype="multipart/form-data">
<input class="btn btn-primary btn-sm" type="file" name="picture">
<input class="btn btn-primary btn-sm" type="submit" name="사진등록">
</form>
</body>
</html>