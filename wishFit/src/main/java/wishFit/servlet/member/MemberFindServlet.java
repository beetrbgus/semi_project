package wishFit.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.member.MemberDao;

@WebServlet(urlPatterns="/page/member/friendfind.kh")
public class MemberFindServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			
			String memId = req.getParameter("memId");
			if(memId == null || memId.equals("")) {
				resp.getWriter().write(-1);
			} else if(new MemberDao().registerChek(memId) == 0) {
				
			}
		}	catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
