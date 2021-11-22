<%@page import="wishFit.beans.reply.ReplyVo"%>
<%@page import="wishFit.beans.market.MarketFileDto"%>
<%@page import="wishFit.beans.market.MarketFileDao"%>
<%@page import="wishFit.beans.reply.ReplyDto"%>
<%@page import="wishFit.beans.reply.ReplyDao"%>
<%@page import="java.util.List"%>
<%@page import="wishFit.beans.market.MarketReplyDao"%>
<%@page import="wishFit.beans.board.BoardDto"%>
<%@page import="wishFit.beans.market.MarketDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/commons.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	//$(function(){
	//$(".create-btn").click(function(e){
	//	e.preventDefault();
	//});
	// 
	// var textarea = $("<textarea>").attr("name", "replyPost")

	// });
</script>
<!-- 헤더 -->
<%-- <jsp:include page="/template/header.jsp"></jsp:include>--%>

<!-- 좌측 사이드 -->
<%-- <jsp:include page="/template/leftSide.jsp"></jsp:include>--%>
<!-- 입력 -->
<%
int boardNo = Integer.parseInt(request.getParameter("boardNo"));
%>

<!-- 처리 -->

<%
// 현재 게시글에 대한 파일 정보를 조회
MarketFileDao marketFileDao = new MarketFileDao();
List<MarketFileDto> marketFileList = marketFileDao.find(boardNo);
//System.out.println(marketFileList);
%>

<%--현재 게시글에 대한 댓글 목록 조회(전체로 구현한거) --%>
<%
//글 상세보기
MarketDao marketDao = new MarketDao();
BoardDto boardDto = marketDao.get(boardNo);//단일조회
//글의 댓글 목록.
ReplyDao replyDao = new ReplyDao();
List<ReplyVo> replyList = replyDao.list(boardNo);
%>


<!--
로그인 구현 되면 나중에 생각
String memberId = (String)session.getAttribute("ses");   -->

<!-- 출력 -->
<h2 align="center"><%=boardDto.getBoardNo()%>번째 게시글
</h2>
<table border="1" align="center">
	<tbody>
		<tr>
			<td>제목</td>
			<td width="70%"><%=boardDto.getBoardTitle()%></td>
			<td>작성일자 :<%=boardDto.getBoardDate()%></td>
			<td>조회수:<%=boardDto.getBoardRead()%></td>
			<td>댓글수:<%=boardDto.getBoardReply()%></td>
		</tr>
		<tr width="400" height="400">
			<td>내용</td>
			<td colspan="4">
				<%
				if (!marketFileList.isEmpty()) {
				%> <%
 for (MarketFileDto marketFileDto : marketFileList) {
 %>

				<img src="download.kh?imageNo=<%=marketFileDto.getImageNo()%>"
				width="500" height="500"> <%
 }
 %> <%
 }
 %> <%=boardDto.getBoardPost()%>



			</td>
	</tbody>
</table>
<br>
<form action="delete.kh" method="get">
	<input type="hidden" name="boardNo" value="<%=boardDto.getBoardNo()%>">
	<input type="submit" value="삭제">
</form>
<br>
<form action="edit.jsp?boardNo=<%=boardDto.getBoardNo()%>" method="post">
	<input type="submit" value="수정">
</form>
<br>
<br>
<h3>댓글란</h3>
<table>
	<tbody>

		<%
		for (ReplyVo reply : replyList) {
		%>
		<tr>
			<td><input type="hidden" name="replyNo" value="<%=reply.getReplyNo()%>">
			<input type="hidden" name="boardNo" value="<%=boardDto.getBoardNo()%>">
			<%=reply.getMpUpload()%></td>
			<td>작성자 :<%=reply.getMemNick()%></td>
			<td>작성일 : <%=reply.getReplyDate()%></td>
			<td>내용 : <%=reply.getReplyPost()%></td>

			<td>
				
				<%--댓글 삭제 --%>
				
					<a href="reply_delete.kh?replyNo=<%=reply.getReplyNo()%>">삭제</a>
				
			</td>

			<td>
				<%--댓글 수정 --%>
			
	<input type="hidden" name="boardNo" value="<%=boardDto.getBoardNo()%>">
	 <input type="hidden" name="replyNo" value="<%=reply.getReplyNo()%>">
					<button class="create-btn"></button>
					<textarea name="replyPost" required rows="4" cols="80">
 <%=reply.getReplyPost()%>
 </textarea>
					
					<a href="reply_edit.kh?replyNo=<%=reply.getReplyNo() %>">수정</a>
					
				
			</td>
		</tr>
		<% }%>		
	</tbody>
</table>
<br>
<br>

<%-- 댓글 작성 --%>
<form action="reply_insert.kh" method="post">
	<input type="hidden" name="boardNo" value="<%=boardDto.getBoardNo()%>">
	<textarea name="replyPost" required rows="4" cols="80"></textarea>
	<input type="submit" value="댓글작성">
</form>

<br>
<br>
<h5>첨부파일정보</h5>
<!-- 첨부파일 다운 링크 -->
<%
if (!marketFileList.isEmpty()) {
%>
<%
for (MarketFileDto marketFileDto : marketFileList) {
%>
<h6>
	<%=marketFileDto.getBoardUpload()%>
	(<%=marketFileDto.getBoardSize()%>
	byte) <a href="download.kh?imageNo=<%=marketFileDto.getImageNo()%>">
		다운로드 </a> <img src="download.kh?imageNo=<%=marketFileDto.getImageNo()%>"
		width="100" height="100">
</h6>
<%
}
%>
<%
}
%>






<!-- 푸터 -->
<%-- <jsp:include page="/template/footer.jsp"></jsp:include>--%>

<!--  우측 사이드 -->
<%-- <jsp:include page="/template/rightSide.jsp"></jsp:include>--%>
