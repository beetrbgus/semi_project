<%@page import="wishFit.beans.board.BoardImageVO"%>
<%@page import="wishFit.beans.reply.ReplyDao"%>
<%@page import="wishFit.beans.reply.ReplyDto"%>
<%@page import="wishFit.beans.board.BoardDao"%>
<%@page import="wishFit.beans.Pagination"%>
<%@page import="wishFit.beans.board.BoardDto"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    

	<%
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));		
	%>
	<%
		BoardDao boardDao = new BoardDao();
		BoardImageVO boardImageVo = boardDao.detail(boardNo);
	%>
	
<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="../css/commons.css">
<script>

</script>
<main>
<div class="container-1000 container-center">
	<div class="row">
		<h2 style="font-size: 2rem;"><%=boardImageVo.getBoardTitle() %></h2>
		<h2 style="font-size: 1rem;"><%=boardImageVo.getBoardWriter()%></h2> 
	</div>
	<div class="row">
 		<span><%=boardImageVo.getBoardDate()%>ㆍ</span> 
 		<span>조회수 : <%=boardImageVo.getBoardRead()%></span>
	</div>
	<div class="row" style="min-height: 300px;">
		<%if(boardImageVo.getImageNo() != 0){  %>
		<img  src="<%=request.getContextPath() %>/page/community/download.kh?imageNo=<%=boardImageVo.getImageNo()%>">
		<%} %>
		<%=boardImageVo.getBoardPost() %>
	</div>
	<a href="list.jsp">목록으로</a>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
</main>	 
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>