<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <h2>ȸ�� Ż��</h2>
    
    <form action="quit.kh" method="post">
    	<table>
    		<tbody>
			<tr>
				<th>��й�ȣ</th>
				<td>
					<input type="password" name="memPw" required>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="ȸ�� Ż��">
				</td>
			</tr>
		</tfoot>
    	</table>
    </form>
    <%if(request.getParameter("error") != null){ %>
	<h4><font color="red">�Է��Ͻ� ������ ��ġ���� �ʽ��ϴ�</font></h4>
<%} %>