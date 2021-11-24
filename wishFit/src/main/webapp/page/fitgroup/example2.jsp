<%@page import="wishFit.beans.fitgroup.TotalVO"%>
<%@page import="wishFit.beans.fitgroup.FitImageVO"%>
<%@page import="wishFit.beans.firgroupimage.FitgroupImageDto"%>
<%@page import="wishFit.beans.firgroupimage.FitgroupImageDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="wishFit.beans.fitgroup.FitgroupDto"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.fitgroup.FitgroupDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=229c9e937f7dfe922976a86a9a2b723b&libraries=services"></script>
<script>
	$(function() {
		//지도 생성 준비 코드
		var container = document.querySelector("#map");
		var options = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 3
		};

		//지도 생성 코드
		var map = new kakao.maps.Map(container, options);

		// 마커의 위치 , 내용을 가지고 있는 객체 배열입니다
		var positions = [

		];
		var markers = [];
		
		for (var i = 0; i < $(".fgTitle").length; i++) {
			let title = $(".fgTitle").eq(i).val();
			let latti = Number($(".fgLatitude").eq(i).val());
			let longdi = Number($(".fgLongtitude").eq(i).val());
			
			positions.push({
				content : title ,
				latlng : new kakao.maps.LatLng(latti,longdi)
			});			
		}
		
		for (var i = 0; i < positions.length; i++) {
			addMarker(positions[i]);
			
		}

		//마커 생성 함수 + 클릭 이벤트 추가 함수 
		function addMarker(position){
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : position.latlng
			
			});
			
			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
					content : position.content
				// 인포윈도우에 표시할 내용
				});
			
			kakao.maps.event.addListener(marker, 'click', function() {
	
				var lat = marker.getPosition().getLat();
				var lng = marker.getPosition().getLng();
				setCenter(lat,lng);

			});
			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			// 이벤트 리스너로는 클로저를 만들어 등록합니다 
			// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(
					map, marker, infowindow));
			kakao.maps.event.addListener(marker, 'mouseout',
					makeOutListener(infowindow));
			
		}
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			}; 
		}
		
	 	function setCenter(lat,lng) {            
			
		    var moveLatLon = new kakao.maps.LatLng(lat,lng);
		    map.setLevel(3);
		    // 지도 중심을 이동 시킵니다
		    map.setCenter(moveLatLon);
		}
		
		
	});
</script>


<%
FitgroupDao fitgroupDao = new FitgroupDao();

String fgLocation = request.getParameter("fgLocation");

//isSearch = 검색을 실행하는 것
boolean isSearch = fgLocation != null && !fgLocation.equals("");
String title;



FitImageVO fitImageVo = new FitImageVO();
List<FitImageVO> list ;
if(isSearch){
	list = fitgroupDao.detailAll(fgLocation);
}else{
	list=fitgroupDao.listAll();
List<TotalVO> listTotal = fitgroupDao.count();
}
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../css/commons.css">
<!-- 화면 중간. 본문 -->
<main>
	<form>
		<div id="map" style="width: 100%; height: 300px; border-radius: 20px;"></div>
		<div class="container-800 container-center">

			<div class="row center">
				<h2></h2>
			</div>

			<div class="row">
				<input type="search" name="fgLocation"> <input type="submit"
					value="검색">
			</div>
			<div class="row">
				<table class="table table-border table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>작성아이디</th>
							<th>운동카테고리</th>
							<th>제목</th>
							<th>내용</th>
							<th>시작시간</th>
							<th>종료시간</th>
							<th>위치</th>
							<th>위도</th>
							<th>경도</th>
							<th>이미지</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (FitImageVO fitImageVO : list) {
						%>
						<tr>

							<input type="hidden" class="fgTitle" value="<%=fitImageVO.getFgTitle()%>">
							<input type="hidden" class="fglatitude" value="<%=fitImageVO.getFgLatitude()%>">
							<input type="hidden" class="fgLongtitude" value="<%=fitImageVO.getFgLongitude()%>">
							<!-- 갯수만큼 포문이 돌겠 -->
							<td><a href="detail.jsp?fgNo=<%=fitImageVO.getFgNo()%>"><%=fitImageVO.getFgNo()%></a></td>
							<td><%=fitImageVO.getFgId()%></td>
							<td><%=fitImageVO.getExcateName()%></td>
							<td><%=fitImageVO.getFgTitle()%></td>
							<td><%=fitImageVO.getFgIntro()%></td>
							<td><%=fitImageVO.getFgStarttime().substring(0, 16)%></td>
							<td><%=fitImageVO.getFgEndtime().substring(0, 16)%></td>
							<td><%=fitImageVO.getFgLocation()%></td>
							<td><%=fitImageVO.getFgLatitude()%></td>
							<td><%=fitImageVO.getFgLongitude()%></td>
							<%if(fitImageVO.getFgImageNo() != 0) {%>
						<td><img src="download.kh?fgImageNo=<%=fitImageVO.getFgImageNo()%>"></td>
							
						<%}else{ %>
						<td><img src="<%=root%>/resources/common/img/no_image.gif"></td> 
		                  <%} %>
						</tr>
						<%
						}
						%>
						<tr>
						</tr>
					</tbody>
				</table>
			</div>
		</div>


	</form>





	<jsp:include page="/template/footer.jsp"></jsp:include>
</main>


<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>


