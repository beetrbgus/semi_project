<%@page import="wishFit.beans.board.BoardDao"%>
<%@page import="wishFit.beans.board.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//파라미터 가져오기
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	//아이디 가져오기
	String boardWriter = (String)request.getAttribute("boardWriter");
%>

<%
//boardNo의 정보 불러오기
	BoardDao boardDao = new BoardDao();
	//BoardDto boardDto = boardDao.detail(boardNo);
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>
 

<main class="app-content app-clearfix">


<h2>게시글 수정</h2>
<form action = "record_edit.kh" method="post">
	<div class="container-700 container-center">
		<div class="row">
			<label>제목</label>
<%-- 			<input type = "text" name="boardTitle" required value="<%=boardDto.getBoardTitle() %>" >  --%>
		</div>
		<div class="row">
			<label>분류</label>
			<select name="boardMiddleName">
				<option>일자별</option>
				<option>소모임</option>
				<option>식단</option>
			</select>
		</div>
		<div class="row">
			<label>내용</label>
<%-- 			<textarea cols="50" rows="10" name="boardPost" ><%=boardDto.getBoardPost() %></textarea> --%>
		</div>
		<div class="row">
			<label>첨부파일</label>
			<input type="file" name="attach"   >
		</div>
		<div class="row">
			<input type="submit" value="수정 완료">
			<a href = "my_record.jsp">취소</a>
		</div>
	
	</div>

</form>


<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>


