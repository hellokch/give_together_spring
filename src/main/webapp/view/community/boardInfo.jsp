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
			<td>글번호${board}</td>
			<td></td>
			<td>조회수</td>
			<td></td>
		</tr>		<tr>
			<td>작성자</td>
			<td></td>
			<td>작성일</td>
			<td></td>
		</tr>		<tr>
			<td>img</td>
			<td colspan="3">
			<img src="${pageContext.request.contextPath}/view/board/img/${board.file1}"/>
			</td>
		</tr>	<tr>
			<td>글제목</td>
			<td colspan="3"></td>
		</tr>		<tr>
			<td>글내용</td>
			<td colspan="3"></td>
		</tr>		<tr>
			<td colspan="4"  class="w3-center">
			<input type="button" value="답글" 	
onclick="document.location.href='<%=request.getContextPath()%>/board/replyForm?num=${board.num}&ref=${board.ref}&refstep=${board.refstep}&reflevel=${board.reflevel}&pageNum=${pageNum }'"/>
			<input type="button" value="글수정" 	
onclick="document.location.href='<%=request.getContextPath()%>/board/boardUpdateForm?num=${board.num}'"/>
			<input type="button" value="글삭제" 	
onclick="document.location.href='<%=request.getContextPath()%>/board/boardDeleteForm?num=${board.num}'"/>
		<input type="button" value="목록" 	
onclick="document.location.href='<%=request.getContextPath()%>/board/boardList'"/>
		
			</td>
			
			
			
	</table>
</body>
</html>