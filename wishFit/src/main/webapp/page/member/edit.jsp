<%@page import="wishFit.beans.member.MemberDao"%>
<%@page import="wishFit.beans.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->
<jsp:include page="/template/header.jsp"></jsp:include>
<%
	String root = request.getContextPath();
%>
<%
	String uid = (String)session.getAttribute("uid");

	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(uid);
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
			<div class="app-member-card">
				<div class="app-member-card-header">
					<h1>회원정보 수정</h1>
				</div>

				<form id="fo_insert_member" action="edit.kh" method="post"
					class="app-member-card-body">
					<input type="hidden" name="error_return_url"
						value="/index.php?mid=index&amp;act=dispMemberModifyInfo">
					<input type="hidden" name="mid" value="index">
					 <input type="hidden" name="ruleset" value="@insertMember"> 
					 <input type="hidden" name="act" value="procMemberModifyInfo"> 
						<input type="hidden" name="module" value="member"> 
						<input type="hidden" name="member_srl" value="1118"> 
						<input type="hidden" name="signature" value="">
						 <input type="hidden" name="page" value=""> 
						<input type="hidden" name="xe_validator_id" value="modules/member/skins/slow/1">
					<ul class="app-member-form">

						<li><label for="user_name"> <em>*</em> <span>이름</span>
						</label>
							<div>
								<input type="hidden" name="memName" value="<%=memberDto.getMemName()%>"> 
									<input type="text" name="memName" id="user_name"
									value="<%=memberDto.getMemName()%>" disabled="disabled"
									class="app-input app-input-expand">
							</div></li>

						<li><label for="user_id"> <em>*</em> <span>아이디</span>
						</label>
							<div>
								<input type="hidden" name="memId" value="<%=memberDto.getMemId() %>"> 
									<input type="text" name="memId" id="user_id" value="<%=memberDto.getMemId() %>"
									disabled="disabled" class="app-input app-input-expand">
							</div></li>

						<li><label for="user_pw"> <em style="color: red">*</em>
								비밀번호</label>
							<div>
								<input type="password" name="memPw" required>
							</div></li>
							
						<li><label for="user_pw"><em style="color: red">*</em>
								비밀번호 확인</label>
							<div>
								<input type="password" id="password2" required>
							</div></li>
							
						<li><label for="nick_name"><em style="color: red">*</em>
								닉네임</label>
							<div>
								<input type="text" name="memNick" id="nick_name" value="<%=memberDto.getMemNick()%>">
							</div></li>
							
						<li><label for="user_phone">전화번호</label>
							<div>
								<input type="text" name="memPhone" id="user_phone" value="<%=memberDto.getMemPhone()%>">
							</div></li>
							
						<li><label for="user_grade"> <em>*</em>
						 <span>등급</span>	</label>
							<div>
								<input type="hidden" name="memGrade" value="<%=memberDto.getMemGrade() %>"> 
									<input type="text" name="memGrade" id="user_grade"
									value="<%=memberDto.getMemGrade() %>" disabled="disabled"
									class="app-input app-input-expand">
							</div></li>
							
						<li><label for="user_gender"> <em>*</em> <span>성별</span>
						</label>
							<div>
								<input type="hidden" name="memGender" value="<%=memberDto.getMemGender() %>"> 
									<input type="text" name="memGender" id="user_grade" 
									value="<%=memberDto.getMemGender()%>"  disabled="disabled"
									class="app-input app-input-expand">
							</div></li>
					</ul>

					<div class="tw-text-right tw-pt-6">
						<a class="app-button tw-mr-1" href="mypage.jsp">취소</a>
						<input type="submit" class="app-button primary" value="수정">
					</div>

					<input type="hidden" name="_rx_csrf_token" value="dALfXx8EwiEO2GYj">
					<%
					if (request.getParameter("error") != null) {
					%>
					<h5>
						<font color="red">올바른 정보 수정을 하십시오.</font>
					</h5>
					<%} %>
				</form>
			</div>
		</section>
	</div>
	
	<!-- 푸터 -->
	<jsp:include page="/template/footer.jsp"></jsp:include>
</main>


	<!-- 우측 사이드  -->
	<jsp:include page="/template/rightSide.jsp"></jsp:include>
	<jsp:include page="/template/bottomNav.jsp"></jsp:include>