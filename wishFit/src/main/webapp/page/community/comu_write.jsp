<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<jsp:include page="/template/leftSide.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="../css/commons.css">



<main>
	
    <form action="comu_write.kh"  method="post"  enctype="multipart/form-data">
<div class="container-800 container-center" > 
    	<div class="row">
    		<input type="text" name="boardWriter" value="testuser">
    	</div>
    	<div class="row">
    		<input type="text" name="boardLargeName"  value="커뮤니티">
    	</div>
    	<div class="row">
    		<input type="text" name="boardMiddleName" value="추천글">
    	</div>
    	<div class="row">
    		<input type="text" name="boardTitle" placeholder="제목">
    	</div>
    	<div class="row">
    		<input type="text" name="boardPost" placeholder="내용">
    	</div>
    	<div class="row">
    		<input type="file" name="attach">
    	</div>
    	<div class="row">
    		<input type="submit" value="등록" class="btn">
    	</div>
</div>
    </form>
    
    
    
<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>