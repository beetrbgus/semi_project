<%@page import="wishFit.beans.fitgroup.FitgroupDto"%>
<%@page import="wishFit.beans.fitgroup.FitgroupDao"%>
<%@page import="wishFit.beans.board.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	String boardWriter = request.getParameter("boardWriter");
    
    	BoardDao boardDao = new BoardDao();
    	List<BoardDto> boardMine = boardDao.boardMine(boardWriter);
    %>
    <%
    	String fitgroupWriter = request.getParameter("fgId");
    	
    	FitgroupDao fitgroupDao = new FitgroupDao();
    	List<FitgroupDto> fitgroupMine = fitgroupDao.fitgroupMine(fgId);
    %>
    

<h2>작성 글 목록보기</h2>
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th width="50%">제목</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
	<%for(BoardDto boardDto : boardMine){ %>
		<tr>
			<td><%=boardDto.getBoardNo() %></td>
			<td><%=boardDto.getBoardTitle() %></td>
			<td><%=boardDto.getBoardDate() %></td>
		</tr>
		<%} %>
		<%for(FitgroupDto fitgroupDto : fitgroupMine){ %>
			<tr>
				<td><%=fitgroupDto.getFgNo() %></td>
				<td><%=fitgroupDto.getFgTitle() %></td>
				<td><%=fitgroupDto.getFgStarttime()%></td> <!-- 작성일 ? -->
			</tr>
		<%} %>
		</tbody>
</table>