package wishFit.servlet.message;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wishFit.beans.message.MessageDao;

@WebServlet(urlPatterns = "/msgread.kh")
public class MessageReadServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String uid = (String) session.getAttribute("uid");
		MessageDao messageDao = new MessageDao();
		try {
			messageDao.getMessageList(uid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
