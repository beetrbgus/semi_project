package wishFit.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.member.MemberDao;

@WebServlet(urlPatterns="/page/member/quit.kh")
public class MemberQuitServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			String memId = (String)req.getSession().getAttribute("uid");
			String memPw = req.getParameter("memPw");
			
			MemberDao memberDao = new MemberDao();
			boolean success = memberDao.quit(memId, memPw);
			
			if(success) {
				req.getSession().removeAttribute("uid");
				resp.sendRedirect("index.jsp"); //탈퇴 메시지?
			}
			else {
				resp.sendRedirect("quit.jsp?error");
			}
		}	catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
