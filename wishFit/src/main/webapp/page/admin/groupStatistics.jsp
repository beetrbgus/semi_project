<%@page import="wishFit.statistics.FitNameVO" %>
<%@page import="wishFit.statistics.FitVO"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.statistics.StatisticsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
	<!-- 헤더 -->
<jsp:include page="/template/header.jsp"></jsp:include>
<%
String root = request.getContextPath();
%>
<!-- CSS -->
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/667a9524d72c3d7bdb2c48b2d4c5271c0988e0b2.rhymix.less.min.css?20210415220507" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/31e9f00caa3c164c061eac20db1403d81d8d211e.typography.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/ed499272170d764e3f5e0bb04b7e20886e510bde.export.less.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/31e9f00caa3c164c061eac20db1403d81d8d211e.xe_content.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.card.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.base.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/eed2de429c4945bb8c660fddf82bd812095c4bc9.button.less.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/eed2de429c4945bb8c660fddf82bd812095c4bc9.checkbox.less.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/eed2de429c4945bb8c660fddf82bd812095c4bc9.custom-scroll.less.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/eed2de429c4945bb8c660fddf82bd812095c4bc9.icon-button.less.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.input.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.layout.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/eed2de429c4945bb8c660fddf82bd812095c4bc9.pagination.less.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.tab.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/eed2de429c4945bb8c660fddf82bd812095c4bc9.radio.less.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/eed2de429c4945bb8c660fddf82bd812095c4bc9.toggle.less.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/eed2de429c4945bb8c660fddf82bd812095c4bc9.utils.less.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/layouts/slow/dist/tailwind.css?20210328005042" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/d7d2d531d64833600f28d00fc53aecc37472ba94.confirm.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/ad7fc7650f5148fb8e47bfd9635542790ebcc3db.dialog.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/80731344b410ab01daaa3ff8895c0bca7c7631aa.dropdown.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/b1a2feb343cde633439248b02a5a6795b78cd892.labeled-input.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/f3fdf34ca2685e90b27164be7dcdc2418474aa04.select.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/ba364a94c2d6e55564b69417a7f15293d1e37b78.toast.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/132d9494cb3cdaa406e529f4657530cdbefe754d.header.scss.css?20210328101159" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/132d9494cb3cdaa406e529f4657530cdbefe754d.header-nav.scss.css?20210328101159" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/c0be3f06db99ff8092bd8a6ed23577bbb1b6e0e8.search.scss.css?20210328101159" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/ea42004a373b4ee546ea3fc824ebd13adb6f664c.social-login.scss.css?20210328010039" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/e4571939607f5e95b0728e337b22562e3182071c.header-menu.scss.css?20210328101159" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/022e85d5aa079873dc92f4ee812cd9d590727b46.sidebar-left-profile.scss.css?20210328101159" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/022e85d5aa079873dc92f4ee812cd9d590727b46.sidebar-left-nav.scss.css?20210328101159" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/022e85d5aa079873dc92f4ee812cd9d590727b46.sidebar-left.scss.css?20210328101159" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/c5e82f29cb20c6448223e363ebf46b2eaeed0ede.main-banner.scss.css?20210401223204" />
<link rel="stylesheet" href="<%=root%>/layouts/slow/plugins/swiper/swiper.min.css?20210328005043" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/0c46cbbcd7a9340dcec29a5f4b47387528071311.footer.scss.css?20210328101159" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/e826cc2c56368d463341c86a3af90f2372ec1ef0.aside.scss.css?20210328101159" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/c20e1190dc826a6e3245bacaaa7c95ce6806c5a0.bottom-nav.scss.css?20210328101159" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/f5933e9734ab872da414bc80ea05c3e4005da64b.variables.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.base.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.extra-form.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.header.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.status-icon.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/8006fe91df8167f30c3f14abeef702f07df155ec.category.scss.css?20210329210712" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/92b01c3552e164431c570224468c40fb97bd6173.default.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/bc907f3f881d545045a5d59036747dfda675bb7a.fr-button.scss.css?20210328011802" />
<link rel="stylesheet" href="<%=root%>/modules/keyword/tpl/plugin/jquery.autocomplete.css?20210331213538" />
<link rel="stylesheet" href="<%=root%>/widgets/keywordstat/skins/default/css/default.css?20210331213616" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/ffc0bc2ec0b7e6cdb4359317735e391182d47cdb.widget.scss.css?20210328101159" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/a8b89b754bc5176c1d302ff4f19a208077d4b9a3.normal.scss.css?20210328101159" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/27e2b9d0ef186c5c9d81ce9876667f8c0f54e9f5.widget.scss.css?20210328005705" />
<link rel="stylesheet" href="<%=root%>/addons/photoswipe/PhotoSwipe/photoswipe.css?20210415215946" />
<link rel="stylesheet" href="<%=root%>/addons/photoswipe/PhotoSwipe/default-skin/default-skin.css?20210415215946" />
<link rel="stylesheet" href="<%=root%>/files/cache/assets/compiled/02d0979eb468efbabe5aa16b3b137eb28a1b647b.style.scss.css?20210330204710" />
<style>
:root { -
	-aside-width: 17.625rem;
}
</style>
<!-- 좌측 사이드 -->
<jsp:include page="/template/leftSide.jsp"></jsp:include>

<%
	StatisticsDao statisticsDao = new StatisticsDao();
	List<FitVO> list = statisticsDao.FitGroupByfgNo();
%>

<%for(FitVO vo : list){ %>
	<h5>
		<%=vo.getFitGroup()%> - <%=vo.getTotal()%> 
	</h5>
<%} %>


	<h5>소모임 카테고리별 모임수</h5>
<%
	StatisticsDao statisticsDao2 = new StatisticsDao();
	List<FitNameVO> list2 = statisticsDao2.FitGroupByExcateName();
%>

<%for(FitNameVO vo : list2){ %>
	<h5>
		<%=vo.getExcateName()%> - <%=vo.getTotal()%> 
	</h5>
<%} %>


<!-- 화면 중간. 본문 -->

<main class="app-content app-clearfix">
<div id="board-list">
  <div class="app-board-header">
  <div class="app-board-title">
  <div class="tw-flex tw-items-center">
    <a class="tw-inline-block tw-font-medium tw-text-2xl tw-font-bold tw-mr-1" href="/certifyboard">통계</a>        <div class="tw-flex-1"></div>
    
          </div>
  <p class="tw-text-sm tw-text-gray-700 tw-bt-1 app-board-description">소모임 통계</p></div>
 <ul class="app-board-category">
    <li>
    <a href="/certifyboard">회원</a>
    </li>
    <li class="app-active">
    <a href="/certifyboard/category/383">
        <span style="color: ;">소모임</span>
        <span class="app-document-count">
         ()
        </span>              </a>
          </li><li>
    <a href="/certifyboard/category/384">
        <span style="color: ;">커뮤니티</span>
        <span class="app-document-count">
         ()
        </span>              </a>
          </li></ul>
	<!-- 푸터 -->
</main>
<jsp:include page="/template/footer.jsp"></jsp:include>

<!--  우측 사이드 -->
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>

