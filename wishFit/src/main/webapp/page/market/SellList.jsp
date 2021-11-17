<%@page import="wishFit.beans.market.MarketDao"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.board.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>

<link rel="stylesheet" type="text/css" href="../css/commons.css">
<!-- 헤더 -->
<jsp:include page="/template/header.jsp"></jsp:include>

<!-- 좌측 사이드 -->
<jsp:include page="/template/leftSide.jsp"></jsp:include>

<!-- 입력 -->

<%

%>

<!-- 처리 -->
<%
MarketDao marketDao = new MarketDao();
List<BoardDto> list = marketDao.list();
%>



<div class="container-700 container-center">
<table  border="1">
<thead>
<tr>
<td>번호</td>
<td>글쓴이</td>
<td>조회수</td>
<td width="70%">제목</td>
</tr>
</thead>
<tbody>
		<%for(BoardDto boardDto : list){ %>
		<tr>
			<td><%=boardDto.getBoardNo()%></td>
			<td><%=boardDto.getBoardWriter()%></td>
			<td><%=boardDto.getBoardRead()%></td>
			<td align="left">
			<!-- boardNo로 boardTitle 클릭 태그 만듬 -->
				<a href="detail.jsp?boardNo=<%=boardDto.getBoardNo()%>"><%=boardDto.getBoardTitle()%></a>
			</td>
		</tr>
		<%} %>
		</tbody>
</table>
</div>
<br>
<a href="write.jsp">글쓰기</a>

<!-- 푸터 -->
<jsp:include page="/template/footer.jsp"></jsp:include>

<!--  우측 사이드 -->
<jsp:include page="/template/rightSide.jsp"></jsp:include>


