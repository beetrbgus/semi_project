<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<form action="findPw.kh" method="post">
	<table>
	<caption>��й�ȣ ã��</caption>
		<tr>
			<td><input type="text" name="memName" placeholder="�̸��� �Է��ϼ���"></td>
		</tr>
		<tr>
			<td><select name="memPwQ" id="pw_question">
	                                <option value="01">�ƹ����� ������?</option>
	                                <option value="02">��Ӵ��� ������?</option>
	                                <option value="03">�ڽ��� ������?</option>
	                                <option value="04">��� �ʵ��б���?</option>
	                                <option value="05">������ ���� å �̸���?</option>
	                            </select></td>
		</tr>
		<tr>
			<td><input type="text" name="memPwA" placeholder="�亯�� �Է��ϼ���"></td>
		</tr>
		<tr>
			<td align="center">
			<input type="submit" value="���̵� ã��"></td>
		</tr>
	</table>
</form>