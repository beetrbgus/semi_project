<%@page import="wishFit.beans.member.FriendDto"%>
<%@page import="wishFit.beans.member.FriendDao"%>
<%@page import="wishFit.beans.member.FRequestDto"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.member.FRequestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 처리
	FriendDao friendDao = new FriendDao();
// 	List<FriendDto> list = friendDao.send();
%>

<h2>친구 요청 보낸 페이지</h2>

<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>닉네임</th>
			<th>등록일</th>
		</tr>
	</thead>
	<tbody>
<%-- 	<%for(FriendDto friendDto : list){%> --%>
<!-- 	<tr> -->
<%-- 		<td><%=friendDto.getFriendNo() %></td> --%>
<%-- 		<td><%=friendDto.getFriendNick() %></td> --%>
<!-- 		<td> -->
<%-- 		<a href="quit_delete.kh?friendNo=<%=friendDto.getFriendNo()%>">친구 신청 취소</a> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<%-- 	<%} %> --%>
	</tbody>
</table>
