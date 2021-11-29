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
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			FriendVo friendVo = new FriendVo();
			String friendId = req.getParameter("friendId");
			String uid= (String)req.getSession().getAttribute("uid");
			// 처리
			FriendDao friendDao = new FriendDao();
			int result = friendDao.get(uid, friendId);
			if(result ==0) {
				friendDao.plus(friendId , uid);
			}
			resp.sendRedirect(req.getContextPath()+"/page/member/friend_list.jsp");
		} catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}