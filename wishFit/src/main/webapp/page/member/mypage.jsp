<%@page import="wishFit.beans.member.MemberDto"%>
<%@page import="wishFit.beans.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	String memId = (String)session.getAttribute("ses");
    
    // ó��
    	MemberDao memberDao = new MemberDao();
    	MemberDto memberDto = memberDao.get(memId);
    %>
    <!-- ��� -->
    <jsp:include page="/template/header.jsp"></jsp:include>
    <%	String root = request.getContextPath();%>
    <link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/255b6902485612c74d806c3142450a55116bc82e.signup-form.scssb2cb.css"/>
	<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/347b8967715ee8520a013ff5c985fb69086c462a.member.scss944d.css"/>
	<link rel="stylesheet"
	href="<%=root%>/resources/files/cache/assets/compiled/347b8967715ee8520a013ff5c985fb69086c462a.member-form.scss944d.css"/>
    <!-- ���� ���̵� -->
    <jsp:include page="/template/leftSide.jsp"></jsp:include> 
    
<main class="app-content app-clearfix">
      
      <div class="app-clearfix">
        <section class="app-member">
        <div class="app-member-side">
    <div class="app-member-card app-member-menu">
  <ul>
    <li class="app-active">
      <a href="<%=root%>/page/member/mypage.jsp">�� ���� ����</a>
    </li><li>
      <a href="<%=root%>/page/member/note_post.jsp">�ۼ� �Խñ� ����</a>
    </li><li>
      <a href="<%=root%>/">�ۼ� ��� ����</a>
    </li><li>
      <a href="<%=root%>/">ģ�� ���</a>
    </li><li>
      <a href="<%=root%>#">������ ����</a>
    </li> <li>
      <a href="<%=root%>/page/member/logout.kh">�α׾ƿ�</a>
    </li> 
    </ul>
</div>
</div>

<div class="app-member-content">
  <div class="app-member-card">
    <div class="app-member-card-header">
      <h1>ȸ�� ����</h1>
    </div>
  
    <div class="app-member-card-body">
        
      <ul class="app-member-info-list">
     	<table border="1" width="300">
	<tbody>
		<tr>
			<th>������ ����</th>
			<td>
				<img src="<%=request.getContextPath()%>">
			</td>
		</tr>
		<tr>
			<th width="25%">�̸�</th>
			<td><%=memberDto.getMemName()%></td>
		</tr>
		<tr>
			<th >���̵�</th>
			<td><%=memberDto.getMemId()%></td>
		</tr>
		<tr>
			<th>�г���</th>
			<td><%=memberDto.getMemNick()%></td>
		</tr>
		<tr>
			<th>�������</th>
			<td><%=memberDto.getMemBirth()%></td>
		</tr>
		<tr>
			<th>����</th>
			<td><%=memberDto.getMemGender()%></td>
		</tr>
		<tr>
			<th>���</th>
			<td><%=memberDto.getMemGrade()%></td>
		</tr>
		<tr>
			<th>��ȭ��ȣ</th>
			<td><%=memberDto.getMemPhone()%></td>
		</tr>
		<tr>
			<th>�����Ͻ�</th>
			<td><%=memberDto.getMemJoin()%></td>
		</tr>
	</tbody>
</table>
      </ul>
  
      <div class="tw-flex tw-items tw-flex-wrap">
        <a href="edit.jsp" class="app-link tw-mr-3">ȸ������ ����</a>
  
        <div class="tw-flex-1"></div>
  
        <a href="quit.jsp" class="app-link tw-text-danger">ȸ�� Ż��</a>
      </div>    </div>
  </div>  
</div>
</section>
</div>
</main>
    
    <!-- ���� ���̵�  -->
    <jsp:include page="/template/rightSide.jsp"></jsp:include>
    <!-- Ǫ�� -->
    <jsp:include page="/template/footer.jsp"></jsp:include>