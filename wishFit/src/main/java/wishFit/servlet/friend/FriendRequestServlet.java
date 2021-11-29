package wishFit.servlet.friend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.member.FriendDao;
import wishFit.beans.member.FriendVo;

//@WebServlet(urlPatterns = "/member.kh")
public class FriendRequestServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String mid = req.getParameter("mid");
//		String uid = (String) req.getSession().getAttribute("uid");
//		FriendDao friendDao = new FriendDao();
//		FriendVo friendVo = new FriendVo();
//		friendVo.setFriendReceiver(mid);
//		friendVo.setFriendSender(uid);
//		
//		try {
//			friendDao.plus(friendVo);
//			resp.sendRedirect("/page/member/friend_list.jsp");
//		} catch (Exception e) {
//			e.printStackTrace();
//			resp.sendError(500);
//		}
		
	}
}
