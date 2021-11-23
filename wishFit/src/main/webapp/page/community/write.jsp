<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="../css/commons.css">



<main>
<div class="container-800 container-center" > 
	
    <form action="<%=request.getContextPath()%>/board/write.kh" method="post">
    	<div class="row">
    		<input type="text" name="mem_id" value="testuser">
    	</div>
    	<div class="row">
    		<input type="text" name="board_large_type"  value="커뮤니티">
    	</div>
    	<div class="row">
    		<input type="text" name="board_middle_type" value="유머">
    	</div>
    	<div class="row">
    		<input type="text" name="board_title" placeholder="제목">
    	</div>
    	<div class="row">
    		<input type="text" name="board_post" placeholder="내용">
    	</div>
    	<div class="row">
    		<input type="file" name="attach">
    	</div>
    	<div class="row">
    		<input type="submit" value="등록" class="btn">
    	</div>
    </form>
</div>
    
    
    
<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>