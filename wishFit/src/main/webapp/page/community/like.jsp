<%@ page language="java" contentType="text/html; charset=UTF-8	"
	pageEncoding="UTF-8"%>
<%@ page import="wishFit.beans.member.MemberDao"%>
<%@ page import="wishFit.like.FileDao"%>
<%@ page import="wishFit.like.LikeDao"%>
<%@ page import="java.io.PrintWriter"%>
<%
	String memId = null;

	if(session.getAttribute("memId") != null) {

		memId = (String) session.getAttribute("memId");

	}

	if(memId == null) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('로그인을 해주세요.');");

		script.println("location.href = 'Login.jsp'");

		script.println("</script>");

		script.close();

		return;

	}
	request.setCharacterEncoding("UTF-8");

	String boardNo = null;
	if(request.getParameter("boardNo") != null) {
		boardNo = (String) request.getParameter("boardNo");

	}
	FileDao file = new FileDao();
	LikeDao likeDao = new LikeDao();


	int result = likeDao.like(memId, boardNo);

	if (result == 1) {

		result = file.like(boardNo);

		if (result == 1) { 

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('좋아요가 완료되었습니다.');");

			script.println("location.href='index.jsp'");

			script.println("</script>");

			script.close();

			return;

		} else {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('오류가 발생했습니다.');");

			script.println("history.back();");

			script.println("</script>");

			script.close();

			return;

		}

	} else { 
		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('이미 좋아요를 누른 글입니다.');");

		script.println("history.back();");

		script.println("</script>");

		script.close();

		return;

	}

%>