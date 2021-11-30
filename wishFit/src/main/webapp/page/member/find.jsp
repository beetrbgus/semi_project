<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
        <section class="app-member"><div class="tw-w-full">
        <div class="app-member-card">
    <div class="app-member-card-header">
      <div>
        <h1>아이디 찾기</h1>
        <p class="tw-text-gray-700">회원정보에 등록된 이름과 전화번호로 아이디/비밀번호를 알려드립니다. 아이디와 전화번호를 입력하고 "ID/PW 찾기" 버튼을 클릭해 주세요.<br></p>
      </div>
    </div>
    <div class="app-member-card-body">
      <form action="findId.kh" method="post">
      <input type="hidden" name="error_return_url" value="/index.php?mid=index&amp;act=dispMemberFindAccount"><input type="hidden" name="ruleset" value="findAccount">
        <input type="hidden" name="mid" value="index">
        <input type="hidden" name="act" value="procMemberFindAccount">
        <input type="hidden" name="document_srl" value="">
        <input type="hidden" name="page" value="">
        <input type="hidden" name="xe_validator_id" value="modules/member/skin/slow/find_member_account/1">
        
        <input class="app-input app-input-expand tw-mb-3" type="text" name="memName" required="" placeholder="이름을 입력하세요" title="이름"> 
        <input class="app-input app-input-expand tw-mb-3" type="text" name="memPhone" required="" placeholder="-을 포함한 전화번호를 입력하세요" title="이름"> 
        <button class="app-button app-button-expand primary" type="submit">ID 찾기</button>
      </form>
    </div>
  </div>
    
    <div class="app-member-card">
    <div class="app-member-card-header">
      <div>
        <h1>비밀번호 찾기</h1>
        <p class="tw-text-gray-700">회원 정보에 입력한 아이디와 질문/답변으로 비밀번호를 알 수 있습니다.</p>
      </div>
    </div>
    <div class="app-member-card-body">
      <form action="findPw.kh" method="post"><input type="hidden" name="error_return_url" value="/index.php?mid=index&amp;act=dispMemberFindAccount"><input type="hidden" name="ruleset" value="@find_member_account_by_question">
        <input type="hidden" name="module" value="member">
        <input type="hidden" name="mid" value="index">
        <input type="hidden" name="document_srl" value="">	
        <input type="hidden" name="act" value="procMemberFindAccountByQuestion">
        <input type="hidden" name="success_return_url" value="/index.php?act=dispMemberGetTempPassword">
        <input type="hidden" name="page" value="">
        <input type="hidden" name="xe_validator_id" value="modules/member/skin/slow/find_member_account/2">
        
        <div>
                  </div>
        <div>
          <input class="app-input app-input-expand tw-mb-3" type="text" name="memId" required="" placeholder="아이디를 입력하세요" title="아이디">
        </div>
        <div class="app-select app-expand tw-mb-3">
          <select name="memPwQ" id="pw_question">
                        <option value="01">아버지의 성함은?</option>
                        <option value="02">어머니의 성함?</option>
                        <option value="03">자신의 생일은?</option>
                        <option value="04">출신 초등학교는?</option>
                        <option value="05">감명깊게 읽은 책 이름은?</option>
                      </select>
        <ion-icon name="chevron-down-outline" role="img" class="md hydrated" aria-label="chevron down outline"></ion-icon></div>
        
        <input class="app-input app-input-expand tw-mb-3" type="text" name="memPwA" value="" required="" placeholder="비밀번호 찾기 질문/답변" title="비밀번호 찾기 질문/답변">
        <button class="app-button app-button-expand primary" type="submit">비밀번호 찾기</button>
      </form>
    </div>
  </div></div>
</section>      </div>
	<!-- 푸터 -->
	<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
<!-- 우측 사이드  -->
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>