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
<script>
function messageValid(){
	$("#msgBtn").click(function(){
		$("#messageform").submit();
	});
}
</script>
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
			<div class="app-member-side">
				<div class="app-member-card app-member-profile">
					<div class="app-member-card-body">
						<div class="app-avatar tw-mb-2">
							<!--  회원 프로필 사진 -->
							<img src="/modules/member/skins/slow/img/ic_profile_default.png"
								alt="profile_image"
							>
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
						<li><a
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
						<li><a
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
			<form action="send.kh" method="post" id="messageform">
			<div class="app-member-content">
				<div class="app-member-card">
					<div class="app-member-card-header">
						<input type="text" name="msg_title" placeholder="제목을 입력하세요." required>
					</div>

					<div class="app-member-card-body">
						<div class="app-board-article-profile tw-flex tw-items-center">
							<div class="app-profile-image app-avatar">
								<%-- 받는 사람 프로필 사진. --%>
								<img
									src="/modules/board/skins/slow/assets/images/ic_profile_default.png"
									alt="Profile"
								>
							</div>

							<div class="tw-flex-1 app-profile-body">
							<%-- 받는 사람 닉네임. --%>
							<input type="hidden" name="msg_receiver" value="">
								<a class="tw-flex tw-items-center tw-font-bold tw-text-sm link member_1118 author"
									href="#popup_menu_area" onclick="return false"
									style="color: #;"
								> 소얀</a>
							</div>
						</div>
						<div>
							

						</div>
						<div class="tw-flex tw-items-center"></div>
					</div>
					<%-- 실질적 메세지 내용 --%>
					<div class="app-member-card-body tw-pt-0">
						<textarea name="msg_text" rows="10" cols="80" style="border : 1px solid gray" required></textarea>
					</div>
					<%-- 메세지 답장 / 삭제 버튼 --%>
					<div class="app-member-card-body tw-flex tw-items-center">
						<input type="text" class="folder_name app-input tw-mr-2"
							style="margin: 0; display: none" >
						<button type="button" id="msgBtn" class="app-button">전송</button>
						
					</div>
				</div>
			</div>
			</form>
		</section>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
 
<!-- 우측 사이드  -->
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>
