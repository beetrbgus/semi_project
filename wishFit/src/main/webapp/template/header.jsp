<%@page import="wishFit.beans.message.MessageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="hydrated">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% 
String root = request.getContextPath();
String uid = (String)request.getSession().getAttribute("uid");
%>
<style data-styles="">ion-icon{visibility:hidden}.hydrated{visibility:inherit}</style>
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/667a9524d72c3d7bdb2c48b2d4c5271c0988e0b2.rhymix.less.minefb7.css?20210415220507" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/24fd28eb7fd355304ab91c91c1a0e72f31b0fc42.header-menu.scss305a.css" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/31e9f00caa3c164c061eac20db1403d81d8d211e.typography.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/ed499272170d764e3f5e0bb04b7e20886e510bde.export.lessdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/31e9f00caa3c164c061eac20db1403d81d8d211e.xe_content.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.card.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.base.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/eed2de429c4945bb8c660fddf82bd812095c4bc9.button.lessdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/eed2de429c4945bb8c660fddf82bd812095c4bc9.checkbox.lessdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/eed2de429c4945bb8c660fddf82bd812095c4bc9.custom-scroll.lessdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/eed2de429c4945bb8c660fddf82bd812095c4bc9.icon-button.lessdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.input.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.layout.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/eed2de429c4945bb8c660fddf82bd812095c4bc9.pagination.lessdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.tab.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/eed2de429c4945bb8c660fddf82bd812095c4bc9.radio.lessdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/eed2de429c4945bb8c660fddf82bd812095c4bc9.toggle.lessdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/eed2de429c4945bb8c660fddf82bd812095c4bc9.utils.lessdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/layouts/slow/dist/tailwinda57e.css" />
<link rel="stylesheet"
	href="<%=root%>/resources/layouts/slow/dist/tailwind.css?20210328005042" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/d7d2d531d64833600f28d00fc53aecc37472ba94.confirm.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/ad7fc7650f5148fb8e47bfd9635542790ebcc3db.dialog.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/80731344b410ab01daaa3ff8895c0bca7c7631aa.dropdown.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/b1a2feb343cde633439248b02a5a6795b78cd892.labeled-input.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/f3fdf34ca2685e90b27164be7dcdc2418474aa04.select.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/ba364a94c2d6e55564b69417a7f15293d1e37b78.toast.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/132d9494cb3cdaa406e529f4657530cdbefe754d.header.scss9b31.css?20210328101159" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/132d9494cb3cdaa406e529f4657530cdbefe754d.header-nav.scss9b31.css?20210328101159" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/c0be3f06db99ff8092bd8a6ed23577bbb1b6e0e8.search.scss9b31.css?20210328101159" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/ea42004a373b4ee546ea3fc824ebd13adb6f664c.social-login.scss0c28.css?20210328010039" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/e4571939607f5e95b0728e337b22562e3182071c.header-menu.scss9b31.css?20210328101159" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/022e85d5aa079873dc92f4ee812cd9d590727b46.sidebar-left-profile.scss9b31.css?20210328101159" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/022e85d5aa079873dc92f4ee812cd9d590727b46.sidebar-left-nav.scss9b31.css?20210328101159" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/022e85d5aa079873dc92f4ee812cd9d590727b46.sidebar-left.scss9b31.css?20210328101159" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/c5e82f29cb20c6448223e363ebf46b2eaeed0ede.main-banner.scssd89d.css?20210401223204" />
<link rel="stylesheet"
	href="<%=root%>/resources/layouts/slow/plugins/swiper/swiper.min7d9a.css?20210328005043" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/footer.css" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/e826cc2c56368d463341c86a3af90f2372ec1ef0.aside.scss9b31.css?20210328101159" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/c20e1190dc826a6e3245bacaaa7c95ce6806c5a0.bottom-nav.scss9b31.css?20210328101159" />
<link rel="stylesheet"
	href="<%=root%>/resources/modules/keyword/tpl/plugin/jquery.autocomplete06a1.css?20210331213538" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/ffc0bc2ec0b7e6cdb4359317735e391182d47cdb.widget.scss9b31.css?20210328101159" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/43d4a3a1bb40f51e0e3572af3f5d8034c214075d.gallery.scss0f4a.css?20210328164831" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/a8b89b754bc5176c1d302ff4f19a208077d4b9a3.normal.scss9b31.css?20210328101159" />
<link rel="stylesheet"
	href="<%=root%>/resources/widgets/keywordstat/skins/default/css/default17ee.css?20210331213616" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/27e2b9d0ef186c5c9d81ce9876667f8c0f54e9f5.widget.scss9060.css?20210328005705" />
<link rel="stylesheet"
	href="<%=root%>/resources/addons/photoswipe/PhotoSwipe/photoswipea68c.css?20210415215946" />
<link rel="stylesheet"
	href="<%=root%>/resources/addons/photoswipe/PhotoSwipe/default-skin/default-skina68c.css?20210415215946" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/02d0979eb468efbabe5aa16b3b137eb28a1b647b.style.scss7f16.css?20210330204710" />
<!-- JS -->
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- OTHER HEADERS -->
<style>
:root { -
	-aside-width: 17.625rem;
}

.leftBtn {
	width: 20px;
	height: 20px;
}

.app-layout .app-layout-aside {
	flex: 0 0 auto;
	width: 17.625rem;
	min-height: 100vh;
	border-left: 1px solid var(- -color-gray-300);
	margin-left: 2rem;
}
</style>
<script>


function modal_on(){
	$("#app-login").addClass('active');
}
function modal_off(){
	$("#app-login").removeClass('active');
}

$(document).ready(function(){
	/* 헤더의 검색창 누를 때. 검색창 영역 보이게.*/
	$('.app-search-toggle').on('click', function() { 
		$('#app-search').toggleClass('app-search--active');
	});
	/* 닫기 버튼 누를 때나 , 영역 밖 누를 때 hidden 됨.*/
	$('.app-search__background, .app-search__close').on('click', function() {
		$('#app-search').removeClass('app-search--active');
	});
	
	/* 알림 , 메세지 창 , 프로필 클릭시 자식 화면 화면에 보이기. */
	$(".app-pc-only.app-dropdown a").click(function(e){ 
		/* e.preventDefault(); */
		$(this).parent().toggleClass("active");
	});	
	/* 알림 ,메세지의 갯수가 없으면 빨간 숫자 없어짐. */
	$(".app-header-item-badge").each(function(){
		let newCount = $(this).text(); 
		
		if(newCount == 0){
			$(this).hide();	
		}
	});
	
});

</script>
<!-- COMMON JS VARIABLES -->
</head>
<!-- BODY START -->

<body>

	<!-- 앱 중간에 뜨는 화면. 경고창. 알림 모두삭제 클릭시 에 뜸. -->
	<!--  비활성화 = app-confirm
			활성화 = app-confirm app-confirm--danger active -->
	<div id="app-confirm" class="app-confirm">
		<div class="app-confirm__container">
			<div class="app-confirm__box">
				<div class="app-confirm__body">
					<ion-icon class="app-confirm__icon"
						name="information-circle-outline"></ion-icon>
					<!-- 안 읽은 알림 삭제 -->
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

	<div>
		<!--맨위 헤더 부분-->
		<header class="app-header ">
			<div class="app-header-container">
				<a class="app-header-logo" href="index.html"> 
					<img src="files/attach/images/113/c66a562b582767d6f09fca013dfaeabc.png"
					alt="WishFit">
				</a>
				<!--헤더의 항목 부분-->
				<ul class="app-header-nav">
					<li class="active"><a href="index.html"> <span>Now</span>
					</a></li>
					<li><a href="community.html"> <span>내 기록</span> <ion-icon
								class="tw-ml-1 tw-color-gray-600" name="chevron-down-outline"></ion-icon>
					</a>
						<ul class="app-header-nav-child">
							<li><a href="best.html">추천글게시판</a></li>
							<li><a href="certifyboard.html">운동인증</a></li>
							<li><a href="coordiboard.html">운동코디</a></li>
							<li><a href="freeboard.html">자유게시판</a></li>
							<li><a href="humorboard.html">유머게시판</a></li>
							<li><a href="qna.html">질문게시판</a></li>
						</ul></li>
					<li><a href="infomation.html"> <span>커뮤니티</span> <ion-icon
								class="tw-ml-1 tw-color-gray-600" name="chevron-down-outline"></ion-icon>
					</a>
						<ul class="app-header-nav-child">
							<li><a href="news.html">새로운소식</a></li>
							<li><a href="experience.html">용품/대회후기</a></li>
							<li><a href="competition.html">대회소식(생활운동)</a></li>
							<li><a href="useful.html">유용한사이트</a></li>
							<li><a href="tip.html">나만의팁</a></li>
						</ul></li>
					<li><a href="small.html"> <span>소모임</span> <ion-icon
								class="tw-ml-1 tw-color-gray-600" name="chevron-down-outline"></ion-icon>
					</a>
						<ul class="app-header-nav-child">
							<li><a href="swim.html">수영</a></li>
							<li><a href="bike.html">자전거</a></li>
							<li><a href="run.html">달리기</a></li>
							<li><a href="hiking.html">등산</a></li>
							<li><a href="fitness.html">홈트짐트</a></li>
							<li><a href="Pilates.html">필라테스/요가</a></li>
							<li><a href="golf.html">골프</a></li>
							<li><a href="skate.html">스케이트(빙상)</a></li>
						</ul></li>
					<li><a href="elite.html"> <span>마켓</span> <ion-icon
								class="tw-ml-1 tw-color-gray-600" name="chevron-down-outline"></ion-icon>
					</a>
						<ul class="app-header-nav-child">
							<li><a href="elitecom.html">대회소식(엘리트)</a></li>
							<li><a href="elitefree.html">자유게시판(엘리트)</a></li>
							<li><a href="counseling.html">진로고민상담</a></li>
							<li><a href="parents.html">학부모게시판</a></li>
							<li><a href="career.html">구인구직</a></li>
						</ul></li>					
					<li><a href="managment.html"> <span>운영사항</span> <ion-icon
								class="tw-ml-1 tw-color-gray-600" name="chevron-down-outline"></ion-icon>
					</a>
						<ul class="app-header-nav-child">
							<li><a href="notice.html">안내사항</a></li>
							<li><a href="event.html">이벤트</a></li>
							<li><a href="suggest.html">개선/건의</a></li>
							<li><a href="call112.html">신고</a></li>
						</ul></li>
				</ul>
				<!--  여백 -->
				<div class="tw-flex-1"></div>

				<!-- 헤더 오른쪽 부분. 검색 , 로그인 ,회원가입 아이콘 -->

				<!-- 검색 아이콘 -->
				<a class="app-header-item app-icon-button app-icon-button-gray app-search-toggle">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none"
						viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2"
							d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                    </svg>
				</a>
				<!-- 검색 버튼 클릭시 뜨는 창. -->
				<div id="app-search" class="app-search">
					<!-- 실질적 검색 창 -->
					<div class="app-search__container">
						<form class="app-search-form" action="/search.kh"
							method="get">
							<!-- 검색에 필요한 항목 넣기 -->
							<input type="hidden" value="/" />
							<!-- 검색 창안의 돋보기 아이콘 -->
							<div class="app-search-form__icon">
								<svg xmlns="http://www.w3.org/2000/svg" fill="none"
									viewBox="0 0 24 24" stroke="currentColor">
									<path stroke-linecap="round" stroke-linejoin="round"
										stroke-width="2"
										d="M21 f21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
								</svg>
							</div>
							<!-- 전달할 값 -->
							<input type="hidden" name="vid" value="" /> 
							<input type="hidden" name="mid" value="index" /> 
							<input type="hidden" name="act" value="IS" />
							<!-- 검색어 -->
							<input type="text" name="is_keyword" placeholder="검색" value=""
								class="app-search-form__input" />
							<button type="submit" class="app-search-form__button">확인</button>
						</form>
						<button class="app-search__close">닫기</button>
					</div>
					<div class="app-search__background"></div>
				</div>

				<script>
					jQuery(document).ready(
						function($) {

						}
					);
				</script>
				
				<!-- 로그인 버튼 -->
				<a href="#" class="app-pc-only app-header-login-link"
					onclick="modal_on()"> <i class="el-icon-lock"></i>
					<span>로그인</span>
				</a>
				<!-- 회원가입 버튼 -->
				<a
					class="app-pc-only app-button app-primary app-button-rounded app-button-small"
					href="join.jsp">회원가입
				</a>

				<!-- 로그인 모달 창 -->
				<div id="app-login" class="app-dialog">
					<div class="app-dialog-container">
						<div class="app-dialog-box">
							<div class="app-dialog-header">
								<h3>로그인</h3>
							</div>
							<div class="app-dialog-body">
								<!-- 로그인 입력 폼 -->
								<form class="tw-mb-5" action="https://sweatee.co.kr/"
									method="post" autocomplete="off">
									<input type="hidden" name="error_return_url" value="/" /> <input
										type="hidden" name="mid" value="index" /> <input
										type="hidden" name="ruleset" value="@login" /> <input
										type="hidden" name="success_return_url" value="" /> <input
										type="hidden" name="act" value="procMemberLogin" /> <input
										type="hidden" name="xe_validator_id" value="layouts/slow" />

									<fieldset>
										<div class="tw-mb-3">
											<div class="app-labeled-input" label="이메일 주소">
												<div class="app-labeled-input__title">이메일 주소</div>
												<input class="app-input app-input-expand" type="text"
													name="user_id" placeholder="user@email.com" required
													tabindex="1" />
											</div>
										</div>

										<div class="app-labeled-input tw-mb-3" label="비밀번호">
											<div class="app-labeled-input__title">비밀번호</div>
											<input class="app-input app-input-expand" type="password"
												name="password" placeholder="•••••••••" required
												tabindex="2" />
										</div>

										<div class="tw-flex tw-items-center tw-mb-4">
											<div class="eq flex text-left">
												<input class="app-input-checkbox" type="checkbox"
													name="keep_signed" id="keep_signed"
													data-lang="브라우저를 닫더라도 로그인이 계속 유지될 수 있습니다. 로그인 유지 기능을 사용할 경우 다음 접속부터는 로그인할 필요가 없습니다. 단, PC방, 학교, 도서관 등 공공장소에서 이용 시 개인정보가 유출될 수 있으니 꼭 로그아웃을 해주세요."
													value="Y" tabindex="3" />
												<!-- 세션 처리 유무로. -->
												
											</div>

											<div class="tw-flex-1"></div>

											<a class="tw-text-gray-700 app-link app-link-gray"
												href="indexb7be.html?mid=index&amp;act=dispMemberFindAccount"
												tabindex="5">ID/PW 찾기</a>
										</div>
										<!-- 제출 버튼 -->
										<button type="submit"
											class="app-button app-button-expand app-button-rounded primary"
											tabindex="4">로그인</button>
									</fieldset>
								</form>
								<!-- 로그인 창 하단 부분.  -->
								<div class="tw-text-sm tw-text-center tw-text-gray-700">
									<span class="eq text-muted">아직 회원이 아니신가요?</span> <a
										href="join.jsp"
										class="tw-text-primary tw-text-bold" tabindex="6">회원가입 하기</a>
								</div>
							</div>
						</div>
					</div>
					<!--  로그인 모달 창 배경영역 -->
					<div class="app-dialog-bg" onclick="modal_off()"></div>
				</div>
				<!--  검색 버튼 -->
				<a class="app-header-item app-header-menu__toggle app-mobile-only app-icon-button app-icon-button-gray">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor">
                            <path fill-rule="evenodd"
							d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
							clip-rule="evenodd" />
                    </svg>
				</a>
				<!-- 알림 아이콘 -->
				<div class="app-pc-only app-dropdown">
					<a class="app-header-item app-dropdown-toggle app-icon-button app-icon-button-gray">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
							fill="currentColor">
        					<path
								d="M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z"></path>
   						</svg>
   						<span id="notiCount"class="app-header-item-badge">2</span>
					</a>
					<div class="app-dropdown-menu app-right" style="width: 270px">
						<div class="app-dropdown-header tw-flex tw-items-center">
							<div class="tw-text-base tw-font-bold">알림</div>

							<div class="tw-flex-1"></div>
							<a class="tw-text-sm tw-text-gray-700" href="#"
								onclick="onClickNotiReadAll()"> <span>모두 삭제</span>
							</a>
						</div>
						<!-- 알림 있을 때 없을 때 모듈화. -->
						<jsp:include page="/page/headerNav/notification.jsp"></jsp:include>
					</div>
				</div>
				
				<!--  안 읽은 메세지 갯수 출력 -->
				<% 
					MessageDao messageDao = new MessageDao();
					int notRead= messageDao.getNotReadCount(uid);
					
 				%>
 				<!-- 쪽지 -->
				<div class="app-pc-only app-dropdown">
					<a class="app-header-item app-dropdown-toggle app-icon-button app-icon-button-gray">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
							fill="currentColor">
					        <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"></path>
					        <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"></path>
				      	</svg>
				      	<%-- 알림 있을 때 갯수 뽑아줌. --%>
				      	<span id="msgCount"class="app-header-item-badge"><%= notRead %></span>
        
					</a>
					<!-- 쪽지 목록 창. -->
					<div class="app-dropdown-menu app-right" style="width: 270px">
						<jsp:include page="/page/headerNav/message.jsp"></jsp:include>
					</div>
				</div>
				<!-- 프로필 사진 누르면 나오는 드롭박스  -->
				<div class="app-pc-only app-dropdown">
					<a class="app-header-profile app-dropdown-toggle app-avatar"
						title="닉네임"> 
						<ion-icon name="person-sharp" role="img"
							class="md hydrated" aria-label="person sharp"></ion-icon>
					</a>
					<div class="app-dropdown-menu app-right" style="width: 250px">
						<div>
							<div class="tw-py-4 tw-px-6 tw-border-b tw-border-gray-300">
								<div class="tw-font-bold tw-text-sm tw-mb-1">닉네임</div>
							</div>
							<ul class="app-dropdown-menu-list tw-py-2 app-custom-scroll">

								<li><a href="/index.php?mid=index&amp;act=dispMemberInfo">
										<ion-icon name="person-outline" role="img" class="md hydrated"
											aria-label="person outline"></ion-icon> <span>마이페이지</span>
								</a></li>
								<li><a
									href="/index.php?mid=index&amp;act=dispMemberScrappedDocument">
										<ion-icon name="bookmark-outline" role="img"
											class="md hydrated" aria-label="bookmark outline"></ion-icon>
										<span>스크랩</span>
								</a></li>
								<li><a
									href="/index.php?mid=index&amp;act=dispMemberOwnDocument">
										<ion-icon name="document-text-outline" role="img"
											class="md hydrated" aria-label="document text outline"></ion-icon>
										<span>작성글</span>
								</a></li>
								<li><a
									href="/index.php?mid=index&amp;act=dispMemberOwnComment"> <ion-icon
											name="chatbox-ellipses-outline" role="img"
											class="md hydrated" aria-label="chatbox ellipses outline"></ion-icon>
										<span>작성댓글</span>
								</a></li>
								<li><a onclick="onClickDarkThemeToggle()"> <ion-icon
											name="contrast-outline" role="img" class="md hydrated"
											aria-label="contrast outline"></ion-icon> <span>다크모드
											전환</span>
								</a></li>
								<li class="tw-border-b tw-border-gray-300 tw-my-2"></li>
								<li><a href="/index.php?mid=index&amp;act=dispMemberLogout"
									class="eq more"> <ion-icon name="lock-open-outline"
											role="img" class="md hydrated" aria-label="lock open outline"></ion-icon>
										<span>로그아웃</span>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</header>
		<div class="app-header-space"></div>
		<!--#Meta:layouts/slow/components/header/header-menu/header-menu.scss?$__Context->themeConfig->variables-->


		<div class="app-header-menu">
			<button class="app-header-menu__outside app-header-menu__toggle"></button>
			<div class="app-header-menu__content">
				<button class="app-header-menu__close app-header-menu__toggle">
					<ion-icon name="close-outline"></ion-icon>
				</button>
				<!-- 
						로그인 안했을때 app-header-menu__auth
						로그인 했을때 tw-py-5 tw-px-5  
				-->
				
				<!--  로그인 했을 떄  -->
				<div class="app-card tw-mb-5">
					<div class="tw-py-5 tw-px-5">
						<div class="app-sidebar-profile">
							<div class="app-sidebar-profile__image app-avatar">
								<ion-icon name="person-sharp" role="img" class="md hydrated"
									aria-label="person sharp"></ion-icon>
							</div>

							<div class="app-sidebar-profile__body">
								<div class="app-sidebar-profile__nickname">포카리스웻티</div>

							</div>
						</div>

						<div class="tw-flex">
							<a href="/index.php?mid=index&amp;act=dispMemberOwnDocument"
								class="app-button app-gray app-button-xs tw-flex-1 tw-mr-3">작성글</a>
							<a href="/index.php?mid=index&amp;act=dispMemberInfo"
								class="app-button app-primary app-button-xs tw-flex-1">내정보</a>
						</div>

					</div>
				</div>
				
				<!--  로그인 안했을 때  -->
				<div class="app-header-menu__auth">
					<script>
						function onClickHeaderMenuLogin() {
							appBottomNavItem('usermenu');
							$('.app-header-menu').removeClass('active');
						}
					</script>

					<a class="app-login" onclick="onClickHeaderMenuLogin()">로그인이
						필요합니다.</a> <a class="app-signup"
						href="join.jsp">회원가입</a>
				</div>
				<nav>
					<ul class="app-card app-sidebar-left__nav">
						<li>
							<div class="app-sidebar-left__nav__item">
								<a href="/index"> <span>Now</span>
								</a>
							</div>
						</li>
						<li>
							<div class="app-sidebar-left__nav__item">
								<a href="/community"> <span>내 기록 </span>
								</a>

								<ion-icon name="chevron-down-outline"
									class="app-sidebar-left__nav__more md hydrated" role="img"
									aria-label="chevron down outline"></ion-icon>
							</div>

							<ul class="app-sidebar-left__nav__child">
								<li><a href="/best">추천글게시판</a></li>
								<li><a href="/certifyboard">운동인증</a></li>
								<li><a href="/coordiboard">운동코디</a></li>
								<li><a href="/freeboard">자유게시판</a></li>
								<li><a href="/humorboard">유머게시판</a></li>
								<li><a href="/qna">질문게시판</a></li>
							</ul>
						</li>
						<li class="active open">
							<div class="app-sidebar-left__nav__item">
								<a href="/infomation"> <span>커뮤니티 </span>
								</a>

								<ion-icon name="chevron-down-outline"
									class="app-sidebar-left__nav__more md hydrated" role="img"
									aria-label="chevron down outline"></ion-icon>
							</div>

							<ul class="app-sidebar-left__nav__child active">
								<li><a href="/news">새로운소식</a></li>
								<li><a href="/experience">용품/대회후기</a></li>
								<li><a href="/competition">대회소식(생활운동)</a></li>
								<li><a href="/useful">유용한사이트</a></li>
								<li><a href="/tip">나만의팁</a></li>
							</ul>
						</li>
						<li>
							<div class="app-sidebar-left__nav__item">
								<a href="/small"> <span>소모임</span>
								</a>

								<ion-icon name="chevron-down-outline"
									class="app-sidebar-left__nav__more md hydrated" role="img"
									aria-label="chevron down outline"></ion-icon>
							</div>

							<ul class="app-sidebar-left__nav__child">
								<li><a href="/swim">수영</a></li>
								<li><a href="/bike">자전거</a></li>
								<li><a href="/run">달리기</a></li>
								<li><a href="/hiking">등산</a></li>
								<li><a href="/fitness">홈트짐트</a></li>
								<li><a href="/Pilates">필라테스/요가</a></li>
								<li><a href="/golf">골프</a></li>
								<li><a href="/skate">스케이트(빙상)</a></li>
							</ul>
						</li>
						<li>
							<div class="app-sidebar-left__nav__item">
								<a href="/elite"> <span>마켓 </span>
								</a>

								<ion-icon name="chevron-down-outline"
									class="app-sidebar-left__nav__more md hydrated" role="img"
									aria-label="chevron down outline"></ion-icon>
							</div>

							<ul class="app-sidebar-left__nav__child">
								<li><a href="/elitecom">대회소식(엘리트)</a></li>
								<li><a href="/elitefree">자유게시판(엘리트)</a></li>
								<li><a href="/counseling">진로고민상담</a></li>
								<li><a href="/parents">학부모게시판</a></li>
								<li><a href="/career">구인구직</a></li>
							</ul>
						</li>
						<li>
							<div class="app-sidebar-left__nav__item">
								<a href="/managment"> <span>운영사항</span>
								</a>

								<ion-icon name="chevron-down-outline"
									class="app-sidebar-left__nav__more md hydrated" role="img"
									aria-label="chevron down outline"></ion-icon>
							</div>

							<ul class="app-sidebar-left__nav__child">
								<li><a href="/notice">안내사항</a></li>
								<li><a href="/event">이벤트</a></li>
								<li><a href="/suggest">개선/건의</a></li>
								<li><a href="/call112">신고</a></li>
							</ul>
						</li>
					</ul>
				</nav>
				
			</div>
		</div>

<!--  
햄버거를 눌렀을때 사이드바가 나와야한다
app-header-menu에 active 클래스 추가. -->