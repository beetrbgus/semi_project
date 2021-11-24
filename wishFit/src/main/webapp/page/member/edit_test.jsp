<%@page import="wishFit.beans.member.MemberDto"%>
<%@page import="wishFit.beans.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memId = (String)session.getAttribute("uid");

	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(memId);
%>

<h2>정보 수정</h2>
<form action="edit.kh" method="post">
	<table>
		<tbody>
			<tr>
			<th>아이디</th>
			<td><%=memberDto.getMemId() %></td>
			</tr>
			<tr>
			<th>이름</th>
			<td><%=memberDto.getMemName() %></td>
			</tr>
			<tr>
			<th>비밀번호</th>
			<td><input type="password" name="memPw" required=""></td>
			</tr>
			<tr>
			<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" id="password2" value="" required=""></td>
			</tr>
			<tr>
			<th>닉네임</th>
			<td><input type="text" name="memNick" value="<%=memberDto.getMemNick()%>"></td>
			</tr>
			<tr>
			<th>등급</th>
			<td><%=memberDto.getMemGrade() %></td>
			</tr>
			<tr>
			<th>성별</th>
			<td><%=memberDto.getMemGender() %></td>
			</tr>
			<tr>
			<th>전화번호</th>
			<td><input type="text" name="memPhone" value="<%=memberDto.getMemPhone()%>"></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2"  align="right">
				<input type="submit" value="수정">
		</tfoot>
	</table>
</form>
 <%
 	if(request.getParameter("error") !=null){
 %>
	<h5><font color="red">올바른 정보 수정을 하십시오.</font></h5>
<%} %>