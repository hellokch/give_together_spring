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
            <td>글번호${board.index_num}</td>
            <td></td>

        </tr>        <tr>
            <td>작성자${board.id}</td>
            <td></td>
            <td>작성일${board.not_date}</td>
            <td></td>
        </tr>        <tr>
            <td>img</td>
            <td colspan="3">
            <img src="${pageContext.request.contextPath}/view/community/img/${board.picture}"/>
            </td>
        </tr>    <tr>
            <td>글제목${board.title}</td>
            <td colspan="3"></td>
        </tr>        <tr>
            <td>글내용${board.context}</td>
            <td colspan="3"></td>
        </tr>        <tr>
            <td colspan="4"  class="w3-center">
            
            <input type="button" value="글수정" 	
onclick="document.location.href='<%=request.getContextPath()%>/community/boardUpdateForm?num=${board.index_num}'"/>
            <input type="button" value="글삭제"
onclick="document.location.href='<%=request.getContextPath()%>/community/boardDeleteForm?num=${board.index_num}'"/>
        <input type="button" value="목록"
onclick="document.location.href='<%=request.getContextPath()%>/community/community'"/>

            </td>



    </table>
</body>
</html>