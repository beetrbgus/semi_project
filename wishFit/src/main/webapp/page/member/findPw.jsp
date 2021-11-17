<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<form action="findPw.kh" method="post">
	<table>
	<caption>비밀번호 찾기</caption>
		<tr>
			<td><input type="text" name="memName" placeholder="이름을 입력하세요"></td>
		</tr>
		<tr>
			<td><select name="memPwQ" id="pw_question">
	                                <option value="01">아버지의 성함은?</option>
	                                <option value="02">어머니의 성함은?</option>
	                                <option value="03">자신의 생일은?</option>
	                                <option value="04">출신 초등학교는?</option>
	                                <option value="05">감명깊게 읽은 책 이름은?</option>
	                            </select></td>
		</tr>
		<tr>
			<td><input type="text" name="memPwA" placeholder="답변을 입력하세요"></td>
		</tr>
		<tr>
			<td align="center">
			<input type="submit" value="아이디 찾기"></td>
		</tr>
	</table>
</form>