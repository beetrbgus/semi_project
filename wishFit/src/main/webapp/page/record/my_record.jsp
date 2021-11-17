<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="wishFit.beans.board.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 달력 날짜 구하기 -->
    <%
  		//현재날짜 구하기(시스템 시계, 시스템 타임존)
  		LocalDate now = LocalDate.now();
    	//현재 년도
   		int year = now.getYear();
    	String yearSt = Integer.toString(year);
   		//현재 월
   		int monthValue = now.getMonthValue();
   		String monthSt = Integer.toString(monthValue);
   		//현재 일
   		int dayOfMonth = now.getDayOfMonth();
   		String nowDaySt = Integer.toString(dayOfMonth);
   		//현재 월의 마지막 날짜 가져오기
   		
   		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		
		cal.set(year, monthValue-1,dayOfMonth);
		//현재 월의 마지막 날짜
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		String lastDaySt = Integer.toString(lastDay);
		//월의 첫번째 날짜
		int firstDay = cal.getActualMinimum(Calendar.DAY_OF_MONTH);
		String firstDaySt = "01";
		
		//현재 연도 월이 첫 번째 날짜(문자열)
		String startMonthOfDay = yearSt+"-"+monthSt+"-"+firstDaySt;
		//현재 월의 마지막 날짜(문자열)
		String endMonthOfDay = yearSt+"-"+monthSt+"-"+lastDaySt;
		System.out.println("startMonthOfDay = "+startMonthOfDay);
		System.out.println("endMonthOfDay ="+endMonthOfDay);
    %>
    <%
		BoardDao boardDao = new BoardDao();
		List<BoardDto> list = boardDao.listByRecord(startMonthOfDay,endMonthOfDay);
    	
    %>
<link rel = "stylesheet" type="text/css" href="../css/commons.cs"> 


<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>
 

<main class="app-content app-clearfix">

<div class="container-center">
	<div class=" row"><h1 style="font-size:30px">[내 기록]</h1></div>
	<div class="row">
		<h1 class="left" style="font-size: 20px">
		<button class="btn btn-beforeMonth">이전 달</button>
		<%=year %>년<%=monthValue %>월
		<button class="btn btn-nextMonth">다음 달</button>
		</h1>
	</div>
	<div class="row"><a href= "#" class="btn">기록 작성</a></div>
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
				<%for(BoardDto boardDto : list){ %>
				<tr>
					<td style="border : 1px solid black"><%=boardDto.getBoardDate()%></td>
					<td style="border : 1px solid black"><%=boardDto.getBoardMiddleName() %></td>
					<td style="border : 1px solid black"><%=boardDto.getBoardTitle() %></td>
				</tr>
				<%} %>
				
				
			</tbody>
			<tfoot>
			</tfoot>
		</table>
	</div>
	<div class="row"></div>

</div>




<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>