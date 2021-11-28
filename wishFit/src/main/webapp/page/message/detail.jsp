<%@page import="wishFit.beans.message.MessageVo"%>
<%@page import="wishFit.beans.message.MessageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String uid = (String)request.getSession().getAttribute("uid");
	int msgNo = Integer.parseInt(request.getParameter("msg_no"));
	MessageDao messageDao = new MessageDao();
	messageDao.readMsg(msgNo);
	MessageVo detailMsg = messageDao.detailMessage(msgNo , uid);
	
	System.out.println(detailMsg.getMsg_no());
%>

<h2> 메세지 번호 : <%=detailMsg.getMsg_no() %></h2>
<h2> 받는 사람 아이디 : <%=detailMsg.getMsg_receiver()%></h2>
<h2> 보낸 사람 : <%=detailMsg.getMsg_sender() %></h2>
<h2> 받은 시각 : <%=detailMsg.getMsg_sendTime() %></h2>
<h2> 읽은 시각 : <%=detailMsg.getMsg_readTime() %></h2>
<h2> 메세지 제목 : <%=detailMsg.getMsg_no() %></h2>
<h2> 메세지 내용 : <%=detailMsg.getMsg_no() %></h2>
<h2> 보낸 사람 닉네임 : <%=detailMsg.getMsg_no() %></h2>
<h2> 보낸 사람 회원등급 : <%=detailMsg.getMsg_no() %></h2>
<h2> 회원 프로필 번호 : <%=detailMsg.getMsg_no() %></h2>

</body>
</html>