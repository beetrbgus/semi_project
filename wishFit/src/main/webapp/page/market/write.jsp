<%@page import="wishFit.beans.board.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/commons.css">
<jsp:include page="/template/header.jsp"></jsp:include>
<!-- 좌측 사이드 -->
<jsp:include page="/template/leftSide.jsp"></jsp:include>
<!-- 입력 -->
<%
String root = request.getContextPath();
//작성자 session으로 받아오기
String boardWriter=(String)session.getAttribute("uid");

%>
<style>
	.form-input{
		border-radius:6px;
		border : 1px solid #e9ecef;
	}
	.form-date{
		border-radius:6px;
		border : 1px solid #e9ecef;
	}
	.form-data{
		border-radius:6px;
		border : 1px solid #e9ecef;
	}
</style>

<link rel="stylesheet"  href="<%=root %>/resources/files/cache/assets/board_edit/board_edit_file_container_style.css">
<main class="app-content app-clearfix">
   <div class="app-clearfix">
      <div id="app-confirm" class="app-confirm">
         <div class="app-confirm__container">
            <div class="app-confirm__box">
               <div class="app-confirm__body">
                  <ion-icon class="app-confirm__icon md hydrated"
                     name="information-circle-outline" role="img"
                     aria-label="information circle outline"></ion-icon>
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
         <div class="app-write-form__back-wrap">
            <a class="app-write-form__back" href="/coordiboard"> <ion-icon
                  name="arrow-back-sharp" role="img" class="md hydrated"
                  aria-label="arrow back sharp"></ion-icon> <span>기록 작성</span>
            </a>
         </div>
         <div class="app-card">
            <div class="app-board-section app-board-section-padding">
               <form action="write.kh" method="post" enctype="multipart/form-data"
                  onsubmit="return procFilter(this, window.insert)"
                  class="ed write-form inner-container">
                  <!-- 히든으로 작성자 아이디 (세션) 보내기 -->
                  <input type="hidden" name="boardWriter" value="<%=boardWriter %>">
                  <input type="hidden" name="boardLargeName" value="마켓">
                  <input type="hidden" name="mid" value="coordiboard"> <input
                     type="hidden" name="content" value=""> <input
                     type="hidden" name="document_srl" value="">
                  <div class="tw-flex tw-items-center tw-mb-3"></div>
                  <div class="tw-flex tw-items-center sm:tw-block tw-mb-6">
                     <div class="app-select sm:tw-mb-3 sm:tw-w-full tw-mr-3">
                     <!-- 중분류 -->
                        <select name="boardMiddleName" >
                        	<option value="none">선택</option>
                           <option >판매</option>
                           <option >구매</option>
                        </select>
                        <ion-icon name="chevron-down-outline" role="img"
                           class="md hydrated" aria-label="chevron down outline"></ion-icon>
                     </div>
                     <input type="hidden" name="boardNo" value="">
                         <input type="text"
                        name="boardTitle" class="app-input tw-flex-1 sm:tw-w-full"
                        value="" autocomplete="off" placeholder="제목 작성">
                  </div>
                  <div class="app-board-editor-wrap tw-mb-3">
                     <!-- css -->
                     <!-- JS -->
                     <!--#JSPLUGIN:ckeditor-->
                     <input type="hidden" name="_saved_doc_title" value=""> 
                     <input type="hidden" name="_saved_doc_content" value=""> 
                     <input type="hidden" name="_saved_doc_document_srl" value=""> <input
                        type="hidden" name="_saved_doc_message"
                        value="자동 저장된 글이 있습니다. 복구하시겠습니까? 글을 다 쓰신 후 저장하면 자동 저장 본은 사라집니다.">
                     <div id="ckeditor_instance_1" data-editor-sequence="1"
                        data-editor-primary-key-name="document_srl"
                        data-editor-content-key-name="content" style="min-height: 0px;">
                        <div id="cke_editor1"
                           class="cke_1 cke cke_reset cke_chrome cke_editor_editor1 cke_ltr cke_browser_webkit"
                           dir="ltr" lang="ko" role="application"
                           aria-labelledby="cke_editor1_arialbl">
                           <!-- 내용 작성 부분 -->
                           <textarea name="boardPost" required class="form-input" 
                              rows="10" cols="80" placeholder="내용 작성"></textarea>
                              
                        </div>
                        
                        
                     </div>
                     <p class="editor_autosaved_message autosave_message"
                        id="editor_autosaved_message_1">&nbsp;</p>
                     <!--#JSPLUGIN:jquery.fileupload-->
                     <!--#JSPLUGIN:jquery.finderSelect-->
                     <!--#JSPLUGIN:handlebars-->
                     <div id="xefu-container-1" class="xefu-container xe-clearfix"
                        data-editor-sequence="1">
                        <div class="xefu-dropzone">
                              <input id="xe-fileupload" type="file" name="attach" accept="image/*"
                              class="fileupload-processing form-data" name="Filedata"
                              data-auto-upload="true" data-editor-sequence="1" multiple="">
                </div>
                     </div>
                  </div>
                  <div>
                     <div class="tw-flex tw-items-center tw-mb-6">
                        <div class="tw-mr-3">
                        </div>
                     </div>
                     <div class="tw-mb-3">
                     </div>
                     <div class="sm:tw-block tw-flex tw-items-center">
                        <div class="tw-flex tw-items-center sm:tw-pb-3">
                        </div>
                        <div class="tw-flex-1"></div>
                        <div class="tw-flex">
                           <%-- 취소버튼 --%>
                            <a href="<%=root %>/page/market/list.jsp" class="app-button tw-mr-2 sm:tw-flex-1">취소</a>
                           <%-- 수정버튼 --%>
                           <button type="submit" value="수정"
                              class="app-button primary sm:tw-flex-1">등록</button>
                        </div>
                     </div>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>


<!-- 푸터 -->
<jsp:include page="/template/footer.jsp"></jsp:include>
</main>

<!--  우측 사이드 -->
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>