<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>
 

<main class="app-content app-clearfix">
<%
	//boardWriter= 세션에서 받아오기
	//String boardWriter = (String)session.getAttribute("ses");
	String boardWriter= "testmember1";
%>

<h1>기록 작성</h1>
<form action = "record_write.kh" method="post" enctype="multipart/form-data">
<input type="hidden" name="boardWriter" value="<%=boardWriter %>">
	<!-- 넘겨야 하는 목록 : 글번호,제목,내용,작성일,중분류, -->
	<table>
		<tbody>
			<tr>
				<th>글 </th>
				<td><input type="text" name="boardTitle" required></td>
			</tr>
			<tr>
				<th>분류</th>
				<td>
				<select name="boardMiddleName">
					<option>일자별</option>
					<option>소모임</option>
					<option>식단</option>
				</select></td>
			</tr>
			<tr>
				<th>글 내용</th>
				<td><textarea rows="10" cols="50" name="boardPost"></textarea>
				 
			</tr>
			<tr>
				<th>첨부</th>
				<td><input type="file" name="attach">
			</tr>
			<tr>
				<th>날짜</th>
				<td><input type="date" name="boardDate" required class="currentDate"></td>
			</tr>
			<tr>
				<td><input type="submit" value="게시글작성"></td>
				<td><a href = "my_record.jsp" ><label>취소</label></a>
			</tr>
			
		</tbody>
	</table>
	<script>
  		document.querySelector(".currentDate").value= new Date().toISOString().slice(0, 10);
	</script>
</form>



<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>
