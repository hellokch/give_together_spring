<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>게시판 수정 화면</title>
<script>
	function file_delete() {		
		document.f.file1.value = "";
		file_desc.style.display = "none";
	}
</script>
</head>
<body>
	<form class="w3-container w3-card-4"   action="${pageContext.request.contextPath}/community/boardUpdatePro" method="post" enctype="multipart/form-data"
		name="f">
		<input type="hidden" name="index_num" value="${board.index_num}">
		<input type="hidden" name="f"  	value="${board.picture}">
		<table  class="w3-table-all">
			<caption>${boardName}게시글수정</caption>
			
			
			
			
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"
					value="${board.title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="15" name="context">${board.context}</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td style="text-align: left">
				
				<c:if test="${board.picture != null && board.picture ne ''}">
		<div id="file_desc">${board.picture}
			<a href="javascript:file_delete()">[첨부파일 삭제]</a>
		</div> 
	</c:if>
	
	<input type="file" name="f" id = "picture">
			<tr>
				<td colspan="2"><a href="javascript:document.f.submit()">[게시물수정]</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>