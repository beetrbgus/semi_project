<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>  
$(function(){
	$(".tw-flex").click(function() {
		$("#popup_menu_area").toggle();
	});	
});
</script>  
<%
	String root = request.getContextPath();
%>

<div id="popup_menu_area" tabindex="0"
	style="top: 400px; left: 550px; display: none;">
	<ul>
		<li class="dispCommunicationMessages"><a href="<%=root %>/page/message/send.jsp?" target="_blank">쪽지
				보내기</a></li>
		<li class="dispCommunicationFriend"><a href="#" target="_blank">친구
				등록</a></li>
	</ul>
</div>