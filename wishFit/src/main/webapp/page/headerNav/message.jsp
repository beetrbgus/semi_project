<%@page import="wishFit.beans.message.MessageVo"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.message.MessageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%
String root = request.getContextPath();
String uid = (String)request.getSession().getAttribute("uid");
MessageDao messageDao = new MessageDao();
int msgStart = 1; 
int msgEnd = 7; 
List<MessageVo> msgList =  messageDao.notReadMsgList(uid,msgStart, msgEnd);
System.out.println(msgList.size());
boolean notNewMsg = msgList.isEmpty() || msgList.equals(null);
%>
<div class="app-dropdown-header tw-text-base tw-font-bold">쪽지</div>
<% if(!notNewMsg) {%>
<ul class="app-dropdown-menu-list">
	<% for(MessageVo messageVo : msgList) { %>
	<li>
		<% if(messageVo.getMsg_readTime().equals("안읽음")){ %>			
		<a href="<%=root %>/page/message/read.kh?msg_no=<%=messageVo.getMsg_no()%>" 
			class="tw-flex tw-items-center notread" style="background-color: #C7E0F0; margin: 1px;">
		<%}else{ %>
		<a href="<%=root %>/page/message/detail.jsp?msg_no=<%=messageVo.getMsg_no()%>" 
			class="tw-flex tw-items-center" style="margin: 1px;">
		<%}%>
			<!-- 댓글 보낸 사람 목록 프로필 사진 -->
			
			<div class="app-avatar">
				<% if(messageVo.getProfile_no()==0){ %>
				<img src="/wishFit/resources/image/profile-user.png" alt="">
				<% }else{%>
				<img src="/profile?mpNo=<%=messageVo.getProfile_no() %>" alt="">
				<% } %>
			</div>
		
			<div class="tw-pl-2">
				<div class="tw-mb-1">
					<!-- 보낸 사람 닉네임. -->
					<span class="tw-font-bold tw-text-sm tw-mr-2"><%=messageVo.getMsg_sender() %></span>
					<!-- 받은 시간 닉네임. -->
					<span class="tw-text-xs tw-text-gray-700"><%=messageVo.getMsg_sendTime() %></span>
				</div>
				<!-- 쪽지 내용 -->
				<div class="tw-text-sm"><%=messageVo.getMsgCon_title()%></div>
			</div>
		</a>
	</li>
	<%} %>
</ul>
<%} else{ %>
<div class="tw-text-center tw-mb-6 tw-px-4">
	<div class="tw-text-black tw-font-bold tw-text-sm tw-mb-2">
		새로운 쪽지가 없습니다.</div>
	<div class="tw-text-sm tw-text-gray-700 tw-mb-6">
		쪽지함에서 지금까지 수신한 <br>쪽지를 모두 확인할 수 있습니다.
	</div>
	<a href="msgList"
	>쪽지함 보기</a>
</div>
<%}%>
<ul class="app-dropdown-menu-list">
	<li class="tw-border-b tw-border-gray-300 tw-my-2"></li>
	<li><a class="tw-text-center tw-justify-center tw-text-gray-700"
		href="/wishFit/page/message/listmsg.jsp"
	> <span>전체 쪽지 보기</span>
	</a></li>
</ul>