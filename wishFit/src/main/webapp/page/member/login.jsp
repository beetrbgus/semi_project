<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:include page="/template/header.jsp"></jsp:include>
      <jsp:include page="/template/leftSide.jsp"></jsp:include> 
<h1>login</h1>
<form action="login.kh" method="post">
	<table border ="0">
		<tbody>
			<tr>
				<td>���̵�</td>
				<td><input type="text" name="memId" requried></td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td><input type="password" name="memPw" requried></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td><input type="submit" value="�α���"></td>
			</tr>
		</tfoot>
	</table>
	
	<a href="findId.jsp" class="">���̵� ã��</a>
	<a href="findPw.jsp" class="">��й�ȣ ã��</a>
</form>
<%if(request.getParameter("error") !=null){ %>
	<h5>
		<font color="red">�α��� ������ ��ġ���� �ʽ��ϴ�.</font> 
	</h5>
<%} %>

 <jsp:include page="/template/rightSide.jsp"></jsp:include>
 <jsp:include page="/template/footer.jsp"></jsp:include>