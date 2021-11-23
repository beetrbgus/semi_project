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
    		<input type="text" name="board_large_type"  value="Ŀ�´�Ƽ">
    	</div>
    	<div class="row">
    		<input type="text" name="board_middle_type" value="����">
    	</div>
    	<div class="row">
    		<input type="text" name="board_title" placeholder="����">
    	</div>
    	<div class="row">
    		<input type="text" name="board_post" placeholder="����">
    	</div>
    	<div class="row">
    		<input type="file" name="attach">
    	</div>
    	<div class="row">
    		<input type="submit" value="���" class="btn">
    	</div>
    </form>
</div>
    
    
    
<jsp:include page="/template/footer.jsp"></jsp:include>
</main>
<jsp:include page="/template/rightSide.jsp"></jsp:include>
<jsp:include page="/template/bottomNav.jsp"></jsp:include>