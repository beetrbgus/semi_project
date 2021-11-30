<%@page import="wishFit.beans.board.BoardDto"%>
<%@page import="wishFit.beans.fitgroupimage.FitgroupImageDto"%>
<%@page import="wishFit.beans.fitgroupimage.FitgroupImageDao"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.board.BoardImageVO"%>
<%@page import="wishFit.beans.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%
	String root = request.getContextPath();
	BoardDao boardDao = new BoardDao();

%>

<!-- 헤더 -->
<jsp:include page="/template/header.jsp"></jsp:include>

<!-- 좌측 사이드 -->
<jsp:include page="/template/leftSide.jsp"></jsp:include>
<!-- 화면 중간. 본문 -->
<main class="app-content app-clearfix">
	<!-- 배너 부분. 인덱스 부분만 필요. -->
	<div class="app-main-banner swiper-container">
		<div class="swiper-wrapper">
			<a class="swiper-slide" href="<%=root%>/index.jsp" target="_blank"> <img class="app-main-banner-bg" 
			src="https://sweatee.co.kr/files/attach/images/113/4f0e42b21e6955439e25b0d32ac915c4.jpg" 
			alt="오픈했어요!">

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
						<div class="tw-text-base tw-font-bold">내 기록</div>

						<div class="tw-flex-1"></div>

						<a class="app-button primary app-button-xs"
							href="<%=root %>/page/record/my_record.jsp"
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
								<!-- 이 부분 반복 -->
								<%
									String boardLargeName  = "기록";
									String boardWriter=(String)session.getAttribute("uid");
									List<BoardImageVO> list = boardDao.listByLargeName(boardLargeName,boardWriter);
									for(BoardImageVO boardImageVO : list){
								%>
									<li><a href="<%=root %>/page/record/record_detail.jsp?boardNo=<%=boardImageVO.getBoardNo()%>">
											<div class="app-thumbnail">
											<%if(boardImageVO.getImageNo()!=0){ %>
												<img
													src="board/download.kh?imageNo=<%=boardImageVO.getImageNo() %>" 
													  style="width:100px; height:150px;"
												>
												<%}else{ %>
													<img src = "<%=root %>/resources/common/img/no_image.gif" style="width:100px;height:150px">
												<%} %>
											</div>
											<div class="app-gallery-body">
												<div class="app-meta"></div>
											</div>
									</a></li>
									<%} %>

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
						<div class="tw-text-base tw-font-bold">소모임</div>

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
								<% 
								FitgroupImageDao fitgroupImageDao = new FitgroupImageDao();
								List<FitgroupImageDto> list2 = fitgroupImageDao.findIndex();
								for( FitgroupImageDto fitgroupImageDto: list2){
								%>
									<li><a href="<%=root %>/page/fitgroup/detail.jsp?fgNo=<%=fitgroupImageDto.getFgNo()%>">
											<div class="app-thumbnail">
											<%if(fitgroupImageDto.getFgImageNo()!=0){ %>
												<img
													src="fitgroup/download.kh?fgImageNo=<%=fitgroupImageDto.getFgImageNo() %>"
													style="width:100px; height:150px;"
												>
												<%}else{ %>
													<img src = "<%=root %>/resources/common/img/no_image.gif" style="width:100px;height:150px">
												<%} %>
												<!--  -->
											</div>
											<div class="app-gallery-body">
												<div class="app-meta"></div>
											</div>
									</a></li>
									<%} %>
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
			<!-- 광고 쪽인 듯. 나중에 삭제. -->
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

		<!-- 새로운 소식 -->
		<div class="xe-widget-wrapper xe-widget"
			style="float: left; width: 49%; border-width: 0px; border-style: solid; border-color: rgb(0, 0, 0); margin: 0px 0px 15px; background-image: none; background-repeat: repeat; background-position: 0% 0%;"
		>
			<div class="app-widgetstyle-wrap" style="height: 100%">
				<div class="app-widgetstyle-card app-card">
					<div class="app-widgetstyle-header">
						<div class="tw-text-base tw-font-bold">커뮤니티</div>

						<div class="tw-flex-1"></div>

						<a class="app-button primary app-button-xs" href="<%=root%>/page/community/list.jsp">더보기</a>
					</div>

					<div class="app-clearfix">
						<div style="*zoom: 1; padding: 0px 0px 0px 0px !important;">
							<!--#Meta:widgets/content/skins/slow/assets/css/widget.scss?$__Context->themeConfig->variables-->
							<div class="app-widget-content-main">
								<!--#Meta:widgets/content/skins/slow/templates/normal/normal.scss?$__Context->themeConfig->variables-->
								<ul class="app-widget-content app-widget-content-normal">
								<!-- 반복부분 -->
								<%
									boardLargeName="커뮤니티";
									List<BoardDto> list3 = boardDao.listByLargeName2(boardLargeName);
									for(BoardDto boardDto : list3){
								%>
									<li><a href="<%=root%>/page/community/detail.jsp?boardNo=<%=boardDto.getBoardNo()%>">
											<div class="tw-flex tw-items-center tw-flex-wrap">
												<div class="tw-mr-3">

													<span
														class="tw-text-sm tw-font-bold tw-text-gray-700 tw-mr-1"
														style="color: !important;"
													><%=boardDto.getBoardMiddleName()%></span>

													<span class="tw-text-sm"><%=boardDto.getBoardTitle()%></span>
												</div>
											</div>
											<div>
											<%String boardTime = boardDto.getBoardDate().substring(0,10);%>
												<span class="tw-text-xs tw-text-gray-700"><%=boardTime%></span>
											</div>
									</a></li>
									<%} %>

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 스위티 마켓 -->
		<div class="xe-widget-wrapper xe-widget"
			style="float: right; width: 49%; border-width: 0px; border-style: solid; border-color: rgb(0, 0, 0); margin: 0px 0px 15px; background-image: none; background-repeat: repeat; background-position: 0% 0%;"
		>
			<div class="app-widgetstyle-wrap" style="height: 100%">
				<div class="app-widgetstyle-card app-card">
					<div class="app-widgetstyle-header">
						<div class="tw-text-base tw-font-bold">마켓</div>

						<div class="tw-flex-1"></div>

						<a class="app-button primary app-button-xs" href="<%=root%>/page/market/list.jsp">더보기</a>
					</div>

					<div class="app-clearfix">
						<div style="*zoom: 1; padding: 0px 0px 0px 0px !important;">
							<!--#Meta:widgets/content/skins/slow/assets/css/widget.scss?$__Context->themeConfig->variables-->
							<div class="app-widget-content-main">
								<!--#Meta:widgets/content/skins/slow/templates/normal/normal.scss?$__Context->themeConfig->variables-->
								<ul class="app-widget-content app-widget-content-normal">
								<!-- 여기 반복 -->
								<%
									boardLargeName="마켓";
									List<BoardDto> list4 = boardDao.listByLargeName2(boardLargeName);
									for(BoardDto boardDto : list4){
								%>
									<li><a href="<%=root%>/page/market/detail.jsp?boardNo=<%=boardDto.getBoardNo()%>">
											<div class="tw-flex tw-items-center tw-flex-wrap">
												<div class="tw-mr-3">

													<span class="tw-text-sm"><%=boardDto.getBoardTitle()%></span>
												</div>
											</div>
											<div>
												<span class="tw-text-xs tw-text-gray-700 tw-mr-2"><%=boardDto.getBoardMiddleName() %></span>
												<span class="tw-text-xs tw-text-gray-700"><%=boardDto.getBoardDate().substring(0,10)%></span>
											</div>
									</a></li>
									<%} %>

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


