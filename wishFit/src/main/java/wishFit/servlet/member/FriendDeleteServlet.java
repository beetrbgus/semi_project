package wishFit.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.member.FriendDao;
@WebServlet(urlPatterns="/member/friend/delete.kh")
public class FriendDeleteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int friendNo = Integer.parseInt(req.getParameter("friendNo"));
			
			FriendDao friendDao = new FriendDao();
			boolean success = friendDao.delete(friendNo);
			
			resp.sendRedirect("friend_list.jsp");
		}	catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
