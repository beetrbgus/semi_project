<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<jsp:include page="/template/header.jsp"></jsp:include>

<!-- 좌측 사이드 -->
<jsp:include page="/template/leftSide.jsp"></jsp:include>

<!-- 화면 중간. 본문 -->
<main class="app-content app-clearfix">
	<!--#Meta:layouts/slow/components/main-banner/main-banner.scss?$__Context->themeConfig->variables-->
	<script>
		window.onload = function() {
			var mainBanner = new Swiper('.app-main-banner', {
				// Optional parameters
				direction : 'horizontal',
				// loop: true,
				// If we need pagination
				pagination : {
					el : '.app-main-banner__pagination',
					type : 'fraction',
				},
				// Navigation arrows
				navigation : {
					nextEl : '.app-main-banner-next',
					prevEl : '.app-main-banner-prev',
				},
				// And if we need scrollbar
				scrollbar : {
					el : '.app-main-banner__indicator'
				},
			})
		}
	</script>
	
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
				<a class="app-write-form__back" href="/freeboard"> <ion-icon
						name="arrow-back-sharp" role="img" class="md hydrated"
						aria-label="arrow back sharp"></ion-icon> <span>자유게시판</span>
				</a>
			</div>
			<div class="app-card">
				<div class="app-board-section app-board-section-padding">
					<form action="/" method="post"
						onsubmit="return procFilter(this, window.insert)"
						class="ed write-form inner-container" editor_sequence="2">
						<input type="hidden" name="error_return_url"
							value="/index.php?mid=freeboard&amp;act=dispBoardWrite"><input
							type="hidden" name="act" value="dispBoardWrite"> <input
							type="hidden" name="mid" value="freeboard"> <input
							type="hidden" name="content" value=""> <input
							type="hidden" name="document_srl" value="">

						<div class="tw-flex tw-items-center tw-mb-3"></div>

						<div class="tw-flex tw-items-center sm:tw-block tw-mb-6">

							<input type="text" name="title" title="제목"
								placeholder="제목을 입력해주세요."
								class="app-input tw-flex-1 sm:tw-w-full">
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
							<div id="ckeditor_instance_2" data-editor-sequence="2"
								data-editor-primary-key-name="document_srl"
								data-editor-content-key-name="content" style="min-height: 0px;">
								
							</div>
							<p class="editor_autosaved_message autosave_message"
								id="editor_autosaved_message_2">&nbsp;</p>
							<!--#JSPLUGIN:jquery.fileupload-->
							<!--#JSPLUGIN:jquery.finderSelect-->
							<!--#JSPLUGIN:handlebars-->
							<div id="xefu-container-2" class="xefu-container xe-clearfix"
								data-editor-sequence="2">

								<div class="xefu-dropzone">
									<span class="xefu-btn fileinput-button xefu-act-selectfile">
										<span><i class="xi-icon xi-file-upload"></i> 사진 및 파일 첨부</span>
										<input id="xe-fileupload" type="file"
										class="fileupload-processing " name="Filedata"
										data-auto-upload="true" data-editor-sequence="2" multiple="">
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

								<div class="xefu-controll xe-clearfix" style="display: none;">
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
								<div class="xefu-list" style="display: none;">
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
							<script>
								function reloadUploader(editor_sequence) {
									$container = jQuery('#xefu-container-'
											+ editor_sequence);
									$container.data('instance').loadFilelist(
											$container);
								}
								jQuery(function($) {
									// uploader
									var setting = {
										maxFileSize : 10485760,
										maxChunkSize : 67108864,
										autoinsertTypes : {
											"image" : true,
											"audio" : true,
											"video" : true
										},
										autoinsertPosition : "paragraph",
										singleFileUploads : true
									};
									$container = $('#xefu-container-2');
									$container.data('instance', $container
											.xeUploader(setting));
									window.xe.msg_exceeds_limit_size = '허용된 용량을 초과하여 첨부가 되지 않았습니다.';
									window.xe.msg_checked_file_is_deleted = '%d개의 첨부 파일이 삭제되었습니다.';
									window.xe.msg_file_cart_is_null = '삭제할 파일을 선택해주세요.';
									window.xe.msg_checked_file_is_deleted = '%d개의 첨부 파일이 삭제되었습니다.';
									window.xe.msg_not_allowed_filetype = '업로드할 수 없는 파일 형식입니다.';
									window.xe.msg_file_upload_error = '파일 업로드 중 에러가 발생하였습니다.';
								});
							</script>
							<script>
								jQuery(function($) {
									"use strict";
									CKEDITOR.config.customConfig = '';
									// Import CSS content from PHP.
									var css_content = "";

									// Get default font name and list of other supported fonts.
									var default_font_name = null;
									var default_font_fullname = null;
									if (default_font_fullname === null
											&& window.getComputedStyle) {
										var test_content = $(
												'<div class="rhymix_content xe_content"></div>')
												.hide().appendTo(
														$(document.body));
										var test_styles = window
												.getComputedStyle(
														test_content[0], null);
										if (test_styles
												&& test_styles.getPropertyValue) {
											default_font_fullname = test_styles
													.getPropertyValue("font-family");
											if (default_font_fullname) {
												default_font_name = $
														.trim(default_font_fullname
																.split(',')[0]
																.replace(
																		/['"]/g,
																		''));
												css_content = ".rhymix_content.editable { font-family:"
														+ default_font_fullname
														+ "; } " + css_content;
											}
										}
									}
									var font_list = [];
									font_list
											.push("Arial, Helvetica, sans-serif");
									font_list
											.push("Tahoma, Geneva, sans-serif");
									font_list
											.push("Verdana, Geneva, sans-serif");
									font_list.push("sans-serif");
									font_list
											.push("Georgia, Times New Roman, Times, serif");
									font_list
											.push("Palatino Linotype, Book Antiqua, Palatino, serif");
									font_list
											.push("Times New Roman, Times, serif");
									font_list.push("serif");
									font_list.push("Consolas, monospace");
									font_list
											.push("Courier New, Courier, monospace");
									font_list
											.push("Lucida Console, Monaco, monospace");
									font_list.push("monospace");
									font_list
											.push("\uad74\ub9bc, Gulim, sans-serif");
									font_list
											.push("\uad81\uc11c, Gungsuh, serif");
									font_list
											.push("\ub3cb\uc6c0, Dotum, sans-serif");
									font_list
											.push("\ubc14\ud0d5, Batang, serif");
									font_list
											.push("\ub9d1\uc740 \uace0\ub515, Malgun Gothic, Meiryo, Microsoft YaHei, Segoe UI, sans-serif");
									font_list
											.push("\ub098\ub214\uace0\ub515, NanumGothic, Malgun Gothic, sans-serif");
									if (default_font_fullname !== null
											&& !$.inArray(
													default_font_fullname,
													font_list)) {
										font_list.push(default_font_fullname);
									}
									font_list = $
											.map(
													font_list,
													function(val) {
														return $.trim(val
																.split(",")[0])
																+ "/" + val;
													}).join(";");

									// Get default font size and list of other supported sizes.
									var default_font_size = "13px";
									default_font_size = parseInt(
											default_font_size.replace(/\D/, ''),
											10);
									var font_sizes = [ 8, 9, 10, 11, 12, 13,
											14, 15, 16, 18, 20, 24, 28, 32, 36,
											40, 48 ];
									if (!$.inArray(default_font_size,
											font_sizes)) {
										font_sizes.push(default_font_size);
										font_sizes.sort();
									}
									font_sizes = $.map(font_sizes,
											function(val) {
												return val + "/" + val + "px";
											}).join(";");

									// Apply auto dark mode.
									var editor_skin = 'moono-lisa';
									var editor_color = null;
									$('body').addClass('cke_auto_dark_mode');
									if (getColorScheme() === 'dark') {
										if (editor_skin !== 'moono-lisa') {
											editor_skin = 'moono-dark';
										}
									}

									// Initialize CKEditor settings.
									var settings = {
										ckeconfig : {
											height : '300',
											skin : editor_skin,
											contentsCss : [],
											xe_editor_sequence : 2,
											font_defaultLabel : default_font_name,
											font_names : font_list,
											fontSize_defaultLabel : default_font_size,
											fontSize_sizes : font_sizes,
											toolbarCanCollapse : true,
											allowedContent : true,
											startupFocus : false,
											language : "ko",
										},
										loadXeComponent : true,
										enableToolbar : true,
										content_field : jQuery('[name=content]')
									};

									// Add style-sheet for the WYSIWYG
									$(document.getElementsByTagName('link'))
											.each(
													function() {
														if ($(this).attr('rel') == 'stylesheet') {
															settings.ckeconfig.contentsCss
																	.push($(
																			this)
																			.attr(
																					'href'));
														}
													});
									// Prevent removal of icon fonts and Google code.
									CKEDITOR.dtd.$removeEmpty.i = 0;
									CKEDITOR.dtd.$removeEmpty.ins = 0;

									// Set the timestamp for plugins.
									CKEDITOR.timestamp = '607838F9';
									// Add editor components.
									settings.ckeconfig.xe_component_arrays = {
										emoticon : '이모티콘 출력',
										image_link : '이미지 추가',
										poll_maker : '설문조사',
										image_gallery : '이미지 갤러리'
									};
									// Set default toolbar status.
									settings.ckeconfig.toolbarStartupExpanded = true;
									// Add or remove plugins based on Rhymix configuration.
									settings.ckeconfig.removePlugins = "liststyle,tabletools,tableselection,contextmenu,exportpdf";

									// https://github.com/rhymix/rhymix/issues/932
									if (CKEDITOR.env.iOS) {
										settings.ckeconfig.extraPlugins = (settings.ckeconfig.extraPlugins ? (settings.ckeconfig.extraPlugins + ',')
												: '')
												+ 'divarea,ios_enterkey';
										settings.ckeconfig.removePlugins = (settings.ckeconfig.removePlugins ? (settings.ckeconfig.removePlugins + ',')
												: '')
												+ 'enterkey';
										settings.loadXeComponent = false;
										var additional_styles = '.cke_wysiwyg_div { padding: 8px !important; }';
										additional_styles += 'html { min-width: unset; min-height: unset; width: unset; height: unset; margin: unset; padding: unset; }';
										$('head')
												.append(
														'<st' + 'yle>'
																+ additional_styles
																+ String(
																		css_content)
																		.replace(
																				/\.rhymix_content\.editable/g,
																				'.cke_wysiwyg_div')
																+ '</st' + 'yle>');
									}
									// Define the simple toolbar.
									CKEDITOR.addCss(css_content);
									// Initialize CKEditor.
									var ckeApp = $('#ckeditor_instance_2')
											.XeCkEditor(settings);

									// Add use_editor and use_html fields to parent form.
									var parentform = $('#ckeditor_instance_2')
											.parents('form');
									var use_editor = parentform
											.find("input[name='use_editor']");
									var use_html = parentform
											.find("input[name='use_html']");
									if (use_editor.size()) {
										use_editor.val("Y");
									} else {
										parentform
												.append('<input type="hidden" name="use_editor" value="Y" />');
									}
									if (use_html.size()) {
										use_html.val("Y");
									} else {
										parentform
												.append('<input type="hidden" name="use_html" value="Y" />');
									}
								});
							</script>
						</div>

						<div>
							<div class="tw-flex tw-items-center tw-mb-6">


								<div class="tw-mr-3">
									<input id="comment_status" class="app-toggle" type="checkbox"
										name="comment_status" value="ALLOW" checked="checked">
									<label for="comment_status">댓글 허용</label>
								</div>
							</div>

							<div class="tw-mb-3">
								<label for="tags"
									class="tw-block tw-text-blck tw-font-bold tw-mb-1">태그</label> <input
									type="text" name="tags" id="tags" value=""
									class="app-input app-input-expand" title="Tag"
									placeholder="쉼표(,)를 이용하여 복수 등록">
							</div>

							<div class="sm:tw-block tw-flex tw-items-center">
								<div class="tw-flex tw-items-center sm:tw-pb-3">
									<button type="button" onclick="doDocumentSave(this)"
										class="app-button tw-mr-2">임시 저장</button>
									<button type="button" onclick="doDocumentLoad(this)"
										class="app-button tw-mr-2">불러오기</button>
								</div>
								<div class="tw-flex-1"></div>

								<div class="tw-flex">
									<a href="/freeboard" class="app-button tw-mr-2 sm:tw-flex-1">취소</a>
									<button type="submit" onclick="return duplicateCheck(this)"
										class="app-button primary sm:tw-flex-1">등록</button>
								</div>
							</div>
						</div>
						<input type="hidden" name="_rx_csrf_token"
							value="n8e5RN33sXc3frld"><input type="hidden"
							name="use_editor" value="Y"><input type="hidden"
							name="use_html" value="Y">
					</form>
				</div>

			</div>
			<script>
				function duplicateCheck(obj) {
					const delaytime = 10000 // 몇초 후 재활성화 해줄 건지 설정 1000 = 1초
					let submingText = 'cmd_comment_registering' // 클릭했을 때 보여줄 멘트..등록중
					const ori_text = jQuery(obj).val()
					let checkInput = false

					//button 인지 submit인지 체크.
					if (!ori_text) {
						checkInput = false
						ori_text = jQuery(obj).text()
					} else {
						checkInput = true
					}

					//현재 버튼 이름이 submingText와 동일한 경우 전송중으로 판단 전송하지 않음.
					if (ori_text == submingText)
						return false

						//기존 멘트를 바꿔준다.
					if (!checkInput)
						jQuery(obj).text(submingText)
					else
						jQuery(obj).val(submingText)

						// 설정한 시간이 지나면 다시 활성화
					setTimeout(function() {
						if (checkInput)
							jQuery(obj).val(ori_text)
						else
							jQuery(obj).text(ori_text)
					}, delaytime)

					return true
				}
			</script>
		</div>
	</div>
	<!--#Meta:layouts/slow/components/footer/footer.scss?$__Context->themeConfig->variables-->
	<jsp:include page="/template/footer.jsp"></jsp:include>
</main>

<!--  우측 사이드 -->
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>


