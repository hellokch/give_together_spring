<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.container {
	display: inline-flex;
	margin : 0 auto;
	/* background-color : blue; */
	width : 80rem;
	justify-content: center;
	padding : 1rem;
	text-align : center;
}
.contents{
	max-width : 50rem;
	/* background-color : green; */
}
.right-side{
	max-width : 18rem;
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
<body>
<link rel="stylesheet" href = "${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
<div class = "container"><div class="contents">
<h1>${board.title}</h1>	
<img src = "${pageContext.request.contextPath}/view/donation/img/${board.picture}" />	
<p>${board.context}</p></div><div class = "right-side">	
<div class="card bg-secondary mb-3" align="left">
 <div class="card-body" style = "padding : 2.3rem">
 <h4 class="card-title" style="margin-left : 1rem;"> ${board.raised/board.goal} % </h4>
 <div class="progress">
 <span class="progress-bar" role="progressbar" style="width: 35%; " aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></span></div>
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
<strong><p class="card-text">대표자 : ${boardwriter.p_name}</p></strong>
<p class="card-text">${boardwriter.intro}</p>		
  </div>
</div>
	</div>
</div>
	
	
	
	
	
	
	<table class="w3-table-all">
		<tr>
			<td>글번호${board.index_num}</td>
			<td></td>
			<td>카테고리${board.p_type}</td>
			<td></td>
		</tr>		
		<tr>
			<td>작성자${board.id}</td>
			<td></td>
			<td>작성일${board.not_date}</td>
			<td></td>
		</tr>		
		<tr>
			<td>모금액${board.raised}</td>
			<td></td>
			<td>종류날짜${board.end_date}</td>
			<td></td>
		</tr>
		<tr>
			<td>목표 모금액${board.goal}</td>
			<td></td>
			
		</tr>
		<tr>
			<td>img</td>
			<td colspan="3">
			<img src = "${pageContext.request.contextPath}/view/donation/img/${board.picture}" />
			</td>
		</tr>	
		<tr>
			<td>글제목${board.title}</td>
			<td colspan="3"></td>
		</tr>		
		<tr>
			<td>글내용${board.context}</td>
			<td colspan="3"></td>
		</tr>		
		<tr>
		
		<tr>
			<td>회원분류${boardwriter.kinds}</td>
			<td></td>
			<td>id${boardwriter.id}</td>
			<td></td>
		</tr>
		<tr>
			<td>이름${boardwriter.name}</td>
			<td></td>
			<td>소개${boardwriter.intro}</td>
			<td></td>
		</tr>
		<tr>
			<td>대표자명${boardwriter.p_name}</td>
			<td></td>
			
		</tr>
					
			<td colspan="4"  class="w3-center">
			
			<input type="button" value="글수정" 	
onclick="document.location.href='<%=request.getContextPath()%>/donation/boardUpdateForm?num=${board.index_num}'"/>
			<input type="button" value="글삭제" 	
onclick="document.location.href='<%=request.getContextPath()%>/donation/boardDeleteForm?num=${board.index_num}'"/>
		<input type="button" value="목록" 	
onclick="document.location.href='<%=request.getContextPath()%>/donation/donationmain'"/>
		
			</td>
			
			
			
	</table>
	
			<a href ="${pageContext.request.contextPath}/act/payment" type="button" class="btn">기부하기</a>
</body>
</html>