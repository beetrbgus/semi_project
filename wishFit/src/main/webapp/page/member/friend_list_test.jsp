<%@page import="wishFit.beans.member.FriendDto"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.member.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String friendId = request.getParameter("friendId");

	FriendDao friendDao = new FriendDao();
	List<FriendDto> friendMine = friendDao.friendmine(friendId);
%>

<h2>친구 목록</h2>
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>닉네임</th>
			<th>등록일</th>
		</tr>
	</thead>
	<tbody>
	<%for(FriendDto friendDto : friendMine){%>
	<tr>
		<td><%=friendDto.getFriendNo() %></td>
		<td><%=friendDto.getFriendNick() %></td>
		<td><%=friendDto.getFriendDate() %></td>
	</tr>
	<%} %>
	</tbody>
</table>