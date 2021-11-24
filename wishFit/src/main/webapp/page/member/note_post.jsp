<%@page import="wishFit.beans.fitgroup.FitgroupDto"%>
<%@page import="wishFit.beans.fitgroup.FitgroupDao"%>
<%@page import="wishFit.beans.board.BoardDto"%>
<%@page import="wishFit.beans.board.BoardDao"%>
<%@page import="wishFit.beans.member.MemberProfileDto"%>
<%@page import="wishFit.beans.member.MemberProfileDao"%>

<%@page import="java.util.List"%>

<%@page import="wishFit.beans.member.MemberDto"%>
<%@page import="wishFit.beans.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uid = (String) session.getAttribute("uid");
	// 처리
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(uid);
%>
<%
	BoardDao boardDao = new BoardDao();
	List<BoardDto> boardMine = boardDao.boardMine("board_writer",uid);
	FitgroupDao fitgroupDao = new FitgroupDao();
	List<FitgroupDto> fitgroupMine = fitgroupDao.fitgroupMine("fg_id",uid);
	// 프로필 이미지 조회
	MemberProfileDao memberProfileDao = new MemberProfileDao();
	MemberProfileDto memberProfileDto = memberProfileDao.get(uid);
%>
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
        <div class="app-member-side">
        <div class="app-member-card app-member-profile">
					<div class="app-member-card-body">
						<div class="app-avatar tw-mb-2">
							<%if(memberProfileDto == null){ %>
								<img src="<%=request.getContextPath()%>/resources/image/profile-user.png">
							<%} else{ %>
								<img src="<%=root %>/profile.kh?mpNo=<%=memberProfileDto.getMpNo() %>">
							<%} %>
						</div>

						<div>
							<span class="tw-text-primary tw-text-xs tw-mb-1"><%=memberDto.getMemGrade()%></span>

							<div class="tw-font-bold tw-mb-1"><%=memberDto.getMemNick()%></div>
						</div>
					</div>
				</div>
		    <div class="app-member-card app-member-menu">
				  <ul>
				    <li class="app-active">
				      <a href="<%=root%>/page/member/mypage.jsp">내 정보 보기</a>
				    </li><li>
				      <a href="<%=root%>/page/member/note_post.jsp">작성 게시글 보기</a>
				    </li><li>
				      <a href="<%=root%>/page/member/note_commend.jsp">작성 댓글 보기</a>
				    </li><li>
				      <a href="<%=root%>/page/member/friend_list.jsp">친구 목록</a>
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
      <h1>작성 글 보기</h1>
    </div>
  
    <div class="app-member-card-body">
      <ul class="app-member-list">
      <%for(BoardDto boardDto : boardMine){ %>
        <li>
          <a href="#" target="_blank">
            <span><%=boardDto.getBoardTitle() %></span>
          </a>
          
          <div class="app-member-list-meta">
            <div><%=boardDto.getBoardDate() %></div>
            
            <div>
              <span>조회 수</span>
              <span class="tw-font-bold tw-text-black"><%=boardDto.getBoardRead() %></span>
            </div>
          </div>
        </li>      
        <%} %>
        <%for(FitgroupDto fitgroupDto : fitgroupMine){ %>
        <li>
          <a href="#" target="_blank">
            <span><%=fitgroupDto.getFgTitle() %></span>
          </a>
          
          <div class="app-member-list-meta">
            <div><%=fitgroupDto.getFgStarttime() %></div>
  
            <div>
              <span>카테고리</span>
              <span class="tw-font-bold tw-text-black">
              <%=fitgroupDto.getExcateName() %>
              </span>
            </div>
  
          </div>
        </li>      
        <%} %>
        </ul>
  
      <ul class="app-pagination">
        <li class="app-pagination-prev">
          <a href="/index.php?act=dispMemberOwnDocument&amp;mid=freeboard">첫 페이지</a>
        </li>
    
        <li class="app-active">
          <a href="/index.php?act=dispMemberOwnDocument&amp;mid=freeboard&amp;page=1">1</a>
        </li>        
        <li class="app-pagination-next">
          <a href="/index.php?act=dispMemberOwnDocument&amp;mid=freeboard&amp;page=1">끝 페이지</a>
        </li>
      </ul>
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
