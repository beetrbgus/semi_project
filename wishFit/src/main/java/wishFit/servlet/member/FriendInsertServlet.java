package wishFit.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.member.FriendDao;
import wishFit.beans.member.FriendDto;
import wishFit.beans.member.FriendVo;
// 친구 추가 처리 ( 요청 보내려고 하는 서블릿)
@WebServlet(urlPatterns="/page/member/insert.kh")
public class FriendInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			FriendVo friendVo = new FriendVo();
			friendVo.setFriendNo(Integer.parseInt(req.getParameter("friendNo")));
			friendVo.setFriendReceiver(req.getParameter("friendId"));
			friendVo.setFriendSender(req.getParameter("friendNick"));
			friendVo.setFriendDate(req.getParameter("friendDate"));
			
			// 처리
			FriendDao friendDao = new FriendDao();
			friendDao.plus(friendVo);
			
			resp.sendRedirect("friend_list.jsp");
		} catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
