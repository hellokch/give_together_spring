<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
	<table class="w3-table-all">
	
		
				
				

				
	<!-- usergroup -->			
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
				
						
						
						
	<!-- board -->							
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
			<td colspan="4"  class="w3-center">
			
			<input type="button" value="글수정" 	
onclick="document.location.href='<%=request.getContextPath()%>/donation/boardUpdateForm?num=${board.index_num}'"/>
			<input type="button" value="글삭제" 	
onclick="document.location.href='<%=request.getContextPath()%>/donation/boardDeleteForm?num=${board.index_num}'"/>
		<input type="button" value="목록" 	
onclick="document.location.href='<%=request.getContextPath()%>/donation/donationmain'"/>
		
			</td>
			
			
			
	</table>
</body>
</html>