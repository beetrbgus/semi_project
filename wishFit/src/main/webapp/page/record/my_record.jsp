<%@page import="wishFit.beans.board.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.time.LocalDate"%>
<%@page import="wishFit.beans.board.RecordBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8	"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<script src = "https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- 달력 날짜 구하기 -->
    
     
    <%
    			LocalDate now = LocalDate.now();
    			//현재 년도,월을 int로 가져오기.
    			int yearInt = now.getYear();
    			int monthInt = now.getMonthValue();
    			int dateInt = now.getDayOfMonth();
    			//현재 년도,월을 String 으로 가져오기.
            	//String year = Integer.toString(yearInt);
            	//String month = Integer.toString(monthInt);
            	
            	//여기서 년도,월을 파라미터로 가져올 때를 생각해야함 그렇게 되면
            	String year = request.getParameter("year");
            	String month = request.getParameter("month");
            	int nowYear;
            	int nowMonth;
            	boolean isParam = year !=null && !year.isEmpty() && month!=null && !month.isEmpty();
            	if(isParam){//파라미터 존재
            		nowYear = Integer.parseInt(year);
            		nowMonth = Integer.parseInt(month);
            		
            		if(nowMonth==13){
            			nowYear+=1;
            			nowMonth=1;
            		}else if(nowMonth==0){
            			nowYear-=1;
            			nowMonth=12;
            		}
            		
            	}else{//파라미터 존재 x
            		nowYear= yearInt;
            		nowMonth = monthInt;
            	}
	%>       		
  	<%     	//회원아이디 세션으로 가져오기
            	String boardWriter = (String)session.getAttribute("uid");
            	
            	//파라미터로 boardMiddleName 을 가져올 경우
           		String middleName = request.getParameter("boardMiddleName");
           		
    %>
    <%
				String nowYearSt = Integer.toString(nowYear);
				String nowMonthSt = Integer.toString(nowMonth);
				if(nowMonth<10){
					nowMonthSt = "0"+nowMonthSt;
				}
				
    			
  				RecordBoardDao recordDao = new RecordBoardDao();
            	Map<String,List<BoardDto>> mapList;
            	boolean isMidName = middleName != null && !middleName.isEmpty();
            	if(isMidName){
            		mapList = recordDao.monthlyListMiddle(nowYear,nowMonth,middleName,boardWriter);
		          }else{
		       		mapList = recordDao.monthlyList(nowYear, nowMonth,boardWriter);
		          }
    %>
    
<script>
	var currentYear = <%=nowYear%>;
	var currentMonth = <%=nowMonth%>;
	var nowCategory="";
	
</script>
<form class="record-form" action="my_record.jsp" method="get">
	<input type="hidden" name="year">
	<input type="hidden" name="month">
</form>

<%
String root = request.getContextPath();
%>

<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/92b01c3552e164431c570224468c40fb97bd6173.default.scssdedd.css" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.base.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.extra-form.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.header.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/30c99582913487f13af4d99470eb98e0b33c0ca2.status-icon.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.card.scssdedd.css?20210328011802" />
<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/782e3367956a91b8978627b8dfd50ebfe1c577b9.base.scssdedd.css?20210328011802" />
<style>
:root { -
	-aside-width: 17.625rem;
}
.form-inline{
	display:inline;
}
</style>

<jsp:include page="/template/leftSide.jsp"></jsp:include>

<main class="app-content app-clearfix">
	<div class="app-clearfix">
		<div id="app-confirm" class="app-confirm">
			<div class="app-confirm__container">
				<div class="app-confirm__box">
					<div class="app-confirm__body">
						<ion-icon class="app-confirm__icon md hydrated"
							name="information-circle-outline" role="img"
							aria-label="information circle outline"></ion-icon>
						<div class="app-confirm__title"></div>
						<div class="app-confirm__description"></div>
					</div>

				</div>

			</div>

		</div>

		<div id="app-board" class="app-board-skin ">
			<div id="board-list">
				<!-- 현재 대분류가 무엇인지 나타내는 영역 -->
				<div class="app-board-header">
					<div class="app-board-title">
						<div class="tw-flex tw-items-center">
							<a
								class="tw-inline-block tw-font-medium tw-text-2xl tw-font-bold tw-mr-1"
								href="/my_record.jsp">내 기록 </a>
							<div class="tw-flex-1"></div>
					<a href="record_write.jsp" class="app-button app-button-rounded primary form-click">
				   <span>+ 글쓰기</span></a>
						</div>
						<!-- 현재 게시판 이름  대분류 + 중분류  -->
						<p
							class="tw-text-sm tw-text-gray-700 tw-bt-1 app-board-description">
						
							내 기록 통합 글입니다.</p>
					</div>
					<div class="">
						<h5 class="left" style="font-size: 20px"><%=nowYear %>월 / <%=nowMonth %>월</h5>
						<button class="btn before-month">이전달</button>
						<button class="btn next-month">다음달</button>
					</div>
				</div>
					
				
				<!-- 현재 게시판 게시글  -->
				<div class="app-board-section">
 					<!-- for문 돌릴 자리 -->
 					<%for(int i=1; i<=mapList.size();i++){ %>
				<% 
					String time="";
					if(i<10){
						time= nowYear +"-"+ nowMonthSt +"-"+ "0"+i;
						}else{
							time = nowYear +"-"+ nowMonthSt +"-"+ i;
					}
					List<BoardDto> list = mapList.get(time);
					
					if(list.size()>0){//list안에 데이터가 있다면
					for(int k=0; k < list.size(); k++){
						BoardDto boardDto = new BoardDto();%>
					<div class="app-card">
						<ul class="app-board-template-list">
							
							<!-- 밑 a 링크 주소 = 그 전체 누르면 해당 게시글 이동 -->
							<li><a class="tw-flex-1" href="record_detail.jsp?boardNo=<%=list.get(k).getBoardNo()%>">
									<div class="tw-flex-1">

										<div class="app-list-meta ">
											<span style="color:"></span> 
											<span >
												<div class="app-list-member" style="color: #;">
												<%if(k==0){//첫번째 칸이라면 %>
													<div class="member_459 tw-inline-flex tw-items-center"><%=list.get(k).getBoardDate()%></div>
												<%}else{//두번째 칸 이상이라면 %>
												<div class="member_459 tw-inline-flex tw-items-center" style="width:70px"></div>
												<%} %>
												</div>
											</span>
											 <span  style="align:center"><%=list.get(k).getBoardMiddleName()%></span> 
											 <span><span class="tw-mr-1"><%=list.get(k).getBoardTitle()%></span></span>

										</div>
									</div>
							</a></li>
						</ul>
					</div>
					<%} %>
					<% }else{//list안에 데이터가없다면%>
					<div class="app-card">
						<ul class="app-board-template-list">
							
							<!-- 밑 a 링크 주소 = 그 전체 누르면 해당 게시글 이동 -->
							<li><a class="tw-flex-1" href="">
									<div class="tw-flex-1">

										<div class="app-list-meta">
											<span style="color:"></span> 
											<span>
												<div class="app-list-member" style="color: #;">
													<div class="member_459 tw-inline-flex tw-items-center"><%=time%></div>
												</div>
											</span>
											 <span  style=";align:center"></span> 
											 <span><span class="tw-mr-1"></span></span>

										</div>
									</div>
							</a></li>
						</ul>
					</div>
					
				<%}
				
			} %>
					<!-- 포문 여기까지 -->
				</div>
				<jsp:include page="/template/footer.jsp"></jsp:include>
			</div>
		</div>
</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>