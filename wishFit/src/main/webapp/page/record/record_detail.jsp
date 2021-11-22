<%@page import="wishFit.beans.board.BoardDto"%>
<%@page import="wishFit.beans.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../css/commons.css">
 <!-- 받아놔야 하는 것 boardNo / member의 memId(session) -->
 <%
 int boardNo = Integer.parseInt(request.getParameter("boardNo"));
   	//String boardWriter = (String)session.getAttribute("ses"); 아직 세션없음 있으면 주석제거
   	String boardWriter=request.getParameter("boardWriter");
 %>
 <%
 //상세 페이지 불러오기
   	BoardDao boardDao = new BoardDao();
   	//BoardDto boardDto = boardDao.detail(boardNo);
 %>

<main class="app-content app-clearfix">

<h1 style="font-size : 20px" align="center">상세페이지</h1>
<div class="container-700 container-center">
	<div class="row center">
<%-- 		<h5>제목 : <%=boardDto.getBoardTitle() %></h5> --%>
<%-- 		<h5>분류 : <%=boardDto.getBoardMiddleName() %></h5> --%>
	</div>
	<div class="row center">
		<label>내용</label>
<%-- 		<pre><%=boardDto.getBoardPost() %></pre> --%>
	</div>
	<div class="row">
		<a href="my_record.jsp">목록으로</a>
<%-- 		<a href="record_edit.jsp?boardNo=<%=boardDto.getBoardNo()%>">수정하기</a> --%>
<%-- 		<a href="record_delete.kh?boardNo=<%=boardDto.getBoardNo()%>">삭제하기</a> --%>
	</div>
	
</div>
	

<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>