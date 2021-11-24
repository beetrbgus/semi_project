package wishFit.beans.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/page/member/ajax_id_check.kh")
public class MemberAjaxIdServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String memId = req.getParameter("memId");
			
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = memberDao.get(memId);
			
			if(memberDto == null) {
				resp.getWriter().write("NNNNY");
			} else {
				resp.getWriter().write("NNNNN");
			}
		}	catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
