package wishFit.servlet.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import wishFit.beans.reply.ReplyDao;
@WebServlet(urlPatterns = {"/page/market/reply_delete.kh","/page/community/reply_delete.kh"})
public class ReplyDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : 게시글번호, 몇번댓글
			//내가 로그인을 하면 세션이란 데에 저장을 해놓고  다시 로그인 안해도 되게 세션이란 데에서 로그인 한 정보를 가져온다. 
			HttpSession session = req.getSession();
//			String uid = (String) session.getAttribute("uid");
			String uid = "testuser";
			
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			int replyNo = Integer.parseInt(req.getParameter("replyNo"));
		
			//처리
			ReplyDao replyDao = new ReplyDao();
			boolean success = replyDao.delete(uid, replyNo);
			
			//출력
			resp.sendRedirect("detail.jsp?boardNo="+boardNo);
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
