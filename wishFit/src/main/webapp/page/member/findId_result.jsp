<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%String memId = request.getParameter("mem_id"); %>
<% if(memId == null){ %>
	<h2>�ش��ϴ� ȸ���� �����ϴ�.</h2>
	<%} else{%>
	<h2>��� <%=memId %></h2>
	<%} %>


