<%@page import="wishFit.beans.reply.ReplyDto"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.reply.ReplyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String replyId= request.getParameter("replyWriter");

	ReplyDao replyDao = new ReplyDao();
	List<ReplyDto> replyMine = replyDao.replyMine(replyId);
%>

<h2>작성 댓글 보기</h2>
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th width="50%">댓글 내용</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
		<%for(ReplyDto replyDto : replyMine){ %>
		<tr>
			<td><%=replyDto.getReplyNo() %></td>
			<td><%=replyDto.getReplyPost() %></td>
			<td><%=replyDto.getReplyDate() %></td>
		</tr>
		<%} %>
	</tbody>
</table>
