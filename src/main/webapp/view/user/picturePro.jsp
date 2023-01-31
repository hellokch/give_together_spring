<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><title>사진 업로드</title>
</head>
<body>
<script>
	img = opener.document.getElementById("picture"); //opener joinForm
	img.src = "${pageContext.request.contextPath}/view/user/picture/${filename}";
	//업로드된 이미지 회원가입 화면에 출력
	opener.document.f.picture.value="${filename}"; //파라미터에 파일이름 설정

	self.close();

</script>
</body>
</html>