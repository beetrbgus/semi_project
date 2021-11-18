<%@page import="wishFit.beans.member.MemberDao"%>
<%@page import="wishFit.beans.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memId = (String)session.getAttribute("ses");

	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(memId);
%>
<!-- 헤더 -->
<jsp:include page="/template/header.jsp"></jsp:include>
<%
String root = request.getContextPath();
%>
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/255b6902485612c74d806c3142450a55116bc82e.signup-form.scssb2cb.css" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/347b8967715ee8520a013ff5c985fb69086c462a.member.scss944d.css" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/347b8967715ee8520a013ff5c985fb69086c462a.member-form.scss944d.css" />
<link rel="stylesheet" 
	href = "<%=root%>/resources/files/cache/assets/compiled/member-info.css">
<!-- 좌측 사이드 -->
<jsp:include page="/template/leftSide.jsp"></jsp:include>

<main class="app-content app-clearfix">
      <div class="app-clearfix">
        <section class="app-member">
        <div class="app-member-card">
  <div class="app-member-card-header">
    <h1>회원정보 수정</h1>
  </div>
    
  <script>
    xe.lang.deleteProfileImage = '선택한 항목을 삭제합니다.';
    xe.lang.deleteImageMark = '선택한 항목을 삭제합니다.';
    xe.lang.deleteImageName = '선택한 항목을 삭제합니다.';
  </script>
  
  <form id="fo_insert_member" action="/" method="post" enctype="multipart/form-data" class="app-member-card-body"><input type="hidden" name="error_return_url" value="/index.php?mid=index&amp;act=dispMemberModifyInfo"><input type="hidden" name="mid" value="index"><input type="hidden" name="ruleset" value="@insertMember">
    <input type="hidden" name="act" value="procMemberModifyInfo">
    <input type="hidden" name="module" value="member">
    <input type="hidden" name="member_srl" value="1118">
    <input type="hidden" name="signature" value="">
    <input type="hidden" name="page" value="">
    <input type="hidden" name="xe_validator_id" value="modules/member/skins/slow/1">
    
    <ul class="app-member-form">
      <li>
        <label for="user_id">
          <em>*</em>
          <span>아이디</span>
      </label>
        <div>
          <input type="hidden" name="memId" value="<%=memberDto.getMemId() %>">
          <input type="text" name="memId" id="user_id" value="<%=memberDto.getMemId() %>" disabled="disabled" class="app-input app-input-expand">
        </div>
      </li>
      
      <li>
        <label for="user_id"><em style="color:red">*</em> 비밀번호</label>
        <div><input type="password" name="memPw" required=""></div> 
        </li>
      <li>
        <label for="user_id"><em style="color:red">*</em> 비밀번호 확인</label>
        <div><input type="password" name="password2" required=""></div> 
        </li>
      <li>
        <label for="nick_name"><em style="color:red">*</em> 닉네임</label>
        <div><input type="text" name="memNick" id="nick_name" value="<%=memberDto.getMemNick()%>"></div>
      </li>
      <li>
        <label for="user_grade">
          <em>*</em>
          <span>등급</span>
      </label>
        <div>
          <input type="hidden" name="memGrade" value="<%=memberDto.getMemGrade() %>">
          <input type="text" name="memGrade" id="user_grade" value="<%=memberDto.getMemGrade() %>" disabled="disabled" class="app-input app-input-expand">
        </div>
      </li>
      <li>
        <label for="user_gender">
          <em>*</em>
          <span>성별</span>
      </label>
        <div>
          <input type="hidden" name="memGender" value="<%=memberDto.getMemGender() %>">
          <input type="text" name="memGender" id="user_grade" value="<%=memberDto.getMemGender() %>" disabled="disabled" class="app-input app-input-expand">
        </div>
      </li>
      <li>
        <label for="profile_image">프로필 사진</label>
        <div><input type="hidden" name="__profile_image_exist" value="false">
        <input type="file" name="profile_image" id="profile_image" value="" accept="image/*" 
        data-max-filesize="102400" data-max-filesize-error="파일이 너무 큽니다. 용량 제한은 %s입니다.">
        <p class="help-block">파일 용량 제한: 100.0KB, 가로 제한 길이: 50px, 세로 제한 길이: 50px</p></div> 
       </li>      
	<li>
        <label>쪽지 수신 허용</label>
        <div class="tw-flex tw-items-center tw-flex-wrap">
          <div class="tw-inline-flex tw-items-center tw-mr-1">
            <input class="app-input-radio" type="radio" name="allow_message" value="Y" id="allow_Y">
            <label for="allow_Y">전체 수신</label>
          </div><div class="tw-inline-flex tw-items-center tw-mr-1">
            <input class="app-input-radio" type="radio" name="allow_message" value="N" checked="checked" id="allow_N">
            <label for="allow_N">수신 거부</label>
          </div><div class="tw-inline-flex tw-items-center tw-mr-1">
            <input class="app-input-radio" type="radio" name="allow_message" value="F" id="allow_F">
            <label for="allow_F">친구만 허용</label>
          </div>        </div>
      </li>
    </ul>
    
    <div class="tw-text-right tw-pt-6">
      <a class="app-button tw-mr-1" href="mypage.jsp">취소</a>
      <button type="submit" class="app-button primary">등록</button>
    </div>
  <input type="hidden" name="_rx_csrf_token" value="dALfXx8EwiEO2GYj"></form>
  
  <script>
    jQuery(function($) {
      // 프로필 이미지 클릭 이벤트 전이
      $('#profile_imagetag').bind('click', function(e) {
        $(this).next('input[type=file]').trigger('click')
      })
      const option = {
        changeMonth: true,
        changeYear: true,
        gotoCurrent: false,
        yearRange:'-100:+10',
        dateFormat:'yy-mm-dd',
        onSelect: function() {
          $(this).prev('input[type="hidden"]').val(this.value.replace(/-/g, ''));
        }
      }
      $.extend(option, $.datepicker.regional['ko']);
      $(".inputDate").datepicker(option);
      $(".dateRemover").click(function() {
        $(this).prevAll('input').val('');
        return false;
      });
    })
  </script>
</div>
</section>
</div>
<!-- 푸터 -->
	<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
<!-- 우측 사이드  -->
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>