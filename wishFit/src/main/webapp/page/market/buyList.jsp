<%@page import="wishFit.beans.image.ImageDao"%>
<%@page import="wishFit.beans.image.ImageDto"%>
<%@page import="wishFit.beans.board.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8	"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<%
String root = request.getContextPath();
%>
<%

String boardMiddleName = "구매";
 
BoardDao boardDao = new BoardDao();
List<BoardDto> list2 = boardDao.list2(boardMiddleName); //boardMiddleName
%>
<% 
ImageDao imageDao = new ImageDao();
ImageDto imageDto = new ImageDto();


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
				<!-- 현재 대분류가 무엇인지 나타내는 영역 -->
				<div class="app-board-header">
					<div class="app-board-title">
						<div class="tw-flex tw-items-center">
							<a
								class="tw-inline-block tw-font-medium tw-text-2xl tw-font-bold tw-mr-1"
								href="/community">마켓 </a>
							<div class="tw-flex-1"></div>
								<a href="write.jsp" class="app-button app-button-rounded primary">
							      <ion-icon name="add-outline" role="img" class="md hydrated" aria-label="add outline"></ion-icon>
							      <span>글작성</span>
							    </a>
						</div>
						<!-- 현재 게시판 이름  대분류 + 중분류  -->
						<p
							class="tw-text-sm tw-text-gray-700 tw-bt-1 app-board-description">
							마켓 구매게시판입니다</p>
					</div>
				</div>
				
				<!-- 현재 게시판 게시글  -->
				<div class="app-board-section">

					<div class="app-card">
						<ul class="app-board-template-list">
								<%for(BoardDto boardDto : list2){ %>
							<li><a class="tw-flex-1" href="detail.jsp?boardNo=<%=boardDto.getBoardNo()%>">
									<!-- 보류 <div class="app-thumbnail">
									 이미지 번호를 가져오면 프로필 가져올수 있다.
									
									 
 										<img src="download.kh?imageNo=<%=imageDto.getImageNo()%>">
									</div>-->
									<div class="tw-flex-1">
										<div class="app-list-title tw-flex-wrap">
											<span class="tw-mr-1"><%=boardDto.getBoardTitle() %></span>

											<ion-icon name="image-outline"
												class="app-board-type-icon tw-mr-1 md hydrated" role="img"
												aria-label="image outline"></ion-icon>
										</div>

										<div class="app-list-meta">
											<span style="color:"></span> <span>

												<div class="app-list-member" style="color: #;">
													<!--  보류-<div class="app-avatar"
														style="width: 1.25rem; height: 1.25rem;">
														<img
															src="/files/member_extra_info/profile_image/459/459.png?20210405162634"
															alt="profile" title="운동친구">
													</div>-->

													<div class="member_459 tw-inline-flex tw-items-center"><%=boardDto.getBoardWriter()%></div>
												</div>
											</span> <span title="2021-04-21 21:59:24"><%=boardDto.getBoardDate().substring(0,10) %></span> <span>
												<span class="tw-mr-1">조회</span> <span><%=boardDto.getBoardRead() %></span>
											</span>

										</div>
									</div>
							</a></li>
							
							<%} %>
							
							
							
							
						</ul>
					</div>
				</div>
				<jsp:include page="/template/footer.jsp"></jsp:include>
			</div>
		</div>
</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>