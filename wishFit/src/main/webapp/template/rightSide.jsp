<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 오른쪽 사이드 바-->
			<aside class="app-layout-aside">
				<div class="app-aside">
					<div class="app-aside-content app-aside-container tw-pb-0">
						
						<!-- 사이드바 검색창. -->
						<div class="app-aside-search">
							<svg xmlns="http://www.w3.org/2000/svg" fill="none"
								viewBox="0 0 24 24" stroke="currentColor"
							>
                                    <path stroke-linecap="round"
									stroke-linejoin="round" stroke-width="2"
									d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
								/>
                                </svg>
							<form action="https://sweatee.co.kr/" method="get">
								<input type="hidden" name="error_return_url" value="/" />
								<input type="hidden" name="vid" value="" />
								<input type="hidden" name="mid" value="index" />
								<input type="hidden" name="act" value="IS" />
								<input type="text" name="is_keyword" placeholder="검색" value=""
									class="app-aside-search-input"
								/>
							</form>
						</div>
						<!-- 인기 검색어. 나중에 필요 없으면 삭제. -->
						<div class="tw-mb-5">
							<div class="xe-widget-wrapper " style="">
								<div style="*zoom: 1; padding: 0px 0px 0px 0px !important;">
									<div id="keywordRank_482663342297" class="keywordRank">
										<ul class="rankList">
											<h2 class="rankHeader">
												실시간 인기 검색어 <a class="keyword_module" href="keyword.html"><img
													src="widgets/keywordstat/skins/default/img/link.png"
												/></a>
											</h2>
											<h2 class="rankBottom">2021년 11월 01일 기준</h2>
										</ul>
									</div>
									<script type="text/javascript">
										(function($) {
											$(document).ready(function() {$("#keywordRank_482663342297").keywordRank({
												display_item_count : '10'});});
										})(jQuery);
									</script>
								</div>
							</div>
						</div>
						
						<!-- 최근 글 영역 -->
						<div class="tw-mb-5">
							<div class="xe-widget-wrapper " style="">
								<div class="app-widgetstyle-wrap" style="height: 100%">
									<div class="app-widgetstyle-card app-card">
										<div class="app-widgetstyle-header">
											<div class="tw-text-base tw-font-bold">최근글</div>

											<div class="tw-flex-1"></div>

										</div>

										<div class="app-clearfix">
											<div style="*zoom: 1; padding: 0px 0px 0px 0px !important;">
												<!--#Meta:widgets/content/skins/slow/assets/css/widget.scss?$__Context->themeConfig->variables-->
												<div class="app-widget-content-main">
													<!--#Meta:widgets/content/skins/slow/templates/normal/normal.scss?$__Context->themeConfig->variables-->
													<ul class="app-widget-content app-widget-content-normal">
														<li><a href="sell/1139.html">
																<div class="tw-flex tw-items-center tw-flex-wrap">
																	<div class="tw-mr-3">

																		<span class="tw-text-sm">123</span>
																	</div>
																</div>
																<div>
																	<span class="tw-text-xs tw-text-gray-700 tw-mr-2">포카리스웻티</span>
																	<span class="tw-text-xs tw-text-gray-700">2021-10-18</span>
																</div>
														</a></li>
														
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 최근 댓글 영역 -->
						<div class="tw-mb-5 visible@m">
							<div class="xe-widget-wrapper " style="">
								<div class="app-widgetstyle-wrap" style="height: 100%">
									<div class="app-widgetstyle-card app-card">
										<div class="app-widgetstyle-header">
											<div class="tw-text-base tw-font-bold">최근 댓글</div>

											<div class="tw-flex-1"></div>

										</div>

										<div class="app-clearfix">
											<div style="*zoom: 1; padding: 0px 0px 0px 0px !important;">
												<div>
													<ul class="app-widget-comment">
														<li><a href="#" title="1">
																<el-tooltip content="ssuram" class="tw-mr-2">
																<div class="app-avatar"
																	style="width: 1.25rem; height: 1.25rem"
																>	
																	<!-- 댓글의 프로필 이미지 -->
																	<img
																		src="widgets/slow_comment/skins/default/assets/images/ic_profile_default.png"
																		alt="ssuram"
																	>
																</div>
																</el-tooltip>
																<!-- 댓글의 내용 길면 ...으로 짜르기. -->						
																<div class="app-widget-comment-body">1</div>
														</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div>
							<script async
								src="../pagead2.googlesyndication.com/pagead/js/f.txt"
							></script>
							<!-- SWEATEE 위젯 수직 -->
							<ins class="adsbygoogle" style="display: block"
								data-ad-client="ca-pub-1560594066518337"
								data-ad-slot="1745085451" data-ad-format="auto"
								data-full-width-responsive="true"
							></ins>
							<script>
								(adsbygoogle = window.adsbygoogle || [])
										.push({});
							</script>
						</div>
					</div>
				</div>
			</aside>
		</div>