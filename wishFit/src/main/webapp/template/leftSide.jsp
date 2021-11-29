<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script src = "http://code.jquery.com/jquery-3.6.0.js"></script>
<link rel = "stylesheet" type="text/css" href="<%=request.getContextPath() %>/page/css/widget.css">
<script src = "<%=request.getContextPath() %>/page/js/widget.js"></script>
<script src = "<%=request.getContextPath() %>/page/js/record.js"></script>
<%
	String root = request.getContextPath();
	String now = request.getParameter("now");
%> 
<input type="hidden" id = "now" value = <%=now %>>
<form class="record-form" action="my_record.jsp" method="get">
	<input type="hidden" name="year">
	<input type="hidden" name="month">
</form>
    
    
<!-- 왼쪽 사이드 바 -->
<script>
$(document).ready(function(){
	let now = $("#now").val();
	if(now =="record"){
		$(".app-card.app-sidebar-left__nav").f.each
		$("#record").addClass("active open");	
			
		});
	}else if(now =="commu"){
		$(".app-card.app-sidebar-left__nav").findeach(function(index,item){
			$(this).find("li").addClass("active open");	
			});
		});	
	}
	
	$(".app-sidebar-left.app-custom-scroll > nav > ul > li").click(function(){
		//$("li.active open").find("li").removeClass("active open");
		/* $(this).removeClass("active open"); */
	});
	
});
</script>
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
               <li id="record">
                  <div class="app-sidebar-left__nav__item">
                     <a href="<%=root %>/page/record/my_record.jsp?now=record"> <span>내 기록</span>
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
               <li id="commu">
                  <div class="app-sidebar-left__nav__item">
                     <a href="<%=request.getContextPath() %>/page/community/list.jsp?now=commu"> <span>커뮤니티</span>
                     </a>
                     <ion-icon name="chevron-down-outline"
                        class="app-sidebar-left__nav__more"> </ion-icon>
                  </div>
                  <ul class="app-sidebar-left__nav__child">
                    <li><a href="<%=request.getContextPath() %>/page/community/list.jsp?boardLargeName=커뮤니티">전체</a></li>
					<li><a href="<%=request.getContextPath() %>/page/community/list.jsp?boardMiddleName=유머">유머</a></li>
					<li><a href="<%=request.getContextPath() %>/page/community/list.jsp?boardMiddleName=질문">질문</a></li>
					<li><a href="<%=request.getContextPath() %>/page/community/list.jsp?boardMiddleName=운동인증">운동인증</a></li>
					<li><a href="<%=request.getContextPath() %>/page/community/list.jsp?boardMiddleName=코디">코디</a></li>
					<li><a href="<%=request.getContextPath() %>/page/community/list.jsp?boardMiddleName=추천글">추천글</a></li>
                  </ul>
               </li>
               <li>
                  <div class="app-sidebar-left__nav__item">
                     <a href="<%=request.getContextPath() %>/page/fitgroup/list.jsp"> <span>소모임</span>
                     </a>
                     <ion-icon name="chevron-down-outline"
                        class="app-sidebar-left__nav__more"> </ion-icon>
                  </div>
					</li>
					<li class="open">
						<div class="app-sidebar-left__nav__item">
							<a href="<%=request.getContextPath() %>/page/market/list.jsp"> <span>마켓</span>
							</a>
							<ion-icon name="chevron-down-outline"
								class="app-sidebar-left__nav__more"> </ion-icon>
						</div>

						<ul class="app-sidebar-left__nav__child">
							<li><a href="<%=request.getContextPath() %>/page/market/sellList.jsp">판매</a></li>
							<li><a href="<%=request.getContextPath() %>/page/market/buyList.jsp">구매</a></li>
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
