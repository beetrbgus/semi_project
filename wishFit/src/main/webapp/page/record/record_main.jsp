<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../../template/header.jsp"></jsp:include>
<jsp:include page="../../template/leftSide.jsp"></jsp:include>

 <link rel="stylesheet" type="text/css" href="../css/commons.css">
 <script>
 	
 </script>

 <div class="container-700 container-center">
        <div class="row" >
            <label><h1 class="record-title">내기록</h1></label>
        </div>
        <div class="row" >
            <div class="" >
                <div >
                    2021.11 < >  오늘
                </div>
                <div class="row right" >
                    <a href="<%=request.getContextPath() %>/record/record_write.jsp">기록 작성</a>
                </div>
                
                <div class="row">
                    <table class="table table-border">
                        <thead class="table table-border table-thead ">
                                <tr>
                                    <th style="width:15%">날짜</th>
                                    <th style="width:15%">카테고리</th>
                                    <th style="width:70%">제목</th>
                                </tr>
                                
                        </thead>
                        
                        <tbody class="table table-tbody">
                        <%for(int i=1; i< 31; i++){ %>
                                <tr> 
                                    <td>11.<%=i%></td>
                                    <td>카테고리</td>
                                    <td>제목넣는부분</td>
                                </tr>
                                <%} %>
                                
                        </tbody>
                    </table>
                </div>

            </div>
            
        </div>

    </div>























<jsp:include page="../../template/rightSide.jsp"></jsp:include>
<jsp:include page="../../template/footer.jsp"></jsp:include>