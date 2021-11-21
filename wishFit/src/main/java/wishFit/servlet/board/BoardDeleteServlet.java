package wishFit.servlet.board;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.board.BoardDao;

@WebServlet(urlPatterns= {"/page/market/delete.kh","/page/community/delete.kh","/page/record/delete.kh"})
public class BoardDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			
			
			//처리
			BoardDao boardDao = new BoardDao();
			boolean success = boardDao.delete(boardNo);
			
			
			
			//출력
			if(success) {
				resp.sendRedirect("list.jsp");
				
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
