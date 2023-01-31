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
<style>
.container{
	display: flex;
	justify-content: center;
}
.sidemenu{
	width : 15rem;
	margin-top : 5rem;
	
}
.mainBody{
	width : 60rem;
	margin-top : 3rem;
	margin-left : 1rem;
	margin-right :15rem;
}
</style>
<body>



<div class="container">
<div class = 'sidemenu'>
	<sitemesh:write property = 'menu' />
	<%@ include file = "/common/side.jsp" %>
</div>
	<div class = 'mainBody'>
		<sitemesh:write property = 'body' />
	</div>

</div>







	<div>
		<!-- footer -->
		<sitemesh:write property = 'footer'/>
		<!-- footer -->
	</div>
</body>
</html>