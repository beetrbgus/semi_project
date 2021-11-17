<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>
 

<main class="app-content app-clearfix">


<h2>게시글 수정</h2>
<form action = "record_edit.kh" method="post">
	<div class="container-700 container-center">
		<div class="row">
			<label>제목</label>
			<input type = "text" name="boardTitle" required <%--value= boardDto.getBoardNo() --%> > 
		</div>
		<div class="row">
			<label>분류</label>
			<select name="boardMiddleName" <%--value= boardDto.getBoardMiddleName() --%> >
				<option>일자별</option>
				<option>소모임</option>
				<option>식단</option>
			</select>
		</div>
		<div class="row">
			<label>내용</label>
			<textarea cols="50" rows="10" name="boardPost" <%--value= boardDto.getBoardPost() --%> ></textarea>
		</div>
		<div class="row">
			<label>첨부파일</label>
			<input type="file" name="attach"   >
		</div>
		<div class="row">
			<input type="submit" value="수정 완료">
		</div>
	
	</div>

</form>


<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>


