<%@page import="wishFit.beans.image.ImageDto"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.image.ImageDao"%>
<%@page import="wishFit.beans.board.BoardImageVO"%>
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
   	//String boardWriter = (String)session.getAttribute("uid"); 아직 세션없음 있으면 주석제거
   	String boardWriter=request.getParameter("boardWriter");
 %>
 <%
	 //상세 페이지 불러오기
   	BoardDao boardDao = new BoardDao();
   	BoardImageVO boardImageVO = boardDao.detail(boardNo);
//    	List<BoardImageVO> boardImageList = 
   	//파일 정보 조회
   	//ImageDao imageDao = new ImageDao();
   	//List<ImageDto> imgList = imageDao.find(boardNo);
   	
 %>

<main class="app-content app-clearfix">

<h1 style="font-size : 20px" align="center">상세페이지</h1>
<table class="container-700 container-center">
		<thead>
			<tr>
				<th><h2><%=boardImageVO.getBoardTitle() %></h2></th>
			</tr>
			<tr>
				<th>
					작성자 : <%=boardImageVO.getBoardWriter() %>
					|
					작성일 : <%=boardImageVO.getBoardDate().substring(0,10) %>
				</th>
			</tr>
		</thead>
	
	<tbody>
			<%if(boardImageVO.getImageNo()!=0){ %>
			<tr>
				<td>
					<img src = "download.kh?imageNo=<%=boardImageVO.getImageNo() %>" style="width:500 ; height:500;">
				</td>
			<tr>
			<%} %>
		<tr height="250" valign="top">
			<td><pre><%=boardImageVO.getBoardPost() %></pre></td>
		</tr>
		<tr>
			<td><a href="record_delete.kh?boardNo=<%=boardNo%>" class="btn">삭제</a></td>
			<td><a href="record_edit.jsp?boardNo=<%=boardImageVO.getBoardNo() %>" class="btn">수정</a></td>
			<td><a href="my_record.jsp" class="btn">목록</a></td>
			<td><a href="record_write.jsp" class="btn">작성하기</a></td>
		</tr>
	</tbody>
	<tfoot>
		
	</tfoot>
</table>

	

<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>