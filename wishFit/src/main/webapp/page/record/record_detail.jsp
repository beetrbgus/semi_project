<%@page import="wishFit.beans.board.BoardImageVO"%>
<%@page import="wishFit.beans.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>
<%
String root = request.getContextPath();

%>
<!-- 받아놔야 하는 것 boardNo / member의 memId(session) -->
 <%
	 int boardNo = Integer.parseInt(request.getParameter("boardNo"));
   	String boardWriter = (String)session.getAttribute("uid"); 
   	//String boardWriter=request.getParameter("boardWriter");
 %>
 <%
	 //상세 페이지 불러오기
   	BoardDao boardDao = new BoardDao();
   	BoardImageVO boardImageVO = boardDao.detail(boardNo);
//    	List<BoardImageVO> boardImageList = 
   	//파일 정보 조회
   	//ImageDao imageDao = new ImageDao();
   	//List<ImageDto> imgList = imageDao.find(boardNo);
   	
 %>
<link rel="stylesheet" type="text/css" href="../css/commons.css">
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/92b01c3552e164431c570224468c40fb97bd6173.default.scssdedd.css" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.base.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.extra-form.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.header.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.status-icon.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.card.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.base.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.card.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.base.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/layouts/slow/dist/tailwinda57e.css?20210328005042" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/0c46cbbcd7a9340dcec29a5f4b47387528071311.footer.scss9b31.css?20210328101159" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/f5933e9734ab872da414bc80ea05c3e4005da64b.variables.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.base.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.extra-form.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.header.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.status-icon.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/d7377ea102fb3df171546870343c4fd5b8031320.article.scssedd3.css?20210328112551" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/d7377ea102fb3df171546870343c4fd5b8031320.article-content.scssedd3.css?20210328112551" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/736a915c9ddff6feca7982c1a2b877606699d39a.article-floating-menu.scssedd3.css?20210328112551" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/d7377ea102fb3df171546870343c4fd5b8031320.article-footer.scssedd3.css?20210328112551" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/cef9c145365caeccebda0654941af79c1fdc680a.article-vote.scssedd3.css?20210328112551" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/d7377ea102fb3df171546870343c4fd5b8031320.article-signature.scssedd3.css?20210328112551" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/208a1be36b893eccfc7810e02e367a3963e078e8.article-author-post.scssedd3.css?20210328112551" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/208a1be36b893eccfc7810e02e367a3963e078e8.article-author-post-item--card.scssedd3.css?20210328112551" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/626a0560fdf40821b47677ed4550e8281b1325e9.comment.scssedd3.css?20210328112551" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/7d36492a48fd8cffd2ead2534dc6482f85ff2698.comment-vote.scsse6f9.css?20210328112600" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/92b01c3552e164431c570224468c40fb97bd6173.default.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/bc907f3f881d545045a5d59036747dfda675bb7a.fr-button.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/modules/affiliatelinkconvert/tpl/css/dis_funcf8a3.css?20210328113506" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/02d0979eb468efbabe5aa16b3b137eb28a1b647b.style.scss7f16.css?20210330204710" />

<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/92b01c3552e164431c570224468c40fb97bd6173.default.scssdedd.css" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.base.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.extra-form.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.header.scssdedd.css?20210328011802" />
<link rel="stylesheet"
   href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.status-icon.scssdedd.css?20210328011802" />
<style>
:root { -
   -aside-width: 17.625rem;
}
</style>
<!-- 메인 시작 -->
<main class="app-content app-clearfix">
   <!--#Meta:layouts/slow/components/main-banner/main-banner.scss?$__Context->themeConfig->variables-->
   <div class="app-clearfix">
      <div id="app-confirm" class="app-confirm">
         <div class="app-confirm__container">
            <div class="app-confirm__box">
               <div class="app-confirm__body">
                  <ion-icon class="app-confirm__icon"
                     name="information-circle-outline"></ion-icon>
                  <div class="app-confirm__title"></div>
                  <div class="app-confirm__description"></div>
               </div>
               <div class="app-confirm__footer">
                  <button type="button"></button>
                  <button type="submit"></button>
               </div>
            </div>
         </div>
      </div>
      <div id="app-board" class="app-board-skin ">
         <div class="app-article-wrap" style="max-width:">
            <div class="app-card app-board-section">
               <div class="app-board-article-head">
                  <div class="app-board-container">
                     <!-- <img src="https://sweatee.co.kr/files/thumbnails/512/80x80.ratio.jpg?20210417102343" alt=""> -->
                     <!-- 제목 -->
                     <h1 class="tw-font-bold tw-text-3xl md:tw-text-xl"><%=boardImageVO.getBoardTitle()%></h1>
                     <div class="tw-flex tw-items-end">
                        <div class="app-board-article-profile tw-flex tw-items-center">
                           <div class="tw-flex-1 app-profile-body">
                              <div class="app-article-meta">
<!--                                  <el-tooltip content="2021-04-06 11:19:24">뭔지 몰라 주석처리 -->
								<!-- 중분류 / 작성일 -->
                                 <div class="app-article-meta-item">
                                 분류 : <%=boardImageVO.getBoardMiddleName()%>
                                 |
                                 작성일 : <%=boardImageVO.getBoardDate().substring(0,10) %>
                                 </div>
                                 </el-tooltip>
                              </div>
                           </div>
                        </div>
                        <div class="tw-flex-1"></div>
                     </div>
                  </div>
               </div>
               <div class="app-board-container app-article-container">

                  <div class="app-article-content app-clearfix">
                     <div class="tw-text-center tw-mb-6"></div>
                     <!--BeforeDocument(512,431)-->
                     <div class="document_512_431 rhymix_content xe_content">
                     <%if(boardImageVO.getImageNo()!=0){ %>
                           <img
                              src="download.kh?imageNo=<%=boardImageVO.getImageNo() %>"
                              alt="DE53E17D-A314-4A9F-A7D0-03B276F88B39.jpeg.jpg" style="width:500 ; height:500;" />
                              <%} %>
                     </div>
                     <pre class="tw-font-bold tw-text-3xl md:tw-text-xl"><%=boardImageVO.getBoardPost() %></pre>
                     <!--AfterDocument(512,431)-->
                     <div class="tw-text-center tw-pt-6"></div>
                     <div class="tw-flex tw-pt-8">
                        <div class="tw-pr-6">
                           <ul class="app-article-tags">
                           </ul>
                        </div>
                        <div class="tw-flex-1"></div>
                        <div style="flex: 0 0 auto;"></div>
                     </div>
                  </div>
                  <div class="app-article-footer">
                     <div class="app-article-vote" data-target-srl="512">
                     </div>
                  </div>
               </div>
               <!-- 툴바 -->
               <div class="app-article-toolbar">
                  <div class="app-board-container">
                     <a class="app-link" href="my_record.jsp"> <svg
                           xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                           fill="currentColor">
              <path fill-rule="evenodd"
                              d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z"
                              clip-rule="evenodd" />
            </svg> <span>목록으로</span>
                     </a>
                     <div class="tw-flex-1"></div>
					<a class="app-link app-link tw-text-sm document_512" 
					href="record_edit.jsp?boardNo=<%=boardImageVO.getBoardNo() %>">
                     <span>수정</span>
                     </a>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="app-link app-link tw-text-sm document_512" 
                    href="record_delete.kh?boardNo=<%=boardNo%>">
              		<span>삭제</span>
                    </a>
                  </div>
               </div>
            </div>
            <div class="app-author-post app-board-section app-author-post--">
            </div>
            <div class="ed text-center margin-vertical-small"></div>
            <div class="app-card app-board-comment app-board-section">
               <div class="app-board-comment-target" id="comment"></div>
               <div id="recomment-write"
                  class="app-comment-write app-recomment-form" style="display: none">
               </div>
            </div>
            <div class="tw-text-center tw-my-3"></div>
         </div>
         <div class="app-board-section"></div>
         <div class="app-board-section tw-text-center">
         </div>
         <jsp:include page="/template/footer.jsp"></jsp:include>
      </div>
   </div>
</main>
<div id="popup_menu_area" tabindex="0"
	style="top: 400px; left: 550px; display: none;">
	<ul>
		<li class="dispCommunicationMessages"><a href="#" target="_blank">쪽지
				보내기</a></li>
		<li class="dispCommunicationFriend"><a href="#" target="_blank">친구
				등록</a></li>
	</ul>
</div>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>

