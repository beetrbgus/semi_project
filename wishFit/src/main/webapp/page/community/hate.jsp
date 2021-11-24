<%@ page language="java" contentType="text/html; charset=UTF-8	"
	pageEncoding="UTF-8"%>
<%@ page import="wishFit.beans.member.MemberDao"%>
<%@ page import="wishFit.like.File2Dao"%>
<%@ page import="wishFit.like.HateDao"%>
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
	File2Dao file2 = new File2Dao();
	HateDao hateDao = new HateDao();


	int result = hateDao.hate(memId, boardNo);

	if (result == 1) {

		result = file2.hate(boardNo);

		if (result == 1) { 

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('싫어요가 완료되었습니다.');");

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

		script.println("alert('이미 싫어요를 누른 글입니다.');");

		script.println("history.back();");

		script.println("</script>");

		script.close();

		return;

	}

%>