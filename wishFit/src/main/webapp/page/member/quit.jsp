<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <h2>회원 탈퇴</h2>
    
    <form action="quit.kh" method="post">
    	<table>
    		<tbody>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="memPw" required>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원 탈퇴">
				</td>
			</tr>
		</tfoot>
    	</table>
    </form>
    <%if(request.getParameter("error") != null){ %>
	<h4><font color="red">입력하신 정보가 일치하지 않습니다</font></h4>
<%} %>