<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>
 

<main class="app-content app-clearfix">

<h1>기록 작성</h1>
<form action = "record_write.kh" method="post">
	<div class="container-700 container-center">
		<div class="row">
			<label>제목</label>
			<input type = "text" name="boardTitle" required>
		</div>
		<div class="row">
			<label>분류</label>
			<select name="boardMiddleName" required>
				<option>일자별</option>
				<option>소모임</option>
				<option>식단</option>
			</select>
		</div>
		<div class="row">
			<label>내용</label>
			<textarea cols="50" rows="10" name="boardPost"></textarea>
		</div>
		<div class="row">
			<label>첨부파일</label>
			<input type="file" name="attach">
		</div>
		<div class="row">
			<input type="submit" value="게시글 등록">
		</div>
	
	</div>

</form>


<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>
