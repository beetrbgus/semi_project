<%@page import="wishFit.beans.fitgroup.FitgroupDto"%>
<%@page import="wishFit.beans.fitgroup.FitgroupDao"%>
<%@page import="wishFit.beans.board.BoardDao"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.board.BoardDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>
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

						$("input[name=fgLatitude]").val(result[0].y);
						$("input[name=fgLongitude]").val(result[0].x);

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

				
			}
		}
	});
</script>
<style>
#search-input{
width:88%;
height:30px;
border :3px solid black;
border-radius :5px;
}
#search-submit{
width:30px;
height:35px;
}  
</style>
<link rel="stylesheet" type="text/css" href="../css/commons.css">
<%
String root = request.getContextPath();
%>
<%
int reqfgNo = Integer.parseInt(request.getParameter("fgNo"));
FitgroupDao fitgroupDao = new FitgroupDao();
FitgroupDto fitgroupDto = fitgroupDao.detail(reqfgNo);
%>

<link rel="stylesheet"  href="<%=root %>/resources/files/cache/assets/board_edit/board_edit_file_container_style.css">
<main class="app-content app-clearfix">
	<div id="map" style="width: 800px; height: 300px; border-radius: 20px;"></div>

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
               <div class="app-confirm__footer">
                  <button type="button"></button>
                  <button type="submit"></button>
               </div>
            </div>
         </div>
      </div>
  
      <div id="app-board" class="app-board-skin ">
         <div class="app-card">
            <div class="app-board-section app-board-section-padding">
               	<input id="search-input" type="text" name="keyword" placeholder="지역주소를 검색해주세요!" >
					<button class="search-btn">검색하기</button>
  
             <form action="update.kh" method="post"  id="fgwrite">
                  <div class="tw-flex tw-items-center tw-mb-3"></div>

                  <div class="tw-flex tw-items-center sm:tw-block tw-mb-6">
                  
                     <div class="app-select sm:tw-mb-3 sm:tw-w-full tw-mr-3">
                    
                        <select name="excateName" >
                        
                         <option selected>축구</option>
                        <option >런닝</option>
                 		<option >헬스</option>
                        <option>농구</option>
                      	<option >배드민턴</option>
                       	<option>족구</option>
						 </select>
                     </div>

                 <input type="hidden" name="fgNo" value="<%=reqfgNo%>">
                 <input type="text" name="fgTitle" class="app-input tw-flex-1 sm:tw-w-full"  value="<%=fitgroupDto.getFgTitle() %>" autocomplete="off">
                  </div>

                  	
                  <div class="app-board-editor-wrap tw-mb-3">
  
                     <input type="hidden" name="_saved_doc_title" value=""> 
                     <input type="hidden" name="_saved_doc_content" value=""> 
                     <input type="hidden" name="_saved_doc_document_srl" value=""> 
                     <input type="hidden" name="_saved_doc_message" value="자동 저장된 글이 있습니다. 복구하시겠습니까? 글을 다 쓰신 후 저장하면 자동 저장 본은 사라집니다.">
                     <div id="ckeditor_instance_1" data-editor-sequence="1"
                        data-editor-primary-key-name="document_srl"
                        data-editor-content-key-name="content" style="min-height: 0px;">
                        <div id="cke_editor1"
                           class="cke_1 cke cke_reset cke_chrome cke_editor_editor1 cke_ltr cke_browser_webkit"
                           dir="ltr" lang="ko" role="application"
                           aria-labelledby="cke_editor1_arialbl">
                           <textarea name="fgIntro"  class="form-input fgMemo" rows="10" >  
                            </textarea>
                             <script>
        $(function(){
            $(".fgMemo").on("input", function(){
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
                        </div>
                        <span id="fgLength">0</span>/1000
                     </div>
                     <script>
				function makeTime(){
					let startDate= $("#startDate").val(); // YYYY-MM-DD
					let startTime=  $("#startTime").val();// 24HH:mm		
					let start = startDate + " " + startTime;		
					$("#start").val(start);
					let endDate = $("#endDate").val();
					let endTime =$("#endTime").val();
					let end = endDate +" "+endTime;
					$("#end").val(end);
					
				}
				$(function(){
					$("#fgBtn").click(function(e){
						if($("input[name=fgTitle]").val()==""||
						$("input[name=fgIntro]").val()==""||
						$("input[name=end]").val()==""||
						$("input[name=start]").val()==""||
						$("input[name=fgLocation]").val()==""	)
						{
							e.preventDefault();
   							alert("필수입력란이 비었습니다 확인해 주세요");
   						} else{
		                e.preventDefault();		
		                makeTime();
		                $("#fgwrite").submit();
   						}
		            });
		        });
				</script>
				
                     <th>시작시간</th>
					<td><input id="startDate" type="date" > 
					<input id="startTime" type="time" > 
					<input id="start"type="hidden" name="fgStarttime" value=""></td>

				
				
					<label>종료시간</label>
					<td><input id="endDate" type="date" > 
					<input id="endTime" type="time" > 
					<input id="end" type="hidden" name="fgEndtime" value=""></td>
						<span id="checkTime"> </span>
				
                     
                     <p class="editor_autosaved_message autosave_message"
                        id="editor_autosaved_message_1">&nbsp;</p>
               
                     <div id="xefu-container-1" class="xefu-container xe-clearfix"
                        data-editor-sequence="1">

                        <div class="xefu-dropzone">
                  	<label>운동 위치 :</label>
                  
                    <input type="text" name="fgLocation" value="<%=fitgroupDto.getFgLocation() %>" style="width:300px" >
					<input type="hidden" name="fgLatitude" value="">
					<input type="hidden" name="fgLongitude" value="">
					<br>
               		 </div>     
 
                     </div>
                  </div>

                  <div>
                     <div class="tw-flex tw-items-center tw-mb-6">
                        <div class="tw-mr-3">
                        </div>
                     </div>
                     <div class="tw-mb-3">
                     </div>
                     <div class="sm:tw-block tw-flex tw-items-center">
                        <div class="tw-flex tw-items-center sm:tw-pb-3">
                        </div>
                        <div class="tw-flex-1"></div>
                        
                        <div class="tw-flex">
                           <%-- 취소버튼 --%>
                            <a href="detail.jsp?fgNo=<%=reqfgNo %>" class="app-button tw-mr-2 sm:tw-flex-1">취소</a>
                           <%-- 수정버튼 --%>
 							<button id="fgBtn" type="submit" class="app-button primary sm:tw-flex-1">등록</button>	
                        </div>
                     </div>
                  </div>
               </form>
            </div>

         </div>  
      </div>
   </div>
   <!-- 푸터 -->
   <jsp:include page="/template/footer.jsp"></jsp:include>
</main>

<!--  우측 사이드 -->
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>