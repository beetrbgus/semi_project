<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:include page="/template/header.jsp"></jsp:include>
      <jsp:include page="/template/leftSide.jsp"></jsp:include> 
<h1>login</h1>
<form action="login.kh" method="post">
	<table border ="0">
		<tbody>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memId" requried></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="memPw" requried></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td><input type="submit" value="로그인"></td>
			</tr>
		</tfoot>
	</table>
	
	<a href="findId.jsp" class="">아이디 찾기</a>
	<a href="findPw.jsp" class="">비밀번호 찾기</a>
</form>
<%if(request.getParameter("error") !=null){ %>
	<h5>
		<font color="red">로그인 정보가 일치하지 않습니다.</font> 
	</h5>
<%} %>

 <jsp:include page="/template/rightSide.jsp"></jsp:include>
 <jsp:include page="/template/footer.jsp"></jsp:include>