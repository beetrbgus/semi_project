<%@page import="wishFit.beans.Pagination"%>
<%@page import="wishFit.beans.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    	String boardLargeName = "커뮤니티";
    	BoardDao boardDao = new BoardDao();
   	 	
    %>
<%
       Pagination pagination = new Pagination(request); 
       pagination.calculate();
%> 
<script src = "https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel = "stylesheet" type="text/css" href="../css/commons.cs"> 

    
<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>
 

<main class="app-content app-clearfix">

<h2>커뮤 </h2>
<div class="container-700">
	<div class= "row">
      <a href="list.jsp" class="btn">
      <label>전체</label>
      </a>
      <a href="list.jsp?boardMiddleName=전" class="btn">
      <label>일자별</label>
      </a>
      <a href="my_record.jsp?boardMiddleName=소모임" class="btn">
      <label>소모임</label>
      </a>
      <a href="my_record.jsp?boardMiddleName=식단" class="btn">
      <label>식단</label>
      </a>
   </div>
   <table style="width:100%">
   	<thead>
   		<tr>
   			<th>글번호</th>
   			<th>제목</th>
   			<th>작성자</th>
   			<th>작성일</th>
   			<th>조회수</th>
   		</tr>
   	</thead>
   	<tbody>
   		
   	
   	</tbody>
   	<tfoot>
   	</tfoot>
   	
   </table>
	
</div>



<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>
