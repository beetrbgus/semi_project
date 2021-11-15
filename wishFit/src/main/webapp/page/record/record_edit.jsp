<%@page import="wishFit.beans.board.BoardDto"%>
<%@page import="wishFit.beans.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--입력 --%>
<%
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
%>
<%--처리 --%>
<%
	BoardDao boardDao = new BoardDao();
	BoardDto boardDto = boardDao.detail(boardNo);
%>




<h2>게시글 수정</h2>

<form action="edit.kh" method="post" border="0">
<input type = "hidden" name="boardNo" value="<%=boardDto.getBoardNo()%>">

<table>
	<tbody>
		<tr>
			<th>제목</th>
			<td><input type="text" name="boardTitle" required value= "<%=boardDto.getBoardTitle()%>"></td>
		</tr>
		<tr>
			<th valign="top">내용
			</th>
			<td><textarea rows="10" cols="50" name="boardPost" placeholder="내용 입력"><%=boardDto.getBoardPost()%></textarea></td>
		</tr>
	</tbody>
	<tfoot>
	<tr>
		<td colspan="2"><input type = "submit" value="수정">
		<input type="reset" value="다시 작성"></td>
	</tr>
	</tfoot>
</table>

</form>
