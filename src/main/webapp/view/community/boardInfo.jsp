<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
	<table class="w3-table-all">
		<tr>
			<td>게시글번호 : ${board.index_num}</td>
			<td></td>
			
			<td></td>
		</tr>		<tr>
			<td>작성자 : ${board.id}</td>
			<td></td>
			<td>작성일 : ${board.not_date}</td>
			<td></td>
		</tr>		<tr>
			 <td>첨부된 사진 : </td>
            <td colspan="3">
            <img src="${pageContext.request.contextPath}/view/community/img/${board.picture}"/>
            </td>
		</tr>	<tr>
			<td>글제목 : ${board.title}</td>
			<td colspan="3"></td>
		</tr>		<tr>
			<td>글내용 : ${board.context}</td>
			<td colspan="3"></td>
		</tr>		<tr>
			<td colspan="4"  class="w3-center">
			
			
			<c:if test = "${id == board.id && board.id != null}">
			<input type="button" value="글수정" 	
onclick="document.location.href='<%=request.getContextPath()%>/board/boardUpdateForm?num=${board.index_num}'"/>
			<input type="button" value="글삭제" 	
onclick="document.location.href='<%=request.getContextPath()%>/board/boardDeleteForm?num=${board.index_num}'"/>
		</c:if>
		<input type="button" value="목록" 	
onclick="document.location.href='<%=request.getContextPath()%>/community/community'"/>
		
			</td>
			
			
			
	</table>
</body>
</html>