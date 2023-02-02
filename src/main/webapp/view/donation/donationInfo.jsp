<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
	<table class="w3-table-all">
	
		
				
				
	<!-- userperson -->			
		<tr>
			<td>회원분류${userperson.kinds}</td>
			<td></td>
			<td>id${userperson.id}</td>
			<td></td>
		</tr>		
				
				
	<!-- usergroup -->			
		<tr>
			<td>회원분류${usergroup.kinds}</td>
			<td></td>
			<td>id${usergroup.id}</td>
			<td></td>
		</tr>
		<tr>
			<td>이름${usergroup.name}</td>
			<td></td>
			<td>소개${usergroup.intro}</td>
			<td></td>
		</tr>
		<tr>
			<td>대표자명${usergroup.p_name}</td>
			<td></td>
			
		</tr>
				
						
						
						
	<!-- board -->							
		<tr>
			<td>글번호${giveboard.index_num}</td>
			<td></td>
			<td>카테고리${giveboard.p_type}</td>
			<td></td>
		</tr>		
		<tr>
			<td>작성자${giveboard.id}</td>
			<td></td>
			<td>작성일${giveboard.not_date}</td>
			<td></td>
		</tr>		
		<tr>
			<td>모금액${giveboard.raised}</td>
			<td></td>
			<td>종류날짜${giveboard.end_date}</td>
			<td></td>
		</tr>
		<tr>
			<td>목표 모금액${giveboard.goal}</td>
			<td></td>
			
		</tr>
		<tr>
			<td>img</td>
			<td colspan="3">
			<img src = "${pageContext.request.contextPath}/view/donation/img/${giveboard.picture}" />
			</td>
		</tr>	
		<tr>
			<td>글제목${giveboard.title}</td>
			<td colspan="3"></td>
		</tr>		
		<tr>
			<td>글내용${giveboard.context}</td>
			<td colspan="3"></td>
		</tr>		
		<tr>
			<td colspan="4"  class="w3-center">
			
			<input type="button" value="글수정" 	
onclick="document.location.href='<%=request.getContextPath()%>/donation/boardUpdateForm?num=${giveboard.index_num}'"/>
			<input type="button" value="글삭제" 	
onclick="document.location.href='<%=request.getContextPath()%>/donation/boardDeleteForm?num=${giveboard.index_num}'"/>
		<input type="button" value="목록" 	
onclick="document.location.href='<%=request.getContextPath()%>/donation/boardList'"/>
		
			</td>
			
			
			
	</table>
</body>
</html>