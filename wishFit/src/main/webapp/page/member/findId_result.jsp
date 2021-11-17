<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%String memId = request.getParameter("mem_id"); %>
<% if(memId == null){ %>
	<h2>해당하는 회원이 없습니다.</h2>
	<%} else{%>
	<h2>결과 <%=memId %></h2>
	<%} %>


