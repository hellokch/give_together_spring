<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<style>
.container {
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
	margin : 0 auto;
	/* background-color : blue; */
	width : 80rem;
	padding : 1rem;
}

.item1{
	width : 60rem;
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	/* background-color : green; */
	resize: both;
}
.item2{
	width : 20%;
	/* background-color : yellow; */
	justify-content : center;
}
.wrap{
	flex-direction: row;
	flex-wrap: nowrap;
	margin : 0 auto;
	justify-content: center;
	display: inline-flex;
}
</style>

<div class = "container">
<div class="item1">
<h1>${board.title}</h1>	<br>
<div class="wrap">
<img style = "margin : 2rem; width : 40rem" src = "${pageContext.request.contextPath}/view/donation/img/${board.picture}" /><br>	
</div>
<p >${board.context}</p><br>

</div>
<div class = "item2">
<div class="card bg-secondary mb-3" align="left">
 <div class="card-body" style = "padding : 2.3rem">
 <h4 class="card-title" style="margin-left : 1rem;"> ${board.raised/board.goal} % </h4>
 <div class="progress">
 <span class="progress-bar" role="progressbar" style="width: ${card.raised/card.goal*100};" aria-valuenow="${card.raised/card.goal*100}" aria-valuemin="0" aria-valuemax="100"></span></div>
<label>${board.not_date}&nbsp;~ <br>
&nbsp;&nbsp;&nbsp;${board.end_date}</label>
<br><br>
<p class="card-text">모금액 : ${board.raised} 원</p>
<strong><p class="card-text">목표액 : ${board.goal} 원</p></strong>
</div>
</div>
<button onclick = "location.href ='${pageContext.request.contextPath}/act/payment'" type="button" class="btn" type="button" class="btn btn-primary" style = "width : 17rem; margin : 0.5rem;">기부하기</button>
<div class="card bg-secondary mb-3">
<div class="card-body" style = "padding : 2.3rem">
<div class="wrap" >
<div id="logo" style = "width : 50px; height : 50px; "> 
<img style = "width : 50px; height : 50px; " src = "${pageContext.request.contextPath}/view/user/picture/${boardwriter.picture}" /></div>
<h4 class="card-title" style="margin-left : 2rem;"> ${boardwriter.name} </h4></div>
<br>
<strong><p class="card-text" style = "margin-top : 1rem;">대표자 : ${boardwriter.p_name}</p></strong>
<p class="card-text">단체 소개 : <br> ${boardwriter.intro}</p>		
  </div>
</div>
	</div>
</div>

<input type="button" value="글수정" 	
onclick="document.location.href='<%=request.getContextPath()%>/donation/boardUpdateForm?num=${board.index_num}'"/>
<input type="button" value="글삭제" 	
onclick="document.location.href='<%=request.getContextPath()%>/donation/boardDeleteForm?num=${board.index_num}'"/>
<input type="button" value="목록" 	
onclick="document.location.href='<%=request.getContextPath()%>/donation/donationmain'"/>
		
		
		
</body>
</html>