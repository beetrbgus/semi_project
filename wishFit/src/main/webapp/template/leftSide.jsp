<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script src = "http://code.jquery.com/jquery-3.6.0.js"></script>
 <style>
        table
        {
            border:1px solid #BDBDBD;
            text-align:center;
            width:10%;
            font-size:12px;
        }
        .nextyear, .beforeyear{
            font-size:1%;
            color:#B3B6B3;

        }
        .acc-color-sun{
            color : #FF9090;
        }
        .acc-color-sat{
            color : #7ED5E4;
        }
        .container-left{
            margin-top : 20px;
            margin-left : 20px;
            position : relative;
        }
    </style>
    
    <script>
        var today = new Date(); // 오늘 날짜
        var date = new Date();
    
        //이전 달 누르면 넘어가기
        $(function(){
            $("#before").click(function(){
                today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
                build(); //만들기
            });
        });
        //다음 달 누르면 넘어가기
        $(function(){
            $("#next").click(function(){
                today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
                build();
            });
        });
        function build()
        {
            var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
            var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
            var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
            var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
            yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; //년도와 월 출력
            
            if(today.getMonth()+1==12) //  눌렀을 때 월이 넘어가는 곳
            {
                before.innerHTML=(today.getMonth())+"월";
                next.innerHTML="1월";
            }
            else if(today.getMonth()+1==1) //  1월 일 때
            {
            before.innerHTML="12월";
            next.innerHTML=(today.getMonth()+2)+"월";
            }
            else //   12월 일 때
            {
                before.innerHTML=(today.getMonth())+"월";
                next.innerHTML=(today.getMonth()+2)+"월";
            }
            
        
            // 남은 테이블 줄 삭제
            while (tbcal.rows.length > 2) 
            {
                tbcal.deleteRow(tbcal.rows.length - 1);
            }
            var row = null;
            row = tbcal.insertRow();
            var cnt = 0;
    
            // 1일 시작칸 찾기
            for (i = 0; i < nMonth.getDay(); i++) 
            {
                cell = row.insertCell();
                cnt = cnt + 1;
            }
    
            // 달력 출력
            for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
            { 
                cell = row.insertCell();
                cell.innerHTML = i;
                cnt = cnt + 1;
                if (cnt % 7 == 1) {//일요일 계산
                    cell.innerHTML = "<font color=#FF9090>" + i//일요일에 색
                }
                if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
                    cell.innerHTML = "<font color=#7ED5E4>" + i//토요일에 색
                    row = calendar.insertRow();// 줄 추가
                }
                if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate()) 
                {
                    cell.bgColor = "#BCF1B1"; //오늘날짜배경색
                }
            
            }
    
        }
    </script>
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
                     <a href="index.html"> <span>Now</span>
                     </a>
                  </div>

               </li>
               <li class="">
                  <div class="app-sidebar-left__nav__item">
                     <a href="community.html"> <span>내 기록</span>
                     </a>
                     <ion-icon name="chevron-down-outline" class="app-sidebar-left__nav__more md hydrated" role="img" aria-label="chevron down outline">
                        <div class="icon-inner">
                           <svg xmlns="http://www.w3.org/2000/svg" class="ionicon s-ion-icon" viewBox="0 0 512 512"><title>Chevron Down</title><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="48" d="M112 184l144 144 144-144"></path></svg>
                        </div>
                     </ion-icon>
                  </div>

                  <ul class="app-sidebar-left__nav__child">
                     <li><a href="best.html">추천글게시판</a></li>
                     <li><a href="certifyboard.html">운동인증</a></li>
                     <li><a href="coordiboard.html">운동코디</a></li>
                     <li><a href="freeboard.html">자유게시판</a></li>
                     <li><a href="humorboard.html">유머게시판</a></li>
                     <li><a href="qna.html">질문게시판</a></li>
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
         <div class="tw-mb-5">
            <div class="widget-box widget-img">
               <body onload="build();">
				    <div>
				        <table id="calendar" >
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
				    </div>
				    <div>
				        <a href = "<%=request.getContextPath() %>/page/record/record_write.jsp" class="btn">
				        기록 작성</a>
				    </div>
    
    
			</body>
               </a>
            </div>
            <br>
         </div>
      </div>
   </aside>