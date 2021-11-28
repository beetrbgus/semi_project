<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더 -->
<jsp:include page="/template/header.jsp"></jsp:include>
<%
String root = request.getContextPath();
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
			<div class="tw-w-full">
				<div class="app-member-card">
					<div class="app-member-card-header">
						<div>
							<h1>ID/PW 찾기</h1>
						</div>
					</div>
					<div class="app-member-card-body">
						<%	String memPw = request.getParameter("mem_pw"); 
								if(memPw == null){ 	%>
						<h2>해당하는 회원이 없습니다.</h2>
						<%} else {%>
						<h2>결과	<%=memPw %></h2>
						<%} %>
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