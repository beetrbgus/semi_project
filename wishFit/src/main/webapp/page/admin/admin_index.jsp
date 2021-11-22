<%@page import="wishFit.beans.admin.Pagination"%>
<%@page import="wishFit.beans.admin.MemoDto"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.admin.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
   <%
   		Pagination pagination = new Pagination(request); 
//   	pagination.setPageSize(5);  이 부분은 괄호 안의 숫자만큼 글 목록을 보여줍니다. 삭제하시면 10개로 출력
   		pagination.calculate();
   %> 

<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="../css/commons.css">
<script>

</script>
	 
<div class="container-1000 container-center">
	<div class="row center">
		<h1 style="font-size: 2rem;">관리자페이지</h1>
		<br><br>
		<a href="<%=request.getContextPath() %>/page/admin/memberList.jsp"  class="btn">회원관리</a>
		<a href="#" class="btn">알림보내기</a>
        <a href="#" class="btn">신고내역</a>
	</div>
	<%=pagination.toString() %>
	<div class="row center">
	<!-- 테이블 제목 영역 -->
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>내용</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<!-- 리스트 출력 영역 -->
			<tbody  style="font-size: small;">
				<%for(MemoDto memoDto : pagination.getList()) { %>
					<tr>
					<td><%=memoDto.getMemoNo() %></td>
					<td style="text-align: left"><%=memoDto.getMemoContent() %></td>
					<td><%=memoDto.getMemId() %></td>
					<td><%=memoDto.getMemoTime() %></td>
					<td class="btn"><a href="<%=request.getContextPath() %>/admin/delete.wishfit">삭제</a></td>
					<%} %>
				</tr>
			</tbody>
		</table>
		<div style="font-size: medium;" class="row pagination">
		
		<!-- 네비게이터 -->
		
		<!-- << -->
		<%if(pagination.isPreAvailable()){ %>
		<%if(pagination.isSearch()) { %>
		<a href="admin_index.jsp?column=<%=pagination.getColumn() %>&keyword=<%=pagination.getKeyword() %>&p=<%=pagination.getPreBlock()%>">&lt;&lt;</a>
		<%}else{ %>
		<a href="admin_index.jsp?p=<%=pagination.getPreBlock()%>">&lt;&lt;</a>
		<%} %>
		<%} %>
		
		<!-- < -->
		<%if(pagination.isPrev()){ %>
		<%if(pagination.isSearch()) { %>	
		<a href="admin_index.jsp?column=<%=pagination.getColumn() %>&keyword=<%=pagination.getKeyword() %>&p=<%=pagination.getBack()%>">&lt;</a>
		<%}else{ %>
		<a href="admin_index.jsp?p=<%=pagination.getBack()%>">&lt;</a>
		<%} %>
		<%} %>


					<!-- 네비게이터 숫자 부분 -->
					<%for(int i = pagination.getStartBlock(); i <= pagination.getRealLastBlock(); i++){ %>
					<%if(pagination.isSearch()){ %>
					<a href="admin_index.jsp?column=<%=pagination.getColumn() %>&keyword=<%=pagination.getKeyword() %>&p=<%=i%>"><%=i %></a>
					<%}else{ %>
					<a href="admin_index.jsp?p=<%=i%>"><%=i %></a>
					<%} %>
					<%} %>
		<!--  >  -->
		<%if(pagination.isNext()){%>
			<%if(pagination.isSearch()){ %>
				<a href="admin_index.jsp?column=<%=pagination.getColumn() %>&keyword=<%=pagination.getKeyword() %>&p=<%=pagination.getFoward()%>">&gt;</a>
			<%}else{ %>
				<a href="admin_index.jsp?p=<%=pagination.getFoward()%>">&gt;</a>
			<%}%>
		<%}%>	
		
		<!--  >>  -->
		<%if(pagination.isNextAvailable()){ %>
			<%if(pagination.isSearch()){ %>
				<a href="admin_index.jsp?column=<%=pagination.getColumn() %>&keyword=<%=pagination.getKeyword() %>&p=<%=pagination.getNextBlock()%>">&gt;&gt;</a>
			<%}else{ %>
				<a href="admin_index.jsp?p=<%=pagination.getNextBlock()%>">&gt;&gt;</a>
			<%}%>
		<%}%>
		<!--  네비게이터 끝 -->
		
		</div>
		
		<!-- 검색 영역 -->
		<div class="row center">
			<form action="admin_index.jsp">
				<select name="column" class="form-inline">
				
				<%if(pagination.columnIs("mem_id")){ %>
					<option value="mem_id" selected="selected">작성자</option>
				<%}else{ %>
					<option value="mem_id">작성자</option>
				<%} %>	

				<%if(pagination.columnIs("memo_content")){ %>
					<option value="memo_content" selected="selected">내용</option>
				<%}else{ %>
					<option value="memo_content">내용</option>
				<%} %>
				
				</select>
				<input type="text" name="keyword" autocomplete="off" class="form-inline">
				<input type="submit"  value="검색" class="form-inline">
			</form> 
		</div>
		
		<!-- 메모 등록 영역 -->
		<form action="<%=request.getContextPath() %>/admin/write.wishfit" method="post">
		<input type="text" name="memoContent" class="form-input form-inline" placeholder="메모입력" autocomplete="off">
		<input type="submit" value="등록" class="form-btn form-inline">
		</form>
	</div>
	
<jsp:include page="/template/footer.jsp"></jsp:include>
</div>

<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>