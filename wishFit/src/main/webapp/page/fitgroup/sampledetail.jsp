<%@page import="wishFit.beans.firgroupimage.FitgroupImageDto"%>
<%@page import="wishFit.beans.firgroupimage.FitgroupImageDao"%>
<%@page import="wishFit.beans.mysmallgroup.MySmallGroupDao"%>
<%@page import="wishFit.beans.mysmallgroup.MySmallGroupDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="wishFit.beans.fitgroup.FitgroupDto"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.fitgroup.FitgroupDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=229c9e937f7dfe922976a86a9a2b723b&libraries=services"></script>
<script>
	$(function() {
		//지도 생성 준비 코드
		var container = document.querySelector("#map");
		var options = {
			center : new kakao.maps.LatLng($("input[name=latitude]").val(), $(
					"input[name=longitude]").val()),
			level : 3
		};

		//지도 생성 코드
		var map = new kakao.maps.Map(container, options);

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng($("input[name=latitude]")
				.val(), $("input[name=longitude]").val());

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	});
</script>
<%
FitgroupDao fitgroupDao = new FitgroupDao();
int fgNo = Integer.parseInt(request.getParameter("fgNo"));
FitgroupDto fitgroupDto = fitgroupDao.detail(fgNo);
String uid = "ksm01";
boolean isJoin = false;

//이미지 파일 가져오기
FitgroupImageDao fitgroupImageDao = new FitgroupImageDao();
FitgroupImageDto fitgroupImageDto = fitgroupImageDao.find(fgNo);
%>
<%
MySmallGroupDao mySmallGroupDao = new MySmallGroupDao();
List<MySmallGroupDto> list = mySmallGroupDao.search(fgNo);
// MySmallGroupDto mySmallGroupDto = new MySmallGroupDto();
// mySmallGroupDto = mySmallGroupDao.detail(fgNo, uid);
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../css/commons.css">
<!-- 화면 중간. 본문 -->
<main class="app-content app-clearfix">
	<div id="map" style="width: 100%; height: 300px; border-radius: 20px;"></div>
	<h1 align="center">소모임 상세페이지</h1>

	<div class="container-700 container-center">

		<div class="row center">
			<tbody>
				<div class="row">
					<td>소모임 번호 :<%=fitgroupDto.getFgNo()%>
					</td>
					<td>작성자 <%=fitgroupDto.getFgId()%></td>
				</div>
				<div class="row">
					카테고리 :
					<%=fitgroupDto.getExcateName()%></div>
				<div class="row">
					<td>제목 : <%=fitgroupDto.getFgTitle()%></td>
				</div>
				<div class="row fgloaction">
					<td>위치 : <%=fitgroupDto.getFgLocation()%></td>
				</div>
				<div class="row">
					<td>소개 : <%=fitgroupDto.getFgIntro()%></td>
				</div>
				<div class="row">
					<td>시작시간 : <%=fitgroupDto.getFgStarttime()%></td>
					<td>종료시간 : <%=fitgroupDto.getFgEndtime()%></td> <input type="text"
						name="latitude" value="<%=fitgroupDto.getFgLatitude()%>">
					<input type="text" name="longitude"
						value="<%=fitgroupDto.getFgLongtitude()%>">
				</div>
				
				<div class="row">
				
					<td>이미지</td> 
					
					<%if(fitgroupImageDto != null) { //이미지가 없으면 안보여준다.%>	
					<img src="download.kh?fgImageNo=<%=fitgroupImageDto.getFgImageNo()%>">
					<%} %>
				</div>
				<div>
					<h2>참가자 명단</h2>
					<%
					for (MySmallGroupDto mySmallGroupDto : list) {
					%>
					<tr>
						<td><%=mySmallGroupDto.getMemId()%></td>
						<%
						isJoin = (mySmallGroupDto.getMemId().equals(uid)) ? true : false;
						%>
						<%

						%>
					</tr>
					<%
					}
					%>

				</div>
		</div>
		<button>
			<a href="list.jsp">목록으로</a>
		</button>
		<a href="delete.kh?fgNo=<%=fitgroupDto.getFgNo()%>">삭제</a>
		<button>
			<a href="update.jsp?fgNo=<%=fitgroupDto.getFgNo()%>">수정</a>
		</button>
		<%
		if (isJoin) {
		%>
		<a href="cancel.kh?fgNo=<%=fitgroupDto.getFgNo()%>&memId=<%=uid%>">취소하기</a>
		<%
		} else {
		%>


		<a href="join.kh?fgNo=<%=fitgroupDto.getFgNo()%>">참가하기</a>
		<%
		}
		%>
		</tbody>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
</main>


<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>


