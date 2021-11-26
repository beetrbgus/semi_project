<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script src = "http://code.jquery.com/jquery-3.6.0.js"></script>
<link rel = "stylesheet" type="text/css" href="../css/widget.css">
<script src = "../css/widget.js"></script>
<script src = "../css/record.js"></script>
<link rel = "stylesheet" type="text/css" href="../css/commons.cs"> 
<%
	String root = request.getContextPath();
%> 

<form class="record-form" action="my_record.jsp" method="get">
	<input type="hidden" name="year">
	<input type="hidden" name="month">
</form>
    
    
<!-- 왼쪽 사이드 바 -->
<div class="app-layout">
   <!--#Meta:layouts/slow/components/sidebar-left/sidebar-left.scss?$__Context->themeConfig->variables-->
   <aside id="app-sidebar-left" class="app-layout__sidebar-left">
      <div class="app-sidebar-left app-custom-scroll">
         <!--#Meta:layouts/slow/components/sidebar-left/sidebar-left-profile.scss?$__Context->themeConfig->variables-->
         <!--#Meta:layouts/slow/components/sidebar-left/sidebar-left-nav.scss?$__Context->themeConfig->variables-->
         <nav>
            <ul class="app-card app-sidebar-left__nav">
               <li class="active open">
                  <div class="app-sidebar-left__nav__item">
                     <a href="<%=root %>/index.jsp"> <span>Now</span>
                     </a>
                  </div>

               </li>
               <li class="open">
                  <div class="app-sidebar-left__nav__item">
                     <a href="<%=root %>/page/record/my_record.jsp"> <span>내 기록</span>
                     </a>
                     <ion-icon name="chevron-down-outline" class="app-sidebar-left__nav__more md hydrated" role="img" aria-label="chevron down outline">
                        <div class="icon-inner">
                           <svg xmlns="http://www.w3.org/2000/svg" class="ionicon s-ion-icon" viewBox="0 0 512 512"><title>Chevron Down</title><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="48" d="M112 184l144 144 144-144"></path></svg>
                        </div>
                     </ion-icon>
                  </div>

                  <ul class="app-sidebar-left__nav__child">
<%--                      <li><a href="<%=root %>/page/record/my_record.jsp?boardMiddleName=일자별">일자별</a></li> --%>
<!--                       <li><button>일자별</button></li> -->
<%--                      <li><a href="<%=root %>/page/record/my_record.jsp?boardMiddleName=소모임">소모임</a></li> --%>
<%--                      <li><a href="<%=root %>/page/recordmy_record.jsp?boardMiddleName=식단">식단</a></li> --%>
	                  	<li><button class="reset-record"><span>전체</span></button></li>
						<li><button class="daily-record"><span>일자별</span></button></li>
						<li><button class="fitgroup-record"><span>소모임</span></button></li>
						<li><button class="diet-record"><span>식단</span></button></li>
                  </ul>
               </li>
               <li class="">
                  <div class="app-sidebar-left__nav__item">
                     <a href="infomation.html"> <span>커뮤니티</span>
                     </a>
                     <ion-icon name="chevron-down-outline"
                        class="app-sidebar-left__nav__more"> </ion-icon>
                  </div>

                  <ul class="app-sidebar-left__nav__child">
                     <li><a href="news.html">새로운소식</a></li>
                     <li><a href="experience.html">용품/대회후기</a></li>
                     <li><a href="competition.html">대회소식(생활운동)</a></li>
                     <li><a href="useful.html">유용한사이트</a></li>
                     <li><a href="tip.html">나만의팁</a></li>
                  </ul>
               </li>
               <li class="">
                  <div class="app-sidebar-left__nav__item">
                     <a href="small.html"> <span>소모임</span>
                     </a>
                     <ion-icon name="chevron-down-outline"
                        class="app-sidebar-left__nav__more"> </ion-icon>
                  </div>

                  <ul class="app-sidebar-left__nav__child">
                     <li><a href="swim.html">수영</a></li>
                     <li><a href="bike.html">자전거</a></li>
                     <li><a href="run.html">달리기</a></li>
                     <li><a href="hiking.html">등산</a></li>
                     <li><a href="fitness.html">홈트짐트</a></li>
                     <li><a href="Pilates.html">필라테스/요가</a></li>
                     <li><a href="golf.html">골프</a></li>
                     <li><a href="skate.html">스케이트(빙상)</a></li>
                  </ul>
               </li>
               <li class="">
                  <div class="app-sidebar-left__nav__item">
                     <a href="elite.html"> <span>마켓</span>
                     </a>
                     <ion-icon name="chevron-down-outline"
                        class="app-sidebar-left__nav__more"> </ion-icon>
                  </div>

                  <ul class="app-sidebar-left__nav__child">
                     <li><a href="elitecom.html">대회소식(엘리트)</a></li>
                     <li><a href="elitefree.html">자유게시판(엘리트)</a></li>
                     <li><a href="counseling.html">진로고민상담</a></li>
                     <li><a href="parents.html">학부모게시판</a></li>
                     <li><a href="career.html">구인구직</a></li>
                  </ul>
               </li>
               <li class="">
                  <div class="app-sidebar-left__nav__item">
                     <a href="managment.html"> <span>운영사항</span>
                     </a>
                     <ion-icon name="chevron-down-outline"
                        class="app-sidebar-left__nav__more"> </ion-icon>
                  </div>

                  <ul class="app-sidebar-left__nav__child">
                     <li><a href="notice.html">안내사항</a></li>
                     <li><a href="event.html">이벤트</a></li>
                     <li><a href="suggest.html">개선/건의</a></li>
                     <li><a href="call112.html">신고</a></li>
                  </ul>
               </li>
            </ul>
         </nav>
         <div class="app-card app-sidebar-left__nav" style="margin:0px 0px 0px ">
            <div class="">
				    <div>
				        <table id="calendar" style="width:100%;height:70px;padding : 0px 0px ">
				            <tr>
				                <td class="beforeyear"><label id="before"></label></td>
				                <td colspan="5" id="yearmonth"></td>
				                <td class="nextyear"><label id="next"></label></td>
				            </tr>
				            <tr class="line">
				                <td class="acc-color-sun week-head">일</td>
				                <td class="week-head">월</td>
				                <td class="week-head">화</td>
				                <td class="week-head">수</td>
				                <td class="week-head">목</td>
				                <td class="week-head">금</td>
				                <td class="acc-color-sat week-head">토</td>
				            </tr>
				        </table>
				        <a href = "<%=request.getContextPath() %>/page/record/record_write.jsp" class="btn" style="width:49%;height:50%;">
				        기록 작성</a>
				        <a href = "<%=request.getContextPath() %>/page/record/my_record.jsp" class="btn" style="width:49%;height:50%;">
				        기록 목록</a>
				    </div>
            </div>
            <br>
         </div>
      </div>
      
   </aside>
