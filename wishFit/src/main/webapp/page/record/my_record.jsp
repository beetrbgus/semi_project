<%@page import="java.util.Map"%>
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
  		LocalDate now = LocalDate.now();
    	//현재 년도
   		int year = now.getYear();
   		//현재 월
   		int month = now.getMonthValue();
   		//현재 일
   		int dayOfMonth = now.getDayOfMonth();
   		
   		//파라미터로 boardMiddleName 을 가져올 경우
   		String middleName = request.getParameter("boardMiddleName");
   		boolean isMidName = middleName != null && !middleName.isEmpty();
    %>
    <%
		BoardDao boardDao = new BoardDao();
    	System.out.println(isMidName);
    	Map<String,List<BoardDto>> mapList;
    	if(isMidName){
    		 mapList = boardDao.monthlyListMiddle(year,month,middleName);
    	}else{
			mapList = boardDao.monthlyList(year, month);
    	}
    	
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
		<%=year %>년<%=month %>월
		<button class="btn btn-nextMonth">다음 달</button>
		</h1>
	</div>
	<div class="row"><a href= "#" class="btn">기록 작성</a></div>
	<div class= "row">
	<a href="my_record.jsp" class="btn">
		<label>전체</label>
		</a>
		<a href="my_record.jsp?boardMiddleName=일자별" class="btn">
		<label>일자별</label>
		</a>
		<a href="my_record.jsp?boardMiddleName=소모임" class="btn">
		<label>소모임</label>
		</a>
		<a href="my_record.jsp?boardMiddleName=식단" class="btn">
		<label>식단</label>
		</a>
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
					String time = "";
					if(i < 10) {
						time = year+"-" + month +"-" + "0"+i;
					}else{
						time = year + "-" + month + "-" + i;
					}
					
					List<BoardDto> list = mapList.get(time);
					
					if(list.size()>0){
						
						for(BoardDto boardDto : list){%>
							<tr>
								<td style="border : 1px solid black"><%=boardDto.getBoardDate()%></td>
								<td style="border : 1px solid black"><%=boardDto.getBoardMiddleName()%></td>
								<td style="border : 1px solid black"><%=boardDto.getBoardTitle()%></td>
							</tr>
						<%} %>
					<%} else{%>
							<tr>
								<td style="border : 1px solid black"><%=time%></td>
								<td style="border : 1px solid black"></td>
								<td style="border : 1px solid black"></td>
							</tr>
					<%} %>
				<%} %>
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