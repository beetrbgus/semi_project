<%@page import="wishFit.beans.member.MemberDto"%>
<%@page import="wishFit.beans.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	String memId = (String)session.getAttribute("ses");
    
    // 처리
    	MemberDao memberDao = new MemberDao();
    	MemberDto memberDto = memberDao.get(memId);
    %>
    <!-- 헤더 -->
    <jsp:include page="/template/header.jsp"></jsp:include>
    <%	String root = request.getContextPath();%>
    <link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/255b6902485612c74d806c3142450a55116bc82e.signup-form.scssb2cb.css"/>
	<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/347b8967715ee8520a013ff5c985fb69086c462a.member.scss944d.css"/>
	<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/347b8967715ee8520a013ff5c985fb69086c462a.member-form.scss944d.css"/>
    <!-- 좌측 사이드 -->
    <jsp:include page="/template/leftSide.jsp"></jsp:include> 
    
<main class="app-content app-clearfix">
      
      <div class="app-clearfix">
        <section class="app-member">
        <div class="app-member-side">
    <div class="app-member-card app-member-menu">
  <ul>
    <li class="app-active">
      <a href="<%=root%>/page/member/mypage.jsp">내 정보 보기</a>
    </li><li>
      <a href="<%=root%>/page/member/note_post.jsp">작성 게시글 보기</a>
    </li><li>
      <a href="<%=root%>/">작성 댓글 보기</a>
    </li><li>
      <a href="<%=root%>/">친구 목록</a>
    </li><li>
      <a href="<%=root%>#">쪽지함 보기</a>
    </li> <li>
      <a href="<%=root%>/page/member/logout.kh">로그아웃</a>
    </li> 
    </ul>
</div>
</div>

<div class="app-member-content">
  <div class="app-member-card">
    <div class="app-member-card-header">
      <h1>회원 정보</h1>
    </div>
  
    <div class="app-member-card-body">
        
      <ul class="app-member-info-list">
     	<table border="1" width="300">
	<tbody>
		<tr>
			<th>프로필 사진</th>
			<td>
				<img src="<%=request.getContextPath()%>">
			</td>
		</tr>
		<tr>
			<th width="25%">이름</th>
			<td><%=memberDto.getMemName()%></td>
		</tr>
		<tr>
			<th >아이디</th>
			<td><%=memberDto.getMemId()%></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><%=memberDto.getMemNick()%></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><%=memberDto.getMemBirth()%></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=memberDto.getMemGender()%></td>
		</tr>
		<tr>
			<th>등급</th>
			<td><%=memberDto.getMemGrade()%></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=memberDto.getMemPhone()%></td>
		</tr>
		<tr>
			<th>가입일시</th>
			<td><%=memberDto.getMemJoin()%></td>
		</tr>
	</tbody>
</table>
      </ul>
  
      <div class="tw-flex tw-items tw-flex-wrap">
        <a href="edit.jsp" class="app-link tw-mr-3">회원정보 변경</a>
  
        <div class="tw-flex-1"></div>
  
        <a href="quit.jsp" class="app-link tw-text-danger">회원 탈퇴</a>
      </div>    </div>
  </div>  
</div>
</section>
</div>
</main>
    
    <!-- 우측 사이드  -->
    <jsp:include page="/template/rightSide.jsp"></jsp:include>
    <!-- 푸터 -->
    <jsp:include page="/template/footer.jsp"></jsp:include>