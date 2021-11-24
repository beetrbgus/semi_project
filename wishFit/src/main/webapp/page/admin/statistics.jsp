<%@page import="wishFit.statistics.GenderVO"%>
<%@page import="wishFit.statistics.GradeVO"%>
<%@page import="wishFit.statistics.MemVO"%>
<%@page import="wishFit.statistics.AgeVO"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.statistics.StatisticsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- 헤더 -->
<jsp:include page="/template/header.jsp"></jsp:include>
	<h3>회원 통계</h3>
	<h3>회원 등급별 회원수</h3>
<%
	StatisticsDao statisticsDao = new StatisticsDao();
	List<GradeVO> list = statisticsDao.memberByGrade();
%>

<%for(GradeVO vo : list){ %>
	<h5>
		<%=vo.getMemGrade()%> - <%=vo.getTotal()%> 
	</h5>
<%} %>


	<h3>총 회원수</h3>
	<%
	StatisticsDao statisticsDao2 = new StatisticsDao();
	List<MemVO> list2 = statisticsDao2.member();
%>

<%for(MemVO vo : list2){ %>
	<h5>
		<%=vo.getMember()%> - <%=vo.getTotal()%> 
	</h5>
<%} %>
		
		
	<h3>연령별 회원수</h3>
	<%
	StatisticsDao statisticsDao3 = new StatisticsDao();
	List<AgeVO> list3 = statisticsDao3.memberByAge();
%>

<%for(AgeVO vo : list3){ %>
	<h5>
		<%=vo.getMemBirth()%> - <%=vo.getTotal()%> 
	</h5>
<%} %>


	<h3>성별 회원수</h3>
		<%
	StatisticsDao statisticsDao4 = new StatisticsDao();
	List<GenderVO> list4 = statisticsDao4.memberByGender();
%>

<%for(GenderVO vo : list4){ %>
	<h5>
		<%=vo.getMemGender()%> - <%=vo.getTotal()%> 
	</h5>
<%} %>
<!-- 좌측 사이드 -->
<jsp:include page="/template/leftSide.jsp"></jsp:include>

<!-- 화면 중간. 본문 -->
<main class="app-content app-clearfix">
<ul class="app-board-category">
    <li class="app-active">
    <a href="/certifyboard">회원</a>
    </li>
    <li>
    <a href="/certifyboard/category/383">
        <span style="color: ;">소모임</span>
        <span class="app-document-count">
         ()
        </span>              </a>
          </li><li>
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

