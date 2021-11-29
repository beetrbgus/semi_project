<%@page import="wishFit.beans.member.FriendVo"%>
<%@page import="wishFit.beans.member.Friend_Pagination"%>
<%@page import="wishFit.beans.member.FriendDto"%>
<%@page import="wishFit.beans.member.FriendDao"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.member.MemberDto"%>
<%@page import="wishFit.beans.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uid = (String) session.getAttribute("uid");
//처리
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(uid);
	String root = request.getContextPath();
	String friendId = request.getParameter("friendId");
	
	FriendDao friendDao = new FriendDao();
	
	Friend_Pagination friendPage = new Friend_Pagination(request);
	friendPage.setUid(uid);	
	friendPage.calculate();
	List<FriendVo> friendMine = friendPage.getList();
	System.out.println("friendMine.size()     : "+friendMine.size());
%>
<!-- 헤더 -->
<jsp:include page="/template/header.jsp"></jsp:include>

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
						<h1>친구목록</h1>
						<span><%=friendPage.getCount() %></span>
					</div>
					<form method="post" action="">
					<div class="app-member-card-body">
						<div class="tw-flex tw-items-center">

						</div>
					</div>
					</form>
					<script>
					$(document).ready(function(){
						$(".app-button").on("click",function(){
							let friendNo = $(this).parent("li").find("div>input").val();
							location.href="./fdelete.kh?friendNo="+friendNo ; 
						});						
					});
					</script>
					<div class="app-member-card-body tw-pt-0">
						<ul class="app-member-list">
							<% for(FriendVo friendVo :friendMine){  %>
							<li class="tw-flex tw-items-center">
								<div class="tw-flex-1">
									<!-- 쪽지 제목 -->
									<input type="hidden" value="<%=friendVo.getFriendNo()%>"> 
									<a class="tw-text-sm tw-mb-1" href="#" ></a>

									<!-- 쪽지 하단 -->
									<div class="tw-flex tw-items-center tw-flex-wrap">
										<!-- 닉네임 -->
										<span class="tw-text-xs tw-text-gray-700 tw-mr-3"><%=friendVo.getFriendNick() %></span>

										<!-- 받은 ? 날짜 -->
										<span class="tw-text-xs tw-text-gray-700 tw-mr-3"><%=friendVo.getFriendDate() %></span>
									</div>
								</div>

								<button class="app-button" type="button">
									삭제
								</button>


							</li>
							<% } %>
						</ul>

						<ul class="app-pagination">
							<%if(friendPage.isPreviousAvailable()){ %>
							<li class="app-pagination-prev">
								<a href="/index.php?act=dispMemberScrappedDocument&amp;mid=community">
									첫 페이지
								</a>
							</li>
							<%}%>
							<% for(int i =friendPage.getStartBlock(); i <=friendPage.getLastBlock();i++ ){ %>
							<li >
								<a href="<%=root%>/page/member/friend_list?p=<%=i%>">
									<%=i%>
								</a>
							</li>
							<%}%>
							<%if(friendPage.isNextAvailable()){ %>
							<li class="app-pagination-next">
								<a href="<%=root%>/page/member/friend_list?p=<%=friendPage.getNextBlock()%>">
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