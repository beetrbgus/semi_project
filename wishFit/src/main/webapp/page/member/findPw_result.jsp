<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%String memPw = request.getParameter("mem_pw"); %>
<% if(memPw == null){ %>
	<h2>해당하는 회원이 없습니다.</h2>
	<%} else{%>
	<h2>결과 <%=memPw %></h2>
	<%} %>