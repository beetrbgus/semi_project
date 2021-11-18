<%@page import="wishFit.beans.member.MemberDto"%>
<%@page import="wishFit.beans.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memId = (String)session.getAttribute("ses");

	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(memId);
%>
    <jsp:include page="/template/header.jsp"></jsp:include>
    <%	String root = request.getContextPath();%>
    <link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/347b8967715ee8520a013ff5c985fb69086c462a.member.scss944d.css"/>
	<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/e2e20d8f11c73881fc0c04415f616eca07d780f1.base.scss305a.css"/>
	<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/e2e20d8f11c73881fc0c04415f616eca07d780f1.card.scss305a.css"/>
	<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/e2e20d8f11c73881fc0c04415f616eca07d780f1.input.scss305a.css"/>
	<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/e2e20d8f11c73881fc0c04415f616eca07d780f1.layout.scss305a.css"/>
	<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/e2e20d8f11c73881fc0c04415f616eca07d780f1.tab.scss305a.css"/>
	<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/255b6902485612c74d806c3142450a55116bc82e.signup-form.scssb2cb.css"/>
	<link rel="stylesheet" 
	href = "<%=root%>/resources/files/cache/assets/compiled/member-info.css">
    
    <jsp:include page="/template/leftSide.jsp"></jsp:include> 
    
    
   <main class="app-content app-clearfix">
      <!--#Meta:layouts/slow/components/main-banner/main-banner.scss?$__Context->themeConfig->variables-->
      
      <div class="app-clearfix">
        <section class="app-member"><div class="app-member-side">
  <div class="app-member-card app-member-profile">
</div> 
 <div class="app-member-card app-member-menu">
   <ul>
    <li class="app-active">
      <a href="/">내 정보 보기</a>
    </li><li>
      <a href="/">작성 게시글 보기</a>
    </li><li>
      <a href="/">작성 댓글 보기</a>
    </li><li>
      <a href="/">친구 목록</a>
    </li><li>
      <a href="/">로그아웃</a>
    </li> 
    </ul>
</div></div>


<!-- 정보 수정 -->
<div class="app-member-content">
	<div class="app-member-card">
		<div class="app-member-card-header">
			<h1>정보 수정</h1>
		</div>


	</div>
</div>


</section>
</div>
</main>
    
    <jsp:include page="/template/rightSide.jsp"></jsp:include>
    
    <jsp:include page="/template/footer.jsp"></jsp:include>