package wishFit.servlet.record;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.board.BoardDao2;

//@WebServlet(urlPatterns = "/page/record/delete.kh")
public class RecordDeleteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : boardNo
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			
			//처리
			BoardDao2 boardDao = new BoardDao2();
			boolean success = boardDao.delete(boardNo);
			
			//출력
			if(success) {
				resp.sendRedirect("record_main.jsp");
			}else {
				resp.sendError(404);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
