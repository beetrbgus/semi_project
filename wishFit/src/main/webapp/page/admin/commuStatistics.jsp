<%@page import="wishFit.statistics.BoardCountVO"%>
<%@page import="wishFit.statistics.BoardLeplyVO"%>
<%@page import="wishFit.statistics.BoardNameVO"%>

<%@page import="java.util.List"%>
<%@page import="wishFit.statistics.StatisticsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
	<!-- 헤더 -->
<jsp:include page="/template/header.jsp"></jsp:include>
	<h3>커뮤니티 통계</h3>
	<h3>커뮤니티 게시글수</h3>
<%
	StatisticsDao statisticsDao = new StatisticsDao();
	List<BoardCountVO> list = statisticsDao.boardCount();
%>

<%for(BoardCountVO vo : list){ %>
	<h5>
		<%=vo.getBoardNo()%> - <%=vo.getTotal()%> 
	</h5>
<%} %>


	<h3>커뮤니티 카테고리별 게시글수</h3>
<%
	StatisticsDao statisticsDao2 = new StatisticsDao();
	List<BoardNameVO> list2 = statisticsDao2.commuByboard();
%>

<%for(BoardNameVO vo : list2){ %>
	<h5>
		<%=vo.getBoardMidleName()%> - <%=vo.getTotal()%> 
	</h5>
<%} %>

	<h3>게시판 댓글수</h3>
<%
	StatisticsDao statisticsDao3 = new StatisticsDao();
	List<BoardLeplyVO> list3 = statisticsDao3.boardByLeply();
%>

<%for(BoardLeplyVO vo : list3){ %>
	<h5>
		<%=vo.getReplyNo()%> - <%=vo.getTotal()%> 
	</h5>
<%} %>
<!-- 좌측 사이드 -->
<jsp:include page="/template/leftSide.jsp"></jsp:include>

<!-- 화면 중간. 본문 -->
<main class="app-content app-clearfix">
<ul class="app-board-category">
    <li>
    <a href="/certifyboard">회원</a>
    </li>
    <li>
    <a href="/certifyboard/category/383">
        <span style="color: ;">소모임</span>
        <span class="app-document-count">
         ()
        </span>              </a>
          </li><li class="app-active">
    <a href="/certifyboard/category/384">
        <span style="color: ;">커뮤니티</span>
        <span class="app-document-count">
         ()
        </span>              </a>
          </li>

	<!-- 푸터 -->
<jsp:include page="/template/footer.jsp"></jsp:include>
</main>

<!--  우측 사이드 -->
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>
