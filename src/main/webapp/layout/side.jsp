<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- webapp/layout/layout.jsp -->
<!-- property = 태그의 이름 -->
<title>타이틀  : <sitemesh:write property='title'/></title>
<%@ include file = "/common/head.jsp" %>
</head>
<body>

<style>
.container{
	display: flex;
	width : 90rem;
	justify-content: flex-start;
}
.sidemenu{
	width : 20rem;
	margin-top : 5rem;
}
.mainBody{
	width : 80rem;
	margin-top : 3rem;
	margin-left : 1rem;
}
</style>

<div class="container">
<div class = 'sidemenu'>
	<sitemesh:write property = 'menu' />
	<%@ include file = "/common/side.jsp" %>
</div>
	<div class = 'mainBody'>
		<sitemesh:write property = 'body' />
	</div>
	
	<div>
		<!-- footer -->
		<sitemesh:write property = 'footer'/>
		<!-- footer -->
	</div>
</div>
</body>
</html>