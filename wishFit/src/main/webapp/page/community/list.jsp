<%@page import="wishFit.beans.PaginationThumbnail"%>
<%@page import="wishFit.beans.board.BoardImageVO"%>
<%@page import="wishFit.beans.board.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 페이지네이션 -->
<%
PaginationThumbnail pagination = new PaginationThumbnail(request);
pagination.calculate();
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="../css/commons.css">
<script>

	
</script>


<div class="container-1000 container-center">
	<div class="row center">
		<h1 style="font-size: 2rem;">
			<a href="list.jsp?boardLargeName=커뮤니티">커뮤니티</a>
		</h1>
	</div>
	<br>
	<!-- 게시글 정렬 -->
	<div style="display: inline;">
		<a href="list.jsp?boardLargeName=커뮤니티&boardMiddleName=질문" class="btn">질문</a>
	</div>
	<div style="display: inline;">
		<a href="list.jsp?boardLargeName=커뮤니티&boardMiddleName=유머" class="btn">유머</a>
	</div>
	<div style="display: inline;">
		<a href="list.jsp?boardLargeName=커뮤니티&boardMiddleName=운동코디" class="btn">운동코디</a>
	</div>
	<div style="display: inline;">
		<a href="list.jsp?boardLargeName=커뮤니티&boardMiddleName=운동인증" class="btn">운동인증</a>
	</div>
	<div style="display: inline;">
		<a href="list.jsp?boardLargeName=커뮤니티&boardMiddleName=추천글" class="btn">추천글</a>
	</div>
	<br>

	<div class="row center">
		<!-- 테이블 제목 영역 -->
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>분류</th>
					<th></th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>추천</th>
					<th>비추천</th>
				</tr>
			</thead>
			<!-- 리스트 출력 영역 -->
			<tbody style="font-size: small;">
				<%for (BoardImageVO boardImageVo : pagination.getList()) {%>
				<tr>
					<td><%=boardImageVo.getBoardNo()%></td>
					<td><%=boardImageVo.getBoardMiddleName()%></td>
				<%if (boardImageVo.getImageNo() != 0) {%>
					<td><img src="<%=request.getContextPath()%>/page/community/download.kh?imageNo=<%=boardImageVo.getImageNo()%>" width="48px" height="48px"></td>
				<%} else {%>
					<td><img src="<%=request.getContextPath()%>/resources/common/img/img.png"></td>
				<%}%>
					<td style="text-align: left">
					<a href="detail.jsp?boardNo=<%=boardImageVo.getBoardNo()%>"><%=boardImageVo.getBoardTitle()%></a></td>
					<td><%=boardImageVo.getBoardWriter()%></td>
					<td><%=boardImageVo.getBoardDate()%></td>
					<td><%=boardImageVo.getBoardRead()%></td>
					<td><%=boardImageVo.getBoardLike()%></td>
					<td><%=boardImageVo.getBoardHate()%></td>
				<%}%>
				</tr>
			</tbody>
		</table>
		<div class="row right">
			<div class="btn">
				<a href="comu_write.jsp">글쓰기</a>
			</div>
		</div>
		<div style="font-size: medium;" class="row pagination">


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

		
		
		<!-- 검색 영역 -->
		<div class="row center">
			<form action="list.jsp">
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
				  <input type="submit" value="검색" class="form-inline">
			</form>
		</div>
	</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
</div>

<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>