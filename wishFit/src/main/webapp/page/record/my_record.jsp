<%@page import="wishFit.beans.board.RecordBoardDao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="wishFit.beans.board.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src = "https://code.jquery.com/jquery-3.6.0.js"></script>
<script src = "../css/record.js"></script>
<link rel = "stylesheet" type="text/css" href="../css/commons.cs"> 
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

  <!-- ------------------------------------------------- -->
<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>
 

<main class="app-content app-clearfix">
<!-- 기록은 자기 글만 볼 수 있으니 session 으로 boardWriter를 hidden으로 보내기 -->
<script>
	
</script>
<div class="container-center container-700">
	<div class=" row"><h1 style="font-size:30px">[내 기록]</h1></div>
	<div class="row">
		<h1 class="left" style="font-size: 20px">
		<label><h3><%=nowYear %>월 / <%=nowMonth %>월</h3></label>
		<button class="btn before-month">이전달</button>
		<button class="btn next-month">다음달</button>
		</h1>
	</div>
	
	<div class="row"><a href= "record_write.jsp" class="btn">기록 작성</a></div>
	<div class= "row">
		<a href="my_record.jsp" class="btn">
		<label>처음으로</label>
		</a>
		<button class="btn reset-record"><span>전체</span></button>
		<button class="btn daily-record"><span>일자별</span></button>
		<button class="btn fitgroup-record"><span>소모임</span></button>
		<button class="btn diet-record"><span>식단</span></button>
	</div>
	<div class="row">
 	<table  class="table" style="width:100%">
			<thead style="height:25px">
				<tr>
					<th width="15%" style="border : 1px solid black ">날짜</th>
					<th width="15%" style="border : 1px solid black">분류</th>
					<th width="60%" style="border : 1px solid black">제목</th>
				</tr>
			</thead>
			<tbody>
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
						<tr>
						<%if(k==0){//첫번째 칸이라면 %>
							<td style="border : 1px solid black" ><%=list.get(k).getBoardDate()%></td>
						<%}else{//두번째 칸 이상이라면 %>
							<td style="border : 1px solid black;">
							<img src = "<%=request.getContextPath() %>/resources/image/right-arrow.png" style="width:20px;height:20px;">
							</td>
						<%} %>
							<td style="border : 1px solid black"><%=list.get(k).getBoardMiddleName()%></td>
							<td style="border : 1px solid black; text-align:left; padding :0rem 0.5rem ">
							<a href="record_detail.jsp?boardNo=<%=list.get(k).getBoardNo()%>"><%=list.get(k).getBoardTitle()%></a>
							</td>
						</tr>
					<%} %>
				<% }else{//list안에 데이터가없다면%>
					<tr>
							<td style="border : 1px solid black"><%=time%></td>
							<td style="border : 1px solid black"></td>
							<td style="border : 1px solid black"></td>
						</tr>
					
				<%}
				
			} %>
				
			</tbody>
			<tfoot>
			</tfoot>
		</table>
		
	</div>
	

</div>


<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>




 