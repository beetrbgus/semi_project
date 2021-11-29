package wishFit.servlet.message;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wishFit.beans.message.MessageDao;

@WebServlet(urlPatterns = "/page/message/delete.kh")
public class MessageDeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//세션에서 아이디 가져옴.
		HttpSession session = req.getSession();
		String uid = (String) session.getAttribute("uid");
		MessageDao messageDao = new MessageDao();
		try {
			int msg_no = Integer.parseInt(req.getParameter("msgNo"));
			messageDao.deleteMessage(msg_no,uid);
			resp.sendRedirect(req.getContextPath()+"/page/message/listmsg.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}

	}
}