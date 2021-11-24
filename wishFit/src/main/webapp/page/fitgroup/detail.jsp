<%@page import="wishFit.beans.mysmallgroup.MySmallGroupDto"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.mysmallgroup.MySmallGroupDao"%>
<%@page import="wishFit.beans.firgroupimage.FitgroupImageDto"%>
<%@page import="wishFit.beans.firgroupimage.FitgroupImageDao"%>
<%@page import="wishFit.beans.fitgroup.FitgroupDto"%>
<%@page import="wishFit.beans.fitgroup.FitgroupDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=229c9e937f7dfe922976a86a9a2b723b&libraries=services"></script>
<script>
		$(function(){
			//지도 생성 준비 코드
			var container = document.querySelector("#map");
			var options = {
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 3
			};

			//지도 생성 코드
			var map = new kakao.maps.Map(container, options);
		});
	</script>
<%
FitgroupDao fitgroupDao = new FitgroupDao();
int fgNo = Integer.parseInt(request.getParameter("fgNo"));
FitgroupDto fitgroupDto = fitgroupDao.detail(fgNo);
String uid = "ksm01";
boolean isJoin = false;

//이미지 파일 가져오기
FitgroupImageDao fitgroupImageDao = new FitgroupImageDao();
FitgroupImageDto fitgroupImageDto = fitgroupImageDao.find(fgNo);
%>
<%
MySmallGroupDao mySmallGroupDao = new MySmallGroupDao();
List<MySmallGroupDto> list = mySmallGroupDao.search(fgNo);
// MySmallGroupDto mySmallGroupDto = new MySmallGroupDto();
// mySmallGroupDto = mySmallGroupDao.detail(fgNo, uid);
%>
<style>
:root { -
	-aside-width: 17.625rem;
}
</style>

<!-- 헤더 -->
<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>

<main class="app-content app-clearfix">
	<!--#Meta:layouts/slow/components/main-banner/main-banner.scss?$__Context->themeConfig->variables-->
<div id="map" style="width: 100%; height: 300px; border-radius: 20px;"></div>

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
							<h1 class="tw-font-bold tw-text-3xl md:tw-text-xl"><%=fitgroupDto.getFgTitle()	 %></h1>
							<div class="tw-flex tw-items-end">
								<div class="app-board-article-profile tw-flex tw-items-center">
									<div class="app-profile-image app-avatar">
										<img
											src="../files/member_extra_info/profile_image/431/431bd61.png?20210405140807"
											alt="Profile" />
									</div>

									<div class="tw-flex-1 app-profile-body">
										<a class="tw-flex tw-items-center tw-font-bold tw-text-sm link member_431 author"
											href="#" onclick="return false"><%=fitgroupDto.getFgId() %></a>
										<div class="app-article-meta">
											<el-tooltip content="2021-04-06 11:19:24">
											<div class="app-article-meta-item">2021.04.06</div>
											</el-tooltip>
											<div class="app-article-meta-divider">・</div>
											<div class="app-article-meta-item">조회 수 19</div>
											<div class="app-article-meta-divider">・</div>
											<div class="app-article-meta-item">추천 수 0</div>
											<div class="app-article-meta-divider app-pc-only">・</div>
											<a href="#comment" class="app-pc-only app-article-meta-item">댓글
												3</a>
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
									<%if(fitgroupImageDto != null) { //이미지가 없으면 안보여준다.%>	
					<img src="download.kh?fgImageNo=<%=fitgroupImageDto.getFgImageNo()%>">
					<%} %>
								</p>
								<p>
									<br />
								</p>
								<p><%=fitgroupDto.getFgIntro() %></p>
								
							</div>
							<!--AfterDocument(512,431)-->
							<div class="tw-text-center tw-pt-6">
							

							</div>
							<div class="tw-flex tw-pt-8">
								<div class="tw-pr-6">
									<ul class="app-article-tags">
									</ul>
								</div>
								<div class="tw-flex-1"></div>
								<div style="flex: 0 0 auto;">
									
								</div>
							</div>
						</div>
	<div>
					<h2>참가자 명단</h2>
					<%
					for (MySmallGroupDto mySmallGroupDto : list) {
					%>
					<tr>
						<td><%=mySmallGroupDto.getMemId()%></td>
						<%
						isJoin = (mySmallGroupDto.getMemId().equals(uid)) ? true : false;
						%>
						<%

						%>
					</tr>
					<%
					}
					%>

				</div>
					
						<div class="app-article-footer">
						
							<div class="app-article-vote" data-target-srl="512">
							<%if(isJoin){%>
								<button class="app-article-vote__up"
									onclick="location.href='cancel.kh?fgNo=<%=fitgroupDto.getFgNo()%>&memId=<%=uid%>'">
									<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
										fill="currentColor">
        <path
											d="M2 10.5a1.5 1.5 0 113 0v6a1.5 1.5 0 01-3 0v-6zM6 10.333v5.43a2 2 0 001.106 1.79l.05.025A4 4 0 008.943 18h5.416a2 2 0 001.962-1.608l1.2-6A2 2 0 0015.56 8H12V4a2 2 0 00-2-2 1 1 0 00-1 1v.667a4 4 0 01-.8 2.4L6.8 7.933a4 4 0 00-.8 2.4z" />
      </svg>
									<span class="app-article-vote__count">0</spsn>
								</button>
									<%}else{ %>
								<button class="app-article-vote__down" data-type="down"
									onclick="location.href='join.kh?fgNo=<%=fitgroupDto.getFgNo()%>'">
									<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
										fill="currentColor">
        <path
											d="M18 9.5a1.5 1.5 0 11-3 0v-6a1.5 1.5 0 013 0v6zM14 9.667v-5.43a2 2 0 00-1.105-1.79l-.05-.025A4 4 0 0011.055 2H5.64a2 2 0 00-1.962 1.608l-1.2 6A2 2 0 004.44 12H8v4a2 2 0 002 2 1 1 0 001-1v-.667a4 4 0 01.8-2.4l1.4-1.866a4 4 0 00.8-2.4z" />
      </svg>

									<span class="app-article-vote__count">0</span>
								</button>
								<%} %>
							</div>
						</div>
	
					</div>


					<!-- 툴바 -->
					<div class="app-article-toolbar">
						<div class="app-board-container">
							<a class="app-link" href="../bike.html"> <svg
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
									fill="currentColor">
              <path fill-rule="evenodd"
										d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z"
										clip-rule="evenodd" />
            </svg> <span><a href="list.jsp">목록으로</a></span>
							</a>

							<div class="tw-flex-1"></div>


							<a class="app-link tw-text-sm document_512"
								href="#popup_menu_area" title="이 게시물을..." onclick="return false">
								<svg xmlns="http://www.w3.org/2000/svg" fill="none"
									viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round"
										stroke-width="2"
										d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z" />
            </svg>
							</a>
						</div>
					</div>
				</div>

				<div class="app-author-post app-board-section app-author-post--">
					
					
				</div>

				<div class="ed text-center margin-vertical-small">
				
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
	</div>
</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>


