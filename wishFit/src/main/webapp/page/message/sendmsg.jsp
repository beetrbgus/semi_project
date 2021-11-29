<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="send.kh" method="post">
		메세지 제목 :
		<input name="msg_title" type="text" required>
		받는이 :
		<input name="msg_receiver" id="receiver" type="text" required>
		보내는 사람 :
		<input name="msg_sender" id="sender" type="text">
		메세지 내용 :
		<textarea rows="10" cols="10" name="msg_text" required></textarea>
		<button type="submit">전송 </button>
	</form>
</body>
</html>
