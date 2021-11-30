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
        <section class="app-member"><div class="tw-w-full">
        <div class="app-member-card">
    <div class="app-member-card-header">
      <div>
        <h1>회원 탈퇴</h1>
      </div>
    </div>
    <div class="app-member-card-body">
      <form action="quit.kh" method="post">
      <input type="hidden" name="error_return_url" value="/index.php?mid=index&amp;act=dispMemberFindAccount"><input type="hidden" name="ruleset" value="findAccount">
        <input type="hidden" name="mid" value="index">
        <input type="hidden" name="act" value="procMemberFindAccount">
        <input type="hidden" name="document_srl" value="">
        <input type="hidden" name="page" value="">
        <input type="hidden" name="xe_validator_id" value="modules/member/skin/slow/find_member_account/1">
        
        <input class="app-input app-input-expand tw-mb-3" type="password" name="memPw" required="" placeholder="비밀번호를 입력하세요" title="비밀번호"> 

        <button class="app-button app-button-expand primary" type="submit">회원 탈퇴</button>
      </form>
    </div>
  </div>
      <%if(request.getParameter("error") != null){ %>
	<h4><font color="red">입력하신 정보가 일치하지 않습니다</font></h4>
		<%} %>
   </div>
</section>      </div>
	<!-- 푸터 -->
	<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
<!-- 우측 사이드  -->
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>