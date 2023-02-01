<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
	<table class="w3-table-all">
		<tr>
			<td>글번호</td>
			<td>${board.index_num}</td>
			<td>작성자</td>
			<td>${board.id}</td>
		</tr>	<tr>
			<td>글제목</td>
			<td colspan="3">${board.title}</td>
		</tr>		<tr>
		</tr>		<tr>
			<td>활동 날짜</td>
			<td>${board.v_start} ~ ${board.v_end} ${board.day} ${board.act_time}</td>
		</tr>		<tr>
			<td>모집 종료일</td>
			<td>${board.end_date}</td>
		</tr>		<tr>
			<td>img</td>
			<td colspan="3">
			<img src="${pageContext.request.contextPath}/view/board/img/${board.picture}"/>
			</td>
		</tr>	<tr>
			<td>글내용</td>
			<td colspan="3">${board.context}</td>
		</tr>		<tr>
			<td colspan="4"  class="w3-center">
			<input type="button" value="글수정" 	
onclick="document.location.href='<%=request.getContextPath()%>/volunteer/volunteerUpdateForm?num=${board.index_num}'"/>
			<input type="button" value="글삭제" 	
onclick="document.location.href='<%=request.getContextPath()%>/board/volunteerDeleteForm?num=${board.index_num}'"/>
		<input type="button" value="목록" 	
onclick="document.location.href='<%=request.getContextPath()%>/volunteer/volunteerList'"/>
		
			</td>
			
			
			
	</table>
</body>
</html>