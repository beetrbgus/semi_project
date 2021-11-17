<%@page import="wishFit.beans.board.BoardDto"%>
<%@page import="wishFit.beans.market.MarketDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" type="text/css" href="../css/commons.css">
<!-- 헤더 -->
<%-- <jsp:include page="/template/header.jsp"></jsp:include>--%>

<!-- 좌측 사이드 -->
<%-- <jsp:include page="/template/leftSide.jsp"></jsp:include>--%>
<!-- 입력 -->
<%
int boardNo = Integer.parseInt(request.getParameter("boardNo"));
%>

<!-- 처리 -->
<!--
로그인 구현 되면 나중에 생각
String memberId = (String)session.getAttribute("ses");   -->
<%
MarketDao marketDao = new MarketDao();
BoardDto boardDto =marketDao.get(boardNo);//단일조회

%>

<!-- 출력 -->
<h2 align="center"><%=boardDto.getBoardNo()%>번째 게시글</h2>
<table border="1" align="center">
<tbody>
<tr>
<td>제목</td>
<td width="70%"><%=boardDto.getBoardTitle()%></td>
<td>작성일자 :<%=boardDto.getBoardDate()%></td>
<td>조회수:<%=boardDto.getBoardRead() %></td>
<td>댓글수:<%=boardDto.getBoardReply() %></td>
</tr>
<tr width="400" height="400">
<td>내용</td>
<td colspan="4"><%=boardDto.getBoardPost() %></td>

</tbody>
</table>

<input type="submit" value="삭제">
<input type="submit" value="수정">

<!-- 푸터 -->
<%-- <jsp:include page="/template/footer.jsp"></jsp:include>--%>

<!--  우측 사이드 -->
<%-- <jsp:include page="/template/rightSide.jsp"></jsp:include>--%>
