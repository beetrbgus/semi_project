<%@page import="wishFit.beans.member.MemberProfileDto"%>
<%@page import="wishFit.beans.member.MemberProfileDao"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.fitgroup.FitImageVO"%>
<%@page import="wishFit.beans.fitgroup.FitgroupDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8	"
	pageEncoding="UTF-8"%>
	

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
			let longdi = Number($(".fgLongitude").eq(i).val());
			console.log($(".fgTitle").eq(i).val());
			console.log($(".fgLatitude").eq(i).val());
			console.log($(".fgLongitude").eq(i).val());
		
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
String root = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="../css/commons.css">
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
</style>
<%
//String uid =request.getSession().getAttribute("uid");
FitgroupDao fitgroupDao = new FitgroupDao();

String fgLocation = request.getParameter("fgLocation");

//isSearch = 검색을 실행하는 것
boolean isSearch = fgLocation != null && !fgLocation.equals("");
String title;
String uid = "ksm01";


FitImageVO fitImageVo = new FitImageVO();
List<FitImageVO> list ;
if(isSearch){
	list = fitgroupDao.detailAll(fgLocation);
}else{
	list=fitgroupDao.listAll();
}
MemberProfileDao memberProfileDao = new MemberProfileDao();
MemberProfileDto memberProfileDto = memberProfileDao.get(uid);
//자기 자신 글 인지 확인하기
//boolean isOwner = uid.equals(fitImageVo.getFgId());
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>

<form>
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
								href="/community">소모임 </a>
							<div class="tw-flex-1"></div>
		
						</div>
						<!-- 현재 게시판 이름  대분류 + 중분류  -->
						<p
							class="tw-text-sm tw-text-gray-700 tw-bt-1 app-board-description">
						
							소모임 통합게시판입니다</p>
					</div>
				</div>
				<!-- 지도 api -->
				<div id="map" style="width: 800px; height: 300px; border-radius: 20px;"></div>
				
			<div class="app-aside-search">
			
	
			<input type="text" name="fgLocation"
		placeholder="검색" value="" class="app-aside-search-input" />

			</div>
 				
 					<button type="button"onclick = "location.href = 'write.jsp'">글작성</button>
 					<%
						for (FitImageVO fitImageVO : list) {
						%>
						<div class="app-board-section">
					<div class="app-card">
						<ul class="app-board-template-list">
							<!-- 마커 등록을 위한 hidden -->
							<td><input type="hidden" class="fgTitle" value="<%=fitImageVO.getFgTitle()%>"></td>
							<td><input type="hidden" class="fgLatitude" value="<%=fitImageVO.getFgLatitude()%>"></td>
							<td><input type="hidden" class="fgLongitude" value="<%=fitImageVO.getFgLongitude()%>"></td>
							
							<li><a class="tw-flex-1" href="detail.jsp?fgNo=<%=fitImageVO.getFgNo()%>">
							
									<div class="app-thumbnail">
									<%if(fitImageVO.getFgImageNo() == 0) {%><!-- 사진이 없으면 기본이미지 --> >
										<img src="<%=root%>/resources/common/img/no_image.gif">
										<%}else{ %>
										<img src="download.kh?fgImageNo=<%=fitImageVO.getFgImageNo()%>">
										<%} %>
									</div>
									
									
									<!-- 제목 -->
									<div class="tw-flex-1">
										<div class="app-list-title tw-flex-wrap">
											<span class="tw-mr-1"><%=fitImageVO.getFgTitle()%>			
											</span>
										</div>

										<div class="app-list-meta">
											<span style="color:"></span><span>

												<div class="app-list-member" style="color:#;">
													
													<div class="app-avatar"
														style="width: 1.25rem; height: 1.25rem;">
														
														<img src="profile.kh?mpNo=<%=memberProfileDto.getMpNo() %>">
													</div>

													<div class="member_459 tw-inline-flex tw-items-center">
													<%=fitImageVO.getFgId()%></div>
												</div>
											</span>
											 <span><span class="tw-mr-1">시작시간 : </span>
											  <span><%=fitImageVO.getFgStarttime().substring(0,16)%></span>
											</span>
											
											 <span><span class="tw-mr-1">위치 : </span>
											  <span><%=fitImageVO.getFgLocation()%></span>
											</span>

										</div>
									</div>
							</a></li>
						</ul>
					</div>
					 <%} %>
					  </form>
					  
					  
					  
					  
					  
					  
				</div>
				<jsp:include page="/template/footer.jsp"></jsp:include>
			</div>
		</div>
</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>

