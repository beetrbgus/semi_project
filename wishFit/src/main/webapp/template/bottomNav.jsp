<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String root = request.getContextPath();
%>
<!-- 화면 모바일로 줄면 나오는 하단 Nav 버튼 -->
<div class="app-layout-bottom-nav">
	<div class="app-bottom-nav" data-logged-in="" data-current-menu="home">
		<ul>
			<li data-menu-id="home"><a
				class="app-bottom-nav__auto app-active"> <!--  홈 아이콘  --> <svg
						xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor">
                                    <path
							d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
                            </svg> <span class="app-bottom-nav-item__text">홈</span>
			</a></li>
			<li data-menu-id="notification"><a class="app-bottom-nav__auto">
					<div class="app-bottom-nav-item">
						<!--  알림 아이콘  -->
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
							fill="currentColor">
									<path
								d="M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z" />
                                </svg>
					</div> <span class="app-bottom-nav-item__text">알림</span>
			</a></li>
			<li data-menu-id="message"><a class="app-bottom-nav__auto">
					<div class="app-bottom-nav-item">
						<!--  쪽지 아이콘  -->
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
							fill="currentColor">
                                   <path
								d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z" />
                                   <path
								d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z" />
                                </svg>
					</div> <span class="app-bottom-nav-item__text">쪽지</span>
			</a></li>

			<li data-menu-id="usermenu">
				<a class="app-bottom-nav__auto">
					<!-- 아이콘 없어서 추가해야됨. --> 
					<img
						src="<%=root%>/resources/files/attach/xeicon/ic_profile_default.png"
						alt="포카리스웻티" class="eq border-circle text-middle" width="24px"
						height="24px"  style="border-radius : 70px" >
					<span class="app-bottom-nav-item__text">로그인</span>
				</a>
			</li>
		</ul>
	</div>
	<!-- 모바일(작은 화면)에서 로그인 선택시 나오는 화면. 비로그인 전용-->
	<div class="app-bottom-nav-container app-bottom-nav-usermenu"
		data-menu-id="usermenu">

		<div class="tw-p-6">
			<h1 class="tw-text-2xl tw-font-bold tw-mb-3">로그인</h1>
			<form class="tw-mb-5" action="https://sweatee.co.kr/" method="post"
				autocomplete="off">
				<input type="hidden" name="error_return_url" value="/" /> <input
					type="hidden" name="mid" value="index" /> <input type="hidden"
					name="ruleset" value="@login" /> <input type="hidden"
					name="success_return_url" value="" /> <input type="hidden"
					name="act" value="procMemberLogin" /> <input type="hidden"
					name="xe_validator_id" value="layouts/slow" />

				<fieldset>
					<div class="tw-mb-3">
						<div class="app-labeled-input" label="이메일 주소">
							<div class="app-labeled-input__title">이메일 주소</div>
							<input id="email" class="app-input app-input-expand" type="text"
								name="user_id" placeholder="user@email.com" required
								tabindex="1" />
						</div>
					</div>

					<div class="app-labeled-input tw-mb-3" label="비밀번호">
						<div class="app-labeled-input__title">비밀번호</div>
						<input class="app-input app-input-expand" type="password"
							name="password" placeholder="•••••••••" required tabindex="2" />
					</div>

					<div class="tw-flex tw-items-center tw-mb-4">
						<div class="eq flex text-left">
							<input class="app-input-checkbox" type="checkbox"
								name="keep_signed" id="keep_signed_m"
								data-lang="브라우저를 닫더라도 로그인이 계속 유지될 수 있습니다. 로그인 유지 기능을 사용할 경우 다음 접속부터는 로그인할 필요가 없습니다. 단, PC방, 학교, 도서관 등 공공장소에서 이용 시 개인정보가 유출될 수 있으니 꼭 로그아웃을 해주세요."
								value="Y" tabindex="3" /> <label for="keep_signed_m">로그인
								상태 유지</label>
						</div>

						<div class="tw-flex-1"></div>

						<a class="tw-text-gray-700 app-link app-link-gray"
							href="indexb7be.html?mid=index&amp;act=dispMemberFindAccount"
							tabindex="5">ID/PW 찾기</a>
					</div>

					<button type="submit"
						class="app-button app-button-expand app-button-rounded primary"
						tabindex="4">로그인</button>
				</fieldset>
			</form>
			<!--  -->
			<div class="tw-text-sm tw-text-center tw-text-gray-700">
				<span class="eq text-muted">아직 회원이 아니신가요?</span> <a
					href="index5ab6.html?mid=index&amp;act=dispMemberSignUpForm"
					class="tw-text-primary tw-text-bold" tabindex="6">회원가입
					하기</a>
			</div>
			<div class="app-social-login-group">
				<a class="app-social-kakao"
					href="https://kauth.kakao.com/oauth/authorize?response_type=code&amp;client_id=fd430a466b5a1711ae0da68106c5da17&amp;redirect_uri=https%3A%2F%2Fsweatee.co.kr%2Findex.php%3Fmodule%3Dsocialxe%26act%3DprocSocialxeCallback%26service%3Dkakao&amp;state=be319fecea269f0b393528320b096ab6">
					<img src="layouts/slow/assets/images/ic_brand_kakao.svg"
					alt="ic_brand_kakao.svg" width="14" height="14"> <span>카카오로
						계속하기</span>
				</a> <a class="app-social-naver"
					href="https://nid.naver.com/oauth2.0/authorize?response_type=code&amp;client_id=x14s8tzdAe4Yg8qaZaPg&amp;redirect_uri=https%3A%2F%2Fsweatee.co.kr%2Findex.php%3Fmodule%3Dsocialxe%26act%3DprocSocialxeCallback%26service%3Dnaver&amp;state=c900324e9055cf8d6fba320377beab64">
					<img src="layouts/slow/assets/images/ic_brand_naver.svg"
					alt="ic_brand_naver.svg" width="14" height="14"> <span>네이버로
						계속하기</span>
				</a>
			</div>
		</div>
	</div>
</div>
</div>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=G-CBF0R92LFH"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	gtag('config', 'G-CBF0R92LFH');
</script>
<style>
.pswp__caption__center {
	display: block
}
</style>
<!-- Root element of PhotoSwipe. Must have class pswp. -->
<!-- 메인배너 사진 넘기는거  -->
<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">

	<!-- Background of PhotoSwipe. 
		 It's a separate element as animating opacity is faster than rgba(). -->
	<div class="pswp__bg"></div>

	<!-- Slides wrapper with overflow:hidden. -->
	<div class="pswp__scroll-wrap">

		<!-- Container that holds slides. 
			PhotoSwipe keeps only 3 of them in the DOM to save memory.
			Don't modify these 3 pswp__item elements, data is added later on. -->
		<div class="pswp__container">
			<div class="pswp__item"></div>
			<div class="pswp__item"></div>
			<div class="pswp__item"></div>
		</div>

		<!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
		<div class="pswp__ui pswp__ui--hidden">

			<div class="pswp__top-bar">

				<!--  Controls are self-explanatory. Order can be changed. -->

				<div class="pswp__counter"></div>

				<button class="pswp__button pswp__button--close" title="Close (Esc)"></button>

				<button class="pswp__button pswp__button--share" title="Share"></button>

				<button class="pswp__button pswp__button--fs"
					title="Toggle fullscreen"></button>

				<button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>

				<!-- Preloader demo http://codepen.io/dimsemenov/pen/yyBWoR -->
				<!-- element will get class pswp__preloader - active when preloader is running -->
				<div class="pswp__preloader">
					<div class="pswp__preloader__icn">
						<div class="pswp__preloader__cut">
							<div class="pswp__preloader__donut"></div>
						</div>
					</div>
				</div>
			</div>

			<div
				class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
				<div class="pswp__share-tooltip"></div>
			</div>

			<button class="pswp__button pswp__button--arrow--left"
				title="Previous (arrow left)"></button>

			<button class="pswp__button pswp__button--arrow--right"
				title="Next (arrow right)"></button>

			<div class="pswp__caption">
				<div class="pswp__caption__center"></div>
			</div>

		</div>

	</div>

</div>

<!-- ETC -->
<div id="rhymix_waiting" class="wfsr"
	data-message="서버에 요청 중입니다. 잠시만 기다려 주십시오..."></div>
<!-- 알럿창. -->
<div id="rhymix_alert"></div>
<div id="rhymix_debug_panel"></div>
<div id="rhymix_debug_button"></div>

</body>

</html>