<%@ page language="java" contentType="text/html; charset=UTF-8	"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<%
String root = request.getContextPath();
%>

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
<style>
:root { -
	-aside-width: 17.625rem;
}
</style>

<jsp:include page="/template/leftSide.jsp"></jsp:include>

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

				</div>

			</div>

		</div>

		<div id="app-board" class="app-board-skin ">
			<div id="board-list">
				<!-- ?????? ???????????? ???????????? ???????????? ?????? -->
				<div class="app-board-header">
					<div class="app-board-title">
						<div class="tw-flex tw-items-center">
							<a
								class="tw-inline-block tw-font-medium tw-text-2xl tw-font-bold tw-mr-1"
								href="/community">???????????? </a>
							<div class="tw-flex-1"></div>
		
						</div>
						<!-- ?????? ????????? ??????  ????????? + ?????????  -->
						<p
							class="tw-text-sm tw-text-gray-700 tw-bt-1 app-board-description">
						
							???????????? ????????????????????????</p>
					</div>
				</div>
				<!-- ?????? api -->
				
				
				
				
				<!-- ?????? ????????? ?????????  -->
				<div class="app-board-section">
 					<!-- for??? ?????? ?????? -->
					<div class="app-card">
						<ul class="app-board-template-list">
							
							<li><a class="tw-flex-1" href="/community/952">
									<div class="app-thumbnail">
										<img
											src="https://sweatee.co.kr/files/thumbnails/952/100x100.crop.jpg?20210421215924">
									</div>
									
									
									
									<div class="tw-flex-1">
										<div class="app-list-title tw-flex-wrap">
											<span class="tw-mr-1">?????? ?????? ????????????.</span>

											<ion-icon name="image-outline"
												class="app-board-type-icon tw-mr-1 md hydrated" role="img"
												aria-label="image outline"></ion-icon>
										</div>

										<div class="app-list-meta">
											<span style="color:"></span> <span>

												<div class="app-list-member" style="color: #;">
													
													<div class="app-avatar"
														style="width: 1.25rem; height: 1.25rem;">
														
														<img src="#" alt="profile" >
													</div>

													<div class="member_459 tw-inline-flex tw-items-center">?????????</div>
												</div>
											</span>
											 <span title="2021-04-21 21:59:24">2021.04.21</span> 
											 <span><span class="tw-mr-1">?????? : </span> <span>?????????</span>
											</span>

										</div>
									</div>
							</a></li>
						</ul>
					</div>
				</div>
				<jsp:include page="/template/footer.jsp"></jsp:include>
			</div>
		</div>
</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
>>>>>>> refs/remotes/origin/master
<jsp:include page="/template/bottomNav.jsp"></jsp:include>