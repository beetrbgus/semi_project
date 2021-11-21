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


</div>


<div class="app-layout" style="height: auto !important;">

	<main class="app-content app-clearfix">

		<style>
:root { -
	-aside-width: 17.625rem;
}
</style>
		<script>
			window.onload = function() {
				var mainBanner = new Swiper('.app-main-banner', {
					direction : 'horizontal',
					pagination : {
						el : '.app-main-banner__pagination',
						type : 'fraction',
					},
					navigation : {
						nextEl : '.app-main-banner-next',
						prevEl : '.app-main-banner-prev',
					},
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

					</div>

				</div>

			</div>
			<jsp:include page="/template/leftSide.jsp"></jsp:include>
			<div id="app-board" class="app-board-skin ">
				<div id="board-list">
					<div class="app-board-header">
						<div class="app-board-title">
							<div class="tw-flex tw-items-center">
								<a
									class="tw-inline-block tw-font-medium tw-text-2xl tw-font-bold tw-mr-1"
									href="/community">커뮤니티 </a>
								<div class="tw-flex-1"></div>

							</div>
							<p
								class="tw-text-sm tw-text-gray-700 tw-bt-1 app-board-description">커뮤니티
								통합게시판입니다</p>
						</div>
					</div>

					<div class="app-board-section">

						<div class="app-card">
							<ul class="app-board-template-list">
								<li class="notice"><a href="/community/460"
									class="tw-flex tw-items-start tw-flex-wrap"> <span
										class="tw-text-primary tw-font-bold tw-mr-3">공지</span>
										<div class="tw-flex-1">
											<span class="tw-mr-1">커뮤니티 게시판 이용 안내</span>

											<ion-icon name="image-outline"
												class="app-board-type-icon tw-mr-1 md hydrated" role="img"
												aria-label="image outline"></ion-icon>
										</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/1125">

										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">'ㅅ' 언제 개장되나요</span>

											</div>

											<div class="app-list-meta">

												<span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/modules/board/skins/slow/assets/images/ic_profile_default.png">
														</div>

														<div class="member_1119 tw-inline-flex tw-items-center">닉네임</div>
													</div>
												</span> <span title="2021-10-15 20:31:42">2021.10.15</span> <span>
													<span class="tw-mr-1">조회</span> <span>20</span>
												</span>

											</div>
										</div>
										<div class="app-list-comment">2</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/1098">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/098/001/100x100.crop.jpg?20210503205030">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">라파 프로팀 져지 하나 추가 구매했네요</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">
												<span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/431/431.png?20210405140807"
																alt="profile" title="피니쉬라인">
														</div>

														<div class="member_431 tw-inline-flex tw-items-center">피니쉬라인</div>
													</div>
												</span> <span title="2021-05-03 20:50:29">2021.05.03</span> <span>
													<span class="tw-mr-1">조회</span> <span>27</span>
												</span>

											</div>
										</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/1061">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/061/001/100x100.crop.jpg?20210424151640">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">주말 아침 라이딩 완료</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">
												<span style="color:"></span> <span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/431/431.png?20210405140807"
																alt="profile" title="피니쉬라인">
														</div>

														<div class="member_431 tw-inline-flex tw-items-center">피니쉬라인</div>
													</div>
												</span> <span title="2021-04-24 15:16:39">2021.04.24</span> <span>
													<span class="tw-mr-1">조회</span> <span>23</span>
												</span>

											</div>
										</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/1048">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/048/001/100x100.crop.jpg?20210423135504">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">한강 라이딩 [바람과 싸운날]</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">
												<span style="color:"></span> <span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/459/459.png?20210405162634"
																alt="profile" title="운동친구">
														</div>

														<div class="member_459 tw-inline-flex tw-items-center">운동친구</div>
													</div>
												</span> <span title="2021-04-23 13:54:44">2021.04.23</span> <span>
													<span class="tw-mr-1">조회</span> <span>18</span>
												</span>

											</div>
										</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/1023">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/023/001/100x100.crop.jpg?20210422210357">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">수영완료 !</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">
												<span style="color:"></span> <span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/431/431.png?20210405140807"
																alt="profile" title="피니쉬라인">
														</div>

														<div class="member_431 tw-inline-flex tw-items-center">피니쉬라인</div>
													</div>
												</span> <span title="2021-04-22 21:03:57">2021.04.22</span> <span>
													<span class="tw-mr-1">조회</span> <span>11</span>
												</span>

											</div>
										</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/1004">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/004/001/100x100.crop.jpg?20210422174914">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">트림원 라이트 속도계 실망</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">

												<span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/459/459.png?20210405162634"
																alt="profile" title="운동친구">
														</div>

														<div class="member_459 tw-inline-flex tw-items-center">운동친구</div>
													</div>
												</span> <span title="2021-04-22 17:49:14">2021.04.22</span> <span>
													<span class="tw-mr-1">조회</span> <span>129</span>
												</span>

											</div>
										</div>
										<div class="app-list-comment">1</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/952">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/952/100x100.crop.jpg?20210421215924">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">클릿 입문 했습니다.</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">
												<span style="color:"></span> <span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/459/459.png?20210405162634"
																alt="profile" title="운동친구">
														</div>

														<div class="member_459 tw-inline-flex tw-items-center">운동친구</div>
													</div>
												</span> <span title="2021-04-21 21:59:24">2021.04.21</span> <span>
													<span class="tw-mr-1">조회</span> <span>15</span>
												</span>

											</div>
										</div>
										<div class="app-list-comment">1</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/938">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/938/100x100.crop.jpg?20210420235502">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">아레나 팀스프라이트 수영복</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">
												<span style="color:"></span> <span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/431/431.png?20210405140807"
																alt="profile" title="피니쉬라인">
														</div>

														<div class="member_431 tw-inline-flex tw-items-center">피니쉬라인</div>
													</div>
												</span> <span title="2021-04-20 23:55:02">2021.04.20</span> <span>
													<span class="tw-mr-1">조회</span> <span>24</span>
												</span>

											</div>
										</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/928">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/928/100x100.crop.jpg?20210420234445">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">나이키 베이퍼맥스 플라이니트</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">
												<span style="color:"></span> <span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/459/459.png?20210405162634"
																alt="profile" title="운동친구">
														</div>

														<div class="member_459 tw-inline-flex tw-items-center">운동친구</div>
													</div>
												</span> <span title="2021-04-20 23:44:45">2021.04.20</span> <span>
													<span class="tw-mr-1">조회</span> <span>16</span>
												</span>

											</div>
										</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/872">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/872/100x100.crop.jpg?20210420151725">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">스페셜라이즈드 에이토스 Aethos 와 루베</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">

												<span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/459/459.png?20210405162634"
																alt="profile" title="운동친구">
														</div>

														<div class="member_459 tw-inline-flex tw-items-center">운동친구</div>
													</div>
												</span> <span title="2021-04-20 15:17:25">2021.04.20</span> <span>
													<span class="tw-mr-1">조회</span> <span>90</span>
												</span>

											</div>
										</div>
										<div class="app-list-comment">1</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/849">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/849/100x100.crop.jpg?20210419230036">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">춘천 솔로 라이딩</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">
												<span style="color:"></span> <span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/431/431.png?20210405140807"
																alt="profile" title="피니쉬라인">
														</div>

														<div class="member_431 tw-inline-flex tw-items-center">피니쉬라인</div>
													</div>
												</span> <span title="2021-04-19 23:00:36">2021.04.19</span> <span>
													<span class="tw-mr-1">조회</span> <span>17</span>
												</span>

											</div>
										</div>
										<div class="app-list-comment">2</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/840">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/840/100x100.crop.jpg?20210419230410">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">수락산 기차바위</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">
												<span style="color:"></span> <span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/modules/board/skins/slow/assets/images/ic_profile_default.png">
														</div>

														<div class="member_803 tw-inline-flex tw-items-center">스위밍하이</div>
													</div>
												</span> <span title="2021-04-19 22:58:21">2021.04.19</span> <span>
													<span class="tw-mr-1">조회</span> <span>16</span>
												</span>

											</div>
										</div>
										<div class="app-list-comment">1</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/838">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/838/100x100.crop.jpg?20210419225447">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">랭킹헬멧 R1</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">
												<span style="color:"></span> <span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/431/431.png?20210405140807"
																alt="profile" title="피니쉬라인">
														</div>

														<div class="member_431 tw-inline-flex tw-items-center">피니쉬라인</div>
													</div>
												</span> <span title="2021-04-19 22:54:47">2021.04.19</span> <span>
													<span class="tw-mr-1">조회</span> <span>30</span>
												</span>

											</div>
										</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/829">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/829/100x100.crop.jpg?20210419224501">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">양수철교</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">
												<span style="color:"></span> <span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/431/431.png?20210405140807"
																alt="profile" title="피니쉬라인">
														</div>

														<div class="member_431 tw-inline-flex tw-items-center">피니쉬라인</div>
													</div>
												</span> <span title="2021-04-16 08:45:13">2021.04.16</span> <span>
													<span class="tw-mr-1">조회</span> <span>11</span>
												</span>

											</div>
										</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/825">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/825/100x100.crop.jpg?20210416082837">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">새벽수영 출격</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">
												<span style="color:"></span> <span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/431/431.png?20210405140807"
																alt="profile" title="피니쉬라인">
														</div>

														<div class="member_431 tw-inline-flex tw-items-center">피니쉬라인</div>
													</div>
												</span> <span title="2021-04-16 08:14:17">2021.04.16</span> <span>
													<span class="tw-mr-1">조회</span> <span>15</span>
												</span>

											</div>
										</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/816">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/816/100x100.crop.jpg?20210415225925">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">저수 완료요</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">
												<span style="color:"></span> <span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/431/431.png?20210405140807"
																alt="profile" title="피니쉬라인">
														</div>

														<div class="member_431 tw-inline-flex tw-items-center">피니쉬라인</div>
													</div>
												</span> <span title="2021-04-15 22:54:10">2021.04.15</span> <span>
													<span class="tw-mr-1">조회</span> <span>8</span>
												</span>

											</div>
										</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/806">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/806/100x100.crop.jpg?20210415223352">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">오늘은 수영하고 왔어요 !</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">
												<span style="color:"></span> <span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/459/459.png?20210405162634"
																alt="profile" title="운동친구">
														</div>

														<div class="member_459 tw-inline-flex tw-items-center">운동친구</div>
													</div>
												</span> <span title="2021-04-15 22:11:54">2021.04.15</span> <span>
													<span class="tw-mr-1">조회</span> <span>10</span>
												</span>

											</div>
										</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/791">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/791/100x100.crop.jpg?20210415223353">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">페니 니켈 스케이트 보드 27인치 크루져보드</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">
												<span style="color:"></span> <span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/459/459.png?20210405162634"
																alt="profile" title="운동친구">
														</div>

														<div class="member_459 tw-inline-flex tw-items-center">운동친구</div>
													</div>
												</span> <span title="2021-04-15 15:20:00">2021.04.15</span> <span>
													<span class="tw-mr-1">조회</span> <span>38</span>
												</span>

											</div>
										</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/769">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/769/100x100.crop.jpg?20210415135727">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">라파 프로팀 긴팔져지와 오스탈레티 빕숏</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">
												<span style="color:"></span> <span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/431/431.png?20210405140807"
																alt="profile" title="피니쉬라인">
														</div>

														<div class="member_431 tw-inline-flex tw-items-center">피니쉬라인</div>
													</div>
												</span> <span title="2021-04-15 11:47:11">2021.04.15</span> <span>
													<span class="tw-mr-1">조회</span> <span>63</span>
												</span>

											</div>
										</div>
								</a></li>
								<li><a class="tw-flex-1" href="/community/714">
										<div class="app-thumbnail">
											<img
												src="https://sweatee.co.kr/files/thumbnails/714/100x100.crop.jpg?20210414221219">
										</div>
										<div class="tw-flex-1">
											<div class="app-list-title tw-flex-wrap">
												<span class="tw-mr-1">내일은 진짜 수영 가야겠어요</span>

												<ion-icon name="image-outline"
													class="app-board-type-icon tw-mr-1 md hydrated" role="img"
													aria-label="image outline"></ion-icon>
											</div>

											<div class="app-list-meta">
												<span style="color:"></span> <span>

													<div class="app-list-member" style="color: #;">
														<div class="app-avatar"
															style="width: 1.25rem; height: 1.25rem;">
															<img
																src="/files/member_extra_info/profile_image/431/431.png?20210405140807"
																alt="profile" title="피니쉬라인">
														</div>

														<div class="member_431 tw-inline-flex tw-items-center">피니쉬라인</div>
													</div>
												</span> <span title="2021-04-14 21:51:27">2021.04.14</span> <span>
													<span class="tw-mr-1">조회</span> <span>7</span>
												</span>

											</div>
										</div>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="app-board-section tw-text-center"></div>
					<div class="app-fr-button-wrap"></div>
				</div>
				<jsp:include page="/template/footer.jsp"></jsp:include>
			</div>
		</div>
	</main>
	<jsp:include page="/template/rightSide.jsp"></jsp:include>
</div>

	<jsp:include page="/template/bottomNav.jsp"></jsp:include>