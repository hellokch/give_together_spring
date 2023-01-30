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
	<form class="w3-container w3-card-4"   action="$pageContext.request.contextPath}/community/boardUpdatePro" method="post" enctype="multipart/form-data"
		name="f">
		<input type="hidden" name="num" value="${board.num}">
		<input type="hidden" name="file1"  	value="${board.file1}">
		<table  class="w3-table-all">
			<caption>${boardName} 수정</caption>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="name" value="${board.name}"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject"
					value="${board.subject}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="15" name="content">${board.content}</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td style="text-align: left">
				<c:if test="${board.file1 != null && board.file1 ne ''}">
					
					<div id="file_desc">${board.file1}
						<a href="javascript:file_delete()">[첨부파일 삭제]</a>
					</div> </c:if>
				<input type="file" name="f">
				</td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:document.f.submit()">[게시물수정]</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>