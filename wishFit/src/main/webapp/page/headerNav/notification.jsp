<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!-- 추가할 알림이 없으면 -->
<div class="tw-text-center tw-py-6 tw-px-4">
	<ion-icon name="notifications"
		class="tw-text-gray-600 tw-text-2xl tw-mb-4 md hydrated" role="img"
		aria-label="notifications"
	></ion-icon>
	<div class="tw-text-black tw-font-bold tw-text-sm tw-mb-2">새로운
		알림이 없습니다</div>
	<div class="tw-text-sm tw-text-gray-700">알림을 받으면 여기에 표시됩니다</div>
	<!-- <a href="/index.php?mid=index&amp;act=dispNcenterliteUserConfig" class="app-button primary app-button-rounded app-button-xs">알림 설정하기</a> -->
</div>
<ul class="app-dropdown-menu-list">
	<li class="tw-border-b tw-border-gray-300 tw-my-2"></li>
	<li><a class="tw-text-center tw-justify-center tw-text-gray-700"
		href="/index.php?mid=index&amp;act=dispNcenterliteNotifyList"
	> <span>전체 알림 보기</span>
	</a></li>
</ul>