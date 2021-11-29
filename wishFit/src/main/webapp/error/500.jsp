<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<html lang="ko">
<head>
<!-- META -->
<meta charset="utf-8">
<meta name="generator" content="Rhymix">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="csrf-token" content="">
<!-- TITLE -->
<title></title>
<!-- CSS -->
<link rel="stylesheet" href="/files/cache/assets/compiled/6027926aa25ed157729292cac191a546a7c774e7.rhymix.less.min.css?20210415220527">
<link rel="stylesheet" href="/modules/keyword/tpl/plugin/jquery.autocomplete.css?20210331213538">
<!-- JS -->
<script src="/common/js/jquery-2.2.4.min.js?20210415220039"></script>
<script src="/files/cache/assets/minified/rhymix.min.js?20210415220507"></script>
<script src="/modules/keyword/tpl/plugin/jquery.autocomplete.js?20210331213538"></script>
<!-- RSS -->
<!-- ICONS AND OTHER LINKS -->
<link rel="shortcut icon" href="/files/attach/xeicon/favicon.ico?20210407222241"><link rel="apple-touch-icon" href="/files/attach/xeicon/mobicon.png?20210407222654"><!-- OTHER HEADERS -->
<meta name="viewport" content="width=1240">
<style>
.xedition-error {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	padding: 80px 0 0;
	background-color:#EFEFEF;
	font-family: "Open Sans", sans-serif;
	text-align: center;
}
.xedition-error h1 {
	margin: 0 0 19px;
	font-size: 40px;
	font-weight: normal;
	color: #E02B2B;
	line-height: 40px;
}
.xedition-error p {
	margin: 0 0 57px;
	font-size: 16px;
	color:#444;
	line-height: 23px;
}
</style><!-- COMMON JS VARIABLES -->
<script>
	var default_url = "https://localhost:8080/wishfit/";
	var current_url = "https://sweatee.co.kr/?mid=123132sdfsdf";
	var request_uri = "https://localhost:8080/wishfit/";
	var current_lang = xe.current_lang = "ko";
	var current_mid = "123132sdfsdf";
	var http_port = null;
	var https_port = null;
	var enforce_ssl = true;
	var cookies_ssl = false;
	var rewrite_level = 1;
</script>
</head>

<body class="color_scheme_light">
<!-- PAGE CONTENT -->

<section class="xedition-error">
	<h1>500</h1>
	<p>Oops!Sorry..<br>Page is Not Found!</p>
	
	<img src="<%=request.getContextPath() %>/resources/image/err500.png" width="340" height="400">
</section>
<script type="text/javascript">(function($){ $('input[name="is_keyword"]').autocomplete( "https://sweatee.co.kr/modules/keyword/key_list_query.php", { });})(jQuery);</script>
<script type="text/javascript">(function($){ $('input[name="search_keyword"]').autocomplete( "https://sweatee.co.kr/modules/keyword/key_list_query.php", { });})(jQuery);</script>
<script type="text/javascript">(function($){ $('input[name="graph_keyword"]').autocomplete( "https://sweatee.co.kr/modules/keyword/key_list_query.php", { });})(jQuery);</script>
<script type="text/javascript"> setInterval(function(){jQuery('input[name="is_keyword"]').filter('[value!=""]:focus').trigger('keydown'); }, 500)</script>
<script type="text/javascript"> setInterval(function(){jQuery('input[name="search_keyword"]').filter('[value]:focus').trigger('keydown'); }, 500)</script>
<script type="text/javascript"> setInterval(function(){jQuery('input[name="graph_keyword"]').filter('[value]:focus').trigger('keydown'); }, 500)</script>
<!-- ETC -->
<div id="rhymix_waiting" class="wfsr" data-message="로그인이 필요한 메뉴입니다.">로그인이 필요한 메뉴입니다.</div><div id="rhymix_alert"></div>
<div id="rhymix_debug_panel"></div>
<div id="rhymix_debug_button"></div>
<!-- BODY JS -->
<script src="https://webstack.me/framework.js?_=wst_ad_manager"></script>


</body>
</html>
