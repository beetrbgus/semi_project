<%@page import="wishFit.beans.member.MemberDto"%>
<%@page import="wishFit.beans.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String memId = (String)session.getAttribute("ses");

	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(memId);
%>

<h2>���� ����</h2>
<form action="edit.kh" method="post">
	<table>
		<tbody>
			<tr>
			<th>���̵�</th>
			<td><%=memberDto.getMemId() %></td>
			</tr>
			<tr>
			<th>�̸�</th>
			<td><%=memberDto.getMemName() %></td>
			</tr>
			<tr>
			<th>��й�ȣ</th>
			<td><input type="password" name="memPw" required=""></td>
			</tr>
			<tr>
			<tr>
			<th>��й�ȣ Ȯ��</th>
			<td><input type="password" id="password2" value="" required=""></td>
			</tr>
			<tr>
			<th>�г���</th>
			<td><input type="text" name="memNick" value="<%=memberDto.getMemNick()%>"></td>
			</tr>
			<tr>
			<th>���</th>
			<td><%=memberDto.getMemGrade() %></td>
			</tr>
			<tr>
			<th>����</th>
			<td><%=memberDto.getMemGender() %></td>
			</tr>
			<tr>
			<th>��ȭ��ȣ</th>
			<td><input type="text" name="memPhone" value="<%=memberDto.getMemPhone()%>"></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2"  align="right">
				<input type="submit" value="����">
		</tfoot>
	</table>
</form>
 <%
 	if(request.getParameter("error") !=null){
 %>
	<h5><font color="red">�ùٸ� ���� ������ �Ͻʽÿ�.</font></h5>
<%} %>