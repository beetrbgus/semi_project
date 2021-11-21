<%@page import="wishFit.beans.market.MarketFileDto"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.market.MarketFileDao"%>
<%@page import="wishFit.beans.board.BoardDto"%>
<%@page import="wishFit.beans.market.MarketDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>


<!-- 좌측 사이드 -->
<jsp:include page="/template/leftSide.jsp"></jsp:include>
<!-- 입력 -->
<%
String root = request.getContextPath();
int boardNo = Integer.parseInt(request.getParameter("boardNo"));
%>
<!-- 처리 -->
<%
MarketDao marketDao = new MarketDao();
BoardDto boardDto = marketDao.get(boardNo);

%>

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
		<!--#Meta:layouts/slow/components/common/dialog/dialog.scss?$__Context->themeConfig->variables-->
		<!--#Meta:layouts/slow/components/common/dropdown/dropdown.scss?$__Context->themeConfig->variables-->
		<!--#Meta:layouts/slow/components/common/labeled-input/labeled-input.scss?$__Context->themeConfig->variables-->
		<!--#Meta:layouts/slow/components/common/select/select.scss?$__Context->themeConfig->variables-->
		<!--#Meta:layouts/slow/components/common/toast/toast.scss?$__Context->themeConfig->variables-->
		<!--#Meta:modules/board/skins/slow/assets/css/variables.scss?$__Context->themeConfig->variables-->
		<!--#Meta:modules/board/skins/slow/assets/css/base/base.scss?$__Context->themeConfig->variables-->
		<!--#Meta:modules/board/skins/slow/assets/css/base/extra-form.scss?$__Context->themeConfig->variables-->
		<!--#Meta:modules/board/skins/slow/assets/css/base/header.scss?$__Context->themeConfig->variables-->
		<!--#Meta:modules/board/skins/slow/assets/css/base/status-icon.scss?$__Context->themeConfig->variables-->
		<div id="app-board" class="app-board-skin ">
			<!--#Meta:modules/board/skins/slow/write_form.scss?$__Context->themeConfig->variables-->
			<div class="app-write-form__back-wrap">
				<a class="app-write-form__back" href="/coordiboard"> <ion-icon
						name="arrow-back-sharp" role="img" class="md hydrated"
						aria-label="arrow back sharp"></ion-icon> <span>운동코디</span>
				</a>
			</div>
			<div class="app-card">
				<div class="app-board-section app-board-section-padding">

					<%--
  <!--  우리 폼  -->
  <form action="edit.kh" method="post" >
    <input type="hidden" name="boardNo" value="<%=boardDto.getBoardNo()%>">
        <div class="container-700 container-center">
            <div class="row center">
                <h1>마켓 게시글 수정</h1>
            </div>
            <div class="row">
                <select class="form-select" name="boardMiddleName"><%=boardDto.getBoardMiddleName()%>
                    <option>판매</option>
                    <option >구매</option>
                </select>
                <input type="text" name="boardTitle" required class="form-input-title" autocomplete="off"
                    placeholder="제목을 입력해주세요." value="<%=boardDto.getBoardTitle()%>">
            </div>
            <div class="row">
                <label>내용</label>
                <textarea name="boardPost" required class="form-input" rows="10">
                <%=boardDto.getBoardPost() %>
                </textarea>
            </div>
            
            <div class="row">
           
                <input type="submit" value="수정" class="form-button">
            </div>
        </div>
    </form>
      --%>
					<form action="edit.kh" method="post"
						onsubmit="return procFilter(this, window.insert)"
						class="ed write-form inner-container">
						<input type="hidden" name="mid" value="coordiboard"> <input
							type="hidden" name="content" value=""> <input
							type="hidden" name="document_srl" value="">

						<div class="tw-flex tw-items-center tw-mb-3"></div>

						<div class="tw-flex tw-items-center sm:tw-block tw-mb-6">
							<div class="app-select sm:tw-mb-3 sm:tw-w-full tw-mr-3">
								<select name="category_srl">
									<option value="">분류</option>
									<option value="333">수영 (6)</option>
									<option value="334">자전거 (2)</option>
									<option value="335">달리기 (1)</option>
									<option value="336">피트니스 (0)</option>
									<option value="337">필라테스/요가 (0)</option>
									<option value="338">스케이트 (0)</option>
									<option value="339">골프 (0)</option>
									<option value="340">그외종목 (1)</option>
								</select>

								<ion-icon name="chevron-down-outline" role="img"
									class="md hydrated" aria-label="chevron down outline"></ion-icon>
							</div>

							<input type="hidden" name="boardNo"
								value="<%=boardDto.getBoardNo()%>"> <input type="text"
								name="boardTitle" class="app-input tw-flex-1 sm:tw-w-full"
								value="<%=boardDto.getBoardTitle()%>" autocomplete="off">
						</div>


						<div class="app-board-editor-wrap tw-mb-3">
							<!-- css -->
							<!-- JS -->
							<!--#JSPLUGIN:ckeditor-->
							<script>
								var auto_saved_msg = "자동 저장되었습니다.";
							</script>
							<input type="hidden" name="_saved_doc_title" value=""> <input
								type="hidden" name="_saved_doc_content" value=""> <input
								type="hidden" name="_saved_doc_document_srl" value=""> <input
								type="hidden" name="_saved_doc_message"
								value="자동 저장된 글이 있습니다. 복구하시겠습니까? 글을 다 쓰신 후 저장하면 자동 저장 본은 사라집니다.">
							<div id="ckeditor_instance_1" data-editor-sequence="1"
								data-editor-primary-key-name="document_srl"
								data-editor-content-key-name="content" style="min-height: 0px;">
								<div id="cke_editor1"
									class="cke_1 cke cke_reset cke_chrome cke_editor_editor1 cke_ltr cke_browser_webkit"
									dir="ltr" lang="ko" role="application"
									aria-labelledby="cke_editor1_arialbl">
									<textarea name="boardPost" required class="form-input"
										rows="10">
                						<%=boardDto.getBoardPost() %>
                					</textarea>
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
									<span class="xefu-btn fileinput-button xefu-act-selectfile">
										<span><i class="xi-icon xi-file-upload"></i> 사진 및 파일 첨부</span>
										<input id="xe-fileupload" type="file"
										class="fileupload-processing " name="Filedata"
										data-auto-upload="true" data-editor-sequence="1" multiple="">
									</span>
									<p class="xefu-dropzone-message">여기에 파일을 끌어 놓거나 왼쪽의 버튼을
										클릭하세요.</p>
									<p class="upload_info">
										<span class="allowed_filesize_container">파일 용량 제한 : <span
											class="allowed_filesize">10.00MB</span></span> <span
											class="allowed_filetypes_container" style="display: none;">(허용
											확장자 : <span class="allowed_filetypes"></span>)
										</span>
									</p>
									<p class="xefu-progress-status" style="display: none;">
										업로드 중... (<span class="xefu-progress-percent">0%</span>)
									</p>
									<div class="xefu-progressbar" style="display: none;">
										<div></div>
									</div>
								</div>

								<div class="xefu-controll xe-clearfix" style="">
									<div style="float: left;">
										<span class="file_count">0</span>개 첨부 됨 (<span
											class="attached_size">0Byte</span> / <span
											class="allowed_attach_size">10.00MB</span>)
									</div>
									<div style="float: right">
										<input type="button" class="xefu-btn xefu-act-link-selected"
											style="vertical-align: middle; vertical-align: middle;"
											value="본문 삽입"> <input type="button"
											class="xefu-btn xefu-act-delete-selected"
											style="vertical-align: middle; vertical-align: middle;"
											value="선택 삭제">
									</div>
								</div>
								<div class="xefu-list" style="display: block;">
									<div class="xefu-list-images">
										<ul>
										</ul>
									</div>
									<div class="xefu-list-files">
										<ul>
										</ul>
									</div>
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
							       <a href="detail.jsp?boardNo=<%=boardDto.getBoardNo() %>" class="app-button tw-mr-2 sm:tw-flex-1">취소</a>
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
