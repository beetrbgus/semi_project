package wishFit.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.member.FRequestDao;
// 친구요청을 거절/거부하는 서블릿
@WebServlet(urlPatterns={"/memeber/friend/send_delete.kh", "/member/friend/accept_delete.kh"})
public class FriendQuitServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int friendNo = Integer.parseInt(req.getParameter("friendNo"));
			
			FRequestDao fRequestDao = new FRequestDao();
			boolean success = fRequestDao.delete(friendNo);
			
			resp.sendRedirect("friend_plus.jsp");
			resp.sendRedirect("friend_receive.jsp");
		}	catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
