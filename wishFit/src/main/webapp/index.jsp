<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>

<!-- 헤더 -->
<jsp:include page="/template/header.jsp"></jsp:include>


<!-- 좌측 사이드 -->
<jsp:include page="/template/leftSide.jsp"></jsp:include>

<!-- 화면 중간. 본문 -->
<main class="app-content app-clearfix">
	<!--#Meta:layouts/slow/components/main-banner/main-banner.scss?$__Context->themeConfig->variables-->
	<!-- 배너 부분. 인덱스 부분만 필요. -->
	<div class="app-main-banner swiper-container">
		<div class="swiper-wrapper">
			<a class="swiper-slide" href="notice/170.html" target="_blank"> <img
				class="app-main-banner-bg"
				src="files/attach/images/113/4f0e42b21e6955439e25b0d32ac915c4.jpg"
				alt="오픈했어요!"
			>

				<div class="app-main-banner-body">
					<div class="app-main-banner__container">
						<div class="app-main-banner__content">
							<div class="app-subtitle">베타여도 괜찮아</div>
							<div class="app-title">오픈했어요!</div>
							<div class="app-slide-button">더보기</div>
						</div>
					</div>
				</div>
			</a>
			<a class="swiper-slide"
				href="https://page.stibee.com/subscriptions/112053" target="_blank"> 
				<img class="app-main-banner-bg"
				src="files/attach/images/113/0eb8f0c2a6d009c5cbaa168b85823c91.jpg"
				alt="생활운동 트렌드">

				<div class="app-main-banner-body">
					<div class="app-main-banner__container">
						<div class="app-main-banner__content">
							<div class="app-subtitle">뉴스레터로 놓치지 마세요.</div>
							<div class="app-title">생활운동 트렌드</div>
							<div class="app-slide-button">구독하기</div>
						</div>
					</div>
				</div>
			</a>
		</div>
		<div class="app-main-banner__footer">
			<div class="app-main-banner__container">
				<div class="app-main-banner__pagination"></div>

				<div class="app-main-banner__indicator"></div>
				<div class="app-divider"></div>
				<div class="app-main-banner__arrow">
					<button class="app-main-banner-prev" title="이전">
						<ion-icon name="chevron-back-sharp"></ion-icon>
					</button>
					<button class="app-main-banner-next" title="다음">
						<ion-icon name="chevron-forward-sharp"></ion-icon>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 배너 제외한 영역 -->
	<div class="app-clearfix">
		<!--  영역 1 -->
		<div class="xe-widget-wrapper xe-widget"
			style="float: left; width: 49%; border-width: 0px; border-style: solid; border-color: rgb(0, 0, 0); margin: 0px 0px 15px; background-image: none; background-repeat: repeat; background-position: 0% 0%;"
		>

			<div class="app-widgetstyle-wrap" style="height: 100%">
				<div class="app-widgetstyle-card app-card">
					<div class="app-widgetstyle-header">
						<div class="tw-text-base tw-font-bold">오늘의 운동</div>

						<div class="tw-flex-1"></div>

						<a class="app-button primary app-button-xs"
							href="certifyboard.html"
						>더보기</a>
					</div>

					<div class="app-clearfix">
						<div style="*zoom: 1; padding: 0px 0px 0px 0px !important;">
							<!--#Meta:widgets/content/skins/slow/assets/css/widget.scss?$__Context->themeConfig->variables-->
							<div class="app-widget-content-main">
								<!--#Meta:widgets/content/skins/slow/templates/gallery/gallery.scss?$__Context->themeConfig->variables-->
								<ul class="app-widget-content app-gallery"
									style="grid-template-columns: repeat(3, 1fr);"
								>
									<li><a href="certifyboard/1061.html#0">
											<div class="app-thumbnail">
												<img
													src="files/thumbnails/061/001/100x75.cropfa77.jpg?20210424151650"
													srcset="https://sweatee.co.kr/files/thumbnails/061/001/200x150.crop.jpg?20210424151640 2x"
													alt="주말 아침 라이딩 완료" width="100" height="75" style=""
												>
												<!--  -->
											</div>
											<div class="app-gallery-body">
												<div class="app-meta"></div>
											</div>
									</a></li>

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--  영역 2 -->
		<div class="xe-widget-wrapper xe-widget"
			style="float: right; width: 49%; border-width: 0px; border-style: solid; border-color: rgb(0, 0, 0); margin: 0px 0px 15px; background-image: none; background-repeat: repeat; background-position: 0% 0%;"
		>
			<div class="app-widgetstyle-wrap" style="height: 100%">
				<div class="app-widgetstyle-card app-card">
					<div class="app-widgetstyle-header">
						<div class="tw-text-base tw-font-bold">오늘의 운코</div>

						<div class="tw-flex-1"></div>

						<a class="app-button primary app-button-xs"
							href="coordiboard.html"
						>더보기</a>
					</div>

					<div class="app-clearfix">
						<div style="*zoom: 1; padding: 0px 0px 0px 0px !important;">
							<!--#Meta:widgets/content/skins/slow/assets/css/widget.scss?$__Context->themeConfig->variables-->
							<div class="app-widget-content-main">
								<!--#Meta:widgets/content/skins/slow/templates/gallery/gallery.scss?$__Context->themeConfig->variables-->
								<ul class="app-widget-content app-gallery"
									style="grid-template-columns: repeat(3, 1fr);"
								>
									<li><a href="coordiboard/1023.html#0">
											<div class="app-thumbnail">
												<img
													src="files/thumbnails/023/001/100x75.cropa184.jpg?20210422210405"
													srcset="https://sweatee.co.kr/files/thumbnails/023/001/200x150.crop.jpg?20210422210357 2x"
													alt="수영완료 !" width="100" height="75" style=""
												>
												<!--  -->
											</div>
											<div class="app-gallery-body">
												<div class="app-meta"></div>
											</div>
									</a></li>

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 영역 공백 -->
		<div class="rhymix_content xe_content xe-widget-wrapper "
			style="float: left; width: 100%; border-width: 0px; border-style: solid; border-color: rgb(0, 0, 0); margin: 0px 3px 15px; background-image: none; background-repeat: repeat; background-position: 0% 0%; min-height: 0px !important; height: auto !important;"
		>
			<div style="padding: 0px 0px 0px 0px !important;">
				<script async src="../pagead2.googlesyndication.com/pagead/js/f.txt"></script>
				<!-- SWEATEE 메인 -->
				<ins class="adsbygoogle" style="display: block"
					data-ad-client="ca-pub-1560594066518337" data-ad-slot="2622954799"
					data-ad-format="auto" data-full-width-responsive="true"
				></ins>
				<script>
					(adsbygoogle = window.adsbygoogle || []).push({});
				</script>
			</div>
		</div>

		<!-- 영역 3 -->
		<div class="xe-widget-wrapper xe-widget"
			style="float: left; width: 49%; border-width: 0px; border-style: solid; border-color: rgb(0, 0, 0); margin: 0px 0px 15px; background-image: none; background-repeat: repeat; background-position: 0% 0%;"
		>
			<div class="app-widgetstyle-wrap" style="height: 100%">
				<div class="app-widgetstyle-card app-card">
					<div class="app-widgetstyle-header">
						<div class="tw-text-base tw-font-bold">새로운 소식</div>

						<div class="tw-flex-1"></div>

						<a class="app-button primary app-button-xs" href="infomation.html">더보기</a>
					</div>

					<div class="app-clearfix">
						<div style="*zoom: 1; padding: 0px 0px 0px 0px !important;">
							<!--#Meta:widgets/content/skins/slow/assets/css/widget.scss?$__Context->themeConfig->variables-->
							<div class="app-widget-content-main">
								<!--#Meta:widgets/content/skins/slow/templates/normal/normal.scss?$__Context->themeConfig->variables-->
								<ul class="app-widget-content app-widget-content-normal">
									<li><a href="news/1106.html">
											<div class="tw-flex tw-items-center tw-flex-wrap">
												<div class="tw-mr-3">

													<span
														class="tw-text-sm tw-font-bold tw-text-gray-700 tw-mr-1"
														style="color: !important;"
													>자전거</span>

													<span class="tw-text-sm">가민 가정의 달 맞이 특별 프로모션 세일</span>
												</div>
											</div>
											<div>
												<span class="tw-text-xs tw-text-gray-700 tw-mr-2">스웻티뉴스</span>
												<span class="tw-text-xs tw-text-gray-700">2021-05-04</span>
											</div>
									</a></li>

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 영역 4 -->
		<div class="xe-widget-wrapper xe-widget"
			style="float: right; width: 49%; border-width: 0px; border-style: solid; border-color: rgb(0, 0, 0); margin: 0px 0px 15px; background-image: none; background-repeat: repeat; background-position: 0% 0%;"
		>
			<div class="app-widgetstyle-wrap" style="height: 100%">
				<div class="app-widgetstyle-card app-card">
					<div class="app-widgetstyle-header">
						<div class="tw-text-base tw-font-bold">스웻티마켓</div>

						<div class="tw-flex-1"></div>

						<a class="app-button primary app-button-xs" href="market.html">더보기</a>
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
	<!-- 푸터 -->
<jsp:include page="/template/footer.jsp"></jsp:include>
</main>

<!--  우측 사이드 -->
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>


