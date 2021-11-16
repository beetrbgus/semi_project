<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 왼쪽 사이드 바 -->
<div class="app-layout">
	<!--#Meta:layouts/slow/components/sidebar-left/sidebar-left.scss?$__Context->themeConfig->variables-->
	<aside id="app-sidebar-left" class="app-layout__sidebar-left">
		<div class="app-sidebar-left app-custom-scroll">
			<!--#Meta:layouts/slow/components/sidebar-left/sidebar-left-profile.scss?$__Context->themeConfig->variables-->
			<!--#Meta:layouts/slow/components/sidebar-left/sidebar-left-nav.scss?$__Context->themeConfig->variables-->
			<nav>
				<ul class="app-card app-sidebar-left__nav">
					<li class="active open">
						<div class="app-sidebar-left__nav__item">
							<a href="index.html"> <span>Now</span>
							</a>
						</div>

					</li>
					<li class="">
						<div class="app-sidebar-left__nav__item">
							<a href="community.html"> <span>내 기록</span>
							</a>
							<ion-icon name="chevron-down-outline" class="app-sidebar-left__nav__more md hydrated" role="img" aria-label="chevron down outline">
								<div class="icon-inner">
									<svg xmlns="http://www.w3.org/2000/svg" class="ionicon s-ion-icon" viewBox="0 0 512 512"><title>Chevron Down</title><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="48" d="M112 184l144 144 144-144"></path></svg>
								</div>
							</ion-icon>
						</div>

						<ul class="app-sidebar-left__nav__child">
							<li><a href="best.html">추천글게시판</a></li>
							<li><a href="certifyboard.html">운동인증</a></li>
							<li><a href="coordiboard.html">운동코디</a></li>
							<li><a href="freeboard.html">자유게시판</a></li>
							<li><a href="humorboard.html">유머게시판</a></li>
							<li><a href="qna.html">질문게시판</a></li>
						</ul>
					</li>
					<li class="">
						<div class="app-sidebar-left__nav__item">
							<a href="infomation.html"> <span>커뮤니티</span>
							</a>
							<ion-icon name="chevron-down-outline"
								class="app-sidebar-left__nav__more"> </ion-icon>
						</div>

						<ul class="app-sidebar-left__nav__child">
							<li><a href="news.html">새로운소식</a></li>
							<li><a href="experience.html">용품/대회후기</a></li>
							<li><a href="competition.html">대회소식(생활운동)</a></li>
							<li><a href="useful.html">유용한사이트</a></li>
							<li><a href="tip.html">나만의팁</a></li>
						</ul>
					</li>
					<li class="">
						<div class="app-sidebar-left__nav__item">
							<a href="small.html"> <span>소모임</span>
							</a>
							<ion-icon name="chevron-down-outline"
								class="app-sidebar-left__nav__more"> </ion-icon>
						</div>

						<ul class="app-sidebar-left__nav__child">
							<li><a href="swim.html">수영</a></li>
							<li><a href="bike.html">자전거</a></li>
							<li><a href="run.html">달리기</a></li>
							<li><a href="hiking.html">등산</a></li>
							<li><a href="fitness.html">홈트짐트</a></li>
							<li><a href="Pilates.html">필라테스/요가</a></li>
							<li><a href="golf.html">골프</a></li>
							<li><a href="skate.html">스케이트(빙상)</a></li>
						</ul>
					</li>
					<li class="">
						<div class="app-sidebar-left__nav__item">
							<a href="elite.html"> <span>마켓</span>
							</a>
							<ion-icon name="chevron-down-outline"
								class="app-sidebar-left__nav__more"> </ion-icon>
						</div>

						<ul class="app-sidebar-left__nav__child">
							<li><a href="elitecom.html">대회소식(엘리트)</a></li>
							<li><a href="elitefree.html">자유게시판(엘리트)</a></li>
							<li><a href="counseling.html">진로고민상담</a></li>
							<li><a href="parents.html">학부모게시판</a></li>
							<li><a href="career.html">구인구직</a></li>
						</ul>
					</li>
					<li class="">
						<div class="app-sidebar-left__nav__item">
							<a href="managment.html"> <span>운영사항</span>
							</a>
							<ion-icon name="chevron-down-outline"
								class="app-sidebar-left__nav__more"> </ion-icon>
						</div>

						<ul class="app-sidebar-left__nav__child">
							<li><a href="notice.html">안내사항</a></li>
							<li><a href="event.html">이벤트</a></li>
							<li><a href="suggest.html">개선/건의</a></li>
							<li><a href="call112.html">신고</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<div class="tw-mb-5">
				<div class="widget-box widget-img">
					<a href="https://bit.ly/3wpLeXB" target="_blank"> <img
						src="files/attach/images/2021/04/03/01516931e9752f362cbc3868ee9b867e.jpg"
						style="max-width: 100%;">
					</a>
				</div>
				<br>
			</div>
		</div>
	</aside>