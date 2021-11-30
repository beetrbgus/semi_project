<%@page import="wishFit.beans.reply.ReplyVo"%>
<%@page import="wishFit.beans.reply.ReplyDao"%>
<%@page import="wishFit.beans.reply.ReplyDto"%>
<%@page import="wishFit.beans.board.BoardDto"%>
<%@page import="wishFit.beans.board.BoardDao"%>
<%@page import="wishFit.beans.image.ImageDto"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.image.ImageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%-- 수정 버튼을 눌렀을 때 처리되도록 구현하는 스크립트 --%>
<!-- <script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
   $(function(){
      $(".view-row").find(".edit-btn").click(function(){
         $(this).parents("tr.view-row").hide();
         $(this).parents("tr.view-row").next("tr.edit-row").show();
      });
      
      $(".edit-row").find(".edit-cancel-btn").click(function(){
         $(this).parents("tr.edit-row").hide();
         $(this).parents("tr.edit-row").prev("tr.view-row").show();
      });
      
      $(".edit-row").hide();
   });
</script>     -->

<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>

<%
String root = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="../css/commons.css">
<link rel="stylesheet"href="<%=root%>/resources/files/cache/assets/compiled/92b01c3552e164431c570224468c40fb97bd6173.default.scssdedd.css" />
<link rel="stylesheet"href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.base.scssdedd.css?20210328011802" />
<link rel="stylesheet"href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.extra-form.scssdedd.css?20210328011802" />
<link rel="stylesheet"href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.header.scssdedd.css?20210328011802" />
<link rel="stylesheet"href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.status-icon.scssdedd.css?20210328011802" />
<link rel="stylesheet"href="<%=root%>/resources/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.card.scssdedd.css?20210328011802" />
<link rel="stylesheet"href="<%=root%>/resources/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.base.scssdedd.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.card.scssdedd.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.base.scssdedd.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/resources/layouts/slow/dist/tailwinda57e.css?20210328005042" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/0c46cbbcd7a9340dcec29a5f4b47387528071311.footer.scss9b31.css?20210328101159" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/f5933e9734ab872da414bc80ea05c3e4005da64b.variables.scssdedd.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.base.scssdedd.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.extra-form.scssdedd.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.header.scssdedd.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.status-icon.scssdedd.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/d7377ea102fb3df171546870343c4fd5b8031320.article.scssedd3.css?20210328112551" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/d7377ea102fb3df171546870343c4fd5b8031320.article-content.scssedd3.css?20210328112551" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/736a915c9ddff6feca7982c1a2b877606699d39a.article-floating-menu.scssedd3.css?20210328112551" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/d7377ea102fb3df171546870343c4fd5b8031320.article-footer.scssedd3.css?20210328112551" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/cef9c145365caeccebda0654941af79c1fdc680a.article-vote.scssedd3.css?20210328112551" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/d7377ea102fb3df171546870343c4fd5b8031320.article-signature.scssedd3.css?20210328112551" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/208a1be36b893eccfc7810e02e367a3963e078e8.article-author-post.scssedd3.css?20210328112551" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/208a1be36b893eccfc7810e02e367a3963e078e8.article-author-post-item--card.scssedd3.css?20210328112551" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/626a0560fdf40821b47677ed4550e8281b1325e9.comment.scssedd3.css?20210328112551" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/7d36492a48fd8cffd2ead2534dc6482f85ff2698.comment-vote.scsse6f9.css?20210328112600" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/92b01c3552e164431c570224468c40fb97bd6173.default.scssdedd.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/bc907f3f881d545045a5d59036747dfda675bb7a.fr-button.scssdedd.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/resources/modules/affiliatelinkconvert/tpl/css/dis_funcf8a3.css?20210328113506" />
<link rel="stylesheet" href="<%=root%>/resources/files/cache/assets/compiled/02d0979eb468efbabe5aa16b3b137eb28a1b647b.style.scss7f16.css?20210330204710" />

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
<jsp:include page="/page/js/popup.jsp"></jsp:include>
<style>
:root { -
   -aside-width: 17.625rem;
}
</style>


<%
int boardNo = Integer.parseInt(request.getParameter("boardNo"));
%>

<!-- 처리 -->

<%
// 현재 게시글에 대한 파일 정보를 조회
//MarketFileDao marketFileDao = new MarketFileDao();
//List<MarketFileDto> marketFileList = marketFileDao.find(boardNo);

ImageDao imageDao = new ImageDao();
List<ImageDto> imageList = imageDao.find2(boardNo);
//System.out.println(marketFileList);
%>

<!--현재 게시글에 대한 댓글 목록 조회(전체로 구현한거)-->
<%
//글 상세보기
//MarketDao marketDao = new MarketDao();
//BoardDto boardDto = marketDao.get(boardNo);//단일조회
BoardDao boardDao = new BoardDao();
BoardDto boardDto = boardDao.get(boardNo);//단일조회
String memId = (String)session.getAttribute("uid");

ReplyDto replyDto = new ReplyDto();

boardDao.readUp(boardNo,memId);//조회수 증가

boardDao.refreshReplyCount(boardNo);//댓글수 카운트 기능
//글의 댓글 목록.
ReplyDao replyDao = new ReplyDao();
List<ReplyVo> replyList = replyDao.list(boardNo);



//내글인지 아닌지 판정 해서 내글이면 수정/삭제 버튼 보이게
String memberId = (String)session.getAttribute("uid");
//String memberId = "testuser";
//내 댓글이 아닌지 판정해서 내댓글이면 수정/삭제 버튼 보이게
boolean owner = boardDto.getBoardWriter().equals(memberId);


%>


<!-- 헤더 -->

<!-- 좌측 사이드 -->
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
                     <h1 class="tw-font-bold tw-text-3xl md:tw-text-xl"><%=boardDto.getBoardTitle()%></h1>
                     <div class="tw-flex tw-items-end">
                        <div class="app-board-article-profile tw-flex tw-items-center">
                           

                           <div class="tw-flex-1 app-profile-body">
                              <a
                                 class="tw-flex tw-items-center tw-font-bold tw-text-sm link member_431 author"
                                 href="#popup_menu_area" onclick="return false"
                                 style="color: #;"><%=boardDto.getBoardWriter()%></a>
                              <div class="app-article-meta">
                                 <el-tooltip content="2021-04-06 11:19:24">
                                 <div class="app-article-meta-item"><%=boardDto.getBoardDate().substring(0,10)%></div>
                                 </el-tooltip>
                                 <div class="app-article-meta-divider">・</div>
                                 <div class="app-article-meta-item">조회수<%=boardDto.getBoardRead()%></div>
                                 <div class="app-article-meta-divider">・</div>
                                 
                                 
                                 <a href="#comment" class="app-pc-only app-article-meta-item">댓글<%=boardDto.getBoardReply()%>
                                    </a>
                              </div>
                           </div>
                        </div>
                        <div class="tw-flex-1"></div>


                     </div>
                  </div>
               </div>

               <div class="app-board-container app-article-container">

                  <div class="app-article-content app-clearfix">
                     <div class="tw-text-center tw-mb-6">

                     </div>
                     <!--BeforeDocument(512,431)-->
                     <div class="document_512_431 rhymix_content xe_content">
                        <p>
                           <%
            if (!imageList.isEmpty()) {
            %> <%
 for (ImageDto imageDto : imageList) {
 %> <img src="download.kh?imageNo=<%=imageDto.getImageNo()%>"
            width="300" height="300"> <%
 }
 %> <%
 }
 %>
                        </p>
                        <p>
                           <br />
                        </p>
                        <p></p>
                        <p><%=boardDto.getBoardPost()%></p>
                     </div>
                     <!--AfterDocument(512,431)-->
                     <div class="tw-text-center tw-pt-6">


                     </div>
                     <div class="tw-flex tw-pt-8">
                        <div class="tw-pr-6">
                        
                        <div class="tw-flex-1"></div>
                        <div style="flex: 0 0 auto;">

                        </div>
                     </div>
                  </div>


                  <div class="app-article-footer">

                  
                  </div>

               </div>


               <!-- 툴바 -->
      <div class="app-article-toolbar">
        <div class="app-board-container">
          <a class="app-link" href="list.jsp">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
              <path fill-rule="evenodd" d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z" clip-rule="evenodd"></path>
            </svg>
            <span>목록으로</span>
          </a>
          
        
          <div class="tw-flex-1"></div>
          <div class="tw-ml-2 tw-mr-2 tw-text-sm">
          <%if(owner){ %>
            <form action="delete.kh" method="get">
   <input type="hidden" name="boardNo" value="<%=boardDto.getBoardNo()%>">
   <input type="submit" value="삭제">
</form>
<form action="edit.jsp?boardNo=<%=boardDto.getBoardNo()%>" method="post">
   <input type="submit" value="수정">
</form>
              <%} %>
          </div>
                    <div class="tw-ml-2 tw-mr-2 tw-text-sm">
            
          </div>      
          <a class="app-link tw-text-sm document_1295" href="#popup_menu_area" title="이 게시물을..." onclick="return false">
      
          </a>
        </div>
      </div>
 
         
           
            
            
                     

               
               </div>
            </div>

            <div class="app-author-post app-board-section app-author-post--">


            </div>

            <div class="ed text-center margin-vertical-small">

            </div>
            <div class="app-card app-board-comment app-board-section">
               <div class="app-board-comment-target" id="comment"></div>
               <div
                  class="app-comment-header app-board-container tw-flex tw-items-center">
                  <div class="tw-font-bold tw-text-base tw-mr-2">댓글</div>
                  <div class="tw-text-sm">
                     <span class="tw-text-gray-700">총 </span> <span
                        class="tw-text-primary tw-font-bold"><%=boardDto.getBoardReply()%></span><span
                        class="tw-text-gray-700">개</span>
                  </div>
               </div>


      <!-- 댓글작성 폼 -->
                    <form action="reply_insert.kh" method="post">
   <input type="hidden" name="boardNo" value="<%=boardDto.getBoardNo()%>">
   <textarea name="replyPost" required rows="4" cols="80"></textarea>


                  </div>
        <div class="tw-flex tw-items-start">
          <div class="tw-flex tw-items-center">
              
                          
            
          </div>
          
          <div class="tw-flex-1"></div>
          <button type="submit" onclick="setTextareaReplaceComment()" class="app-button app-button-rounded app-button-xs primary">등록</button>
        </div>
                      </div>
    </div>
 
  </form>
 <!-- 댓글 목록, 수정,삭제 -->
               <%
      for (ReplyVo reply : replyList) {
      %>
      <%
      //본인 댓글인지 판정 : 세션의 회원아이디와 댓글의 작성자를 비교
      //System.out.println("uid = "+memberId);
      //System.out.println("replyId = "+reply.getReplyId());
        boolean myReply = memberId.equals(reply.getReplyId());
      
      %>
      
      
      
                  
                     <div class="app-comment-profile-image-wrap tw-flex-initial">
                        <div
                           class="app-comment-profile-image app-owner-profile app-avatar">
                           <img src = "profile.kh?mpNo=<%=reply.getMpNo() %>" width="40" height="40">
                        </div>
                     </div>

                     <div class="tw-flex-1 tw-pl-4">
                        <div class="tw-flex tw-items-center tw-flex-wrap">
                           <div class="tw-flex tw-items-center tw-text-sm tw-font-bold ">

                              <a href="#popup_menu_area"
                                 class="tw-flex tw-items-center member_1137"
                                 onclick="return false" style="color: #;"><%=reply.getMemNick()%></a>
                              <!--  -->
                           </div>
                           <el-tooltip content="2021-10-18 22:43:55">
                           <div class="tw-ml-2 tw-mr-4 tw-text-gray-700"><%=reply.getReplyDate().substring(0,10)%></div>
                           </el-tooltip>

                           <div class="tw-flex-1"></div>
                           

                        </div>

                        <div class="app-comment-content tw-py-3">
                           <div>
                              <!--BeforeComment(1141,1137)-->
                              <div class="comment_1141_1137 rhymix_content xe_content">
                                 <p><%=reply.getReplyPost()%></p>
                                 <!-- 댓글삭제 -->
                                 <%if(myReply){ %>
                                 <a href="reply_delete.kh?boardNo=<%=boardDto.getBoardNo()%>&replyNo=<%=reply.getReplyNo()%>">삭제</a>
                                 <%} %>
                              </div>
                              
                              <!--AfterComment(1141,1137)-->
                           </div>
                        </div>
                        <div class="app-comment-actions tw-flex tw-items-center">
                     
            
            <%--댓글 수정 --%>
            <%if(myReply){ %>
            <form action="reply_edit.kh" method="post">
               <input type="hidden" name="boardNo"
                  value="<%=boardDto.getBoardNo()%>"> <input type="hidden"
                  name="replyNo" value="<%=reply.getReplyNo()%>">
               <textarea name="replyPost" required rows="4" cols="80">
                      <%=reply.getReplyPost()%>
                </textarea>
                <input type="submit" value="수정">
            </form>
            
            <%} %>
            
            
   
            
                           <!--#Meta:modules/board/skins/slow/components/comment/comment-vote/comment-vote.scss?$__Context->themeConfig->variables-->
                           <div class="app-comment-vote" data-target-srl="1141">
                              <button class="app-comment-vote__up" data-type="up"
                                 data-count="0" onclick="appCommentVote(this)">
                                 <ion-icon name="thumbs-up-sharp"></ion-icon>
                                 <span class="app-comment-vote__count"> </span>
                              </button>

                              <button class="app-comment-vote__down" data-type="down"
                                 data-count="0" onclick="appCommentVote(this)">
                                 <ion-icon name="thumbs-down-sharp"></ion-icon>
                                 <span class="app-comment-vote__count"> </span>
                              </button>
                           </div>
                           
                           <div class="app-dropdown">
                              <a
                                 class="app-dropdown-toggle app-icon-button app-icon-button-gray">
                                 <ion-icon name="ellipsis-horizontal-outline"></ion-icon>
                              </a>
                              <div class="app-dropdown-menu">
                                 <ul>
                                    <li></li>

                                    <li></li>

                                    <li><a href="#"
                                       onclick="doCallModuleAction('comment','procCommentDeclare','1141');return false">
                                          신고 </a></li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>
                  </li>
<%} %>

               </ul>
               <!-- 댓글작성란 -->
                     <%
      for (ReplyVo reply : replyList) {
      %>
      <%
      //본인 댓글인지 판정 : 세션의 회원아이디와 댓글의 작성자를 비교
      //System.out.println("uid = "+memberId);
      //System.out.println("replyId = "+reply.getReplyId());
        boolean myReply = memberId.equals(reply.getReplyId());
      
      %>

               
               <div id="recomment-write"
                  class="app-comment-write app-recomment-form" style="display: none">
                  <form action="https://sweatee.co.kr/" method="post"
                     onsubmit="return procFilter(this,insert_comment)">
                     <input type="hidden" name="error_return_url"
                        value="/bike/512?search_target=tag&amp;search_keyword=%EC%95%84%EC%86%8C%EC%8A%A4" /><input
                        type="hidden" name="act" value="" /> <input type="hidden"
                        name="mid" value="bike" /> <input type="hidden"
                        name="document_srl" value="512" /> <input type="hidden"
                        name="parent_srl" value="" />

                     <div class="tw-flex tw-items-center tw-mb-3">
                        <input type="text" name="nick_name" placeholder="글쓴이"
                           class="app-input tw-mr-2" style="width: 100px" /> <input
                           type="password" name="password" placeholder="비밀번호"
                           class="app-input tw-mr-2" style="width: 100px" />
                     </div>
                     <textarea id="temp-recomment" class="app-textarea"
                        style="resize: none"></textarea>
                     <textarea style="display: none;" id="editor-recomment"
                        name="content"></textarea>

                     <div class="tw-flex tw-items-start tw-pt-3">
                        <div class="tw-flex tw-items-center tw-flex-wrap tw-mb-3">



                           
                        </div>
                        <div class="tw-flex-1"></div>
                        <button type="button"
                           class="app-button app-button-rounded app-button-xs tw-mr-2"
                           onclick="jQuery('#recomment-write').toggle().parent().find('#reComment').focus();return false">취소</button>
                        <button type="submit" onclick="setTextareaReplaceReComment()"
                           class="app-button app-button-rounded app-button-xs primary"><input type="submit" value="댓글작성"></button>
                           </form>
                     </div>
                  </form>
                  <%} %>
               </div>
            </div>
            <div class="tw-text-center tw-my-3">


            </div>
         </div>

         <div class="app-board-section">

         </div>
         <div class="app-board-section tw-text-center">

            <ul class="app-pagination">
               <li class="app-active"><a
                  href="../bike5489.html?search_target=tag&amp;search_keyword=%EC%95%84%EC%86%8C%EC%8A%A4&amp;page=1&amp;division=-515&amp;last_division=0">1</a>
               </li>
            </ul>
         </div>
         <jsp:include page="/template/footer.jsp"></jsp:include>
      </div>

</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>
<div id="popup_menu_area" tabindex="0"
	style="top: 400px; left: 550px; display: none;">
	<ul>
		<li class="dispCommunicationMessages"><a href="<%=root %>/page/message/send.jsp?msg_receiver=<%=boardDto.getBoardWriter()%>" target="_blank">쪽지
				보내기</a></li>
		<li class="dispCommunicationFriend"><a href="<%=root %>/page/member/insert.kh?friendId=<%=boardDto.getBoardWriter()%>" target="_blank">친구
				등록</a></li>
	</ul>
</div>
