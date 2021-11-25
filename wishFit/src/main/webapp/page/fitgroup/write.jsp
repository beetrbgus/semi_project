<%@page import="java.util.ArrayList"%>
<%@page import="wishFit.beans.fitgroup.FitgroupDto"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.fitgroup.FitgroupDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=229c9e937f7dfe922976a86a9a2b723b&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

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
		$(".search-btn").click(
				function() {
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();

					// 주소로 좌표를 검색합니다

					geocoder.addressSearch($("input[name=keyword]").val(),
							function(result, status) {

								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
				});
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new kakao.maps.InfoWindow({
			zindex : 1
		}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result,
					status) {
				if (status === kakao.maps.services.Status.OK) {
					var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
							+ result[0].road_address.address_name + '</div>'
							: '';
					detailAddr += '<div>지번 주소 : '
							+ result[0].address.address_name + '</div>';

					var content = '<div class="bAddr">'
							+ '<span class="title">법정동 주소정보</span>'
							+ detailAddr + '</div>';

					// 마커를 클릭한 위치에 표시합니다 
					marker.setPosition(mouseEvent.latLng);
					marker.setMap(map);

					// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					infowindow.setContent(content);
					infowindow.open(map, marker);
					$("input[name=fgLocation]").val(
							result[0].address.address_name);
					var address = $("input[name=fgLocation]").val();

					//2. 카카오 장소변환 샘플 코드를 복사 후 일부 수정
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();

					// 주소로 좌표를 검색합니다
					geocoder.addressSearch(address, function(result, status) {
						var coords = new kakao.maps.LatLng(result[0].y,
								result[0].x);

						$("input[name=fglatitude]").val(result[0].y);
						$("input[name=fglongitude]").val(result[0].x);

					});
				}
			});
		});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);

		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;
						break;

					}
				}
			}
		}
	});
</script>
<%
String uid = (String)request.getSession().getAttribute("uid");
%>



<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../css/commons.css">
<!-- 화면 중간. 본문 -->
<main class="app-content app-clearfix">
	<h1>소모임 작성페이지</h1>
	<div id="map" style="width: 800px; height: 300px; border-radius: 20px;"></div>
	<input type="text" name="keyword">
	<button class="search-btn">검색하기</button>



	<form action="write.kh" method="post" enctype="multipart/form-data"
	id="fgwrite">

		<table>
			<tbody>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="fgId" value="<%=uid%>"></td>
				</tr>
				<tr>
				<tr>
					<th>카테고리</th>
					<td><select name="excateName">
							<option>축구</option>
							<option>조깅</option>
							<option>헬스</option>
							<option>배드민턴</option>
							<option>테니스</option>
							<option>농구</option>
							<option>코딩</option>

					</select></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="fgTitle" required></td>
				</tr>
				 <script>
        $(function(){
            $("#fgMemo").on("input", function(){
                //입력값을 text라는 변수에 저장
                var answer = $(this).val();

                var len = answer.length;
            
                //만약 1000글자가 넘어간다면 넘어간 만큼 글자를 제거
                while(len > 1000){
                    //textarea.value = textarea.value.substring(0, textarea.value.length-1);
                    $(this).val($(this).val().substring(0, $(this).val().length - 1));
                    len--;
                }

                $("#fgLength").text(len);
            });
        });
    </script>
    
				<tr>
					<th>소개</th>
					<td>
					<textarea id="fgMemo" name="fgIntro" required rows="10">
					</textarea>
						<span id="fgLength">0</span>/1000
						</td>
				</tr>
				<tr>
					<th>위치</th>
					<td><input type="text" name="fgLocation" required></td>
					<td><input type="text" name="fglatitude"></td>
					<td><input type="text" name="fglongitude"></td>
				</tr>
				<tr>
					<td>이미지 사진</td>
					<td><input type="file" name="fgImage"></td>
				</tr>
				<script>
				function makeTime(){
					let startDate= $("#startDate").val(); // YYYY-MM-DD
					let startTime=  $("#startTime").val();// 24HH:mm		
					let start = startDate + " " + startTime;		
					$("#start").val(start);
					console.log(start);
					console.log("스타트    " + $("#start").val());
					let endDate = $("#endDate").val();
					let endTime =$("#endTime").val();
					let end = endDate +" "+endTime;
					$("#end").val(end);
					console.log($("#end").val());
				}
				$(function(){
					$("#fgBtn").click(function(e){
		                e.preventDefault();

		                makeTime();
		                $("#fgwrite").submit();
		            });
		        });
				</script>
				<tr>
					<th>시작시간</th>
					<td><input id="startDate" type="date" required> <input
						id="startTime" type="time" required> <input id="start"
						type="text" name="fgStarttime"></td>

				</tr>
				<tr>
					<th>종료시간</th>
					<td><input id="endDate" type="date" required> <input
						id="endTime" type="time" required> <input id="end"
						type="text" name="fgEndtime"></td>
						<span id="checkTime"> </span>
				</tr>

				<tr>
					<td colsapn="2">
						<button id="fgBtn" type="submit">글 작성하기</button>
					<td><a href="list.jsp">목록으로 </a></td>
					<td>
				</tr>
			</tbody>

		</table>
	</form>
	<jsp:include page="/template/footer.jsp"></jsp:include>
</main>


<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>


