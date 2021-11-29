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
			<div class="app-member-side">
				<div class="app-member-card app-member-profile">
					<div class="app-member-card-body">
						<div class="app-avatar tw-mb-2">
							<!--  회원 프로필 사진 -->
							<img src="/modules/member/skins/slow/img/ic_profile_default.png"
								alt="profile_image">
						</div>

						<div>
							<!-- 회원등급 -->
							<span class="tw-text-primary tw-text-xs tw-mb-1">회원등급</span>
							<!-- 닉네임 -->
							<div class="tw-font-bold tw-mb-1">닉네임</div>
						</div>

					</div>
				</div>
				<div class="app-member-card app-member-menu">
					<ul>
						<li><a href="/index.php?act=dispMemberInfo&amp;mid=community">회원정보
								보기</a></li>
						<li ><a
							href="/index.php?act=dispMemberScrappedDocument&amp;mid=community"
						>스크랩 보기</a></li>
						<li><a
							href="/index.php?act=dispMemberSavedDocument&amp;mid=community"
						>저장함 보기</a></li>
						<li><a
							href="/index.php?act=dispMemberOwnDocument&amp;mid=community"
						>작성 글 보기</a></li>
						<li><a
							href="/index.php?act=dispMemberOwnComment&amp;mid=community"
						>작성 댓글 보기</a></li>
						<li ><a
							href="/index.php?act=dispMemberActiveLogins&amp;mid=community"
						>자동 로그인 관리</a></li>
						<li class="app-active"><a
							href="/index.php?act=dispCommunicationMessages&amp;mid=community"
						>쪽지함 보기</a></li>
						<li><a
							href="/index.php?act=dispCommunicationFriend&amp;mid=community"
						>친구 보기</a></li>
						<li><a
							href="/index.php?act=dispSocialxeSnsManage&amp;mid=community"
						>SNS 관리</a></li>
					</ul>
				</div>
			</div>
			<div class="app-member-content">
				<div class="app-member-card">
					<div class="app-member-card-header">
						<h1>스크랩 보기</h1>
						<span>1</span>
					</div>

					<div class="app-member-card-body">
						<div class="tw-flex tw-items-center">
							<div class="app-select tw-mr-3">
								<select id="scrap_folder_list">
									<option value="sender" selected="selected">받은 쪽지</option>
									<option value="1123">보낸 쪽지</option>
									<option value="1123">기본 폴더</option>
								</select>
								<ion-icon name="chevron-down-outline" role="img" class="md hydrated" aria-label="chevron down outline"></ion-icon>
							</div>
						</div>
					</div>
					<div class="app-member-card-body tw-pt-0">
						<ul class="app-member-list">
							<% for(MessageVo messageVo :msglist){  %>
							<li class="tw-flex tw-items-center">
								<div class="tw-flex-1">
									<!-- 쪽지 제목 -->
									<a class="tw-text-sm tw-mb-1" href="<%=root %>/page/message/detail.jsp?msg_no=<%=messageVo.getMsg_no() %>" 
										target="_blank"><%=messageVo.getMsgCon_title() %></a>

									<!-- 쪽지 하단 -->
									<div class="tw-flex tw-items-center tw-flex-wrap">
										<!-- 닉네임 -->
										<span class="tw-text-xs tw-text-gray-700 tw-mr-3"><%=messageVo.getMem_nick() %></span>
										<!-- 받은 ? 날짜 -->
										<span class="tw-text-xs tw-text-gray-700 tw-mr-3"><%=messageVo.getMsg_sendTime() %></span>
									</div>
								</div>

								<button class="app-button" type="button" onclick="">
									삭제
								</button>
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
 
<!-- 우측 사이드  -->
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>
