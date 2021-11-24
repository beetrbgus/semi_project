<%@page import="wishFit.beans.fitgroup.TotalVO"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.fitgroup.FitgroupDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%

FitgroupDao fitgroupDao = new FitgroupDao();
List<TotalVO> listTotal = fitgroupDao.count();
TotalVO totalVO2 = fitgroupDao.countTotal();
%>
<title>Insert title here</title>
</head>
<body>
<%for(TotalVO totalVO : listTotal){ %>
<h2><%=totalVO.getFgName() %></h2>
<h2><%=totalVO.getTotal() %></h2>
<%} %>
<h2>
<%=totalVO2.getTotal()%>
</h2>
</body>
</html>