<%@page import="wishFit.beans.member.MemberProfileDto"%>
<%@page import="wishFit.beans.member.MemberProfileDao"%>
<%@page import="wishFit.beans.member.MemberDto"%>
<%@page import="wishFit.beans.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%
String root = request.getContextPath();

String uid = (String) request.getSession().getAttribute("uid");
System.out.println(" mypage  uid  " + uid);
// 처리
MemberDao memberDao = new MemberDao();
MemberDto memberDto = memberDao.get(uid);

// 프로필 이미지 조회
MemberProfileDao memberProfileDao = new MemberProfileDao();
MemberProfileDto memberProfileDto = memberProfileDao.get(uid);
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
<script>
	$(document).ready(function(){
		
	});
</script>
<% 
	String pageName = request.getServletPath();
	String[] pageArr= pageName.split("/");
%>
<script>
$(document).ready(function(){
	let page =$("#pageName").val();
	
	if(page == ){
		
	}
});
</script>
<input id="pageName" type="hidden" value="<%=pageArr[1]%>">
<div class="app-member-side">
	<div class="app-member-card app-member-profile">
		<div class="app-member-card-body">
			<div class="app-avatar tw-mb-2">
				<% if (memberProfileDto == null) { %>
				<img src="<%=request.getContextPath()%>/resources/image/profile-user.png"
				>
				<% } else { %>
				<img src="<%=root%>/profile.kh?mpNo=<%=memberProfileDto.getMpNo()%>"
					width="100%" >
				<% } %>
			</div>

			<div>
				<span class="tw-text-primary tw-text-xs tw-mb-1"><%=memberDto.getMemGrade()%></span>

				<div class="tw-font-bold tw-mb-1"><%=memberDto.getMemNick()%></div>
			</div>
		</div>
	</div>
	<div class="app-member-card app-member-menu">
		<ul>
			<li class="app-active"><a href="<%=root%>/page/member/mypage.jsp">내 정보 보기</a></li>
			<li><a href="<%=root%>/page/member/note_post.jsp">작성 게시글 보기</a></li>
			<li><a href="<%=root%>/page/member/note_commend.jsp">작성 댓글
					보기</a></li>
			<li><a href="<%=root%>/page/member/friend_list.jsp">친구 목록</a></li>
			<li><a href="<%=root%>/page/message/listmsg.jsp">쪽지함 보기</a></li>
			<li><a href="<%=root%>/page/member/logout.kh">로그아웃</a></li>
		</ul>
	</div>
</div>