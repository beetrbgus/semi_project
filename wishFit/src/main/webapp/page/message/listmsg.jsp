<%@page import="wishFit.beans.member.MemberProfileDto"%>
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
	Msg_Pagenation msg_Pagenation = new Msg_Pagenation(request);
	msg_Pagenation.setUid(uid);
	msg_Pagenation.calculate();
	List<MessageVo> msglist = msg_Pagenation.getList();
	
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
<main class="app-content app-clearfix">
	
	<div class="app-clearfix">
		<section class="app-member">
			<%-- 마이페이지 왼쪽것 --%>
			<jsp:include page="/page/message/myPageLeftSide.jsp"></jsp:include>
			<div class="app-member-content">
				<div class="app-member-card">
					<div class="app-member-card-header">
						<h1>쪽지</h1>
						<span><%=msg_Pagenation.getCount() %></span>
					</div>
					<form method="post" action="">
					<div class="app-member-card-body">
						<div class="tw-flex tw-items-center">
							<div class="app-select tw-mr-3">
								<select id="scrap_folder_list" onchange="if(this.value) location.href=(this.value)">
									<option>쪽지함 선택</option>
									<option value="./listmsg.jsp">받은 쪽지</option>
									<option value="./listmsg.jsp?column=sender&keyword=<%=uid%>">보낸 쪽지</option>
								</select>
								<ion-icon name="chevron-down-outline" role="img" class="md hydrated" aria-label="chevron down outline"></ion-icon>
							</div>
						</div>
					</div>
					</form>
					<script>
					$(document).ready(function(){
						$(".app-button").on("click",function(){
							let msgNo = $(this).parent("li").find("div>input").val();
<<<<<<< HEAD
							location.href="./delete.kh?msgNo="+msgNo ; 
=======
							location.href="./delete.kh?msgNo="+msgNo ;
>>>>>>> refs/remotes/origin/master
						});						
					});
					</script>
					<div class="app-member-card-body tw-pt-0">
						<ul class="app-member-list">
							<% for(MessageVo messageVo :msglist){  %>
							<li class="tw-flex tw-items-center">
								<div class="tw-flex-1">
									<!-- 쪽지 제목 -->
<<<<<<< HEAD
									<input type="hidden" value="<%=messageVo.getMsg_no()%>"> 
									<a class="tw-text-sm tw-mb-1" href="<%=root %>/page/message/detail.jsp?msg_no=<%=messageVo.getMsg_no() %>" 
=======
									<input type="hidden" value="<%=messageVo.getMsg_no()%>">
									<a class="tw-text-sm tw-mb-1" href="<%=root %>/page/message/detail.jsp?msg_no=<%=messageVo.getMsg_no() %>"
>>>>>>> refs/remotes/origin/master
										target="_blank"><%=messageVo.getMsgCon_title() %></a>
									<!-- 쪽지 하단 -->
									<div class="tw-flex tw-items-center tw-flex-wrap">
										<!-- 닉네임 -->
										<span class="tw-text-xs tw-text-gray-700 tw-mr-3"><%=messageVo.getMem_nick() %></span>
										<!-- 받은 ? 날짜 -->
										<span class="tw-text-xs tw-text-gray-700 tw-mr-3"><%=messageVo.getMsg_sendTime() %></span>
									</div>
								</div>
								<% if(!messageVo.getMsg_sender().equals(uid)){ %>
								<button class="app-button" type="button">
									삭제
								</button>
								<% } %>
			
							</li>
							<% } %>
						</ul>
						<ul class="app-pagination">
							<%if(msg_Pagenation.isPreviousAvailable()){ %>
							<li class="app-pagination-prev">
								<a href="/index.php?act=dispMemberScrappedDocument&amp;mid=community">
									첫 페이지
								</a>
							</li>
							<%}%>
							<% for(int i =msg_Pagenation.getStartBlock(); i <=msg_Pagenation.getLastBlock();i++ ){ %>
							<li >
								<a href="<%=root%>/page/message/listmsg?p=<%=i%>">
									<%=i%>
								</a>
							</li>
							<%}%>
							<%if(msg_Pagenation.isNextAvailable()){ %>
							<li class="app-pagination-next">
								<a href="/index.php?act=dispMemberScrappedDocument&amp;mid=community&amp;page=1">
									끝 페이지
								</a>
							</li>
							<%}%>
						</ul>
					</div>
				</div>
			</div>
		</section>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
<!-- 우측 사이드  -->
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>