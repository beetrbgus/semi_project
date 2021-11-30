<%@page import="wishFit.beans.board.PaginationThumbnail"%>
<%@page import="wishFit.beans.board.BoardImageVO"%>
<%@page import="wishFit.beans.board.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 해당 jsp실행시 대분류 파라미터가 없어서 전체글 조회됨 -->
<%
PaginationThumbnail pagination = new PaginationThumbnail(request);
pagination.calculate();
%>

<%
	String uid = (String)session.getAttribute("uid");
	boolean login = uid != null;
%>


<jsp:include page="/template/header.jsp"></jsp:include>

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
.pagination>a, .pagination>a:link, .pagination>a:visited {
	border: none;
}
</style>

<jsp:include page="/template/leftSide.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="../css/commons.css">
<script>

	
</script>

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
		</div>
		<div id="app-board" class="app-board-skin ">
			<div id="board-list">
				<!-- 현재 대분류가 무엇인지 나타내는 영역 -->
				<div class="app-board-header">
					<div class="app-board-title">
						<div class="tw-flex tw-items-center">
							<a class="tw-inline-block tw-font-medium tw-text-2xl tw-font-bold tw-mr-1"
								href="comu_list.jsp?boardLargeName=커뮤니티">커뮤니티 </a>
				
							<div class="tw-flex-1"></div>
							<%if(login) {%>
								<a href="write.jsp" class="app-button app-button-rounded primary">
      								<ion-icon name="add-outline" role="img" class="md hydrated" aria-label="add outline"></ion-icon>
     								 <span>+글쓰기</span>
     								 <%} %>
   								 </a>
						</div>
						<!-- 현재 게시판 이름  대분류 + 중분류  -->
						<p
							class="tw-text-sm tw-text-gray-700 tw-bt-1 app-board-description">
							자유게시판입니다</p>

					</div>
				<!-- 현재 게시판 게시글  -->
				<div class="app-board-section">

					<div class="app-card">
						<ul class="app-board-template-list">
							<li class="notice"><a href="/community/460"
								class="tw-flex tw-items-start tw-flex-wrap"> <span
									class="tw-text-primary tw-font-bold tw-mr-3">공지</span>
									<div class="tw-flex-1">
										<span class="tw-mr-1">커뮤니티 게시판 이용 안내</span>

										<ion-icon name="image-outline"
											class="app-board-type-icon tw-mr-1 md hydrated" role="img"
											aria-label="image outline"></ion-icon>
									</div>
							</a></li>
							<%for (BoardImageVO boardImageVo : pagination.getList()) {%>
						<li>
							<a class="tw-flex-1" href="detail.jsp?boardNo=<%=boardImageVo.getBoardNo()%>">
									<%if (boardImageVo.getImageNo() != 0) {%>
									<div class="app-thumbnail">
										<img
											src="<%=request.getContextPath()%>/page/community/download.kh?imageNo=<%=boardImageVo.getImageNo()%>" width="48px" height="48px">
									</div>
									<%} %>
									<div class="tw-flex-1">
										<div class="app-list-title tw-flex-wrap">
											<span class="tw-mr-1">[<%=boardImageVo.getBoardMiddleName()%>]</span><span><%=boardImageVo.getBoardTitle()%></span>
											<span>[<%=boardImageVo.getBoardReply() %>]</span>
											<ion-icon name="image-outline"
												class="app-board-type-icon tw-mr-1 md hydrated" role="img"
												aria-label="image outline"></ion-icon>
										</div>

										<div class="app-list-meta">
								
											<span>
												<div class="app-list-member" style="color: #;">
													<div class="app-avatar" style="width: 1.25rem; height: 1.25rem;">
														<img src="/files/member_extra_info/profile_image/459/459.png?20210405162634" alt="profile" title="운동친구">
													</div>											
													<div class="member_459 tw-inline-flex tw-items-center"><%=boardImageVo.getBoardWriter()%></div>
												</div>
											</span> 
											<span title="<%=boardImageVo.getBoardDate()%>"><%=boardImageVo.getBoardDate()%></span>
											<span>
												<span class="tw-mr-1">조회</span>
												<span><%=boardImageVo.getBoardRead()%></span>
											</span>
										</div>
									</div>
									
								</a>
							</li>
							<%} %>
						</ul>
					</div> 
				</div> 
				<div class="app-board-section tw-text-center">
 					<div class="row pagination tw-font-bold">
                 	
        					<!-- 네비게이터 -->
			
			<!--  한블록 전  -->
			<%if (pagination.isPreAvailable()) {%>
			<%if (pagination.isSearch()) {%>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName() %>&boardMiddleName=<%=pagination.getBoardMiddleName() %>&column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getPreBlock()%>">&lt;&lt;</a>
			<%}else if(pagination.isMiddle()){ %>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName() %>&boardMiddleName=<%=pagination.getBoardMiddleName() %>&p=<%=pagination.getPreBlock()%>">&lt;&lt;</a>
			<%}else if(pagination.largeSearch()){ %>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName() %>&column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getPreBlock()%>">&lt;&lt;</a>
			<%}else if(pagination.isLarge()){ %>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName() %>&p=<%=pagination.getPreBlock()%>">&lt;&lt;</a>
			<%} else {%>
				<a href="list.jsp?&p=<%=pagination.getPreBlock()%>">&lt;&lt;</a>
			<%}%>
			<%}%>

			<!-- 한칸 전 -->
			<%if (pagination.isPrev()) {%>
			<%if (pagination.isSearch()) {%>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName() %>&boardMiddleName=<%=pagination.getBoardMiddleName() %>&column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getBack()%>">&lt;</a>
			<%}else if(pagination.isMiddle()){ %>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName() %>&boardMiddleName=<%=pagination.getBoardMiddleName() %>&p=<%=pagination.getBack()%>">&lt;</a>
			<%}else if(pagination.largeSearch()){ %>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName() %>&column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getBack()%>">&lt;</a>
			<%}else if(pagination.isLarge()){ %>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName() %>&p=<%=pagination.getBack()%>">&lt;</a>
			<%} else {%>
				<a href="list.jsp?&p=<%=pagination.getBack()%>">&lt;</a>
			<%}%>
			<%} %>

		<%for(int i = pagination.getStartBlock(); i <= pagination.getRealLastBlock(); i++){ %>
			<%if(pagination.isSearch()){%>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName()%>&boardMiddleName=<%=pagination.getBoardMiddleName()%>&column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=i%>"><%=i %></a>
			<%}else if(pagination.isMiddle()){ %>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName()%>&boardMiddleName=<%=pagination.getBoardMiddleName()%>&p=<%=i%>"><%=i %></a>
			<%} else if(pagination.largeSearch()){%>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName()%>&column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=i%>"><%=i %></a>
			<%} else if(pagination.isLarge()) {%>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName()%>&p=<%=i%>"><%=i %></a>
			<%} else {%>
				<a href="list.jsp?p=<%=i%>"><%=i %></a>
			<%} %>
		<%} %>	

	
			<!--  한칸 앞 -->
			<%if (pagination.isNext()) {%>
			<%if (pagination.isSearch()) {%>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName() %>&boardMiddleName=<%=pagination.getBoardMiddleName() %>&column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getFoward()%>">&gt;</a>
			<%}else if(pagination.isMiddle()){ %>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName() %>&boardMiddleName=<%=pagination.getBoardMiddleName() %>&p=<%=pagination.getFoward()%>">&gt;</a>
			<%}else if(pagination.largeSearch()){ %>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName() %>&column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getFoward()%>">&gt;</a>
			<%}else if(pagination.isLarge()){ %>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName() %>&p=<%=pagination.getFoward()%>">&gt;</a>
			<%} else {%>
				<a href="list.jsp?&p=<%=pagination.getFoward()%>">&gt;</a>
			<%}%>
			<%}%>	
			
			<!-- 한블록 앞 -->
			<%if (pagination.isNextAvailable()) {%>
			<%if (pagination.isSearch()) {%>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName() %>&boardMiddleName=<%=pagination.getBoardMiddleName() %>&column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getNextBlock()%>">&gt;&gt;</a>
			<%}else if(pagination.isMiddle()){ %>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName() %>&boardMiddleName=<%=pagination.getBoardMiddleName() %>&p=<%=pagination.getNextBlock()%>">&gt;&gt;</a>
			<%}else if(pagination.largeSearch()){ %>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName() %>&column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getNextBlock()%>">&gt;&gt;</a>
			<%}else if(pagination.isLarge()){ %>
				<a href="list.jsp?boardLargeName=<%=pagination.getBoardLargeName() %>&p=<%=pagination.getNextBlock()%>">&gt;&gt;</a>
			<%} else {%>
				<a href="list.jsp?&p=<%=pagination.getNextBlock()%>">&gt;&gt;</a>
			<%}%>
			<%} %>
 
    		</div>
          			<div class="app-fr-button-wrap"></div>
				</div>
				
			<div class="row center">
				<form action="comu_list.jsp">
				<%if(pagination.getBoardLargeName() != null) { %>
				<input type="hidden" name="boardLargeName" value="<%=pagination.getBoardLargeName()%>">
				<%} %>	
				<%if(pagination.getBoardMiddleName() != null){ %>
				<input type="hidden" name="boardMiddleName" value="<%=pagination.getBoardMiddleName()%>">
				<%} %>
				<select name="column" class="form-inline">
				<%if (pagination.columnIs("board_title")) {%>
					<option value="board_title" selected="selected">제목</option>
				<%} else {%>
					<option value="board_title">제목</option>
				<%}%>

				<%if (pagination.columnIs("board_post")) {%>
					<option value="board_post" selected="selected">내용</option>
				<%} else {%>
					<option value="board_post">내용</option>
				<%}%>

				<%if (pagination.columnIs("board_writer")) {%>
					<option value="board_writer" selected="selected">작성자</option>
				<%} else {%>
					<option value="board_writer">작성자</option>
				<%} %>
				</select>
				 <input type="text" name="keyword" autocomplete="off" class="form-inline">
				  <input type="submit" value="검색" class="form-inline" >
			</form>
		</div>
				
				
				
				
			</div>
		</div>
				<jsp:include page="/template/footer.jsp"></jsp:include>
</main>









<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>
>>>>>>> refs/remotes/origin/master
