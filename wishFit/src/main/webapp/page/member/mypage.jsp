<%@page import="wishFit.beans.member.MemberProfileDto"%>
<%@page import="wishFit.beans.member.MemberProfileDao"%>
<%@page import="wishFit.beans.member.MemberDto"%>
<%@page import="wishFit.beans.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<jsp:include page="/template/header.jsp"></jsp:include>
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
	href="<%=root%>/resources/files/cache/assets/compiled/255b6902485612c74d806c3142450a55116bc82e.signup-form.scssb2cb.css" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/347b8967715ee8520a013ff5c985fb69086c462a.member.scss944d.css" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/347b8967715ee8520a013ff5c985fb69086c462a.member-form.scss944d.css" />
<link rel="stylesheet" 
	href = "<%=root%>/resources/files/cache/assets/compiled/member-info.css">
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
						<h1>회원 정보</h1>
					</div>

					<div class="app-member-card-body">

						<ul class="app-member-info-list">
							
							<li><label for="user_id">아이디
							<span class="app-required">필수</span></label>
									<div><%=memberDto.getMemId()%></div></li>
									
							<li><label for="user_name">이름<span
									class="app-required">필수</span></label>
									<div><%=memberDto.getMemName()%></div></li>
							
							<li><label for="nick_name">닉네임<span
									class="app-required">필수</span></label>
									<div><%=memberDto.getMemNick()%></div></li>
									
							<li><label for="user_brith">생년월일</label>
							<div><%=memberDto.getMemBirth().substring(0,10)%></div></li>
							
							<li><label for="user_gender">성별
							<span class="app-required">필수</span></label>
							<div><%=memberDto.getMemGender()%></div></li>
							
							<li><label for="user_grade">등급</label>
							<div><%=memberDto.getMemGrade()%></div></li>
							
							<li><label for="user_phone">전화번호</label>
							<div><%=memberDto.getMemPhone()%></div></li>
							
							<li><label for="user_join">가입일시</label>
							<div><%=memberDto.getMemJoin()%></div></li>
							
						</ul>

						<div class="tw-flex tw-items tw-flex-wrap">
							<a href="edit.jsp" class="app-link tw-mr-3">회원정보 변경</a> 
							<div class="tw-flex-1"></div>

							<a href="quit.jsp" class="app-link tw-text-danger">회원 탈퇴</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<!-- 푸터 -->
	<jsp:include page="/template/footer.jsp"></jsp:include>
</main>

<!-- 우측 사이드  -->
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>