<%@page import="wishFit.beans.message.MessageDao"%>
<%@page import="wishFit.beans.message.MessageVo"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.message.Msg_Pagenation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
 
<!-- 헤더 -->
<jsp:include page="/template/header.jsp"></jsp:include>
<%
String root = request.getContextPath();
String uid = (String) request.getSession().getAttribute("uid");
int msgNo = Integer.parseInt(request.getParameter("msg_no"));
MessageDao messageDao =new MessageDao();
System.out.println("msgNo "  + msgNo);
MessageVo messageVo = new MessageVo();
if(msgNo !=0){
	messageVo = messageDao.detailMessage(msgNo,uid);	
}else{
	messageVo = null;
}
%>
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/255b6902485612c74d806c3142450a55116bc82e.signup-form.scssb2cb.css"
/>
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/347b8967715ee8520a013ff5c985fb69086c462a.member.scss944d.css"
/>
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/347b8967715ee8520a013ff5c985fb69086c462a.member-form.scss944d.css"
/>
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/member-info.css"
>
<!-- 좌측 사이드 -->
<jsp:include page="/template/leftSide.jsp"></jsp:include>
<style>
.app-article-toolbar {
	background-color: #f8f9fa;
	border-top: 1px solid #f1f3f5;
	border-bottom-left-radius: 8px;
	border-bottom-right-radius: 8px;
}

.app-article-toolbar .app-board-container {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	padding-top: 1rem;
	padding-bottom: 1rem;
}
</style>
<main class="app-content app-clearfix">
	<div class="app-article-toolbar">
		<div class="app-board-container">
			<a class="app-link" href="<%=root%>/page/message/listmsg.jsp">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
            		<path fill-rule="evenodd"
						d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z"
						clip-rule="evenodd" >
            		</path>
            	</svg> <span>목록으로</span>
			</a>
			<div class="tw-flex-1"></div>
			<a class="app-link tw-text-sm document_1195" href="#popup_menu_area"
				title="이 게시물을..." onclick="return false"
			> </a>
		</div>
	</div>
	<div class="app-clearfix">
		<section class="app-member">
			<%-- 마이페이지 왼쪽것 --%>
			<jsp:include page="/page/message/myPageLeftSide.jsp"></jsp:include>
			
			<div class="app-member-content">
				<div class="app-member-card">
					<div class="app-member-card-header">
						<h1>쪽지 제목</h1>
					</div>

					<div class="app-member-card-body">
						<div class="app-board-article-profile tw-flex tw-items-center">
							<div class="app-profile-image app-avatar">
								<% if(messageVo.getProfile_no() !=0) {%>
								<img src="<%=root%>/page/message/download.kh?imageNo=<%=messageVo.getProfile_no()%>"
									alt="Profile">
								<% }else{ %>
								<img src="<%=root%>/resources/image/profile-user.png"
									alt="Profile">
								<% } %>
							</div>
							<div class="tw-flex-1 app-profile-body">
								<a class="tw-flex tw-items-center tw-font-bold tw-text-sm link member_1118 author"
									href="#popup_menu_area" onclick="return false"
									style="color: #;"> <%=messageVo.getMem_nick() %></a>
								<div class="app-article-meta">
									<el-tooltip content="2021-11-18 17:38:35">
									<div class="app-article-meta-item">보낸 날짜 : <%=messageVo.getMsg_sendTime()%></div>
									</el-tooltip>
								</div>
							</div>
						</div>
						<div>
							<!-- 닉네임 -->

						</div>
						<div class="tw-flex tw-items-center"></div>
					</div>
					<%-- 실질적 메세지 내용 --%>
					<div class="app-member-card-body tw-pt-0">
						<textarea  readonly style="resize:none;"cols="80"> <%=messageVo.getMsgCon_text()%></textarea>
					</div>
					<%-- 메세지 답장 / 삭제 버튼 --%>
					
					<input type="hidden" id="msg_no" name="msg_no" value="<%=messageVo.getMsg_no()%>">
					<div class="app-member-card-body tw-flex tw-items-center">
						<input type="text" class="folder_name app-input tw-mr-2"
							style="margin: 0; display: none" >
						<button id="reply" class="app-button" onclick="replymessage()">답장</button>
						<button id="delete" class="app-button" onclick="deleteMsg()">삭제</button>
					</div>
					<script>
						function deleteMsg(){
							let msgNo = $("#msg_no").val();
							console.log("msgNo   "+msgNo);
							location.href="./delete.kh?msgNo="+msgNo ; 
						}
						function replymessage(){
							location.href= "./send.jsp?receiver=<%=messageVo.getMsg_sender()%>" ; 
						}
					</script>
					
				</div>
			</div>
			
		</section>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
 
<!-- 우측 사이드  -->
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>
