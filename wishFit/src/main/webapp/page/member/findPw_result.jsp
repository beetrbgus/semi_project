<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%String memPw = request.getParameter("mem_pw"); %>
<% if(memPw == null){ %>
	<h2>�ش��ϴ� ȸ���� �����ϴ�.</h2>
	<%} else{%>
	<h2>��� <%=memPw %></h2>
	<%} %>